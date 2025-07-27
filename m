Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AB2C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:06:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwM0-0006Ge-QS; Sun, 27 Jul 2025 04:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLh-0005Bt-Gl
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:15 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLg-000440-1R
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-237311f5a54so28263145ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603391; x=1754208191; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cpS/rQKc/KiLSv/x9q7oUeyX2cxzb+6hLrCr5m20LI=;
 b=LaLk2N9r5WGVELKQflY0REHxc6IW7RCttUU8yeOjxFYYY3/Ca7CRpKS23mIV+p53Dh
 /QIBRBz6fSpmz4VPErtwJOaNkgBd16sH1YKlBTJ3s7/lZIZkIljL50N479km4NiMVCvs
 Pjur+M4BfUVz6zC82aA7sToxT33Fgc4BFl9GdFJeJ5jFPiU5nGKfXmT8GIssVPy1P3Nc
 o8RBpQkLZEDUlH7UQmBgeY8kpIeAgFNQmo3/shxlLOiOKnfFOKU+nUOEALwv6m5htt+2
 GDhLnVJ+0J03mLTNHg2rNQOAOEECZQS9X/ls/mD94+CzSvmtLQgSKDWwZ8VEIwWH10ka
 tRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603391; x=1754208191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3cpS/rQKc/KiLSv/x9q7oUeyX2cxzb+6hLrCr5m20LI=;
 b=NzTumOeZFlndBwB+3apzOxTod8i4yc0Ugd1KPFOM8vpk2mEL72G1A1oT/LkPzOz5gS
 5CrMfv3qthE+gz97XevoG6FEC8FHHTJjQH3Cv8LbaCCAitQuxn2MUaLA0L2mqWmM09Zm
 JAn23xmtzfh3XE5sqTItBT4BmFf47WL+tlATJUOPAN+tVDPiWxJbDLOmj6S5VxzwredP
 J8rruj0h60Dbl7kGb/amFYoxOIoDgQONpOqlQ5lJFvRkT5Mi77pZ4kt+KTjgWkxPDd1L
 QizcWcSMH7SiJNtoDafxU/JdmBPldzUU1LxZMZ58VV36v6i4X72OfkzNjQ6/7SrLtZaN
 dfTw==
X-Gm-Message-State: AOJu0Yyj/wVCEhb9LkUop8u1SXwtFLyfJfGWRO9TgVlLAohI91GRAtLl
 vkVjEnkrZTNNVS7g3hejezIoMZh1JlQIVt+lGWJhCRA7+ZYcJNNmd6DwFwtQvR2NGZo=
X-Gm-Gg: ASbGncu8jj1fC6nmWEFWcNI5h92rhfITGkFt0MToZmGHn7FrEkgUeJLlRJaim/bJCqi
 5u3t7+ri8sDH293pdC9KI57e/yHXEpcaC0CsLAovyxc+JxEnYMfpdTGgl+pjCb3dIbW4lhU06Hv
 wfIb5J0Y02T8YzCUvI7rQR3tbHLMaDgISLJiMhr3TnRdWsZ6OTUiDxFoO3lJiZCPKW8KjzHwgm9
 hIk7Wxt2LGbsV8bMdFt8JijNpcb8Ad6vxghkwImPtNMLWZivUgFUk+iaYFR0grQvI1Ct4B56h/W
 3ZqJpa/oW6lZkmDdPYUzU3On9FjUIuLQ1B4Vj46YleIDAOeAn7yiAR7dHirfCWwpOnnwIHrW52O
 qbFz0ZBg5SsgDefzFuM6p+jjDY91M4uiJMF0f1t6aQojGZjWhZW+L1bGX1S2ybXRHDGvuJ6JL7M
 tLN7e3lrq4Ig==
X-Google-Smtp-Source: AGHT+IH+7Wbhl7q+tsyTaGSVUjkVhSeWJO75Vu4sJUBoMTEl3Jthz3XcGKZ/bxpWAZjkB5bDSo1JvQ==
X-Received: by 2002:a17:903:fa3:b0:235:f298:cbbd with SMTP id
 d9443c01a7336-23fb30ac008mr133704455ad.21.1753603390804; 
 Sun, 27 Jul 2025 01:03:10 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/82] target/arm: Enable TCR2_ELx.PIE
Date: Sat, 26 Jul 2025 22:01:43 -1000
Message-ID: <20250727080254.83840-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc6c82b7e2..61ba9ba5b2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6202,8 +6202,12 @@ static CPAccessResult tcr2_el1_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
@@ -6211,11 +6215,15 @@ static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
-    if (cpu_isar_feature(aa64_mec, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_mec, cpu)) {
         valid_mask |= TCR2_AMEC0 | TCR2_AMEC1;
     }
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
-- 
2.43.0


