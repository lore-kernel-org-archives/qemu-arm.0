Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919165lfb;
        Wed, 30 Mar 2022 05:56:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaVqhSI8wS7rxOxRTU+2Jx/16wtn/8A2SZTAUCwlGBUZiFi7iYLbEggpYycjY1TjVlqWlD
X-Received: by 2002:adf:ee4c:0:b0:203:fafb:28c5 with SMTP id w12-20020adfee4c000000b00203fafb28c5mr36268983wro.644.1648645013844;
        Wed, 30 Mar 2022 05:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645013; cv=none;
        d=google.com; s=arc-20160816;
        b=EmKDCPt2uqHN8qVQ4SPPDpgBCo2g/EFRkWTjajawMTVIU6Ui1B09Ov0Wx41YMccEeU
         KVSvM+Y3A/3NdPRBgwu1ejxsdG0Oic9yagZrucn/y6DoVr9AOY4kTWpWULEyen8qMnZ4
         fZr3zeGcFUIDA672f/ISJM9tH86B+t5cWZBRRZb2oxO5JpVLFlnwDx229ML4BSN3RqW+
         9OlOuVKxuR0VOgH46KzS73HWvyG0dv2vmiYSlkcuAtH3XJ4Q1dw3iCvXmz7P4MFzT8cX
         +iBwZCtNvnuGJXbY1364u/abnL1+wsTrxtydMnO6lAT4s4MTcv4zNRrtkE4TguDJhpGD
         8jYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+4+3Sun2+SPi9wRQB2rZD5KPE6zlGnALJn1V8tn0rq4=;
        b=t14Z88g2TiZIFesNiSO8ltD/29WzPkbnag+btP76COdcG/QQOaGJrMPc/ChiB9bATB
         N3XFeE29FRPsFy1DENjEZf8jdShMEfJquYFAxndnFrMmS3y8/GqBbPfCSdAn1ypESNO5
         wufJ5B+MvzxRQNyOv0gb2nBA8gtWC+xjOZn8bjeQJNXdgf4TBxoRO0zPpnMQ64IP91nf
         z63pQZ5sfcLEw087I2v1UG/Md6IWuD5FTzVlGcetHLTasr3q8s65Mw1S6bVzvZpT2WRN
         J9GEbwOHIirh6CYiFaC5L91NtHAjtkQSFfVm2i5kpid3MKP7I9wZy2dAgV3NMJWve8RS
         e65w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=DvJTNMEV;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id o4-20020adfca04000000b00203e90193d8si13963731wrh.348.2022.03.30.05.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=DvJTNMEV;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id 25A9821EC7;
	Wed, 30 Mar 2022 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4+3Sun2+SPi9wRQB2rZD5KPE6zlGnALJn1V8tn0rq4=;
	b=DvJTNMEViJAwS71iQx3dGKols78k+d1tfMegwp42eAAjjIXQGCuZZWPR7qnTu+8Yd1K61O
	tyX2BfGR+Y1ZzyeJXgPf+KnPZQAxTOiZmL1yz9VbtPQE3CWrczlLRlBgTC9aZlg6CkRnd6
	H1a8Y3BkFL+ay2ZXgKh27whATAAqrTA=
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
	Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 11/18] hw/riscv: prepare riscv_hart transition to cpus
Date: Wed, 30 Mar 2022 14:56:32 +0200
Message-Id: <20220330125639.201937-12-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: xXp4hXeNESsN

+ Use riscv_array_get_hart instead of accessing harts field.
+ Use riscv_hart_array_realize instead of sysbus_realize.

spike and virt machines will be handled separately in following
commits.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/riscv/boot.c            | 2 +-
 hw/riscv/microchip_pfsoc.c | 4 ++--
 hw/riscv/opentitan.c       | 2 +-
 hw/riscv/shakti_c.c        | 2 +-
 hw/riscv/sifive_e.c        | 2 +-
 hw/riscv/sifive_u.c        | 8 ++++----
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index cae74fcbcd..b21c8f6488 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -36,7 +36,7 @@
 
 bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
+    return riscv_array_get_hart(harts, 0)->env.misa_mxl_max == MXL_RV32;
 }
 
 /*
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index cafd1fc9ae..82547a53e6 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -190,8 +190,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     NICInfo *nd;
     int i;
 
-    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_abort);
+    riscv_hart_array_realize(&s->e_cpus, &error_abort);
+    riscv_hart_array_realize(&s->u_cpus, &error_abort);
     /*
      * The cluster must be realized after the RISC-V hart array container,
      * as the container's CPU object is only created on realize, and the
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 833624d66c..2eb7454d8a 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -135,7 +135,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+    riscv_hart_array_realize(&s->cpus, &error_abort);
 
     /* Boot ROM */
     memory_region_init_rom(&s->rom, OBJECT(dev_soc), "riscv.lowrisc.ibex.rom",
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 90e2cf609f..93e0c8dd68 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -108,7 +108,7 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
     ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev);
     MemoryRegion *system_memory = get_system_memory();
 
-    sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
+    riscv_hart_array_realize(&sss->cpus, &error_abort);
 
     sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
         (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index dcb87b6cfd..25ba0a8c85 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -195,7 +195,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+    riscv_hart_array_realize(&s->cpus, &error_abort);
 
     /* Mask ROM */
     memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7fbc7dea42..c99e92a7eb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -188,9 +188,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             } else {
                 qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
             }
-            isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
+            isa = riscv_isa_string(riscv_array_get_hart(&s->soc.u_cpus, cpu - 1));
         } else {
-            isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
+            isa = riscv_isa_string(riscv_array_get_hart(&s->soc.e_cpus, 0));
         }
         qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
         qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
@@ -830,8 +830,8 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
 
-    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_abort);
+    riscv_hart_array_realize(&s->e_cpus, &error_abort);
+    riscv_hart_array_realize(&s->u_cpus, &error_abort);
     /*
      * The cluster must be realized after the RISC-V hart array container,
      * as the container's CPU object is only created on realize, and the
-- 
2.35.1
