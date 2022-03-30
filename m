Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919217lfb;
        Wed, 30 Mar 2022 05:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMDI4x6mgKQLlVvrWZzzq5qmJFot6RPNvTL5WuZytNFR+pLqCfNKVBLNnkKy6f1lRhSxEt
X-Received: by 2002:a05:600c:5113:b0:38d:d8f:67e9 with SMTP id o19-20020a05600c511300b0038d0d8f67e9mr4220459wms.107.1648645017664;
        Wed, 30 Mar 2022 05:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645017; cv=none;
        d=google.com; s=arc-20160816;
        b=I28LTM2FkN26/aesY43d6pI8qS8/IGKqhG9LdPlW1Y5tp5aMLmQRrg45u6S69zsb53
         64IxnMXWdI3nylwXJOJjWEd0UaWbzBG9it05hwR0lMIv061CBvt0bga0kL1VsgR9fJO2
         tmrztAbCizmh2nZlHi5amK612kVh/+xzh48cuvKe8s2RKTDMNVhAo9R5p8EaPPYefj+m
         4tgKeOTDYk0sbJ32i/xgstwuUkqcOuiz9fVn9deojBNC6U6VwQ/H4JUKnkpYn63q06Tv
         0Tl2PUOcPyaldp87jyYa3nz1XZyDRyMRxoZkKgdDzWsBaVvXlOIsW4FMYdyPB8SE3/9M
         bQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=U6XTnSySc1VPFdO0j6fRlkKZ8C5bePQAqffOUVTjrec=;
        b=LKS5MSznQSVc2rINESi0lrWv1FvTS/ca0R3Jmg+XJyVzrPPdLMdiUBPKdFhDPfa76X
         dvksqaN7s+pHDzxkS/LkgAaZqpPruo/5Zkfi6pyyIE3ZlWyI1WlvdWcf4KvexPsGT4yG
         BiO3uomNPTft8j+lxBR+ezVkPfZT2C8rMjlQENh6vPjuNDyg5M08qlNQSsmDUSs9NqyP
         pfzC1cUUjNsRPg65s8/utFYNhMw5gW4wx1CXx5ZWl7eVy0BJfa745i64D8nEShb9Cwtn
         xK4lAeyurYAdCSoPvdrDwYP+le4hEjdbuIcHoSVlQWAoqOohfOsr6aECBUju9MgffmIP
         LyrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=3N71HHKt;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id j90-20020adf9163000000b00203e90192f3si16223910wrj.119.2022.03.30.05.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=3N71HHKt;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id 80A8E21EDA;
	Wed, 30 Mar 2022 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U6XTnSySc1VPFdO0j6fRlkKZ8C5bePQAqffOUVTjrec=;
	b=3N71HHKtlg8nGTnSpit5vmnXB+ZUX1rYBY5FFvQBXRZngq8R4AgyXeXumUScnOPY+CFHHQ
	bQkbUOnkFEenTuo1KKFVNhtIn7W42HTzgcKOB3MM1jhLSt+3JQWzM31uFjUzgwVgioX6t8
	qTyq9S08zoOG9N/bvoDM8y+LVtQrciY=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Vijai Kumar K <vijai@behindbytes.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>
Subject: [RFC PATCH 16/18] hw/riscv: update remaining machines due to riscv_hart_array update
Date: Wed, 30 Mar 2022 14:56:37 +0200
Message-Id: <20220330125639.201937-17-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: PcoOJuTgivc+

virt & spike machines have multiple sockets (but they still put
all cpus in the same default cluster). For these 2 machines
we disable the clustering in the array in order to keep the
behavior.

opentitan, sifive_e and shakti_c, were using the default cluster
too. But we can use the embedded cluster as it is equivalent.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/riscv/opentitan.c | 4 ++--
 hw/riscv/shakti_c.c  | 4 ++--
 hw/riscv/sifive_e.c  | 4 ++--
 hw/riscv/spike.c     | 5 +++--
 hw/riscv/virt.c      | 5 +++--
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 2eb7454d8a..4e90610f1d 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -132,10 +132,10 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
 
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
+    object_property_set_int(OBJECT(&s->cpus), "num-cpus", ms->smp.cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
-    riscv_hart_array_realize(&s->cpus, &error_abort);
+    qdev_realize(DEVICE(&s->cpus), NULL, &error_abort);
 
     /* Boot ROM */
     memory_region_init_rom(&s->rom, OBJECT(dev_soc), "riscv.lowrisc.ibex.rom",
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 93e0c8dd68..5158ea6e8b 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -108,7 +108,7 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
     ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev);
     MemoryRegion *system_memory = get_system_memory();
 
-    riscv_hart_array_realize(&sss->cpus, &error_abort);
+    qdev_realize(DEVICE(&sss->cpus), NULL, &error_abort);
 
     sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
         (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
@@ -171,7 +171,7 @@ static void shakti_c_soc_instance_init(Object *obj)
      */
     object_property_set_str(OBJECT(&sss->cpus), "cpu-type",
                             TYPE_RISCV_CPU_SHAKTI_C, &error_abort);
-    object_property_set_int(OBJECT(&sss->cpus), "num-harts", 1,
+    object_property_set_int(OBJECT(&sss->cpus), "num-cpus", 1,
                             &error_abort);
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 25ba0a8c85..c1e67c0f78 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -179,7 +179,7 @@ static void sifive_e_soc_init(Object *obj)
     SiFiveESoCState *s = RISCV_E_SOC(obj);
 
     object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
-    object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
+    object_property_set_int(OBJECT(&s->cpus), "num-cpus", ms->smp.cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x1004, &error_abort);
     object_initialize_child(obj, "riscv.sifive.e.gpio0", &s->gpio,
@@ -195,7 +195,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
-    riscv_hart_array_realize(&s->cpus, &error_abort);
+    qdev_realize(DEVICE(&s->cpus), NULL, &error_abort);
 
     /* Mask ROM */
     memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom",
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index b75e3656e1..17bba3c7fa 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -228,9 +228,10 @@ static void spike_board_init(MachineState *machine)
                                 machine->cpu_type, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "hartid-base",
                                 base_hartid, &error_abort);
-        object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
+        object_property_set_int(OBJECT(&s->soc[i]), "num-cpus",
                                 hart_count, &error_abort);
-        riscv_hart_array_realize(&s->soc[i], &error_abort);
+        cpus_disable_clustering(CPUS(&s->soc[i]));
+        qdev_realize(DEVICE(&s->soc[i]), NULL, &error_abort);
 
         /* Core Local Interruptor (timer and IPI) for each socket */
         riscv_aclint_swi_create(
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 12036aa95b..c51b124330 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1221,9 +1221,10 @@ static void virt_machine_init(MachineState *machine)
                                 machine->cpu_type, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "hartid-base",
                                 base_hartid, &error_abort);
-        object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
+        object_property_set_int(OBJECT(&s->soc[i]), "num-cpus",
                                 hart_count, &error_abort);
-        riscv_hart_array_realize(&s->soc[i], &error_abort);
+        cpus_disable_clustering(CPUS(&s->soc[i]));
+        qdev_realize(DEVICE(&s->soc[i]), NULL, &error_abort);
 
         if (!kvm_enabled()) {
             if (s->have_aclint) {
-- 
2.35.1
