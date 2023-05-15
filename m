Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6577915ejq;
        Mon, 15 May 2023 08:07:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vK5zsDAyCxUHoYEUGYQwRWzrDVR+MogOK/tEtW2wwVIpNLqWoMaofBx7v4PHJXJj7/tRH
X-Received: by 2002:a05:6000:100d:b0:306:26d1:230a with SMTP id a13-20020a056000100d00b0030626d1230amr22588134wrx.65.1684163252957;
        Mon, 15 May 2023 08:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163252; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdqYbCh9nKRNDcCMYR/b68w7DIIVimK9CFyv0XT4/zT/NpqwKD+JMTtRRTN0e1x+g/
         RqjLFdu8u4oGN4q48ih9bqCcCZstPsvNEshGvmIGsWZ/A9tv0OhfeLEFrOo3jtJWPI0J
         pRGpOj9pDMJ/q91ud83R4yRoEdHzBxYj3Q/sxtgbQWXHjORtP9qSEA6R/hXSbB59kRnb
         I48OSmJskzan7SqFOSmcmk0Xhj0Kzv/gv37pW1Ad5WvwJSBpxOXE95jeu4t+djx5as+1
         dzWmgVbX61KQ24M14Inuw4h4X+GzMk0X3WtlnZp41Z1mWIuqZFDC4Yr3TIuZbTt21a67
         1aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1qqlVmOWLkkD4N0TUKCkau5U1AXPhMOrCn0VUAaOFSs=;
        b=rag50ZRQGFRrDdVYn4wBDB+LggqOwcp4N+jY1EcAAx+tWRa/1umw0ekHLouXtiSqSV
         Ag7CC0/GwmtHCL5y/JeVhsBPu7v6E214+jYvl1v6FX2dq2iNCxBBKJu2tQVFFR1g66Oc
         f3B97qPunIlfN1Bc4aa1UMD3iDQiV0hPcRVSB4RXRO7sx3axB/WwHQlpT+ip74qk8MeQ
         z3tdm7CEQYJ6xOccFeEOziu8XiGlHf0T67PstZTv2LrIsK5vNotNXVFytj45dD2cXCdk
         GnpDBMIg9B1QLan5vjgv7FO/F0deeFadKdQR/Cz+4ddtXfUXy10i9ScMYDqZxvz/kmtd
         FQoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQ3PGwvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a0560001b0900b0030652a5ec64si4284wrz.862.2023.05.15.08.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQ3PGwvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZK0-0005WO-UD; Mon, 15 May 2023 10:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJr-0004uc-CT
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:01 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJk-0005yy-Bk
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:36:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ab0c697c2bso118635565ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161411; x=1686753411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qqlVmOWLkkD4N0TUKCkau5U1AXPhMOrCn0VUAaOFSs=;
 b=aQ3PGwvPinfAAEnEb70YaxCNuLX3No6jB2q4yQYcsxAuXAJptV5lgMnabsGnL49rVh
 xXNov3k+t+pDSLSq9mFfmxCjOfHm2R09EfozwuysjcqblJZPB9v9Sx5D27l3XbltFnNs
 mjG8AGQ4qS+u0Yd2KK3xKIpCyWG2q8ntccfBFeTn3Q1uF8VtvkcKZRWugWLRMLRfMB/u
 HMKSJo4cdget0PImaa5PM6WVvMJPJX5IdpRKzP7pJRAMEm2XfizMjRmu7S76dmtdgxx/
 tELbAupCH6+gzvPJgiYKa64Mtglf8ttg0mFSe3HFqQwdDXiafXBmARvo73D8bvHngvry
 oHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161411; x=1686753411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qqlVmOWLkkD4N0TUKCkau5U1AXPhMOrCn0VUAaOFSs=;
 b=ES9vdidrQAfDtj1+LLgcpbJnyHz/OaoCAudk1AWKS4Pn1jo26AP6GeuL9SrPKVN8/P
 E2hf4q4fHMK6GCESaTDthivq+FkRR3yDXimk+FHvsyRNWiigsxwSqSIGZItKIXiu133v
 KQq0QvQDSoJFuaALaveDctMDoyyNpFq9c8R/KJboQ0S1JSjAuW9fbS2u5d1AfVHbS9lV
 aoeSedkTQ4KM5CY/uQ5wSV9pFU99TenfgCXQpn+/gNBBGJaTZwTKsMYqeC3XnJtC8qfP
 Rjk2+NB1M5h1ZQ0QedV2F/S0uDOROwYue1Eyn3crIFC5UmoTNsSI9Vbma6DbQhTmBq4c
 4G8Q==
X-Gm-Message-State: AC+VfDycUwdn6cpUTZ6gbSb+nBD05digx6dydeXl74c5/pAcQOShXBO+
 FWnBHkuCjzfQOl4x0VMjvZguzg==
X-Received: by 2002:a17:902:da84:b0:1ac:5b6b:df4c with SMTP id
 j4-20020a170902da8400b001ac5b6bdf4cmr39458614plx.69.1684161410916; 
 Mon, 15 May 2023 07:36:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 42/54] tcg/arm: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:01 -0700
Message-Id: <20230515143313.734053-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HU254sb2sEnE

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e5aed03247..add8cc1fd5 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1323,6 +1323,7 @@ typedef struct {
     TCGReg base;
     int index;
     bool index_scratch;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1379,8 +1380,26 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned a_mask;
+
+#ifdef CONFIG_SOFTMMU
+    *h = (HostAddress){
+        .cond = COND_AL,
+        .base = addrlo,
+        .index = TCG_REG_R1,
+        .index_scratch = true,
+    };
+#else
+    *h = (HostAddress){
+        .cond = COND_AL,
+        .base = addrlo,
+        .index = guest_base ? TCG_REG_GUEST_BASE : -1,
+        .index_scratch = false,
+    };
+#endif
+
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
@@ -1469,13 +1488,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     if (TARGET_LONG_BITS == 64) {
         tcg_out_dat_reg(s, COND_EQ, ARITH_CMP, 0, TCG_REG_R3, addrhi, 0);
     }
-
-    *h = (HostAddress){
-        .cond = COND_AL,
-        .base = addrlo,
-        .index = TCG_REG_R1,
-        .index_scratch = true,
-    };
 #else
     if (a_mask) {
         ldst = new_ldst_label(s);
@@ -1484,18 +1496,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->addrlo_reg = addrlo;
         ldst->addrhi_reg = addrhi;
 
-        /* We are expecting a_bits to max out at 7 */
+        /* We are expecting alignment to max out at 7 */
         tcg_debug_assert(a_mask <= 0xff);
         /* tst addr, #mask */
         tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
     }
-
-    *h = (HostAddress){
-        .cond = COND_AL,
-        .base = addrlo,
-        .index = guest_base ? TCG_REG_GUEST_BASE : -1,
-        .index_scratch = false,
-    };
 #endif
 
     return ldst;
-- 
2.34.1

