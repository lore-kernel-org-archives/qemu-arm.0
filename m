Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104602ejb;
        Thu, 8 Jun 2023 19:29:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fvAaxUGqbbE9oZbzPqjh5VWGZJzDW19AWP1Y6yUwyfr9hwqitpt+ZUocoBtwBVGKI4eTW
X-Received: by 2002:a05:620a:8cf:b0:75b:23a1:3611 with SMTP id z15-20020a05620a08cf00b0075b23a13611mr7140261qkz.34.1686277748653;
        Thu, 08 Jun 2023 19:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277748; cv=none;
        d=google.com; s=arc-20160816;
        b=NfKpssRdlmjpqSLInPl1BsNERncwdZJr8UQYN7oY7s5kBArhRZv5ztzKKkoTFjxRP8
         h6JGewJA06lCXBbjsAAj/ofOUnK+xbkGmKeEjg+aY+wlkdiIYndsPNhBNw6zU/vebtQ2
         6tUu0QTn/8EBrq6w7AtG9tV4oVgdzfVENDcVwIkxZvDtPDlpHI2+M3qNrkvhK0zh/pu7
         PXNb+o4O95FW0afUlpiJCNsojSMeX1WY7szqYBWqmX6PN+CGxYn5GPVw7RsHJHUXVrhd
         2a1rPAQuxqr47P8HSCn7Kl3/idsajGK+9BCdn1KW30bBOTq3CpfWhrd4gIczGAXse1C5
         Eatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UEsv77WByzgBc2oRedydI0QuEnu20ntgk1P70X2mStE=;
        b=XPoDpZpkW/zUDe9gXJr1AY8Fvb/b2RP0jIYVaKNn4q8hSqxgLwTxqruufWTp2+wCc4
         UR1Ls4Jg5Nvmjt2RIiTGNQDWh8qXrZmzoTkF3vO6sb5n17h95MrxyTqcU746EQkxOO6y
         NF2Y+ccWLKCDfsSfXk+WWZ9VwcNObsmxNy5PbdGh8MNKD7Jkc9RHihjDyo4qtcB/B6fc
         N/Fapfto1du4XxE2QstpVhzQb9l4Iy+HOyQy7TxIshotgOqRW58lSEsv6fGg+TkMPRrE
         mZHg/AnNhmTRbt4QcCJj/O/SQ2UvharA6LDUDtUB6D+GPD90W/jz/p1I+goIYraOajw+
         ytgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DWvLz7ZC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r25-20020a05620a03d900b0075930f3984dsi1535829qkm.309.2023.06.08.19.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DWvLz7ZC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7RoT-0003EE-AD; Thu, 08 Jun 2023 22:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnr-0002qN-Ht
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:40 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnV-0005dL-F9
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-655fce0f354so1067415b3a.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277456; x=1688869456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UEsv77WByzgBc2oRedydI0QuEnu20ntgk1P70X2mStE=;
 b=DWvLz7ZC4U5hGRIqf+G7WnjLYNqrXKtFl0C13U11urueTgw/28fungNBco/0OHJqJa
 MO+ZnmdEgPUtb6Nrdo9b+9xkKUWkbszGdL0jfH1u2gLBoLDUOTXZ61Fv6GLMyH5h9yYm
 AZSZryQGcxms1rOQwOKF9yh1h6XquZtBU+5+a4NkHqyg2b5i1HugIove/9OXKWW6HJzj
 SS33tBU6/Mq/lCJ+U++L6LnK4EmSTTz7e9vt1KArL3PwhhPhsYuMAHhphOyEilxKQUtA
 GBGYaVugXi1i7PDl9OMfEIV0GU4RUDozuMIGiqhPl6KGSsJKddlxAvBcac2qELjewd86
 BzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277456; x=1688869456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UEsv77WByzgBc2oRedydI0QuEnu20ntgk1P70X2mStE=;
 b=VJmA9EX9SW+VWSYWQSK8/wy1L/mmXpS5gjiW2KRlp3tN09sTRnFsIupRUO0tVXUjmQ
 vMPwUE3hzHfV2RacXMz/2P6T33SnQosz1R/ETwLZRaorlKn9BGlNx/S/nCJL5FxZgbCc
 IdIKcmkRddW0lv/G2n8QYpGoQn98QYGMA6oZyDZtA+ElrK1j7kIwIG7HARWCh5dn42wD
 pNu3zWgo5Ewfed9zTIxLZynfKWhcg/JReqHzSYUVDkKWFeQsCz6pRtIeCAxMqQHMyhT8
 A57OF4hABFqjj8xHD1mOHk+G/XKiASlqDDwy942O6JvpTGoGJ3qRcMYR+M9eyJEXpF6J
 Obdw==
X-Gm-Message-State: AC+VfDyfgaSEiyrn8BOoA3R1HorezqO/RI5EkEQ5hG1yfeQEamgydB3l
 lyHM+YqZL742pKFthQDsBxAC/DPqP5s/WRgNQy4=
X-Received: by 2002:a05:6a00:1a0b:b0:656:6d18:3d83 with SMTP id
 g11-20020a056a001a0b00b006566d183d83mr36234pfv.7.1686277456170; 
 Thu, 08 Jun 2023 19:24:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 14/38] target/arm: Use aesdec_ISB_ISR_AK
Date: Thu,  8 Jun 2023 19:23:37 -0700
Message-Id: <20230609022401.684157-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1ocpTUgZ+cdy

This implements the AESD instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 37 +++++++++++++++-------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 00f3b21507..d2cb74e7fc 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -48,26 +48,6 @@ static void clear_tail_16(void *vd, uint32_t desc)
 
 static const AESState aes_zero = { };
 
-static void do_crypto_aese(uint64_t *rd, uint64_t *rn, uint64_t *rm,
-                           const uint8_t *sbox, const uint8_t *shift)
-{
-    union CRYPTO_STATE rk = { .l = { rm[0], rm[1] } };
-    union CRYPTO_STATE st = { .l = { rn[0], rn[1] } };
-    int i;
-
-    /* xor state vector with round key */
-    rk.l[0] ^= st.l[0];
-    rk.l[1] ^= st.l[1];
-
-    /* combine ShiftRows operation and sbox substitution */
-    for (i = 0; i < 16; i++) {
-        CR_ST_BYTE(st, i) = sbox[CR_ST_BYTE(rk, shift[i])];
-    }
-
-    rd[0] = st.l[0];
-    rd[1] = st.l[1];
-}
-
 void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
@@ -102,7 +82,22 @@ void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aese(vd + i, vn + i, vm + i, AES_isbox, AES_ishifts);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vn + i);
+        AESState *rk = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1] ^ rk->d[1];
+            t.d[1] = st->d[0] ^ rk->d[0];
+            aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            t.v = st->v ^ rk->v;
+            aesdec_ISB_ISR_AK(ad, &t, &aes_zero, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

