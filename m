Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842623ejq;
        Fri, 12 May 2023 07:43:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fLIk8Aei0/mnWv58twUbvkJ7a8HYJwUvbXZNMV4D+JC0CLF7Yr7ymU14hKbEihL+BIRmw
X-Received: by 2002:ac8:58d2:0:b0:3f4:e615:dea5 with SMTP id u18-20020ac858d2000000b003f4e615dea5mr9605222qta.58.1683902590497;
        Fri, 12 May 2023 07:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902590; cv=none;
        d=google.com; s=arc-20160816;
        b=XJocAVetrIkwdXAtoRm4/PQrPCwpLYbVkyq8AdlsK+ioffIiIVgHnGsbKpjgLosvz5
         3goC4wU1gUpkHYCk7zD7U8CjNtJNgDq+Tq5i+wWW4oMIWt+lYGaXWAH8En3BJvmxIgos
         ktjeyZAcJmIqjzaVe+ICKdsoqwGR7eRGLprt8oHTnRMJQBP9VS7g3ZjKE2EWWUWhcFxv
         IZ3pB23tX6I7PapWLqRo2L6cYOeht72ftMod5q/XzQhqjVunS2IH4Cu8S9CV9Effcifh
         GJGc1lqC1PDrNqwztzxGWsSqfCwm/ZAwH5UCxeRF06KfTZAlxkUvSAncAPQQEnWt909d
         yLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Nzdtd8sSIBwgurLXo/J3BqpDdo3UGdPx+81efDnWFSc=;
        b=zw3qJBpp04vyrqOgyzuWJCyAznBpR5EsGw47K7lmKd4J5xKbkr39N9Xx5MiXyn9NdE
         G2RhMye8NrBz0AdL1SmYlGNdTkz8lLaTghmSPAWbQ23ZNyncOFcc3z9siRn+U48M064B
         0ECpmRp+JGDtgEoCk27YRR2IdPonV3JtoqFj3T2rJxwCX6qwta5wWMEGOMAzOo1N4lIK
         8GknTCWLYVQV/q4o97T9XYe6hVnJ5YcvDZ6hwEkh0srvkzsgCwESAT/GulabczxsdTJE
         ZOwx0cinsR8O/8uMgUILAX4vPOqhRLKnJpkEoRkLrzRelmoCJ9n+22cMXQYd+Xtew/xF
         Fusw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYq+L2cq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24-20020a05620a075800b0074df8649b34si6100412qki.407.2023.05.12.07.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYq+L2cq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxa-00074m-Ba; Fri, 12 May 2023 10:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxY-00071f-Su
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:28 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxK-0004j3-Ip
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:28 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so45804805e9.3
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902473; x=1686494473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nzdtd8sSIBwgurLXo/J3BqpDdo3UGdPx+81efDnWFSc=;
 b=nYq+L2cqItWFFHTDHAFPB6RmQyZyQWl7BQo8w/cldvMZ3F/Tc/DUAabHWbwiBwSFLM
 8k4adEW3y3ckjvILkQ+Uu8lsTqXNPMN/cExxmljZVqYlqqI+QbICf8tviZ4T1Y1FzqYt
 qcES4CXyp+XAi8t/yRbZ/DQlQ3vqXKxDpdmgy6ZVRg2QB+31q3diFG6UkLyfwu4ICQSq
 sYomkmWjahQejtbuLugL/19Qjs6APkDhgTJYyjOE42qBgMaPs0a9qH6GC6T+24o7PU4p
 kesXbGLpBOXTRocIICXjCgzzKCaF8GMXuAO+MnkvDRDRbsILlEjhV2ATBAIMcC2kg3w5
 yR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902473; x=1686494473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nzdtd8sSIBwgurLXo/J3BqpDdo3UGdPx+81efDnWFSc=;
 b=EXlGthB9o/R6y6xTVarqQZMOOVoPzOl60zX50b65KjpEi18t7bX/z/t8uyiGV7Afro
 Rmk+Z8bF/PoB2IBwvUBmoc3X/ZVwQjwjHyaK0HsISqTA9ncX2EYZwri/fRGS7hiTKNOx
 mZeD7ix+d+hbXKcyCW7HB/z9u1wCeViRtVM9X7Io7RlPGEBwK++q3PFvlvGGsGdndWCX
 fNWS7z4Pnw7wuNA62jKsmbvQ0NuBJnnVFp3dE3yO+Cb72J6JPjNy+Pc7hO1xe+3DtOzm
 o3DCUAKzHKnqaV3HHHq+luL4HqpPtDoBmFPvTS1M5y9PTNphCzY9M00ajQmbGvSeZ6IY
 JJQA==
X-Gm-Message-State: AC+VfDzNfUc8ZIry1dHzacjYztcOsF06uQ31U1V5xF2nY/7M2sgK7EMT
 olpN3dzM8Ick88EVi5P4roRs11RThCvcMRhsKes=
X-Received: by 2002:a7b:ca42:0:b0:3f1:6fb3:ffcc with SMTP id
 m2-20020a7bca42000000b003f16fb3ffccmr16752655wml.22.1683902473125; 
 Fri, 12 May 2023 07:41:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 10/20] target/arm: Convert Move wide (immediate) to decodetree
Date: Fri, 12 May 2023 15:40:56 +0100
Message-Id: <20230512144106.3608981-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: zmPAfdZeHEyU

From: Richard Henderson <richard.henderson@linaro.org>

Convert the MON, MOVZ, MOVK instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: Rebased]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      | 13 ++++++
 target/arm/tcg/translate-a64.c | 73 ++++++++++++++--------------------
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1933afa457b..350b37c8f37 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -71,3 +71,16 @@ EOR_i           . 10 100100 . ...... ...... ..... ..... @logic_imm_64
 EOR_i           . 10 100100 . ...... ...... ..... ..... @logic_imm_32
 ANDS_i          . 11 100100 . ...... ...... ..... ..... @logic_imm_64
 ANDS_i          . 11 100100 . ...... ...... ..... ..... @logic_imm_32
+
+# Move wide (immediate)
+
+&movw           rd sf imm hw
+@movw_64        1 .. ...... hw:2   imm:16 rd:5          &movw sf=1
+@movw_32        0 .. ...... 0 hw:1 imm:16 rd:5          &movw sf=0
+
+MOVN            . 00 100101 .. ................ .....   @movw_64
+MOVN            . 00 100101 .. ................ .....   @movw_32
+MOVZ            . 10 100101 .. ................ .....   @movw_64
+MOVZ            . 10 100101 .. ................ .....   @movw_32
+MOVK            . 11 100101 .. ................ .....   @movw_64
+MOVK            . 11 100101 .. ................ .....   @movw_32
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1273c4de456..a36b98925fb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4395,52 +4395,40 @@ TRANS(ANDS_i, gen_rri_log, a, true, tcg_gen_andi_i64)
 
 /*
  * Move wide (immediate)
- *
- *  31 30 29 28         23 22 21 20             5 4    0
- * +--+-----+-------------+-----+----------------+------+
- * |sf| opc | 1 0 0 1 0 1 |  hw |  imm16         |  Rd  |
- * +--+-----+-------------+-----+----------------+------+
- *
- * sf: 0 -> 32 bit, 1 -> 64 bit
- * opc: 00 -> N, 10 -> Z, 11 -> K
- * hw: shift/16 (0,16, and sf only 32, 48)
  */
-static void disas_movw_imm(DisasContext *s, uint32_t insn)
+
+static bool trans_MOVZ(DisasContext *s, arg_movw *a)
 {
-    int rd = extract32(insn, 0, 5);
-    uint64_t imm = extract32(insn, 5, 16);
-    int sf = extract32(insn, 31, 1);
-    int opc = extract32(insn, 29, 2);
-    int pos = extract32(insn, 21, 2) << 4;
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
+    int pos = a->hw << 4;
+    tcg_gen_movi_i64(cpu_reg(s, a->rd), (uint64_t)a->imm << pos);
+    return true;
+}
 
-    if (!sf && (pos >= 32)) {
-        unallocated_encoding(s);
-        return;
-    }
+static bool trans_MOVN(DisasContext *s, arg_movw *a)
+{
+    int pos = a->hw << 4;
+    uint64_t imm = a->imm;
 
-    switch (opc) {
-    case 0: /* MOVN */
-    case 2: /* MOVZ */
-        imm <<= pos;
-        if (opc == 0) {
-            imm = ~imm;
-        }
-        if (!sf) {
-            imm &= 0xffffffffu;
-        }
-        tcg_gen_movi_i64(tcg_rd, imm);
-        break;
-    case 3: /* MOVK */
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_constant_i64(imm), pos, 16);
-        if (!sf) {
-            tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
-        }
-        break;
-    default:
-        unallocated_encoding(s);
-        break;
+    imm = ~(imm << pos);
+    if (!a->sf) {
+        imm = (uint32_t)imm;
     }
+    tcg_gen_movi_i64(cpu_reg(s, a->rd), imm);
+    return true;
+}
+
+static bool trans_MOVK(DisasContext *s, arg_movw *a)
+{
+    int pos = a->hw << 4;
+    TCGv_i64 tcg_rd, tcg_im;
+
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_im = tcg_constant_i64(a->imm);
+    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_im, pos, 16);
+    if (!a->sf) {
+        tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
+    }
+    return true;
 }
 
 /* Bitfield
@@ -4585,9 +4573,6 @@ static void disas_extract(DisasContext *s, uint32_t insn)
 static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 23, 6)) {
-    case 0x25: /* Move wide (immediate) */
-        disas_movw_imm(s, insn);
-        break;
     case 0x26: /* Bitfield */
         disas_bitfield(s, insn);
         break;
-- 
2.34.1

