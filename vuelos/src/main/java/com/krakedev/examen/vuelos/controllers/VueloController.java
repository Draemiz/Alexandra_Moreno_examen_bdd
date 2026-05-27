package com.krakedev.examen.vuelos.controllers;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.services.VueloService;

@RestController
@RequestMapping("/api/vuelos")
public class VueloController {

    private final VueloService vueloService;

    public VueloController(VueloService vueloService) {
        this.vueloService = vueloService;
    }

    @PostMapping
    public ResponseEntity<?> crear(@RequestBody Vuelo vuelo) {

        try {

            Vuelo nuevoVuelo = vueloService.guardar(vuelo);

            return new ResponseEntity<>(nuevoVuelo,
                    HttpStatus.CREATED);

        } catch (Exception e) {

            return new ResponseEntity<>(
                    "Error al guardar el vuelo",
                    HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @GetMapping
    public ResponseEntity<?> listar() {

        try { List<Vuelo> vuelos = vueloService.listar();
            return new ResponseEntity<>(vuelos,
                    HttpStatus.OK);
        } catch (Exception e) {

            return new ResponseEntity<>( "Error al listar vuelos",
                    HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscarPorId(
            @PathVariable Integer id) {
    	
        try { Optional<Vuelo> vuelo = vueloService.buscarPorId(id);
            if (vuelo.isPresent()) {
                return new ResponseEntity<>( vuelo.get(),
                        HttpStatus.OK
                );
            }

            return new ResponseEntity<>( "Vuelo no encontrado",
                    HttpStatus.NOT_FOUND
            );

        } catch (Exception e) {

            return new ResponseEntity<>( "Error al buscar vuelo",
                    HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> actualizar(
            @PathVariable Integer id,
            @RequestBody Vuelo vuelo) {

        try { Vuelo vueloActualizado = vueloService.actualizar(id, vuelo);
            if (vueloActualizado != null) {
                return new ResponseEntity<>( vueloActualizado,
                        HttpStatus.OK
                );
            }

            return new ResponseEntity<>( "Vuelo no encontrado",
                    HttpStatus.NOT_FOUND
            );

        } catch (Exception e) {

            return new ResponseEntity<>( "Error al actualizar vuelo",
                    HttpStatus.BAD_REQUEST
            );
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(
            @PathVariable Integer id) {

        try { boolean eliminado = vueloService.eliminar(id);

            if (eliminado) {
                return new ResponseEntity<>( "Vuelo eliminado",
                        HttpStatus.OK
                );
            }

            return new ResponseEntity<>( "Vuelo no encontrado",
                    HttpStatus.NOT_FOUND
            );

        } catch (Exception e) {

            return new ResponseEntity<>( "Error al eliminar vuelo",
                    HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }

    @GetMapping("/precio/{precio}")
    public ResponseEntity<?> buscarPorPrecio(
            @PathVariable BigDecimal precio) {

        try { List<Vuelo> vuelos = vueloService.buscarPorPrecio(precio);
            return new ResponseEntity<>( vuelos,
                    HttpStatus.OK
            );

        } catch (Exception e) {
            return new ResponseEntity<>( "Error en la búsqueda",
                    HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }
}