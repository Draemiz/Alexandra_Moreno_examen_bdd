package com.krakedev.examen.vuelos.services;

import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.repositories.VueloRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class VueloService {

    @Autowired
    private VueloRepository vueloRepository;

    public Vuelo guardar(Vuelo vuelo) {
        return vueloRepository.save(vuelo);
    }

    public List<Vuelo> listar() {
        return vueloRepository.findAll();
    }

    public Optional<Vuelo> buscarPorId(Integer id) {
        return vueloRepository.findById(id);
    }

    public Vuelo actualizar(Integer id, Vuelo vueloActualizado) {
        Optional<Vuelo> vueloOptional = vueloRepository.findById(id);

        if (vueloOptional.isPresent()) {
            Vuelo vuelo = vueloOptional.get();

            vuelo.setCodigo(vueloActualizado.getCodigo());
            vuelo.setPrecioBoleto(vueloActualizado.getPrecioBoleto());
            vuelo.setAsientosDisponibles(vueloActualizado.getAsientosDisponibles());

            return vueloRepository.save(vuelo);
        }
        return null;
    }

    public boolean eliminar(Integer id) {
        Optional<Vuelo> vueloOptional = vueloRepository.findById(id);

        if (vueloOptional.isPresent()) {
            vueloRepository.deleteById(id);
            return true;
        }
        return false;
    }
    
    public List<Vuelo> buscarPorPrecio(BigDecimal precio) {
        return vueloRepository.findByPrecioBoletoLessThan(precio);
    }
}