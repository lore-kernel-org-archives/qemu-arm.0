Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2085344lff;
        Mon, 14 Jun 2021 08:43:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT3ixBkhbeE8jd2Km6UZNgyWpye5n237ZSctcgbqN+4SWC2HubabgxkI4q/8mUgkBEfjtz
X-Received: by 2002:a67:b44c:: with SMTP id c12mr17946834vsm.7.1623685390236;
        Mon, 14 Jun 2021 08:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623685390; cv=none;
        d=google.com; s=arc-20160816;
        b=dCw53tcLbeHXkqMSY3k2GY7c7PNj/tI1AWIDA/1ISnAehbdCyToVpYCZF3bwRi6rZ0
         yxoH1NLWPOAWji4cKWZWT3iDQh76GXpkLPgVLpHiLstoYufi0Ki0tW9qxUOjX7GoHhvB
         C++jT4BfcwjFfcrMjmNJADj+pF8HXtuXQqizXxmfSbHKiF3v5G7OAcTBSy4HMDovtjBF
         XKfX3aqAKMKAW1Cx7pF/xDzdxjZDK1DS5HbG291SxcjZHoOJa3AYxlTpBQCssZtVbFk8
         2qxMDUO4fTVgZQPdXvfk8R6qhEBuEg/OBKXHoMQOR7o/I8j1sp1M5EEQPDUZTi3M1EOb
         Tblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5Akv5O3gdjVrTqCIXbrRhtQJKkd4wWDJEYr14K1N04g=;
        b=gDBFuUPmEvHgWpcG6kufnT/DuHhPrkjExisIPmGAI6moOL5fOm0vFcANg61Bk40xZp
         ZH3bG4rSrTxF9OFp5gMsWWi5fw7s4HtQtO+gcodyuSXE6VQGp4rAYDN9F6x5l2t4uTYT
         pG2g6uf1uFMPDxM60qFymnI52NKXIwGhmVQ/S3rlLbhOtPtuSgAEI2m9bYJcHDYL5DdG
         0GzGzzGavLMthttxmKFaXwLXAgBBN8G/w+C+5djBEH02s/Pi7G1zdNG4FZCgFa2CecK6
         2u3O4bIgsCL0wid+Y1suGvQNJ0DOPjk+qvC57n140oq1oUoQch9YSMR+h220oa25t4z/
         HoyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YGA/XIFh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si1385309vsa.276.2021.06.14.08.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YGA/XIFh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsok1-0006XD-ID
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFC-0002cd-Eu
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:18 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEo-0000dc-AW
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:18 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso13337759wmg.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Akv5O3gdjVrTqCIXbrRhtQJKkd4wWDJEYr14K1N04g=;
 b=YGA/XIFh0yK/mP0Glc7jJTKcfSkCDzi5znC688Z909oIfEYDL/xaLK/EJagEHImRzW
 fWNCjWk0cUnNpHUCg8he3fXKuUhGw4eFHx6s74weOwabTImTfZVqRg5NEHSMFxzL/O2h
 jjlQ/Dyn0shHFJcSJKvqoP0Mb18WxuMeCoVYERdCytdIVe4trlfIshmw2LSsrK4cLVRN
 iqs0/cdajfBW1bKqLDH4/3S/Ib1ZaM1wN9gAss6cdz7DBI0j3SKzynmAQgz+AS9nu2iM
 JuNU3kt4PN+Axw5PPIzBEv1EqU+s2mH7WqfkCid5a1DCp3uUzqRrofIclRiG3GuejejF
 WukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Akv5O3gdjVrTqCIXbrRhtQJKkd4wWDJEYr14K1N04g=;
 b=jJ7/f3oilzMmVUl3t0i+P7Kme8some0sqPNjI5wPoHquixeLiSP1eO7gYlrKZxL3CS
 Uo9OHfg4pCFGIHUGw6ysq1Dt+JbvHIGHAXB/E1GKpRSPt2jaBUobqmnZz/KsNXYpxgvU
 T7x+fP1z8+8AY/yDaSZ1jTTZUYK2fCVK9w+E3wpm8Wn6uBhTfvT3+nWGmIknAthrB9QR
 Bjg1HpWk3SBTLdO/oQL2zpqOgTErNrkyNTzHdFanrouRsxlj8/tYdtnijOwMQa6I1LFU
 IxG4jvkAESKvh7hk9fImgnURHuWoSQPh2jxC6Mc/bzpJjsYtHSBovwXeUzLOIH4MT3cI
 3vTA==
X-Gm-Message-State: AOAM531NUhoglQvy87sq3GRoGnH20e39VTFSpfM0bx1koIXL6ZKfKJAk
 ilRynt8ttn5/WnC5bhIXNtD25AzKxV1Q9w==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr17246212wmh.115.1623683453007; 
 Mon, 14 Jun 2021 08:10:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 52/57] target/arm: Implement MVE VRHADD
Date: Mon, 14 Jun 2021 16:10:02 +0100
Message-Id: <20210614151007.4545-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JwFX92UUseA5

Implement the MVE VRHADD insn, which performs a rounded halving
addition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 34a46ed38ee..2f0cf99359a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -238,6 +238,14 @@ DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmullth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmulltw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vrhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 3a2a7e75a3a..6b969902df0 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -157,6 +157,9 @@ VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
 VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 
+VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
+VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 7c5b36caae9..a8ff921144d 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -546,6 +546,12 @@ DO_2OP_U(vshlu, DO_VSHLU)
 DO_2OP_S(vrshls, DO_VRSHLS)
 DO_2OP_U(vrshlu, DO_VRSHLU)
 
+#define DO_RHADD_S(N, M) (((int64_t)(N) + (M) + 1) >> 1)
+#define DO_RHADD_U(N, M) (((uint64_t)(N) + (M) + 1) >> 1)
+
+DO_2OP_S(vrhadds, DO_RHADD_S)
+DO_2OP_U(vrhaddu, DO_RHADD_U)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ca1203e650d..a4efb9bc3eb 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -418,6 +418,8 @@ DO_2OP(VQDMLSDH, vqdmlsdh)
 DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
+DO_2OP(VRHADD_S, vrhadds)
+DO_2OP(VRHADD_U, vrhaddu)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1

