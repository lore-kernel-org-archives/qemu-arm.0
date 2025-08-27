Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D1BCA0FF6
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:10:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dH-0006l4-1Y; Tue, 26 Aug 2025 21:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cq-000586-Np
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cU-0007Nv-E9
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-770593ba164so2751997b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256786; x=1756861586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4Lf8/2iTXAex6ZXuf2I67UjdBKmSW8ls21CHC4ixcw=;
 b=Pl2q4ucr8qcm4GpR4RlPVjHpEnZdVj2acudVk4RaClEO0sAXCMAqBlLIMcd1nTPzTN
 ne652TeGORotKqHsI6GEcW36cvn/pK4edlyiqkZLc0YbmG5610Tgp5AFkkPOzQSe3kRS
 jnoPUk9jFPMJx/0UIppTWGL5aiq3spsKWpBpKWJjcBCI6+23sKrfFbBol1LUR9wIzzqz
 n+XPZjVjIfHYnkpGoCSccJJ1wgB4gaM9EOcXu9VfWlofBtorcCdCRIfkGgU2RuPVFNE5
 gsuAF+ySGDQplQgBdNyxRYI20tFrqmFllLewON7C65YO97zEmZoHm5t2s8wm1BXqANku
 4vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256786; x=1756861586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4Lf8/2iTXAex6ZXuf2I67UjdBKmSW8ls21CHC4ixcw=;
 b=ITwPxVnBNpc0CP5klj/7noQzBb75t51Tyubtm3pMVA8wmzYpuBO4cgc/Vo6K9UP6I6
 IN+pgbXpus8CZeeCKvA4+2C5PYcvN6RHkbJR/030dA2DR+7KPYObTIFoNn948uxi7R/Z
 atlopMiYkpCpuwwMHva021jHH5lrsNomVsDoeaCTNPQGeUJ91tiEd5Mz8ER3uiXe/QS2
 7B+TwOWdGCNPrOkpGdzpynFfnWx1GGW/TfuqsFl9f6QQnwkEsl/9N+5ubbygAc8oyXSZ
 hrRd80MlrVQxh4PJV/Jxn8vEOKtlWFYEsPzcV9IuNGZhMHRmlinR1wc6G24dJsH4VAc1
 SNNQ==
X-Gm-Message-State: AOJu0YyI40oPco3O3gWofWSHXpf03BKhJ0P/KrE9JPaCcNPuT18i5Stl
 n+YWvvJAMfBr2DG2mhgbKxY+rzuy5B3RYps+CWPKl9S7XcFx+gAysFIc9MFJIE8r6OtzlQfBmqI
 Xa7OL8W0=
X-Gm-Gg: ASbGncvHgqTUNnqFjLKUyojaPI/jCmdfsxEL0TL7+4Jc1VjMznLotb1O6eBcyzAX0p1
 mWJ41MA6K+IJ/BRITu3GYUzHkH+/FQ7hxBYGB935Tikp7q6seFLUcssAY3zn4EsEhQpEyZbEcxt
 A1imW1mbapo29vSLgendg4DyFEera54Kq1cwcPlXvRGQK4sNItUuQ5BSma1up5BGgKEXvfViSSV
 ti7lXcNOyYWCrCKbpvcaAPGOnQwQU47s0oyq9b/LJMwOcmPc78q6A8zSU0iuKKZghHjO24pcSIt
 0yLCJM8B367tGaennT6r4Lhimx1014RapK1sDbg7t8wtytfqR6rxM/v97DCWEziKFYWNQAxlFE/
 OOFUvruaUhQ/xR2Znl83gIJNmuUtNoKSNXyNW
X-Google-Smtp-Source: AGHT+IHEVY7/8besdjS17Ryjh0NUy8unWQGZsVI/tHL1uTAaQ3cbGP5sEPNOdQ+Ozh8hS9LrCpboXQ==
X-Received: by 2002:a05:6a00:4649:b0:771:fab2:83ca with SMTP id
 d2e1a72fcca58-771fab28737mr4983047b3a.4.1756256785634; 
 Tue, 26 Aug 2025 18:06:25 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/61] target/arm: Add CP_REG_AA32_64BIT_{SHIFT,MASK}
Date: Wed, 27 Aug 2025 11:04:06 +1000
Message-ID: <20250827010453.4059782-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Give a name to the bit we're already using.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index b6c8eff0dd..3dc4c9927b 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -178,9 +178,14 @@ enum {
 #define CP_REG_NS_SHIFT 29
 #define CP_REG_NS_MASK (1 << CP_REG_NS_SHIFT)
 
+/* Distinguish 32-bit and 64-bit views of AArch32 system registers. */
+#define CP_REG_AA32_64BIT_SHIFT  15
+#define CP_REG_AA32_64BIT_MASK   (1 << CP_REG_AA32_64BIT_SHIFT)
+
 #define ENCODE_CP_REG(cp, is64, ns, crn, crm, opc1, opc2)   \
-    ((ns) << CP_REG_NS_SHIFT | ((cp) << 16) | ((is64) << 15) |   \
-     ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
+    (((ns) << CP_REG_NS_SHIFT) |                            \
+     ((is64) << CP_REG_AA32_64BIT_SHIFT) |                  \
+     ((cp) << 16) | ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
 
 #define ENCODE_AA64_CP_REG(cp, crn, crm, op0, op1, op2) \
     (CP_REG_AA64_MASK |                                 \
@@ -202,7 +207,7 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t kvmid)
         cpregid |= CP_REG_AA64_MASK;
     } else {
         if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
-            cpregid |= (1 << 15);
+            cpregid |= CP_REG_AA32_64BIT_MASK;
         }
 
         /*
@@ -226,8 +231,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
         kvmid = cpregid & ~CP_REG_AA64_MASK;
         kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM64;
     } else {
-        kvmid = cpregid & ~(1 << 15);
-        if (cpregid & (1 << 15)) {
+        kvmid = cpregid & ~CP_REG_AA32_64BIT_MASK;
+        if (cpregid & CP_REG_AA32_64BIT_MASK) {
             kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM;
         } else {
             kvmid |= CP_REG_SIZE_U32 | CP_REG_ARM;
-- 
2.43.0


