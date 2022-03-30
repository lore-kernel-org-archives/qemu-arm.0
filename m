Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919178lfb;
        Wed, 30 Mar 2022 05:56:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF3idjH41WbZolQN0uDevDXswuR+Ja7N9GHyqg4GEJu+bkoO+sSLqBvXJLriMMc4oFVpEc
X-Received: by 2002:adf:dfc9:0:b0:203:fb83:83f1 with SMTP id q9-20020adfdfc9000000b00203fb8383f1mr35000703wrn.81.1648645014900;
        Wed, 30 Mar 2022 05:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645014; cv=none;
        d=google.com; s=arc-20160816;
        b=mCdeBNdVvnHsnjEPzSSNjtGf4ngWwTtKKfd4usgnEmoyn3JvpDJxScMXJiatQeAfH0
         rf+bQUaPYBQxTHTpAiNsjbrjo1NwE/Lnfk6HbcNjIqcNBbnLNRpN4V5agDi5+PgTUsCB
         FQdOugKnjYqxA63vrWqL8dfro3lmsE83QxIWM0OjTNlZZH1dpf73M8IMIt/Lvl6WYk+I
         fDI6d/tFPIlUUSOgWubXc6kCqnSW+gRkQ5VoGlJYhQVCaf5gZy6zvTm1LbtjAiqqPfdQ
         VKRQpkFD/d2fvFBP97A6/nJbsdFBIgQ4S/fXqsyh67UKbKih3BJN1g7Ev0+MUCQAcBVu
         kqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NOKaKHrkakp3iSQMIKooj9WF9hAzSC5b+0rM99mUeeA=;
        b=zFbIJRwqcmEBxdI+O6kXN4O8Axb5JYnyPeqSi2Vg3oo4k+y4YtpAzI/GwjmT4o2/kD
         zPICdohuEKzdbARoLhfyv+AKOnk6rkg+A4E4BX/f9jMZ+kAErWuSgMJwv0hW/kt5VYCs
         3/SAyVQu1EZDFh2m2MxuNAKR7gbSRiR9JsHzHAj3KYz4p85zPK5ZQXbJVqxEbS6xZqFW
         9lwHpWr71nxRZeFSTQGk+OHcdR9u1SrvwWYs+ySR65gF6Wj5ihBkUlIw0AarvqFi0/Fr
         1mEVppVlrf3Vm/DfhFm5uu4k70mzfmzNqWdvufHwmtyGSgzTTHAO4w+co12X6aKCUS20
         zh+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=vEJTdRBR;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id w2-20020adf8bc2000000b00205d511194csi3543049wra.519.2022.03.30.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=vEJTdRBR;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id D6AD621EC8;
	Wed, 30 Mar 2022 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOKaKHrkakp3iSQMIKooj9WF9hAzSC5b+0rM99mUeeA=;
	b=vEJTdRBRZ0qzH3Ms/MCCiTAh/HeFJAuwZ+a2j3TER7lCK38awRreOOFgwHtK9h6HY9Soj4
	fqZ6b7cgIgF84JAsQQjtvMYPB75fwPhe4lgxYi8VmBwV27rgXUeD7Ij+Ho+odPZdpTo5VM
	E8KCZI4v4yt1lhpgujn9GrcynXw2l4I=
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
Subject: [RFC PATCH 12/18] hw/riscv/virt: prepare riscv_hart transition to cpus
Date: Wed, 30 Mar 2022 14:56:33 +0200
Message-Id: <20220330125639.201937-13-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: Uhr9eTGYb2Xn

+ Use riscv_array_get_num_harts instead of accessing num_harts field.
+ Use riscv_array_get_hart instead of accessing harts field.
+ Use riscv_hart_array_realize instead of sysbus_realize.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/riscv/virt.c | 76 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 30 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..12036aa95b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -223,8 +223,11 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
     char *name, *cpu_name, *core_name, *intc_name;
+    unsigned num_harts;
 
-    for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+    num_harts = riscv_array_get_num_harts(&s->soc[socket]);
+
+    for (cpu = num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
 
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
@@ -232,7 +235,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
             (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        name = riscv_isa_string(&s->soc[socket].harts[cpu]);
+        name = riscv_isa_string(riscv_array_get_hart(&s->soc[socket], cpu));
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "compatible", "riscv");
@@ -249,7 +252,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+        if (riscv_feature(&riscv_array_get_hart(&s->soc[socket], cpu)->env,
                           RISCV_FEATURE_AIA)) {
             static const char * const compat[2] = {
                 "riscv,cpu-intc-aia", "riscv,cpu-intc"
@@ -299,14 +302,16 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
     char *clint_name;
     uint32_t *clint_cells;
     unsigned long clint_addr;
+    unsigned num_harts;
     MachineState *mc = MACHINE(s);
     static const char * const clint_compat[2] = {
         "sifive,clint0", "riscv,clint0"
     };
 
-    clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+    num_harts = riscv_array_get_num_harts(&s->soc[socket]);
+    clint_cells = g_new0(uint32_t, num_harts * 4);
 
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+    for (cpu = 0; cpu < num_harts; cpu++) {
         clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
         clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
         clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
@@ -322,7 +327,7 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
     qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
         0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
     qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
-        clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+        clint_cells, num_harts * sizeof(uint32_t) * 4);
     riscv_socket_fdt_write_id(mc, mc->fdt, clint_name, socket);
     g_free(clint_name);
 
@@ -340,13 +345,15 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     uint32_t *aclint_mswi_cells;
     uint32_t *aclint_sswi_cells;
     uint32_t *aclint_mtimer_cells;
+    unsigned num_harts;
     MachineState *mc = MACHINE(s);
 
-    aclint_mswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
-    aclint_mtimer_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
-    aclint_sswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+    num_harts = riscv_array_get_num_harts(&s->soc[socket]);
+    aclint_mswi_cells = g_new0(uint32_t, num_harts * 2);
+    aclint_mtimer_cells = g_new0(uint32_t, num_harts * 2);
+    aclint_sswi_cells = g_new0(uint32_t, num_harts * 2);
 
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+    for (cpu = 0; cpu < num_harts; cpu++) {
         aclint_mswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         aclint_mswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
         aclint_mtimer_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
@@ -354,7 +361,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
         aclint_sswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         aclint_sswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_SOFT);
     }
-    aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
+    aclint_cells_size = num_harts * sizeof(uint32_t) * 2;
 
     if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
         addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
@@ -426,18 +433,20 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     char *plic_name;
     uint32_t *plic_cells;
     unsigned long plic_addr;
+    unsigned num_harts;
     MachineState *mc = MACHINE(s);
     static const char * const plic_compat[2] = {
         "sifive,plic-1.0.0", "riscv,plic0"
     };
 
+    num_harts = riscv_array_get_num_harts(&s->soc[socket]);
     if (kvm_enabled()) {
-        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+        plic_cells = g_new0(uint32_t, num_harts * 2);
     } else {
-        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+        plic_cells = g_new0(uint32_t, num_harts * 4);
     }
 
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+    for (cpu = 0; cpu < num_harts; cpu++) {
         if (kvm_enabled()) {
             plic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
             plic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
@@ -460,7 +469,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
                                   ARRAY_SIZE(plic_compat));
     qemu_fdt_setprop(mc->fdt, plic_name, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(mc->fdt, plic_name, "interrupts-extended",
-        plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+        plic_cells, num_harts * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
         0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev", VIRTIO_NDEV);
@@ -492,6 +501,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     MachineState *mc = MACHINE(s);
     uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
     uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
+    unsigned num_harts;
 
     *msi_m_phandle = (*phandle)++;
     *msi_s_phandle = (*phandle)++;
@@ -505,15 +515,16 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     }
     imsic_max_hart_per_socket = 0;
     for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        num_harts = riscv_array_get_num_harts(&s->soc[socket]);
         imsic_addr = memmap[VIRT_IMSIC_M].base +
                      socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
+        imsic_size = IMSIC_HART_SIZE(0) * num_harts;
         imsic_regs[socket * 4 + 0] = 0;
         imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
         imsic_regs[socket * 4 + 2] = 0;
         imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
-        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
-            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        if (imsic_max_hart_per_socket < num_harts) {
+            imsic_max_hart_per_socket = num_harts;
         }
     }
     imsic_name = g_strdup_printf("/soc/imsics@%lx",
@@ -554,16 +565,16 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     imsic_guest_bits = imsic_num_bits(s->aia_guests + 1);
     imsic_max_hart_per_socket = 0;
     for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        num_harts = riscv_array_get_num_harts(&s->soc[socket]);
         imsic_addr = memmap[VIRT_IMSIC_S].base +
                      socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
-                     s->soc[socket].num_harts;
+        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) * num_harts;
         imsic_regs[socket * 4 + 0] = 0;
         imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
         imsic_regs[socket * 4 + 2] = 0;
         imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
-        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
-            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        if (imsic_max_hart_per_socket < num_harts) {
+            imsic_max_hart_per_socket = num_harts;
         }
     }
     imsic_name = g_strdup_printf("/soc/imsics@%lx",
@@ -618,13 +629,15 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     unsigned long aplic_addr;
     MachineState *mc = MACHINE(s);
     uint32_t aplic_m_phandle, aplic_s_phandle;
+    unsigned num_harts;
 
     aplic_m_phandle = (*phandle)++;
     aplic_s_phandle = (*phandle)++;
-    aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+    num_harts = riscv_array_get_num_harts(&s->soc[socket]);
+    aplic_cells = g_new0(uint32_t, num_harts * 2);
 
     /* M-level APLIC node */
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+    for (cpu = 0; cpu < num_harts; cpu++) {
         aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
     }
@@ -638,7 +651,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
     if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
         qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+            aplic_cells, num_harts * sizeof(uint32_t) * 2);
     } else {
         qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
             msi_m_phandle);
@@ -656,7 +669,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     g_free(aplic_name);
 
     /* S-level APLIC node */
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+    for (cpu = 0; cpu < num_harts; cpu++) {
         aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
     }
@@ -670,7 +683,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
     if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
         qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+            aplic_cells, num_harts * sizeof(uint32_t) * 2);
     } else {
         qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
             msi_s_phandle);
@@ -699,6 +712,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     MachineState *mc = MACHINE(s);
     uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
     uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
+    unsigned num_harts;
 
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -711,7 +725,8 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
     phandle_pos = mc->smp.cpus;
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
-        phandle_pos -= s->soc[socket].num_harts;
+        num_harts = riscv_array_get_num_harts(&s->soc[socket]);
+        phandle_pos -= num_harts;
 
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(mc->fdt, clust_name);
@@ -742,7 +757,8 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
     phandle_pos = mc->smp.cpus;
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
-        phandle_pos -= s->soc[socket].num_harts;
+        num_harts = riscv_array_get_num_harts(&s->soc[socket]);
+        phandle_pos -= num_harts;
 
         if (s->aia_type == VIRT_AIA_TYPE_NONE) {
             create_fdt_socket_plic(s, memmap, socket, phandle,
@@ -1207,7 +1223,7 @@ static void virt_machine_init(MachineState *machine)
                                 base_hartid, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
                                 hart_count, &error_abort);
-        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+        riscv_hart_array_realize(&s->soc[i], &error_abort);
 
         if (!kvm_enabled()) {
             if (s->have_aclint) {
-- 
2.35.1
