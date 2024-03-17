# Dépot Git principal

Ce dépot contient toutes les descriptions, les schémas ainsi que les diagrames de conceptions lié à notre projet integrateur.
Il contient aussi la documentation du projet

[site](https://equipe500.tch099.ovh/projet6/)

    Dépot git liés:
- [API REST](https://github.com/BrianNormant/projet-integrateur-rest)
- [Application java](https://github.com/BrianNormant/projet-integrateur-java)

### Progression
#### API/Serveur
- [ ] Utilisateurs
  - [x] Connexion + création de token d'authentification
  - [ ] Déconnexion
  - [ ] Expiration des tokens
- [ ] Réseaux
  - [x] Obtention des stations sur le réseau
  - [x] Obtention des rails sur le réseau
  - [ ] Utilisation de la DB
- [ ] Trains
  - [ ] Obtention des trains en fonctionnement sur le réseau
  - [ ] Suppression des trains (Maintenance, Accidents, Arrivée à destination)
  - [ ] Obtention de l'ETA
  - [ ] Ajout de train pour un nouveau trajet (Avec vérification des réservations)
- [ ] Réservations
  - [ ] Affichage des réservations actuelles
  - [ ] Annulation
  - [ ] Ajout (En prenant en compte les itinéraires possibles selon l'état des réservations actuelles)
- [ ] Entreprises
  - Consultation du solde
  - Modification du solde

#### DB
- [ ] Opérationnel
- [ ] Administration (différents comptes avec différentes permissions)

#### Site Web
- [ ] Page de connexion
- [ ] Page de visualisation des réservations
- [ ] Page de visualisation des trains en fonctionnement
- [ ] Page de création de réservation

#### Application Java
- [ ] Page de vue générale du réseau
  - [ ] Affichage des stations sur le réseau
  - [ ] Affichage des rails reliant les stations
  - [ ] Affichage des trains en fonctionnement
