Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1803705lfb;
        Mon, 6 Jun 2022 19:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCu5WCbX8vTuKkR7iToKE9KRq3jnDu8iYhaCxjJNjqJiIuTdqNo691aCtZA1cOqq3hfaDD
X-Received: by 2002:ad4:414e:0:b0:466:67:7cd4 with SMTP id z14-20020ad4414e000000b0046600677cd4mr19785381qvp.55.1654570254424;
        Mon, 06 Jun 2022 19:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570254; cv=none;
        d=google.com; s=arc-20160816;
        b=uOzcFhyiiQXD5GwYVQ5QMg+5JceBc3crmUhCrMJiJNNlX25jGoqnTdpNzSbsUmT/AW
         B2+Z8xbKs+rp6SaZX+6CE1KD99xxoOOb1Vq2IQHr30/tJeLNG9vjNU6bcJjlfcvnN2lX
         vHWmTZ9Rkwdr86374DPyBCvhjSYfdzr6hxa2wxy/Z2TEUGBPaiuGZxa4l1lOzyiKvfaB
         HcIOSgSwz7+eDwPmXFseLdzwdlkLBGZBq41BH3dEpNz51sXxf6QEggneugu8Ng5350lH
         F9Qwn6Po4enfYHqMNgbGjFwgcoKI5myARBivjuyGtHWcLe02BdXTMjQytuayf2b0ZsSr
         B0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vyyg44YF2Y/mmVGaXvfp7YJNYhSRY+k5gyUVMMceFu0=;
        b=IGnYgAt6Z4jKZ7ITnxNAdMjW4EPCm7qEPAuks09BVmXlmjR2q+wMVUm7n77UUHq/bc
         ccwdbyIoq/COa3vp/bYJjuWmDiOlwDVDb4KW5o9r3vAV5FV2GQMQ6HAgtYN7vL7sGFeQ
         Ufypz4inriK7GhJ6UHKpve4KKgDAKG5Ba0wBK8oe0CYyXoWxq9TjZzu3PYH9hAwIyhAA
         d5hPsVUNBna/wFccsFTC3QE5qQrHtoycag4hQ+p+dOOJnmqJ0K77e+B4WigZShm4GxBi
         LUiXG79k3ETHuGqOouhQfhs9D0BlVKtGNsIn4C7fEJfmaTpbm6RYwvrI2fp/4Us9Oj1K
         SMpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YtLN5NL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020a0562140daf00b0045aa3bf11ebsi9428658qvh.370.2022.06.06.19.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YtLN5NL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPIz-0004r9-Ta
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFx-0006h7-Qa
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:45 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFr-0000H7-R8
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:45 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso2353079pjk.5
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyyg44YF2Y/mmVGaXvfp7YJNYhSRY+k5gyUVMMceFu0=;
 b=YtLN5NL/SuUJYB+B2n5PsAKkkVF7Vj7pJifU2gWBKNFD6aXmnoj5RlPKj2GzWuKCwu
 JmRsCAYAz8yaLrPGkFzJrYSv1aI6g37xQRGkNkHD19YRQkjuov3fo2cBjIjyzViQu5+p
 9I7gnAFwsGEajNoRhG3qTiSVUwbE3+uCBe6TDmwWN+Mpv3a+aMusqru1lYBNsaoS3+j0
 odem/PFJvHxEXUI3MaLPHCoLxCax0J4W3ckc2Asth7elYJqK3j1O+Z72klk23rHpcqk/
 SZslsVtzJN0kWbD1tOnUyg5PWQE2it1/1PPAmXn9BdqktfAFE2+TvTK4x93U6JM/VwtU
 DRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyyg44YF2Y/mmVGaXvfp7YJNYhSRY+k5gyUVMMceFu0=;
 b=2aYSdSl08H8WrUs1mheP195UankUsZrm5GjW0UgKMPT8xCaEIFcPpMDrV4BegyRr5K
 G1o2SsXkSE51QFrYXgGCL8h4LyvVN3ALr20WecxBx6BcAEWQgCFJnQJEXZJUtzN6Xawn
 IGkkQI1IBJnrd1TXzeoxstWGRutypeuGG18o4csg1dwMVssahwwRbLyzlgtDdCJ7699V
 s+RvzUGFj5HyLTiszljiINnf7BFIbtzqZjfPVimxk4nzV50mmhYdid2FJlsLiCTDtG6w
 H56U+7NJLi5sMxkmC/hkes0LsTkJIOBf1JTjQ5nX1tBsfDM+BR9uQBepbV52s2S5hTG6
 ahSg==
X-Gm-Message-State: AOAM533tMhjnc+RC2jui8BT2CW/N4wp9vXCLadlB1/uwgayLbWBU+yKW
 aE5o0maH1sJTzLtCEIjJUX8LLA==
X-Received: by 2002:a17:90b:4c4e:b0:1e3:368b:c09c with SMTP id
 np14-20020a17090b4c4e00b001e3368bc09cmr29414260pjb.140.1654570058279; 
 Mon, 06 Jun 2022 19:47:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 03/25] target/arm: Move fp access syndrome adjust out of
 raise_exception
Date: Mon,  6 Jun 2022 19:47:12 -0700
Message-Id: <20220607024734.541321-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OczghjlHciDS

Create helper_exception_advsimdfp_access to handle both
the routing and the syndrome contents, depending on the
eventual target EL and mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/translate.h     |  9 +++++++++
 target/arm/op_helper.c     | 32 +++++++++++++++++++++++---------
 target/arm/translate-a64.c |  5 ++---
 target/arm/translate-vfp.c |  4 +++-
 5 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5161cdf73d..a13007699d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -46,6 +46,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
 DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_3(exception_advsimdfp_access, noreturn, env, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 9f0bb270c5..da5f89d49d 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -337,6 +337,15 @@ static inline void gen_exception(int excp, uint32_t syndrome,
                                        tcg_constant_i32(target_el));
 }
 
+static inline void gen_exception_advsimdfp_access(DisasContext *s,
+                                                  uint32_t syndrome)
+{
+    gen_helper_exception_advsimdfp_access(cpu_env,
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(s->fp_excp_el));
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c4bd668870..67b7dbeaa9 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -34,16 +34,8 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     CPUState *cs = env_cpu(env);
 
     if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
-        /*
-         * Redirect NS EL1 exceptions to NS EL2. These are reported with
-         * their original syndrome register value, with the exception of
-         * SIMD/FP access traps, which are reported as uncategorized
-         * (see DDI0478C.a D1.10.4)
-         */
+        /* Redirect NS EL1 exceptions to NS EL2. */
         target_el = 2;
-        if (syn_get_ec(syndrome) == EC_ADVSIMDFPACCESSTRAP) {
-            syndrome = syn_uncategorized();
-        }
     }
 
     assert(!excp_is_internal(excp));
@@ -384,6 +376,28 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
+/* Raise an exception with EC_ADVSIMDFPACCESS. */
+void HELPER(exception_advsimdfp_access)(CPUARMState *env,
+                                        uint32_t syndrome, uint32_t target_el)
+{
+    if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
+        /*
+         * SIMD/FP access traps, when re-routed to EL2, are reported with
+         * uncategorized syndrome.  See DDI0487H.a rule RJNBTN.
+         */
+        target_el = 2;
+        syndrome = syn_uncategorized();
+    } else if (arm_el_is_aa64(env, target_el)) {
+        /*
+         * From AArch32, we will have filled in TA and/or COPROC for use
+         * by aa32 HSR.  But in aa64 ESR_ELx, the low 20 bits are RES0.
+         */
+        syndrome &= 0xfff00000;
+    }
+
+    raise_exception(env, EXCP_UDEF, syndrome, target_el);
+}
+
 /* Raise an EXCP_BKPT with the specified syndrome register value,
  * targeting the correct exception level for debug exceptions.
  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 14b90a37ea..3251c69180 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1161,9 +1161,8 @@ static bool fp_access_check(DisasContext *s)
         assert(!s->fp_access_checked);
         s->fp_access_checked = true;
 
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false, 0),
-                           s->fp_excp_el);
+        gen_a64_set_pc_im(s->pc_curr);
+        gen_exception_advsimdfp_access(s, syn_fp_access_trap(1, 0xe, false, 0));
         return false;
     }
     s->fp_access_checked = true;
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 0f797c56fd..2a98387411 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -230,7 +230,9 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
         int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
         uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
 
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
+        gen_set_condexec(s);
+        gen_set_pc_im(s, s->pc_curr);
+        gen_exception_advsimdfp_access(s, syn);
         return false;
     }
 
-- 
2.34.1

