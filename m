Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472473njb;
        Mon, 3 Feb 2025 16:23:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDBkAtQuyYRKalZiXqOGIZ4EanxMBP4Zg9sAfd7Ks0YQztc2GdQ61rtoHgTKkIO+hBbd7gi72IYwYx4A==@linaro.org
X-Received: by 2002:a05:600c:35d3:b0:434:f586:753c with SMTP id 5b1f17b1804b1-438dc3c3790mr219555135e9.7.1738628611683;
        Mon, 03 Feb 2025 16:23:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628611; cv=none;
        d=google.com; s=arc-20240605;
        b=V46/mCkKlEf8BETJ/t+p5Elvg+MooDP2eg2bALtr+O9rTabOwUHsND3Sg/DMRc5DIa
         MXpoR9SBxbEAE4JaMDX4st7NGyyYcMa2XxNoK8OmkjqIuoUbaqUv1yaLZG+ItMn+FdPu
         sZoEfVGUhxzRWszwjpk7LW0ZDmzasCzSBCMkLS0dFcQ8PTyyC4rVPOTh2BavfID38vPW
         VzdVOVPPljtMAXwKJqcI3gt5jcaczt1UxAyMAJs35KId+7YTPPNMroHoYPDupzRbLZQU
         gYebvwQYuCG7UprsbxbAWflpLbF2W/s82oxuEiaLwfX3VXpeI5Mc0APh4C1TVrZfOzFK
         6z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pIv2DBodYYA0dRZkz56J6dhWz5LDF9EMp1+oiy+F/vk=;
        fh=ciRW2DH/Twof4Zd7ZHPPAbTGpm/gfhlr+LuziMcJmOI=;
        b=Cbv9N7UbOFV7PzMc4yJ8XCvYzMIVctvq+aNCM5j3QpQyFdXVrKxDJ7k4we6az4YNup
         JeT/TJWwl/sHH2aMcJwdT0WTZCiYMJ/CCr2RmcHmbiKkcAZ1uuQebuJS/Q8Q6342vruJ
         4RnEO7cqH2JNRei4KgtZyGyGocFZW7NWF0XSIJT9kgUppQtdXrLDkzISg4HXKEdS75hz
         4GxT1dfPS0mUda7+AI8wbexTy1mUGLPRgooolL6XovV1LGUb3vLrGWcgCkmiK8Kb9fO6
         yagHt0AqQaGHyZIwaconGYFv15c41ImBslVmN7p3u2zyIGPmZoW8URCKEc7izASFFzIw
         7fDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yFw2uEyv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e23d647asor44478605e9.1.2025.02.03.16.23.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yFw2uEyv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628611; x=1739233411; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIv2DBodYYA0dRZkz56J6dhWz5LDF9EMp1+oiy+F/vk=;
        b=yFw2uEyv775VFLUwCrCdlUoIJF3i/n1uH35m8+kZNa1oFf2CEGfq6hsg+DVjPb1wot
         F49vQr2vzW9xUhYAiqmr+ZsyvMiWodDLXAigmI4BN50TEIQmeG5oRhFcdiF/Di6NjXc6
         atXNHMgdHiMm0TTrcfjIIEoh/OZ4iMouHygbG3kfQXe/n6oDCxhXMQt34Il5s79EuIM4
         hwxgWBoIjv/pGO/c7kaCRkFUcIp3nhrMaU12Rq5pDFnWsYoNGSO5cq/QPnjrUDuDPz+e
         55vbz0gnSb+DeY30e8Yh9aU3OpBmylyNfNBWOgyoGa8GzlgZE9mAG+adwxC9wzeN6IhM
         BA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628611; x=1739233411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIv2DBodYYA0dRZkz56J6dhWz5LDF9EMp1+oiy+F/vk=;
        b=lXQt54eqr4NvAlx2JFz9oQm2GZme3o3f7SeMqSPkf5IMvKKO9GnIjf95UmFMjzZu6R
         O2X0Ct+fxMGdehl4j3D+DSszrhedTQirY+VMjzgbND+BDySJyeydqLALw7HYRkFZKudm
         EFYN/LWMD6GBkBMxHQPCk/IlATDT7/+Pj2mWaHo4/JYjOPhyDWixKNzAs58hvm9/rx0o
         MwCGdbUYiXA7VUSSs/QTkaPfv8k14dzwvkir0ydOxzz2AjESboh2356kfoBlrdB0A5YQ
         YfDNZ/taxYwbqxCSHKRZP45EinbynzvPO/+em625fM7RkvPe9lfIvB+rPVycN0OoOH33
         Mcmg==
X-Forwarded-Encrypted: i=1; AJvYcCV0SJUOArKaltZjF2S75Vy9eHZVcazx7Xs/sYiIB/wbxUfe4l2uPqKFptOQaX+RqWd6SCVPQhHCU981cA==@linaro.org
X-Gm-Message-State: AOJu0YwEaMewUihI5gEx3d6MhCl1PeFNBS4SWJloBst/3fTx7EuJxn6Z
	sepJs9JYjLzJ07sA7nANe377z6bWiyk5OQqog7J0y39cm9o0iZ5RuteHHi0JhBNKwg==
X-Gm-Gg: ASbGncukH9jBGmCCG52xFEThcrqahUWMi2V0Kqjq1G7Aumqw/QxyaQqN4txXAU0xwYv
	PJScNb7OfWOkYKDc/+vkoT+FDOLSYDQb23ZZuD/sdAVKYHbQzIa9owdUdRWzQ7aS2K5CZjNtNTt
	J7gTt5/Oe4zMWb0/KKcxq2HWejvrvHk5TUDc2/fbGkvGmj/sme4YkII/qR8AUqqzhff1/lHXjcA
	3ggKeEuUc4V+95WpFYsOdWTmoSSK7ho1keVbXDpE7aryh5f7KBRNw5QTNXxiElW+JcwQPYBAb6P
	cloorEgWq5vdzYic6WjrlxIdSnSqp+kMNI/ib29cCTZfeupE+5/ump0ethWsZGoPEg==
X-Google-Smtp-Source: AGHT+IFOUPAuBUePYklyiQuwsGTbYNQ+OFZucNwNkREnXsqpf8qQTNiP7f8PImZO9S8kkCWx2U14VA==
X-Received: by 2002:a05:600c:1ca3:b0:438:a240:c55 with SMTP id 5b1f17b1804b1-438e70d1b20mr112546225e9.1.1738628611126;
        Mon, 03 Feb 2025 16:23:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc12f88sm206385815e9.2.2025.02.03.16.23.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 08/12] hw/arm/raspi: Introduce generic Raspberry Pi machine
Date: Tue,  4 Feb 2025 01:22:36 +0100
Message-ID: <20250204002240.97830-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nqBXMvBw/cPQ

The generic 'raspi' machine takes a 'model' argument and
create the machine associated with the model, with the
RAM size requested (or default to the minimum of 256MB
if not precised).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2797
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/raspi_platform.h |   3 +-
 hw/arm/raspi.c                  | 127 ++++++++++++++++++++++++++++----
 2 files changed, 115 insertions(+), 15 deletions(-)

diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index defb786153b..14cb91e153c 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -41,7 +41,8 @@ OBJECT_DECLARE_TYPE(RaspiBaseMachineState, RaspiBaseMachineClass,
 struct RaspiBaseMachineState {
     /*< private >*/
     MachineState parent_obj;
-    /*< public >*/
+
+    uint32_t board_rev;
     struct arm_boot_info binfo;
 };
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index d44277001ee..1dc41701efe 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -300,20 +300,6 @@ void raspi_base_machine_init(MachineState *machine,
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
-    uint64_t max_ramsize;
-
-    if (machine->ram_size != ram_size) {
-        char *size_str = size_to_str(ram_size);
-        error_report("Invalid RAM size, should be %s", size_str);
-        g_free(size_str);
-        exit(1);
-    }
-    max_ramsize = ramsize_max(board_rev);
-    if (ram_size > max_ramsize) {
-        g_autofree char *max_ramsize_str = size_to_str(max_ramsize);
-        error_report("At most %s of RAM can be used", max_ramsize_str);
-         exit(1);
-    }
 
     /* FIXME: Remove when we have custom CPU address space support */
     memory_region_add_subregion_overlap(get_system_memory(), 0,
@@ -448,6 +434,115 @@ void raspi_machine_init(MachineState *machine)
     raspi_base_machine_init(machine, BCM283X_BASE(soc), mc->board_rev);
 }
 
+static void raspi_generic_machine_init(MachineState *ms)
+{
+    RaspiMachineState *s = RASPI_MACHINE(ms);
+    RaspiBaseMachineState *s_base = RASPI_BASE_MACHINE(ms);
+    uint32_t board_rev = s_base->board_rev;
+    const char *soc_type = board_soc_type(board_rev);
+    BCM283XBaseState *bsoc;
+    uint64_t ram_size;
+    uint64_t max_ramsize;
+
+    if (!board_rev) {
+        error_report("Missing model");
+        exit(1);
+    }
+
+    ram_size = ROUND_UP(ms->ram_size, 256 * MiB);
+    if (ram_size != ms->ram_size) {
+        g_autofree char *ram_size_str = size_to_str(ms->ram_size);
+        g_autofree char *rounded_size_str = size_to_str(ram_size);
+        warn_report("Invalid RAM size %s, rounding to %s",
+                    ram_size_str, rounded_size_str);
+    }
+    max_ramsize = ramsize_max(board_rev);
+    if (ram_size > max_ramsize) {
+        g_autofree char *max_ramsize_str = size_to_str(max_ramsize);
+        error_report("At most %s of RAM can be used with BCM%s",
+                     max_ramsize_str, soc_type + 3);
+        exit(1);
+    }
+    board_rev = FIELD_DP32(board_rev, REV_CODE, MEMORY_SIZE,
+                           ctz64(ms->ram_size) - 28);
+
+    ms->ram = g_new(MemoryRegion, 1);
+    memory_region_init(ms->ram, OBJECT(ms), "DRAM", ram_size);
+
+    if (board_processor_id(board_rev) == PROCESSOR_ID_BCM2838) {
+        BCM2838State *soc = &s->soc4;
+        bsoc = BCM283X_BASE(soc);
+        object_initialize_child(OBJECT(ms), "soc", soc, soc_type);
+    } else {
+        BCM283XState *soc = &s->soc;
+        bsoc = BCM283X_BASE(soc);
+        object_initialize_child(OBJECT(ms), "soc", soc, soc_type);
+    }
+    raspi_base_machine_init(ms, bsoc, board_rev);
+}
+
+static void raspi_update_board_rev(RaspiBaseMachineState *s)
+{
+    MachineState *ms = MACHINE(s);
+    RaspiProcessorId proc;
+    unsigned model_index;
+
+    s->board_rev = FIELD_DP32(s->board_rev, REV_CODE, STYLE, 1);
+
+    model_index = FIELD_EX32(s->board_rev, REV_CODE, TYPE);
+    proc = types[model_index].proc_id;
+    s->board_rev = FIELD_DP32(s->board_rev, REV_CODE, PROCESSOR, proc);
+
+    ms->smp.max_cpus = soc_property[proc].cores_count;
+}
+
+static void raspi_set_machine_model(Object *obj, const char *value, Error **errp)
+{
+    for (unsigned i = 0; i < ARRAY_SIZE(types); i++) {
+        if (types[i].model && !strcmp(value, types[i].model)) {
+            RaspiBaseMachineState *s = RASPI_BASE_MACHINE(obj);
+
+            s->board_rev = FIELD_DP32(s->board_rev, REV_CODE, TYPE, i);
+
+            return raspi_update_board_rev(s);
+        }
+    }
+    error_setg(errp, "Invalid model");
+}
+
+static char *raspi_get_machine_model(Object *obj, Error **errp)
+{
+    RaspiBaseMachineState *s = RASPI_BASE_MACHINE(obj);
+
+    return g_strdup(types[FIELD_EX32(s->board_rev, REV_CODE, TYPE)].model);
+}
+
+static void raspi_generic_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+    rmc->board_rev = FIELD_DP32(0, REV_CODE, STYLE, 1);
+
+    mc->desc = "Raspberry Pi";
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->default_cpus = 1;
+    mc->min_cpus = 1;
+    mc->max_cpus = 4;
+    mc->default_ram_size = 0;
+    mc->default_ram_id = "DRAM";
+    mc->init = raspi_generic_machine_init;
+
+    object_class_property_add_str(oc, "model",
+                                  raspi_get_machine_model,
+                                  raspi_set_machine_model);
+    object_class_property_set_description(oc, "model", "Set machine model.");
+};
+
+
 void raspi_machine_class_common_init(MachineClass *mc,
                                      uint32_t board_rev)
 {
@@ -533,6 +628,10 @@ static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo raspi_machine_types[] = {
     {
+        .name           = MACHINE_TYPE_NAME("raspi"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi_generic_machine_class_init,
+    }, {
         .name           = MACHINE_TYPE_NAME("raspi0"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi0_machine_class_init,
-- 
2.47.1
