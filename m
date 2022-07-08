Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp334368lft;
        Fri, 8 Jul 2022 08:22:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ugAJy0ugxd9MRddtxcrV8VDFMOwX1gEzszZ4CMjRt1oQxQQAIK/xXK17y2VdTpzmhzST6m
X-Received: by 2002:a05:620a:bd4:b0:6ab:8874:4cdc with SMTP id s20-20020a05620a0bd400b006ab88744cdcmr2811259qki.415.1657293755773;
        Fri, 08 Jul 2022 08:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293755; cv=none;
        d=google.com; s=arc-20160816;
        b=mhjX0M9+N/xCmji/oz6jFULk/tscTQO2E4AfE9pxOuYsQyaoJl/qpR5mVkUENF4lAa
         e1nAMRLGySkRjcofyDA9mXf6JgpIeGIuGLPIdIru7tavgW8h8bn9SimTJTME3QPfJCbH
         F2g/IDMtBEi9KYKYfzhLgJ1OXMIsjg73lMyKrL+/XCaTypAn2BbuQDMNLQmazTd+Leln
         1KAjsACG72l1g4Lj6QxmLk1rxjlPYKiQ7bDT8GYp+6CBAPFRdop9/kUAmM0rKo25NfPU
         kqY9/8hBWwUClB6p+9rONWP4p5WUOiFtyRq21aPpAOCCLUgYW9BO9OxFYuAgu62Hm3ws
         85TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eMDZljSMa7lgcdxc4v8wiBGe99d03Zr6CetA/Z+JkFo=;
        b=r+3O5gc1ZxPv9aecAIS3HOPoVu4PPS5sbN7vXxTE4niMwutBVn/wLjrv+x0tEHhBMy
         2t07VUbMEKkjGQUHmtDLFuVRgZ7x6Lq4wANRaDi0yW/vZKJ7U/T3U2brxVXLrGCn92ql
         QJ58v0PPvg1r9LFKOCjA0T9wWl/Z3VHmYeZNEp46IK2Mlw2H0fsQw2fIDtRterOJXZVr
         07SnO5obq1sNG70d5Z9lKrcFjrt/0vF+LixKIqylO7hNjnkoOBODXg0fnwUuYW7IYn4i
         r5ohlhxtCW2jDEMFUshoNp4vHQqPBRFKN4BMWpCRhwQWKakb8AZxYMMWiJRism79mNE8
         dAzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bBknTnws;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw12-20020a0562140f2c00b00465b71212f8si24897104qvb.493.2022.07.08.08.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bBknTnws;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9poQ-0005OG-L6
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piO-0002Mf-8z
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:20 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piL-0002C5-UN
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:19 -0400
Received: by mail-pg1-x533.google.com with SMTP id i190so10003669pge.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMDZljSMa7lgcdxc4v8wiBGe99d03Zr6CetA/Z+JkFo=;
 b=bBknTnwsvdYJ4IH1HT01E84YxRPB2fwfykMBOcWty8HM9jm8/FtapVvikPFxogSODI
 qg0kbuSeoj83xAJg9Vijff0IAhikgXw/XFNBwCV5uczREBnl4vMUAqGffZWjJxwjN/qN
 jWwortGJt+JzqKMTA6mr5hqeo2FoMmt24MFEEb5BWOe7fG7KiN76cjheNASg5ztBPpwL
 hOd5zh+boO+IFM6eiczMQPm1b1gzWdQN9XeeeETW7wIm1vmS9MCDyixbhmOZ2pyu8TmD
 hXXELyQ111U8O9KdW/DyCKn5nCPxWuRQkZCfoxOaDhRxSEO7ze8d6mXXE0AP5zJPC5cs
 ZFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMDZljSMa7lgcdxc4v8wiBGe99d03Zr6CetA/Z+JkFo=;
 b=JCmxNgqYx1435T/75bZX5Zlcv0OI1hnpQMwhwl9mhSFQpZh6+DiW9bZPGWuEdj4+r0
 XVISpjzd/gPyVyb6tAdTL2bCK8/ekdqOnIdafHZDBo0fhK3EbKWCNQOJtWJQoCZO0erH
 NdG4t52+0UwdkaEDRjBCgqzttqz4oW6CLAFriytUBJNJdWJ/f9gvlcyE+NmcamfJyyWT
 ACfcRWZ1AHGZiP5dG8xaVnJRyOzm45M49M4NzhXrUmml+FxUzC07yE7MelNl/jYiMSWD
 bRwEbcZcHsLzrmjp3pe7GR4prRYli+ascMR39hpHeVx0pxLKacr1mtpSlUFS0PhA1q5b
 IxiQ==
X-Gm-Message-State: AJIora9ep/HFOW4Omikko3Nce/QElvjv2oH5zl+h5XCxumlzJhJ3q16B
 hT6uSHS+eiKsbMXgKe6mjwQcPqUGmNWYcEbl
X-Received: by 2002:a63:1a09:0:b0:3fd:ac2b:3876 with SMTP id
 a9-20020a631a09000000b003fdac2b3876mr3728690pga.457.1657293376465; 
 Fri, 08 Jul 2022 08:16:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 10/45] target/arm: Mark string/histo/crypto as non-streaming
Date: Fri,  8 Jul 2022 20:45:05 +0530
Message-Id: <20220708151540.18136-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eSktcdwCKHNM

Mark these as non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 35 ++++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 3260ea2d64..fe462d2ccc 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
 FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9bbf44f008..f8e0716474 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7110,21 +7110,21 @@ DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 static gen_helper_gvec_flags_4 * const match_fns[4] = {
     gen_helper_sve2_match_ppzz_b, gen_helper_sve2_match_ppzz_h, NULL, NULL
 };
-TRANS_FEAT(MATCH, aa64_sve2, do_ppzz_flags, a, match_fns[a->esz])
+TRANS_FEAT_NONSTREAMING(MATCH, aa64_sve2, do_ppzz_flags, a, match_fns[a->esz])
 
 static gen_helper_gvec_flags_4 * const nmatch_fns[4] = {
     gen_helper_sve2_nmatch_ppzz_b, gen_helper_sve2_nmatch_ppzz_h, NULL, NULL
 };
-TRANS_FEAT(NMATCH, aa64_sve2, do_ppzz_flags, a, nmatch_fns[a->esz])
+TRANS_FEAT_NONSTREAMING(NMATCH, aa64_sve2, do_ppzz_flags, a, nmatch_fns[a->esz])
 
 static gen_helper_gvec_4 * const histcnt_fns[4] = {
     NULL, NULL, gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
 };
-TRANS_FEAT(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
-           histcnt_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
+                        histcnt_fns[a->esz], a, 0)
 
-TRANS_FEAT(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
-           a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
+TRANS_FEAT_NONSTREAMING(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
+                        a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
 
 DO_ZPZZ_FP(FADDP, aa64_sve2, sve2_faddp_zpzz)
 DO_ZPZZ_FP(FMAXNMP, aa64_sve2, sve2_fmaxnmp_zpzz)
@@ -7238,20 +7238,21 @@ TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
 TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
            a->esz == 2 ? gen_helper_gvec_usdot_b : NULL, a, 0)
 
-TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
-           gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
+TRANS_FEAT_NONSTREAMING(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
+                        gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
 
-TRANS_FEAT(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_aese, a, false)
-TRANS_FEAT(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_aese, a, true)
+TRANS_FEAT_NONSTREAMING(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_aese, a, false)
+TRANS_FEAT_NONSTREAMING(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_aese, a, true)
 
-TRANS_FEAT(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_sm4e, a, 0)
-TRANS_FEAT(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
-           gen_helper_crypto_sm4ekey, a, 0)
+TRANS_FEAT_NONSTREAMING(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_sm4e, a, 0)
+TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+                        gen_helper_crypto_sm4ekey, a, 0)
 
-TRANS_FEAT(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
+TRANS_FEAT_NONSTREAMING(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz,
+                        gen_gvec_rax1, a)
 
 TRANS_FEAT(FCVTNT_sh, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_FPCR)
-- 
2.34.1

