Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3490261ejb;
        Tue, 19 Sep 2023 03:13:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcA+WsP5nzGHU+H0N8kpiyVtu1IqpcWfhuN9a2UGGHW4I3ZlEgK+yWpJ6Ufr+jEkD5Qcrf
X-Received: by 2002:a05:620a:560c:b0:765:d53e:3352 with SMTP id vu12-20020a05620a560c00b00765d53e3352mr10874757qkn.30.1695118405244;
        Tue, 19 Sep 2023 03:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695118405; cv=none;
        d=google.com; s=arc-20160816;
        b=itG+r8NTioW8r1zBihLcQ0yJPw0fy4iCq6MRpwKs/OCq7aL0Vl7YC9AEd2jyiKfJJh
         1+Af4R4HlkSnxbXduitx9wmS6sGfbeZKi06bbyq3ugkm19H52IW3K5cHv8u0J/0BXY8d
         dsT+4jTQiGKc/dhIHIF+IJGAYZ627VHTjTjghlV7HbMKammktpuvYyfkoO7rsrVahZG9
         E4VSqsoEGUL/pOQ3bqBsDYJlXLczGyaI9w0jZh95ETe8aOV1K8/yL+9M9KZ+OLdNWnEO
         KK1i7zbCQhTX3SwmgUf6hqvj8aRgqiK5/t7L3pHaNKIzcerabtQGjIoH4BJpWtziXikQ
         jZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j8JmbSqEXt6UMOnruJcxa+Gd6UTGS29A+j/7/Q5TP94=;
        fh=VnLaRVPcN1gpaQWLnE0jAsSHd7/auwbL0WCytLamgZU=;
        b=DjDfbjiU8YW6ibNa5nBTbYEdWgqCuVOtjgl1pcOV5pE1PGF2rMsmAfvs9WfKn8feCq
         HLsX9WGBSKEaLQgvLprNO+x1pRbr0zheD0yTbRpBQH6SHaKOUOEyues4nY5vZUHgUvce
         uS/5121HLSbsHdbwdP5mcTspr7i79RPf3NZN9MUjnewVI6ufD0RTaCM2UwkRYpxMLvVk
         5oGC1GVPIPxEqUnul/RL7sGK0zA6WJ+flMb61LNhcR4X5NB5yrSoL6DcUCiULIDMlsrR
         YEipffcp1Fttl90LUdbDC9ajODJTLoRB+YX/f4Czw/hDeDmXWBtetBoo0kzllHRHU08C
         LblQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDS4TC21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05620a254d00b0076d512665d7si7508872qko.627.2023.09.19.03.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 03:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDS4TC21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qiXiy-0003JW-HN; Tue, 19 Sep 2023 06:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiXiq-0003Ek-Vr
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 06:12:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiXin-0005M1-FC
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 06:12:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-401b5516104so58966575e9.2
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 03:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695118364; x=1695723164; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8JmbSqEXt6UMOnruJcxa+Gd6UTGS29A+j/7/Q5TP94=;
 b=eDS4TC21ogB5QqxpQOBUftpGZl/vWPQM5H15xyAj7O8KKOl+bG3PAVMvGyEG8BWA+b
 Rf3gjZbLuKXzoqQqKC8QnWq9a0HOb4sn7DJo6fJ5UIdBWpocM/UpEEW3DQEhD8Q6R7Nm
 KLZaRP/3D2e30asarpJCZ6ndSMqoM5f6JYxrWQXugJH91HVkePVqrWAtfm94qww67yP0
 6vBmFzOmarcBzw4cv2mkgnb6riSkiG4nRU2EQp7hk0vsKiPP2awZwIdm5OWSqDtiCQPc
 +r5aE+saLpSt1K5eXRXcrEirwdncBnzKkZ29eb/qd+l9fDJPCxXKfoq6xY+L4ydL4tra
 6EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695118364; x=1695723164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j8JmbSqEXt6UMOnruJcxa+Gd6UTGS29A+j/7/Q5TP94=;
 b=PW1paxwgdARm98+sXn73rSrc+WnGHaEHv/WTtoxsUoHUSmPVNZq62R90gc2NjJ9SBd
 IlyIVMwgPPomECr/mxE7GzzOja29X0iH1q+jjT/0EET1RfRcmMgdnc3+ZdY0TxDD/7JA
 RLfNnZWXfBHFrLof5f6mhDis7KDhNUVkyO/7Z4nSqB9gppq3nYb/bNCtgvWKBrzJ4ZWu
 pibs934mvMQ/byMCM/mAyUmFnnYBV5BXPBwl2/tMVsSp1ZGC+0TzgZTkNKG2FSVkq73n
 i59lTOC0Di9tqCZaaFaAeT0NZ8IS56ig6Q7iSwT4SDnBorV0rS0q2kJpLvyeCoaoRKFf
 aYnA==
X-Gm-Message-State: AOJu0Yxf3zpaQTObjrt/1QONwrNHz4LrXEz3E1eO4FqWrmssB4+zZevr
 5UvKtU9IOMLdbkqFYjMt+qlHBr+11VoRLFfxK08=
X-Received: by 2002:a5d:66c7:0:b0:316:f24b:597a with SMTP id
 k7-20020a5d66c7000000b00316f24b597amr10388719wrw.46.1695118363947; 
 Tue, 19 Sep 2023 03:12:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ba13-20020a0560001c0d00b0031ddf6cc89csm12290136wrb.98.2023.09.19.03.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 03:12:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [RFC 2/3] hw/arm/virt: Wire up non-secure EL2 virtual timer IRQ
Date: Tue, 19 Sep 2023 11:12:39 +0100
Message-Id: <20230919101240.2569334-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919101240.2569334-1-peter.maydell@linaro.org>
References: <20230919101240.2569334-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /tterYfEJaqx

Armv8.1+ CPUs have the Virtual Host Extension (VHE) which adds
a non-secure EL2 virtual timer. We implemented the timer itself
in the CPU model, but never wired up its IRQ line to the GIC.

Wire up the IRQ line (this is always safe whether the CPU has the
interrupt or not, since it always creates the outbound IRQ line).
Report it to the guest via dtb and ACPI if the CPU has the feature.

The DTB binding is documented in the kernel's
Documentation/devicetree/bindings/timer/arm\,arch_timer.yaml
and the ACPI table entries are documented in the ACPI
specification version 6.3 or later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h    |  2 ++
 hw/arm/virt-acpi-build.c | 16 ++++++++++++----
 hw/arm/virt.c            | 29 ++++++++++++++++++++++++++++-
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e1ddbea96be..79b1f9b737d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -49,6 +49,7 @@
 #define ARCH_TIMER_S_EL1_IRQ  13
 #define ARCH_TIMER_NS_EL1_IRQ 14
 #define ARCH_TIMER_NS_EL2_IRQ 10
+#define ARCH_TIMER_NS_EL2_VIRT_IRQ 12
 
 #define VIRTUAL_PMU_IRQ 7
 
@@ -183,6 +184,7 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    bool ns_el2_virt_timer_present;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6b674231c27..7bc120a0f13 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -573,8 +573,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 /*
- * ACPI spec, Revision 5.1
- * 5.2.24 Generic Timer Description Table (GTDT)
+ * ACPI spec, Revision 6.5
+ * 5.2.25 Generic Timer Description Table (GTDT)
  */
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -588,7 +588,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     uint32_t irqflags = vmc->claim_edge_triggered_timers ?
         1 : /* Interrupt is Edge triggered */
         0;  /* Interrupt is Level triggered  */
-    AcpiTable table = { .sig = "GTDT", .rev = 2, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "GTDT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
 
     acpi_table_begin(&table, table_data);
@@ -624,7 +624,15 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, 0, 4);
     /* Platform Timer Offset */
     build_append_int_noprefix(table_data, 0, 4);
-
+    if (vms->ns_el2_virt_timer_present) {
+        /* Virtual EL2 Timer GSIV */
+        build_append_int_noprefix(table_data, ARCH_TIMER_NS_EL2_VIRT_IRQ + 16, 4);
+        /* Virtual EL2 Timer Flags */
+        build_append_int_noprefix(table_data, irqflags, 4);
+    } else {
+        build_append_int_noprefix(table_data, 0, 4);
+        build_append_int_noprefix(table_data, 0, 4);
+    }
     acpi_table_end(linker, &table);
 }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8ad78b23c24..4df7cd0a366 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -248,6 +248,19 @@ static void create_randomness(MachineState *ms, const char *node)
     qemu_fdt_setprop(ms->fdt, node, "rng-seed", seed.rng, sizeof(seed.rng));
 }
 
+/*
+ * The CPU object always exposes the NS EL2 virt timer IRQ line,
+ * but we don't want to advertise it to the guest in the dtb or ACPI
+ * table unless it's really going to do something.
+ */
+static bool ns_el2_virt_timer_present(void)
+{
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
+    CPUARMState *env = &cpu->env;
+
+    return arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu);
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -365,11 +378,20 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
                                 "arm,armv7-timer");
     }
     qemu_fdt_setprop(ms->fdt, "/timer", "always-on", NULL, 0);
-    qemu_fdt_setprop_cells(ms->fdt, "/timer", "interrupts",
+    if (vms->ns_el2_virt_timer_present) {
+        qemu_fdt_setprop_cells(ms->fdt, "/timer", "interrupts",
+                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_S_EL1_IRQ, irqflags,
+                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL1_IRQ, irqflags,
+                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_VIRT_IRQ, irqflags,
+                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL2_IRQ, irqflags,
+                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL2_VIRT_IRQ, irqflags);
+    } else {
+        qemu_fdt_setprop_cells(ms->fdt, "/timer", "interrupts",
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_S_EL1_IRQ, irqflags,
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL1_IRQ, irqflags,
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_VIRT_IRQ, irqflags,
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL2_IRQ, irqflags);
+    }
 }
 
 static void fdt_add_cpu_nodes(const VirtMachineState *vms)
@@ -810,6 +832,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
             [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
             [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
             [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
+            [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
         };
 
         for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
@@ -2249,6 +2272,10 @@ static void machvirt_init(MachineState *machine)
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
         object_unref(cpuobj);
     }
+
+    /* Now we've created the CPUs we can see if they have the hypvirt timer */
+    vms->ns_el2_virt_timer_present = ns_el2_virt_timer_present();
+
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
 
-- 
2.34.1

