Received: by 10.25.0.6 with SMTP id 6csp214993lfa;
        Fri, 26 May 2017 02:21:34 -0700 (PDT)
X-Received: by 10.55.17.233 with SMTP id 102mr852759qkr.244.1495790494647;
        Fri, 26 May 2017 02:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495790494; cv=none;
        d=google.com; s=arc-20160816;
        b=osK1UImMrPKhNGo7hNKFxfYtjOjYj+xTliUKFtWpDCPg7eis/R2uVBfotzbtbiebN6
         +j2MvqXKy4D78h0OHVgkYOwMi+q4VMNxsY2sUx3vtyHfl292adpOd+tqsalwBW5whrGv
         ht0rbJbmYGhRkG5jz8gR/nJFzf7fAo/MP7EJnS2fpzFfdaeQ6hfQnvtbkt7vnY6rgd7t
         31cHLpKt61rwQWMut+woN2d77NN6IV/457jKYI4Rt8xoPQVUfY/U0e23Ox1gEdCvceXT
         iGPyqbCSCEKluaytsLUN/HBAoucLFo8hIt+yW6lJc2/RkRWltNZI8K80ooMcbi2p4Mjd
         Hsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=bUt5NIaPDgbeUnkAd4OiQa864lmc6FFoSXJdDknnrDI=;
        b=AgW83DcSoleZ2Zua9CtIwYZEffWMTEGl6dJ0ThqLOy1gzBCNUNSGrcxV3WbLwjXMjR
         RGrjZhtsZJSgkJx76pVliXZmL9iQuiXRxH7JlKqNsfyQjaLprSpokPiwGwlApKVCnEPu
         IMkkRgU5ePaW1sFa8mBNowIWjk4vC+OqHwrnwAwba5maBthf+gngxO8lx6bWVwHzzR7J
         /6vfyV65Taq9Hu1LZswDNiWsH3VSPA1usk3t2K6MGQifgebLk7PPLDnN0GEBhG0LO+MQ
         WJH7ydjZokg8IPv6XyBiBQVQs8njJDb4rLfoW66vGdXSkqNd4fcHQrjY2jLlDGIUTaVD
         zmrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c133si223627qkg.218.2017.05.26.02.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 02:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEBR8-0002e1-0D
	for alex.bennee@linaro.org; Fri, 26 May 2017 05:21:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dEBR3-0002dX-9d
	for qemu-arm@nongnu.org; Fri, 26 May 2017 05:21:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dEBR0-0005X3-Sq
	for qemu-arm@nongnu.org; Fri, 26 May 2017 05:21:29 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:32788)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zhlcindy@gmail.com>)
	id 1dEBR0-0005Wx-Ki; Fri, 26 May 2017 05:21:26 -0400
Received: by mail-pf0-x242.google.com with SMTP id f27so1524907pfe.0;
	Fri, 26 May 2017 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bUt5NIaPDgbeUnkAd4OiQa864lmc6FFoSXJdDknnrDI=;
	b=O4xluaH2kq86rcWGSMp0tOOjcO9hSvSfLjVCfeGe1iThR0G0beQ4XvmztcUuCGcqjd
	XL8PgQmLEX0pEhEB+nrctLA32vRhIH6I3h4lAgH2OuCZJ56zzgj454mQNRbWHvSl/1A3
	4Tq9LNVIhYg1hNRrdhgZC24wwQI9Q9H1Lx0rFKRRyr/z6zvUKsSw6JuDATo/q6GvnjZB
	COMAesHJNnpkokpDI9ZH6oPFqBhbZE6TZNQtIPVLy8J9HiDjVmLOFGmW3+AcX8ITqsfC
	9iTAUVW21fnypZaHNWwdkcR8/d/2JBXMswhZYuKpiztkY8l31wODuKuassx01hn3ifW5
	C6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bUt5NIaPDgbeUnkAd4OiQa864lmc6FFoSXJdDknnrDI=;
	b=XJcBTr8bPQJU7rrSCcy83diTSZPUfwxVDX4+Ex9aO2BCRMYW2d7eqCoXBPy1vcVkyR
	Gsj912ivDCjvgmt0BsqoPKaZqEy4pXm5Uh65wkYj8BLLyzuFuOm4IZshioao/2inFbHF
	kYj2rO7jyZTP+B8C3t/FueVB8n7hD82cMoxNhCc3piJQ+J3BbpvjA9FaJEdHQyMQ8X5z
	zQQr8yEz+/psKm/NMcHJ8VDdRN4qsZx1PuC5NtiWUc5IzUzeOdnmRQIR3RWltCKCWxkx
	s0Zz6nXvoP1LSGdF5EM9K5zGdENTxI9aCQBwKBEMU5HTTjS8vMX9O6dXbpBSixwEgJx7
	5lzw==
X-Gm-Message-State: AODbwcDkIgXMWzGGtXj/n50e6YmxWQr4PmKnoc58thSU3KLdDnVHFSIn
	M98G2Z1bvM2W7A==
X-Received: by 10.98.71.84 with SMTP id u81mr1183225pfa.102.1495790485732;
	Fri, 26 May 2017 02:21:25 -0700 (PDT)
Received: from control2.hxtcorp.net ([223.203.96.18])
	by smtp.gmail.com with ESMTPSA id b2sm602187pgc.16.2017.05.26.02.21.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 May 2017 02:21:24 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 26 May 2017 17:21:06 +0800
Message-Id: <1495790468-23862-2-git-send-email-zhlcindy@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
References: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH 1/3] arm/virt: Refine fdt_add_cpu_nodes code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Li Zhang <li.zhang@hxt-semitech.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y5hJhJFvpVAA

From: Li Zhang <li.zhang@hxt-semitech.com>

Refind fdt_add_cpu_nodes code and add a new function fdt_add_cpu_node,
which can be called by hot_add_cpu function.

Signed-off-by: Li Zhang <li.zhang@hxt-semitech.com>
---
 hw/arm/virt.c | 106 +++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 61 insertions(+), 45 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c7c8159..73c3cf7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -334,68 +334,84 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL2_IRQ, irqflags);
 }
 
-static void fdt_add_cpu_nodes(const VirtMachineState *vms)
+/*
+ * From Documentation/devicetree/bindings/arm/cpus.txt
+ *  On ARM v8 64-bit systems value should be set to 2,
+ *  that corresponds to the MPIDR_EL1 register size.
+ *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
+ *  in the system, #address-cells can be set to 1, since
+ *  MPIDR_EL1[63:32] bits are not used for CPUs
+ *  identification.
+ *
+ *  Here we actually don't know whether our system is 32- or 64-bit one.
+ *  The simplest way to go is to examine affinity IDs of all our CPUs. If
+ *  at least one of them has Aff3 populated, we set #address-cells to 2.
+ */
+
+static int fdt_get_addr_cells(const VirtMachineState *vms)
 {
     int cpu;
     int addr_cells = 1;
-    const MachineState *ms = MACHINE(vms);
 
-    /*
-     * From Documentation/devicetree/bindings/arm/cpus.txt
-     *  On ARM v8 64-bit systems value should be set to 2,
-     *  that corresponds to the MPIDR_EL1 register size.
-     *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
-     *  in the system, #address-cells can be set to 1, since
-     *  MPIDR_EL1[63:32] bits are not used for CPUs
-     *  identification.
-     *
-     *  Here we actually don't know whether our system is 32- or 64-bit one.
-     *  The simplest way to go is to examine affinity IDs of all our CPUs. If
-     *  at least one of them has Aff3 populated, we set #address-cells to 2.
-     */
     for (cpu = 0; cpu < vms->smp_cpus; cpu++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
-
         if (armcpu->mp_affinity & ARM_AFF3_MASK) {
             addr_cells = 2;
             break;
         }
     }
+    return addr_cells;
+}
 
-    qemu_fdt_add_subnode(vms->fdt, "/cpus");
-    qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
-    qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
 
-    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
-        char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
-        CPUState *cs = CPU(armcpu);
+static void fdt_add_cpu_node(const VirtMachineState *vms, int cpu)
+{
+    char *nodename;
+    int addr_cells = fdt_get_addr_cells(vms);
+    const MachineState *ms = MACHINE(vms);
+    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
+    CPUState *cs = CPU(armcpu);
 
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "device_type", "cpu");
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
-                                    armcpu->dtb_compatible);
-
-        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED
-            && vms->smp_cpus > 1) {
-            qemu_fdt_setprop_string(vms->fdt, nodename,
-                                        "enable-method", "psci");
-        }
+    if (cpu < 0 || cpu >= max_cpus) {
+        error_report("Invalid cpu index.");
+        return;
+    }
 
-        if (addr_cells == 2) {
-            qemu_fdt_setprop_u64(vms->fdt, nodename, "reg",
-                                 armcpu->mp_affinity);
-        } else {
-            qemu_fdt_setprop_cell(vms->fdt, nodename, "reg",
-                                  armcpu->mp_affinity);
-        }
+    nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
 
-        if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
-            qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id",
-                ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
-        }
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename, "device_type", "cpu");
+    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
+                            armcpu->dtb_compatible);
+    if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+        qemu_fdt_setprop_string(vms->fdt, nodename, "enable-method", "psci");
+    }
 
-        g_free(nodename);
+    if (addr_cells == 2) {
+        qemu_fdt_setprop_u64(vms->fdt, nodename, "reg", armcpu->mp_affinity);
+    } else {
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "reg", armcpu->mp_affinity);
+    }
+
+    if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id",
+            ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
+    }
+
+    g_free(nodename);
+}
+
+static void fdt_add_cpu_nodes(const VirtMachineState *vms)
+{
+    int cpu;
+    int addr_cells = fdt_get_addr_cells(vms);
+
+    qemu_fdt_add_subnode(vms->fdt, "/cpus");
+    qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
+    qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
+
+    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
+        fdt_add_cpu_node(vms, cpu);
     }
 }
 
-- 
2.7.4

