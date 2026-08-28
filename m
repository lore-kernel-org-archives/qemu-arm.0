Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1783C61DCB
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:28:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0528-0002kz-G6; Fri, 28 Aug 2026 18:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0526-0002ih-DN
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:46 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0524-0002HU-1F
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:45 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2d71ae3455aso21848885ad.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956002; x=1788560802; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KR13c9n0s+ysXjQ32jlNfW+FisQREx18vtaeYTqxrDc=;
 b=QQlVLMbb45dXhjqNm1V/3B3w6b1E5svDNPx98HIdn/wrcS3muIAg9TW0lq0QG+RsXt
 mLoAkAGwKt1CrAD07avmYs33PmDIoGb/iy+BITwfHAGjeumEv3sOcYmeXFlWmROTVWJR
 9gcxhESBTBe5Vb5OAacMo0+Mo2K7cYB5mXtXxeorP/mTTu6H8o228eJf+HY0R04qAzKN
 Mjb99WOJZcI+NR//PoicmPXO0WUzDWyrhb9EgRFQl55s0Ykp/wwzKR9eg3Xf/5D4B9nA
 6/diKg+U5J8jy3NpODfqGGQjUVtItb5g+LT9R9Lscmds7G3o04oya7wb4rjkGDso3czs
 rfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956002; x=1788560802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KR13c9n0s+ysXjQ32jlNfW+FisQREx18vtaeYTqxrDc=;
 b=WUrNCGuRNbgjVdsq0yt1e/9rQUDv1cS+J2DdtS5AyIF3zhixaLqj/KwmmLe8z349Bj
 Dcx2pasDgaeaO0LXXgrDC8iXBvdvSISJ7ivTQncIn2SpHEYHkS4+CSdGu9JnU5vz2Dbq
 8CpDJ023phG2bWeVY7bR+rytPfzKveu3d1S4ZyvMqZuu5EsCticJWimSo5fAHHRLtBpU
 O63Ck9o20y8qNlgLEwmmazQKeMxuMj9s51RHEJlDpFPa/pevX3zdyqSKJXUvrbCJv2rf
 6F/GuymNoovj/nlJJNlGjP1vD7tku+wBlit3u4UaeUacGq/VYkO0fxJJYLGIooigN3wv
 AAxQ==
X-Gm-Message-State: AFuF++kYfoi2Q6KdPwa7hR40vFoji+0Z1iZRdwPA4V96DDVscKuhERPk
 1UdurVtJLkVzibfrrhxk+7yRGJqM/488YywSwHMzr1cHwDVK3n2zPbvVZwhW7sqyL4M3NaR9Ogh
 daicrnSY=
X-Gm-Gg: AYBFou3t/0InR53eSJ2I4JoTnFJCiaUhZGjcJ5foEYoqFYiq+11iPe4abKbWUQkQYSH
 JEz4yKFJkd7FQzGTqg5H4J+zGdZUoc/JlnVxt0NF+vzsyKCQdUMgzE21C8uI5TMI2XuRWOtCz7y
 d31DcbsQ1v8CpHPLnEFge/ThX60gWyHGn8SKx+urQ9X8/Th0ekql4qRHR4oawtx3L2tZYubKt1s
 WQdaS3eUGCnwAg6iO5fNXuj6DQvTREZcqC4GW9e3qVhJ0Jyb6poS/Cd/gucrkyULF+kE3nmuc2p
 v57Uqw8LJZ+M6cE8+PVQMjDBcz8xM7jBfExIPvtszilggGRXFclsmmNi08/wbEIu1x8/vgH32OD
 Ev1L1Gm0G2CrxyanVb9Ref65dr9iTSoj0+aqpY9GHosyjwSueOt2/17PZ+kc5lc2Viu8FEKUncX
 VAzBipX35PBV6k8BybACw9VvZaIXHDr7fEJFbmFPX1+g6/8t8FQDfgI84knZVt3TeLsu2n7Oj2T
 cScjlY+cfsKSlnjMNNT7f42gMf1XD8=
X-Received: by 2002:a17:903:32c2:b0:2d0:cc92:f7ae with SMTP id
 d9443c01a7336-2d74dbe3ef4mr166436055ad.3.1787956002164; 
 Fri, 28 Aug 2026 15:26:42 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/13] target/arm: Rename and adjust aarch32_max_v8_tcg_initfn
Date: Fri, 28 Aug 2026 15:26:27 -0700
Message-ID: <20260828222639.1432046-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu-max.c   | 2 +-
 target/arm/tcg/cpu32.c | 4 +++-
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
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index bc07e33877a..8397f26a864 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -855,8 +855,10 @@ void aa32_max_features(ARMCPU *cpu)
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


