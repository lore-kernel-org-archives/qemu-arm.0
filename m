Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4201997wrg;
        Tue, 11 Jun 2019 03:59:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBgFnzn7A4zfrX/p9MpD7kbJsJ7jOtq79NG8CDFJj5AcarNyIi64L3WbV8ymvJvt3lS6Vp
X-Received: by 2002:ac8:1829:: with SMTP id q38mr45988333qtj.252.1560250752150;
        Tue, 11 Jun 2019 03:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560250752; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+RwPmaE7XrPzIsxVZY76m0jW1TrHDRWGPgQ6bqrDhbWXjhDADNbJTPn5Xwn+dJA/F
         fkwUpbrqYIPrcrRa1bsjMglfgZgvZuwMOecv6TjmZnxrpOOSjBq1kga0eev2dlsHjRMC
         RMI9ooKUu0+aBaQ+j0ADoh+zuiyhpxW9diVFHJN3AZotlhctJPejIC2e2McxbSf5BHcb
         za1Ifur6GVRFW9XMzVPjbHLWl0I1KVL5HCZUeFFX8jUkJ8tUzz8vUd0VhihQnQmXtfuC
         yu++pp+4WEd/Wc8hDzkx0WLvGdgiDRuJkGBmYZ5eKfjj3L4XAf5ooUa5aoAnbBaz72Th
         ra4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fwMmmCKnJhSZXRq+jzl94zmymegBLzgFopXz7If0aS4=;
        b=jEoBydd1XfzAWG3r2yw2cbSRdsvAiOeQ6ZcWkTMlxD81UjddIc6Dbi3jlJkM2S85Zz
         81/8Y3xD9IWxmlaeHrI18qO2GAQtyB481YhS1DomM3yj7kd7JYtl2XTx5oaiU21fFrxi
         jS8D2nDjzyGXrEZhcScAZ7yT+U+l4HkpBO60/2ZhFnCDJAPxs5RuE/28YdsFz2tHu2KO
         st6Ro8dRCjPRlEwT6usMSxgbo/ZIzmyO05m0bJSpx9KCw9KN3y/oDjGy/2wtR+7QYNG6
         naqYj0xM4kQolHXsWGFt6HCCkg0v1mCdE9Al/hsQie0m7urJ7FAtplmx0Dw5myxYG54v
         zMHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QmLMFaft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x37si2296976qtx.8.2019.06.11.03.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 03:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QmLMFaft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeUh-0004Fs-MX
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 06:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39117)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePu-0007Dn-KZ
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePr-0007PI-Rf
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:32808)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePr-0007Nk-Fa
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:11 -0400
Received: by mail-wm1-x342.google.com with SMTP id h19so1657883wme.0
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwMmmCKnJhSZXRq+jzl94zmymegBLzgFopXz7If0aS4=;
 b=QmLMFaftqF+/Pt0bEoGZqWf7ZE/vOQoE2lm6dnxDAVR6UNREY1dti/AQ31thzC4ozW
 W8DLZTUiCr5xv4bIGTnbKK0eEmaKkk9jZQn8D+A4lTZd3stMdf8DQhH7PC7zqknbo1IM
 hNF4vNYyBPgKYr4pSSFZa9TAtRmLLeBaY/inypTeG5nk1OljiKnVKp3XeAf7KSIeeqMu
 CrVBbLpYxcqaefg29iFiZiImdFvYj59DvgcOJU0vpOIsBERVlDfZp15jBHv0A3+Zk7C7
 vbR2UyXR8Rv9VH7+F9MqdBYLWl46f++cNXBfwj94CUYkwN5tO3m5tVVdNLaypMWFM/gM
 LD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwMmmCKnJhSZXRq+jzl94zmymegBLzgFopXz7If0aS4=;
 b=Sopco59FUKUuiIGD5R/NSDSLq7GwsyU0+Uq5EJpc5a1Hc19tA/fomJytt32YHkj+Fz
 mWo2d+fMhdT23g72xtNe+MX9ekQi1pDZynKzZRxkhHTJL4x0AAoguZjBr/IMXIWIrX56
 +UtHlRruyYCMyYSGeYrgspz5hod++Ptk8cIRcMpF5xbhSeFdpTmDC6/UMwXpPqS/i2TL
 iJIg9js5LxJND7A5ku4xUju4JQTcEquVK2y9J+VA3AkKPO2F0p8qfaGk1//B5N26QxFS
 O3zDIgcojuuMQ0P2Gk+uvaZc1VyJGegiROICtff4M9wm+7UuhT3AvneFc2XOIQLNyWE3
 enoA==
X-Gm-Message-State: APjAAAXh/ZvztM0EXayvUjLsBXuzDwnTOwokSq7Sc0RtUcBXpwr/1cRB
 2tGD2gG5L7bbzj9U7DD1QQ+e6qXyVB8+UQ==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr9242548wmh.68.1560250449938;
 Tue, 11 Jun 2019 03:54:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:24 +0100
Message-Id: <20190611105351.9871-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH v2 15/42] target/arm: Convert VFP VLDR and VSTR
 to decodetree
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
X-TUID: H/w8wOY9GY2T

Convert the VFP single load/store insns VLDR and VSTR to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 73 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 22 +---------
 target/arm/vfp.decode          |  7 ++++
 3 files changed, 82 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 5f081221b83..40f2cac3e2e 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -853,3 +853,76 @@ static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_sp *a)
 
     return true;
 }
+
+static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
+{
+    uint32_t offset;
+    TCGv_i32 addr;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    offset = a->imm << 2;
+    if (!a->u) {
+        offset = -offset;
+    }
+
+    if (s->thumb && a->rn == 15) {
+        /* This is actually UNPREDICTABLE */
+        addr = tcg_temp_new_i32();
+        tcg_gen_movi_i32(addr, s->pc & ~2);
+    } else {
+        addr = load_reg(s, a->rn);
+    }
+    tcg_gen_addi_i32(addr, addr, offset);
+    if (a->l) {
+        gen_vfp_ld(s, false, addr);
+        gen_mov_vreg_F0(false, a->vd);
+    } else {
+        gen_mov_F0_vreg(false, a->vd);
+        gen_vfp_st(s, false, addr);
+    }
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
+static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_sp *a)
+{
+    uint32_t offset;
+    TCGv_i32 addr;
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vd & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    offset = a->imm << 2;
+    if (!a->u) {
+        offset = -offset;
+    }
+
+    if (s->thumb && a->rn == 15) {
+        /* This is actually UNPREDICTABLE */
+        addr = tcg_temp_new_i32();
+        tcg_gen_movi_i32(addr, s->pc & ~2);
+    } else {
+        addr = load_reg(s, a->rn);
+    }
+    tcg_gen_addi_i32(addr, addr, offset);
+    if (a->l) {
+        gen_vfp_ld(s, true, addr);
+        gen_mov_vreg_F0(true, a->vd);
+    } else {
+        gen_mov_F0_vreg(true, a->vd);
+        gen_vfp_st(s, true, addr);
+    }
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d2dced7c45a..d954e8de1eb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3713,26 +3713,8 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             else
                 rd = VFP_SREG_D(insn);
             if ((insn & 0x01200000) == 0x01000000) {
-                /* Single load/store */
-                offset = (insn & 0xff) << 2;
-                if ((insn & (1 << 23)) == 0)
-                    offset = -offset;
-                if (s->thumb && rn == 15) {
-                    /* This is actually UNPREDICTABLE */
-                    addr = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(addr, s->pc & ~2);
-                } else {
-                    addr = load_reg(s, rn);
-                }
-                tcg_gen_addi_i32(addr, addr, offset);
-                if (insn & (1 << 20)) {
-                    gen_vfp_ld(s, dp, addr);
-                    gen_mov_vreg_F0(dp, rd);
-                } else {
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_st(s, dp, addr);
-                }
-                tcg_temp_free_i32(addr);
+                /* Already handled by decodetree */
+                return 1;
             } else {
                 /* load/store multiple */
                 int w = insn & (1 << 21);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 134f1c9ef58..8fa7fa0bead 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -71,3 +71,10 @@ VMOV_64_sp   ---- 1100 010 op:1 rt2:4 rt:4 1010 00.1 .... \
              vm=%vm_sp
 VMOV_64_dp   ---- 1100 010 op:1 rt2:4 rt:4 1011 00.1 .... \
              vm=%vm_dp
+
+# Note that the half-precision variants of VLDR and VSTR are
+# not part of this decodetree at all because they have bits [9:8] == 0b01
+VLDR_VSTR_sp ---- 1101 u:1 .0 l:1 rn:4 .... 1010 imm:8 \
+             vd=%vd_sp
+VLDR_VSTR_dp ---- 1101 u:1 .0 l:1 rn:4 .... 1011 imm:8 \
+             vd=%vd_dp
-- 
2.20.1

