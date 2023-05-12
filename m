Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842062ejq;
        Fri, 12 May 2023 07:42:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6cscI0GvIhhVsOQwdFOeifZs3tTJ9k0V1PJaBQkRTH6cSMZrHD21xW9wd/g2cG6HUMlug9
X-Received: by 2002:a05:6214:226a:b0:616:54c7:318b with SMTP id gs10-20020a056214226a00b0061654c7318bmr43023105qvb.19.1683902533173;
        Fri, 12 May 2023 07:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902533; cv=none;
        d=google.com; s=arc-20160816;
        b=Vvr+PCCfp9l9erwM8haRqWQs1Hco9rzuhl16mNvpJm5E/FZojsnEQ1MrbLvSU1AISg
         C8OTKaP1g2U3jaJu1+EaiqrwWRNsitBokcCIAD+TYOsT74agxBws+YLpHITsnxPMHp9B
         NHrFmYAm8BrHoLgF2po31Vl+pA7M624Vbin4RY2fdBcgaFnvMPcxdxTNXr2EVDV5ljzr
         oRRKkaAVVPMZVnW0QjbHwswXK3J+G7MM9syU8XivA/3Nqye5UOqz4nUr8F6CurUtoxE0
         6gRVpZEKgSejv3eZNPTPXShZEMgtl7JnYsEnN4m+5O8n55NyTDShLFihLPWyRaT4+Ad+
         dYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F0QOGVZAMk1HDBJjf1QtYWjsE8LxD2Kt5Aw9i/wccVs=;
        b=pZYtzjuZZwh8V87pW8CjssSr1tfhE/wmRxoWets9FqRVgGnq4Tv7O7bHBqRmzYC65E
         8cF0cidncG6A0larfHwEotNgXcCPJsy+jvw3SlGhVVdnw1UKFLWZix4FqNlfA/BCmNmG
         9E245OTYrKt86NO+yQTzWzRts0VeEd45nCu00k3WVJXNCTk9AYQ7blr82jK7xYovmhs+
         MDQmGEm92AxqC0nnINvuFNWLc7meMlctSBuljaionVKpm33o3BdDe+2qBSsIjzG3Abeh
         znWPbsXuZlCgNyg+XV792p0kP65C4mrDiVpB6cyfR6OJoBPNGHEhquxRG43/OVhgOoeo
         O8YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7Qb+rhi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn3-20020ad45de3000000b0056d3019643asi5484228qvb.446.2023.05.12.07.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7Qb+rhi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxh-0007FG-93; Fri, 12 May 2023 10:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxc-00077p-QI
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:32 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxM-0004gs-Mi
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f4ad71b00eso21722645e9.2
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902476; x=1686494476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0QOGVZAMk1HDBJjf1QtYWjsE8LxD2Kt5Aw9i/wccVs=;
 b=e7Qb+rhigALwzcgzgZYFBQIjyO/pBcHh5qdGWR1C58pO5LTJv31OQTIV15N4rzZHwL
 VWDMD726soFoVF0IQKKMGZH6rJ99hZgiYqeifE6mV5K6mxo/PS4ArtlGGJ1M2rTGAFtp
 74ngztRX5Ao13zy7nqdUdBb5bmVuH3PWTFEvrioA4RJbYK7nrgVCSewdy6MfwMDA0S43
 ie3K0rkMmXNwduyeEHD7aQ4Ha1nNxgx5TeWL+DSVEqi4Q0aUz98sCSwdJtOGp0S1gHRP
 Drsm5UGQiY40aGBPfb5dzoXjGi7xFSz1cT5ad3sc0NyISh7L7JzK1iMzww//V+oSyoky
 lRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902476; x=1686494476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0QOGVZAMk1HDBJjf1QtYWjsE8LxD2Kt5Aw9i/wccVs=;
 b=OH7ih1TDsJyKJSOj5S/mWHIGWBV00/ozcoDyZRwpZWYI4odbv+pu1BBLJS/jFk3mnr
 VuzzGPG5oTggXPWiGNdwt4gAkhwThykrKJMnZtkKhJeWKGGJfcqMkWZnAmw4gQ7BEfp2
 3L+A1zP9Hi39h/0Tg1tD74bYK8mN/GMvtU5nsa6sYloVNZdUr06FEVEjKzd+WKgW3+jY
 IhSNE9ukRh2S+LbpO+O6qc5M/XVWUIcnDt96BK0OnhrMc3bPAQpv+OKwOMkJHrLglMNE
 d2pYyrQdWSWZwM6VzjaxIJi/RHFxmq6LICJWTmR+Q0AA3RTtNP9/r67He437ibLmvGKG
 3Qig==
X-Gm-Message-State: AC+VfDygzUknoKJFCkOTMJ7QBAGi8zkMFsHHSSnYlU8/u7mJldp+InXW
 PSysT+DVtgC/r0X+m2pO0nz1K3V5kbfRlANQKLY=
X-Received: by 2002:a1c:7917:0:b0:3f4:2bb3:a5ba with SMTP id
 l23-20020a1c7917000000b003f42bb3a5bamr8931976wme.3.1683902476010; 
 Fri, 12 May 2023 07:41:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 16/20] target/arm: Convert conditional branch insns to
 decodetree
Date: Fri, 12 May 2023 15:41:02 +0100
Message-Id: <20230512144106.3608981-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: Uh63ihu2YT+1

Convert the immediate conditional branch insn B.cond to
decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 30 ++++++------------------------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 68dc820ece0..8514235a723 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -128,3 +128,5 @@ CBZ             . 011010 . ................... ..... @cbz
 @tbz            . ...... nz:1 ..... .............. rt:5 &tbz  imm=%imm14 bitpos=%imm31_19
 
 TBZ             . 011011 . ..... .............. ..... @tbz
+
+B_cond          0101010 0 ................... 0 cond:4 imm=%imm19
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bd59d0616e3..724dca8c579 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1371,36 +1371,21 @@ static bool trans_TBZ(DisasContext *s, arg_tbz *a)
     return true;
 }
 
-/* Conditional branch (immediate)
- *  31           25  24  23                  5   4  3    0
- * +---------------+----+---------------------+----+------+
- * | 0 1 0 1 0 1 0 | o1 |         imm19       | o0 | cond |
- * +---------------+----+---------------------+----+------+
- */
-static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
+static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
 {
-    unsigned int cond;
-    int64_t diff;
-
-    if ((insn & (1 << 4)) || (insn & (1 << 24))) {
-        unallocated_encoding(s);
-        return;
-    }
-    diff = sextract32(insn, 5, 19) * 4;
-    cond = extract32(insn, 0, 4);
-
     reset_btype(s);
-    if (cond < 0x0e) {
+    if (a->cond < 0x0e) {
         /* genuinely conditional branches */
         DisasLabel match = gen_disas_label(s);
-        arm_gen_test_cc(cond, match.label);
+        arm_gen_test_cc(a->cond, match.label);
         gen_goto_tb(s, 0, 4);
         set_disas_label(s, match);
-        gen_goto_tb(s, 1, diff);
+        gen_goto_tb(s, 1, a->imm);
     } else {
         /* 0xe and 0xf are both "always" conditions */
-        gen_goto_tb(s, 0, diff);
+        gen_goto_tb(s, 0, a->imm);
     }
+    return true;
 }
 
 /* HINT instruction group, including various allocated HINTs */
@@ -2385,9 +2370,6 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
 static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 7)) {
-    case 0x2a: /* Conditional branch (immediate) */
-        disas_cond_b_imm(s, insn);
-        break;
     case 0x6a: /* Exception generation / System */
         if (insn & (1 << 24)) {
             if (extract32(insn, 22, 2) == 0) {
-- 
2.34.1

