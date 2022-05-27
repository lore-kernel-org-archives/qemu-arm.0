Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1250084lfh;
        Fri, 27 May 2022 12:46:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkiNasJSdW2Q5/mco6st4ACUyNNSpei3i+t+wwh7F3WKfKgBM0T+oTTw02eh+pxxjCqvMo
X-Received: by 2002:ac8:5890:0:b0:2f9:a67:540a with SMTP id t16-20020ac85890000000b002f90a67540amr34095278qta.343.1653680814505;
        Fri, 27 May 2022 12:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680814; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7Srkdhs06GmyFaOjuvomM7mb3h72so7NB2sZNrXTug5XZNg+CVPFUdJC6Hf7ZH1YE
         ICJv08/5nLD0ZNqLyBaDighobA7S0UdXI8TdT+QuOfOCPGiaXsl04wXN4YCX1rJW4kcc
         JB37Fkng/Z/OzPQWblxXRsKYBgaak2EJXmzD/ftVjjjIaXOQzy4vQbq0ZtvSdCXuhiUA
         xsDH3lp7nh7yrYhMteDdadaRjvoFnehuX2XW/lQBL5KOljh8DEyNFQ/SikRZn5XMSXEK
         XguKF3viZYWUxrd4aJoZKJp7ycsalqesmpuGaMHVZK2pajmdaMAjZRejyPJVAivQwFhp
         xriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=w/lNk2qkqgQ+rmGqQqN5rCG4jy7r+6S9uqaRalzDtp8=;
        b=KkGNX76/ob4+TQcKkqZi5eF0py2ASvlb2OAW9qfkEGeec0MwugqS/+ixGwvRhRyiqT
         6Tbm6KdBrftTdmZyIv+EYYWAYSspSDbNlzYulvf6qjH0svlFj8V8ek5YDALGqtekhEk/
         iHmQWV585POKuwz9qSPTflMDe63dltl4wgTQmkVRmWI/cbap4v6KmFdiZ4keqx1qFChh
         Ubsq6kte9qWmAVVXNOMCiZm+Y5MHLgDAbtTLalh3LaxmkQgzbE0cPekpPfNNNnxSc6eP
         0JJ6EHZCSwgO1wL51nU/wErABQb+XsrubhpNVZQZPzBxdPI4E/QMgsyofZmmyVmb/xAH
         UKDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O5x8Lah4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020ac87f8c000000b002f906ce8b05si3406914qtj.280.2022.05.27.12.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:46:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O5x8Lah4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufvC-0002Qs-0x
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefT-0001hk-E7
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:36 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefQ-0005Js-40
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:35 -0400
Received: by mail-pg1-x530.google.com with SMTP id v15so4566168pgk.11
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/lNk2qkqgQ+rmGqQqN5rCG4jy7r+6S9uqaRalzDtp8=;
 b=O5x8Lah4/nSLBYNucKZrXWYCou8bVB6w726Zu2mJ2dCKAv2+kC/Ccy+NMuMnYbLKNr
 oqZODBKucG/UaGWR/+mgD6xxU+ZZWUdr/OrmTYwqSwi/b39rCiqCkVQJJW+o8T6dkO0n
 t+TYidnMGj8iiorMhX3mF/pJ/FctI4gMtrI0PJA+GP2euPFY8IwvJq1Kjy5etX9S388d
 ryTJKkJpsd6G8g8x2EwTRNb0//bMmaddBgikylzfHcEC4C7QMKKHdk05rrkOcxfK8tqc
 DVV6YJIBkup1w7ZTMYnWkMsAgdg6uyqu9TknvS/bTCZWzOmaJjY9y1qDJ/gYRgbPQ+B0
 2XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/lNk2qkqgQ+rmGqQqN5rCG4jy7r+6S9uqaRalzDtp8=;
 b=NV9Ct7BGKEb0t9GjkSPcxxZFxss5StDxpfEKACAp2fVEMSBK3t4OxVTKqN0TGYqBoM
 1OavqEA+yanBpeY1goUlpIfL7q+hZMBaQIc/JTynusfzvN/tETVo9NOugezqq2m9dmeY
 cx0AqcAIyCecpCQ64PefIKi3bt0x97ijMxGeugIDeDPxAjDuKqUlOAzN9OWjnkt+pq3H
 vJ0s0avM5XFIja6MeDGE4GjHjf2biqZItbSZhWUSbkkr5uvgLJCXnRku8nQHwupFdyga
 cM1/6oFbZ4EVuo6tujPHPrmaJCP3ssMNad0VjH39fodTXdlztAfobdN+GSnxSf1o7Z62
 5NyA==
X-Gm-Message-State: AOAM531AXJt52QmIHx8VDdeJpVNIM5OQyxGYXZXpz/BD325JgrwpcYJO
 w4PPtIf+CPxhUcLH7Ucnz+eyUWxQyj7+7w==
X-Received: by 2002:a63:d301:0:b0:3c1:7361:b260 with SMTP id
 b1-20020a63d301000000b003c17361b260mr38809558pgg.367.1653675990689; 
 Fri, 27 May 2022 11:26:30 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 088/114] target/arm: Use TRANS_FEAT for FTMAD
Date: Fri, 27 May 2022 11:18:41 -0700
Message-Id: <20220527181907.189259-89-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: cIimzKF4BpnN

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 29fcc8b014..11e4b4e1e4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3715,28 +3715,13 @@ DO_PPZ(FCMNE_ppz0, fcmne0)
  *** SVE floating-point trig multiply-add coefficient
  */
 
-static bool trans_FTMAD(DisasContext *s, arg_FTMAD *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_ftmad_h,
-        gen_helper_sve_ftmad_s,
-        gen_helper_sve_ftmad_d,
-    };
-
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           status, vsz, vsz, a->imm, fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_3_ptr * const ftmad_fns[4] = {
+    NULL,                   gen_helper_sve_ftmad_h,
+    gen_helper_sve_ftmad_s, gen_helper_sve_ftmad_d,
+};
+TRANS_FEAT(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
+           ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Accumulating Reduction Group
-- 
2.34.1

