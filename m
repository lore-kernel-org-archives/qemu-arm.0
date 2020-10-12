Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1158074lfa;
        Mon, 12 Oct 2020 08:48:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOgehjOb23RL02DGb8+jB0iW04RI9RRn716x0FSipKrFUDJKElpF8B2GfmSjayWwNThwz0
X-Received: by 2002:a25:d441:: with SMTP id m62mr8669919ybf.422.1602517730836;
        Mon, 12 Oct 2020 08:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517730; cv=none;
        d=google.com; s=arc-20160816;
        b=OgWLL3hhy55B+ImV+SPi3fcrTeTYzDEiZp1tbYvrwdUImCMhoBpZALh55ziz4SrrdW
         0iwaNWGB9V9+oChhuEMjkcQEHOPWC+udiMaFcGYoI6GUwLRREhgqKOpZeDzhbrYZk8s1
         ztZ0atapRJuBOunF1eFfvHWFWZQMjYq5YzIqTnKL8yHFbwDT5PZtBiwYGbHCESBe41Ct
         QmBPjJ59tvhvYVLUa7O1TIR5cb6UjSPszvon9VWyh6IyPM/qQ2eSE1Lcj1g/qvW66/dm
         DJkJwTISQ0a3Qe4awbjnN23PYaKCSpPXnOHvPvBYK58DZ8BJtDFloYwaTimFHvrAEsCX
         PlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zEp3FAc4PsK+mUmkw0N3JOzoyYY910pPg+gC5kaj9zw=;
        b=Hbz7qvqOcHfrsEe/eWe+Dc89vVkNR0Uwslrccxd53C+2G8JRofCxYuu0CLLjsBdEso
         HBehnoxHi1CcG9WwhFHhVTGumSs/UwX4U554wVG4+I8FtuQGTGgsC2rwA6UU1VyrTnsX
         S3j8+5RmF+/Gdmq/QsMWTDYVAXFdNnGzo2/i3stOoE/QSqR3ZWxevGHDx1WpIR3aPGry
         s8nqukET3sDnUE2tp+n6Im8Yk2o4VPdEC0Nf5jvKC7204gHa/joPYQE+gEsl15rL01vy
         El/WEGmm7v4bBxDTDVG1FfZsodq+qHg+Sm924W+rlRqPp2IjkXV8UGPAAJAximuAMHM+
         mvww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWlVwKBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i32si14507773ybj.214.2020.10.12.08.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWlVwKBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS04A-0008PX-1j
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztk-0003jZ-0b
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:38:05 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztf-0007mT-Gg
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:38:03 -0400
Received: by mail-wr1-x441.google.com with SMTP id e18so19682769wrw.9
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zEp3FAc4PsK+mUmkw0N3JOzoyYY910pPg+gC5kaj9zw=;
 b=PWlVwKBgxWibaA1JLjO/BiaQ2zurAe6XbJXm5jph0VY9HqSgTw053MLU82nG3tIHY4
 iw6g0NJ/ZVeC9xuOqYGTVFMwGkElDtOHQDS6Wrsl6UZuBDUVgf26DOzK3u4jSG0GGOm7
 luecGGauin/hN6HEMjkGAh3APj/Heekk5G34AyZDR3KTFWMCbIP38hLAB6Vmfo9r7zPH
 CirNtGjwsFlDioD7O4+BujC1d9pb+DqfbO6GpefdJiWQjio5GfijajOLs6SnUQKHs+OK
 l67nBIDUy0ZcFYCjJFN1ub76TbTxdg/LgV5uXwtKNXD8Sg/pR+fzpbQvK1yrxKk+yvL1
 T1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zEp3FAc4PsK+mUmkw0N3JOzoyYY910pPg+gC5kaj9zw=;
 b=OzD0WEgV9ZJENLGT1dyCBhw2dOMZIsFiB5rQFVsUTNyBuHLu8zcqd3YXSPWFhu3yI9
 RpNkepORbY6iHyJKBJHHNI5YGduP64n7OIbNr4b4uPZGOiiX00oX9xUt9OfRNdPVmJGB
 9wULpepDLj7VxC3k0EJOo7s75ZYwuU7PoDFBj2arQjtwk4EHPO2KuOITyMxScbAFbKDE
 FyWK1vhgC9TdalGbUHeZR/GrgXmbPrHgeqF8pIx9RxrveFwRhKgEgGMzz8FdjEsxRWLx
 bh3xoK95vDaSVZ4gjihRsbn/uuudTERL7lUGDN/enQnwx8M8mrBwoq+Olk/rntvCwZ0m
 wc8g==
X-Gm-Message-State: AOAM530YsqzkYh7EDeyPi30q73ODjsRfql77IgXTWsv5xn2BvDQN8j8z
 ZTp3+PrH7jck34JP+Vs2GOJrlb8aIpq1LeKs
X-Received: by 2002:adf:912e:: with SMTP id j43mr30369318wrj.325.1602517076189; 
 Mon, 12 Oct 2020 08:37:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm7095961wmd.14.2020.10.12.08.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:37:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
Date: Mon, 12 Oct 2020 16:37:43 +0100
Message-Id: <20201012153746.9996-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153746.9996-1-peter.maydell@linaro.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kC/WRJzpXdk/

v8.1M's "low-overhead-loop" extension has three instructions
for looping:
 * DLS (start of a do-loop)
 * WLS (start of a while-loop)
 * LE (end of a loop)

The loop-start instructions are both simple operations to start a
loop whose iteration count (if any) is in LR.  The loop-end
instruction handles "decrement iteration count and jump back to loop
start"; it also caches the information about the branch back to the
start of the loop to improve performance of the branch on subsequent
iterations.

As with the branch-future instructions, the architecture permits an
implementation to discard the LO_BRANCH_INFO cache at any time, and
QEMU takes the IMPDEF option to never set it in the first place
(equivalent to discarding it immediately), because for us a "real"
implementation would be unnecessary complexity.

(This implementation only provides the simple looping constructs; the
vector extension MVE (Helium) adds some extra variants to handle
looping across vectors.  We'll add those later when we implement
MVE.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  |  8 +++++
 target/arm/translate.c | 74 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 3015731a8d0..8152739b52b 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -659,4 +659,12 @@ BL               1111 0. .......... 11.1 ............         @branch24
     BF           1111 0 boff:4 10 ----- 1110 - ---------- 1    # BF
     BF           1111 0 boff:4 11 ----- 1110 0 0000000000 1    # BFX, BFLX
   ]
+  [
+    # LE and WLS immediate
+    %lob_imm 1:10 11:1 !function=times_2
+
+    DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
+    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm
+    LE           1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+  ]
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9e72d719c6f..742c219c071 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7953,6 +7953,80 @@ static bool trans_BF(DisasContext *s, arg_BF *a)
     return true;
 }
 
+static bool trans_DLS(DisasContext *s, arg_DLS *a)
+{
+    /* M-profile low-overhead loop start */
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_lob, s)) {
+        return false;
+    }
+    if (a->rn == 13 || a->rn == 15) {
+        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+        return false;
+    }
+
+    /* Not a while loop, no tail predication: just set LR to the count */
+    tmp = load_reg(s, a->rn);
+    store_reg(s, 14, tmp);
+    return true;
+}
+
+static bool trans_WLS(DisasContext *s, arg_WLS *a)
+{
+    /* M-profile low-overhead while-loop start */
+    TCGv_i32 tmp;
+    TCGLabel *nextlabel;
+
+    if (!dc_isar_feature(aa32_lob, s)) {
+        return false;
+    }
+    if (a->rn == 13 || a->rn == 15) {
+        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+        return false;
+    }
+
+    nextlabel = gen_new_label();
+    tcg_gen_brcondi_i32(TCG_COND_NE, cpu_R[a->rn], 0, nextlabel);
+    gen_jmp(s, read_pc(s) + a->imm);
+
+    gen_set_label(nextlabel);
+    tmp = load_reg(s, a->rn);
+    store_reg(s, 14, tmp);
+    gen_jmp(s, s->base.pc_next);
+    return true;
+}
+
+static bool trans_LE(DisasContext *s, arg_LE *a)
+{
+    /*
+     * M-profile low-overhead loop end. The architecture permits an
+     * implementation to discard the LO_BRANCH_INFO cache at any time,
+     * and we take the IMPDEF option to never set it in the first place
+     * (equivalent to always discarding it immediately), because for QEMU
+     * a "real" implementation would be complicated and wouldn't execute
+     * any faster.
+     */
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_lob, s)) {
+        return false;
+    }
+
+    if (!a->f) {
+        /* Not loop-forever. If LR <= 1 this is the last loop: do nothing. */
+        arm_gen_condlabel(s);
+        tcg_gen_brcondi_i32(TCG_COND_LEU, cpu_R[14], 1, s->condlabel);
+        /* Decrement LR */
+        tmp = load_reg(s, 14);
+        tcg_gen_addi_i32(tmp, tmp, -1);
+        store_reg(s, 14, tmp);
+    }
+    /* Jump back to the loop start */
+    gen_jmp(s, read_pc(s) - a->imm);
+    return true;
+}
+
 static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
 {
     TCGv_i32 addr, tmp;
-- 
2.20.1

