Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3441507njb;
        Tue, 10 Dec 2024 08:23:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPkUY4lvOXKji/RgrTeXFoMPC+5AYVup0C1keSwgG+RmWu9rb6Ae4+cp0L51F29RiTMOZ5F4U2zcLjVw==@linaro.org
X-Google-Smtp-Source: AGHT+IGSKYOIWcge8RCpXImBr849mp1LK/w/qZKc/r8Nv+FT9a34WqKCotkRBCf1uWA6T95jfyId
X-Received: by 2002:a05:622a:348:b0:467:731e:632 with SMTP id d75a77b69052e-467731e0dc4mr77874921cf.51.1733847828519;
        Tue, 10 Dec 2024 08:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847828; cv=none;
        d=google.com; s=arc-20240605;
        b=NT4yTYNfjlWRiWL69mP8EKbJyz+67FX+K6zEwlAdQFNDNYX+qBMbWaBBvZKxSmQ3kk
         pZQuToRGRGgbiqYC7ftiN+TsTVHqE5IDv1FQOh0yjhc4sgnrz5Lm+33OiduSDNzR8x/3
         ZBrofaFtjp8xeJ4qawTxKfMXKXOH6HFR8QMOEgwYB2iGcuR5CpZROylGAUKK+BletcXr
         0QSE6jFRQp0z9q/yU2EvTVsWZ8ojbDp0VQDckvPOOqdMciDLY1S/L8eLKtBLBpM2tSH7
         ipIA8WPwVsk45lyfDLRkAenfrZr/Zee/W18RNdKbxu/0IDjdqK7RqSLOx//iHsL6gXkk
         YtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9SJEXkrSGon3EHg9IFxjdqrgnXkODMT4emZTm+1wSC8=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=kFZtA/6+AV8fffQt2pJ/W+Jiay8d5nckWPAfJSQv/7ba5P5roeMG3En3n9cZ4MxtJ7
         eZjAu2/HSC9wsSygbtG35SpDy3mlNUBf0Wc3s+p9k1axNG5GC7a0hn7wEWfNh3Sd5bqq
         B7i3V6v2nz4HwKTcp7R4SohTG93ZPweECFGE7dpsqnkkW2FtcjfaWULZdTtkm6ewGHHk
         jZZvYFEOI+BAcwUF3sVpiA8sA/O8WBJDn5V+IlQNKxHMGjsS0wTtdEi0guzA7CsOudWn
         4g0CzWBo0x/qCNdb6/jaqLt0ZjYMHMC7Iv6UA0F6sG9PzAACjRuMd5aNAnvWbibsF8uI
         Mr+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMbyHTgy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678492327csi8923951cf.719.2024.12.10.08.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMbyHTgy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tL31R-00050t-LO; Tue, 10 Dec 2024 11:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL31G-0004gj-Av
 for qemu-devel@nongnu.org; Tue, 10 Dec 2024 11:23:31 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL31D-0007LE-Hm
 for qemu-devel@nongnu.org; Tue, 10 Dec 2024 11:23:29 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401be44b58so2711333e87.0
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2024 08:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847806; x=1734452606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SJEXkrSGon3EHg9IFxjdqrgnXkODMT4emZTm+1wSC8=;
 b=XMbyHTgy6DYCjCVR5kVEySdvNLekFwxy8/+EfYnf8yh/nimNNhbiaYwVP9yMEGkJTN
 3tDRtF4TZzZjeDprtnH4RXiijoHmnUpIAMoY+2W2CCEr80+BlsRGL4yyZRXdmsuWMYzw
 Tc+TGIiEn/z/y88wo0GSX9omdajFIqxJtcVSbDZ6nTpBxod6+f4ddSGC6x7rOHNyZk9u
 elnMVgh3eQSSNrcueVDsMC4l22X+E0jLgqDc5CvFLVoc4uy75C2/bcf0ApD+EzMDagQz
 nCrw4fTvC4ZXaG2G8WJ5YfxqOUApTEvC0mN96ujnR6JhmGEznu84rpExzOpaIQB+gxTW
 aU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847806; x=1734452606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9SJEXkrSGon3EHg9IFxjdqrgnXkODMT4emZTm+1wSC8=;
 b=ZMQmZadOWEvGRWL3TeUtJKMzrqbbBoI1O+9yPzNn4COd7zPTJePGA5ipRnlUw/fFw4
 KWmQ/gX8yGoI3RqeXDlJzF2YzRjORIKIJuolJ/W6gDIaFreZj7Y6YUY6PhACDsSJt4d3
 LFANIPutBkbYseXjAuUfMe+TFPxLGS2DnhqwW093+/fWY4i8gYOs5Ozlw/uRqTck7uQ9
 vArs/xOH9M+bshr7qbQQkyRCaOQQ21/+Sr05GQEIA4Tm/2+4juJr0PoZItwcM4GzmDMh
 yREp8WrYG2SVI/8hbCK2ViCEBiT1oc7E7fhu1QdTTzZsutuHv1Vq2hl0jXPC75R6hXi2
 mw5w==
X-Gm-Message-State: AOJu0YwgEmaJ12AFXvLD1rpGkpCNL2zRiw2OvTVq+imBi3kURrUqgRTq
 O0oJN6Yji2MRIBwikwiTDKPvL1h3XdmeDbfYGMhPGgRmMnMQAeIQT60y4sL2vVCQwqUjIMagdDs
 pKqG//TGp
X-Gm-Gg: ASbGncvhuKjtpvZahbfdCxI3HDofrw0U7bn3oAYVtlp/AGZblCTUPRcafWSOlif8nC9
 mm4DoFU2wM/0l9dzfnj8gVhDU8au0gYs6til5yCNcFWCBwbfP6yeua57xeOp32CLHGdkEmOfMna
 s4Scncbf/iKlfXvVAhlFfYy+t5vb7kFb0JmVXQTGb4wWndcpDZNfkGiCEUvEdTz4bNbaToPlG63
 PqP0wHlLfpEKa4/ZIG6Oznko3Jjiu4PtmTMMKzhHe0qOqJS3Z3xi4LFZqk=
X-Received: by 2002:a05:6512:3f12:b0:540:1d37:e6e with SMTP id
 2adb3069b0e04-5401d371169mr3695025e87.33.1733847805853; 
 Tue, 10 Dec 2024 08:23:25 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:23:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 40/69] target/arm: Convert CNT, NOT,
 RBIT (vector) to decodetree
Date: Tue, 10 Dec 2024 10:17:04 -0600
Message-ID: <20241210161733.1830573-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: keD1ZXmU11lr

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 34 ++++++----------------------------
 target/arm/tcg/a64.decode      |  4 ++++
 2 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 31f1d3961d..894c33ed1f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8915,6 +8915,9 @@ static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 
 TRANS(ABS_v, do_gvec_fn2, a, tcg_gen_gvec_abs)
 TRANS(NEG_v, do_gvec_fn2, a, tcg_gen_gvec_neg)
+TRANS(NOT_v, do_gvec_fn2, a, tcg_gen_gvec_not)
+TRANS(CNT_v, do_gvec_fn2, a, gen_gvec_cnt)
+TRANS(RBIT_v, do_gvec_fn2, a, gen_gvec_rbit)
 
 static bool do_gvec_fn2_bhs(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 {
@@ -9229,12 +9232,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     TCGCond cond;
 
     switch (opcode) {
-    case 0x5: /* NOT */
-        /* This opcode is shared with CNT and RBIT but we have earlier
-         * enforced that size == 3 if and only if this is the NOT insn.
-         */
-        tcg_gen_not_i64(tcg_rd, tcg_rn);
-        break;
     case 0xa: /* CMLT */
         cond = TCG_COND_LT;
     do_cmop:
@@ -9291,6 +9288,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         break;
     default:
     case 0x4: /* CLS, CLZ */
+    case 0x5: /* NOT */
     case 0x7: /* SQABS, SQNEG */
     case 0xb: /* ABS, NEG */
         g_assert_not_reached();
@@ -10072,19 +10070,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     case 0x1: /* REV16 */
         handle_rev(s, opcode, u, is_q, size, rn, rd);
         return;
-    case 0x5: /* CNT, NOT, RBIT */
-        if (u && size == 0) {
-            /* NOT */
-            break;
-        } else if (u && size == 1) {
-            /* RBIT */
-            break;
-        } else if (!u && size == 0) {
-            /* CNT */
-            break;
-        }
-        unallocated_encoding(s);
-        return;
     case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
     case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
         if (size == 3) {
@@ -10302,6 +10287,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x3: /* SUQADD, USQADD */
     case 0x4: /* CLS, CLZ */
+    case 0x5: /* CNT, NOT, RBIT */
     case 0x7: /* SQABS, SQNEG */
     case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
@@ -10324,15 +10310,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x5: /* CNT, NOT, RBIT */
-        if (!u) {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cnt, 0);
-        } else if (size) {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_rbit, 0);
-        } else {
-            gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_not, 0);
-        }
-        return;
     case 0x8: /* CMGT, CMGE */
         if (u) {
             gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cge0, size);
@@ -10351,6 +10328,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clt0, size);
         return;
     case 0x4: /* CLZ, CLS */
+    case 0x5: /* CNT, NOT, RBIT */
     case 0xb:
         g_assert_not_reached();
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 32355ee633..bac81eec7e 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -71,6 +71,7 @@
 @rrr_q1e3       ........ ... rm:5 ...... rn:5 rd:5      &qrrr_e q=1 esz=3
 @rrrr_q1e3      ........ ... rm:5 . ra:5 rn:5 rd:5      &qrrrr_e q=1 esz=3
 
+@qrr_b          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=0
 @qrr_h          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=1
 @qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
 
@@ -1643,3 +1644,6 @@ ABS_v           0.00 1110 ..1 00000 10111 0 ..... .....     @qrr_e
 NEG_v           0.10 1110 ..1 00000 10111 0 ..... .....     @qrr_e
 CLS_v           0.00 1110 ..1 00000 01001 0 ..... .....     @qrr_e
 CLZ_v           0.10 1110 ..1 00000 01001 0 ..... .....     @qrr_e
+CNT_v           0.00 1110 001 00000 01011 0 ..... .....     @qrr_b
+NOT_v           0.10 1110 001 00000 01011 0 ..... .....     @qrr_b
+RBIT_v          0.10 1110 011 00000 01011 0 ..... .....     @qrr_b
-- 
2.43.0

