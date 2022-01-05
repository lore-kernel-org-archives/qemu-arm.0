Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k33sm2765825wms.21.2022.01.05.06.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0B4571FFCD;
	Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jerome Forissier <jerome@forissier.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH  v1 21/34] hw/arm: add control knob to disable kaslr_seed via DTB
Date: Wed,  5 Jan 2022 13:49:56 +0000
Message-Id: <20220105135009.1584676-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HOONSJ8E+7EP

Generally a guest needs an external source of randomness to properly
enable things like address space randomisation. However in a trusted
boot environment where the firmware will cryptographically verify
components having random data in the DTB will cause verification to
fail. Add a control knob so we can prevent this being added to the
system DTB.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Acked-by: Jerome Forissier <jerome@forissier.org>
Message-Id: <20211215120926.1696302-1-alex.bennee@linaro.org>
---
 docs/system/arm/virt.rst |  7 +++++++
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 850787495b..c86a4808df 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -121,6 +121,13 @@ ras
   Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
   using ACPI and guest external abort exceptions. The default is off.
 
+kaslr-dtb-seed
+  Set ``on``/``off`` to pass a random seed via the guest dtb to use for features
+  like address space randomisation. The default is ``on``. You will want
+  to disable it if your trusted boot chain will verify the DTB it is
+  passed. It would be the responsibility of the firmware to come up
+  with a seed and pass it on if it wants to.
+
 Linux guest kernel configuration
 """"""""""""""""""""""""""""""""
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dc6b66ffc8..acd0665fe7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -148,6 +148,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
+    bool kaslr_dtb_seed;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6bce595aba..1781e47c76 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -247,11 +247,15 @@ static void create_fdt(VirtMachineState *vms)
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-    create_kaslr_seed(ms, "/chosen");
+    if (vms->kaslr_dtb_seed) {
+        create_kaslr_seed(ms, "/chosen");
+    }
 
     if (vms->secure) {
         qemu_fdt_add_subnode(fdt, "/secure-chosen");
-        create_kaslr_seed(ms, "/secure-chosen");
+        if (vms->kaslr_dtb_seed) {
+            create_kaslr_seed(ms, "/secure-chosen");
+        }
     }
 
     /* Clock node, for the benefit of the UART. The kernel device tree
@@ -2235,6 +2239,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
+static bool virt_get_kaslr_dtb_seed(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->kaslr_dtb_seed;
+}
+
+static void virt_set_kaslr_dtb_seed(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->kaslr_dtb_seed = value;
+}
+
 static char *virt_get_oem_id(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2764,6 +2782,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
+    object_class_property_add_bool(oc, "kaslr-dtb-seed",
+                                   virt_get_kaslr_dtb_seed,
+                                   virt_set_kaslr_dtb_seed);
+    object_class_property_set_description(oc, "kaslr-dtb-seed",
+                                          "Set off to disable passing of kaslr "
+                                          "dtb node to guest");
+
     object_class_property_add_str(oc, "x-oem-id",
                                   virt_get_oem_id,
                                   virt_set_oem_id);
@@ -2828,6 +2853,9 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
+    /* Supply a kaslr-seed by default */
+    vms->kaslr_dtb_seed = true;
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
-- 
2.30.2
