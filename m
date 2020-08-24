Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2612444lfy;
        Mon, 24 Aug 2020 07:38:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQk1UaH5DOvX28oDWNPwYVmwCWvyZm+P86oavGKolQDQxQAYb8XJcNs4ppoTqrqYM3As2x
X-Received: by 2002:a25:cf97:: with SMTP id f145mr8414268ybg.202.1598279909318;
        Mon, 24 Aug 2020 07:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279909; cv=none;
        d=google.com; s=arc-20160816;
        b=zKSUYwsGyWNefrPMhDGPeCrJ+nrp8VWwXyIKCg8oUnIW9b0QvfJARhUC+9sJ0d55I2
         QLOdca+teT9LK+oPKYSCSjC+iIpi1+5izhEbbP6u8rAAU7R+7PlQ81zm5HAFzV3JTKYy
         xgWkW9uFdOVW1NQNH/W2nQQL+DlHLJllrUufwaRbrxZ8ss8TNoigV1aTn8DW5TENwJL9
         SNbao+tS1eSXlkyO4AzNDU8YM4t7nERvkXk19iTaKYJ+49WeyqVwhS6cWvbkIHXEyR3A
         rkpRkq1A0LX5taQFfIorGJHOd/XnI4VWWdwvlenMN6zZ1DkCef7S0a4pET9CD5hT/iMJ
         HqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6iJpACWsMvXCAbJNWQuL6aEft/GfwNO72E4X7/oHZeQ=;
        b=xD/1hv/HIttTiSA030C/IVp+FyQnkIXrGAcnDcpGQOoFLKCdPcI+1WDqMRWjn7DQpz
         ag1/7A0OUjbP8Wel+4cnP+OUrrBdYvCHj7QlUHaSudU/GZ60wlCWYCxMUGhlR7SDgTDU
         xk3YNVRFZCEaBI35lNeg29HOBTBkwYnQy/ovQsCtTFIKPispasddZ9S1v56UEO19GLzB
         ReCndg5XKx0vHzwUJ27K6JbC44dNt8RZX7uXCEABoaOZhgRhnYppk7lskATa5YnjFSCi
         7kZnFxtkKr5/2FXrubfUJZOH+7MWqO4sXlu+hWnciwbGZ7zxPy0CX/sq3bwQpHXXCiuv
         u+9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1+X2uI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g34si13063692ybe.393.2020.08.24.07.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1+X2uI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADcC-0006GE-Ie
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTw-00009E-0U
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:56 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTu-0002jf-Ai
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:55 -0400
Received: by mail-wr1-x444.google.com with SMTP id h15so2165898wrt.12
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6iJpACWsMvXCAbJNWQuL6aEft/GfwNO72E4X7/oHZeQ=;
 b=Z1+X2uI9h1zE3ieQUqCVDB67nKXM1jcJE5H9K95uolRzuSTeU+jS6XJv6K+x0pzLbh
 mt70DhIYnnGO7GmUfGLraKwAHF26bJeAfJU1OLICKVNf1Og/cov7P8MaQ8mk0k/yljzi
 d+N135iXynwVJqKC8EJxRLm1Uc0xkzH00M2fzk95ylwfuxHS12P1zwTWsNmfvlaJdiGv
 MzA4/1YTqm4fGLFpRQsNIirv8OpzqAGaoVA2+Bvj1gEaF1UlmFSVid+fPnIVW1agNST4
 5ruLeqUzyvqDW4RARZOx2CuDqo2UJ/VEf5KoB+a4Yisrkf0Oe4g3WbofbnerCNaiT8b9
 U5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6iJpACWsMvXCAbJNWQuL6aEft/GfwNO72E4X7/oHZeQ=;
 b=W0ICmJ0gbHuSPg1f5vlixUVOEfjllI1hnCD7HdwqcjBWL9x1rWXP6Ze7vC6NpWbb7f
 3Y7Tg50PNoMJXvJOgfkMz5OlRCjajnBiGcK7O9KgE52ZSzYXzoDze09QLfhcUy7olaup
 Z2eR0jpyhWT6beyXNiRCIgv3oGP7JVprYOffyLg7GqaIf7qoXEAWPDuNRYojFXrsN4eM
 s/HIBhh9y05rAKBkVp1X6um6fSr52U8do9HEg7EwCs0xTZ+5eRjXzNzPdKdnqiLWrgit
 4Ad9MBxPlekjuC1LazGKb1LCN43QeS0ZKk3XaZgEnoI/Ifypfs04zFUroRFJfh1cLXkS
 797A==
X-Gm-Message-State: AOAM533DTAAX6maEdtXzmXYuUfE7tSjDj1D5MoaLTL3eKaDm1qPUr2gD
 ju2ZJ1/+6kuUeTVBcampTHIaCW20AzozlMuo
X-Received: by 2002:a5d:54ca:: with SMTP id x10mr6026049wrv.36.1598279392692; 
 Mon, 24 Aug 2020 07:29:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/22] target/arm: Implement VFP fp16 VCVT between float and
 fixed-point
Date: Mon, 24 Aug 2020 15:29:27 +0100
Message-Id: <20200824142934.20850-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
X-TUID: /Jhum0paccqT

Implement the fp16 versions of the VFP VCVT instruction forms which
convert between floating point and fixed-point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp.decode          |  2 ++
 target/arm/translate-vfp.c.inc | 59 ++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 642ec039e3c..a8f1137be1e 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -225,6 +225,8 @@ VJCVT        ---- 1110 1.11 1001 .... 1011 11.0 ....        @vfp_dm_sd
 # We assemble bits 18 (op), 16 (u) and 7 (sx) into a single opc field
 # for the convenience of the trans_VCVT_fix functions.
 %vcvt_fix_op 18:1 16:1 7:1
+VCVT_fix_hp  ---- 1110 1.11 1.1. .... 1001 .1.0 .... \
+             vd=%vd_sp imm=%vm_sp opc=%vcvt_fix_op
 VCVT_fix_sp  ---- 1110 1.11 1.1. .... 1010 .1.0 .... \
              vd=%vd_sp imm=%vm_sp opc=%vcvt_fix_op
 VCVT_fix_dp  ---- 1110 1.11 1.1. .... 1011 .1.0 .... \
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 0140822d183..fdf486b7c15 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -2972,6 +2972,65 @@ static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
     return true;
 }
 
+static bool trans_VCVT_fix_hp(DisasContext *s, arg_VCVT_fix_sp *a)
+{
+    TCGv_i32 vd, shift;
+    TCGv_ptr fpst;
+    int frac_bits;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    frac_bits = (a->opc & 1) ? (32 - a->imm) : (16 - a->imm);
+
+    vd = tcg_temp_new_i32();
+    neon_load_reg32(vd, a->vd);
+
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    shift = tcg_const_i32(frac_bits);
+
+    /* Switch on op:U:sx bits */
+    switch (a->opc) {
+    case 0:
+        gen_helper_vfp_shtoh(vd, vd, shift, fpst);
+        break;
+    case 1:
+        gen_helper_vfp_sltoh(vd, vd, shift, fpst);
+        break;
+    case 2:
+        gen_helper_vfp_uhtoh(vd, vd, shift, fpst);
+        break;
+    case 3:
+        gen_helper_vfp_ultoh(vd, vd, shift, fpst);
+        break;
+    case 4:
+        gen_helper_vfp_toshh_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 5:
+        gen_helper_vfp_toslh_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 6:
+        gen_helper_vfp_touhh_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 7:
+        gen_helper_vfp_toulh_round_to_zero(vd, vd, shift, fpst);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    neon_store_reg32(vd, a->vd);
+    tcg_temp_free_i32(vd);
+    tcg_temp_free_i32(shift);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
 static bool trans_VCVT_fix_sp(DisasContext *s, arg_VCVT_fix_sp *a)
 {
     TCGv_i32 vd, shift;
-- 
2.20.1

