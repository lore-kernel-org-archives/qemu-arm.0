Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1926FEE645E
	for <qemu-arm@archiver.kernel.org>; Wed, 31 Dec 2025 17:11:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vazhH-0002bj-IV; Wed, 31 Dec 2025 12:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vazhB-0002Xb-Aj
 for qemu-arm@nongnu.org; Wed, 31 Dec 2025 12:09:14 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vazh7-0000ZY-6x
 for qemu-arm@nongnu.org; Wed, 31 Dec 2025 12:09:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so66702335e9.0
 for <qemu-arm@nongnu.org>; Wed, 31 Dec 2025 09:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767200944; x=1767805744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wt2aqGMGclkIIK53OA+IiWfT46ZDnd/x/s5IoZRUcU=;
 b=xWO9ll4EWLLmDXEvSmXu3psOwjMlAYug7d6lH2T1tg3s91k+mE3k/r3BR8g7ZJ40ix
 Kt1S07gHo1ZiMIdk/kwqQOpiWwsd3qHh4yWaI7GjBR9wCm9BRyuIerJ81Szz5MLnTCbd
 tWoT7PHTdOdTzIZB1ehiIEvlFcwh77zlcm8yVjFV43qFVbUtV+K4/Yv3cLjSsFQBRLs+
 MacXfEgAFh/HVs3CtpqtDFuLo3l630YB9I5cK9hKKJtJ/KFpYEGw0Sef3CYGuYs6Cb+P
 z+AIezNpSnlckSn4ftsAYycrAMEu33w2Kiw6EGRHjyDMmvBBC2CwPInUr+GyXDXdRrLH
 +tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767200944; x=1767805744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7wt2aqGMGclkIIK53OA+IiWfT46ZDnd/x/s5IoZRUcU=;
 b=HTvFDYojjCt/OWX8v5I5o4OVfPHFbiI7CkxC4sj03nCfTIpxG11Um94yDZFWjbiyAS
 ZoUVLD1BNCU6uCROFzZNdOy5asFPUe7DiDSiply+HAHFmc7xnkuchQ829U2GZH60J3Sj
 XeA0OBlHP0Ro/CemxP4TyxRiZrfuzWkg4e9nTWuX7IZc/kgsFw2hdU3GIgWZpxJkV1vt
 /3ad6EYCooescZV+g/lsHWmEJLeDHHFWd1kF2Yuu+6SWkQA1zqh19mNez/eZk9uQ5m65
 x6kuikWHeXrcdldlTkRQubvvJ2lnh+ZkAztCcWvIUv+8Xweq3wDxIYDgJgaD2VsWD3eT
 Hbdw==
X-Gm-Message-State: AOJu0YwukHBS85VUICYk11a3DRPoLITerhS40khs65g6hSA5xt5RRXrI
 iwXVpxveeYwrIF/giKDgzBxrIymNaTXBiUCwzSluaUeIuWYjrf539yGih1fA1625QLDdSpQW22w
 47qJg
X-Gm-Gg: AY/fxX5SU48du5iuJ1lwqAf2dy/0OZf7SCV9vPUM6zZQu7uDI6OrSOhVjZHKNI65PQ6
 N996YqaqaQdyKVH/Grlg20Ywys1N2zpcNADp3KFJhkC2KhB45pahovdOVqxcocEHL5uC7JvYw5f
 U5XGr4Y9DLDz/lwq1fuh1/P/N/SaRwOxOYdvm7mUJMHQB2aRBQS2zG69z2imZAcFN/CF982zfme
 mpKjgFaEe0Y3dpkRJi4ZpBuDHlvc7rVOGxhswipGw+l/oeD2ti5NwSqsyAMJVL15MehvbvElHaj
 shXtgxBxTtt80o8Rqn/So754Oun5jyoxMQbUPZcTMgYNe8fyPd/Vi5Huu4nn00zfbHDuyw6mU6G
 a8g4RoKtQjNMRqM1FfdHjN0FXp2T+JmDrz4I+N61UiytMbYT6Z7lQ2lvnE/wprCbHQrcGOYVeXE
 +mhy5/R1M/FilahJKSSN/9Fmc+N0Os2QyquzYExXtyWTsqz8MnjXOZiKdZ6o/qUWrOAnEgFbjLg
 oJUdxm4ozJbin+UxJLS/UITV/ymO53zxihi2TWJtPJSNw==
X-Google-Smtp-Source: AGHT+IGMgxrMaovXrFILA/hBFvv/tUB3hmHP8Ry4rbls5TFAvu9PWw/U7YS3NzlSJUlfwmMfjsUJ6g==
X-Received: by 2002:a05:600c:6096:b0:479:3a88:de5f with SMTP id
 5b1f17b1804b1-47d1959d6eemr399205855e9.36.1767200943762; 
 Wed, 31 Dec 2025 09:09:03 -0800 (PST)
Received: from mnementh.archaic.org.uk
 (f.7.f.1.7.5.e.f.f.f.c.5.d.8.2.4.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:1d0:0:428d:5cff:fe57:1f7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa64cesm75208990f8f.35.2025.12.31.09.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:09:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 4/4] target/arm: Rename access_aa64_tid5() to access_tid5()
Date: Wed, 31 Dec 2025 17:08:58 +0000
Message-ID: <20251231170858.254594-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251231170858.254594-1-peter.maydell@linaro.org>
References: <20251231170858.254594-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

There is no equivalent access_aa32_tid5() (HCR_EL2.TID5 only exists
starting from v8); rename access_aa64_tid5() to access_tid5() to line
up with the naming we now have for the TID1 and TID3 check functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0896e90965..b914988ac9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5425,8 +5425,8 @@ static const ARMCPRegInfo dcpodp_reg[] = {
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
 };
 
-static CPAccessResult access_aa64_tid5(CPUARMState *env, const ARMCPRegInfo *ri,
-                                       bool isread)
+static CPAccessResult access_tid5(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
 {
     if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID5)) {
         return CP_ACCESS_TRAP_EL2;
@@ -7449,7 +7449,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo gmid_reginfo = {
             .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
             .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
-            .access = PL1_R, .accessfn = access_aa64_tid5,
+            .access = PL1_R, .accessfn = access_tid5,
             .type = ARM_CP_CONST, .resetvalue = cpu->gm_blocksize,
         };
         define_one_arm_cp_reg(cpu, &gmid_reginfo);
-- 
2.47.3


