Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2886158lft;
        Mon, 27 Jun 2022 21:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ucSesPUDp7I2McyocBpyzbUxAY876BJz2MQ5Ij7bED8HepzUEdIPAXSYsGW7Pz6gidM3y2
X-Received: by 2002:a37:b685:0:b0:6ae:f550:5acd with SMTP id g127-20020a37b685000000b006aef5505acdmr10467884qkf.564.1656390517343;
        Mon, 27 Jun 2022 21:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390517; cv=none;
        d=google.com; s=arc-20160816;
        b=DcLl3yxE1uoOTMyrrBN3BeCG4hyiXoyq4cssetX1t3Sl2KZx9V6u1tdu4gqhvyKS61
         vpV5klpofC+rZT3KY5dmuMKykK3SQYlwmqzRUMjWjbn8ifWxMygh/A04MnNb6U+v0NJJ
         VnNZ/6fJ705lgcnKzuZZAK8pnbjGGxFwgK/RWVMiqiko130uHQ/qdc6UH6lQVN4kL53I
         NVadEVrr7pM7stRD6VsS+YzVBVRTJioEAaD5iL17FoA2ZuabF/waUuw1TgeEqrGEDmUb
         1/Brc/7Jl5oOpo/Nwe8Ojaq+QAGmW2seZV4kDP9QGpbbskv58zq6wuxdKBrhrXa4RAVa
         WT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2QmVLtbyxFuao4V1znU2cRG0WtNL/n+crCqH//cwECY=;
        b=RSN5rAThDUdwXwy+cRuLisN7SVwSUrLlIT24q+ACzwIXieVTZ1YQQIOuObsNXas0j0
         hI2j3z117poe0mDwCMp3VahTwfHSunKQXUP4DYo9dQ08tj8HhZrySd7FidsC7z09caNZ
         MZ+7qSnb6FZ7SsxCEkz3MTdQBy8vEY2RMlHdp+FRS6nYffOaekPmHewvIDEkK9oybiTO
         MHRzmj7s9mY7SbaowNQkQcx178oC8h3iZElp6/jXo1Ho7Rmqp1mlGKofu0jWj68hc1FI
         1eZzliMiNf3KboRpd7Lx5/+zE/nVp3GHtxiiCqaxOtMLfUeAmkC53W/VqgqtvLOGQED4
         DcCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAHVBfyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020a05620a444e00b006a721fb1ad4si7158447qkp.692.2022.06.27.21.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAHVBfyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62q4-00049e-Rv
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jO-0001Tf-6y
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jL-0003ff-VZ
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:41 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso14590409pjn.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2QmVLtbyxFuao4V1znU2cRG0WtNL/n+crCqH//cwECY=;
 b=QAHVBfyxYinr1OKMHpdZIu3Jmf9BNDUYbrVCkbdHleuEC/eMGrCBN6zN8x6vazhrU1
 AP/oniKlxOegD4z6D6RZ+aOJscJYqtNqj3BpMmg/YbZqGQgg3aL5A4RvrJR3I/BBFJDy
 bev/+DHMkqcwdqOpmf9sL7mZohmkMTY5Ip4y5gluOHRjyNSjaME9eiGzsESAohIudUx/
 GznGeoAdvpyr1c0e3SKxqxgvQ2YlXCSZ81EZwsctrgwZK4vtR9MvXKm/mAHeRf2k1Nf4
 WMbHF1/cqjf2wqBljsSum1CjDgT4N1EWYP/0NYq6NE7Puj8uh+A42Avrv20CkaW0jroz
 2dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QmVLtbyxFuao4V1znU2cRG0WtNL/n+crCqH//cwECY=;
 b=myTFTY4Q5n0i5Tb+VjVx6i8pyJ5bSZ/JR3jsb8pWwT6l/y2NXZ1WvilNFCpy9basyK
 glVjfRIWkSbd7JL/x3phdm1PuprOjIIYH8B2MGe9UnOGZCJ6+IftDXaqEppSEIduvoAm
 ahP5A0+L4uR+/hb9pt4tyP0BbC6BgJeOlltGkxk/HXhikJqkhc6Ff5E10WahlUf5XdL1
 FL0DVA78x9/HITFwTvQvcKIN2WPYqIiHzCMgFa6p1urciBpcjWc9Je8q6Th+slGfsoyz
 tdpOkDIebLYNVaGyGajxVrUypaZWIMGTSyyX715RN1X7Q5W7pMWqpLRLWOOULANjyn3G
 1mtw==
X-Gm-Message-State: AJIora/TYBJ52t6gvQcJkXYJf+F3k0vabE16Qs3obcIwToyTWjxVYFBF
 ISVKYPzCccEEp6oVNQdtdcaA9Q==
X-Received: by 2002:a17:902:ef92:b0:16a:1ef1:22db with SMTP id
 iz18-20020a170902ef9200b0016a1ef122dbmr1653841plb.2.1656390098754; 
 Mon, 27 Jun 2022 21:21:38 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
Date: Tue, 28 Jun 2022 09:50:39 +0530
Message-Id: <20220628042117.368549-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: Ipb/BPykOMEq

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  2 --
 target/arm/translate-sve.c | 18 ++++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index c25bad5ee5..c75a94e0fc 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,8 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
-FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
 FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
 FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
 FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae48040aa4..130432654e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6194,8 +6194,8 @@ static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
     return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, sel);
 }
 
-TRANS_FEAT(PMULLB, aa64_sve2, do_trans_pmull, a, false)
-TRANS_FEAT(PMULLT, aa64_sve2, do_trans_pmull, a, true)
+TRANS_FEAT_NONSTREAMING(PMULLB, aa64_sve2, do_trans_pmull, a, false)
+TRANS_FEAT_NONSTREAMING(PMULLT, aa64_sve2, do_trans_pmull, a, true)
 
 static gen_helper_gvec_3 * const saddw_fns[4] = {
     NULL,                    gen_helper_sve2_saddw_h,
@@ -7125,10 +7125,12 @@ DO_ZPZZ_FP(FMINP, aa64_sve2, sve2_fminp_zpzz)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
-TRANS_FEAT(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_s,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
-TRANS_FEAT(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_d,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_s, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_d, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
     NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
@@ -7301,8 +7303,8 @@ TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
 TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_bfdot_idx, a)
 
-TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_bfmmla, a, 0)
+TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_bfmmla, a, 0)
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-- 
2.34.1

