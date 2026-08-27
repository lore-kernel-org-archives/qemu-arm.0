Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E51C5DF9D
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 04:18:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzRXL-00079V-FD; Thu, 27 Aug 2026 00:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRXF-00076T-0E
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:16:17 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRXC-0006Rr-By
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:16:16 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-39675172593so1479951a91.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 21:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787804173; x=1788408973; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=83aT+OUoVaSXUBZswXWe9rjbvcEl2UZbMtOlAN3Bbm0=;
 b=mlqZTUjtGbWvHRKFGjxdtOaChXvz5kNhC4O0WmFdoHSZ7wj5u8tRcJksaSArj6sibM
 MzWY9qMzZ1Ve+CmBMBmHYezb0v6dLhJiSxidQ7UVvCE96mD1nsDoQ3Y80502IPrufGlS
 FSyZNdzzAHLAcIp6EOjPd2dq2nkyg8/z5LUmZCLspHTWKR/VpY/XxDxWLGhbc+1h7bBI
 wvgKzOFdV3ssjfJhKiQyJNVCeGU1vhNGaXq41WOx+m7yLrSMe7JRS1c4ePD2ydOqzP94
 tnArGSjKrrFaxr6QZfOpHoGZmNSpdh9M38mxUifOEpfb6odD9ePGpBHD9Wubs3aNF7vm
 zodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787804173; x=1788408973;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=83aT+OUoVaSXUBZswXWe9rjbvcEl2UZbMtOlAN3Bbm0=;
 b=ES9URuEKluPxTSQy3gwl+L0dsF6uKZZJDBycq0OLckJOELXbAtalifa0Pz+2F5aaQd
 aRqw6Zjhz5fA/pGr2FtbpJtE2kuJ0NRug+Wd7Eqb7dQPoAN4Myn/32j4nPpnPChnxX1K
 W5IYWjUplSRpITSIP5xX5ggAxwgEb+jvaAgw2P209WwrhWm0r5auAnK5fU2MZZOCwEGy
 BMbiGsIFoYlZWYSwiK/rmJQl01urhaqh9+Khbl+TGL7aLUL2GlclywbIYqpuXfWDCtZV
 IySp7HB/N5QUjgqECJUGjQFWm4Ys86ovt3374PmTWKPhxYZjq/5XH2RMdKSfpsxxfD4w
 Puvw==
X-Gm-Message-State: AFuF++kcA3LgsY06NE0rdwWzCfVbGlLEltqV9/R96rgfvgVJpmgBSQ+t
 k+mdQ7RkE1SmPNCpTF0l4o77HPzQg9vRCtYEZaUftzoTcDqkdqjnCJZsYr64bsvSaDY=
X-Gm-Gg: AR+sD13xMA6FUYh6RAA/G6RRuseKqf4QuA/BAS+JczkrRxSLf+EDEP1rjUFG5TYrLB4
 qGWkX4f5oIo+2PBKtGLFsUM+/Y9kCts++dgSLMfjkXgKDqiQA70GmeV6IRuiEajSEkszFR9R+nY
 NHWskY01zVHr2ASX84ioe4iylZPzSHtUEd54z58JXUecnQXKS5EQO8senHjsL9medtfswThQmlO
 suI8rSoN1Wz3mc4KSwX1Rp6hR3XY+JUY0isenEgRXK5cuhNvNeN9tDiQ84NNIPrB+h1BwKe409C
 Cy1aLamuhnkIERtBhPoZoFUIGBihkrfPWqHDCc+sEg+A3gnXyKJQq8IBK3luuia4m6WAhatuR9B
 t/6VEs6PHYNQ+gBIjlHVJqztcp7uwbCT/RULZYnkVFx3JOL7JI39I/xrbXVIBI+IxsCisq8Dyj5
 BtlasGFlEZcJbepuu8EM90sK+nRzn2xI3P0X+GIcg7G4/td+FNTSiW7MgaMvzIP9lBDgjHQgaIX
 fMUTs/lK3bfl5pEB6E=
X-Received: by 2002:a17:90b:4e8f:b0:38e:2517:5d1f with SMTP id
 98e67ed59e1d1-3966d4032e5mr26919545a91.9.1787804172837; 
 Wed, 26 Aug 2026 21:16:12 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b0d81682sm969597a91.7.2026.08.26.21.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 21:16:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com,
 philmd@oss.qualcomm.com
Subject: [PATCH v4 3/6] target/arm: Rename and adjust aarch32_max_v8_tcg_initfn
Date: Wed, 26 Aug 2026 21:15:54 -0700
Message-ID: <20260827041557.775080-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827041557.775080-1-richard.henderson@linaro.org>
References: <20260827041557.775080-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Rename from aarch32_max_tcg_init and take an Object pointer,
in preparation from being used with TypeInit.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      | 2 +-
 target/arm/cpu-max.c        | 2 +-
 target/arm/tcg/cpu-max-v8.c | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f6b4e173a54..fc7d5ad6f2c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1838,7 +1838,7 @@ uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure,
 bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
-void aarch32_max_tcg_init(ARMCPU *cpu);
+void aarch32_max_v8_tcg_initfn(Object *obj);
 int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 4df52bcb08e..9ed45c8764f 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -108,7 +108,7 @@ static void cpu_max_initfn(Object *obj)
 
     if (tcg_enabled()) {
         if (!aarch64_enabled) {
-            aarch32_max_tcg_init(cpu);
+            aarch32_max_v8_tcg_initfn(obj);
         } else {
             aarch64_max_tcg_initfn(obj);
         }
diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
index 5c0ba28edf8..5a9845d88f3 100644
--- a/target/arm/tcg/cpu-max-v8.c
+++ b/target/arm/tcg/cpu-max-v8.c
@@ -101,8 +101,10 @@ void aa32_max_features(ARMCPU *cpu)
     FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
 }
 
-void aarch32_max_tcg_init(ARMCPU *cpu)
+void aarch32_max_v8_tcg_initfn(Object *obj)
 {
+    ARMCPU *cpu = ARM_CPU(obj);
+
     aarch64_aa32_a57_init(cpu, false);
     aa32_max_features(cpu);
 #ifdef CONFIG_USER_ONLY
-- 
2.53.0


