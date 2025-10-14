Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3D4CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:12:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lKa-0003GA-L8; Tue, 14 Oct 2025 16:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lKT-00037j-Kq
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:09:07 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJE-0005Qp-28
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:09:05 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-28e7cd34047so45275245ad.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472463; x=1761077263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cP6TNINNZoGtGBqsX1aw8rmNJhFSSPjp0JQKlaZg8kY=;
 b=vS/54JEWQyjDD8pEnWpWqzbkZccaM4a3cEE+gyibmL/J/c+8hOKKARzQ6mGm3Ypz7L
 yL1tRfKmDQktl/Q9Z8+urQkxBXBlWy/KTm2qPqicMpQShFltentkK2C5SPRg/N+DFSGb
 7KKk9acvMOVw+K607k/UVwKvB4b+GMVmM8LQ7wEx1uEyoRpyVM4c9WgDeNkxqUVrkQsS
 5mrWpduIlCKAjrdyK56D7b1fhuXtFwUm2E2L1hwyTj51hwKkVTB17M5Q1LcsqE39K4a3
 tq9XDx3LiW0XNX8VCxgpDcmSY1qg4JSz7taCGzIn+KlCHLhvsi8JiMVo2iDrbM1ZxgzV
 XtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472463; x=1761077263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cP6TNINNZoGtGBqsX1aw8rmNJhFSSPjp0JQKlaZg8kY=;
 b=GZxT17r8ff3hsx4ldb5verIoP9Ic7T89Os8sjcrmMjBkNiq0/r7cEOs4mZh7pFOHw9
 W/pcA1OhkFlK0TxS0m22QwxRobveghoMd+PpCUb0E/mwgLBwsE+JdGatuKrH1SwTzlF3
 +ALArEQkjhpxOqoQh6gbHT36tM+Gl+1AguU3HOo0mxvaJ691Y90eqecw9itEpxINJpHd
 Lr67fAp0LkPyuXRN+LkbFfQuJta/yVn0hWRvFepO06RBEf1KEhwcJywJGCVURe2lQfDq
 H0+dkWfpYj9eGyABC+F8Gz/vki+mLYs8ipTGpHdRjqGfzIZ3fXfYdhCg4cpGBVYzzZfB
 f+Cg==
X-Gm-Message-State: AOJu0YwbZ7s7uDX55L9cS2c2A3oqUAQDlxozqMr7B4rZr4xTuUhoRv6F
 F4I1sUcFw2KxibT7gH6FRvDVBHfpiKTxDLXuBECTYhkIhnMRg+DdvMbCTL7qszyT1VQ=
X-Gm-Gg: ASbGncuaLvzn6ufwFGZP8pS3hiGpT8eejQMje+FxkbPIAJQUL3iDmRwYcKSRuYG9bp6
 amlLX5wGYMUlnQ4U0EkNN8TkCXUJrUm6wLY8/Tli0WwBLeUttK0kdFdxeu0rc57mVYSpXldOdBu
 MZJKyU7WguD4HFQ8R9BpjcUppLnQmBPJcv1ROvEqHlfo/eX8qsJx/uILxhP6jxjshAaYe0qHxLp
 EOKk2b5jvAQGqNEy4HMd8JBu1lClzvKJVp7qkO+ipDyXlGM35g1gScoaMeX4VyX8xaWF8q3xR4M
 4Ybwyxy1j7+CTIwnjHSN2Z+MjzSHV2YVmoxb1rqFyyNki9Mx7Qn2bcZ+/I6+O0SuNdrL96FsOhz
 iS++SFO0mGICtDbIS/el539DUr0plzWOlJVm95yu9oFwq7v8Ey3FRMc+G+NV13Q==
X-Google-Smtp-Source: AGHT+IFOtb0PYPAxCCF9tocUVgC9UVwdnIVVfVTFKVoYOXwOMtUn4wY4tKgyLTORTGddim1LS5ytIg==
X-Received: by 2002:a17:903:2351:b0:269:a23e:9fd7 with SMTP id
 d9443c01a7336-29027262689mr387260045ad.26.1760472463339; 
 Tue, 14 Oct 2025 13:07:43 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 34/37] target/arm: Implement TLBIP VAE3, VALE3
Date: Tue, 14 Oct 2025 13:07:15 -0700
Message-ID: <20251014200718.422022-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/tlb-insns.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index f99559e4a7..10ee973068 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -442,6 +442,13 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_page_by_mmuidx(cs, pageaddr, vae3_tlbmask());
 }
 
+static void tlbi_aa64_vae3_write128(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t vallo, uint64_t valhi)
+{
+    uint64_t pageaddr = extract64(valhi << 12, 0, 56);
+    tlb_flush_page_by_mmuidx(env_cpu(env), pageaddr, ARMMMUIdxBit_E3);
+}
+
 static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
@@ -889,12 +896,16 @@ static const ARMCPRegInfo tlbi_el3_cp_reginfo[] = {
       .writefn = tlbi_aa64_alle3_write },
     { .name = "TLBI_VAE3", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 1,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_vae3_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae3_write,
+      .write128fn = tlbi_aa64_vae3_write128 },
     { .name = "TLBI_VALE3", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 5,
-      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS,
-      .writefn = tlbi_aa64_vae3_write },
+      .access = PL3_W,
+      .type = ARM_CP_NO_RAW | ARM_CP_ADD_TLBI_NXS | ARM_CP_128BIT,
+      .writefn = tlbi_aa64_vae3_write,
+      .write128fn = tlbi_aa64_vae3_write128 },
 };
 
 typedef struct {
-- 
2.43.0


