Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3713888lfa;
        Mon, 7 Jun 2021 10:52:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4Pwx+9Ds4+SA5r7+1DklGZJXh6+TUAe0yLS93vkZz14CZQAtiCRDNyEExlkZx9MYipPXk
X-Received: by 2002:a02:628b:: with SMTP id d133mr15095578jac.27.1623088336808;
        Mon, 07 Jun 2021 10:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623088336; cv=none;
        d=google.com; s=arc-20160816;
        b=OJuc9xBOoG2jv9+BcO0FNSnlRdomgLGnnXgPzBBo1HlQLxMx557ZIbdZRWaUMZ4f0/
         TDbu3ulJQTeBmoXbUpfscXnnMcCJrKzSAu7ERgYJaDwRtkjrpLovHSMfYlpYxFuKT01t
         saZXysr+CusO55M1ThuLp51igNhMxsJOoxtQQWuVRYOTLjH2WD2MfxjM40pbqqjhgz7w
         Mwl6DmK5Jar0eDYo+dsTIRTW5PYYVdd7Kgits6U/Koz4Lgzt1jd14F4pOrXgr6ktFPgK
         qSrxaxz7hPmu1tGeJyLTL4LlI6zmudFM3+652/9/IEu+XFuk3S57K3tLuaiIV5rnVyRR
         aL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MtUWIrOwARNN+B35zuZj2IuA3K1qcjuz/iaWJMrCiDM=;
        b=vWAhVYSK1gfyeMAJA2yB0vyJY7NdeKAWdY6iR0h9B92Bns0EwHrFFWqNVGnqFu7G9Z
         KKWAMh8592FgfNHlv1Wm21PuEA7YhwEI1s2kDsLQLkYnmnjWYkvOXKiNx4H4glMQBHwt
         r2WB5bJNhkbrlIcXr5UtzGSDl2Nci3XkT/C29oPP8+pk6l1PpzvOtg0KZOkN0BnoXBlY
         1KeYUZfC/uNZEUhLTPK/ZittWKA7NrRWAK+EJI4iOPM73DRRD5Y3SJU9eF7CvRKmMMDW
         YaWyh4N5J6bBjkzTgrJlXXHpA0jbEebB8N/JOG8gQFYw2naHL3g5C0eS0NHqawIpwEfp
         ZsaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WUszFXbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21si15130281ioc.48.2021.06.07.10.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WUszFXbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJQ8-0006a5-3N
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbI-00008E-Mh
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:44 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIae-000874-IY
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id y7so13800114wrh.7
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtUWIrOwARNN+B35zuZj2IuA3K1qcjuz/iaWJMrCiDM=;
 b=WUszFXbzhOx0qvh67xbSjDEy/SBMJE5J7mP+xDMtDdS7Bl1xf6MaWdqEV2S3KlixZn
 imxQW89lpBCb+TTGY7Z1apQA+a3GgapgpUQmqvN8Ckhsw4DfLL1l2+hInlvBQODuc0Zn
 vWtmnDWmOIc1TYCqJjy9JOByFpu9zGQnUTmBRu3HrpiRRzwv7apYHl0LdlBdyHF+KjIs
 ZY1OIZJ/PjsBXnhPHsVyE8ov5zI3OhoS2ZtzqhdiL9Hwmie28HiNcTfsdUjKtP+9krWb
 KwnUnMuoUSN+xByeaZglvk+etevV0/q0UnXYnTrehESs4MuUfMTzOIMPiBxUgoaHNS+j
 J51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtUWIrOwARNN+B35zuZj2IuA3K1qcjuz/iaWJMrCiDM=;
 b=KxBXD9Fz468duX97JI98xsynI8fgQTXCC+UT6q4k3YDFqyf1uAVrphLadCulkyE/pB
 qFDUjnnCq0WjHUbkOwNpYfpwEejP0iFgJv2iIqoaNg+Vp2RAgXR4jrkHUghh2sIbjp0X
 07aqTXajB2aUZfiQqa6K49o7oqKPDDuq6uDGVcz4XakGGy2hRH5n5T/3RTOceq2Vgtik
 l6IR/GqkBLDwkefBA63Dns9zyapXiSuVQBe6qppq+uOpKtp5NLQZMhYbHgf1M/WtCHMw
 lY9dKCR3DMZr/jVMdHd8/XNpQNs2ngmRPuKOg+/AtANEM8VpbKVcQxACJoF8S5ZIy8AI
 A4Wg==
X-Gm-Message-State: AOAM530WKu9xXyyMUl4m8+P9IhVMUntDb1Pu/8viCuDYml8zEuLIFA6O
 dY5XLNsFEtlk7C3TMW9kyX1b+ZsxTmT1/4L9
X-Received: by 2002:a5d:5243:: with SMTP id k3mr18359569wrc.19.1623085143072; 
 Mon, 07 Jun 2021 09:59:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 50/55] target/arm: Implement MVE VRHADD
Date: Mon,  7 Jun 2021 17:58:16 +0100
Message-Id: <20210607165821.9892-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: lBj6R8I1T6ZQ

Implement the MVE VRHADD insn, which performs a rounded halving
addition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index ffddbd72377..cd2cc6252f8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -240,6 +240,14 @@ DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 68a2339feae..c9434479604 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -574,6 +574,12 @@ static inline int32_t do_srshl(int32_t n, int8_t shift, int esize)
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
index b227b72e5b6..9a88583385f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -437,6 +437,8 @@ DO_2OP(VQDMLSDH, vqdmlsdh)
 DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
+DO_2OP(VRHADD_S, vrhadds)
+DO_2OP(VRHADD_U, vrhaddu)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1

