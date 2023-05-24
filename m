Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2613487ejb;
        Wed, 24 May 2023 08:00:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55smJn49WwfZqqwLp0ojHHuEU/K0rvQYDfUTr5p4ATOrdvnGJmWVkPPGQNZA959LXjy+b5
X-Received: by 2002:a05:622a:1052:b0:3f4:d3a7:9827 with SMTP id f18-20020a05622a105200b003f4d3a79827mr27396604qte.25.1684940417472;
        Wed, 24 May 2023 08:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684940417; cv=none;
        d=google.com; s=arc-20160816;
        b=saVkkuEbQoWqBDrc9nhbIzkjzhJHd8E/2nkkQqonwmNQvS+cSAxuuvpXunqPQbde++
         AbFbHwk6Ssb1Wsb7taH+8YL05mdeS+oM/fq/pmfsrsK8XhK8GNirY1fCZ4GN8aOVdVKE
         OpT4wybZ6JOI6Lm8weix+01xImSMaA4YReEp8nc/HDeQvFRj1F99SQxtmn/HAwTj48ou
         4y6jZWYieaCSVh4L9YdsglscY9eYI750DusnMO1uTIN27uP84ZJ01AcKdfi7IIgQ7LgH
         v7d2XUSZaFfrA3xymgnqIKofu/HAhZDzta3DZJj8a2NmUhaIoLUMimDeiVVn++pmvzt+
         GHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oFNQ0ujjXIJFfhKAnMzFQFaSo5jFHy/7Nt5oxClCYqE=;
        b=W2JumfcL7EbT9Qc7AwhaPapajjYVjOD3lqh2i0s6OiGdD9QmXFLru94qOFAluesIsQ
         hzBHoByF4qCUHrgYlBE0z/PY5Xcjjx9SEQ6pqSTArV4KZCwQP25fvsj8RD2Gry+pKBWt
         i8/0YH8/6qafgRmjzSQjvSwnDaKleFTyl/rtEFpO9LhgIhGY21PC6OdJ+UOOKauIxtPw
         AzOrRuYqtERdi5In8lFh2lqvrWdbuVzpf12P/KZr1A2RMZf43F8oYBxm9zCiZf3UZKuH
         xZDqF4U3NA3VIX6Gm2CaY/a2lTBrcVoeQDoR2DMKA9N/kBHS52foKj2w7wWLaurWzwQK
         U7Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBGF3GLN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020ac85906000000b003d4da60a9d5si6741586qty.214.2023.05.24.08.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 08:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBGF3GLN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pxx-0006ZW-3h; Wed, 24 May 2023 10:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1pxu-0006XP-Ll
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1pxt-0006WZ-4S
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f6042d605dso9337885e9.2
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684940386; x=1687532386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFNQ0ujjXIJFfhKAnMzFQFaSo5jFHy/7Nt5oxClCYqE=;
 b=VBGF3GLN8LqGOK5xgXvZTNUmB6OxS3Ja5TjqS3poPLOoF7QtZUM4ZDqy8TNunTgBiz
 2ZtP322fZ/nny2lmW6SMa626uRx+eOjfjyfsg0Cm7ThI4epvuYsaYERBNSsj3MWZNyXL
 mxSYX32DE9dkmtg/f6MXe9VR0JE/3YSBuGPCfcbWhTmvAJjrETYG0J3srJ+uiyDcZDGr
 beRRjMKJNIm8FYGGs5e2i86Sot6uy0Ty+wr2M+t8l6vyq1lShp2Amp1l78FpgNvN8BOg
 v/B5GWQlnkGtSh9TffxfE4G1MtGrTZNDlFOcqIfkq5ZAeLtWdTuIZee1yS/xqZ45x+0b
 CkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940386; x=1687532386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFNQ0ujjXIJFfhKAnMzFQFaSo5jFHy/7Nt5oxClCYqE=;
 b=j7b49WtN9UP+3uJOArocqxKnqHJ6FXR7laz6KbPTlONwV9I0zPfKO4vZBeTSeImkko
 oxl1oFEDU2ZvxgrNjWsO5C4kyi92yjKlvFP5ByH25/amRZZsgtlmj3jTZwYXNoeNhpYd
 a5TdxPkAD4dcFwZgCPhBSfxQkOU1pl/9EjB7HxOvZn+F6axBZ23YCqWWc/kAB8Acv4OB
 Ftvz8RVc9W4nnWwArcXQTIhOUW+R9RqPgDXBjDFrnjnfE9WjSGx0YbH/lPPv0qra7wSH
 Dh0R+8Dh2Pn1fTkAtbMXPqQCPZaMPaJVNvyMKZ7iFggSKm1fFFHrWm8ugLoiWlfIFfOX
 T+Hw==
X-Gm-Message-State: AC+VfDwc6FXEfESYiYeTy7VZi+j17t588e8STKMU0i5ahCpNOApgDnvj
 NnhDWdIvlPZzE1GOFhkr00KMGg==
X-Received: by 2002:a1c:4b03:0:b0:3f6:41f:5a68 with SMTP id
 y3-20020a1c4b03000000b003f6041f5a68mr17906wma.29.1684940386542; 
 Wed, 24 May 2023 07:59:46 -0700 (PDT)
Received: from localhost.localdomain
 (fac34-h02-176-184-31-193.dsl.sta.abo.bbox.fr. [176.184.31.193])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c378400b003f6050d35c9sm2608530wmr.20.2023.05.24.07.59.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 May 2023 07:59:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/10] hw/arm/realview: Move 'mpcore_periphbase' to
 RealviewMachineClass
Date: Wed, 24 May 2023 16:59:03 +0200
Message-Id: <20230524145906.33156-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230524145906.33156-1-philmd@linaro.org>
References: <20230524145906.33156-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: Ibg78OBzMIwv

Instead of having each machine instance resolve whether it is
MPCORE based and its peripheral base address, set it once in
their class_init() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/realview.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 1a3a64e0ce..8a3b5a48b1 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -35,6 +35,7 @@ struct RealviewMachineClass {
 
     int board_id;
     bool is_pb;
+    hwaddr mpcore_periphbase;
 };
 typedef struct RealviewMachineClass RealviewMachineClass;
 
@@ -94,26 +95,21 @@ static void realview_init(MachineState *machine,
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
     qemu_irq cpu_irq[4];
-    int is_mpcore = 0;
+    bool is_mpcore = rmc->mpcore_periphbase != 0;
     bool is_pb = rmc->is_pb;
     uint32_t proc_id = 0;
     uint32_t sys_id;
     ram_addr_t low_ram_size;
     ram_addr_t ram_size = machine->ram_size;
-    hwaddr periphbase = 0;
 
     switch (board_type) {
     case BOARD_EB:
         break;
     case BOARD_EB_MPCORE:
-        is_mpcore = 1;
-        periphbase = 0x10100000;
         break;
     case BOARD_PB_A8:
         break;
     case BOARD_PBX_A9:
-        is_mpcore = 1;
-        periphbase = 0x1f000000;
         break;
     }
 
@@ -129,8 +125,8 @@ static void realview_init(MachineState *machine,
         }
 
         if (is_pb && is_mpcore) {
-            object_property_set_int(cpuobj, "reset-cbar", periphbase,
-                                    &error_fatal);
+            object_property_set_int(cpuobj, "reset-cbar",
+                                    rmc->mpcore_periphbase, &error_fatal);
         }
 
         qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
@@ -191,13 +187,13 @@ static void realview_init(MachineState *machine,
         qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(busdev, &error_fatal);
-        sysbus_mmio_map(busdev, 0, periphbase);
+        sysbus_mmio_map(busdev, 0, rmc->mpcore_periphbase);
         for (n = 0; n < smp_cpus; n++) {
             sysbus_connect_irq(busdev, n, cpu_irq[n]);
         }
-        sysbus_create_varargs("l2x0", periphbase + 0x2000, NULL);
+        sysbus_create_varargs("l2x0", rmc->mpcore_periphbase + 0x2000, NULL);
         /* Both A9 and 11MPCore put the GIC CPU i/f at base + 0x100 */
-        realview_binfo.gic_cpu_if_addr = periphbase + 0x100;
+        realview_binfo.gic_cpu_if_addr = rmc->mpcore_periphbase + 0x100;
     } else {
         uint32_t gic_addr = is_pb ? 0x1e000000 : 0x10040000;
         /* For now just create the nIRQ GIC, and ignore the others.  */
@@ -434,6 +430,7 @@ static void realview_eb_mpcore_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 4;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("arm11mpcore");
     rmc->board_id = 0x33b;
+    rmc->mpcore_periphbase = 0x10100000;
 }
 
 static void realview_pb_a8_class_init(ObjectClass *oc, void *data)
@@ -459,6 +456,7 @@ static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
     rmc->board_id = 0x76d;
     rmc->is_pb = true;
+    rmc->mpcore_periphbase = 0x1f000000;
 }
 
 static const TypeInfo realview_machine_types[] = {
-- 
2.38.1

