Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4841942ejq;
        Fri, 12 May 2023 07:42:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5R2kmQa/ZLWZibF8n5PecXYr3ycvUtXH3A7gaCQji+rqhU40FS5+2FO5eInnzg2t6P+bYp
X-Received: by 2002:a05:6214:62d:b0:5ef:6839:9775 with SMTP id a13-20020a056214062d00b005ef68399775mr32141698qvx.49.1683902519783;
        Fri, 12 May 2023 07:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902519; cv=none;
        d=google.com; s=arc-20160816;
        b=SDP34Ex6j9aGirkPcNVqd6sDqjD9ZjBe5EN3dz/ocC+twvvpQFDTMhBKbYk25R5Edv
         AX9GOcoi56wgPzu1qygAcm0fjMF9SVVngxlQZYvJIgbt8vEd2ZEEeqhbEQDWsckZhXu6
         abFxaubMjeK8RpbSOoStfuL2CC7Gf9mjkBXPk0+sFbCVo0eGWi1keoiQdmSWIo+of7Ad
         LIUdrkHW0EnWU+ALCO6bs/Udl71eRti51cAMNQ/U/yIKBFj7462GbmBMy0otbBc+ETWp
         AEIwckxek1b5pXtareDZpYkkRW2qbMv8YF7zdgnBGeqNEg7lA73KZLV7ns+C5jcjF+zD
         gpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8VmUpPNfulKIqx7VImc6HCqVD/o1vD/KA6yv49cC5Pk=;
        b=ehXTktOMwaRYoyIXqYv7h5n5c1ffLNpS/IGax6v4K4ekAbNNlk/CniMl4MzxAys7MY
         MqqqFyOGqtlo8iLUu21ox2o4Pm22oiqdG08/8scKQRMGGKvdPbYIblUGARnS/isIjYJU
         ffa+rnfIBE8YmXso/dLVQpqxu0KPth04JzBYW3XtNF7gwRRw/7ZGJiR1ZTiM3B0ZcNaq
         Xl2kEc7xELhlb6bSIkFJ/sb4f6BQp4+upd5iloh58rdiIfvqMMsRcmF6DhOXX7tFT8tD
         buRXCYXBSTuUsOIyZPSdwxFhtfqkLHOEbVh/FVapWkVRG6nr+LiiqbLPBn8rUq9mT4qI
         SrDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkN4qbdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020a0562140c2f00b005ef596f3129si5616050qvd.227.2023.05.12.07.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:41:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkN4qbdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxY-00072Q-UJ; Fri, 12 May 2023 10:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxX-0006zg-QJ
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxK-0004ij-5o
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:27 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f41d087bd3so49220225e9.3
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902472; x=1686494472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VmUpPNfulKIqx7VImc6HCqVD/o1vD/KA6yv49cC5Pk=;
 b=WkN4qbdM4TZboZpOGxUiETjS0PMDx1HDufS6f1CtR1/CbGT/soJ+SoccohO+jgh/Ou
 5A65QMaee5+XmT0HfGem39r/DLRS4jXO4L3uxeWNHAJlgI3XAZv9TdnQ4t3PT6fJ5bj+
 fos/VQJ9WbZcp69m1Sur4NDzbfW6uIIILcbG9e6jF18Dz5jA7Xd0suLPS6f947gIvtnC
 t4l206ru/yDzb/hgX0VXwiE2BriiZHKNctEIE+0LJ6Sk//QkHCHIyqSl6KV4cphdotzH
 sKdWB7gpR15LFi/eHY0EU25HF7pk0xBlJAHvQ5s9NKxJPcMFBjX9fd2TFGWHAMUOIanG
 JOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902472; x=1686494472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8VmUpPNfulKIqx7VImc6HCqVD/o1vD/KA6yv49cC5Pk=;
 b=T3Xx+UkmeG7hSbfWNdAQ73Mc+1rYLpY3ezN9sspd3Mn2aLvMFw+BBi0WonmreBAkQK
 FLA4W8pgBhLskvzLBD5QLjxjtDIVN2UCRSjeEGemNbgIlmntU60d8IfWetD8AnGjdaCS
 Saie03h1vUfAQYNFOy4m4t0BETg0XIIuaVecFs7ZSXChKNkTtY0pcu6xLbbeVklM7Clr
 Nq5AmiuRjhIo2PtaFjFfOf6EYbHMkoFFZLO4vn64c1B7lsaS7YcwS9D9vcSPTlsjVtBI
 2NGA4kLE/AmhyiPsgUnPtXWAAFM/bwFEbskOTe+yIho24Y4hC3EyDVaiuXOHHRgixF46
 6tig==
X-Gm-Message-State: AC+VfDxowQDxjoRhU+9r2uMcoL0ZmzkBVIde8O7EbKx7yDRu3XrsNL70
 +/qFNqiSmLvWhP1fiNZB8IKpVfNraeWPXgdfAHs=
X-Received: by 2002:a05:600c:22ca:b0:3f4:2158:289b with SMTP id
 10-20020a05600c22ca00b003f42158289bmr15127227wmg.18.1683902472594; 
 Fri, 12 May 2023 07:41:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 09/20] target/arm: Convert Logical (immediate) to decodetree
Date: Fri, 12 May 2023 15:40:55 +0100
Message-Id: <20230512144106.3608981-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: Hn9asOprkeUr

From: Richard Henderson <richard.henderson@linaro.org>

Convert the ADD, ORR, EOR, ANDS (immediate) instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: rebased]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      | 15 ++++++
 target/arm/tcg/translate-a64.c | 94 +++++++++++-----------------------
 2 files changed, 44 insertions(+), 65 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index ed03d9e1349..1933afa457b 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -56,3 +56,18 @@ SUBS_i          . 11 100010 1 ............ ..... .....  @addsub_imm12
 
 ADDG_i          1 00 100011 0 ...... 00 .... ..... ..... @addsub_imm_tag
 SUBG_i          1 10 100011 0 ...... 00 .... ..... ..... @addsub_imm_tag
+
+# Logical (immediate)
+
+&rri_log        rd rn sf dbm
+@logic_imm_64   1 .. ...... dbm:13 rn:5 rd:5            &rri_log sf=1
+@logic_imm_32   0 .. ...... 0 dbm:12 rn:5 rd:5          &rri_log sf=0
+
+AND_i           . 00 100100 . ...... ...... ..... ..... @logic_imm_64
+AND_i           . 00 100100 . ...... ...... ..... ..... @logic_imm_32
+ORR_i           . 01 100100 . ...... ...... ..... ..... @logic_imm_64
+ORR_i           . 01 100100 . ...... ...... ..... ..... @logic_imm_32
+EOR_i           . 10 100100 . ...... ...... ..... ..... @logic_imm_64
+EOR_i           . 10 100100 . ...... ...... ..... ..... @logic_imm_32
+ANDS_i          . 11 100100 . ...... ...... ..... ..... @logic_imm_64
+ANDS_i          . 11 100100 . ...... ...... ..... ..... @logic_imm_32
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ca944344a6b..1273c4de456 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4288,7 +4288,12 @@ static uint64_t bitfield_replicate(uint64_t mask, unsigned int e)
     return mask;
 }
 
-/* Simplified variant of pseudocode DecodeBitMasks() for the case where we
+/*
+ * Logical (immediate)
+ */
+
+/*
+ * Simplified variant of pseudocode DecodeBitMasks() for the case where we
  * only require the wmask. Returns false if the imms/immr/immn are a reserved
  * value (ie should cause a guest UNDEF exception), and true if they are
  * valid, in which case the decoded bit pattern is written to result.
@@ -4354,78 +4359,40 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
     return true;
 }
 
-/* Logical (immediate)
- *   31  30 29 28         23 22  21  16 15  10 9    5 4    0
- * +----+-----+-------------+---+------+------+------+------+
- * | sf | opc | 1 0 0 1 0 0 | N | immr | imms |  Rn  |  Rd  |
- * +----+-----+-------------+---+------+------+------+------+
- */
-static void disas_logic_imm(DisasContext *s, uint32_t insn)
+static bool gen_rri_log(DisasContext *s, arg_rri_log *a, bool set_cc,
+                        void (*fn)(TCGv_i64, TCGv_i64, int64_t))
 {
-    unsigned int sf, opc, is_n, immr, imms, rn, rd;
     TCGv_i64 tcg_rd, tcg_rn;
-    uint64_t wmask;
-    bool is_and = false;
+    uint64_t imm;
 
-    sf = extract32(insn, 31, 1);
-    opc = extract32(insn, 29, 2);
-    is_n = extract32(insn, 22, 1);
-    immr = extract32(insn, 16, 6);
-    imms = extract32(insn, 10, 6);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-
-    if (!sf && is_n) {
-        unallocated_encoding(s);
-        return;
+    /* Some immediate field values are reserved. */
+    if (!logic_imm_decode_wmask(&imm, extract32(a->dbm, 12, 1),
+                                extract32(a->dbm, 0, 6),
+                                extract32(a->dbm, 6, 6))) {
+        return false;
+    }
+    if (!a->sf) {
+        imm &= 0xffffffffull;
     }
 
-    if (opc == 0x3) { /* ANDS */
-        tcg_rd = cpu_reg(s, rd);
-    } else {
-        tcg_rd = cpu_reg_sp(s, rd);
-    }
-    tcg_rn = cpu_reg(s, rn);
+    tcg_rd = set_cc ? cpu_reg(s, a->rd) : cpu_reg_sp(s, a->rd);
+    tcg_rn = cpu_reg(s, a->rn);
 
-    if (!logic_imm_decode_wmask(&wmask, is_n, imms, immr)) {
-        /* some immediate field values are reserved */
-        unallocated_encoding(s);
-        return;
+    fn(tcg_rd, tcg_rn, imm);
+    if (set_cc) {
+        gen_logic_CC(a->sf, tcg_rd);
     }
-
-    if (!sf) {
-        wmask &= 0xffffffff;
-    }
-
-    switch (opc) {
-    case 0x3: /* ANDS */
-    case 0x0: /* AND */
-        tcg_gen_andi_i64(tcg_rd, tcg_rn, wmask);
-        is_and = true;
-        break;
-    case 0x1: /* ORR */
-        tcg_gen_ori_i64(tcg_rd, tcg_rn, wmask);
-        break;
-    case 0x2: /* EOR */
-        tcg_gen_xori_i64(tcg_rd, tcg_rn, wmask);
-        break;
-    default:
-        assert(FALSE); /* must handle all above */
-        break;
-    }
-
-    if (!sf && !is_and) {
-        /* zero extend final result; we know we can skip this for AND
-         * since the immediate had the high 32 bits clear.
-         */
+    if (!a->sf) {
         tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
     }
-
-    if (opc == 3) { /* ANDS */
-        gen_logic_CC(sf, tcg_rd);
-    }
+    return true;
 }
 
+TRANS(AND_i, gen_rri_log, a, false, tcg_gen_andi_i64)
+TRANS(ORR_i, gen_rri_log, a, false, tcg_gen_ori_i64)
+TRANS(EOR_i, gen_rri_log, a, false, tcg_gen_xori_i64)
+TRANS(ANDS_i, gen_rri_log, a, true, tcg_gen_andi_i64)
+
 /*
  * Move wide (immediate)
  *
@@ -4618,9 +4585,6 @@ static void disas_extract(DisasContext *s, uint32_t insn)
 static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 23, 6)) {
-    case 0x24: /* Logical (immediate) */
-        disas_logic_imm(s, insn);
-        break;
     case 0x25: /* Move wide (immediate) */
         disas_movw_imm(s, insn);
         break;
-- 
2.34.1

