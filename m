Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569349njc;
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXb5SV83jYhhEQ5FO83vhpYAzONCmGdhkbKfvNGRMPIVPaxAFZrwiNRqgvjBECghFhk1X1bQZ6QnaHt5g==@linaro.org
X-Received: by 2002:a05:600c:1e08:b0:434:9f78:17d2 with SMTP id 5b1f17b1804b1-4349f7818f9mr43293805e9.29.1732564774334;
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564774; cv=none;
        d=google.com; s=arc-20240605;
        b=OlGvTtDwtsyVI2/9Y+rMw8YLy8kxY6Hmz6NVMODic5KsG+UPuTB9l54tmoqFHSSxTx
         BFIOoGaRe9slFYwHtIb0AgR1l7D7C4cciwutZJ4amXzlSzynWVswSZ9Oke2704mB/SCq
         JHiD9JL9n2p9T73gm0LSBMdObojGga4c7jKPLn7C5V8s9D8gpUuRcHQIGzN9Fcb2xxpN
         3ZmUIxie4mBrbcd6HN6KKf7MFjfcC9HEMnW6ZMqUSniurBx9ChdTaIFkb+Ktkq4NA7+9
         igWOILyEKIIUnQ9WMNy3Tp2HzhO9DMwx+Kgt/jjKNWW1cVR3rQ0jbAynfbD9m0PWp9C5
         YI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=infJS9DeH0K27lOoLlvsvVDPUOvzl4+LENJg6UezPVw=;
        fh=Txa5KtzejGdvIIZiGvUp7i7J2KvDAR3kC/9WQYViAxA=;
        b=DYwqLaj+bTF5bBhHPvXXm1TooW737V+xtdc+A2DC+54/StI7NpNIxhiv1p5Vw7kV9h
         rkpRmUzsIc3isx70oiaOt9LE6Q9TAvnWyiX07YkTzl4Db7yTtC2uG4pZmgWrixOeszQZ
         oDlJgxp/4O7dJXANlceWbfhUvZeZ4IA9MfCU883dNG0qUOc/NCeabKFqMRE5qODdQXdQ
         8DZ1Ng9kai8Tp2EYGPSoy+G0DcSEjBNugObP6NM+RgH0R3YWhzczd2roxrL4YkNA5xDT
         6ZAK5oVc5LudqpH61EsmY4myTd9ekKhr8i4ALcyRkdcmwIlp+6O8C3MfFiufQnXmdqHK
         Iutg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ullIZsF+;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434a04f2808sor10240005e9.5.2024.11.25.11.59.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ullIZsF+;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564774; x=1733169574; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=infJS9DeH0K27lOoLlvsvVDPUOvzl4+LENJg6UezPVw=;
        b=ullIZsF+E2RxRcBMLaum1UoJNNE5BgYhqrOP4oW1nlXJbUTEgRTzrFGKYf2p9OFwwu
         fAPt6wxn1gnHVZe08hdX7WoCsuzsbjKakxNiS4bUfXZ2O9VNoO1+YftV/5mIuvY54xzF
         DrzVpCwFbcXEEEVPNjI1N8lQ5r7RDm/xWVkgy15lavQGCzqwhTEoirUqS4lbkA7LnSY5
         0iwegEPToiGkD7Hkd/DdkZofQlPE76RtwccGe579Ui+vt+AYVu6OVlx6ciP3JxGQe58n
         +aDQLaMnySXCRvj81aayKV3gxbShrqvRn70Vz4ICWd+OP4mvC0iwusf4ILXEHFPUoYdl
         s/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564774; x=1733169574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=infJS9DeH0K27lOoLlvsvVDPUOvzl4+LENJg6UezPVw=;
        b=kDhUdiplPZCYLtpLX/EVXWELbQtiTJx4mZVGTXjNiybdvglqh9nCbN5aI7/BiAiLJi
         kju2MCsi2HbihbLB2/9V69pomNK768IEHoVqpf/eeWp0I35reXFW6z13jp0W2uhHYu3m
         07nkkNq8gq5vhV0WA0dvmzUlyLWX48/DrpdqobNO4lycDWlVTDrvi7sbPTaVwcz1pvcr
         lozL6c1uNO6BIJ0q0QTZ4mJgI0j63UxQQkOimA3RWbk6R2Ua1RNhFvr/1YaDtUjqscDy
         GaC0Adrbf8MrrMfYg6la2ddAtiveNg0p8dLCKsAJ9WHMlXt5EWsIj4tJZIY6Jp0bu+/K
         3O0g==
X-Forwarded-Encrypted: i=1; AJvYcCW5qy6ZOk+lB8a6UBdWH8uqGBeNrQbecfZS0ldBGur6v2fFvDtctnQO5Mwmyfs+4z1BD75Ozj9xGU4dkA==@linaro.org
X-Gm-Message-State: AOJu0Yy32+CmTRXCQ40ZnaCDDCBlzd3kICq5arJsNV7ZjSUv1DUUXchb
	6/xZWLAGQ15/f1a6qaFchzIatQEdcQW85Oc9/NAO376b/8NsbMQYKr2gWY9by8VPQA==
X-Gm-Gg: ASbGncuBWdU2Nnyvps9FIto8UCAz+D1KYcbdXFQJfIrliDEkjCaC+o0ZCUdvkdwRDeV
	wYFuEGq1yQRhMqmr5iYbmz+le2maSvMwoUqFcQ1mSQCL2K+OF08r8+MQQHwv+qgPxBhA42n7cQn
	U3pj640EkKMzI2u1vcWtbA6fy27Yxp0tGAyI/mZ6QfX1WNdea7hWg0obV64RO3WLl+vCX1MFuYB
	kj19Z84eHlJlxlrgmONkVwO7fsByjZP8xk4nOudeqwI8UBULg3H2YqGy2FhaLJRpgRc
X-Google-Smtp-Source: AGHT+IFz53X0C41rcCk5XmswOFreoozjR+mCfK83ojYyPfr6ibBWXlpbWCzbCzkSaNhjhYu6BBHmqw==
X-Received: by 2002:a05:6000:178a:b0:37c:d11f:c591 with SMTP id ffacd0b85a97d-38260b5ba0amr8944205f8f.17.1732564773787;
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 16/26] hw/arm/virt: Disable DTB randomness for confidential VMs
Date: Mon, 25 Nov 2024 19:56:15 +0000
Message-ID: <20241125195626.856992-18-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VIITaPtSdzJJ

The dtb-randomness feature, which adds random seeds to the DTB, isn't
really compatible with confidential VMs since it randomizes the Realm
Initial Measurement. Enabling it is not an error, but it prevents
attestation. It also isn't useful to a Realm, which doesn't trust host
input.

Currently the feature is automatically enabled, unless the user disables
it on the command-line. Change it to OnOffAuto, and automatically
disable it for confidential VMs, unless the user explicitly enables it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 docs/system/arm/virt.rst |  9 +++++----
 include/hw/arm/virt.h    |  2 +-
 hw/arm/virt.c            | 41 +++++++++++++++++++++++++---------------
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index e67e7f0f7c..c8319555a5 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -176,10 +176,11 @@ dtb-randomness
   rng-seed and kaslr-seed nodes (in both "/chosen" and
   "/secure-chosen") to use for features like the random number
   generator and address space randomisation. The default is
-  ``on``. You will want to disable it if your trusted boot chain
-  will verify the DTB it is passed, since this option causes the
-  DTB to be non-deterministic. It would be the responsibility of
-  the firmware to come up with a seed and pass it on if it wants to.
+  ``off`` for confidential VMs, and ``on`` otherwise. You will want
+  to disable it if your trusted boot chain will verify the DTB it is
+  passed, since this option causes the DTB to be non-deterministic.
+  It would be the responsibility of the firmware to come up with a
+  seed and pass it on if it wants to.
 
 dtb-kaslr-seed
   A deprecated synonym for dtb-randomness.
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aca4f8061b..e5e9f67f52 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -154,7 +154,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
-    bool dtb_randomness;
+    OnOffAuto dtb_randomness;
     bool second_ns_uart_present;
     OnOffAuto acpi;
     VirtGICType gic_version;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2d36640733..9836dfbdfb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -264,6 +264,7 @@ static bool ns_el2_virt_timer_present(void)
 
 static void create_fdt(VirtMachineState *vms)
 {
+    bool dtb_randomness = true;
     MachineState *ms = MACHINE(vms);
     int nb_numa_nodes = ms->numa_state->num_nodes;
     void *fdt = create_device_tree(&vms->fdt_size);
@@ -273,6 +274,16 @@ static void create_fdt(VirtMachineState *vms)
         exit(1);
     }
 
+    /*
+     * Including random data in the DTB causes random intial measurement on CCA,
+     * so disable it for confidential VMs.
+     */
+    if (vms->dtb_randomness == ON_OFF_AUTO_OFF ||
+        (vms->dtb_randomness == ON_OFF_AUTO_AUTO &&
+         virt_machine_is_confidential(vms))) {
+        dtb_randomness = false;
+    }
+
     ms->fdt = fdt;
 
     /* Header */
@@ -294,13 +305,13 @@ static void create_fdt(VirtMachineState *vms)
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-    if (vms->dtb_randomness) {
+    if (dtb_randomness) {
         create_randomness(ms, "/chosen");
     }
 
     if (vms->secure) {
         qemu_fdt_add_subnode(fdt, "/secure-chosen");
-        if (vms->dtb_randomness) {
+        if (dtb_randomness) {
             create_randomness(ms, "/secure-chosen");
         }
     }
@@ -2570,18 +2581,21 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
-static bool virt_get_dtb_randomness(Object *obj, Error **errp)
+static void virt_get_dtb_randomness(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
+    OnOffAuto dtb_randomness = vms->dtb_randomness;
 
-    return vms->dtb_randomness;
+    visit_type_OnOffAuto(v, name, &dtb_randomness, errp);
 }
 
-static void virt_set_dtb_randomness(Object *obj, bool value, Error **errp)
+static void virt_set_dtb_randomness(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
-    vms->dtb_randomness = value;
+    visit_type_OnOffAuto(v, name, &vms->dtb_randomness, errp);
 }
 
 static char *virt_get_oem_id(Object *obj, Error **errp)
@@ -3253,16 +3267,16 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
-    object_class_property_add_bool(oc, "dtb-randomness",
-                                   virt_get_dtb_randomness,
-                                   virt_set_dtb_randomness);
+    object_class_property_add(oc, "dtb-randomness", "OnOffAuto",
+                              virt_get_dtb_randomness, virt_set_dtb_randomness,
+                              NULL, NULL);
     object_class_property_set_description(oc, "dtb-randomness",
                                           "Set off to disable passing random or "
                                           "non-deterministic dtb nodes to guest");
 
-    object_class_property_add_bool(oc, "dtb-kaslr-seed",
-                                   virt_get_dtb_randomness,
-                                   virt_set_dtb_randomness);
+    object_class_property_add(oc, "dtb-kaslr-seed", "OnOffAuto",
+                              virt_get_dtb_randomness, virt_set_dtb_randomness,
+                              NULL, NULL);
     object_class_property_set_description(oc, "dtb-kaslr-seed",
                                           "Deprecated synonym of dtb-randomness");
 
@@ -3333,9 +3347,6 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
-    /* Supply kaslr-seed and rng-seed by default */
-    vms->dtb_randomness = true;
-
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
-- 
2.47.0
