Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6590519ejq;
        Mon, 15 May 2023 08:25:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VrZR6HVd5lKEvy8wsTPMOLWBvH+h1G2O9QiIzm6g1Tv0zpDH/FWLWwK09s7fD59sfLBuE
X-Received: by 2002:a05:622a:1887:b0:3f5:77:e5be with SMTP id v7-20020a05622a188700b003f50077e5bemr18409501qtc.23.1684164346199;
        Mon, 15 May 2023 08:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684164346; cv=none;
        d=google.com; s=arc-20160816;
        b=tkTb2mSC0ycX+NLhbyj7BNpKdON1rVqefK+/HqR71o2aPPxJlC85hUd6Z0hksOPcLo
         C26+aLizrhcNWyUJIBkopYp5zkKHPvXgoviebOIm3tOuuXKK9UU38dX4PCy+Cf+yJdfD
         gZSSQhjQnVji+kE/eSfScOeDVQOODQ7z8R68uERN0Odqbf0XGVoqkYZm9e5ji/n0Ah6e
         N1CN6k/7YquXvwcjZlUsqkQMmihmMBuAiQVGGpHns9NkqVDOCb7uirE3chDk3qRJyRfF
         JbT2/gbnwkfz7p/3tSlQXlcf4OgGOyKRRAhwFgnkmyJYmKJzWbbPgS02zd5q7/dXS4DL
         I4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=StcC3iugyCuMy6suZA8eRiPDdLMl9BrRBxet+P7NYKE=;
        b=l7Drb+eaco8WAvKofg86dzkOk0ezDbhR7ebJ3WH149WwURzfrFpQ8OWWFxzHF1pBDB
         OVdJ7pOxBCHG214kCL/mGiHrK/rIG/OEZa1AUcxT/ShLefKyfbMocRYJGzdRY2G1dEev
         FZaGW8juTwgTthXn/NiJhxStrqiMs+Y6P/3JCY4luMk5aNcHwaalJHFHXLa6fOtENnJ+
         xc5dNJgatBiARDI0u2xBUcaF/elHaC6EOQ+e6z5mkbm+efzdyHqizorNnSO0+rrSCzVP
         WKUdrXaJ6gzMoNii6+hW081H+pbwUN67WLBLajU+YubAN8uyqTruqlVoun5JCVGkxLOM
         XK2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oTg1MZbU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020ae9f111000000b00759038ed982si42849qkg.307.2023.05.15.08.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oTg1MZbU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZLW-0000Z4-JH; Mon, 15 May 2023 10:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJy-0005Pt-3z
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:08 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJo-00060N-88
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:05 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1aad5245571so88133775ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161414; x=1686753414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=StcC3iugyCuMy6suZA8eRiPDdLMl9BrRBxet+P7NYKE=;
 b=oTg1MZbUdvG9e3Wg310VVv3I4mrqcVpYF5FpAURh3rnS2khQbFYNyl43X2I63fNafH
 9bR6eTiK9O9GqR+mEjTWWzfROiUEZPmLK2YZqV13TJwOkGZR+hja6J01CoSECIVknj46
 YVqlfWoWM0KduXkjZ3D/WXaqTyE6perwSOKxh6ebqX7AThIXnlE1FQlqIXr2qLDN+45g
 jTYysn65XeTrT4dG3PRvgrEeEDvLTs3c57oNPRrBd1l9mgo8dT4cW48o4gA8ZCCfe6+I
 m5efjds/qGFixo3ISI8J1SbgBxVnfloFN7HzI+i2ogS3kxsJgO2ZVDxYMytkxPoWI03K
 gj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161414; x=1686753414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=StcC3iugyCuMy6suZA8eRiPDdLMl9BrRBxet+P7NYKE=;
 b=XF9GXgXRYy2LWTeVeAVNQeGjtsNnaCaKFh4sKRBwOC+33B8/eMfXOVif0uvrzwP37b
 Lwv2uZgHgYy2v1BpR5bEvknv/djYuWiWMSL7jXsi39XHOLH/tJ292uI04ghLKyo/+oQZ
 XXmxZHePzb5vVBOc7pLlUacvlpKbUbIrPC8+GNQsAVXv0DTKlBR4T9xIEnCeRw4KD7TX
 +a+WK5PnJpiTtPLL9qPmF1Bh8XXfKY3JGA8zjxiudQpmvzO+rFLpfiD0wPi2SKZa4C6b
 CjqbdxKRxIw13WW+NTiCcIMkN17flLqTuRzGAyMKoC3z2qwaQ6R6qdGL1gJfKh1Oj1IX
 4nNg==
X-Gm-Message-State: AC+VfDwFK0jkK8u4L5p+goKRyec1+83cwX6C4KrF3bJ06jjecczDp26X
 X6CEo5fkceeeiEHf3TmL1H8UtB/5X9Vf15RC4AQ=
X-Received: by 2002:a17:902:a609:b0:1ac:946e:4690 with SMTP id
 u9-20020a170902a60900b001ac946e4690mr22778533plq.49.1684161413995; 
 Mon, 15 May 2023 07:36:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 46/54] tcg/riscv: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:05 -0700
Message-Id: <20230515143313.734053-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: m6IpGvATFMYL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 37870c89fc..1fc1a9199b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -910,8 +910,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    TCGAtomAlign aa;
+    unsigned a_mask;
+
+    aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1u << aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -944,7 +947,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
      * cross pages using the address of the last byte of the access.
      */
     addr_adj = addr_reg;
-    if (a_bits < s_bits) {
+    if (a_mask < s_mask) {
         addr_adj = TCG_REG_TMP0;
         tcg_out_opc_imm(s, TARGET_LONG_BITS == 32 ? OPC_ADDIW : OPC_ADDI,
                         addr_adj, addr_reg, s_mask - a_mask);
@@ -983,8 +986,8 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
         ldst->oi = oi;
         ldst->addrlo_reg = addr_reg;
 
-        /* We are expecting a_bits max 7, so we can always use andi. */
-        tcg_debug_assert(a_bits < 12);
+        /* We are expecting alignment max 7, so we can always use andi. */
+        tcg_debug_assert(a_mask == sextreg(a_mask, 0, 12));
         tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, a_mask);
 
         ldst->label_ptr[0] = s->code_ptr;
-- 
2.34.1

