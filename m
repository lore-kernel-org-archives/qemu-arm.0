Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8713EC55ABA
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Aug 2026 15:32:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrdZO-0005mQ-RU; Wed, 05 Aug 2026 11:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrdZM-0005l6-Jj
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 11:30:12 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrdZK-0007bo-Dh
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 11:30:12 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-495c49f8eccso753153b6e.3
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2026 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785943809; x=1786548609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gOu86j/s+4k/C1Vcjz8sgwYcvvMNp55MwKcmmYQitoI=;
 b=I/L6e0hf5U/0/mwtjWfJkJNnsAh/ju0e3YxGfn5/15ECblat+vbqDU8F2fizRC06Xl
 DW59fk6Gmg/AF6k8meiJ+o4TIZF2odbT8K9nGA8uVOt+zBub7XlNs0ygtWc0JRvodARz
 3gO0NC2NqssljbjYxuC7nuJpsvrmH8gouVUSzjhxpbNY+4zOpveAEa6LRQKebZWzE/E8
 brMqChQeod9B/ZMoBeFaCtbRwb/zM7M3gaH2rDqIBEX+YKT1nIzJ4zAFeyli+kFM97dt
 9QxGjZTND32Rb7h9zVgAiX8Ny+PcT1g7jyiTDzf/a0ejIeTOM8e5xxWk3CX5xfGPMmVX
 DwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785943809; x=1786548609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gOu86j/s+4k/C1Vcjz8sgwYcvvMNp55MwKcmmYQitoI=;
 b=o7dWl5J5fokB4J319/Qz1S4NSkpJNlmxmAuktO1GDhXn0O/GsFFLMbh2g1h48mWpIq
 Iconumei6iPNMVhJZRi769ObIbmRTeVd7BcF86MsyV2XKC34NJhC9vNm1ofqr4mQYQ6f
 jt1FtOO/+bEdLhnJLq/Myymk0k4CWSDbZMfXJNdb/+/pgKTr0HAGGQDEiEv0lw/vbYNF
 R3B1ENSrQZRHP/8PYFU57ZtBD7k2h8ClyRBiujlMfX7RJXtMfUjHanrUjoO1EmDT3KsM
 a7irO6HJ9jVHRXwvoiIwj0oJqV9TS6w0I9J04V0tQaYF0jzoXy0oTEv9oqEMgsd6WxBT
 QZUQ==
X-Gm-Message-State: AOJu0Ywzh6xGZOSl61d9UKTeiGG1rpPu+NtwFIa3CW66e2pzUJWbOSR3
 o0xHkjEyXgWaHcFpSfsaRgGilwS+uZHq1zVWOTCT3DlPMSaAvw0vKbW3
X-Gm-Gg: AR+sD109Ld67hQ2yXk3lQyR8kn9LB8/jModHJ6n7a3xcdhyQVVpvN+IzJEP2a/MqLcF
 Kx/HuE0S2w7QmBWreew3YI3S6jPyvj4pN25Qqarn1dkJonZmj6aY8j+xlU2k8J4d+FcpVPV4QZx
 YsL/hwKBqbquBPlUhuCbb7A3Rm5DRfV84yyeR35FKvOTewfd0uUtgWT0jGVk22iCCVpcfSTPjjM
 NwBgg71qtI3qrTKsWO4w83UGiRcuzc2kC6jr7md6rw3c34rtogQsm6L/S/Uc80hUGD14ZYuUHBu
 cSyZIylJEA/Z0yoboX18y9tq5u5G+7gPPgh316SgqF/NBNfEhc/eixZjugfmK6+j849ExdYcUTh
 EF4X+T5zv7GayUVco7IwLZwZGc2X9ImwjTOvF7dTgiuC72mHL/JFIJHYEvDILckLqU1NBytg+cx
 J/BLP3fWM/eNMR41JUv2GNEa7NDvy04TZOwk/QomgEKvgfuopukQ6KvkaRWI1DpsETmOnqyIh6q
 f0OGjo3njuK
X-Received: by 2002:a05:6808:5384:b0:493:a850:d93a with SMTP id
 5614622812f47-4afadf13c46mr4411643b6e.6.1785943809066; 
 Wed, 05 Aug 2026 08:30:09 -0700 (PDT)
Received: from HPE-2MQ6131DV6.ams.hpecorp.net ([170.85.99.9])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4afae75ce1bsm2185614b6e.15.2026.08.05.08.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 08:30:08 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Owen Giles <owen.giles@hpe.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Robert Elliott <elliott@hpe.com>, Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH v2 1/9] target/arm/tcg/cpu-v7m.c: add cortex-m85 model
Date: Wed,  5 Aug 2026 10:29:57 -0500
Message-ID: <20260805153005.9989-2-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805153005.9989-1-simonxhy0404@gmail.com>
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add Arm Cortex-M85 CPU, modeld after the existing M55 CPU.
The new M85 feature PACBTI is not implemented in QEMU and the midr value
is based off the r1p1 product revision identifier.

Arm Cortex-M85 TRM:
https://developer.arm.com/documentation/101924/0101/

Reviewed-by: Owen Giles <owen.giles@hpe.com>
Reviewed-by: Robert Elliott <elliott@hpe.com>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
---
 target/arm/tcg/cpu-v7m.c | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index dc249ce1f1..a1e62a20f8 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -237,6 +237,45 @@ static void cortex_m55_initfn(Object *obj)
     cpu->ctr = 0x8303c003;
 }
 
+static void cortex_m85_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
+
+    /* QEMU currently does not support the PACBTI feature */
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_V8_1M);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr = 0x411fd231; /* r1p1 */
+    cpu->revidr = 0;
+    cpu->pmsav7_dregion = 16;
+    cpu->sau_sregion = 8;
+    /* These are the MVFR* values for the FPU + full MVE configuration */
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x12100211;
+    cpu->isar.mvfr2 = 0x00000040;
+    SET_IDREG(isar, ID_PFR0, 0x20000030);
+    SET_IDREG(isar, ID_PFR1, 0x00000230);
+    SET_IDREG(isar, ID_DFR0, 0x10200000);
+    SET_IDREG(isar, ID_AFR0, 0x00000000);
+    SET_IDREG(isar, ID_MMFR0, 0x00111040);
+    SET_IDREG(isar, ID_MMFR1, 0x00000000);
+    SET_IDREG(isar, ID_MMFR2, 0x01000000);
+    SET_IDREG(isar, ID_MMFR3, 0x00000011);
+    SET_IDREG(isar, ID_ISAR0, 0x01103110);
+    SET_IDREG(isar, ID_ISAR1, 0x02212000);
+    SET_IDREG(isar, ID_ISAR2, 0x20232232);
+    SET_IDREG(isar, ID_ISAR3, 0x01111131);
+    SET_IDREG(isar, ID_ISAR4, 0x01310132);
+    SET_IDREG(isar, ID_ISAR5, 0x00000000);
+    SET_IDREG(isar, ID_ISAR6, 0x00000000);
+    SET_IDREG(isar, CLIDR, 0x00000000); /* caches not implemented */
+    cpu->ctr = 0x8303c003;
+}
+
 static const TCGCPUOps arm_v7m_tcg_ops = {
     /* ARM processors have a weak memory model */
     .guest_default_memory_order = 0,
@@ -290,6 +329,8 @@ static const ARMCPUInfo arm_v7m_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m55",  .initfn = cortex_m55_initfn,
                              .class_init = arm_v7m_class_init },
+    { .name = "cortex-m85",  .initfn = cortex_m85_initfn,
+                             .class_init = arm_v7m_class_init },
 };
 
 static void arm_v7m_cpu_register_types(void)
-- 
2.53.0


