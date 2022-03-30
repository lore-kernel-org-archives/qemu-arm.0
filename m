Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919187lfb;
        Wed, 30 Mar 2022 05:56:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRM4xbTXlZBYA0Dzeop5oQZjNCscNUz7SP9jQeSQ4W/buWDMKPWLJmX8JI2cVI8ScD1cUr
X-Received: by 2002:a05:600c:190c:b0:38d:1403:da8b with SMTP id j12-20020a05600c190c00b0038d1403da8bmr4288213wmq.3.1648645015279;
        Wed, 30 Mar 2022 05:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645015; cv=none;
        d=google.com; s=arc-20160816;
        b=VoIUSPnhI8PEPnaBOR+j8pihdAdfK/w30RdTSb32B0o1YJ4UDlE7ax1VgxqPeHa4tz
         aGrXUcqg5P0qkBjjElvC56i5cHt6i7M+dA31vz60NygPOhA8IvlWnlfQXoJEgzPGmh+1
         suP8IbEkBZy1dixY4b1VkeDvsjl35E140KBZG3l4AxhleyFP0kkLCFptiBaQZsyO+vZ6
         ViM6s0Hcr1IQ8asdX3hmMEq3o4D8fuLvmleekEHcsJ1IB7zRgZaFVSXIXGgQ7s8nVGYW
         KlvOft61shny3ooFsukyrQXVYrbMDH55Opv7Udqi3mrFJC4Y6AFCWKWTHpJOvPhv1c2G
         XR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EyTZ8CgHiE5Z4BgEF/1LTYkzku8ClDxFHoUWNpaJ2Hs=;
        b=brk/M/BKN6hJkpWN2YiBYk/lvTLxlhLgtWLcAZRx1u4cScvwyF/9/PNw96cz9th8wO
         FRxGdWiWoWYozNgMsAbz0UOQLBBHJRcjwF+C5p2kotSR+hFcMC8EOr1rW6Tf6xGSw6OE
         VW62j3kIs6I9zvMPm56JiEaMsOg/zvBJVaOFHlpTAQS66L7FANy01B302lIg8eskP97+
         lI9iScnElt5pzR1G0Jpca4VrAsRXB0UOSiEZoGJXT8HeAE+4VVm4OWZa13ZnWKiywLjP
         BUVp7xeCEYZHEpPU8CZpIicSABU5A7NnGO4/1l3SsA9LkY/va/VMWPhWWT4JiGA5Yyzk
         UCPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=VUIyqxKG;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id e8-20020a056000034800b002057c85023dsi25667043wre.210.2022.03.30.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=VUIyqxKG;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id EDFD821EC9;
	Wed, 30 Mar 2022 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyTZ8CgHiE5Z4BgEF/1LTYkzku8ClDxFHoUWNpaJ2Hs=;
	b=VUIyqxKGf/yeZBptq3T3YWxj4C3eGc4I1hnI/1RCe7WXHZfguzFv+FAmhhNojTAxSt/mu6
	97vkjK62gZiNgE1pBZtSWLTXN5rlv8Zbf7ytlJjlOXDlZR2RBD5B+HMDI+VIW5rR2j4bDR
	ySa/y6ax1O6uEBknBOLYQ9+n/3Fw/As=
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
Subject: [RFC PATCH 13/18] hw/riscv/spike: prepare riscv_hart transition to cpus
Date: Wed, 30 Mar 2022 14:56:34 +0200
Message-Id: <20220330125639.201937-14-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: QfDdWIyTfMlB

+ Use riscv_array_get_num_harts instead of accessing num_harts field.
+ Use riscv_array_get_hart instead of accessing harts field.
+ Use riscv_hart_array_realize instead of sysbus_realize.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/riscv/spike.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d059a67f9b..b75e3656e1 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -54,6 +54,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
+    unsigned num_harts;
     MachineState *mc = MACHINE(s);
     uint32_t *clint_cells;
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
@@ -97,10 +98,10 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(fdt, clust_name);
+        num_harts = riscv_array_get_num_harts(&s->soc[socket]);
+        clint_cells =  g_new0(uint32_t, num_harts * 4);
 
-        clint_cells =  g_new0(uint32_t, s->soc[socket].num_harts * 4);
-
-        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+        for (cpu = num_harts - 1; cpu >= 0; cpu--) {
             cpu_phandle = phandle++;
 
             cpu_name = g_strdup_printf("/cpus/cpu@%d",
@@ -111,7 +112,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             } else {
                 qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
             }
-            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
+            name = riscv_isa_string(riscv_array_get_hart(&s->soc[socket], cpu));
             qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
             g_free(name);
             qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
@@ -164,7 +165,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         qemu_fdt_setprop_cells(fdt, clint_name, "reg",
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
-            clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+            clint_cells, num_harts * sizeof(uint32_t) * 4);
         riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
 
         g_free(clint_name);
@@ -229,7 +230,7 @@ static void spike_board_init(MachineState *machine)
                                 base_hartid, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
                                 hart_count, &error_abort);
-        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+        riscv_hart_array_realize(&s->soc[i], &error_abort);
 
         /* Core Local Interruptor (timer and IPI) for each socket */
         riscv_aclint_swi_create(
@@ -311,7 +312,7 @@ static void spike_board_init(MachineState *machine)
 
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom,
-                 &s->soc[0].harts[0].env, serial_hd(0),
+                 &riscv_array_get_hart(&s->soc[0], 0)->env, serial_hd(0),
                  memmap[SPIKE_HTIF].base);
 }
 
-- 
2.35.1
