Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497950ejd;
        Fri, 19 Apr 2024 08:59:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUv1h+CT0OMHbP53fpbwsBZnA1ddLyRPO5Y9Ze7SjsXSzD1qQlcu5czTtHJwCIuWUkSpCfJWknXoW0gLFge90enK2RRCcwG
X-Received: by 2002:adf:f751:0:b0:347:f26d:c183 with SMTP id z17-20020adff751000000b00347f26dc183mr2160641wrp.45.1713542391325;
        Fri, 19 Apr 2024 08:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542391; cv=none;
        d=google.com; s=arc-20160816;
        b=CA5APo8DyrJjz4rKc9oU29/1q8pgjf37XMnEuzF6OmRjO4SrX7KHyjhJg5QCUCqsuR
         HehIBtcO+L7rkVEP0J4FVkcwUkLqXmsjcsD9ixzGTYBDZ6Am1qobmTsAOXfyfJr28BNT
         IEXmo35+CLhX1igGnunvwvBjtQSSRlB7Rq2LZMyvW3m2DDF2RQG7vrxKGpC5MSwIcZ6D
         3jqlfiKUHfcZZPpFPC7+ceI6TjyiYEZ9T6Aghnc+eb7TrzccK6rv2ndQzwIjKCjay5rp
         Bq1SDGpSD4GD/uKcNZyXU3+nNsnmBopIZa0d6C9NIlsqfl+uBWAaHNHpC0KE/gvJOghr
         kdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kLJn8Et2P7uvb72LPY76EBgdmCDOnIuXR/Ns31Lbr0Y=;
        fh=M2ZbCCJZV7pummBR7Htx4HQXFsJbV/c7V+SeJAt+TaQ=;
        b=Gvx5oq9ykQl8sC8wjjQ3FHBxIvjQxytg5sDZKXDQuVqru31Vj3zv2Guwa5EM9i7HBS
         hWstztJZxNnrH1PvWiARbuzmIKLLQsqLMgPqpk+LcO8KKLB3qmfhD0l9Obhx8tg4G4XY
         VaHOb93ttQrrqnC3fFDmWulDpnjU+S145AGuPyVipftCwF2IRdodUaDyBFtXiG1qXpGk
         X1yK1QS35MZd+BrMWhC/lUwVtemD+97itDTCxsZiSyEJTkUUXLypwdn1dYGfKZUD7Gdm
         pi7iOQiesdBAFimvN01DfxiflblkI8OztV5hXUnzalSUahDcaizUavMim1PT4ZkLUhJR
         PV1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S7eThg+w;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jj6-20020a05600c6a0600b00418d7bf304dsor1814130wmb.13.2024.04.19.08.59.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S7eThg+w;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542391; x=1714147191; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLJn8Et2P7uvb72LPY76EBgdmCDOnIuXR/Ns31Lbr0Y=;
        b=S7eThg+wvtdTKcNE1X6vmSLcmQv3Bh8327whEjzd02eG/sF5YLDqgRnRROZcm66xKD
         TJQmfbm/9pYFYYLImQL3GicMrMkGSNJFLK1BxtLcqVH87tK/h2unyQv/rJael8vip7o7
         tXSFWg5Zu98Rz7SE7eJgBY86WUQw+53oueqbp32kNSDISodd+04Maf3sNWp+i/ag5jjb
         3wc6aYUtZHh1xiOhlZLBGePbdEivI/RnqGe+DsP27jdQg9uO/N4H/sRDLHFuxrz1O++D
         T7Y8d6HFEEBw9edN/CdcndSyPU5QnRv8CWWbx4UQ/V4COER9kbKBq16hBmimfTFBv+jC
         Nq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542391; x=1714147191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLJn8Et2P7uvb72LPY76EBgdmCDOnIuXR/Ns31Lbr0Y=;
        b=TA8ZcNKKuKupBqzXeYBgO6J311NqBBjk8H59If6H5TyURbefXzNiZ573KheUwvQmiJ
         h4h2LPrlOJELh0QUwhGycyGnqvyrEPshku5Z9zx83cdFxWY5bIhabgSe7gojPI+DlteW
         h59QvAKkznCe2ROt/o/VoNpcdfx0ZXl0Qu8cUZNV0jfy15KF7xVPJ4U8RWCw7SLk2JCS
         SjGlQzuVbh8naoVYwcGeeN2UVo/DGOeCT3b3o/oG5vLqmqBp8PLllBe6fVx1FvNLeVBl
         8wThondfQmD3WRJI65gRDAC1zdX8Awh8ppEFsvdWmdcF8aNjfuTgXIRB7eHjIBuKusbp
         6MBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSSsHHlPzmMOh0+y9WEtNJryTLkniwWBqt3FiHBga2+T84KZOA++9kTWk8hG5P41X/hI+ki0OVGUisM+F1f2ibO4NB2ACE
X-Gm-Message-State: AOJu0YxsTrVFF7EVwx+hwyQKxeMI/scnWAtac8fIB/O3wV0rBzgaXOJO
	TVH0JtDEvaH06u6l4fvL/ibTPk4K+61JYqEtJiyaIndKPlmk6TrMmfR91pGnwBLVZQ==
X-Google-Smtp-Source: AGHT+IHt5SgdwAwTpK9LHFNiGk1VckoKu45Qk/h6ZktffMVSX/Qpn4+HcqAyA1R8ziHYvXM8oh/21A==
X-Received: by 2002:a05:6000:186b:b0:34a:4f1c:3269 with SMTP id d11-20020a056000186b00b0034a4f1c3269mr2602929wri.0.1713542390967;
        Fri, 19 Apr 2024 08:59:50 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:50 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 06/22] hw/arm/virt: Disable DTB randomness for confidential VMs
Date: Fri, 19 Apr 2024 16:56:54 +0100
Message-ID: <20240419155709.318866-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ia9yUzCUnE1q

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
v1->v2: separate patch, use OnOffAuto
---
 docs/system/arm/virt.rst |  9 +++++----
 include/hw/arm/virt.h    |  2 +-
 hw/arm/virt.c            | 41 +++++++++++++++++++++++++---------------
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 26fcba00b7..e4bbfec662 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -172,10 +172,11 @@ dtb-randomness
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
index bb486d36b1..90a148dac2 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -150,7 +150,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
-    bool dtb_randomness;
+    OnOffAuto dtb_randomness;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 07ad31876e..f300f100b5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -259,6 +259,7 @@ static bool ns_el2_virt_timer_present(void)
 
 static void create_fdt(VirtMachineState *vms)
 {
+    bool dtb_randomness = true;
     MachineState *ms = MACHINE(vms);
     int nb_numa_nodes = ms->numa_state->num_nodes;
     void *fdt = create_device_tree(&vms->fdt_size);
@@ -268,6 +269,16 @@ static void create_fdt(VirtMachineState *vms)
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
@@ -278,13 +289,13 @@ static void create_fdt(VirtMachineState *vms)
 
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
@@ -2474,18 +2485,21 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
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
@@ -3123,16 +3137,16 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
 
@@ -3203,9 +3217,6 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
-    /* Supply kaslr-seed and rng-seed by default */
-    vms->dtb_randomness = true;
-
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
-- 
2.44.0
