Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A8ECD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:33:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPN-0007c2-Lm; Sat, 16 May 2026 20:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOi-0007DW-7D
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:31 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOZ-0004vk-JZ
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:19 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-8367df48711so420827b3a.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977814; x=1779582614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAosT0zOJ8eHcyZ5INON7Xq9l371iEzZ0qq0XCtPW+c=;
 b=rYBXiCwRzwHU7n8pK14lruj0Kyfqjwk5fjT9HeP/VWin4Ld95lQYOda31ohdd1YT6G
 R0ELPzoWYVr92burPOaBn6xHz0Eou7qqB7B+TEXWKg6fxUsvsMdQmjqTP3ag71STOxUI
 thUnnqwjxN9BmQglh0fnCLcY4Tu/0hY55b71wV8Ak4oC5va++KxPZecmSwl7PCv80kdR
 EdGLIaCs/+S8AOVxZTEehxXk/S/8zvOwQYK8p9eoAwh/eNiFeHjjWTF0xcI6kCkjUcfy
 aEFQZhVN71gNd7u+5G4CtVX6CR7qn+nDy+eLYdzo9rl6ddOYoQ/r5F1gRmAuTsGdls1h
 rJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977814; x=1779582614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JAosT0zOJ8eHcyZ5INON7Xq9l371iEzZ0qq0XCtPW+c=;
 b=lvTN3hcLJ4B6XdiuLHNAH+bj4nIp/UsqJYK3kfOqNLvZyvhU4RFRaGCiJFX4LkkCSS
 MlIhUC8wkvkBhlDemGlln6wKTH7UpdqtnLjTE36VwVAYj1s6zyzIxhGqiSReLLfST5v+
 Cv00ztxTPx87SK3WM9u2OxtlyJJVEHlArlWT5hkK/Prbpk5JV8vp0VIJW2d/5D0ZHW/c
 fYWs35/NBZAsilF4iWj0bHvpyi7BOQVdDL/zR4RvhmxqjAs2PySKzr0PLM61mD7xDySz
 OFp2LzpAvmyJksMqQde0ANOohZ6quG2kelca0rmGlIAY5Ig4NOXnYG0gAlzW6xmk0S10
 ws0Q==
X-Gm-Message-State: AOJu0YxR4KeadNB7g6//RgjGC6X+dZm+C53uB0LP947wQkDEwXlbKzI9
 aFdthfMevEsAd8kqVGImac03X4H9XVsm9dyHCuYtcBF1hi/fM99crlYWrpAMAlGHAnp0u20M6Al
 9dGuT
X-Gm-Gg: Acq92OFbcIxeM0kev3jH+agIA4sj1HfVpjqS/+85ILwOegApT+ca14bO4guf/ZU3pq2
 AfAWzKJRej6yjC34AKqpqDriG56kSFWhh0tRxw2O7lRaTnqs8g5+aANaEwPTdGSRYTCQbaVpL2W
 eTtnTePo6jeBZYwqKi6AVqGFPgDKirrobxHlHuWNBIG1fWJO0cDF1GoS7srG5EsvhDqlSWH/mFl
 +hLHcd2YGZpZzE2PTYmTss1quLdhFTeMnKUDr0WePU7fNFMCwlKc81EaizUkllI5B5VJ3Dy+TQK
 1sFA9vkpZX2vNQn80dOxcpSIaDVALDDwFzIlMoyP6wbUT+LrbGWOqzCMptRJJmvlyy5oEKDoUsA
 cEUN3Lw5QNmRPLUI6lNZKu+Mhu56CeOCh89aW6+7CJJAgYCDr/HkwV9MI443rbrwDVv1KSpLBrR
 YaI7kqCgR8PXtDc7FFwdUiaqMtE8Rh
X-Received: by 2002:a05:6a00:94ed:b0:81f:4e6a:7276 with SMTP id
 d2e1a72fcca58-83f33c9400amr9378250b3a.14.1778977813546; 
 Sat, 16 May 2026 17:30:13 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 11/63] target/arm: Enable EnFPM bits for FEAT_FPMR
Date: Sat, 16 May 2026 17:29:10 -0700
Message-ID: <20260517003002.321430-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ae1dd42dc4..7eb7031294 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -787,6 +787,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_mec, cpu)) {
             valid_mask |= SCR_MECEN;
         }
+        if (cpu_isar_feature(aa64_fpmr, cpu)) {
+            valid_mask |= SCR_ENFPM;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -3973,6 +3976,9 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpu_isar_feature(aa64_gcs, cpu)) {
         valid_mask |= HCRX_GCSEN;
     }
+    if (cpu_isar_feature(aa64_fpmr, cpu)) {
+        valid_mask |= HCRX_ENFPM;
+    }
 
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
@@ -4046,6 +4052,9 @@ uint64_t arm_hcrx_el2_eff(CPUARMState *env)
         if (cpu_isar_feature(aa64_gcs, cpu)) {
             hcrx |= HCRX_GCSEN;
         }
+        if (cpu_isar_feature(aa64_fpmr, cpu)) {
+            hcrx |= HCRX_ENFPM;
+        }
         return hcrx;
     }
     if (arm_feature(env, ARM_FEATURE_EL3) && !(env->cp15.scr_el3 & SCR_HXEN)) {
-- 
2.43.0


