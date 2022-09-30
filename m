Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp39445ocs;
        Fri, 30 Sep 2022 15:03:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4c9aIrhmpN97DrwYH7wM96GsZLM+4utKuePl1JLGh1Rb5GI2M0rkatiFRvMDkCaEKKTmA7
X-Received: by 2002:a05:622a:494:b0:35d:5634:92c8 with SMTP id p20-20020a05622a049400b0035d563492c8mr8606194qtx.217.1664575426759;
        Fri, 30 Sep 2022 15:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664575426; cv=none;
        d=google.com; s=arc-20160816;
        b=N3DZV4OpHOwcyHkZaLE33gOVVicb59Xo9wJQ/CEpujkfDQOlZ89sli0JwZNGRfm/xd
         hXb8siPdECDDrP4ktzZ4y8ScleVuhfO/Z3gwlUrtGbGKCEhOJCIMCbgnvDF3q+YeW1NA
         3OU4h8GkC0gkYqdgkf8AByUbthJvg7Rz3ntRJ8RVJj42/6Q4u9EFZhBS4ajf11wlu0mE
         zwqm8/AWSYQ2/qob8IU2+eWtsHI5SdYqNYEzap0ODPs2uaHco5JA91mFTJ3/+ifU64sL
         9p2LfAHX8mx59BglBQjwjbe8UVWw4Pd/NP7ZUXXR3ylWlUETgmVhdodZ8yLhlaKfS5SP
         xkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=apBe+xOEG/yN097g7gF2sx0rQ+06LZSBxstARnEgFm4=;
        b=Ybtf+XPwf/UaHWAGPzA0wqwDJl5m8PJzxLrrbrHa6rxNcwQgfSWp3TSAEPg6irEOnu
         yG/GrRWGZMoJ4jsGORcmQ3TwX8bm8yZn/z5AiicF2FsMMyrLwcl6ft1rquWZTk8glgli
         YZNlcHlokz+OfbWTprpR4nQE2gh6GcbMRTNvnD2yrFEOMYDhiq2cYbeBEmQcb57GW85z
         56OGslCubssrqIGyfgSk7HVwbYKOVHuZgcIgufopdUN4g+NQnwV5O/d4CnLn2YmhuNsB
         16op/9R1EUxopGOKI65xHViVzA+pRZkKlquBLF28WB4RfBNFK/4acwwCcoVQEngN/OuZ
         +kMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PkzGp7ke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn13-20020ad45d6d000000b004b164d46d53si1308843qvb.93.2022.09.30.15.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 15:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PkzGp7ke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeO6k-0001hg-8E
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 18:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6N-0001fC-5g
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:23 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:47069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6K-0002Y2-5r
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:22 -0400
Received: by mail-qt1-x82f.google.com with SMTP id b23so3480985qtr.13
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 15:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=apBe+xOEG/yN097g7gF2sx0rQ+06LZSBxstARnEgFm4=;
 b=PkzGp7kePNj8r+lMIpFGsMPF+hyb1SSdTxbLdFYByhPXNQ6QuVSDPrKO5v9qU11Vfy
 3y/J5gLqIN5XkIm1x27tvd2dZMiijM+BNaCbcnOHpWw4Lke9D/jOB1BlxgCpr4AbriJt
 gjl3bn9ybOdrhFJsGIOu/UvMAeMewFhjITFfx4aaKO2ibG/QuOUS+O4laaXUrjGBMXV2
 huem5IqxS5w5Q0zNTTrIcZvjsJfMaJruttQU2HFr/3ZKGA3CqwIm/nS0s/nWF0FTXkI/
 jQArGPT34AFW2l01EAUIIGjcR0yul/qiswK2h0pkkvENo6E0L9ZIun7fEdE24RqVLF3G
 mMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=apBe+xOEG/yN097g7gF2sx0rQ+06LZSBxstARnEgFm4=;
 b=GlDUXfrIQeVrNKyQXGnhWNCxveSOW/6LSm+mo6SbJlRb0sMckJO/674GlyDfLx68si
 IUKVaGdqm0NRdTsK860xVgHVZANYSwr0oqnKW41PpSoIEMu0gIwpWgA5rY1/suvDwhMI
 VbXC+hYF3RFVwL07SMMDl+np9qHAjwZGLmuM7WQ5IeRDI73VW3b70qFq0RLysPkcasXm
 7r8Pxq1ddQmTOBz/gwiQm97P9U48x+qkb9p+67p2V9TQmJMVQECZA2pem1YVsb2DPVf/
 h0VDYxNWJNth/LvIY/d3J1My5WCTCcM9n0qhh/8ivQZxApAujVbmi7TzByiSccmwrsN8
 NIrg==
X-Gm-Message-State: ACrzQf2KDHL2TTxHYZ5YIZ5nIDOSNVba0Ex378ITqybMkj2d0M9vQ45m
 xwQxD1LEPRODbzjGSm96bgty4wq4GU13Sw==
X-Received: by 2002:ac8:5990:0:b0:35c:b943:1cde with SMTP id
 e16-20020ac85990000000b0035cb9431cdemr8811081qte.239.1664575398997; 
 Fri, 30 Sep 2022 15:03:18 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 1/9] target/arm: Introduce curr_insn_len
Date: Fri, 30 Sep 2022 15:03:04 -0700
Message-Id: <20220930220312.135327-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930220312.135327-1-richard.henderson@linaro.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NHCHkiw77k20

A simple helper to retrieve the length of the current insn.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086..90bf7c57fc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d09..94cc1e4b77 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5aaccbbf71..42e11102f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6654,7 +6654,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9817,8 +9817,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.34.1

