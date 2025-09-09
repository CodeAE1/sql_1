-- Creación del esquema y uso del mismo
create schema biblioteca;
use biblioteca;

-- -----------------------------------------------------
-- Tabla para los autores
-- -----------------------------------------------------
create table Autores (
  id_autor int not null auto_increment,
  nombre_autor varchar(100) not null,
  apellido_autor varchar(100) not null,
  nacionalidad varchar(50) not null,
  primary key (id_autor)
);

-- -----------------------------------------------------
-- Tabla para los usuarios (lectores)
-- -----------------------------------------------------
create table Usuarios (
  id_usuario int not null auto_increment,
  nombre varchar(100) not null,
  apellido varchar(100) not null,
  direccion varchar(255) not null,
  telefono varchar(20) not null,
  correo_electronico varchar(100) not null,
  primary key (id_usuario)
);

-- -----------------------------------------------------
-- Tabla para las editoriales
-- -----------------------------------------------------
create table Editoriales (
  id_editorial int not null auto_increment,
  nombre_editorial varchar(100) not null,
  ciudad_editorial varchar(100) not null,
  primary key (id_editorial)
);

-- -----------------------------------------------------
-- Tabla para los libros
-- -----------------------------------------------------
create table Libros (
  id_libro int not null auto_increment,
  titulo varchar(255) not null,
  fecha_publicacion date not null,
  genero varchar(50) not null,
  disponibilidad boolean not null,
  primary key (id_libro)
);

-- -----------------------------------------------------
-- Tabla de unión para la relación muchos a muchos entre autores y libros
-- -----------------------------------------------------
create table Autores_Libros (
  id_autor_libro int not null auto_increment,
  id_autor int not null,
  id_libro int not null,
  primary key (id_autor_libro)
);

-- -----------------------------------------------------
-- Tabla para los préstamos de libros
-- -----------------------------------------------------
create table Prestamos (
  id_prestamo int not null auto_increment,
  fecha_prestamo date not null,
  fecha_devolucion_estimada date not null,
  fecha_devolucion_real date,
  estado_prestamo varchar(20) not null,
  primary key (id_prestamo)
);

-- -----------------------------------------------------
-- Agregar llaves foráneas y relaciones
-- -----------------------------------------------------

-- Relación de Libros con Editoriales (uno a muchos)
alter table Libros
  add column id_editorial int not null,
  add constraint fk_libros_editoriales
  foreign key (id_editorial) references Editoriales (id_editorial);

-- Relación de Autores_Libros con Autores y Libros (muchos a muchos)
alter table Autores_Libros
  add constraint fk_autores_libros_autores
  foreign key (id_autor) references Autores (id_autor);

alter table Autores_Libros
  add constraint fk_autores_libros_libros
  foreign key (id_libro) references Libros (id_libro);

-- Relación de Prestamos con Usuarios (uno a muchos)
alter table Prestamos
  add column id_usuario int not null,
  add constraint fk_prestamos_usuarios
  foreign key (id_usuario) references Usuarios (id_usuario);

-- Relación de Prestamos con Libros (uno a muchos)
alter table Prestamos
  add column id_libro int not null,
  add constraint fk_prestamos_libros
  foreign key (id_libro) references Libros (id_libro);

