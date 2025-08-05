-- ================================================================
-- BLOQUE 1: DEFINICIÓN DE TABLAS PRINCIPALES DEL SISTEMA ERP
-- Comentarios claros explicando cada campo
-- ================================================================

-- Tabla “Users”: guarda la información de cada usuario
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,                        -- ID único de usuario
    "username" TEXT NOT NULL,                    -- Nombre para iniciar sesión
    "password" TEXT NOT NULL,                    -- Contraseña (guardada de forma segura)
    "mobileNumber" TEXT,                         -- Teléfono móvil
    "emailAddress" TEXT,                         -- Correo electrónico
    "deptId" INTEGER,                            -- ID del departamento
    "desigId" INTEGER,                           -- ID del cargo
    "roleId" INTEGER,                            -- ID del rol (ej. admin, usuario)
    "orgId" INTEGER,                             -- ID de la organización
    "companyId" INTEGER,                         -- ID de la empresa
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,-- ¿Usuario activo? (true = sí)
    "createdDate" TEXT,                          -- Fecha de creación (texto)
    "createdTime" TEXT,                          -- Hora de creación (texto)
    "createdBy" INTEGER,                         -- Quién creó este registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,  
                                                  -- Fecha/hora automáticas de creación
    "updatedDate" TEXT,                          -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                          -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                    -- Fecha/hora de última actualización
    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")   -- Clave primaria
);

-- Tabla “Test”: tabla de prueba
CREATE TABLE "Test" (
    "id" SERIAL NOT NULL,                        -- ID único
    "name" TEXT,                                 -- Nombre de prueba
    "descriptoin" TEXT,                          -- Descripción (ojo: typo en el nombre)
    CONSTRAINT "Test_pkey" PRIMARY KEY ("id")    -- Clave primaria
);

-- Tabla “AllModule”: lista de módulos disponibles
CREATE TABLE "AllModule" (
    "id" SERIAL NOT NULL,                        -- ID del módulo
    "moduleName" TEXT NOT NULL,                  -- Nombre del módulo
    "moduleDes" TEXT,                            -- Descripción breve
    "moduleLogo" TEXT,                           -- Ruta/URL del logo
    "serialNo" INTEGER,                          -- Orden en el menú
    "orgId" INTEGER,                             -- ID de la organización
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,-- ¿Módulo activo?
    "createdDate" TEXT,                          -- Fecha de creación (texto)
    "createdTime" TEXT,                          -- Hora de creación (texto)
    "createdBy" INTEGER,                         -- Quién lo creó
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                  -- Fecha/hora creación automática
    "updatedDate" TEXT,                          -- Fecha de última actualización
    "updatedTime" TEXT,                          -- Hora de última actualización
    "updatedAt" TIMESTAMP(3),                    -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                         -- Quién actualizó por última vez
    CONSTRAINT "AllModule_pkey" PRIMARY KEY ("id")-- Clave primaria
);

-- Tabla “ModuleLink”: enlaces de menú por módulo
CREATE TABLE "ModuleLink" (
    "id" SERIAL NOT NULL,                        -- ID del enlace
    "moduleId" INTEGER NOT NULL,                 -- ID del módulo asociado
    "linkeNameMenuName" TEXT NOT NULL,           -- Texto que se ve en el menú
    "menuOrSubmenuStatus" INTEGER NOT NULL,      -- 1=menú, 2=submenú
    "serialNo" INTEGER,                          -- Orden dentro del menú
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,-- ¿Enlace activo?
    "createdDate" TEXT,                          -- Fecha de creación (texto)
    "createdTime" TEXT,                          -- Hora de creación (texto)
    "createdBy" INTEGER,                         -- Quién creó este enlace
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                  -- Fecha/hora creación automática
    "updatedDate" TEXT,                          -- Fecha de última actualización
    "updatedTime" TEXT,                          -- Hora de última actualización
    "updatedAt" TIMESTAMP(3),                    -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                         -- Quién actualizó por última vez
    CONSTRAINT "ModuleLink_pkey" PRIMARY KEY ("id")-- Clave primaria
);

-- Tabla “ModuleLinkAssign”: permisos de usuarios sobre enlaces
CREATE TABLE "ModuleLinkAssign" (
    "id" SERIAL NOT NULL,                        -- ID del permiso
    "moduleId" INTEGER NOT NULL,                 -- ID del módulo
    "moduleLinkId" INTEGER NOT NULL,             -- ID del enlace
    "userLabel" INTEGER NOT NULL,                -- ID del usuario
    "permissionStatus" BOOLEAN NOT NULL,         -- true=puede acceder, false=no
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,-- ¿Permiso activo?
    "createdDate" TEXT,                          -- Fecha de creación (texto)
    "createdTime" TEXT,                          -- Hora de creación (texto)
    "createdBy" INTEGER,                         -- Quién creó este permiso
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                  -- Fecha/hora creación automática
    "updatedDate" TEXT,                          -- Fecha de última actualización
    "updatedTime" TEXT,                          -- Hora de última actualización
    "updatedAt" TIMESTAMP(3),                    -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                         -- Quién actualizó por última vez
    CONSTRAINT "ModuleLinkAssign_pkey" PRIMARY KEY ("id")-- Clave primaria
);

-- Tabla “EmployeeInfo”: datos de empleados
CREATE TABLE "EmployeeInfo" (
    "id" SERIAL NOT NULL,                        -- ID del empleado
    "firstName" TEXT,                            -- Nombre
    "middleName" TEXT NOT NULL,                  -- Segundo nombre
    "lastName" TEXT NOT NULL,                    -- Apellido
    "fullName" TEXT NOT NULL,                    -- Nombre completo
    "phone" TEXT,                                -- Teléfono fijo
    "mobileOne" TEXT,                            -- Celular principal
    "mobileTwo" TEXT,                            -- Celular secundario
    "emergencyMobile" TEXT,                      -- Teléfono de emergencia
    "officeEmail" TEXT,                          -- Correo laboral
    "personalEmail" TEXT,                        -- Correo personal
    "empImage" TEXT,                             -- Foto del empleado (URL)
    "empSignature" TEXT,                         -- Firma digital (URL)
    "nationalId" INTEGER,                        -- Documento nacional
    "departmentId" INTEGER,                      -- Departamento
    "designationId" INTEGER,                     -- Cargo
    "empType" INTEGER,                           -- Tipo de empleado (ej. planta)
    "leaveApplicableStatus" BOOLEAN,             -- ¿Aplica licencias?
    "dateOfBirts" TEXT,                          -- Fecha de nacimiento (texto)
    "genderId" INTEGER,                          -- Género (ID de tabla)
    "religionId" INTEGER,                        -- Religión (ID de tabla)
    "bloodGroupId" INTEGER,                      -- Grupo sanguíneo (ID de tabla)
    "maritialStatus" BOOLEAN,                    -- Estado civil (true=casado)
    "spousName" TEXT,                            -- Nombre del cónyuge
    "spouseProfe" INTEGER,                       -- Profesión del cónyuge (ID)
    "fatherOrHusbandName" TEXT,                  -- Nombre del padre/tutor
    "fatherOrHusbandProfe" INTEGER,              -- Profesión del padre/tutor (ID)
    "fatherOrHusbandMobile" TEXT,                -- Teléfono del padre/tutor
    "motherName" TEXT,                           -- Nombre de la madre
    "motherProfe" INTEGER,                       -- Profesión de la madre (ID)
    "motherMobile" TEXT,                         -- Teléfono de la madre
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,-- ¿Empleado activo?
    "createdDate" TEXT,                          -- Fecha de creación (texto)
    "createdTime" TEXT,                          -- Hora de creación (texto)
    "createdBy" INTEGER,                         -- Quién registró el empleado
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                  -- Fecha/hora creación automática
    "updatedDate" TEXT,                          -- Fecha de última actualización
    "updatedTime" TEXT,                          -- Hora de última actualización
    "updatedAt" TIMESTAMP(3),                    -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                         -- Quién actualizó por última vez
    CONSTRAINT "EmployeeInfo_pkey" PRIMARY KEY ("id")-- Clave primaria
);
-- ================================================================
-- BLOQUE 2: TABLAS DE CATÁLOGOS Y SOLICITUDES DE LICENCIA
-- Comentarios claros explicando cada campo
-- ================================================================

-- Tabla “EmployeeType”: define los tipos de empleados (por ejemplo, planta o contratista)
CREATE TABLE "EmployeeType" (
    "id" SERIAL NOT NULL,                          -- ID único de este tipo de empleado
    "empTypeName" TEXT NOT NULL,                   -- Nombre del tipo (ej. “Planta”)
    "empTypeDes" TEXT,                             -- Descripción adicional (opcional)
    "orgId" INTEGER,                               -- ID de la organización a la que pertenece
    "serialNo" INTEGER,                            -- Orden de presentación en menús o listas
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Está activo este tipo? (true = sí)
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Usuario que creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha y hora automáticas de creación
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha y hora de última actualización
    "updatedBy" INTEGER,                           -- Usuario que actualizó por última vez
    CONSTRAINT "EmployeeType_pkey" PRIMARY KEY ("id") -- Define “id” como clave primaria
);

-- Tabla “Department”: almacena los departamentos de la empresa
CREATE TABLE "Department" (
    "id" SERIAL NOT NULL,                          -- ID único del departamento
    "departmentName" TEXT NOT NULL,                -- Nombre del departamento
    "departmentDes" TEXT,                          -- Descripción breve (opcional)
    "orgId" INTEGER,                               -- ID de la organización
    "serialNo" INTEGER,                            -- Orden de presentación
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Departamento activo?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "Department_pkey" PRIMARY KEY ("id") -- Clave primaria
);

-- Tabla “Gender”: opciones de género
CREATE TABLE "Gender" (
    "id" SERIAL NOT NULL,                          -- ID único del género
    "genderName" TEXT NOT NULL,                    -- Nombre del género (ej. “Masculino”)
    "genderDes" TEXT,                              -- Descripción opcional
    "orgId" INTEGER,                               -- ID de la organización
    "serialNo" INTEGER,                            -- Orden de presentación
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Género activo?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "Gender_pkey" PRIMARY KEY ("id")     -- Clave primaria
);

-- Tabla “Religion”: lista de religiones
CREATE TABLE "Religion" (
    "id" SERIAL NOT NULL,                          -- ID único de la religión
    "religionName" TEXT NOT NULL,                  -- Nombre (ej. “Católica”)
    "religionDes" TEXT,                            -- Descripción opcional
    "orgId" INTEGER,                               -- ID de la organización
    "serialNo" INTEGER,                            -- Orden de presentación
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Religión activa?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "Religion_pkey" PRIMARY KEY ("id")   -- Clave primaria
);

-- Tabla “Bloodgroup”: grupos sanguíneos
CREATE TABLE "Bloodgroup" (
    "id" SERIAL NOT NULL,                          -- ID único del grupo sanguíneo
    "bloodGroupName" TEXT NOT NULL,                -- Nombre (ej. “A+”)
    "bloodGroupDes" TEXT,                          -- Descripción opcional
    "orgId" INTEGER,                               -- ID de la organización
    "serialNo" INTEGER,                            -- Orden de presentación
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Grupo activo?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "Bloodgroup_pkey" PRIMARY KEY ("id")-- Clave primaria
);

-- Tabla “Division”: divisiones administrativas (ej. provincias)
CREATE TABLE "Division" (
    "id" SERIAL NOT NULL,                          -- ID único de la división
    "divisionName" TEXT NOT NULL,                  -- Nombre (ej. “Buenos Aires”)
    "divisionDes" TEXT,                            -- Descripción opcional
    "orgId" INTEGER,                               -- ID de la organización
    "serialNo" INTEGER,                            -- Orden de presentación
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿División activa?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "Division_pkey" PRIMARY KEY ("id")   -- Clave primaria
);

-- Tabla “District”: distritos dentro de una división
CREATE TABLE "District" (
    "id" SERIAL NOT NULL,                          -- ID único del distrito
    "districtName" TEXT NOT NULL,                  -- Nombre (ej. “La Plata”)
    "districtDes" TEXT,                            -- Descripción opcional
    "orgId" INTEGER,                               -- ID de la organización
    "serialNo" INTEGER,                            -- Orden de presentación
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Distrito activo?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "District_pkey" PRIMARY KEY ("id")   -- Clave primaria
);

-- Tabla “Thana”: subdistritos (de uso interno)
CREATE TABLE "Thana" (
    "id" SERIAL NOT NULL,                          -- ID único de la subárea
    "thanaName" TEXT NOT NULL,                     -- Nombre de la subárea
    "thanaDes" TEXT,                               -- Descripción opcional
    "orgId" INTEGER,                               -- ID de la organización
    "serialNo" INTEGER,                            -- Orden de presentación
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Subárea activa?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "Thana_pkey" PRIMARY KEY ("id")     -- Clave primaria
);

-- Tabla “Designation”: cargos o puestos de trabajo
CREATE TABLE "Designation" (
    "id" SERIAL NOT NULL,                          -- ID único del cargo
    "designationName" TEXT NOT NULL,               -- Nombre del cargo (ej. “Gerente”)
    "designationDes" TEXT,                         -- Descripción opcional
    "orgId" INTEGER,                               -- ID de la organización
    "serialNo" INTEGER,                            -- Orden de presentación
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Cargo activo?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "Designation_pkey" PRIMARY KEY ("id")-- Clave primaria
);

-- Tabla “LeaveParent”: solicitudes de licencia de empleados
CREATE TABLE "LeaveParent" (
    "id" SERIAL NOT NULL,                          -- ID único de la solicitud
    "empId" INTEGER,                               -- ID del empleado que solicita
    "leaveStatus" INTEGER,                         -- Estado (ej. 1=pendiente, 2=aprobado)
    "leaveReasons" TEXT,                           -- Motivo de la licencia
    "leaveDes" TEXT,                               -- Descripción detallada
    "attachments" TEXT,                            -- Rutas/URLs de archivos adjuntos
    "leaveLocation" TEXT,                          -- Lugar donde estará el empleado
    "emergencyContact" TEXT,                       -- Teléfono de contacto de emergencia
    "leaveFromDate" DATE,                          -- Fecha de inicio de la licencia
    "leaveToDate" DATE,                            -- Fecha de fin de la licencia
    "orgId" INTEGER,                               -- ID de la organización
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  -- ¿Solicitud activa?
    "createdDate" TEXT,                            -- Fecha de creación (texto)
    "createdTime" TEXT,                            -- Hora de creación (texto)
    "createdBy" INTEGER,                           -- Quién creó la solicitud
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                   -- Fecha/hora creación automática
    "updatedDate" TEXT,                            -- Fecha de última actualización (texto)
    "updatedTime" TEXT,                            -- Hora de última actualización (texto)
    "updatedAt" TIMESTAMP(3),                      -- Fecha/hora de última actualización
    "updatedBy" INTEGER,                           -- Quién actualizó por última vez
    CONSTRAINT "LeaveParent_pkey" PRIMARY KEY ("id")-- Clave primaria
);

-- --------------------------------------------------
-- Revisión de seguridad: este bloque solo crea tablas
-- de datos de referencia y solicitudes de licencia.
-- No se detecta código malicioso.
-- --------------------------------------------------

-- ================================================================
-- BLOQUE 3: LICENCIAS, MOVIMIENTOS, ASISTENCIA Y GESTIÓN DE INVENTARIO
-- Comentarios claros explicando cada campo
-- ================================================================

-- Tabla "LeaveChild": detalles por día de una licencia
CREATE TABLE "LeaveChild" (
    "id" SERIAL NOT NULL,                        -- ID único del detalle
    "leaveId" INTEGER,                           -- ID de la solicitud de licencia (relación con LeaveParent)
    "leaveDate" DATE,                            -- Fecha de la licencia
    "leaveFromTime" TEXT,                        -- Hora de inicio
    "leaveToTime" TEXT,                          -- Hora de fin
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,-- ¿Registro activo?
    "createdDate" TEXT,                          -- Fecha de creación (texto)
    "createdTime" TEXT,                          -- Hora de creación (texto)
    "createdBy" INTEGER,                         -- Usuario que creó el registro
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación
    "updatedDate" TEXT,                          -- Última fecha de actualización
    "updatedTime" TEXT,                          -- Última hora de actualización
    "updatedAt" TIMESTAMP(3),                    -- Fecha y hora exacta de actualización
    "updatedBy" INTEGER,                         -- Usuario que actualizó
    CONSTRAINT "LeaveChild_pkey" PRIMARY KEY ("id")
);

-- Tabla "Movement": seguimiento de movimientos del empleado (fuera de oficina)
CREATE TABLE "Movement" (
    "id" SERIAL NOT NULL,                        -- ID único del movimiento
    "empId" INTEGER,                             -- ID del empleado
    "clientId" INTEGER,                          -- ID del cliente (si aplica)
    "projectId" INTEGER,                         -- ID del proyecto
    "movementStatus" INTEGER,                    -- Estado del movimiento (ej. aprobado, en curso)
    "movementReasons" TEXT,                      -- Motivo del movimiento
    "movementDes" TEXT,                          -- Descripción del movimiento
    "movementFromDate" TEXT,                     -- Fecha de inicio
    "movementToDate" TEXT,                       -- Fecha de fin
    "movementFromTime" TEXT,                     -- Hora de salida
    "movementToTime" TEXT,                       -- Hora de regreso
    "emergencyContact" TEXT,                     -- Teléfono de emergencia
    "orgId" INTEGER,                             -- ID de la organización
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,
    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    CONSTRAINT "Movement_pkey" PRIMARY KEY ("id")
);

-- Tabla "Attendance": registros de asistencia
CREATE TABLE "Attendance" (
    "id" SERIAL NOT NULL,                        -- ID único del registro
    "empId" INTEGER,                             -- ID del empleado
    "attendanceDate" TEXT,                       -- Fecha de la asistencia
    "logInTime" TEXT,                            -- Hora de ingreso
    "logOutTime" TEXT,                           -- Hora de salida
    "biometricId" INTEGER,                       -- ID del lector biométrico
    "machineId" INTEGER,                         -- ID del dispositivo de control
    "shiftId" INTEGER,                           -- ID del turno de trabajo
    "orgId" INTEGER,                             -- ID de la organización
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,
    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    CONSTRAINT "Attendance_pkey" PRIMARY KEY ("id")
);

-- Tabla "Holidays": feriados y días no laborables
CREATE TABLE "Holidays" (
    "id" SERIAL NOT NULL,                        -- ID del feriado
    "holidayTitle" TEXT,                         -- Nombre del feriado
    "hlidayDescription" TEXT,                    -- Descripción (ojo: error de escritura en "hliday")
    "date" TEXT,                                 -- Fecha del feriado
    "orgId" INTEGER,                             -- ID de la organización
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,
    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    CONSTRAINT "Holidays_pkey" PRIMARY KEY ("id")
);

-- Tabla "Country": países disponibles para seleccionar
CREATE TABLE "Country" (
    "id" SERIAL NOT NULL,                        -- ID del país
    "countryName" TEXT,                          -- Nombre del país
    "countryDescription" TEXT,                   -- Descripción opcional
    "countryCode" INTEGER,                       -- Código del país (ej. 54 para Argentina)
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,
    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- Tabla "InvSupplier": proveedores del sistema de inventario
CREATE TABLE "InvSupplier" (
    "id" SERIAL NOT NULL,                        -- ID del proveedor
    "supplierName" TEXT,                         -- Nombre del proveedor
    "supplierDescription" TEXT,                  -- Descripción adicional
    "countryId" INTEGER,                         -- País del proveedor
    "orgId" INTEGER,                             -- Organización relacionada
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,
    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    CONSTRAINT "InvSupplier_pkey" PRIMARY KEY ("id")
);

-- Tabla "InvItemsGroup": agrupaciones de productos
CREATE TABLE "InvItemsGroup" (
    "id" SERIAL NOT NULL,                        -- ID del grupo de ítems
    "udId" INTEGER,                              -- ¿ID del usuario creador? (requiere ver contexto)
    "groupName" TEXT,                            -- Nombre del grupo (ej. “Herramientas”)
    "groupDescription" TEXT,                     -- Descripción del grupo
    "remarks" TEXT,                              -- Comentarios adicionales
    "orgId" INTEGER,
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,
    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    CONSTRAINT "InvItemsGroup_pkey" PRIMARY KEY ("id")
);

-- Tabla "Measurement": unidades de medida (ej. litros, kilogramos)
CREATE TABLE "Measurement" (
    "id" SERIAL NOT NULL,                        -- ID de la unidad
    "measurementName" TEXT NOT NULL,             -- Nombre (ej. “Litros”)
    "measurementDescription" TEXT,               -- Descripción (opcional)
    "remarks" TEXT,                              -- Comentarios adicionales
    "orgId" INTEGER,
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,
    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    CONSTRAINT "Measurement_pkey" PRIMARY KEY ("id")
);

-- Tabla "InvItemSetup": configuración completa de un ítem de inventario
CREATE TABLE "InvItemSetup" (
    "id" SERIAL NOT NULL,                        -- ID del ítem
    "udId" INTEGER,                              -- Usuario que registró el ítem
    "itemCode" TEXT,                             -- Código único del ítem
    "modelNo" TEXT,                              -- Número de modelo (si aplica)
    "itemGroupId" INTEGER,                       -- ID del grupo al que pertenece
    "itemName" TEXT NOT NULL,                    -- Nombre del producto
    "itemDescription" TEXT,                      -- Descripción del ítem
    "measurementtId" INTEGER,                    -- ID de unidad de medida (nota: typo en “measurementtId”)
    "costPrice" DOUBLE PRECISION,                -- Precio de compra
    "salePrice" DOUBLE PRECISION,                -- Precio de venta
    "manufactureDate" TIMESTAMP(3),              -- Fecha de fabricación
    "expireDate" TIMESTAMP(3),                   -- Fecha de vencimiento
    "taxRate" DOUBLE PRECISION,                  -- Porcentaje de impuesto aplicado
    "reorderLabel" INTEGER,                      -- Punto de reposición automática
    "supplierId" INTEGER,                        -- ID del proveedor
    "itemImage" TEXT,                            -- Imagen del producto
    "remarks" TEXT,                              -- Comentarios adicionales
    "orgId" INTEGER,
    "activeStatus" BOOLEAN NOT NULL DEFAULT true,
    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    CONSTRAINT "InvItemSetup_pkey" PRIMARY KEY ("id")
);
-- ================================================================
-- BLOQUE 4 (PARTE 1): SOLICITUDES Y APROBACIONES DE REQUISICIONES
-- Comentarios claros y completos, revisando posibles riesgos
-- ================================================================

-- Tabla “RequisitionParent”: cabecera de cada solicitud de materiales o recursos
CREATE TABLE "RequisitionParent" (
    "id" SERIAL NOT NULL,                          
    -- ID único autoincremental de la solicitud

    "requisitionNo" TEXT NOT NULL,                 
    -- Número identificador de la solicitud (por ejemplo “REQ-2025-001”)

    "requisitionType" INTEGER,                     
    -- Tipo de solicitud (podría referirse a compra, traslado interno, etc.)

    "requisitionFrom" INTEGER,                     
    -- ID del usuario o departamento que origina la solicitud

    "requisitionTo" INTEGER,                       
    -- ID del usuario o departamento destinatario

    "itemGroupId" INTEGER,                         
    -- ID del grupo de ítem (por ejemplo: papelería, informática)

    "itemId" INTEGER,                              
    -- ID del ítem concreto solicitado

    "requisitionDate" TIMESTAMP(3) NOT NULL,       
    -- Fecha y hora en que se creó la solicitud

    "requisitionStatus" INTEGER NOT NULL DEFAULT 0,
    -- Estado de la solicitud (0 = pendiente, 1 = aprobada, 2 = rechazada, etc.)

    "requisitionRemarks" TEXT NOT NULL,            
    -- Comentarios adicionales del solicitante

    "requisitionAppCanRemarks" TEXT NOT NULL,      
    -- Comentarios realizados al aprobar o cancelar (vacío hasta entonces)

    "requisitionBy" INTEGER,                       
    -- ID del usuario que hizo la solicitud

    "orgId" INTEGER,                               
    -- ID de la organización o sucursal

    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  
    -- Indica si la solicitud está activa (true = activa)

    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    -- Campos opcionales para auditoría: fecha/hora/texto y usuario creador

    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Fecha/hora automática de creación en formato timestamp

    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    -- Campos para registrar la última modificación

    CONSTRAINT "RequisitionParent_pkey" PRIMARY KEY ("id")
    -- Clave primaria sobre “id”
);

-- Tabla “RequisitionChild”: detalle de cada línea de la solicitud
CREATE TABLE "RequisitionChild" (
    "id" SERIAL NOT NULL,                          
    -- ID único autoincremental de la línea

    "requisitionId" INTEGER,                       
    -- Referencia a la tabla RequisitionParent (ID de la solicitud)

    "itemGroupId" INTEGER,                         
    -- ID del grupo de ítem

    "itemId" INTEGER,                              
    -- ID del ítem concreto

    "uomId" INTEGER,                               
    -- Unidad de medida (por ejemplo, 1=unidad, 2=litro)

    "qty" INTEGER NOT NULL,                        
    -- Cantidad solicitada

    "price" INTEGER,                               
    -- Precio estimado (opcional)

    "orgId" INTEGER,                               
    -- Organización asociada

    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  
    -- Si la línea sigue activa

    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    -- Auditoría de creación y modificación

    CONSTRAINT "RequisitionChild_pkey" PRIMARY KEY ("id")
    -- Clave primaria sobre “id”
);

-- Tabla “RequisitionApproveParent”: registro de la aprobación de solicitudes
CREATE TABLE "RequisitionApproveParent" (
    "id" SERIAL NOT NULL,                          
    -- ID único de la aprobación

    "requisitionNo" TEXT NOT NULL,                 
    -- Número de solicitud que se aprueba (para fácil consulta)

    "requisitionType" INTEGER,                     
    -- Mismo tipo que en RequisitionParent

    "requisitionFrom" INTEGER,                     
    -- Mismo campo “desde” que en RequisitionParent

    "requisitionTo" INTEGER,                       
    -- Mismo campo “hacia” que en RequisitionParent

    "itemGroupId" INTEGER,                         
    -- Grupo de ítem principal

    "itemId" INTEGER,                              
    -- Ítem principal de la aprobación

    "requisitionDate" TIMESTAMP(3) NOT NULL,       
    -- Fecha en que se aprobó la solicitud

    "requisitionStatus" INTEGER NOT NULL DEFAULT 0,
    -- Estado final (por ejemplo 1 = aprobado, 2 = rechazado)

    "requisitionRemarks" TEXT NOT NULL,            
    -- Comentarios del aprobador

    "requisitionBy" INTEGER,                       
    -- Usuario que realizó la aprobación

    "orgId" INTEGER,                               
    -- Organización

    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  
    -- Si este registro de aprobación sigue activo

    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    -- Auditoría completa

    CONSTRAINT "RequisitionApproveParent_pkey" PRIMARY KEY ("id")
    -- Clave primaria sobre “id”
);

-- Tabla “RequisitionApproveChild”: detalle específico de la aprobación
CREATE TABLE "RequisitionApproveChild" (
    "id" SERIAL NOT NULL,                          
    -- ID único de la línea de aprobación

    "requisitionApproveId" INTEGER,                
    -- Referencia a RequisitionApproveParent

    "requisitionId" INTEGER,                       
    -- Referencia a la solicitud original

    "itemGroupId" INTEGER,                         
    -- Grupo del ítem aprobado

    "itemId" INTEGER,                              
    -- Ítem aprobado

    "uomId" INTEGER,                               
    -- Unidad de medida aprobada

    "approvedQty" INTEGER,                         
    -- Cantidad que efectivamente se aprobó

    "receivedQty" INTEGER,                         
    -- Cantidad que se ha recibido hasta ahora

    "price" INTEGER,                               
    -- Precio final acordado o registrado

    "orgId" INTEGER,                               
    -- Organización

    "activeStatus" BOOLEAN NOT NULL DEFAULT true,  
    -- Si esta línea sigue activa

    "createdDate" TEXT,
    "createdTime" TEXT,
    "createdBy" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDate" TEXT,
    "updatedTime" TEXT,
    "updatedAt" TIMESTAMP(3),
    "updatedBy" INTEGER,
    -- Auditoría de creación y modificación

    CONSTRAINT "RequisitionApproveChild_pkey" PRIMARY KEY ("id")
    -- Clave primaria sobre “id”
);

-- --------------------------------------------------
-- ?? Revisión de seguridad
-- - Son solo sentencias de creación de tablas y claves primarias.
-- - No se detecta ningún `EXECUTE`, `FUNCTION` ni código extraño que pueda ser malicioso.
-- - Las tablas validan integridad interna, pero será importante agregar luego claves foráneas para asegurar relaciones entre ellas.
-- --------------------------------------------------
-- ================================================================
-- BLOQUE 4 (PARTE 2): ÍNDICES Y CLAVES FORÁNEAS
-- Comentarios claros y revisión de seguridad
-- ================================================================

-- Evita duplicados de usuarios: cada nombre de usuario debe ser único
CREATE UNIQUE INDEX "Users_username_key"
    ON "Users"("username");

-- ================================================================
-- Relaciones de "EmployeeInfo" con tablas de referencia
-- ================================================================

-- Cada empleado puede pertenecer a un departamento existente.
-- Si el departamento se borra, queda en NULL; si se cambia, se actualiza aquí.
ALTER TABLE "EmployeeInfo"
  ADD CONSTRAINT "EmployeeInfo_departmentId_fkey"
    FOREIGN KEY ("departmentId")
    REFERENCES "Department"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Cada empleado tiene un cargo (designation). Similar manejo de borrado/actualización.
ALTER TABLE "EmployeeInfo"
  ADD CONSTRAINT "EmployeeInfo_designationId_fkey"
    FOREIGN KEY ("designationId")
    REFERENCES "Designation"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Cada empleado tiene un tipo (planta, contratista, etc.).
ALTER TABLE "EmployeeInfo"
  ADD CONSTRAINT "EmployeeInfo_empType_fkey"
    FOREIGN KEY ("empType")
    REFERENCES "EmployeeType"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Cada empleado está asociado a un género de la lista de géneros.
ALTER TABLE "EmployeeInfo"
  ADD CONSTRAINT "EmployeeInfo_genderId_fkey"
    FOREIGN KEY ("genderId")
    REFERENCES "Gender"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Cada empleado puede tener una religión registrada.
ALTER TABLE "EmployeeInfo"
  ADD CONSTRAINT "EmployeeInfo_religionId_fkey"
    FOREIGN KEY ("religionId")
    REFERENCES "Religion"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Cada empleado puede registrar su grupo sanguíneo.
ALTER TABLE "EmployeeInfo"
  ADD CONSTRAINT "EmployeeInfo_bloodGroupId_fkey"
    FOREIGN KEY ("bloodGroupId")
    REFERENCES "Bloodgroup"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- ================================================================
-- Relaciones de direcciones actuales (EmployeePresentAddress)
-- ================================================================

-- Asocia cada dirección actual a un empleado; si el empleado se borra, se deja en NULL.
ALTER TABLE "EmployeePresentAddress"
  ADD CONSTRAINT "EmployeePresentAddress_empId_fkey"
    FOREIGN KEY ("empId")
    REFERENCES "EmployeeInfo"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Asocia la división (provincia/estado) de la dirección actual.
ALTER TABLE "EmployeePresentAddress"
  ADD CONSTRAINT "EmployeePresentAddress_presentDiviId_fkey"
    FOREIGN KEY ("presentDiviId")
    REFERENCES "Division"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Asocia el distrito de la dirección actual.
ALTER TABLE "EmployeePresentAddress"
  ADD CONSTRAINT "EmployeePresentAddress_presentDistId_fkey"
    FOREIGN KEY ("presentDistId")
    REFERENCES "District"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Asocia la comisaría o PS de la dirección actual.
ALTER TABLE "EmployeePresentAddress"
  ADD CONSTRAINT "EmployeePresentAddress_presentPSId_fkey"
    FOREIGN KEY ("presentPSId")
    REFERENCES "Thana"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- ================================================================
-- Relaciones de direcciones permanentes (EmployeePermanentAddress)
-- ================================================================

-- Igual que la dirección actual, pero para la dirección permanente.
ALTER TABLE "EmployeePermanentAddress"
  ADD CONSTRAINT "EmployeePermanentAddress_empId_fkey"
    FOREIGN KEY ("empId")
    REFERENCES "EmployeeInfo"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- División de la dirección permanente.
ALTER TABLE "EmployeePermanentAddress"
  ADD CONSTRAINT "EmployeePermanentAddress_perDiviId_fkey"
    FOREIGN KEY ("perDiviId")
    REFERENCES "Division"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Distrito de la dirección permanente.
ALTER TABLE "EmployeePermanentAddress"
  ADD CONSTRAINT "EmployeePermanentAddress_pertDisId_fkey"
    FOREIGN KEY ("pertDisId")
    REFERENCES "District"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Comisaría o PS de la dirección permanente.
ALTER TABLE "EmployeePermanentAddress"
  ADD CONSTRAINT "EmployeePermanentAddress_pertPSId_fkey"
    FOREIGN KEY ("pertPSId")
    REFERENCES "Thana"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- ================================================================
-- Relaciones adicionales de datos de empleados y ausencias
-- ================================================================

-- Educación del empleado
ALTER TABLE "EmployeeEdu"
  ADD CONSTRAINT "EmployeeEdu_empId_fkey"
    FOREIGN KEY ("empId")
    REFERENCES "EmployeeInfo"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Solicitudes de licencia (LeaveParent)
ALTER TABLE "LeaveParent"
  ADD CONSTRAINT "LeaveParent_empId_fkey"
    FOREIGN KEY ("empId")
    REFERENCES "EmployeeInfo"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Detalle de licencias (LeaveChild)
ALTER TABLE "LeaveChild"
  ADD CONSTRAINT "LeaveChild_leaveId_fkey"
    FOREIGN KEY ("leaveId")
    REFERENCES "LeaveParent"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Movimientos fuera de oficina
ALTER TABLE "Movement"
  ADD CONSTRAINT "Movement_empId_fkey"
    FOREIGN KEY ("empId")
    REFERENCES "EmployeeInfo"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Registro de asistencia
ALTER TABLE "Attendance"
  ADD CONSTRAINT "Attendance_empId_fkey"
    FOREIGN KEY ("empId")
    REFERENCES "EmployeeInfo"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- ================================================================
-- Relaciones de inventario
-- ================================================================

-- Proveedor vinculado a un país
ALTER TABLE "InvSupplier"
  ADD CONSTRAINT "InvSupplier_countryId_fkey"
    FOREIGN KEY ("countryId")
    REFERENCES "Country"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Ítem de inventario vinculado a su grupo
ALTER TABLE "InvItemSetup"
  ADD CONSTRAINT "InvItemSetup_itemGroupId_fkey"
    FOREIGN KEY ("itemGroupId")
    REFERENCES "InvItemsGroup"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Ítem de inventario vinculado a su unidad de medida
ALTER TABLE "InvItemSetup"
  ADD CONSTRAINT "InvItemSetup_measurementtId_fkey"
    FOREIGN KEY ("measurementtId")
    REFERENCES "Measurement"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Ítem de inventario vinculado a su proveedor
ALTER TABLE "InvItemSetup"
  ADD CONSTRAINT "InvItemSetup_supplierId_fkey"
    FOREIGN KEY ("supplierId")
    REFERENCES "InvSupplier"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- ================================================================
-- Relaciones de requisiciones (hijas)
-- ================================================================

-- Requisición hija vinculada a solicitud padre
ALTER TABLE "RequisitionChild"
  ADD CONSTRAINT "RequisitionChild_requisitionId_fkey"
    FOREIGN KEY ("requisitionId")
    REFERENCES "RequisitionParent"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Requisición hija vinculada a grupo de ítem
ALTER TABLE "RequisitionChild"
  ADD CONSTRAINT "RequisitionChild_itemGroupId_fkey"
    FOREIGN KEY ("itemGroupId")
    REFERENCES "InvItemsGroup"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Requisición hija vinculada a ítem
ALTER TABLE "RequisitionChild"
  ADD CONSTRAINT "RequisitionChild_itemId_fkey"
    FOREIGN KEY ("itemId")
    REFERENCES "InvItemSetup"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Requisición hija vinculada a unidad de medida
ALTER TABLE "RequisitionChild"
  ADD CONSTRAINT "RequisitionChild_uomId_fkey"
    FOREIGN KEY ("uomId")
    REFERENCES "Measurement"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- ================================================================
-- Relaciones de aprobaciones de requisiciones (hijas)
-- ================================================================

-- Aprobación hija vinculada a cabecera de aprobación
ALTER TABLE "RequisitionApproveChild"
  ADD CONSTRAINT "RequisitionApproveChild_requisitionApproveId_fkey"
    FOREIGN KEY ("requisitionApproveId")
    REFERENCES "RequisitionApproveParent"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Aprobación hija vinculada a solicitud original
ALTER TABLE "RequisitionApproveChild"
  ADD CONSTRAINT "RequisitionApproveChild_requisitionId_fkey"
    FOREIGN KEY ("requisitionId")
    REFERENCES "RequisitionParent"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Aprobación hija vinculada a grupo de ítem
ALTER TABLE "RequisitionApproveChild"
  ADD CONSTRAINT "RequisitionApproveChild_itemGroupId_fkey"
    FOREIGN KEY ("itemGroupId")
    REFERENCES "InvItemsGroup"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Aprobación hija vinculada a ítem
ALTER TABLE "RequisitionApproveChild"
  ADD CONSTRAINT "RequisitionApproveChild_itemId_fkey"
    FOREIGN KEY ("itemId")
    REFERENCES "InvItemSetup"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Aprobación hija vinculada a unidad de medida
ALTER TABLE "RequisitionApproveChild"
  ADD CONSTRAINT "RequisitionApproveChild_uomId_fkey"
    FOREIGN KEY ("uomId")
    REFERENCES "Measurement"("id")
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- --------------------------------------------------
-- ?? Revisión de seguridad
-- - Solo se crean índices y se establecen relaciones: no hay funciones, triggers ni comandos de ejecución dinámica.
-- - Ninguna instrucción ALTER_TABLE ejecuta código arbitrario: todas son restricciones de integridad.
-- - No se detecta riesgo de inyección de código malicioso en este bloque.
-- --------------------------------------------------
