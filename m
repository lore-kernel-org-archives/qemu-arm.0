Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2191607lfm;
        Sun, 28 Jun 2020 07:24:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzafWwU+r+0JlIgSS5l1WnB47PzQxbN9Xb4E5R/9oa7kIPb33+ZfaS8dZWqO5qs/oEtUP3O
X-Received: by 2002:a25:cd87:: with SMTP id d129mr18369067ybf.395.1593354289743;
        Sun, 28 Jun 2020 07:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354289; cv=none;
        d=google.com; s=arc-20160816;
        b=AKV5W2K/hfPlh1vZSBsOEjS7dEbRZSNG5cn+ohI/SRUFEOcENj0ezkmiGK1oCfwytT
         YQ9X2hOm5+UnZN7KewxFifA1MLpxgIjcUZUB3gdtO2X2Wloyf9XkUhjmQ1qmd4x4b3B6
         TUyMqRwCumy0ViP0mpSU359zzv9w4REPbZ8RvgK21n0AC8H3lTrmy9gTLQhddMmJVLPZ
         CcLaST8aP91iSB/JrwAqYhpW4CTeL4E8V4Ff2O4zqCGlBQD2GeMopTZDTvRiGJOGmGuv
         YHeDnvFRdTLFR/M6ZeBdPozTWu7nsWj0Z4U6vecxsEWhITWCxBHCi/sD07hUD+RrYOX6
         LnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lUUWbbu7Y8pmzdSQjUCbPf/b5nShrOK6vJIrYmJ3aOc=;
        b=0B46wARCgQR0HdLfczRarcSSPgkCZnGI4qpSmi1GL9NgWb2cb1En2XAv2bde2LJHNw
         oO/ywhhxSFYRQ50LyYipDWMw6Et+R/0/JDO7ad/vvJw2DxQtFiF2RsrKAZuDbkCNHutS
         bPwlrY5yHw0pQQK4JpqPZ00BVQ02zPFewd7Oz3Np1v6qq/G/+RYY2RYslqRBLZHw/Nci
         k03efjQiYPeivyJ8MeMBQdXi2j9sN4B2LPP905OHIEaahavRoRwGn/g5L9Mh4hSaxQf7
         Ptz6XWu2i7HBVu8zKezFBiv16ZwYw+pwZriCoHHAX/CBfh4H1yM31uYb6GTycI5w1kKP
         PACg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZZzEqCiy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si30625690yby.400.2020.06.28.07.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZZzEqCiy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYEj-0005y2-24
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEZ-0005wJ-Bt
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:39 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEW-0004eF-DR
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:39 -0400
Received: by mail-wm1-x341.google.com with SMTP id l2so12195199wmf.0
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUUWbbu7Y8pmzdSQjUCbPf/b5nShrOK6vJIrYmJ3aOc=;
 b=ZZzEqCiyHqW66MeLyTjP6vdAo8NAw9KQQfwr1KQOVSrSa+5K6iYED4zAnbSheORO5y
 UJbIO2Sb99u42fB1TFBVBHOxla60EOQJKIpffcza/HNDpV3lqUpQWwz7AsVSGh1x8vQM
 kjlBzoFu+vk7HWyae5joXbZ6X2pvtLW5pcsniIxdbO94lqIhL9VGFMwCnLCp93cnDM4I
 XXtuiMMFvwOQVvfLlIOWKMod7sf/pXTTjvtxYxZGtBNRg0bYec4qLMO6av1kM+Vdyua/
 x6hB4j+nVvJEACLjUhpsEcjtlGBjG3XZcYn3sGZShrs+LqTtf7NLUXB/majZfmmQZKfI
 A/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUUWbbu7Y8pmzdSQjUCbPf/b5nShrOK6vJIrYmJ3aOc=;
 b=teeiNp/er5/lP3F9rgcLV3VthGmbLle9iHKLsHbAnlbld99slB9hlQQDHOKKvv3lDy
 g5n7HZbQx38JxoLMezso23qqpwpwfDSR6Jj/OdD5NqbKSLI1zjavtDagSj518GPkLdfr
 QkM6+7lem2iVleRAl+jiviQljQC5cThmTChbSELtMJZDoYB+fa2SBvlShg8d97Y8F3et
 9n8WTASVZEx7eFvlzBEExUtMhboVz/8EaBtm/SK/UqE5VfRMNcfzvvDe1ZWBnzEh25y3
 lZt3dKq/RfhonZV997+YbW/jsfwAx8pngNA2Q3FQwltyaezUFT14rfV4NESmBiNZo8bO
 kVtw==
X-Gm-Message-State: AOAM530FyCwMsuQ7VGTXMBIALl8Bpont3RUDQLsPMJXLVh+BtEiO/FKX
 7fpWNovPyroBmPHVThf2tX0JStHXQbkE2g==
X-Received: by 2002:a1c:99c2:: with SMTP id b185mr13520572wme.52.1593354274670; 
 Sun, 28 Jun 2020 07:24:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/17] hw/arm/spitz: Create SpitzMachineClass abstract base
 class
Date: Sun, 28 Jun 2020 15:24:14 +0100
Message-Id: <20200628142429.17111-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: muXAyvu27RxH

For the four Spitz-family machines (akita, borzoi, spitz, terrier)
create a proper abstract class SpitzMachineClass which encapsulates
the common behaviour, rather than having them all derive directly
from TYPE_MACHINE:
 * instead of each machine class setting mc->init to a wrapper
   function which calls spitz_common_init() with parameters,
   put that data in the SpitzMachineClass and make spitz_common_init
   the SpitzMachineClass machine-init function
 * move the settings of mc->block_default_type and
   mc->ignore_memory_transaction_failures into the SpitzMachineClass
   class init rather than repeating them in each machine's class init

(The motivation is that we're going to want to keep some state in
the SpitzMachineState so we can connect GPIOs between devices created
in one sub-function of the machine init to devices created in a
different sub-function.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/spitz.c | 91 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 55 insertions(+), 36 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 9eaedab79b5..c70e912a33d 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -33,6 +33,26 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 
+enum spitz_model_e { spitz, akita, borzoi, terrier };
+
+typedef struct {
+    MachineClass parent;
+    enum spitz_model_e model;
+    int arm_id;
+} SpitzMachineClass;
+
+typedef struct {
+    MachineState parent;
+} SpitzMachineState;
+
+#define TYPE_SPITZ_MACHINE "spitz-common"
+#define SPITZ_MACHINE(obj) \
+    OBJECT_CHECK(SpitzMachineState, obj, TYPE_SPITZ_MACHINE)
+#define SPITZ_MACHINE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SpitzMachineClass, obj, TYPE_SPITZ_MACHINE)
+#define SPITZ_MACHINE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(SpitzMachineClass, klass, TYPE_SPITZ_MACHINE)
+
 #undef REG_FMT
 #define REG_FMT                         "0x%02lx"
 
@@ -905,8 +925,6 @@ static void spitz_gpio_setup(PXA2xxState *cpu, int slots)
 }
 
 /* Board init.  */
-enum spitz_model_e { spitz, akita, borzoi, terrier };
-
 #define SPITZ_RAM       0x04000000
 #define SPITZ_ROM       0x00800000
 
@@ -915,9 +933,10 @@ static struct arm_boot_info spitz_binfo = {
     .ram_size = 0x04000000,
 };
 
-static void spitz_common_init(MachineState *machine,
-                              enum spitz_model_e model, int arm_id)
+static void spitz_common_init(MachineState *machine)
 {
+    SpitzMachineClass *smc = SPITZ_MACHINE_GET_CLASS(machine);
+    enum spitz_model_e model = smc->model;
     PXA2xxState *mpu;
     DeviceState *scp0, *scp1 = NULL;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -958,100 +977,100 @@ static void spitz_common_init(MachineState *machine,
         /* A 4.0 GB microdrive is permanently sitting in CF slot 0.  */
         spitz_microdrive_attach(mpu, 0);
 
-    spitz_binfo.board_id = arm_id;
+    spitz_binfo.board_id = smc->arm_id;
     arm_load_kernel(mpu->cpu, machine, &spitz_binfo);
     sl_bootparam_write(SL_PXA_PARAM_BASE);
 }
 
-static void spitz_init(MachineState *machine)
+static void spitz_common_class_init(ObjectClass *oc, void *data)
 {
-    spitz_common_init(machine, spitz, 0x2c9);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->block_default_type = IF_IDE;
+    mc->ignore_memory_transaction_failures = true;
+    mc->init = spitz_common_init;
 }
 
-static void borzoi_init(MachineState *machine)
-{
-    spitz_common_init(machine, borzoi, 0x33f);
-}
-
-static void akita_init(MachineState *machine)
-{
-    spitz_common_init(machine, akita, 0x2e8);
-}
-
-static void terrier_init(MachineState *machine)
-{
-    spitz_common_init(machine, terrier, 0x33f);
-}
+static const TypeInfo spitz_common_info = {
+    .name = TYPE_SPITZ_MACHINE,
+    .parent = TYPE_MACHINE,
+    .abstract = true,
+    .instance_size = sizeof(SpitzMachineState),
+    .class_size = sizeof(SpitzMachineClass),
+    .class_init = spitz_common_class_init,
+};
 
 static void akitapda_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    SpitzMachineClass *smc = SPITZ_MACHINE_CLASS(oc);
 
     mc->desc = "Sharp SL-C1000 (Akita) PDA (PXA270)";
-    mc->init = akita_init;
-    mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c0");
+    smc->model = akita;
+    smc->arm_id = 0x2e8;
 }
 
 static const TypeInfo akitapda_type = {
     .name = MACHINE_TYPE_NAME("akita"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SPITZ_MACHINE,
     .class_init = akitapda_class_init,
 };
 
 static void spitzpda_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    SpitzMachineClass *smc = SPITZ_MACHINE_CLASS(oc);
 
     mc->desc = "Sharp SL-C3000 (Spitz) PDA (PXA270)";
-    mc->init = spitz_init;
-    mc->block_default_type = IF_IDE;
-    mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c0");
+    smc->model = spitz;
+    smc->arm_id = 0x2c9;
 }
 
 static const TypeInfo spitzpda_type = {
     .name = MACHINE_TYPE_NAME("spitz"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SPITZ_MACHINE,
     .class_init = spitzpda_class_init,
 };
 
 static void borzoipda_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    SpitzMachineClass *smc = SPITZ_MACHINE_CLASS(oc);
 
     mc->desc = "Sharp SL-C3100 (Borzoi) PDA (PXA270)";
-    mc->init = borzoi_init;
-    mc->block_default_type = IF_IDE;
-    mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c0");
+    smc->model = borzoi;
+    smc->arm_id = 0x33f;
 }
 
 static const TypeInfo borzoipda_type = {
     .name = MACHINE_TYPE_NAME("borzoi"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SPITZ_MACHINE,
     .class_init = borzoipda_class_init,
 };
 
 static void terrierpda_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    SpitzMachineClass *smc = SPITZ_MACHINE_CLASS(oc);
 
     mc->desc = "Sharp SL-C3200 (Terrier) PDA (PXA270)";
-    mc->init = terrier_init;
-    mc->block_default_type = IF_IDE;
-    mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c5");
+    smc->model = terrier;
+    smc->arm_id = 0x33f;
 }
 
 static const TypeInfo terrierpda_type = {
     .name = MACHINE_TYPE_NAME("terrier"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SPITZ_MACHINE,
     .class_init = terrierpda_class_init,
 };
 
 static void spitz_machine_init(void)
 {
+    type_register_static(&spitz_common_info);
     type_register_static(&akitapda_type);
     type_register_static(&spitzpda_type);
     type_register_static(&borzoipda_type);
-- 
2.20.1

