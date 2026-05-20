Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1B5CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPleG-0007kA-9g; Wed, 20 May 2026 14:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcP-0004LI-6j
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcM-0002Ff-HE
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:08 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2babfd18435so22350505ad.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301562; x=1779906362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ke6jInMIcSbZvQJLAez0XGyYiEeJ5p5eH1CrpDu09no=;
 b=VY1i5J61y9btwiSc5jBvBfx7CvjFc1Se1cOvtRBzY0lAuP5/txqfVZK/uA2VkT+YYR
 O91//TN9AmDknTxXvFWYTCtmfacLlwMrJnPaM+KnVn4oRmOnEVQ3JTAx1xVUvxLXFJvr
 DxRYCgKtsjUj8HjCm84T+0hj7udxZBJ4OAZcjAWgcaf+wvn/rvFoO32hmOW19TKTCzyO
 hikDmWArU1dKvCpXpcOqCQUNxFMgtEmibLOhJxBDwGmKame1nPfRJYkhUIbx+ocy1qCh
 rcJW4GDkCW89ezrKhbdSQ/GP8ET3we8FQzbvfnJHnKFQeeK7dvujC0pkYVVE127VZIT7
 DtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301562; x=1779906362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ke6jInMIcSbZvQJLAez0XGyYiEeJ5p5eH1CrpDu09no=;
 b=dJibTdRLAe2icFNHXxhE+Z6cHksehwRSTjHsQkEawZaEl/GGCj5+kdbFcqJ5JDxasS
 JLPbqlQZjomICRbFcAU802NZP3PrJd/3vNEarmyoPWtpAtrV2go793bBFS2WlF9gapqf
 uX4Qb4YD+lLF5r8dQTKoNK5E78eCKfaC9jimWDDWENpxP245w4lyCzjeDigkoSZpR1tL
 NYuciB6RNmn7xlIv6WYvfOQ0p1G+h8hu67Ugsi5p1x1e6Shv8fbEmif35zQcTdVd6cmX
 UFlE6Wf/wV0r1x5OIUmmnSEQIWx+18KUMD1VCfKonXiPlxBnPeHksUQuXLa8tlD6oeCo
 Uttw==
X-Gm-Message-State: AOJu0YyVKNpbDz9S7waann3ZoI8EyKIfCHe8K33ztVI41hSZa9KD5HnB
 HIcLRtL91K5jJ+2wltZ+boNagOCMXx4Sap2Tb00XkVE7QYis6QTAZ1bFVESRxrHMuBhzraMHvuH
 pBURcdg0=
X-Gm-Gg: Acq92OFqXO0x9vKLoAFvPz68cmCZroMucFYWSXq6UewKvdriWzZWT8JhwDExXLlalqT
 kPePQOZ/FdfChjSj6awHUGPZuoLMbC7qatydi3xRZdYQ/7r6tLLrR6qaB4MSgvktAl2CVaOqt7j
 8aYqEiP2KfIE1FZofgVOXWMQFtPk0Llv1UEavt/k60+s6JWeH6G808w5N16JM19ICf5YqZ48FXE
 UQ4TAEdfzw+dsnrOe8+HKp5NP2D/ZEijJiEVd2J34I8KECwQdBxKrPu+a8u120E3Ih2bRTO6ZFH
 KfKxZQWBSk5nRnBLDyQPVcDQbk9m/TKyf3LfKdOkS7uHVW3FHn4OZBWZFkVLbaTcY3RBvhUYKDa
 jqFVRloMvsqvjQOFRX1imKsVW0fVa7BP0nkP6wX55/T6HgVm3O+aI5w5LcQOMmgyklb+d5ittdP
 aUFf7/0kzWYakaPABFfRAty4czDlA+
X-Received: by 2002:a17:902:f084:b0:2b2:57df:264d with SMTP id
 d9443c01a7336-2bd7e8cbce3mr173162295ad.33.1779301561774; 
 Wed, 20 May 2026 11:26:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:26:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 64/64] linux-user/aarch64: Implement FPMR signal frames
Date: Wed, 20 May 2026 11:22:13 -0700
Message-ID: <20260520182213.872945-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
 linux-user/aarch64/signal.c | 44 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index f7edfa249e..899fce7643 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -73,6 +73,13 @@ struct target_esr_context {
     uint64_t esr;
 };
 
+#define TARGET_FPMR_MAGIC   0x46504d52
+
+struct target_fpmr_context {
+    struct target_aarch64_ctx head;
+    uint64_t fpmr;
+};
+
 #define TARGET_EXTRA_MAGIC  0x45585401
 
 struct target_extra_context {
@@ -362,6 +369,14 @@ static bool target_setup_gcs_record(struct target_gcs_context *ctx,
     return true;
 }
 
+static void target_setup_fpmr_record(struct target_fpmr_context *ctx,
+                                     CPUARMState *env)
+{
+    __put_user(TARGET_FPMR_MAGIC, &ctx->head.magic);
+    __put_user(sizeof(*ctx), &ctx->head.size);
+    __put_user(env->vfp.fpmr, &ctx->fpmr);
+}
+
 static void target_restore_general_frame(CPUARMState *env,
                                          struct target_rt_sigframe *sf)
 {
@@ -518,6 +533,12 @@ static void target_restore_tpidr2_record(CPUARMState *env,
     __get_user(env->cp15.tpidr2_el0, &tpidr2->tpidr2);
 }
 
+static void target_restore_fpmr_record(CPUARMState *env,
+                                       struct target_fpmr_context *fpmr)
+{
+    __get_user(env->vfp.fpmr, &fpmr->fpmr);
+}
+
 static bool target_restore_zt_record(CPUARMState *env,
                                      struct target_zt_context *zt, int size,
                                      int svcr)
@@ -610,6 +631,7 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_tpidr2_context *tpidr2 = NULL;
     struct target_zt_context *zt = NULL;
     struct target_gcs_context *gcs = NULL;
+    struct target_fpmr_context *fpmr = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
     bool rebuild_hflags = false;
@@ -691,6 +713,15 @@ static int target_restore_sigframe(CPUARMState *env,
             gcs = (struct target_gcs_context *)ctx;
             break;
 
+        case TARGET_FPMR_MAGIC:
+            if (fpmr
+                || size != sizeof(struct target_fpmr_context)
+                || !cpu_isar_feature(aa64_fpmr, env_archcpu(env))) {
+                goto err;
+            }
+            fpmr = (struct target_fpmr_context *)ctx;
+            break;
+
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
                 goto err;
@@ -735,6 +766,9 @@ static int target_restore_sigframe(CPUARMState *env,
     if (tpidr2) {
         target_restore_tpidr2_record(env, tpidr2);
     }
+    if (fpmr) {
+        target_restore_fpmr_record(env, fpmr);
+    }
     /*
      * NB that we must restore ZT after ZA so the check that there's
      * no ZT record if SVCR.ZA is 0 gets the right value of SVCR.
@@ -817,7 +851,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                uc.tuc_mcontext.__reserved),
     };
     int fpsimd_ofs, fr_ofs, sve_ofs = 0, za_ofs = 0, tpidr2_ofs = 0;
-    int zt_ofs = 0, esr_ofs = 0, gcs_ofs = 0;
+    int zt_ofs = 0, esr_ofs = 0, gcs_ofs = 0, fpmr_ofs = 0;
     int sve_size = 0, za_size = 0, tpidr2_size = 0, zt_size = 0;
     struct target_rt_sigframe *frame;
     struct target_rt_frame_record *fr;
@@ -841,6 +875,11 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                        &layout);
     }
 
+    if (cpu_isar_feature(aa64_fpmr, env_archcpu(env))) {
+        fpmr_ofs = alloc_sigframe_space(sizeof(struct target_fpmr_context),
+                                        &layout);
+    }
+
     /* SVE state needs saving only if it exists.  */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env)) ||
         cpu_isar_feature(aa64_sme, env_archcpu(env))) {
@@ -917,6 +956,9 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         !target_setup_gcs_record((void *)frame + gcs_ofs, env, return_addr)) {
         goto give_sigsegv;
     }
+    if (fpmr_ofs) {
+        target_setup_fpmr_record((void *)frame + fpmr_ofs, env);
+    }
     target_setup_end_record((void *)frame + layout.std_end_ofs);
     if (layout.extra_ofs) {
         target_setup_extra_record((void *)frame + layout.extra_ofs,
-- 
2.43.0


