Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp2044870ejb;
        Mon, 24 Jul 2023 10:44:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGZW2CZM+gOh2B1VhNWSnFgfYGltWMLfFygwF9KAoAfOjMjvcpzvuYHyBlSxLBfAli2rynE
X-Received: by 2002:a05:620a:e10:b0:767:6854:e92d with SMTP id y16-20020a05620a0e1000b007676854e92dmr400849qkm.44.1690220696933;
        Mon, 24 Jul 2023 10:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690220696; cv=none;
        d=google.com; s=arc-20160816;
        b=PEH8E9Pivs+S5vqWL3xaczlC6ItbwbigpYp+5l/8KAZPgPsRQxNHTxsrT62bOX4QJs
         nEUVfWYyAIDm1ZUCNnnpO6veVmhNUSgPC8P9MxF73yJ9d0ySCz8r3tDQP3I5eUfS3k6l
         JzcR6LrIxmCC1l0Pnkzz7oINByL19pRId8zv/yJgI6D6YWMCuEOE1lo5Ga/156t1wmNx
         IcyY5MJWSheE+Dx0KOO5xYHijsh6brxgSAHSuTsEXa/6vXQXeDTGzP0ok53LZuSoSuOA
         PnhOC8eu+NlH0BOoOnQG6qmi2CZH8b+tK67C/DK4Q0IQ9UtfhpSEV90GikXZHN+ClzQw
         FyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=a2KWVSQCGmikjbNSEBz2hoiYwpNVnu1J1WGWnTVXVm4=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=rXI+BYTklEIVqnOYDO+iJWHQLC2Y5WW0YcvSuKenWHaXsr20oBJjAmqYSXHonXL9ZQ
         9/dY9WCucZod505sUUCvark3NTQuQnSXQNAfuxbknijB+YNtjcFu8HYKAS3EFahZFvX2
         WGCNivCOV3eiGkvcGNaxv5gxadzr2TWucshTviWI6F8bz4AymduObJfljdjbgsGF7f6L
         Am77fd3CKk3832zioxKaiXpHPw44x5L8ZBcIIWs821boB9CP+WRG155FZRVI6g+uMZK1
         rL6c/xDAABdKEuVHIg4D94HNqpooauNJitngsNm6CWKC5qjNXEkhX7hyJ0gYElZiqfCq
         15rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kBZUTiWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020a05620a28d600b00768ca9bff33si5464993qkp.321.2023.07.24.10.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 10:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kBZUTiWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNzb6-0007D0-1h; Mon, 24 Jul 2023 13:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNzb1-0007Ar-R2
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 13:43:49 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNzaw-0004Hm-NW
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 13:43:47 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so67382891fa.2
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690220619; x=1690825419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a2KWVSQCGmikjbNSEBz2hoiYwpNVnu1J1WGWnTVXVm4=;
 b=kBZUTiWxCmq20F5AW6pUUGPD1UQ2MxgRAHC5TBqkwekzVtFkC4XWFM1JLJDdtmuMA5
 tA3nukCWlmUhD/BbaLw/ITVwcVq6z9g54k4hdhfciQzithmoKCujE7/M5W68FmHuZczO
 XBEAddijoluZjG02Vnt4FUG1RDRKxF8yI3X7M1cP5KjgLbMR2eONCxtngtkhmKZIx5ru
 0kKLnwlvrfzG2AFaZdgChJ6wYhYnFDjo/vTr9zZjKyrZE3WuN7vJ942S/Ic5C4bHKVZH
 xc3sJOMYrYcFKigp7e9gCwW8vP7MvY7xCYDUYnw1H4c27eLz03cuHEOCp6EOneoPE/j4
 RsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690220619; x=1690825419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2KWVSQCGmikjbNSEBz2hoiYwpNVnu1J1WGWnTVXVm4=;
 b=jvkt++HtLOW4biE2tXXswj6MzFjgMNgbMn1MVOj7+59TImUuUQaN1J2StCb4QlpePI
 tIVpebqOzs4Mj0kS9MPhp5pJsGmMAkGjKOgEXLH/agzPFj5QeqvsKb38kFnvAwct9ff2
 aahM60Qd+2PHyg/9X/Q+rM/K6CkIgxUFNbuySqAmmHoRJn4HNhE6N04pPLxX5BU9EQtu
 VQRhObQaLf8bsfSlUSmzdaFZ6YpmbLX6v69+Y7wLnB/LA2LZr4oa4Oa8klyLrrhBc2/H
 ItzzemT4WmpWlKpvRupVJoxhyDQy4o115HSSBsZualjsl3XUJsTR7rDO4QtKJEJPeA/4
 7vEw==
X-Gm-Message-State: ABy/qLY3ejeonI7bnJ7ta15BfU4IZToiZXzfluhwmAkbqSsISaVDqn5r
 TJuR69S0IrDZPgsq/rFG0eqCqz0S4uSdIGGiu/k=
X-Received: by 2002:a2e:3c11:0:b0:2b1:ed29:7c47 with SMTP id
 j17-20020a2e3c11000000b002b1ed297c47mr6030465lja.8.1690220619303; 
 Mon, 24 Jul 2023 10:43:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a0560001b0300b0030e52d4c1bcsm13687423wrz.71.2023.07.24.10.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 10:43:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.2 3/3] hw/arm: Set number of MPU regions correctly for
 an505, an521, an524
Date: Mon, 24 Jul 2023 18:43:35 +0100
Message-Id: <20230724174335.2150499-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724174335.2150499-1-peter.maydell@linaro.org>
References: <20230724174335.2150499-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 7BKwnPZYb/Vm

The IoTKit, SSE200 and SSE300 all default to 8 MPU regions.  The
MPS2/MPS3 FPGA images don't override these except in the case of
AN547, which uses 16 MPU regions.

Define properties on the ARMSSE object for the MPU regions (using the
same names as the documented RTL configuration settings, and
following the pattern we already have for this device of using
all-caps names as the RTL does), and set them in the board code.

We don't actually need to override the default except on AN547,
but it's simpler code to have the board code set them always
rather than tracking which board subtypes want to set them to
a non-default value separately from what that value is.

Tho overall effect is that for mps2-an505, mps2-an521 and mps3-an524
we now correctly use 8 MPU regions, while mps3-an547 stays at its
current 16 regions.

It's possible some guest code wrongly depended on the previous
incorrectly modeled number of memory regions. (Such guest code
should ideally check the number of regions via the MPU_TYPE
register.) The old behaviour can be obtained with additional
-global arguments to QEMU:

For mps2-an521 and mps2-an524:
 -global sse-200.CPU0_MPU_NS=16 -global sse-200.CPU0_MPU_S=16 -global sse-200.CPU1_MPU_NS=16 -global sse-200.CPU1_MPU_S=16

For mps2-an505:
 -global sse-200.CPU0_MPU_NS=16 -global sse-200.CPU0_MPU_S=16

NB that the way the implementation allows this use of -global
is slightly fragile: if the board code explicitly sets the
properties on the sse-200 object, this overrides the -global
command line option. So we rely on:
 - the boards that need fixing all happen to use the SSE defaults
 - we can write the board code to only set the property if it
   is different from the default, rather than having all boards
   explicitly set the property
 - the board that does need to use a non-default value happens
   to need to set it to the same value (16) we previously used
This works, but there are some kinds of refactoring of the
mps2-tz.c code that would break the support for -global here.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1772
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'm not super-enthusiastic about the -global handling here, as you
may have guessed from the wording above, though it does avoid having
explicit back-compat code.  The other option for back-compat would be
to add an explicit board property to say "use the old values".
---
 include/hw/arm/armsse.h |  5 +++++
 hw/arm/armsse.c         | 16 ++++++++++++++++
 hw/arm/mps2-tz.c        | 29 +++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index cd0931d0a0b..88b3b759c5a 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -56,6 +56,9 @@
  *    (matching the hardware) is that for CPU0 in an IoTKit and CPU1 in an
  *    SSE-200 both are present; CPU0 in an SSE-200 has neither.
  *    Since the IoTKit has only one CPU, it does not have the CPU1_* properties.
+ *  + QOM properties "CPU0_MPU_NS", "CPU0_MPU_S", "CPU1_MPU_NS" and "CPU1_MPU_S"
+ *    which set the number of MPU regions on the CPUs. If there is only one
+ *    CPU the CPU1 properties are not present.
  *  + Named GPIO inputs "EXP_IRQ" 0..n are the expansion interrupts for CPU 0,
  *    which are wired to its NVIC lines 32 .. n+32
  *  + Named GPIO inputs "EXP_CPU1_IRQ" 0..n are the expansion interrupts for
@@ -221,6 +224,8 @@ struct ARMSSE {
     uint32_t exp_numirq;
     uint32_t sram_addr_width;
     uint32_t init_svtor;
+    uint32_t cpu_mpu_ns[SSE_MAX_CPUS];
+    uint32_t cpu_mpu_s[SSE_MAX_CPUS];
     bool cpu_fpu[SSE_MAX_CPUS];
     bool cpu_dsp[SSE_MAX_CPUS];
 };
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 0202bad787b..11cd08b6c1e 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -85,6 +85,8 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
     DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
+    DEFINE_PROP_UINT32("CPU0_MPU_NS", ARMSSE, cpu_mpu_ns[0], 8),
+    DEFINE_PROP_UINT32("CPU0_MPU_S", ARMSSE, cpu_mpu_s[0], 8),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -98,6 +100,10 @@ static Property sse200_properties[] = {
     DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], false),
     DEFINE_PROP_BOOL("CPU1_FPU", ARMSSE, cpu_fpu[1], true),
     DEFINE_PROP_BOOL("CPU1_DSP", ARMSSE, cpu_dsp[1], true),
+    DEFINE_PROP_UINT32("CPU0_MPU_NS", ARMSSE, cpu_mpu_ns[0], 8),
+    DEFINE_PROP_UINT32("CPU0_MPU_S", ARMSSE, cpu_mpu_s[0], 8),
+    DEFINE_PROP_UINT32("CPU1_MPU_NS", ARMSSE, cpu_mpu_ns[1], 8),
+    DEFINE_PROP_UINT32("CPU1_MPU_S", ARMSSE, cpu_mpu_s[1], 8),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -109,6 +115,8 @@ static Property sse300_properties[] = {
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
     DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
+    DEFINE_PROP_UINT32("CPU0_MPU_NS", ARMSSE, cpu_mpu_ns[0], 8),
+    DEFINE_PROP_UINT32("CPU0_MPU_S", ARMSSE, cpu_mpu_s[0], 8),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -1029,6 +1037,14 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
         }
+        if (!object_property_set_uint(cpuobj, "mpu-ns-regions",
+                                      s->cpu_mpu_ns[i], errp)) {
+            return;
+        }
+        if (!object_property_set_uint(cpuobj, "mpu-s-regions",
+                                      s->cpu_mpu_s[i], errp)) {
+            return;
+        }
 
         if (i > 0) {
             memory_region_add_subregion_overlap(&s->cpu_container[i], 0,
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 07aecd9497d..9cda3c86388 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -124,6 +124,10 @@ struct MPS2TZMachineClass {
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     uint32_t init_svtor; /* init-svtor setting for SSE */
     uint32_t sram_addr_width; /* SRAM_ADDR_WIDTH setting for SSE */
+    uint32_t cpu0_mpu_ns; /* CPU0_MPU_NS setting for SSE */
+    uint32_t cpu0_mpu_s; /* CPU0_MPU_S setting for SSE */
+    uint32_t cpu1_mpu_ns; /* CPU1_MPU_NS setting for SSE */
+    uint32_t cpu1_mpu_s; /* CPU1_MPU_S setting for SSE */
     const RAMInfo *raminfo;
     const char *armsse_type;
     uint32_t boot_ram_size; /* size of ram at address 0; 0 == find in raminfo */
@@ -183,6 +187,9 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 #define MPS3_DDR_SIZE (2 * GiB)
 #endif
 
+/* For cpu{0,1}_mpu_{ns,s}, means "leave at SSE's default value" */
+#define MPU_REGION_DEFAULT UINT32_MAX
+
 static const uint32_t an505_oscclk[] = {
     40000000,
     24580000,
@@ -828,6 +835,20 @@ static void mps2tz_common_init(MachineState *machine)
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
     qdev_prop_set_uint32(iotkitdev, "init-svtor", mmc->init_svtor);
+    if (mmc->cpu0_mpu_ns != MPU_REGION_DEFAULT) {
+        qdev_prop_set_uint32(iotkitdev, "CPU0_MPU_NS", mmc->cpu0_mpu_ns);
+    }
+    if (mmc->cpu0_mpu_s != MPU_REGION_DEFAULT) {
+        qdev_prop_set_uint32(iotkitdev, "CPU0_MPU_S", mmc->cpu0_mpu_s);
+    }
+    if (object_property_find(OBJECT(iotkitdev), "CPU1_MPU_NS")) {
+        if (mmc->cpu1_mpu_ns != MPU_REGION_DEFAULT) {
+            qdev_prop_set_uint32(iotkitdev, "CPU1_MPU_NS", mmc->cpu1_mpu_ns);
+        }
+        if (mmc->cpu1_mpu_s != MPU_REGION_DEFAULT) {
+            qdev_prop_set_uint32(iotkitdev, "CPU1_MPU_S", mmc->cpu1_mpu_s);
+        }
+    }
     qdev_prop_set_uint32(iotkitdev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
@@ -1256,10 +1277,17 @@ static void mps2tz_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(oc);
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
 
     mc->init = mps2tz_common_init;
     mc->reset = mps2_machine_reset;
     iic->check = mps2_tz_idau_check;
+
+    /* Most machines leave these at the SSE defaults */
+    mmc->cpu0_mpu_ns = MPU_REGION_DEFAULT;
+    mmc->cpu0_mpu_s = MPU_REGION_DEFAULT;
+    mmc->cpu1_mpu_ns = MPU_REGION_DEFAULT;
+    mmc->cpu1_mpu_s = MPU_REGION_DEFAULT;
 }
 
 static void mps2tz_set_default_ram_info(MPS2TZMachineClass *mmc)
@@ -1396,6 +1424,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 96;
     mmc->uart_overflow_irq = 48;
     mmc->init_svtor = 0x00000000;
+    mmc->cpu0_mpu_s = mmc->cpu0_mpu_ns = 16;
     mmc->sram_addr_width = 21;
     mmc->raminfo = an547_raminfo;
     mmc->armsse_type = TYPE_SSE300;
-- 
2.34.1

