Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCF7C79F89
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 13:03:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3Yzr-0006Em-VI; Mon, 07 Sep 2026 09:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3Yze-0006AV-E6
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:02:39 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3Yzc-00051h-Oc
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:02:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso44798755e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788786154; x=1789390954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PECZI3QBNqqLr6ePRzJzDKHA0mATh/ie5d5BiyY28gQ=;
 b=dNUTJ4tcQTEfv+Fu0tEgF2bpVXZyJ9svixDWNIihYctLxLCzkaLB2oG4B8aD1LCXTS
 MITvyfy+t+gXK/TBKPQhm3Z78CLm464HqONW8csyH0n5ZuKeSsUyqrklkSESNaFlIVNL
 dgmTdHexS3WvhTf69WiLaRLm0hdTmRpWFYRM+9HFnAq1m916eDPxJROgZPSfKZn3lIDb
 anonCE1be4dFoM4I2k+PiXZhvq9/qMR08hRuH2PxJqkhTQYfBWZRLY257RikSW+aDI5J
 8lxAkb4Wd5By1ueq2RcpgOqFlAYoivmcjmKcNImMdr8AjkPSvF4aUQ8divLwsKjen/9U
 sVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788786154; x=1789390954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PECZI3QBNqqLr6ePRzJzDKHA0mATh/ie5d5BiyY28gQ=;
 b=fNNZ2i9zHZNvTKm2+iCvICPb2lnJwEaqTtOamC+PyFGJbjNsf/XGKQk8rRHxcAYf9s
 IJiPWgL7EYJCLdcAv2BMpDIKgnw7VDATQdFzdCfzjgdjdXRjtlG6pLy0dzZVlB5A4WAk
 GUNhvXBf7WT4HF/V6dIX2jev+rusYa3pOL8zCDfLA2Z01+e6fgEJpIZUxA5Dl1+eDymC
 xDzvyx39gmG0kX2+RBXTFwJy/pK77OZyjwOBJEiRkC5DbU8le5psRExluDlQkd+beH8y
 CGBOCBRWRi5nSvW5oXvAi+Zu3oCl0P1GVfuuJ3DwXiiozfLj+s+RgA611NAb0dcx0qMp
 EJ+g==
X-Gm-Message-State: AFuF++n8sPqm2yzhjRkGnI0CZ77tWlZIZcPTRNgJnDiNBGp+yJ8SzAPb
 nFGhJx2j3ttmjnlyEM7BN+cQK9o3qpKnimSqeHQgDdEGuRd/ergAhdct4cbHDSfTgAzYkegBHYp
 ztrzNYiU=
X-Gm-Gg: AYBFou1rd8V6A0Q1YzIB+ITp+eM7eqt5V25SUlpcfFxWdhbz4qd0B4G3UGjJbCTPei3
 +nDfxZWBgBJKuFoNX8VTVr4Lbi/t2xiCL47PvRTHwvX2NGC1fl2RjT0i2Rnsr1sycWs15kDjdGo
 ePMxysj1tAPvqYxHWhXA4iR1HleQlqJxsVbAHwZEQpUc9sGiXZJvKyWfNVaUjI9HgHraU+jnFAg
 6aqKUSBQwI6fy90oJulRlzSwHuVuMVnGDTVndDNw5uIoiVqL6YyW/4RD5ZETqg3fPLaHuQtcR0p
 Z8FSDwK4zTMtVky5r5+fmXftw8oXBNeYlM9GYeIzCM6MFl/7NzPOf0U7ZdsTUreSQ44sSSbqs3r
 nawByTAxJzJRPjWsvX2uSFZeS/f9wQ0y7UcMJjYzAxPtbBKRfEuyFeUbQ/NdlurappfuSwapa12
 tbXzGTcTZGE41UJSnsaP1ybug4q4s4eRL1Bu8JjnMpHYXQMFdHePEsS2NsA3RQM1PiQoiDtqhEH
 iAx55CvRglXtApQzhB41hLP3a3gA/XuNLg9fHkX8vPj9Ftd7/b1LHQKGfWWvvg5yHEBQw==
X-Received: by 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id
 5b1f17b1804b1-49cf8269fdfmr222267565e9.13.1788786153787; 
 Mon, 07 Sep 2026 06:02:33 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee60bae6sm468589935e9.9.2026.09.07.06.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 06:02:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
Subject: [PATCH 7/8] target/arm: Don't register 64-bit TTBR0, TTBR1 for PMSA
Date: Mon,  7 Sep 2026 14:02:22 +0100
Message-ID: <20260907130223.3148989-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907130223.3148989-1-peter.maydell@linaro.org>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

We register the 64-bit versions of TTBR0 and TTBR1 in
lpae_cp_reginfo[], marking them as ARM_CP_ALIAS because the AArch64
definitions in vmsa_cp_reginfo[] will handle their migration.

However, this means that we are also defining these registers as
present in the Cortex-R52, which is a v8R PMSA CPU.  v8R does define
AMAIR0, AMAIR1 and the PAR, but does not have TTBR0 or TTBR1.

Split the TTBR0 and TTBR1 definitions into a new lpae_vmsa_cp_reginfo
which we only register when we have both LPAE and VMSA.

This is a migration break for Cortex-R52 CPUs (which we don't use in
any versioned machine type).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Detected because we ended up with the CP_ALIAS TTBR[01] registered
but not the TTBR[01]_EL1 cpregs that handled the migration.
---
 target/arm/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e4028e0eba6..b41e07e84b4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3098,6 +3098,9 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_64BIT, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.par_s),
                              offsetof(CPUARMState, cp15.par_ns)} },
+};
+
+static const ARMCPRegInfo lpae_vmsa_cp_reginfo[] = {
     { .name = "TTBR0", .cp = 15, .crm = 2, .opc1 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_64BIT | ARM_CP_ALIAS,
@@ -7226,6 +7229,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
     if (arm_feature(env, ARM_FEATURE_LPAE)) {
         define_arm_cp_regs(cpu, lpae_cp_reginfo);
+        if (!arm_feature(env, ARM_FEATURE_PMSA)) {
+            define_arm_cp_regs(cpu, lpae_vmsa_cp_reginfo);
+        }
     }
     if (cpu_isar_feature(aa32_jazelle, cpu)) {
         define_arm_cp_regs(cpu, jazelle_regs);
-- 
2.43.0


