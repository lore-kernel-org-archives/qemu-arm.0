Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0C7C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:45:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFoi-0003Xf-7M; Wed, 12 Aug 2026 16:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFof-0003WI-JP
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:49 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoe-0002Fj-0k
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:49 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84faf87d19dso23659b3a.3
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786567487; x=1787172287; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jwiqruiRehEXzTLHxQkNSDoYPqOOLh/gwgSxK/nLS4U=;
 b=hFV0rV3HpAkHaYnegdYyzEpq1HZzOMBjA1T5mzfKfd81oWfBZI/kY8+PI6gjWJEhkK
 en3Bvhwi+7iTLxiNHLh44oIYTZgGoS3ggbZCuaDHyWl6eYZKDwM8FmIVNKMaNOF91kHV
 BrCriAvg3EsigaKT+FxQJlfTNL5EI5OpPG8S+WolS+NRBEr1TiJM2Y4xkbX8NETmcEH+
 FL7ZqC68lYRboGq+IUdCmWMNvoJiNSXcJzm0BOhj5YEPWaKgoKgy4FsP8cPklDkWGzYv
 5TpCpKal4l1AblYYV23Ig3mh55zuOB+i+TkJCFfsiJMzoOSn7yaNALJosKcOjBx+YCwV
 9Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786567487; x=1787172287;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jwiqruiRehEXzTLHxQkNSDoYPqOOLh/gwgSxK/nLS4U=;
 b=Jqq0ZllSfjZOcbwpKzWA+9fnhsFleRgt8uwd0ajgyFuLkDFGM6Upw833383k2rnArp
 xytz1nPFpEp2mKJgPMsXPuR/+c+B2bhk3lKqZYQ8LOgUnLMpJ2iC5RWE3BZIreYpDbVb
 I60PNcRg0B/R7ckw5/W+UuKOYOdmCxXp3fIXnme0n4RLqngqv9O1WtZiNHXRsylNE8mz
 4KUQcaUXGfuki2eoICYtk353z5YDWHS/EJfLjfOiJz8SKXHI5OBFpMCGv3VgUUMBawXi
 ymeu3g0zSqyxnn3Cz4dk8x1jRyBYVgcg9o0/JstTV1UjpZ7n69IpfivaSQQ76lqiOAvr
 CGUA==
X-Gm-Message-State: AOJu0YzN89OUZS13NGQTzcp6sRajM5hGjxHfrLCMgzsQXAcHdyh3Vpye
 xhWLCzBRzgNFfVe7Yf/GCBVft1SdSFj4XROwzsN8cLisqio1ldmRVbwJfdQNvTBJ8r0eE55BxZg
 KSiwO
X-Gm-Gg: AR+sD13PJwCQartIMpkgco87ICf+OVa24VCtQlIs39Y/sAVYTa0R3pVo2qq0R4i435q
 lt/zCSUo7eKrklO9Yz+uTJCzpIW6tz481FDsPUv6nQmkIH0me9kbwOpPPJJ6WD/jHwBHqJ5pB8D
 zunCcppnMYaVWSjSTovMpTn240B6nCuP+BTJsAGpObDAOAL/tfHDSzCJ6Pp5s2WoMKJc7yozuLe
 qhlLBLaTVNJJGurPD54W5Ehmn1daQURT6I6Lml2Rvf3LeccM6NPhZ5LoO0mm/nM8B3T9MOklcXe
 UjauDcDgoUKucQEFs9qdNbGYyrIG4RuJoEZneMzfAGNKWm2XhkH9tlMDjmsW0lKSGCwUbdZjJA0
 bsCfXWyP1mAYp/PG1bKXSoxhlV9oicDtZWhmgssw4Y1qdtSmvTvObTEYb/Sq5wI43kpMF8lgxHd
 jS4htKolWK5wlKa9ERONvlJEga7RvPN8qPclyEdeOhD1sAR7+QdttjT6sYlfng1OoU2zdQXcn6Y
 pyAGKf/EHnjf7NFCAXP
X-Received: by 2002:a05:6a00:3285:b0:84f:5cd7:e3c6 with SMTP id
 d2e1a72fcca58-84fc6ce9245mr722536b3a.5.1786567479329; 
 Wed, 12 Aug 2026 13:44:39 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc4787325sm125308b3a.23.2026.08.12.13.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:44:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 02/10] target/arm: Pass ARMCPU to aarch64_aa32_a57_init
Date: Wed, 12 Aug 2026 13:44:27 -0700
Message-ID: <20260812204435.295067-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812204435.295067-1-richard.henderson@linaro.org>
References: <20260812204435.295067-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

There's no reason to pass Object when ARMCPU is more appropriate.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu-max.c   | 7 +++----
 target/arm/cpu64.c     | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4026f67579..9c9196475b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1813,7 +1813,7 @@ void aarch64_max_tcg_initfn(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_sme_properties(Object *obj);
-void aarch64_aa32_a57_init(Object *obj, bool aa32_only);
+void aarch64_aa32_a57_init(ARMCPU *cpu, bool aa32_only);
 void aarch64_host_initfn(Object *obj);
 
 /* Return true if the gdbstub is presenting an AArch64 CPU */
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 0a310d1b15..bd858f010c 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -16,9 +16,8 @@
 #include "target/arm/internals.h"
 #include "target/arm/cpregs.h"
 
-void aarch64_aa32_a57_init(Object *obj, bool aa32_only)
+void aarch64_aa32_a57_init(ARMCPU *cpu, bool aa32_only)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
     ARMISARegisters *isar = &cpu->isar;
     const bool aarch64_enabled = !aa32_only;
 
@@ -208,7 +207,7 @@ static void cpu_max_initfn(Object *obj)
          * '-cpu max' for TCG: we currently do this as
          * "A57 with extra things"
          */
-        aarch64_aa32_a57_init(obj, !aarch64_enabled);
+        aarch64_aa32_a57_init(cpu, !aarch64_enabled);
         if (!aarch64_enabled) {
             aa32_max_features(cpu);
 #ifdef CONFIG_USER_ONLY
@@ -228,7 +227,7 @@ static void cpu_max_initfn(Object *obj)
 
     /* Ultimate fallback: -cpu max as cortex-a57. */
     assert(qtest_enabled());
-    aarch64_aa32_a57_init(obj, !aarch64_enabled);
+    aarch64_aa32_a57_init(cpu, !aarch64_enabled);
 }
 
 static const ARMCPUInfo arm_max_cpu = {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2816735577..e3ee0253a0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -688,7 +688,7 @@ void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
 
 static void aarch64_a57_initfn(Object *obj)
 {
-    aarch64_aa32_a57_init(obj, false);
+    aarch64_aa32_a57_init(ARM_CPU(obj), false);
 }
 
 static void aarch64_a53_initfn(Object *obj)
-- 
2.43.0


