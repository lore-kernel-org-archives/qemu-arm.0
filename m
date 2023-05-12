Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842799ejq;
        Fri, 12 May 2023 07:43:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6fwffxBpkBKExbzPVSG2nBsqRK0xhKpOlH0v7p0KK/duy3snYsqHVqwX2QL4I/0KDXNNWo
X-Received: by 2002:a05:622a:1c5:b0:3ea:9720:7194 with SMTP id t5-20020a05622a01c500b003ea97207194mr36136789qtw.56.1683902607023;
        Fri, 12 May 2023 07:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902607; cv=none;
        d=google.com; s=arc-20160816;
        b=BsZJQf4SPuqFvH3jo4Rvl/QIPI9iY83ZFbpxN4IXO/ks20lQHjUnHn1tprvsGq12Q9
         TsVmOLEWO2t/ZXOj1nfeNfgl+GkKgvZuMQ1RhaHusc0VtFXHZYG9dEoktvznCo5ZmfVN
         jt3+uskKCmb4anrsu2rfK+k0+/7LSB1hbf7S6CCW5Ill7ymJxV6P5d6cf04MP8/iXy6j
         ZhEZ8ab7pgwz6+00BT8Ii5VnBIqeZCRtkC6bDKcKjN4ZcEceJh7gs2j2Dg95kQW+A0ig
         IKgKx/BuUoOqDqWirdSWpze61zJ/7lPdAnxZEN/Bclbv/quuC2R9RRIJ/CaIXmsCA1qE
         QhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b35BwkiFX8fqUrD1Px2IqZe/3AgM9JZzroufYhPa+ao=;
        b=qjlYLuk0+TO1LZmRGHDMqrWZoMLgZtpbatPzEuXPT3VxCInzty/6KobE0xrHE4VpDj
         E83gDli1LtSBr4m9vtWi6qXuaLwuq0yP64iml7LWJ2V6blqs/2JCbzoMLP+gOsf8tZyW
         H8jpqTSKUqeKmuoLTlX5P7B/8GCyg6JnUCmW76hef5R3yUTipCCCEcA6bIN2n12oX++j
         DZLvdW3Aa8e9W//ictMXet5GbzMvDOl4xu6ZOYyX/WzYpMYuYdJ/0KEpGfXpbsoKrYWU
         k2cZwrKFfphKD++75lUCdkzVqXjh2lsfEB28bQTIKKm0RCL5vx9Ik/+oIrKfsC5flrtM
         TYvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T+6MivRR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020a05620a14b800b00759057aa321si3497660qkj.530.2023.05.12.07.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:43:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T+6MivRR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxf-0007BR-4L; Fri, 12 May 2023 10:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxc-00077g-O9
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxM-0004jy-BS
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so58308505e9.2
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902475; x=1686494475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b35BwkiFX8fqUrD1Px2IqZe/3AgM9JZzroufYhPa+ao=;
 b=T+6MivRRfHt3BSCGB3BusxGwRHqVnDHhfj9xEfoH3GHrSzmrOmRUDMgHQ4Ycmrryjo
 IrYa9RPZq9Tc+rvZYUn1fZwlzXotwO6j6ZbvDWO3STd3QCeDU/eubyxbmhOzhwDyRxVz
 Gm1sWD1azfTbu5dF1hKxdM2lV4jT9Ts84bQ20NKJN/pC1iv+r1vW8uxppLYuFS6+tHbU
 bU4P8TU8lhb2KOPSoax5pjsKn0p2c2KdBR/C9RPtR4BgD3jC1KxHNP5/B37z63JUVE4T
 rutEdjja6pd5i+9m/aRncZwFxFpO+6GIxhGawHWl8+NwVia9cM6Qx+uTJBEblcaTY61n
 CjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902475; x=1686494475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b35BwkiFX8fqUrD1Px2IqZe/3AgM9JZzroufYhPa+ao=;
 b=T9O8pvzj71QPj09iCZMgvgYTUEEIH0dZraT4SRYIfLrTXBvTssOck19BEtI7nEBI0J
 bPGsZDOkkc9C/fGiWf82H8WRmhPCPBshyJW5Lg0Xp5KaMFKdOSJ4833qe1aDl124axMf
 kQ098E3FIcH08hku1v1fr1YeESomEGXSY96cM7YKlThLHt2J8mbS31M6u1Z7JbNU//OF
 /ReLVf1VdLYhSCbrtvsF8vff/a3ezumjflKJvqpT2OFOt5AfAMjDMQGLJREIc1kQjP5m
 0Cu6bVdLPU8pkZJZyfZif93Xe3nch/LoewUrF8QqdZW8qYyrGgom1fSok8hqtzM8iWcM
 aBcg==
X-Gm-Message-State: AC+VfDzcFDlKWWfqeS5lKmKTDpof22dfuh6FS7vtJ874aTfh0r/Dcx2W
 d80sLmZQn291ddqNatgQINSWatXWa+Rx3/bcEpA=
X-Received: by 2002:a1c:e90c:0:b0:3f1:952a:4bf0 with SMTP id
 q12-20020a1ce90c000000b003f1952a4bf0mr17441034wmc.33.1683902474982; 
 Fri, 12 May 2023 07:41:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 14/20] target/arm: Convert CBZ, CBNZ to decodetree
Date: Fri, 12 May 2023 15:41:00 +0100
Message-Id: <20230512144106.3608981-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: yDtlvNec2/bI

Convert the compare-and-branch-immediate insns CBZ and CBNZ
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  6 ++++++
 target/arm/tcg/translate-a64.c | 26 ++++++--------------------
 2 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d54c6522028..86220569e13 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -115,3 +115,9 @@ EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_32
 
 B               0 00101 .......................... @branch
 BL              1 00101 .......................... @branch
+
+%imm19   5:s19 !function=times_4
+&cbz     rt imm sf nz
+@cbz            sf:1 ...... nz:1 ................... rt:5 &cbz imm=%imm19
+
+CBZ             . 011010 . ................... ..... @cbz
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index fe6b4a68288..5da551385bd 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1334,33 +1334,22 @@ static bool trans_BL(DisasContext *s, arg_i *a)
     return true;
 }
 
-/* Compare and branch (immediate)
- *   31  30         25  24  23                  5 4      0
- * +----+-------------+----+---------------------+--------+
- * | sf | 0 1 1 0 1 0 | op |         imm19       |   Rt   |
- * +----+-------------+----+---------------------+--------+
- */
-static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
+
+static bool trans_CBZ(DisasContext *s, arg_cbz *a)
 {
-    unsigned int sf, op, rt;
-    int64_t diff;
     DisasLabel match;
     TCGv_i64 tcg_cmp;
 
-    sf = extract32(insn, 31, 1);
-    op = extract32(insn, 24, 1); /* 0: CBZ; 1: CBNZ */
-    rt = extract32(insn, 0, 5);
-    diff = sextract32(insn, 5, 19) * 4;
-
-    tcg_cmp = read_cpu_reg(s, rt, sf);
+    tcg_cmp = read_cpu_reg(s, a->rt, a->sf);
     reset_btype(s);
 
     match = gen_disas_label(s);
-    tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
+    tcg_gen_brcondi_i64(a->nz ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, match.label);
     gen_goto_tb(s, 0, 4);
     set_disas_label(s, match);
-    gen_goto_tb(s, 1, diff);
+    gen_goto_tb(s, 1, a->imm);
+    return true;
 }
 
 /* Test and branch (immediate)
@@ -2408,9 +2397,6 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
 static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 7)) {
-    case 0x1a: case 0x5a: /* Compare & branch (immediate) */
-        disas_comp_b_imm(s, insn);
-        break;
     case 0x1b: case 0x5b: /* Test & branch (immediate) */
         disas_test_b_imm(s, insn);
         break;
-- 
2.34.1

