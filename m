Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F10C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:45:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFol-0003aK-SZ; Wed, 12 Aug 2026 16:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoa-0003U3-FG
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:46 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoY-0002EW-W3
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:44 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so1775761b3a.1
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786567481; x=1787172281; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dBfwrVCq3v6OU1T4kao3X47pro2yBEmddrlxSU6VEk0=;
 b=i+1j6T5AQHxhQmOeqXwTEn4+Q9aHE79DIlj1FcJd2qyoXC2ws6HutdYfHgT1OqsRl8
 ir7v+uiztrCFsx/CDdz6E+RxzTiZmTjzRclM3soGJCZwEx2weLb9iTUd0EC4p5q9Wjgf
 sb6GZMl2ZwPHZmLRvwkOPVBL/u2c4iryaJxRGPME48wedua0LQu/CBsF9inW//2+dkip
 5bWK8tTOv6qdp7sXDZ2fTLVGb6sYsOppK8saM9+lS0vwnz8aPZcRJtqgmNfqMH07dtCb
 sKuuChjlF5UII41eQQeN0CtXDl42YwH0CLKb2e4gWbx4Z7ppuHhIYWFdzDqkVM5/vCgg
 gOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786567481; x=1787172281;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dBfwrVCq3v6OU1T4kao3X47pro2yBEmddrlxSU6VEk0=;
 b=lkZHTyxiiuDexrQ1EhRCZ2V61m1OICKW0C1mXbsFtfdix6VNf/bfNo80eEYHmzaxRE
 8pBe5eyFLc8/lEpQQ/KHdCGMrn7/bLDMPJvSlXiSbI1EJj+i2uF650AL0/V633S1huUV
 2d3bBlJj1ijzRgQl+NLCcfJovLrZ6raeN051U/3xipTnNGbPc3SucBgdVvIcRWkjJsct
 gsn2Fk3+6SpE90/OzYpSswm3ea8XezOnO5NHaRdJ9c/2YDO3NqJIRuWBT3IDySnNxvxy
 gwk8n2ejO1KlyytdhHn/ggILv+dhZYd+J8CsIais4tRQJZKinJ4TP3yqvzXZxsgkjRf1
 YGow==
X-Gm-Message-State: AOJu0Yx+iDEITHHtyhu7t5G8b1slwasPDvD7liOc6OFn/ng7qTAOYLVo
 4pn46mzTd6cv7mo6ukuKjgvPwlzpDJKmBiTirs9e2lLi9Neyu9GTJm2ZgRPgpH1P31U=
X-Gm-Gg: AR+sD12JFHSEq581fbu8LtFAjAgHcuQmfDK9CjWHIE0e8zfSyC0TarnT/W/J31pKC47
 is7w8U8amyTXc2nshm0ITMVrM7BphCNm+tj8sMomI9oOQGPuA/7YGd0SM6CF/GbrE5bd0JsQms5
 SRbg1YF96ic0BNdZJXSbnGd7bgciaMipLHJrhzcmi7OxmS5pbdTmNLElBsVyrfAg2yTiZgFOciw
 awHCSr9ZxfkaA7fEIwopJ0TgyCseYfD8KNGjKmWYHXf5roepV/jjfjJaqRsE3p53df+A56RCO/N
 asTV1xZ4yER32Zbs7VGpdzRl+nmecRnP1R+q+6w/RUOiExOS8D+jiJ4T7akzcgWvd2yVHl2hsFW
 T+UhaAf4tIBX48f81FIlno9NtWrwky6hxbtbjvhmL232SIB8L2DHDhypo3uqfPpqaDgmrdELurl
 Bc9+5v5S2MPPQkDWCX+k3p9qLz4IhwajbjqXq1UufIJ8KE5vgktmbYXBRNVU3aUv5Y1RKrSV57m
 HuCnZqfKQcmhQde0Eie
X-Received: by 2002:a05:6a00:3907:b0:847:97a4:d6b3 with SMTP id
 d2e1a72fcca58-84fc745d87cmr500477b3a.16.1786567481263; 
 Wed, 12 Aug 2026 13:44:41 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc4787325sm125308b3a.23.2026.08.12.13.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:44:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 03/10] target/arm: Pass aarch64_enabled to
 aarch64_aa32_a57_init
Date: Wed, 12 Aug 2026 13:44:28 -0700
Message-ID: <20260812204435.295067-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812204435.295067-1-richard.henderson@linaro.org>
References: <20260812204435.295067-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Invert aa32_only argument to what is actually used.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu-max.c   | 7 +++----
 target/arm/cpu64.c     | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9c9196475b..5e7f41a50d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1813,7 +1813,7 @@ void aarch64_max_tcg_initfn(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_sme_properties(Object *obj);
-void aarch64_aa32_a57_init(ARMCPU *cpu, bool aa32_only);
+void aarch64_aa32_a57_init(ARMCPU *cpu, bool aa64_enabled);
 void aarch64_host_initfn(Object *obj);
 
 /* Return true if the gdbstub is presenting an AArch64 CPU */
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index bd858f010c..edb5b9e6c3 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -16,10 +16,9 @@
 #include "target/arm/internals.h"
 #include "target/arm/cpregs.h"
 
-void aarch64_aa32_a57_init(ARMCPU *cpu, bool aa32_only)
+void aarch64_aa32_a57_init(ARMCPU *cpu, bool aarch64_enabled)
 {
     ARMISARegisters *isar = &cpu->isar;
-    const bool aarch64_enabled = !aa32_only;
 
     cpu->dtb_compatible = "arm,cortex-a57";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -207,7 +206,7 @@ static void cpu_max_initfn(Object *obj)
          * '-cpu max' for TCG: we currently do this as
          * "A57 with extra things"
          */
-        aarch64_aa32_a57_init(cpu, !aarch64_enabled);
+        aarch64_aa32_a57_init(cpu, aarch64_enabled);
         if (!aarch64_enabled) {
             aa32_max_features(cpu);
 #ifdef CONFIG_USER_ONLY
@@ -227,7 +226,7 @@ static void cpu_max_initfn(Object *obj)
 
     /* Ultimate fallback: -cpu max as cortex-a57. */
     assert(qtest_enabled());
-    aarch64_aa32_a57_init(cpu, !aarch64_enabled);
+    aarch64_aa32_a57_init(cpu, aarch64_enabled);
 }
 
 static const ARMCPUInfo arm_max_cpu = {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e3ee0253a0..faaf3ab879 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -688,7 +688,7 @@ void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
 
 static void aarch64_a57_initfn(Object *obj)
 {
-    aarch64_aa32_a57_init(ARM_CPU(obj), false);
+    aarch64_aa32_a57_init(ARM_CPU(obj), true);
 }
 
 static void aarch64_a53_initfn(Object *obj)
-- 
2.43.0


