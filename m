Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53805CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:03:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXXJ-0001JP-9F; Thu, 14 Aug 2025 08:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXH-0001IF-KU
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:27 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXX4-000497-CT
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:26 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-321cf75482fso1868987a91.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176291; x=1755781091; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YD/jwVv7EfeMO//G4w/i2o2BFpzhHqMIzR3A1RI5g5E=;
 b=vfYICvMRVOReTUiIhmYCzNkX2urSd+JdQZ5d9xosRPIEZOCvCgG3HSWE2ti2AW9JLf
 SR3fzRDOzzirhfjvJjQRKVCg0hGTE5mhIZDzP66ygvFwhYTqbKghtRJmexcjb8UlmNcU
 Cc9CD4Njny2IRgFCSeG67liefqzbdW4gsQb4SoExcNe+dleHqxBRe1sxFEVWLXFXvYXJ
 9emevXbX+Wr+dU6FIdIWHND5YcIRCUQE4w43/LMTdMTtDygTLTo9iHMtNjil2bIzOr8t
 excUjIWhZ0LeAkajfaC6e6PZL9IW+SzbC00e6R7IFhZL6l6XHNJ4Z5ohr0YwKb1tpRPe
 /+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176291; x=1755781091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YD/jwVv7EfeMO//G4w/i2o2BFpzhHqMIzR3A1RI5g5E=;
 b=KhQG1JRGkeQE/juseJ7d+AVRoT/rAYF507yEjVRsWzIddLRfHLyi+4QC6QLqESbR3f
 vIGIBSMS1cpkdsEjJby9F8ypykLha4KUejBssNA66Wgujiw9QJODu4zfd8y3BB6kBek8
 Q70L2iByTX2l0E9+j/408CMcz56C3LO9MVq6mN4tsCouS/jCIiHjFRYooDwbqcnDrLGc
 NTaF7BZXJIzmogM51UiLmaD3mUTH1mosNHhR0ruU1RcqsiFLD4wrVKJ8gtJQDJe6CuC+
 DonTSHna4DRTCHWFUtRxs/XbHBv9oBGcIkaI1F7xqj/0CrUTx5fzs2fjxTDw2xVwj53Q
 G+Pg==
X-Gm-Message-State: AOJu0Ywu9D7rMZ/1Gyz/R9ULncss+9j6OdiI9j+tYRPiZ7N962J2Aa04
 ObQ7sSLmHIpejnn1p3RHkUjIrf7sRPGcdzvtI0U0yEvdfG6TjWxOrWV2LlKfRKuY5Qg=
X-Gm-Gg: ASbGncsekH/ydh04qTEPoXaVraF0P6rxdGAS6WHdk4o/4MysGR2vHGwwzBlNG+EeLAi
 C79J0U/UfNuvaDXJYFVfSnKGPqL8OygwDYue4fqWt3ic7olqnU0owALQ1i3euyGQm+fHfugC9p+
 QhBvgxeRBlqSu7YTGtXVZrngDic4cCCMVk7WDqNXy52480eacm9tPAlXFP0j6IHJtchkdHaYmUl
 Db3bx1DXvkqZ4ZvUgq4wwYgbqrvFN2cD2uVnjJgdqlEZzkaoJQPVddORk9XMtlr/1qiPQdVh8Uy
 8mlLrXFPfREGq+2Wknv8b6rc0WFZKsuDOAX4dAx5PIRJ5Xw3uL2lAUPPJJfsirX4iNqrFvngJHu
 snKOtO630hWfy4fSuld0X8TxtuYmT2TzRswavr6kYtzF6prU=
X-Google-Smtp-Source: AGHT+IF6yX1KhP668hLs+JOev07XbD8FRQTEqCJ+l1jMPo6gvzcqTztzNHiCYQ2qyNul8lAzflaPjg==
X-Received: by 2002:a17:90b:4c44:b0:321:335e:19cc with SMTP id
 98e67ed59e1d1-3232969b32emr3539245a91.4.1755176290685; 
 Thu, 14 Aug 2025 05:58:10 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:58:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 03/85] linux-user/aarch64: Generate ESR signal records
Date: Thu, 14 Aug 2025 22:56:30 +1000
Message-ID: <20250814125752.164107-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c |  3 +++
 linux-user/aarch64/signal.c   | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index deb45eaa73..da89dbb095 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -33,6 +33,9 @@ static void signal_for_exception(CPUARMState *env, vaddr addr)
     uint32_t syn = env->exception.syndrome;
     int si_code, si_signo;
 
+    /* Let signal delivery see that ESR is live. */
+    env->cp15.esr_el[1] = syn;
+
     switch (syn_get_ec(syn)) {
     case EC_DATAABORT:
     case EC_INSNABORT:
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 668353bbda..ef97be3ac7 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -65,6 +65,13 @@ struct target_fpsimd_context {
     uint64_t vregs[32 * 2]; /* really uint128_t vregs[32] */
 };
 
+#define TARGET_ESR_MAGIC    0x45535201
+
+struct target_esr_context {
+    struct target_aarch64_ctx head;
+    uint64_t esr;
+};
+
 #define TARGET_EXTRA_MAGIC  0x45585401
 
 struct target_extra_context {
@@ -201,6 +208,14 @@ static void target_setup_fpsimd_record(struct target_fpsimd_context *fpsimd,
     }
 }
 
+static void target_setup_esr_record(struct target_esr_context *ctx,
+                                    CPUARMState *env)
+{
+    __put_user(TARGET_ESR_MAGIC, &ctx->head.magic);
+    __put_user(sizeof(*ctx), &ctx->head.size);
+    __put_user(env->cp15.esr_el[1], &ctx->esr);
+}
+
 static void target_setup_extra_record(struct target_extra_context *extra,
                                       uint64_t datap, uint32_t extra_size)
 {
@@ -531,6 +546,9 @@ static int target_restore_sigframe(CPUARMState *env,
             fpsimd = (struct target_fpsimd_context *)ctx;
             break;
 
+        case TARGET_ESR_MAGIC:
+            break; /* ignore */
+
         case TARGET_SVE_MAGIC:
             if (sve || size < sizeof(struct target_sve_context)) {
                 goto err;
@@ -683,7 +701,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                uc.tuc_mcontext.__reserved),
     };
     int fpsimd_ofs, fr_ofs, sve_ofs = 0, za_ofs = 0, tpidr2_ofs = 0;
-    int zt_ofs = 0;
+    int zt_ofs = 0, esr_ofs = 0;
     int sve_size = 0, za_size = 0, tpidr2_size = 0, zt_size = 0;
     struct target_rt_sigframe *frame;
     struct target_rt_frame_record *fr;
@@ -693,6 +711,15 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     fpsimd_ofs = alloc_sigframe_space(sizeof(struct target_fpsimd_context),
                                       &layout);
 
+    /*
+     * In user mode, ESR_EL1 is only set by cpu_loop while queueing the
+     * signal, and it's only valid for the one sync insn.
+     */
+    if (env->cp15.esr_el[1]) {
+        esr_ofs = alloc_sigframe_space(sizeof(struct target_esr_context),
+                                       &layout);
+    }
+
     /* SVE state needs saving only if it exists.  */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env)) ||
         cpu_isar_feature(aa64_sme, env_archcpu(env))) {
@@ -754,6 +781,11 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     target_setup_general_frame(frame, env, set);
     target_setup_fpsimd_record((void *)frame + fpsimd_ofs, env);
+    if (esr_ofs) {
+        target_setup_esr_record((void *)frame + esr_ofs, env);
+        /* Leave ESR_EL1 clear while it's not relevant. */
+        env->cp15.esr_el[1] = 0;
+    }
     target_setup_end_record((void *)frame + layout.std_end_ofs);
     if (layout.extra_ofs) {
         target_setup_extra_record((void *)frame + layout.extra_ofs,
-- 
2.43.0


