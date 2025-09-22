Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27218CAC5AA
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:58:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lgF-0005sc-Qa; Mon, 22 Sep 2025 14:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfZ-00049u-M7
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:49 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfF-0004xn-1G
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:49 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2698384978dso40276375ad.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567201; x=1759172001; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4yOr54Zvd4hVdN3lAOIT39h+3zJgH0PiAcUhU01jqA=;
 b=TiufOf39sUIEhm/Nuv0S6yCg7a4O0HK2TbE+9sH86Q8lj0U5cjUu6rHzKrZAVaDmdw
 /yYmgAWoQY4Jperwltr3vjY8w0MH80rYF8TrV2MYW2kMKuueHhMgcuIqsDSCfSUmfydw
 3+PDUVc/jy1VYllUNiXtCB5wtaFsAePjS+8mz4lbBkG1mlM9T0CLVk46+qjHIDvqVBpq
 3iaP7N2qYKGrRl2ABVOvVD86Z0L6bzBD137RTOy9fwoSdORaPudz/rY2GhGiAufs0RVY
 rSYGF26f6Hyq20XpdwyRm6MdkXBDC0ByAaO7ywSGSM2LlmmhFs1LFRYMLAHSPaofvYuC
 sQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567201; x=1759172001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4yOr54Zvd4hVdN3lAOIT39h+3zJgH0PiAcUhU01jqA=;
 b=sW756ma9CWNMgrSm/O4pY0DfYVMt9YtVd6LECKdG7efnY38Pg0dJGHLsnVF9CwZQeG
 994sY3HnbNlAkxheoLAE6uVRQi84UU+sC0ou8syY5W6BBxMasoPlw17wFaoZi12Y4OaJ
 brKZyOCnbX4wTorFNNyxJy+2zJerzAPNNDzeK9pJiG8YdOYUPf9mZSPFTb0MPOhK5L7S
 6d9Bc1R68WAlqU3cxF0PMC/6LP0MZxjBr+rSUJLsJfONXCau+HbGG1TtQkbFAhQTEW7n
 +vcUv4dgJsO/HVwARDr7tCbPt0X1FAsumTTKMCbuWovcqfZD1rKDRJsUf6jvqzFRRIW4
 ah/A==
X-Gm-Message-State: AOJu0Yzi11f3DZ2KO46RgNOwskys8tsykShVP5rwGs/Gcn62z22xFj3s
 5uap1uzilDQUj49vyPFh/PMZiEGU4OFARD2ZLPbx2rmk1s+MA+Vw2BlNjhzg5H+71ublPi1+Qw1
 pzSri
X-Gm-Gg: ASbGncsDsLkZ/+RTymtrTSQchLEmQHeyUw8/weQXfD7+49eUltbIKHgib70yfXyPasy
 TCBzknu6x0CVlSbaUdpxaZkS3gx4tvpDoqPMftsdUPyR+uu44N9n359ydRYAOc8+nfr4PAUsR48
 M0rsljVULbBLEcpxkcFVCQKCXMLCprmMv15etgv/UbY0MFOMcM5CHtqJw1ygSNwNA3EYkpIYgEs
 6BK2MbHKlOJfOJs/sb3OPWa9fOZTTjYKlaTJa9w0RHz70RxrsTP9qJx9F3o8snIc4R7huonSqrE
 9oojgyNMO2+ciq7aKO81qBbYlRFtaYRF9GYbPWAPDd66W8SFXQiLw3ocsebidNYeiVG4cV8Jqcz
 tfaCNmusJjdM/LYAflxsmosBGN261
X-Google-Smtp-Source: AGHT+IFMc7gm0OTwbfHcHSv6eNbwOnoeYYuqx7EiCNaoZBZZxxOmjVvYW/F1+yaHXLKcDeKIOgQqRA==
X-Received: by 2002:a17:903:2301:b0:275:6dc5:a288 with SMTP id
 d9443c01a7336-2756dc5b866mr88680215ad.45.1758567200857; 
 Mon, 22 Sep 2025 11:53:20 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 49/76] target/arm: Implement GCSSTR, GCSSTTR
Date: Mon, 22 Sep 2025 11:48:57 -0700
Message-ID: <20250922184924.2754205-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Note that CreateAccDescGCS() does not enable tagchecked,
and Data Aborts from GCS instructions do not set iss.isv.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 42 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d607a0afd6..2849805f1c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -139,6 +139,12 @@ static int core_a64_user_mem_index(DisasContext *s, bool unpriv)
     return arm_to_core_mmu_idx(full_a64_user_mem_index(s, unpriv));
 }
 
+/* For a given translation regime, return the core mmu_idx for gcs access. */
+static int core_gcs_mem_index(ARMMMUIdx armidx)
+{
+    return arm_to_core_mmu_idx(regime_to_gcs(armidx));
+}
+
 static void set_btype_raw(int val)
 {
     tcg_gen_st_i32(tcg_constant_i32(val), tcg_env,
@@ -3989,6 +3995,42 @@ static bool trans_STLR_i(DisasContext *s, arg_ldapr_stlr_i *a)
     return true;
 }
 
+static bool trans_GCSSTR(DisasContext *s, arg_GCSSTR *a)
+{
+    ARMMMUIdx armidx;
+
+    if (!dc_isar_feature(aa64_gcs, s)) {
+        return false;
+    }
+
+    /*
+     * The pseudocode for GCSSTTR is
+     *
+     *   effective_el = AArch64.IsUnprivAccessPriv() ? PSTATE.EL : EL0;
+     *   if (effective_el == PSTATE.EL) CheckGCSSTREnabled();
+     *
+     * We have cached the result of IsUnprivAccessPriv in DisasContext,
+     * but since we need the result of full_a64_user_mem_index anyway,
+     * use the mmu_idx test as a proxy for the effective_el test.
+     */
+    armidx = full_a64_user_mem_index(s, a->unpriv);
+    if (armidx == s->mmu_idx && s->gcsstr_el != 0) {
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
+                              syn_gcs_gcsstr(a->rn, a->rt),
+                              s->gcsstr_el);
+        return true;
+    }
+
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    tcg_gen_qemu_st_i64(cpu_reg(s, a->rt),
+                        clean_data_tbi(s, cpu_reg_sp(s, a->rn)),
+                        core_gcs_mem_index(armidx),
+                        finalize_memop(s, MO_64 | MO_ALIGN));
+    return true;
+}
+
 static bool trans_LD_mult(DisasContext *s, arg_ldst_mult *a)
 {
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8283a9c83d..2ae73f443a 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -571,6 +571,9 @@ LDAPR_i         10 011001 10 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext
 LDAPR_i         00 011001 11 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext=1 sz=0
 LDAPR_i         01 011001 11 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext=1 sz=1
 
+# GCSSTR, GCSSTTR
+GCSSTR          11011001 000 11111 000 unpriv:1 11 rn:5 rt:5
+
 # Load/store multiple structures
 # The 4-bit opcode in [15:12] encodes repeat count and structure elements
 &ldst_mult      rm rn rt sz q p rpt selem
-- 
2.43.0


