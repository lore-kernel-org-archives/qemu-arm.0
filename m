Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5955358lfy;
        Mon, 3 Aug 2020 04:21:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw4YCGl13KPZKEB2hPI6rIZgQur1AR//gF3ljwbfER5xoesi9bThrmPd3+2YczMDkmDmvn
X-Received: by 2002:a25:ad8b:: with SMTP id z11mr23142249ybi.522.1596453713355;
        Mon, 03 Aug 2020 04:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596453713; cv=none;
        d=google.com; s=arc-20160816;
        b=dAnKGozNAk0aSVdsA44pKzgUCZjp2JGVEXGlpvn7+YwC7+0h196zayAWmKyKGY+0zW
         tpk09ZTtYRCBn6y8WWDAy/+jszPfIRW6dgmywTP4mOchYLigfb2Odwe+MRnZ9QV1xFc6
         Xjqd+PEI2AgP+8Uu7IDeKt4hiX2lpXZR0w24Y5sLXjHABxisVv5O1QM/WpajRBA08xnF
         /Uuwo+iuywhnklKS+8L5C9xoZ4hU97+jjygTiSVt5+WuGlP0LrlIS1eCL/F2KD5bpWgT
         LKGYgUM0yASc6yXkiP7aNAd9JZUolvcqpbe6Smn0m1sG0bZOM3+PrqkXPBhxFT/wMKti
         Iiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uE/zSzU3YCUj+8keAlvLyFX2oijQycTIyZcK1gVRSqY=;
        b=aDz3e0ylLSj2o2Qc8c1/3NYhPXyFrSlQdUK+RjoewKKPM52Zd2enfvZfH3e/x3g14L
         MeqFwczrnEtciBXQlxOXWPfu0t4NlW/wPB4fDzRJ0x3b84D0dTZAu6J084aGwrisYbnk
         SJtlQIJr1bTkkxakPOn/N8oCTDvAGBLIIm01msAIybIdjw7IEWBGIhZ8C79v7oLJu5nh
         IgAyJxmSlkCwHg6YVt753fhUy9G8ePQ56pLB2pC3PeZInzw+KCfC3rRyzw47xO75eLgb
         uKM/iXbNGl0V0cjLOwdExnGSDfAW1+Bq56rA2ywfi5pnVtIHO+RKc59KpUWOH6xrdHHC
         nb2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yHOeXGR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si13653014ybk.309.2020.08.03.04.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 04:21:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yHOeXGR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2YXQ-0008H2-Nd
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 07:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2YUj-0003xb-Fn
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 07:19:05 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2YUh-0004ti-4x
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 07:19:05 -0400
Received: by mail-wm1-x342.google.com with SMTP id c80so13985661wme.0
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uE/zSzU3YCUj+8keAlvLyFX2oijQycTIyZcK1gVRSqY=;
 b=yHOeXGR2+tLrevmmLAQBc1pTlblM93sXH20O1UjYNdxnWNyqGEP01d+ghis5QepkBJ
 nnsaAljk5M7pebS127QbwK0ye2ORk6Y0D5JwiRaf4IZ6KdaA6gAU2+Qm3E9HKh9nlw/i
 wuetfjcJzJhZlo2DDK0RixvsaxMayGV6+1uemSdZOE08frskmF73uIjGzBttcmtHSQDw
 t67uCqqtvWejovQsEEgxLeASwbPCIPJIOnQ7/7CsaS/PAdlx3Ih3Uz+HOmnDgkBrDn5K
 Okv9Ttn7R+eWS2tttQhAYUIezFzJ8Yv6wWT40sldWq13FRzu5zHPbZkVygAoz5VtUyFt
 FIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uE/zSzU3YCUj+8keAlvLyFX2oijQycTIyZcK1gVRSqY=;
 b=Xv5xMP+zkwySPK8AyfyXIF6JaLoQnqQEs9hCMIbgI481Lz9XWZO3thTnnjEvkaJw1q
 twGsDAsLez6mPRn8iQU2wCkzocskWHH6twWODtgAafcPBS+kYhDkFuvRfAGErqGrZsvG
 sHO67BYBsVT98qH8SLK06SCrU60sWgbs/k2kaz1ql5KLheS+2RHqcmoYSl1NX508xfdi
 tNnJKyGtt/s2JRTGQdoZSlfna8ND3B8L1y3w3AmZwU9vXoqbhmH5OQVtlqpvhXJm/NeL
 MmqNNa09KJkBlRASObgDuzJEcYAsxWSA5ZnQgqLzDg+A1FEQfKEWLDz5/ob/XdtI7OWg
 kGrw==
X-Gm-Message-State: AOAM532WFtkGsiMAPMcwA5EIViDA+SxeKEQ2hNHQqbK9SHBfRvD0bJgq
 UvCkKGlvIsTcxV9vieI3HR44p1JoyEqK0w==
X-Received: by 2002:a7b:c765:: with SMTP id x5mr14994384wmk.14.1596453541230; 
 Mon, 03 Aug 2020 04:19:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g3sm28013170wrb.59.2020.08.03.04.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 04:19:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/arm: Convert T32 coprocessor insns to decodetree
Date: Mon,  3 Aug 2020 12:18:48 +0100
Message-Id: <20200803111849.13368-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803111849.13368-1-peter.maydell@linaro.org>
References: <20200803111849.13368-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DOFjL34u6RmG

Convert the T32 coprocessor instructions to decodetree.
As with the A32 conversion, this corrects an underdecoding
where we did not check that MRRC/MCRR [24:21] were 0b0010
and so treated some kinds of LDC/STC and MRRC/MCRR rather
than UNDEFing them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  | 19 +++++++++++++
 target/arm/translate.c | 64 ++----------------------------------------
 2 files changed, 21 insertions(+), 62 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index c21a988f971..7069d821fde 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -45,6 +45,8 @@
 &sat             !extern rd rn satimm imm sh
 &pkh             !extern rd rn rm imm tb
 &cps             !extern mode imod M A I F
+&mcr             !extern cp opc1 crn crm opc2 rt
+&mcrr            !extern cp opc1 crm rt rt2
 
 # Data-processing (register)
 
@@ -621,6 +623,23 @@ RFE              1110 1001 10.1 .... 1100000000000000         @rfe pu=1
 SRS              1110 1000 00.0 1101 1100 0000 000. ....      @srs pu=2
 SRS              1110 1001 10.0 1101 1100 0000 000. ....      @srs pu=1
 
+# Coprocessor instructions
+
+# We decode MCR, MCR, MRRC and MCRR only, because for QEMU the
+# other coprocessor instructions always UNDEF.
+# The trans_ functions for these will ignore cp values 8..13 for v7 or
+# earlier, and 0..13 for v8 and later, because those areas of the
+# encoding space may be used for other things, such as VFP or Neon.
+
+@mcr             .... .... opc1:3 . crn:4 rt:4 cp:4 opc2:3 . crm:4
+@mcrr            .... .... .... rt2:4 rt:4 cp:4 opc1:4 crm:4
+
+MCRR             1110 1100 0100 .... .... .... .... .... @mcrr
+MRRC             1110 1100 0101 .... .... .... .... .... @mcrr
+
+MCR              1110 1110 ... 0 .... .... .... ... 1 .... @mcr
+MRC              1110 1110 ... 1 .... .... .... ... 1 .... @mcr
+
 # Branches
 
 %imm24           26:s1 13:1 11:1 16:10 0:11 !function=t32_branch24
diff --git a/target/arm/translate.c b/target/arm/translate.c
index adcd2127290..59d6e43611a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4791,37 +4791,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     return;
 }
 
-static int disas_coproc_insn(DisasContext *s, uint32_t insn)
-{
-    int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
-
-    cpnum = (insn >> 8) & 0xf;
-
-    is64 = (insn & (1 << 25)) == 0;
-    if (!is64 && ((insn & (1 << 4)) == 0)) {
-        /* cdp */
-        return 1;
-    }
-
-    crm = insn & 0xf;
-    if (is64) {
-        crn = 0;
-        opc1 = (insn >> 4) & 0xf;
-        opc2 = 0;
-        rt2 = (insn >> 16) & 0xf;
-    } else {
-        crn = (insn >> 16) & 0xf;
-        opc1 = (insn >> 21) & 7;
-        opc2 = (insn >> 5) & 7;
-        rt2 = 0;
-    }
-    isread = (insn >> 20) & 1;
-    rt = (insn >> 12) & 0xf;
-
-    do_coproc_insn(s, cpnum, is64, opc1, crn, crm, opc2, isread, rt, rt2);
-    return 0;
-}
-
 /* Decode XScale DSP or iWMMXt insn (in the copro space, cp=0 or 1) */
 static void disas_xscale_insn(DisasContext *s, uint32_t insn)
 {
@@ -8485,38 +8454,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         ((insn >> 28) == 0xe && disas_vfp(s, insn))) {
         return;
     }
-    /* fall back to legacy decoder */
 
-    switch ((insn >> 25) & 0xf) {
-    case 0: case 1: case 2: case 3:
-        /* 16-bit instructions.  Should never happen.  */
-        abort();
-    case 6: case 7: case 14: case 15:
-        /* Coprocessor.  */
-        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-            /* 0b111x_11xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx */
-            goto illegal_op;
-        }
-        if (((insn >> 24) & 3) == 3) {
-            /* Neon DP, but failed disas_neon_dp() */
-            goto illegal_op;
-        } else if (((insn >> 8) & 0xe) == 10) {
-            /* VFP, but failed disas_vfp.  */
-            goto illegal_op;
-        } else {
-            if (insn & (1 << 28))
-                goto illegal_op;
-            if (disas_coproc_insn(s, insn)) {
-                goto illegal_op;
-            }
-        }
-        break;
-    case 12:
-        goto illegal_op;
-    default:
-    illegal_op:
-        unallocated_encoding(s);
-    }
+illegal_op:
+    unallocated_encoding(s);
 }
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
-- 
2.20.1

