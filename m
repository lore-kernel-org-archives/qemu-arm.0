Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07301CA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:14:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4jZ-0005n8-T5; Tue, 26 Aug 2025 21:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4i7-0001uP-LO
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:26 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hv-0000Ld-Ag
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:22 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-77053017462so2570658b3a.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257129; x=1756861929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pDOTLVphgVXgLeL+z+5CezA41FUxIfsaonuBX/UWhqU=;
 b=dXG3rzWY6EFBFK80pnay/T+XFHgICQWzSAYwhxpwjATVuMrddSGE7H1sLP2WKylMmd
 3Or2FUV2bUZrCHDrYL0/lv78vEScTP5Y97jaB0EuTT/x4OIKVEScjx19dLFL47BwpHCG
 zREtCvdE0k7r7tHv/A6dtcPQSo6RTamUODJ+e4LNojKqJPA4j+xGNCW2uNm/HVKY/Ula
 Vl5QAL9zgjA5c2mfXccg9XFEyIZEGxX6P1UG+4yMT71ptgJVlMDK0VBkwYv6sWFnM2NH
 KCD7WUif/C0zCdeaSmPuFZVNiBsfHAoP+IrQYkXP3UHj2PMeVZ3JUo9obx5v854cZFcA
 MP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257129; x=1756861929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pDOTLVphgVXgLeL+z+5CezA41FUxIfsaonuBX/UWhqU=;
 b=V78NrgSDGsksVwY4jdJGdTiD8UTi8XH9JByGqCUJPDE5pEMNTiXm6sJttqqDwJTuhV
 kfnWvTf6q0P/VnEJ67hKYfqmevtvOeADEXsKAMUhARk2KlX4FFUi0hG4jL8GFLtZE27u
 UjhZr1pNSNBO9EhKrNHFcf7a26xYsglisWZZJmEr0tCH3PVS9nG9F04G6f7f9aXZpz9D
 hZ2B4LJOMVcchf7IbPlZmQYrv1pGyuu0OiGz9cxHOi5lUwgNoye3y5haInhyNbRI109p
 EwCX+6SoIY8ADCmeF5efSHH5jCZFlJVf3t8GiMq/VybGpqlgENZkUr1z7BFBTk/XItmL
 UWUQ==
X-Gm-Message-State: AOJu0Yx/GAaunMi83JwWhX1jQOlZNPCtOVpvpT0n13yzFdFF6V7/JtI7
 /FGnb7ihXURGwM7ZP03RHRyPbPLIca9dSIri4JT1aqP+YHxDdurjUT2xhsgpmDT3Q+Pk5Nskl3T
 eBZ/Fsho=
X-Gm-Gg: ASbGncvrbC+s7vxXOPYsxaOyaMSAGCBKQVVjBoETHyMFc0gb/kwZzqp8+wklfrFosk4
 qlNHWQom6O8ucCyA4eER6w903tJjX1yqKlQg2tKgOC2QJcBBZs5ABIMZAn7c72m4sdWcDW4f/I/
 QYXrfyNr/4lX4FPT7NqZL//W7YBGzs+6MQAs+tWhcAtCz5+3LDy5aKdN/dn5IxvDEaWzRrXesXR
 vwrNlRJjCHVA9l3c4Gb6j5KQwHXajB+8YRzYS6x8EHglrjtmraD0EUAjbTrPPN9SCx3gPfZ+rjf
 Jsr98WP4JbEV/zhpTt9orai9MH9imqLsIhgyw7HSfHOz7PZ/QaeGXIgeY4XfT0TgNaol0ijjlDX
 vlQXr3jBQ3fwnoNQfAnLh9fLW5aPuynWRftgeXCdNE/r/lqA=
X-Google-Smtp-Source: AGHT+IHkvPzlsHRjbdwa8TI2phDF0fj0jfI3equ/eCUDEMFG3/IINONLaupU6hyDUUFhsEpWU1WcHQ==
X-Received: by 2002:a05:6a20:1b2f:b0:243:70d4:c597 with SMTP id
 adf61e73a8af0-24370d4d473mr9628045637.44.1756257129224; 
 Tue, 26 Aug 2025 18:12:09 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:12:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 60/61] target/arm: Use flush_if_asid_change in vmsa_ttbr_write
Date: Wed, 27 Aug 2025 11:04:51 +1000
Message-ID: <20250827010453.4059782-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Only flush the subset of tlbs that are affected by the ttbr
register to which we are writing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7a817b7e28..e8442731d4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2905,11 +2905,20 @@ static void flush_if_asid_change(CPUARMState *env, uint64_t old,
 static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    /* If the ASID changes (with a 64-bit write), we must flush the TLB.  */
-    if (cpreg_field_type(ri) == MO_64 &&
-        extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
-        ARMCPU *cpu = env_archcpu(env);
-        tlb_flush(CPU(cpu));
+    /*
+     * If the ASID changes (with a 64-bit write), we must flush the TLB.
+     * The non-secure ttbr registers affect the EL1 regime;
+     * the secure ttbr registers affect the AA32 EL3 regime.
+     */
+    if (cpreg_field_type(ri) == MO_64) {
+        flush_if_asid_change(env, raw_read(env, ri), value,
+                             ri->secure & ARM_CP_SECSTATE_S
+                             ? (ARMMMUIdxBit_E30_0 |
+                                ARMMMUIdxBit_E30_3_PAN |
+                                ARMMMUIdxBit_E3)
+                             : (ARMMMUIdxBit_E10_1 |
+                                ARMMMUIdxBit_E10_1_PAN |
+                                ARMMMUIdxBit_E10_0));
     }
     raw_write(env, ri, value);
 }
-- 
2.43.0


