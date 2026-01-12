Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFECCC9EC68
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFE5-0007AF-P0; Mon, 12 Jan 2026 05:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFE3-0006zV-Ua
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:43 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFE2-0001x6-5H
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:43 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477770019e4so47118945e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213960; x=1768818760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0DOizNYs3UPa9+lJDtLfBdhlsyXMboB2ENpO7Py5Ag=;
 b=jX39qEahLZvE4Oml5RskVSjhsVRP/SNaPrFgHOJQC31KoM7yNWRjFD0B3BMz8B0vcY
 m9q5RjBPa+QyLuEeW9eeeSFj5bmKTuG04QPaC0VCGBBJcDwHS84IX0GqvXw7T7I2ouIo
 GC8mOpoKijZSTWyKC3HSIaVLZ0dZDMoqH0eMXlTE5bEge5ryjGt5+pbTzDxTeC8COfIo
 g5NwWBFolWeXXXY8t/t32e9Q4jTYb1ljQDjzv31cE/zijka7ohfTLvjs6YejebggX/2l
 iE6Bfc6cyt73PiZ6zIr2EMfyuN8z30o+BXsKkYaaVU+MEk9MkKWF9iwnU9No1COIyKR9
 wV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213960; x=1768818760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O0DOizNYs3UPa9+lJDtLfBdhlsyXMboB2ENpO7Py5Ag=;
 b=nJrPJnhf7iLwuf0FlOrqRv1topUef1wWUu65QUlRl5r8HFx/qyOvrxWYHgwlVTiBeL
 jhC6frUsdz63BpD9U+w8ipJRQXkiRjTC6b+rVxDVphMj9L+vTywgNPK7Mt8KM8yZla1W
 ZmecLUQKh5lpyWEWj5HeMN2uvBQ1R6fN6nZZk67r7SZbXKRdMYZSXU4gPqLob3x5jvrW
 LfR2XnhUqsE7iMiTLER9xsiq6Yz6bnVRQSrI36y8c17/pyYiIi87vW/Lf5R+zka/xnh5
 80Vm6Mj5DTN5Me0euOy3UJ+wldy3nJcT48Js2FKzca25gN8z3pA1WmVssxFYbE3g2fWN
 hx0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPs5UPLy9NlH+zRZMKOj3cSJ3gdO4N2ZeBipLwPND9GsLDDJx8serPAjhbSmzKKZpozth9qe5i/Q==@nongnu.org
X-Gm-Message-State: AOJu0YwDY3ke8FO1IMu4j6rb57gceCbCe1Ex+g0WhCvHQErybNqcL0/m
 uDPgbqpIBeRCU8fNykg+o2jgtJ8IUCYUUUcvMuYtf3QmUpv79UeBfQpZHN8tgOXwQjw=
X-Gm-Gg: AY/fxX4Rwtc5tNmhCVc3G1ysU8CQaZB+sJMMiaBiJN+n6Y5SXHilnM3cPf4196qmofS
 cEI2It5fTRUiFHE8tDysGAwE2HodOLTIRPd9PopafFsHOD6F3odT6eRv0mOQuyA+Rf6DvSw12OT
 u+jNosD/N/L4BGeDufYqy9u2AAXXzVdHthksm1xoI4APQvtxEKAdHNt3rKQa9Fa8iig1VASdKy4
 mnGLNOWr8vW0dwP6BwbgEFDFH58oR/jwvKV1UiC3gEYcykBqldaAcr5Kp+3tLcAMx0I/iqJR0wq
 8bPFywBZAGRQPgQLEHh6OI7z7S4vyXStDUFbmrkN5QleELHZ3t/+TeX5ttRIvFomNh1zMggmvkn
 TLMSjkEs2rs9xHa8F3B5bUhy/6dDrsbEXZXU3qhMUNteT243AtRcOkVKCjWIJRpmiso/8C7mb/S
 i3yuVJzxRoBdMTIikU+XPdvzvD+QxzNN6NQwJ2UG+sMKQ8y5ZFB/RGe8anjrKj
X-Google-Smtp-Source: AGHT+IGbiSyJ0w/Aqv3K13j9oAQ3PQ8IlZI+mIeWFoPwtrGwy09HAZAVqSNQ7z1HxKEziolaSfhfyA==
X-Received: by 2002:a05:600c:4f53:b0:477:7991:5d1e with SMTP id
 5b1f17b1804b1-47d84b3860fmr168540275e9.25.1768213960429; 
 Mon, 12 Jan 2026 02:32:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d865e3dfasm125106095e9.2.2026.01.12.02.32.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:32:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 18/19] target/arm/hvf: Really set Generic Timer counter
 frequency
Date: Mon, 12 Jan 2026 11:30:32 +0100
Message-ID: <20260112103034.65310-19-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/arm/hvf/hvf.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bf8bed1495d..e4c0d936f1f 100644
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
2.52.0


