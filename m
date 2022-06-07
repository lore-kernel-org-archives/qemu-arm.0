Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1809639lfb;
        Mon, 6 Jun 2022 20:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjEw+3McOBOhVUa5KXEwxM1UsUV3tkCPGcaOzV4H7yZWoh0da70OiexadEICtPlRh25k/X
X-Received: by 2002:a05:620a:4403:b0:6a6:b2e6:1180 with SMTP id v3-20020a05620a440300b006a6b2e61180mr7766003qkp.472.1654571317112;
        Mon, 06 Jun 2022 20:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654571317; cv=none;
        d=google.com; s=arc-20160816;
        b=llIbe4lZ/Wlojb7w4lwZyCMa7u2wEkBgPnuNsuwu3QV0+GBlZYXqxLWRggiIfu/g3M
         xhm09yd2uORmn0IU8tTOaae51uhvrXx/9Zc047H+dEdEk8f/CfXPNma0XU5bqymZwryx
         vVDaVgvlAtRwg3RUxEC79UQOIb+muWq2kt3/sdvZHZWnAp1O/vbtawWf5B4nzKQkp6Ro
         f5Td6dzyKychh0c2Q65YstyAtMgb5ieFZxh8omWNdJusnp61rwkOozGZ+0GNP9iT6WQS
         geteBy+fOcK0V+596UNtvxqLRfG3LwsAveBzxjQ+JxBavYg2jcdKSWgpfJYwqMUrdsBA
         /iFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fmcSScOvBsLp1FCuWvkHw14JpRNt+9SUrqF6b0wzTB4=;
        b=jZxOdFd5NNTaWQh80nmOI10d0VfCwj/x2pXTyWHyZgpD1wlxeg/Pa8N5ubSv3NzeEb
         kwuEHtvKZryrfW5tVlH+iYlmSHCOS2+3VLvM+FXvKILWghwQERcT8oSimMAFdYNX+Uyx
         54CiZxP1wrJcR00jXGXFaalOlFqRKFsQvcchkwIWADqVdz4ljpib4pvSFzTfsfLMLog2
         rVQINFKn/XOnbhbzyyld5eaJYchi4ajtAaQZydC56+fumAnksITGSL62uYcYhRVqhdkx
         ELhWXY/dIS9xpchWSfr5URz5ZV2fSFh+mdVXB9aPcg0x9d6qNaWPfX/MSBjASusjkF4x
         A8mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQCRtQE9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020ad45bc5000000b004463873b601si9331347qvt.533.2022.06.06.20.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 20:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQCRtQE9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPa8-0007D1-KQ
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 23:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG8-0007H0-7b
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:56 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG6-0000O7-C8
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:55 -0400
Received: by mail-pf1-x434.google.com with SMTP id y196so14275871pfb.6
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmcSScOvBsLp1FCuWvkHw14JpRNt+9SUrqF6b0wzTB4=;
 b=gQCRtQE9nY0xUiu7z6tvUqImkQerplI16gNaFXAWHVghNLiilZcTNw8bPjh5uoLZfA
 ISbeyxWKDg7wOMMO2vwDtxcf/PtuMZRkUrohtaV7MtN/GDFMFyAG5dIKyy8V65PaFGiB
 xN2/gI7wAQAqbPu4U9OHsptJnPfejfn0kDeLb3T+S/TPWghpx+jp/GkX4UfP2l4tsAoI
 QwKOIG/r1DCFZSw4kRX+I4RCkc5RMkPLS/7YxVqA07F114NsFlFukMiyz//YHWQ7S4sO
 8KKhIbAkjQKtb/DPslpCxh7QG8DyoBREO3kGuDDFAxr+aDbZMXxG/Cp/I6kN5UhGPRI0
 M/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmcSScOvBsLp1FCuWvkHw14JpRNt+9SUrqF6b0wzTB4=;
 b=2CbSorGAWBYuv1vfCY3FQkPq4HIp+Lq/D+I+hnB3agrr+x2CegFYBvEPTXRs6WmMA2
 +8G+XT/V4ThBHASJaPXizIk3GMFYQwxMFg7+SKB+0chYWU7SpykkI3OkaewcWAI0GlPT
 fckNEIhiFhoqJIvIeCA/O8qBOxhaVjKZAGlZI5XwqBh1yaZO8mUA29Dt6ZJLfXFswD0r
 b8MP45XqryaAOdWFCEKh3dv6pv90lH+qMYmqDH8mnDUtz5L0aIOs5vGxfbTB1N2+FtTd
 yvnffWfdhd2bk+wlADb8/uzFhAT7mnhZJ3oB3jf3v+Snp2FWxecevlfW8YpRsLS53jLD
 7lHA==
X-Gm-Message-State: AOAM530h//RtnnDLAZz0QMQAtUhhG9varFL68e/43k319D3UIzswhilJ
 3wz4K+9Kc9uRB4RlTv8sD97WJ3gSCRC3fQ==
X-Received: by 2002:a05:6a00:2344:b0:51c:157f:83d5 with SMTP id
 j4-20020a056a00234400b0051c157f83d5mr9414718pfj.5.1654570072971; 
 Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 20/25] target/arm: Introduce helper_exception_with_syndrome
Date: Mon,  6 Jun 2022 19:47:29 -0700
Message-Id: <20220607024734.541321-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gKztDHIDw3J+

With the helper we can use exception_target_el at runtime,
instead of default_exception_el at translate time.
While we're at it, remove the DisasContext parameter from
gen_exception, as it is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h    |  1 +
 target/arm/op_helper.c | 10 ++++++++++
 target/arm/translate.c | 18 +++++++++++++-----
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index afc0f1a462..7c8133f83a 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -45,6 +45,7 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_3(exception_with_syndrome, noreturn, env, i32, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_3(exception_advsimdfp_access, noreturn, env, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 1c4e6753f6..32e2a92ff4 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -391,6 +391,16 @@ void HELPER(exception_with_syndrome_el)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
+/*
+ * Raise an exception with the specified syndrome register value
+ * to the default target el.
+ */
+void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
+                                        uint32_t syndrome)
+{
+    raise_exception(env, excp, syndrome, exception_target_el(env));
+}
+
 /* Raise an exception with EC_ADVSIMDFPACCESS. */
 void HELPER(exception_advsimdfp_access)(CPUARMState *env,
                                         uint32_t syndrome, uint32_t target_el)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fcb6ee648b..81c27e7c70 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1097,9 +1097,10 @@ static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
     gen_exception_el_v(excp, syndrome, tcg_constant_i32(target_el));
 }
 
-static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
+static void gen_exception(int excp, uint32_t syndrome)
 {
-    gen_exception_el(excp, syndrome, default_exception_el(s));
+    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
+                                       tcg_constant_i32(syndrome));
 }
 
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
@@ -1123,7 +1124,14 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
 
 void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
 {
-    gen_exception_insn_el(s, pc, excp, syn, default_exception_el(s));
+    if (s->aarch64) {
+        gen_a64_set_pc_im(pc);
+    } else {
+        gen_set_condexec(s);
+        gen_set_pc_im(s, pc);
+    }
+    gen_exception(excp, syn);
+    s->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
@@ -9766,7 +9774,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -9835,7 +9843,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.34.1

