Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp103739ejb;
        Thu, 8 Jun 2023 19:26:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4CMVIbuJ/hX7tNzqiGKJM2KdPxIg44drJsD542Omt7cqSuHmfLEOBTfBp3MxEBBXJbawVP
X-Received: by 2002:a05:622a:247:b0:3f5:17dc:ba6e with SMTP id c7-20020a05622a024700b003f517dcba6emr342756qtx.7.1686277566741;
        Thu, 08 Jun 2023 19:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277566; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9KclaDYtXF4MiqXWE8mjtR/xhhQn3Aj2RR539wq+uzJbMYAU/hoCPM6JT+0hYDSvw
         IlOMBpIGJ2/fsPephHWwhVvdBB9bDhqiDW3NJ2B6T4E1FHEYjC09ilFEhQiV51+3aHSi
         e/zX400qvQ+2dV5cRYZuqDeREDAA1siGA+E+q0UaDzBjux5F1ovO0M5PDaC3YiqI/2xn
         ZUEErpR7A9ooQdz/jH11HHsuWN0KSJ2Sp/Lw+Jx5YQQrvqE7XQQtDi88HSRLVcYMdhII
         czMnd4MuBQIN1V/uE5tBct9iKlCdw4wtE0ck2q6EZ8KckP8e+wq6Ai+0b+U15xIideEn
         K7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F8c22mTwcbWMs129JigZzKtfDDKQP2XGxgtoSuBUoiE=;
        b=BRRdQfSIwdKCmuivGU8GzT/YAHv1J6Heu17vexW+oKnZw5AhihReAiWU6FKdPEFy3j
         AAQaRiGdxmUO7qc67bBy6oyolu1UUSRB4HvOOrSNNjwtxNrsiCPICO+ddOxZxFMWih0P
         nVssEFxx/CBCJfyb/Y8tY4rUVL959Gze8INQl/iP4IhXeU970FfCT4tSVA4Ygg28agcp
         Now4o6WwrN7CsrpPmMeAo40GSyso73p3DC+iugefvLPb6CvxSO2Qv/fxOp5OEi1RVjsz
         2Xqn9U0VkKNEDO//H544eq0Gwt1xnZsUcbZPtA3pBmao4M66uoYHBx6WUwL8muK7kpVw
         WXtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o4dpDnPk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05622a119300b003f53e9d84e0si1487257qtk.484.2023.06.08.19.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o4dpDnPk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7RpB-0005SO-JL; Thu, 08 Jun 2023 22:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Ro4-0002xt-6R
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:56 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnb-0005i5-K6
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:51 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b29f53137cso271081a34.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277462; x=1688869462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8c22mTwcbWMs129JigZzKtfDDKQP2XGxgtoSuBUoiE=;
 b=o4dpDnPkLPLPDOMiRBxKaP/P9jKnyd0RWhw0MRtoNyGJjaTL1ksQsfpZT6fsOA3tPJ
 gv+J8/xpXj9OTt0Oj0JfmKdK77SzpdWkVA9slVi5fVFH2+VoF4KmefLV4KsEOrVzI6qD
 OA/grzJhbg6Ddx8vSL7C/dHJsjJWY5aSUDnxkR3d+T+Vzre/VERA7fVkfbxUP03ZuQ8n
 4/4GvOJTAJCIsMKX6ozxpvqj4rj6fAho1Z62G2k0RYIj+tsv88IvmMPDEY1Dtj7PjkJP
 pvDbzaszSsS/1dZqQEaPRiBRZ27wrB/IasDCSbL4pTIHLSL7PCH7OdohYg6EAXkbcY1o
 KYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277462; x=1688869462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8c22mTwcbWMs129JigZzKtfDDKQP2XGxgtoSuBUoiE=;
 b=QYLcY9dFHDeHuDCJS1PII5clWAdZkQ0mT9n3uuWCHFRNF2yrc2YAFKumuWcQwzVoYl
 wIVX6gFfqE1p4FUl9sCXadEHghqLme9iTl2Grz9YicBNj5zDkuwJJDVShPkyGwzt0wYU
 sjXkLogdUs1vSq1nhm3i9/4WDU0z9103rVPrpl3pk60sT5/bNxrqg6hYkxeUIYhkwjUL
 xFSx5yXs7/V+qY//sJSKG46Ly1OOoGVIYn7Ml6I4HT5oewMiifiXK+AYf4PKANMpTUED
 wIs7InA0EplZIKLWUc7XRe2tTUZrH1oHi9+Y2Ir4dymSBT522BbDvV4rwqL0wLwDg+9+
 bxbw==
X-Gm-Message-State: AC+VfDwq4djgo7g7PLnG29cox77fWFVWQgQEjZJy5OVSlM2xQt08JZRc
 KB8m6LekqRmQG2pLzOtfHsaLZwmJgG/toBTyo/4=
X-Received: by 2002:a05:6830:130c:b0:6b1:655c:376 with SMTP id
 p12-20020a056830130c00b006b1655c0376mr219015otq.7.1686277462532; 
 Thu, 08 Jun 2023 19:24:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 21/38] target/arm: Use aesdec_IMC
Date: Thu,  8 Jun 2023 19:23:44 -0700
Message-Id: <20230609022401.684157-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IEKE2JNHGfn2

This implements the AESIMC instruction.  We have converted everything
to crypto/aes-round.h; crypto/aes.h is no longer needed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 1952aaac58..fdd70abbfd 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -14,7 +14,6 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
-#include "crypto/aes.h"
 #include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
@@ -102,23 +101,6 @@ void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
 
-static void do_crypto_aesmc(uint64_t *rd, uint64_t *rm, const uint32_t *mc)
-{
-    union CRYPTO_STATE st = { .l = { rm[0], rm[1] } };
-    int i;
-
-    for (i = 0; i < 16; i += 4) {
-        CR_ST_WORD(st, i >> 2) =
-            mc[CR_ST_BYTE(st, i)] ^
-            rol32(mc[CR_ST_BYTE(st, i + 1)], 8) ^
-            rol32(mc[CR_ST_BYTE(st, i + 2)], 16) ^
-            rol32(mc[CR_ST_BYTE(st, i + 3)], 24);
-    }
-
-    rd[0] = st.l[0];
-    rd[1] = st.l[1];
-}
-
 void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
@@ -147,7 +129,20 @@ void HELPER(crypto_aesimc)(void *vd, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, AES_imc_rot);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesdec_IMC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesdec_IMC(ad, st, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

