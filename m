Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1299078ejb;
        Fri, 3 Feb 2023 03:39:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/7oHC1k8Pp/dITKy8IuqjxYfkAv91gEx7eZBaA6s3IFgf08abMHTx+PRB7kY2f8VIBAGda
X-Received: by 2002:ac8:7c45:0:b0:3b8:5057:376a with SMTP id o5-20020ac87c45000000b003b85057376amr18857819qtv.66.1675424396968;
        Fri, 03 Feb 2023 03:39:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675424396; cv=none;
        d=google.com; s=arc-20160816;
        b=hfVLDQwpmPsAFb9RjvHLdjMp2bVQYKtAhBN/+YQy4Rd+JZY+5rAm4ziy3HwkvI+6sh
         QzJDhktR1TayD5OhJs6PZgfsIfdZK1zHMenjCorjqmbnbSMvMUdH3M9wRrrVHhqGrvu/
         wDv1R2hpL0aqMpI3TDzhg/UPklkRPx8Tkj6JAX4eFnsKSZE2YiKGtbCsnpnQaD/zYX9i
         mDdDbSVmBRNwpOPloSt5szZCS4X9Bb0VUvgMNK9lI0+jU2lG4n4Jbk8nQmPoJZAfu+Rs
         9m0dFE2G/GZh8H6A8kzik7197YVQn9vJ7v9ze5igSUeEofNZMv8LA4AxpoKtOtDbieyW
         6FZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dWk/17AxotpO2OiTLMBjakLfcxFYdT89H87fwCpt4bM=;
        b=rSkx/XY5dwtOH4/zs2mMeTOBfeniESqfUE482GVUCY4SE3JUbSn90iAyvQbqnBuUI5
         aN2vBK2CQcvQ0xMGFYideLOSx8is9Rb4QZq/QM3Qwdhe5QFL/eq29roWuNMkCAL4pPAa
         mxzQqK/W5nRs9g1jRKUP4J49oGhs4fuoTeRO2SmsSvUSI4fVqCHw8Li7RbYc2xOImJeY
         PiyIo4a0i2Bkmw6O79RW46YMC+ai3COkA4fAPdFgaG3iLvoTswDyMWmN96e7hDTwXOit
         poDevYHVFK9pv9jAJmcHrJSxy+fEPXtWV2f/8ZCd2cwF0P/q4DKBucQQMTSe7plN55St
         DBhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JYjl0/Vv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020ac857c8000000b003b9b25060d3si1768408qta.253.2023.02.03.03.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 03:39:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JYjl0/Vv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNuNx-0008RB-O1; Fri, 03 Feb 2023 06:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNv-0008Jx-RV
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:37:39 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNt-0001EB-Qh
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:37:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so2134736wms.0
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 03:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWk/17AxotpO2OiTLMBjakLfcxFYdT89H87fwCpt4bM=;
 b=JYjl0/VvlntLjVc4egYlP9yaTbI6aNzp2WME3CIytntZwWgGd+xrGd5PVCRdGjsy5k
 M1mbrxcNWnZbVMZT1yIHGm9QSgHTxQqpVs6My7sR3ubc3IC2EjEfj2ZnKYUDwsbAEsMB
 q8X3TRFxYEByofp2rUMK5gBbU2jbwBsvO+agXXh+ouGSbkrdgMMnBwdWp6cWEelRHJ8k
 Q8PtkCTA3Lo9RhygpZwcnTOLcCrGzyima6/l+NQXRif0JvZjg2DuJ6QHngk0gDFTWs1o
 BM7g7WtjcZu0Lx9sClGipBXENLGYWY+jjwENgJpRaqYWluzOmlDMBqfvuk+8ObYlFW7c
 dWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWk/17AxotpO2OiTLMBjakLfcxFYdT89H87fwCpt4bM=;
 b=Dk+qG933uvxFXns2Tvy/pXhqAJdcxSR1XvpC3U+L7fWIWG/bNq/4TSHu+eFWoc5sCA
 X106lg7THYlio9CsVWqPySx71b8+uk+dRcvZ2zAHahxVeCH5gYYin6s7hH7D42VdJr+O
 YYHxhWZegLmR9Ug/T0vbJxUhoCRy77NeQZ5NEhTW11sUzSYWBXPEWNsjlgXkOtXWo7zJ
 7EK5/L5ySMy8kPMH+gB+d5RYt9OgF7LKgj7ZKpJwnd/o32FMYxWbrKSz3Ge2f5dd5dRU
 UssqrOhVxJEY9WxBxfZQdqKsOn+EbuOn6i8NWArPWeFnZH4bP4+Jcs10Llf4xBr1is6W
 9XHw==
X-Gm-Message-State: AO0yUKXF0ghXb0z+rdNQSiEsJ/pTYKXlaHzkpJUxthPIMlJ8qXJxJyHP
 kgpfsWsfDq5qr5NHvQkEiClFGA==
X-Received: by 2002:a05:600c:3795:b0:3dc:561a:79e7 with SMTP id
 o21-20020a05600c379500b003dc561a79e7mr9012581wmr.2.1675424257110; 
 Fri, 03 Feb 2023 03:37:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003dee8c5d814sm7787235wmo.24.2023.02.03.03.37.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 9/9] hw/mips/itu: Pass SAAR using QOM link property
Date: Fri,  3 Feb 2023 12:36:50 +0100
Message-Id: <20230203113650.78146-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: 61G48Ej1aUPn

QOM objects shouldn't access each other internals fields
except using the QOM API.

mips_cps_realize() instantiates a TYPE_MIPS_ITU object, and
directly sets the 'saar' pointer:

   if (saar_present) {
       s->itu.saar = &env->CP0_SAAR;
   }

In order to avoid that, pass the MIPS_CPU object via a QOM
link property, and set the 'saar' pointer in mips_itu_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC because not tested.
---
 hw/mips/cps.c              | 23 ++++++-----------------
 hw/misc/mips_itu.c         | 26 ++++++++++++++++++--------
 include/hw/misc/mips_itu.h |  5 ++---
 3 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 38acc57468..2b5269ebf1 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -66,20 +66,17 @@ static bool cpu_mips_itu_supported(CPUMIPSState *env)
 static void mips_cps_realize(DeviceState *dev, Error **errp)
 {
     MIPSCPSState *s = MIPS_CPS(dev);
-    CPUMIPSState *env;
-    MIPSCPU *cpu;
-    int i;
     target_ulong gcr_base;
     bool itu_present = false;
-    bool saar_present = false;
 
     if (!clock_get(s->clock)) {
         error_setg(errp, "CPS input clock is not connected to an output clock");
         return;
     }
 
-    for (i = 0; i < s->num_vp; i++) {
-        cpu = MIPS_CPU(object_new(s->cpu_type));
+    for (int i = 0; i < s->num_vp; i++) {
+        MIPSCPU *cpu = MIPS_CPU(object_new(s->cpu_type));
+        CPUMIPSState *env = &cpu->env;
 
         /* All VPs are halted on reset. Leave powering up to CPC. */
         if (!object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
@@ -97,7 +94,6 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
         cpu_mips_irq_init_cpu(cpu);
         cpu_mips_clock_init(cpu);
 
-        env = &cpu->env;
         if (cpu_mips_itu_supported(env)) {
             itu_present = true;
             /* Attach ITC Tag to the VP */
@@ -107,22 +103,15 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
         qemu_register_reset(main_cpu_reset, cpu);
     }
 
-    cpu = MIPS_CPU(first_cpu);
-    env = &cpu->env;
-    saar_present = (bool)env->saarp;
-
     /* Inter-Thread Communication Unit */
     if (itu_present) {
         object_initialize_child(OBJECT(dev), "itu", &s->itu, TYPE_MIPS_ITU);
+        object_property_set_link(OBJECT(&s->itu), "cpu[0]",
+                                 OBJECT(first_cpu), &error_abort);
         object_property_set_uint(OBJECT(&s->itu), "num-fifo", 16,
                                 &error_abort);
         object_property_set_uint(OBJECT(&s->itu), "num-semaphores", 16,
                                 &error_abort);
-        object_property_set_bool(OBJECT(&s->itu), "saar-present", saar_present,
-                                 &error_abort);
-        if (saar_present) {
-            s->itu.saar = &env->CP0_SAAR;
-        }
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->itu), errp)) {
             return;
         }
@@ -158,7 +147,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
 
     /* Global Configuration Registers */
-    gcr_base = env->CP0_CMGCRBase << 4;
+    gcr_base = MIPS_CPU(first_cpu)->env.CP0_CMGCRBase << 4;
 
     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, TYPE_MIPS_GCR);
     object_property_set_uint(OBJECT(&s->gcr), "num-vp", s->num_vp,
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index a06cdd10ea..0eda302db4 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -93,10 +93,10 @@ void itc_reconfigure(MIPSITUState *tag)
     uint64_t size = (1 * KiB) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
     bool is_enabled = (am[0] & ITC_AM0_EN_MASK) != 0;
 
-    if (tag->saar_present) {
-        address = ((*(uint64_t *) tag->saar) & 0xFFFFFFFFE000ULL) << 4;
-        size = 1ULL << ((*(uint64_t *) tag->saar >> 1) & 0x1f);
-        is_enabled = *(uint64_t *) tag->saar & 1;
+    if (tag->saar) {
+        address = (tag->saar[0] & 0xFFFFFFFFE000ULL) << 4;
+        size = 1ULL << ((tag->saar[0] >> 1) & 0x1f);
+        is_enabled = tag->saar[0] & 1;
     }
 
     memory_region_transaction_begin();
@@ -157,7 +157,7 @@ static inline ITCView get_itc_view(hwaddr addr)
 static inline int get_cell_stride_shift(const MIPSITUState *s)
 {
     /* Minimum interval (for EntryGain = 0) is 128 B */
-    if (s->saar_present) {
+    if (s->saar) {
         return 7 + ((s->icr0 >> ITC_ICR0_BLK_GRAIN) &
                     ITC_ICR0_BLK_GRAIN_MASK);
     } else {
@@ -515,6 +515,7 @@ static void mips_itu_init(Object *obj)
 static void mips_itu_realize(DeviceState *dev, Error **errp)
 {
     MIPSITUState *s = MIPS_ITU(dev);
+    CPUMIPSState *env;
 
     if (s->num_fifo > ITC_FIFO_NUM_MAX) {
         error_setg(errp, "Exceed maximum number of FIFO cells: %d",
@@ -526,6 +527,15 @@ static void mips_itu_realize(DeviceState *dev, Error **errp)
                    s->num_semaphores);
         return;
     }
+    if (!s->cpu0) {
+        error_setg(errp, "Missing 'cpu[0]' property");
+        return;
+    }
+
+    env = &s->cpu0->env;
+    if (env->saarp) {
+        s->saar = env->CP0_SAAR;
+    }
 
     s->cell = g_new(ITCStorageCell, get_num_cells(s));
 }
@@ -534,8 +544,8 @@ static void mips_itu_reset(DeviceState *dev)
 {
     MIPSITUState *s = MIPS_ITU(dev);
 
-    if (s->saar_present) {
-        *(uint64_t *) s->saar = 0x11 << 1;
+    if (s->saar) {
+        s->saar[0] = 0x11 << 1;
         s->icr0 = get_num_cells(s) << ITC_ICR0_CELL_NUM;
     } else {
         s->ITCAddressMap[0] = 0;
@@ -553,7 +563,7 @@ static Property mips_itu_properties[] = {
                       ITC_FIFO_NUM_MAX),
     DEFINE_PROP_UINT32("num-semaphores", MIPSITUState, num_semaphores,
                       ITC_SEMAPH_NUM_MAX),
-    DEFINE_PROP_BOOL("saar-present", MIPSITUState, saar_present, false),
+    DEFINE_PROP_LINK("cpu[0]", MIPSITUState, cpu0, TYPE_MIPS_CPU, MIPSCPU *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index ab6d286c38..35218b2d14 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -72,9 +72,8 @@ struct MIPSITUState {
     uint64_t icr0;
 
     /* SAAR */
-    bool saar_present;
-    void *saar;
-
+    uint64_t *saar;
+    MIPSCPU *cpu0;
 };
 
 /* Get ITC Configuration Tag memory region. */
-- 
2.38.1

