Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C5BCCFA06
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:19:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFreN-0003lz-QM; Mon, 03 Nov 2025 05:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFre8-0003De-EV
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:18:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFre4-0003lQ-VF
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:18:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so3382836f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762165112; x=1762769912; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UvXFIS/LP/8nn2LaWPgW13nQ8RvlKKCfqWkyp2+R/Cs=;
 b=ADyeT/MkdtsAQqHfgtIP7XX2MU+pNlm/O2hULik6qXByTAdxOPWzcymzROH6il3xd7
 BXU5pWH26nDQfQbrfQC4mCSrTrcOakSD2atuXCKBjRb/2SU2Y2wodwYhv/QaKc4iE58m
 fax1ij519ckI9Ux2yWORG05NJea9qPZc4IR4BTKxxQJa8Y1G4C+4E1Vn+HoSqhJMrPNM
 bWBVaRnyHPedS08fE2WBMWlLQ8tmYCzhSXsLtqXUaVNEWpkxl1f0xMPuRDI6FOdb+Bm/
 BgqwT++dviNQyc3I44DlLtqxLp750EFLy1Rk+oc5BZ7XZIA3BJWSj1ISWFVK9YTMOy3G
 d4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165112; x=1762769912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UvXFIS/LP/8nn2LaWPgW13nQ8RvlKKCfqWkyp2+R/Cs=;
 b=fFWLboGt3qCm8JLjSDaVqL37drl1AixziPqXwSf7ATR5oISSNNLVW+xNegz4JdyOuL
 j2RqLFhNxjHXJKI2aFohu+Ui5sjZQ2kEMoflloGnrSkAFA0G1sHHRqnHCBdQQMhsIrS1
 19CMKL8xuPscmfhf0p74rRV07L/Kg/1g3dMLQIXHzu8nqXoCtGMfaIg7lQ3ay+iMjrEF
 7s25NvNASgALKsgEjH0mpqPwbbulj6m+4s+RQRMDf0nL7rU7TsCqT1bl5Hv4HecRPT49
 RHwCPU+Ae+Pcez/H7EishJPJjQSbPAa479qDk2QUs5t6v/tMsWaNg48sAMU62uwgx5xc
 0kZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu+P9g306sw8OEqxFjzNtTyOKmJ1gzDxYqATDXy2DBj8Nb/VKPiAqhEi+JF9LUMpNv4n5/bSt/Pw==@nongnu.org
X-Gm-Message-State: AOJu0YwwO2VAVBxpyLrOurd0E0bsZyiTOBh8ZwdKF04EJdaJeZEvfeeE
 w5LuRR95VupNy7vYrsiEyRcufWB7MlMwaD4ffI08WO251uxmLaEyZUFlZLZl3xuHjtU=
X-Gm-Gg: ASbGnctmpOPwMKjuE7yLiCzdn2Tko3QddyE9xLlyzVkdjtHu9QGJcvW7fFoVbIsVPSp
 pc8CohIULN/dqQ/Wl9yT8R6p/UP/40muL8IAr+eFc6LwanZD1YwKwCBHgs2P4Njf3e3Vcy8Kydz
 Hqtq4M8FvRwIQlbxBEGbJvZmlscsq2fKq55NCicxx4kVcIz5q+DyHOriMxUb8U28onZljIi5sJg
 ik/LGiz0oMZ0RlZt4MP5WHC2cD2WGddaNvBjsfb/D/vS+Q1DuaNlkUy+yksYxmvosVgCI/Yr1YY
 F7iZnCvtLetczh2OVwJRdIhxEcXbH+X63FpmPG4kMBhd5fjJ6TXzUroGvkldENE07VCKxmXenNg
 Upzrkam+eZocqF0BCJhKVU0Ar/ojb38UDepfh0GTxmc+erKkYiw9YcuTQ6zV9Woh07YgJEFk/2+
 /JxjQpZEucEmDKSpRJRChk62ri6ffhIyu5Od0+bMMCJA3NJHjEanO8KSvSqx01kx/29AoibQ==
X-Google-Smtp-Source: AGHT+IEZPmXb9AuZbO3edqPAeyC3GTTTsz0OrkAmCVLQWI7tHPkC2qbXn4ILunz1PRBvcZ1LcLlnbg==
X-Received: by 2002:a05:6000:2f86:b0:428:1475:6a26 with SMTP id
 ffacd0b85a97d-429bd6b354amr10603949f8f.56.1762165112453; 
 Mon, 03 Nov 2025 02:18:32 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fd280fbsm85650255e9.5.2025.11.03.02.18.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:18:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 18/23] target/arm/hvf: Really set Generic Timer counter
 frequency
Date: Mon,  3 Nov 2025 11:10:27 +0100
Message-ID: <20251103101034.59039-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Setting ARMCPU::gt_cntfrq_hz in hvf_arch_init_vcpu() is
not correct because the timers have already be initialized
with the default frequency.

Set it earlier in the AccelOpsClass::cpu_target_realize()
handler instead, and assert the value is correct when
reaching hvf_arch_init_vcpu().

Fixes: a1477da3dde ("hvf: Add Apple Silicon support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8208d345daa..e1113e3d6ca 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -897,6 +897,13 @@ cleanup:
     return ret;
 }
 
+static uint64_t get_cntfrq_el0(void)
+{
+    uint64_t freq_hz = 0;
+    asm volatile("mrs %0, cntfrq_el0" : "=r"(freq_hz));
+    return freq_hz;
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -908,7 +915,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     int i;
 
     env->aarch64 = true;
-    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* system count frequency sanity check */
+    assert(arm_cpu->gt_cntfrq_hz == get_cntfrq_el0());
 
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
@@ -974,6 +983,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /*
+     * We must set the counter frequency HVF will be using
+     * early, before arm_cpu_realizefn initializes the timers
+     * with it.
+     */
+    cpu->gt_cntfrq_hz = get_cntfrq_el0();
+
     return true;
 }
 
-- 
2.51.0


