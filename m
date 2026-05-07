Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82988CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:52:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OL-0000HF-CI; Thu, 07 May 2026 19:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OJ-0000EI-Ac
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:27 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OH-00011Z-QX
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:27 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7de431da8fbso1140498a34.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197464; x=1778802264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6A2mgR71x2gRQlZNLDb+phH7Gxy6pN9ynlj49DFnFXE=;
 b=e3LzRDAbE2y0IxJlJqbuQvwEaE0A4kxUucm0KhFXDj+W9CQxd6d0YXWFItm9EEybaR
 vdx8I4UGDcnDgkwpAUh2yTOsjs2EkZ5YQCI/xmLSCCvz1XLhazH/6ViBdtOc6GHzf8A8
 tpv0D3W9H/wWmaXzINtqliYwg41OMyNOSeBnF6iMRwcYnrg8apTiRYFKBkWgKXaQjd6O
 5zR8/Us6Cr1cfR+23QHgAJQLjC85+R/G7euZr8rv6CNqZQzEbiRFhOsQQAMb8/b+nD/g
 Mh0uSjGqawT1vBbhtmk1INVScaBwxNEZOCAd5jb0IZnwhLcYht2yJkDmsaNvmm/qM7Z8
 X2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197464; x=1778802264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6A2mgR71x2gRQlZNLDb+phH7Gxy6pN9ynlj49DFnFXE=;
 b=WcVbhhizQ+OdT4rhT3yrAvjpcczypLXr17JjpVmovBvyHBqXCBZnNaapEPKU3dHzHD
 wqxtd3OBRodyQ3ZMacLAfCilkF0NvsI+h2oYTHFPjjxSDhj3siIQmu47zUzSyoeZQC9J
 Y4DRfiu5hTs2unJ+PbyWBRPZ2QkQo1T8rjtdZoJ0FtesbWALPve/827RfZW2nF9dd1lB
 VdWmQVDEUUmT7HH2ENcoowoy6C92jhqF4U5cv9KHYSe1DghIGQH+Xokz+4Cwhd1ak6aG
 HUdOtM70MOdGKeYbavHyVOQ5BRAn7UX88AHI7FKSV9xr3N607AntgT9WJhn1+iWmqmtT
 yRlA==
X-Gm-Message-State: AOJu0YxTkc0RLxujza7EFCYptdITHY8N3B+eAuXGryfino1vP1hc2dT6
 wKh52V/naxOKrFJ6qjS8YfrqDLdg/JRll1pY/stMLKHMT9kVP4wZxQFwA1/46E8mUM9izWq7tG5
 81Wp0
X-Gm-Gg: AeBDieviojW8Pl/G+Ju+vgaDiJ2T+jAFizvBk2RJmURRTGH4+mdCgi3cn6OufZAX03+
 vdLr1E5rmgc9pqWunIkB6xNy5HXgen21qLAvYVQRAeHlzyTHKaD0LbtpupJwKainUUW95iKc/md
 g0/mh8Fcdyg+mdqdFl6QGMpyed1Y7lvjqBR1O+/fZXWOhl8fpHRaf8Fx4wcjRlz5ANzFHr1k5kf
 0+buH15+xDR9JwVIchWZV947pRBKybY3MpnmGTXSsgJ2uNBO0q/A7mN/r6Dnha9Pf0FqjcVWt4K
 bL2ak42gIxlery2vxxq1g7Zxyvl854kyS0hVU5bMt9Sp7Bw7aoIT0cqtXsfH/db4+V5MvKACQJK
 Wti3wQW45io3+SSLRKR+kviOFPVkbALhexFy6Fp3h7kFRCMhqyIRQfb5ieD5kGsZrTWOLhHZ+Kc
 +Kb1Aq+CWy0msXCCqgj3B3M7a3WLEBUVqgaxBuA/M75jsFqw==
X-Received: by 2002:a05:6830:67c6:b0:7dd:e032:3cdb with SMTP id
 46e09a7af769-7e1df0d2a88mr7037568a34.18.1778197464574; 
 Thu, 07 May 2026 16:44:24 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 10/60] target/arm: Enable EnFPM bits for FEAT_FPMR
Date: Thu,  7 May 2026 18:43:23 -0500
Message-ID: <20260507234413.643512-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
index 304db1a479..7a17fd39e5 100644
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
@@ -3953,6 +3956,9 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpu_isar_feature(aa64_gcs, cpu)) {
         valid_mask |= HCRX_GCSEN;
     }
+    if (cpu_isar_feature(aa64_fpmr, cpu)) {
+        valid_mask |= HCRX_ENFPM;
+    }
 
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
@@ -4026,6 +4032,9 @@ uint64_t arm_hcrx_el2_eff(CPUARMState *env)
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


