Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9109DCD98C7
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 20:44:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXPlt-0005pq-Ks; Wed, 10 Jun 2026 16:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPls-0005nz-2C
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPlq-0003r7-GV
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso5315105f8f.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 13:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781124209; x=1781729009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IygqDsQPTooVpTpsebU6T09bbtG/PeqDx7j21Taz12c=;
 b=wPGAazCUSrrgvHlUuGrhLHUKpAN50858fQKn04MZW4PHra6DHwZgEhkEpDUV5dcaaa
 GL0QR1KxOv3I7YQKYM1WHkx/++E7sihDMOhzFU3ut2kS50ArddK4ZkLnxzJVuJJx+OdC
 27YYldY8S39udxjqR5Q6CVQMeSrDa+IPZ7w7dPECfBl8iIn/jMCI5cOWgGjUgueJWr9k
 ZI4dOP1sTGvEgSu0rNRMeAjBZsaPY4HC2q0jbvtaAQ+X48wZ24TfiFbFHgE76lY5byxJ
 2yC9RND7Myxq/RCOx9P1zwC5z283v43SdwmTO3fqkLeXp5EHAJS81jJWl2ipdXOe5T34
 R7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781124209; x=1781729009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IygqDsQPTooVpTpsebU6T09bbtG/PeqDx7j21Taz12c=;
 b=S8YjdE5oI2HIdiZYRE2CvhJIzc7y9a6btNcm+jWvjutYKTMdeC8a5oNCh9Z6HS2guJ
 qaxrjAAmQfyMsX+M3PfoMeWuf+QLOGMA8Z/q6a+9xcsu//3XU6fYCIcDQpv5XRCFLOzx
 sNzLI55fDJ6DEj2vM+Tn5ya5sIx/yHGcqxwF5QpDuzg0b2CiurJ4OB11Pk0bIP3/BRba
 1mtISCy+IgJkCGXyO5YoCeTcLgXp+K42kIjrLJwndc2LMx2a6cliPgD9YXnqEprSTdvE
 45wRkRrH3dQXbFnsUMMXi5qd+pxWoxISTd7TzcgdfNvrTdTsGsG+eAST+wlFup27rzx9
 gYgA==
X-Gm-Message-State: AOJu0YzPMIqLnjYvzZdJkjDq16ATb8hnWExDPtUvv91G5/2qDoJSc2au
 XmsryiDls/+5JTbhmLXjeD7/4IeVr6f8IpbfKNA7IeNRZ7HadlMWcfiQ3b0fl63SK5s=
X-Gm-Gg: Acq92OHNaWflu2G0n4MwvHglzbKcgSSqBokaJnkH/i/6XA7eg1uc2x9WtYXyXB6mRWs
 REc927XoGOYEmP0znMgGzpYS4yzRfPVaiETMPI6+f8HuzlPUaDHE7UjPQqHs3MfU9DSrFykDoJy
 U/zEpMopTrN1HPKsKr5k4PZ2JAY5e2H/rm9pEfgdmcsnUzV23H6f1b8gWjh4yIaXh14FEH48Evy
 s240uIwP/3kgVhaKNFhskQCNcF8Hl/AL1AX5Pg1Wx8gF/v8p8BT4SQBY/CWOCXPvn0z54gsu4lQ
 FRWL3x0ChNXRgcMCpszYnHOhmucWQaVWhO+dXXpCKng/yuPtA6UUBFFwLT1MPUOJ0CChsl5ZFeu
 1LyUXXb8+D5ulWTLV+XT651rOodEmNgyu3TUH6yAdTj85SYxHE2le/oqaoY6xL6Cez8Tc673Ijs
 0KtlUPpKjKwwdOQKHRnxx3XgWoRIdKC8Dtkg==
X-Received: by 2002:a05:6000:468b:b0:43d:7868:21f0 with SMTP id
 ffacd0b85a97d-460304f9e96mr27272427f8f.9.1781124209029; 
 Wed, 10 Jun 2026 13:43:29 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35133csm71854577f8f.25.2026.06.10.13.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:43:27 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 733565FC8F;
 Wed, 10 Jun 2026 21:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/6] target/arm: trigger timer recalc on HCR:(E2H|TGE)
 changes
Date: Wed, 10 Jun 2026 21:43:21 +0100
Message-ID: <20260610204322.828645-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610204322.828645-1-alex.bennee@linaro.org>
References: <20260610204322.828645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

Toggling the HCR state affects the offset calculated in
gt_phys_raw_cnt_offset so we should trigger a re-calculation on its
change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - defer calling gt_recalc_timer until after we set hcr_el2
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8946d2aad28..f35fe83723c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3712,6 +3712,7 @@ static const ARMCPRegInfo v8_aa32_el1_reginfo[] = {
 static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
 {
     ARMCPU *cpu = env_archcpu(env);
+    bool hcr_change_timer;
 
     if (arm_feature(env, ARM_FEATURE_V8)) {
         valid_mask |= MAKE_64BIT_MASK(0, 34);  /* ARMv8.0 */
@@ -3803,6 +3804,10 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB | HCR_NV | HCR_NV1)) {
         tlb_flush(CPU(cpu));
     }
+    hcr_change_timer = (env->cp15.hcr_el2 ^ value) &
+                       (HCR_E2H | HCR_TGE);
+
+    /* update */
     env->cp15.hcr_el2 = value;
 
     /*
@@ -3824,6 +3829,11 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         arm_cpu_update_vinmi(cpu);
         arm_cpu_update_vfnmi(cpu);
     }
+    if (hcr_change_timer) {
+#ifndef CONFIG_USER_ONLY
+        gt_recalc_timer(cpu, GTIMER_PHYS);
+#endif
+    }
 }
 
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
-- 
2.47.3


