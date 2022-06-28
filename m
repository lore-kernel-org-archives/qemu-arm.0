Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2888717lft;
        Mon, 27 Jun 2022 21:35:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1viixPhQ9PhoQdOrGfIgZ9DmDzvBkCIWM0I4Kh7VEDY7dpT2tVB+2Q0QpsM4OwRf7wFz7XZ
X-Received: by 2002:a05:620a:4109:b0:6a6:d52a:10a4 with SMTP id j9-20020a05620a410900b006a6d52a10a4mr10195441qko.616.1656390903741;
        Mon, 27 Jun 2022 21:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390903; cv=none;
        d=google.com; s=arc-20160816;
        b=B/Dxq/AXA1rReFELn1Wuv/MfJa5jsmS5uTQah/VcOXtfYeyNIcgd8yjA0Df/Mr3SG+
         NcjAA5MeVav+AL7hAFyRAHhn5bVQSS+fpmswVM+E+TE98wqAWLUUewzw/ALSRTVpRaGI
         wY5mCR+Ap1ceaL0jy08m3DxrcmemzGC3bE35HyYg08yDmK62vd1XBEup7LNnGEe6HK6j
         T+6MbBtvAfpaUupTNEdcSBEGA7sdESNRJLgdcDAZpwh3SITufcN0QLcyTaJLpnNYAOh+
         NvZ2l9HEwnkdJXkqkXFV2sbl3qKm3xNRfZRChqY776/2Siiy7q9KPtvYVTjG/5LtV6kz
         sfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Olqir63f5/Kf497Jw21bcj1fKrQr3VFFu+FKw75pZwk=;
        b=kf93RcypU26i1BUyh1B/7nLrSywToIsCGkUDlvcVOEhSETxFJ+ekpxHFT95duj1yIN
         gK6Kgg7XgXJ0ynIKIcr1kDVqTKjUuR0cWYiPI85tBm+IWMiXso0Yt1bpdCsjIt9Q7UbB
         lrtvaTEoj8Z/4v/Lb6vHJjNhnxIGsqeCxdusVH3E8fedy8yMVzkYFNL2mgBvk9dRKNUK
         q+mk/bHjMjO/ZNaecl4tltCdtsqB2W1tjAwxmbEZFWehPq4Q6kmuWGi2CuOu6G8RPG2U
         TDJP9FUW7XFwxIzfxyIC6k8dNEMdTmwxaaVY47x2vjCCp4Hr3npXxoPlWcmVzMWaJ40q
         Z67Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bfYhMfmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh13-20020a05621429cd00b004622e1e8572si6750131qvb.220.2022.06.27.21.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bfYhMfmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62wJ-0004pm-7f
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jU-0001aH-Mb
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jS-0003gw-Q7
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id cv13so11357044pjb.4
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Olqir63f5/Kf497Jw21bcj1fKrQr3VFFu+FKw75pZwk=;
 b=bfYhMfmL4GOvEmNB83NFv7ZbJn2xG2jPRxrvf1Ex9XozX66c1VdDWvm3QbDm9OxsEB
 F+C4EaQeg/NjWGq3wQPZIx9qdO5RvjiC5JvRkliREU4nzcf/tUBnHfAKl7tsHsmXfMYz
 vfygeQty2mWCRBKtCYPFNBiwCFCekmOsBrteKfY23RwffBxYCluMLXUdUPAaFc0DcnIr
 NWBegp7XJ8pPJ0XZ4wM8e4XU4obUkXcmCxn7qDKzO3G91gl3QLQsYK6gFlyIYKhY3T1Q
 yBwqn0B1ZuhuXy3ku2ki1VFSh17q/4m9IrM0Is1hZ/0ug+tn5RVA1axyRIqSKPW61ouc
 upUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Olqir63f5/Kf497Jw21bcj1fKrQr3VFFu+FKw75pZwk=;
 b=rywXINL2QNWOPmG9x14GblTtjX0I6E1KsZknbsn3JOgiR0FTqLO447UVmG7Hcejk56
 TqswpULz2xhFo5juMuvH0NEMF5m4FUFabjzTI1FxFlpe8sTRrectbU+7w/e57tregMOp
 ZqSopby8A2NA9wvs/mj+bmVXATcds965+/tNfAWRcTGJ3KBp4rMXVj6ebQzgvHVsF7pT
 nWNvNp2kHuw25TcHlFPoP5PrXhLmi6oezjJy+Y76SY6rO+NDOwn29y+bL0FqJT4vtK0s
 tm13Wk1dBDC2p6wjwU1VHH2yerjDY1huRJt8wBqfAv3Rye4tJja6wPLXP/+9iOd7T4Xb
 WOlQ==
X-Gm-Message-State: AJIora9YXv3dlzR6iCK8OBSa3Vtzw0DjoH0ffMy3b7BX0DFiiIvddz66
 jXfHYlha2OWI4QvTFnFsMsZ3TfDBwMR5ng==
X-Received: by 2002:a17:90b:4f41:b0:1ed:712:fd80 with SMTP id
 pj1-20020a17090b4f4100b001ed0712fd80mr24306641pjb.224.1656390105386; 
 Mon, 27 Jun 2022 21:21:45 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 10/45] target/arm: Mark string/histo/crypto as non-streaming
Date: Tue, 28 Jun 2022 09:50:42 +0530
Message-Id: <20220628042117.368549-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: LcAheaCNIsV3

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 35 ++++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index d3039a8bb2..4683850fa5 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,7 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
 FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7524d713ab..4c28cc9200 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7106,21 +7106,21 @@ DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
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
@@ -7234,20 +7234,21 @@ TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
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

