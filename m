Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp643360ejc;
        Fri, 13 Jan 2023 12:02:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsga+4kEy4PA9ENihxg+9jSlko9bmtzhaVmvSkzVUpfG5gNJUq8XQxcjEhwpX4bedPnw54l
X-Received: by 2002:a81:1417:0:b0:4ac:ed9d:c0d6 with SMTP id 23-20020a811417000000b004aced9dc0d6mr38073566ywu.44.1673640169167;
        Fri, 13 Jan 2023 12:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673640169; cv=none;
        d=google.com; s=arc-20160816;
        b=OFKw75n0R1jlnuxOw7eck81lghlfmWht+D17isA3/Z+JyJxB6U+Zm/ls128HHQtFx5
         MaXA05A3HSSqLAZ1vnkhE/kcbUlTVoKozWzJ6uaLeod3j+m16QDBqvdmYETqcjDoyQK+
         lPuVsAAryb8BDao46bZEb8HfPbOxhwoNKXhaVUlfQRYKh4bo259AEgqofHhzCnP2Bscz
         PI0ihuyylrPQp54TpTER7BF4IOuYjYJssRcAolt6zBURelH3DUimJv7OeLJevTpMCYUr
         B+xn/H4xUWy9KRpKE+iuOQ8TdbF0YxIIVTc6v4JaYUsw/gbpCsEWQeeJ4JcHl8qwRtT4
         rfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EG3Qe0kxJp7FPfJDFX/WhPOIuV6nKtCj0QjnSu6ovew=;
        b=M2Gn8qlayEjv+tgVUztskxWG3i4msAVR6EOd9SDg3p3dnaxgwjhdCPBfv9FY2SfsKt
         9rfgeBCLlwe3de8m1vyzIcRUyToyXTNxd1m38bCjyt4AgvnhRjB+krhWS1Nu7juU6BbL
         az9kqwjUjKJHHdVSqO9wtcYKYKXW4f9WFaVb90VuGpnV49ZhrGkHbil0GdqwOZ2Uasmd
         YhQwZizFShUwiEpSpDgCkHlysX13fWcKlUikLpCMHaQYU4V2jH8VTFkgWWHQgsegHzAX
         XdYbNrenwN68HU8PZYSJYLFX5tMO8fpSS8HMkyrxziPDD8acMK2YSWHu4xMzu/M9mKuY
         cYDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bCW6+6Y7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u27-20020a37ab1b000000b00706125dd68asi3001588qke.682.2023.01.13.12.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 12:02:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bCW6+6Y7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGQFg-0003h6-U8; Fri, 13 Jan 2023 15:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFb-0003ds-0C
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 15:02:07 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFY-0006nf-M3
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 15:02:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id t5so17639116wrq.1
 for <qemu-arm@nongnu.org>; Fri, 13 Jan 2023 12:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EG3Qe0kxJp7FPfJDFX/WhPOIuV6nKtCj0QjnSu6ovew=;
 b=bCW6+6Y7sYBQTrsIVsNZzG7nNoCZivP0Y218So9k3HSfikw4IhRMbZ4erkiwK8tjgV
 FaC7uoPr3pWL3IoIJo94A5u/up8mzujC0031+EAVmZrorB+alqw552two50hHpszt1Ma
 zfFrCCgxBULncmr0qfZOhrQUzlltXNKQgPV0sHcODz3B9JWNoUVeZHLiGzfxzakh506w
 GiKp49umAXyUMwRjIxX8L6MpKGj5xZMnxjR6to5OF7fZmINePNzcY0grvby670ucJxok
 0WmHD5Ga7UPH5ghitjX3D2mi9MQz4WyJDgBnLJGRc2Ww3utsplQbaGL4ZHNtFmhekGJZ
 FhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EG3Qe0kxJp7FPfJDFX/WhPOIuV6nKtCj0QjnSu6ovew=;
 b=oagum1Dm7mqVBTIVMhvYPnu4yIhVWsrg0F+KScDMhSUESr9cek+sXt2GRebqpyccos
 0lNfLCNI/HrVYZSUOiNrF9ABtFbsziDB+TSBOvKRNhj3qBqAc3N1X0thkyL6eobpTmQD
 NGSt7wRLHrXSArAB8X4fEn0dWqmUlTN0mH5YwQ3SbDrI29oX5nY+0w90ZrOiPEid0qZ/
 HB1vlcoYSRwo/YHvpvh3I0T1Fshjcp93qA7t8+K13ow7uZ99feV8S6rFavKlTOcG3QHp
 hayOrKEsgnXZ5xAzxsEfBE+ERnAG/GScxVODxX0sQR/uqL32Q6ZT8IjPuJ8MKjWY4mvn
 gCGw==
X-Gm-Message-State: AFqh2kpcYhiz0Jst91WbdFm9h+6Kx46N8emrMx225AqLG4izU1nB56L6
 mEFukVWa8lVATceO0Nr4zmCsKQ==
X-Received: by 2002:a5d:6385:0:b0:2bd:e217:e1d with SMTP id
 p5-20020a5d6385000000b002bde2170e1dmr2710419wru.52.1673640123892; 
 Fri, 13 Jan 2023 12:02:03 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bw28-20020a0560001f9c00b002421888a011sm19372771wrb.69.2023.01.13.12.02.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 12:02:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/4] hw: Replace qemu_or_irq typedef by OrIRQState
Date: Fri, 13 Jan 2023 21:01:38 +0100
Message-Id: <20230113200138.52869-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
References: <20230113200138.52869-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XMWe8wIBvwKS

OBJECT_DECLARE_SIMPLE_TYPE() macro provides the OrIRQState
declaration for free. Besides, the QOM code style is to use
the structure name as typedef, and QEMU style is to use Camel
Case, so rename qemu_or_irq as OrIRQState.

Mechanical change using:

  $ sed -i -e 's/qemu_or_irq/OrIRQState/g' $(git grep -l qemu_or_irq)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c                  |  4 ++--
 hw/arm/mps2-tz.c                     |  2 +-
 hw/core/or-irq.c                     | 18 +++++++++---------
 hw/pci-host/raven.c                  |  2 +-
 include/hw/arm/armsse.h              |  6 +++---
 include/hw/arm/bcm2835_peripherals.h |  2 +-
 include/hw/arm/exynos4210.h          |  4 ++--
 include/hw/arm/stm32f205_soc.h       |  2 +-
 include/hw/arm/stm32f405_soc.h       |  2 +-
 include/hw/arm/xlnx-versal.h         |  6 +++---
 include/hw/arm/xlnx-zynqmp.h         |  2 +-
 include/hw/or-irq.h                  |  2 --
 12 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 8dafa2215b..6f2dda13f6 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -507,7 +507,7 @@ static uint64_t exynos4210_calc_affinity(int cpu)
     return (0x9 << ARM_AFF1_SHIFT) | cpu;
 }
 
-static DeviceState *pl330_create(uint32_t base, qemu_or_irq *orgate,
+static DeviceState *pl330_create(uint32_t base, OrIRQState *orgate,
                                  qemu_irq irq, int nreq, int nevents, int width)
 {
     SysBusDevice *busdev;
@@ -806,7 +806,7 @@ static void exynos4210_init(Object *obj)
 
     for (i = 0; i < ARRAY_SIZE(s->pl330_irq_orgate); i++) {
         char *name = g_strdup_printf("pl330-irq-orgate%d", i);
-        qemu_or_irq *orgate = &s->pl330_irq_orgate[i];
+        OrIRQState *orgate = &s->pl330_irq_orgate[i];
 
         object_initialize_child(obj, name, orgate, TYPE_OR_IRQ);
         g_free(name);
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 284c09c91d..07aecd9497 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -152,7 +152,7 @@ struct MPS2TZMachineState {
     TZMSC msc[4];
     CMSDKAPBUART uart[6];
     SplitIRQ sec_resp_splitter;
-    qemu_or_irq uart_irq_orgate;
+    OrIRQState uart_irq_orgate;
     DeviceState *lan9118;
     SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ_MAX];
     Clock *sysclk;
diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
index d8f3754e96..1df4bc05a7 100644
--- a/hw/core/or-irq.c
+++ b/hw/core/or-irq.c
@@ -31,7 +31,7 @@
 
 static void or_irq_handler(void *opaque, int n, int level)
 {
-    qemu_or_irq *s = OR_IRQ(opaque);
+    OrIRQState *s = OR_IRQ(opaque);
     int or_level = 0;
     int i;
 
@@ -46,7 +46,7 @@ static void or_irq_handler(void *opaque, int n, int level)
 
 static void or_irq_reset(DeviceState *dev)
 {
-    qemu_or_irq *s = OR_IRQ(dev);
+    OrIRQState *s = OR_IRQ(dev);
     int i;
 
     for (i = 0; i < MAX_OR_LINES; i++) {
@@ -56,7 +56,7 @@ static void or_irq_reset(DeviceState *dev)
 
 static void or_irq_realize(DeviceState *dev, Error **errp)
 {
-    qemu_or_irq *s = OR_IRQ(dev);
+    OrIRQState *s = OR_IRQ(dev);
 
     assert(s->num_lines <= MAX_OR_LINES);
 
@@ -65,7 +65,7 @@ static void or_irq_realize(DeviceState *dev, Error **errp)
 
 static void or_irq_init(Object *obj)
 {
-    qemu_or_irq *s = OR_IRQ(obj);
+    OrIRQState *s = OR_IRQ(obj);
 
     qdev_init_gpio_out(DEVICE(obj), &s->out_irq, 1);
 }
@@ -84,7 +84,7 @@ static void or_irq_init(Object *obj)
 
 static bool vmstate_extras_needed(void *opaque)
 {
-    qemu_or_irq *s = OR_IRQ(opaque);
+    OrIRQState *s = OR_IRQ(opaque);
 
     return s->num_lines >= OLD_MAX_OR_LINES;
 }
@@ -95,7 +95,7 @@ static const VMStateDescription vmstate_or_irq_extras = {
     .minimum_version_id = 1,
     .needed = vmstate_extras_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_VARRAY_UINT16_UNSAFE(levels, qemu_or_irq, num_lines, 0,
+        VMSTATE_VARRAY_UINT16_UNSAFE(levels, OrIRQState, num_lines, 0,
                                      vmstate_info_bool, bool),
         VMSTATE_END_OF_LIST(),
     },
@@ -106,7 +106,7 @@ static const VMStateDescription vmstate_or_irq = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_BOOL_SUB_ARRAY(levels, qemu_or_irq, 0, OLD_MAX_OR_LINES),
+        VMSTATE_BOOL_SUB_ARRAY(levels, OrIRQState, 0, OLD_MAX_OR_LINES),
         VMSTATE_END_OF_LIST(),
     },
     .subsections = (const VMStateDescription*[]) {
@@ -116,7 +116,7 @@ static const VMStateDescription vmstate_or_irq = {
 };
 
 static Property or_irq_properties[] = {
-    DEFINE_PROP_UINT16("num-lines", qemu_or_irq, num_lines, 1),
+    DEFINE_PROP_UINT16("num-lines", OrIRQState, num_lines, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -136,7 +136,7 @@ static void or_irq_class_init(ObjectClass *klass, void *data)
 static const TypeInfo or_irq_type_info = {
    .name = TYPE_OR_IRQ,
    .parent = TYPE_DEVICE,
-   .instance_size = sizeof(qemu_or_irq),
+   .instance_size = sizeof(OrIRQState),
    .instance_init = or_irq_init,
    .class_init = or_irq_class_init,
 };
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 2c96ddf8fe..5e0a5b9303 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -60,7 +60,7 @@ DECLARE_INSTANCE_CHECKER(PREPPCIState, RAVEN_PCI_HOST_BRIDGE,
 struct PRePPCIState {
     PCIHostState parent_obj;
 
-    qemu_or_irq *or_irq;
+    OrIRQState *or_irq;
     qemu_irq pci_irqs[PCI_NUM_PINS];
     PCIBus pci_bus;
     AddressSpace pci_io_as;
diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 9648e7a419..cd0931d0a0 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -155,12 +155,12 @@ struct ARMSSE {
     TZPPC apb_ppc[NUM_INTERNAL_PPCS];
     TZMPC mpc[IOTS_NUM_MPC];
     CMSDKAPBTimer timer[3];
-    qemu_or_irq ppc_irq_orgate;
+    OrIRQState ppc_irq_orgate;
     SplitIRQ sec_resp_splitter;
     SplitIRQ ppc_irq_splitter[NUM_PPCS];
     SplitIRQ mpc_irq_splitter[IOTS_NUM_EXP_MPC + IOTS_NUM_MPC];
-    qemu_or_irq mpc_irq_orgate;
-    qemu_or_irq nmi_orgate;
+    OrIRQState mpc_irq_orgate;
+    OrIRQState nmi_orgate;
 
     SplitIRQ cpu_irq_splitter[NUM_SSE_IRQS];
 
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index c9d25d493e..d724a2fc28 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -56,7 +56,7 @@ struct BCM2835PeripheralState {
     BCM2835AuxState aux;
     BCM2835FBState fb;
     BCM2835DMAState dma;
-    qemu_or_irq orgated_dma_irq;
+    OrIRQState orgated_dma_irq;
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835RngState rng;
diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 97353f1c02..68db19f0cb 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -96,8 +96,8 @@ struct Exynos4210State {
     MemoryRegion boot_secondary;
     MemoryRegion bootreg_mem;
     I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
-    qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
-    qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
+    OrIRQState pl330_irq_orgate[EXYNOS4210_NUM_DMA];
+    OrIRQState cpu_irq_orgate[EXYNOS4210_NCPUS];
     A9MPPrivState a9mpcore;
     Exynos4210GicState ext_gic;
     Exynos4210CombinerState int_combiner;
diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 849d3ed889..5a4f776264 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -63,7 +63,7 @@ struct STM32F205State {
     STM32F2XXADCState adc[STM_NUM_ADCS];
     STM32F2XXSPIState spi[STM_NUM_SPIS];
 
-    qemu_or_irq *adc_irqs;
+    OrIRQState *adc_irqs;
 
     MemoryRegion sram;
     MemoryRegion flash;
diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index 249ab5434e..c968ce3ab2 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -63,7 +63,7 @@ struct STM32F405State {
     STM32F4xxExtiState exti;
     STM32F2XXUsartState usart[STM_NUM_USARTS];
     STM32F2XXTimerState timer[STM_NUM_TIMERS];
-    qemu_or_irq adc_irqs;
+    OrIRQState adc_irqs;
     STM32F2XXADCState adc[STM_NUM_ADCS];
     STM32F2XXSPIState spi[STM_NUM_SPIS];
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index cbe8a19c10..b6786e9832 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -85,7 +85,7 @@ struct Versal {
         } rpu;
 
         struct {
-            qemu_or_irq irq_orgate;
+            OrIRQState irq_orgate;
             XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
         } xram;
 
@@ -103,7 +103,7 @@ struct Versal {
                 XlnxCSUDMA dma_src;
                 XlnxCSUDMA dma_dst;
                 MemoryRegion linear_mr;
-                qemu_or_irq irq_orgate;
+                OrIRQState irq_orgate;
             } ospi;
         } iou;
 
@@ -113,7 +113,7 @@ struct Versal {
         XlnxVersalEFuseCtrl efuse_ctrl;
         XlnxVersalEFuseCache efuse_cache;
 
-        qemu_or_irq apb_irq_orgate;
+        OrIRQState apb_irq_orgate;
     } pmc;
 
     struct {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 20bdf894aa..687c75e3b0 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -130,7 +130,7 @@ struct XlnxZynqMPState {
     XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
-    qemu_or_irq qspi_irq_orgate;
+    OrIRQState qspi_irq_orgate;
     XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
     CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index 131abc2e0c..c0a42f3711 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -35,8 +35,6 @@
  */
 #define MAX_OR_LINES      48
 
-typedef struct OrIRQState qemu_or_irq;
-
 OBJECT_DECLARE_SIMPLE_TYPE(OrIRQState, OR_IRQ)
 
 struct OrIRQState {
-- 
2.38.1

