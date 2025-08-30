Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C515CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:13:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNyK-00060p-0C; Sat, 30 Aug 2025 11:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQt-0007K0-N4
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQr-0004tg-O1
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:23 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-32326e67c95so3081512a91.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532829; x=1757137629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbFeQV0K1TVc88E0Uc3H4R+W+/5rMHvP3/tlvF/jUrs=;
 b=Dh2jXL3EWhMyt58mHr9q2THwyHuGUZUEp+kLcBJw3TIWtexPFcE98MVvlIpRFaN+vG
 VsUsheKBbZ1M0eWEKxHtLp7kNkK5DABO54/9YOGm8T7w655J6YawKlCL8wDwYEpoZLWk
 T6xrFn30jKK1qI6d/ugUnevc1FWnZoWecJh3CHyWPv4Sht4GkrRiWiHv7OybWXmSgBwI
 NNrqmHKOR1wx6jrprsagH+kfX4pWyOqZF+HPw98JniEHbcdVz/8k7kgFPMOMUXBwBtzb
 PbllBE6wf+ieiGxNcuCDljdaGFJyaDM2+zGschV9xBfhAGdMb3ZjTZnM7Mlk+/Tsazsv
 WFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532829; x=1757137629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbFeQV0K1TVc88E0Uc3H4R+W+/5rMHvP3/tlvF/jUrs=;
 b=btSDBDLRgu1aTRze2dgnrt6kZBnIcSSVid2ebUmNKhuYbc4itALgzGPeVKdHucOOoS
 BkQIJwoiRmG950wRgfxOcZoBTPiGboWgHqEKbG7WMD4ocLIyJ2Xj0G11zfEXwoN5DvDX
 Ns19U5Umr2NTBHDmA+UQBfAX3bw1/YAwvC5kGgWzt+XsJPUpiVjaQjmclcmnrXtkGZ+U
 FOw3VrHE0Oj5+IO7WrityFSfjr08UnAd5FEgeqSf5gvN3jJNZgD8ZOxeAADLjC3rhQDr
 hmHrOECnSfQZmnUJQSVM5+O8tLljQurKZdJUQKeHE6N61Gpqgx05J+aSp4lhTk4U76Hb
 xkJg==
X-Gm-Message-State: AOJu0Yy44mo+hChg6rRIBunGbsHkZTUPfzdWXIlp1BHmN+nNxRlbBF/S
 zpPDPq7AZPQJ9jGUQuLts2R7Ew//RMTjtLco6erSVIzSVrnrw9ZOatuQYgnsXOHzWnA=
X-Gm-Gg: ASbGnctyTV88LetpMmZ0l9je8WO008SYP5AWaAAv7vC6UgelOQILGiIVHb0Tas12xdZ
 KwlMZce+QoOMvqBUaf7i1iBRIGsfR9Sa2KqASGNfEHBGEQ6CmKpSY2HrS444UMJoTFkBJbesfEX
 0hUEVllXYRIXMqCZeKhmXnilk/CpDFzZz1uuTPTDb9XKlovosZCG+tx71j8uSLnfX/c2qViDC0V
 hHNm24wjdU8+fFpGfyJcBDrKk2pqmb7YPGfrKPgV+sI4Px1bjK22QeRfFUlPD74yA5kdcCzS+7b
 lagGxFDc8+l1rV+1ZNvUeBNt1nL7T1QaTxvHQgOQ9VylmWgw/iug9/oh1C+pMSDall+rIjpgvqs
 3b1CFMe/Njv1v9eHsK0mbUzYhXH5tSU85JMsOF12B4E45FA7b1AOC3ivfr7HftDM=
X-Google-Smtp-Source: AGHT+IFsFgdW+AfxCRB4F1bk4XXD3cxzPDTbz56XnarM9qc+JqIBtiEQ1Iy+TfCEhTuWiy0j0V4DKg==
X-Received: by 2002:a17:903:283:b0:249:2cef:1cfe with SMTP id
 d9443c01a7336-24944880455mr15356135ad.6.1756532829351; 
 Fri, 29 Aug 2025 22:47:09 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 54/84] target/arm: Introduce delay_exception{_el}
Date: Sat, 30 Aug 2025 15:40:58 +1000
Message-ID: <20250830054128.448363-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Add infrastructure to raise an exception out of line.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 20 +++++++++++++
 target/arm/tcg/translate-a64.c |  2 ++
 target/arm/tcg/translate.c     | 53 ++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 1479f5bf74..a40cbd4479 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -21,9 +21,25 @@ typedef struct DisasLabel {
     target_ulong pc_save;
 } DisasLabel;
 
+/*
+ * Emit an exception call out of line.
+ */
+typedef struct DisasDelayException {
+    struct DisasDelayException *next;
+    TCGLabel *lab;
+    target_long pc_curr;
+    target_long pc_save;
+    int condexec_mask;
+    int condexec_cond;
+    uint32_t excp;
+    uint32_t syn;
+    uint32_t target_el;
+} DisasDelayException;
+
 typedef struct DisasContext {
     DisasContextBase base;
     const ARMISARegisters *isar;
+    DisasDelayException *delay_excp_list;
 
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
@@ -365,6 +381,10 @@ void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
                            uint32_t syn, uint32_t target_el);
 void gen_exception_insn(DisasContext *s, target_long pc_diff,
                         int excp, uint32_t syn);
+TCGLabel *delay_exception_el(DisasContext *s, int excp,
+                             uint32_t syn, uint32_t target_el);
+TCGLabel *delay_exception(DisasContext *s, int excp, uint32_t syn);
+void emit_delayed_exceptions(DisasContext *s);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ca1633540f..1175d37c87 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10562,6 +10562,8 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         }
     }
+
+    emit_delayed_exceptions(dc);
 }
 
 const TranslatorOps aarch64_translator_ops = {
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f7d6d8ce19..c4dd3a747c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1090,6 +1090,57 @@ void gen_exception_insn(DisasContext *s, target_long pc_diff,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+TCGLabel *delay_exception_el(DisasContext *s, int excp,
+                             uint32_t syn, uint32_t target_el)
+{
+    /* Use tcg_malloc for automatic release on longjmp out of translation. */
+    DisasDelayException *e = tcg_malloc(sizeof(DisasDelayException));
+
+    memset(e, 0, sizeof(*e));
+
+    /* Save enough of the current state to satisfy gen_exception_insn. */
+    e->pc_curr = s->pc_curr;
+    e->pc_save = s->pc_save;
+    if (!s->aarch64) {
+        e->condexec_cond = s->condexec_cond;
+        e->condexec_mask = s->condexec_mask;
+    }
+
+    e->excp = excp;
+    e->syn = syn;
+    e->target_el = target_el;
+
+    e->next = s->delay_excp_list;
+    s->delay_excp_list = e;
+
+    e->lab = gen_new_label();
+    return e->lab;
+}
+
+TCGLabel *delay_exception(DisasContext *s, int excp, uint32_t syn)
+{
+    return delay_exception_el(s, excp, syn, 0);
+}
+
+void emit_delayed_exceptions(DisasContext *s)
+{
+    for (DisasDelayException *e = s->delay_excp_list; e ; e = e->next) {
+        gen_set_label(e->lab);
+
+        /* Restore the insn state to satisfy gen_exception_insn. */
+        s->pc_curr = e->pc_curr;
+        s->pc_save = e->pc_save;
+        s->condexec_cond = e->condexec_cond;
+        s->condexec_mask = e->condexec_mask;
+
+        if (e->target_el) {
+            gen_exception_insn_el(s, 0, e->excp, e->syn, e->target_el);
+        } else {
+            gen_exception_insn(s, 0, e->excp, e->syn);
+        }
+    }
+}
+
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
@@ -8107,6 +8158,8 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, curr_insn_len(dc));
         }
     }
+
+    emit_delayed_exceptions(dc);
 }
 
 static const TranslatorOps arm_translator_ops = {
-- 
2.43.0


