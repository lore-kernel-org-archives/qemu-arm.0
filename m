Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A51CD6E45
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 08:31:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSsbb-0001fh-Pt; Fri, 29 May 2026 04:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSsbP-0001QD-0n
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:29:59 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSsbM-0005SJ-9a
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:29:58 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso118463345e9.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780043395; x=1780648195; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icgEPrF2PyrBaUqEkggw3Y3TmAdUSPZeT980MGVssa8=;
 b=qftbTid84zn7a1WAe8r07b1eU5mS/dWGYqIphyb8PR0Jnmtwzr386QqGCXdevS1yuF
 mBQncINz7AP6L9pVeIYuzNz1tgQnNoyOcD5EuVkYXD6s4C1OwJl49iqPbRz+ZFTQW5n1
 kgkDRAWxSqGdsI3KGDmcwk8ZUoIHWwHoUblmSb88iLc+N2HyBkj/HOhuWU/UHQUwGbIC
 fwuz3/bgRPxOvPEsdEQh6HsoMEnGn1AbvWAUEquSGiQUmCMFNbjswUN7QgtJIx/6EJAC
 P4KpdctgvVf4OQKvhgJvBqwyOFby9iWD04jfD8D2lSXlFcKls0vyLNyNNSsziupA6XA/
 P/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043395; x=1780648195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=icgEPrF2PyrBaUqEkggw3Y3TmAdUSPZeT980MGVssa8=;
 b=Gv58cLfsy0gA/ZIBkWWtGIsgQyyHMrQn7zaCM1TADc7uAhgr4AxjifPcR7EKgXfbSb
 fnVmUCH/FKVPbQJ/uLBoxhw0E8TMCA/YP4qg1bAMjABGU0YBFI29HPHon2INcd+g5xLt
 9Q//Lo4b3wOWskCgcA6hitAqM4TiSELoRee11d4BYHH70WSK45I10+P3C/fqxVfKXruS
 Hy3+7a45FAQL5Mk2/Mgjo7Jyn0EAsx4ip9A6Sz/5VAKVPKHtZf2LH001x1aaeIFcpZ3I
 35kxyNNIb02eDVQyYqoylJIdgfaz2no2yyFGjR3CBKR/P24JYIlE8kT34Ey3igfffuNP
 k/mQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bVhPYFsNkbs3uOrzxJ32n9HG3FM1bZA8TUkVUpxYviwVlpN4HZfo+lEtXSpegRyRZk9UW4G5VRA==@nongnu.org
X-Gm-Message-State: AOJu0Yyc41PbivEmdu38do/ewxIV8sIKvfK/0i0DcgqDGhGHg3Yxkhh+
 Jnt+ZzpHkVDpyG6Rb72RI9yFHRXStoG78Q4QnQnZCMxfQtluudn1+ZQdnLtgZISMGXQ=
X-Gm-Gg: Acq92OEureR/9jNmvKMZ1wKSW6XrhQKnpfDu35KQLwQGnLa5Oee1PuSC9BSKmwQpvJ6
 1+lGLe42xknc2z4NIdkY9oofTbBbzrgKXyFYYt2GHMdFxnr66Z3xyVN2u77wt96kh+PNZ6xhXRL
 yWTR3Dq/ICLRxo17aNQwVDNLmLG31p+wAEeouWcASFX9KY1Dih4Tzhy5CCBzw9+DWYUXZGVNx8S
 pBOhUpTrzKQJSY/fRVHIG5yC9rLBmnv/hEPtd/AZGBb23MTBF7I1bshZn3pHDiE4esyYnHbQGWf
 Gi4HNzXiXw6Ovgyup879N5wSMHW9R/Ce/jo56jbJBgMHTKkfZefV3qdm1Oobhm+FC2wc70nqi1W
 X1+3XL9/Axr9LUXYgYNuhkgjLvQ+wQ8CbTpc9fAWyIT9dixBJO1k1btLP2/QJwFwKm2Na/NTiwt
 imPMMkWa/iNPElFunF5c/T60VFOykbDX+NDA==
X-Received: by 2002:a05:600c:644:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-4909c07b4c7mr20113755e9.8.1780043394760; 
 Fri, 29 May 2026 01:29:54 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c0498e0sm12827755e9.0.2026.05.29.01.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E1C3160E17;
 Fri, 29 May 2026 09:29:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 7/8] target/arm: handle the WFE trap case
Date: Fri, 29 May 2026 09:29:46 +0100
Message-ID: <20260529082948.363931-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529082948.363931-1-alex.bennee@linaro.org>
References: <20260529082948.363931-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Now WFE can actually suspend on A-profile we also need to handle when
its trapped. To do this we need to pass the instruction size so we can
deal with the is_16bit syndrome encoding.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v6
  - defer calculating target_el until after the early return
---
 target/arm/tcg/helper-defs.h   |  2 +-
 target/arm/tcg/op_helper.c     | 16 +++++++++++++++-
 target/arm/tcg/translate-a64.c |  2 +-
 target/arm/tcg/translate.c     |  2 +-
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index a05f2258f29..ebdf09be38a 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -54,7 +54,7 @@ DEF_HELPER_2(exception_swstep, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, vaddr)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
-DEF_HELPER_1(wfe, void, env)
+DEF_HELPER_2(wfe, void, env, i32)
 DEF_HELPER_2(wfit, void, env, i32)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index b803c9bf162..060b155d559 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -574,7 +574,7 @@ static int64_t gt_calc_next_event_stream(CPUARMState *env)
 }
 #endif
 
-void HELPER(wfe)(CPUARMState *env)
+void HELPER(wfe)(CPUARMState *env, uint32_t insn_len)
 {
 #ifdef CONFIG_USER_ONLY
     /*
@@ -592,11 +592,25 @@ void HELPER(wfe)(CPUARMState *env)
      */
     CPUState *cs = env_cpu(env);
     ARMCPU *cpu = env_archcpu(env);
+    uint32_t excp;
+    int target_el;
 
     if (qatomic_xchg(&env->event_register, false)) {
         return;
     }
 
+    /* We might sleep, so now we check to see if we should trap */
+    target_el = check_wfx_trap(env, true, &excp);
+    if (target_el) {
+        if (env->aarch64) {
+            env->pc -= insn_len;
+        } else {
+            env->regs[15] -= insn_len;
+        }
+        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false, WFE, insn_len == 2),
+                        target_el);
+    }
+
     /*
      * If the CPU has entered the exclusive region we could sleep
      * until the global monitor moves from Exclusive to Open Access.
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ec03eaa3bbd..a4603e1a5c7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10961,7 +10961,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          */
         case DISAS_WFE:
             gen_a64_update_pc(dc, 4);
-            gen_helper_wfe(tcg_env);
+            gen_helper_wfe(tcg_env, tcg_constant_i32(4));
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_WFI:
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c10cc382d15..1f554f6c271 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6836,7 +6836,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_WFE:
-            gen_helper_wfe(tcg_env);
+            gen_helper_wfe(tcg_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper can return if the event register is set, so we
              * must go back to the main loop to check for events.
-- 
2.47.3


