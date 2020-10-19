Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3963601lfa;
        Mon, 19 Oct 2020 08:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQCzkOhrnGgTbnR2qVS/kyh/sWDbey0Zjlu0T6Vqv3E+DAfWtmlFSS/RFJG0aLFk3H0Vj3
X-Received: by 2002:a25:3188:: with SMTP id x130mr310873ybx.64.1603120862478;
        Mon, 19 Oct 2020 08:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603120862; cv=none;
        d=google.com; s=arc-20160816;
        b=bkXQQrzM65fJXQsJxM2Iygigo00EsY8MLeQEy8z4eNu8Z2k+/5c/LtQdtNiqQOSF/y
         zuJ0ecLTyvNvPjSwiC6QiH7xe9WqwYUjf1GfSMu9TWUQaoRhn9VBrGrebEq2MOy/+OWu
         P3rOn6728r85+M0tpeFBuatBHvDl2dZvUuA7TCTi/eFweVu8O0MXn3/DHUXOHOnkQpRZ
         2xQUhMO0bZxuDiSgvR5hQze/qcsg+NSo11MZFfPg+e+dunhMbIIxQkjkg3DwGf4ytdPw
         xgyLQbTVfnPB/KhUgB2kpJ3H0tTCjXVRkxUcUNhav55BI5L+xyO+tKbBfm4732d3am5u
         6nxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ikEdl6rx0OeiOU/X5Loal0K6ppxgDNTAV6c5EKnjG6I=;
        b=q5Tt9JGsSlEDkW0ObeGGvEkYlILbiOBdwraFghe/OEj2Zj/GewYfc1m/IvoJXa96dK
         G4T2P5S36qxf21E9kfNxm8RcxBU/PoUU5nxL5S/gX2Bk2kQ/43eBor9Oglap4m4HJrN1
         zlHLEiyaeyF9V4KUohF8VDWwipvrOv4Ky4gKW5ZCYDRatHu5WhD6ut+7DBAgV7SZYA5M
         Mi/qmYgcJoJmHkf4wTNDLet+SJsZBvmMCo/TQBwy1FXyn00WbVUzWhn8yfwucMYAH364
         jIceDSyMgrimJ0LgHjJBYRhG8zzerByry4ybURlg+cB4WUXhh2ETG3/1Go2T2ZKjNb47
         ADjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QVH/+hd1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q26si224269ybj.395.2020.10.19.08.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:21:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QVH/+hd1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUWy5-0007Zi-Rr
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqZ-0006sU-Av
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:15 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqW-0002k3-6w
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:14 -0400
Received: by mail-wr1-x442.google.com with SMTP id t9so90478wrq.11
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ikEdl6rx0OeiOU/X5Loal0K6ppxgDNTAV6c5EKnjG6I=;
 b=QVH/+hd14D3lnF6cy7qMa4xgoaIS8SN8fD3jQwNYVtMbJFbLQktfGv3nyvz2Hm1+Ag
 MIQq7wOK+HvdnzAraImkjT5BfpH6wibQxGzfPG6KOmaZ4pfPKX8GpAL4v/6AxdXmCkHd
 6yviXa/JjKZ0AX4F7HVlG1v3BFnZ/ea4lX9uvQruT76Lj0UWBJLxTn56C/UtFX7dBAtN
 0ldGWu7wYgzytyFqopn4Zad6+R5LM7+qz7OglyYdhCt7BJHNbRa526Jplk8BJuCCjIzj
 q57YNVxSwtzFJJMzkHuBczGhgbA28oiKzbHdgBPi5VfLCs3kfEZhfUZv+7A/jPGRH791
 hScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ikEdl6rx0OeiOU/X5Loal0K6ppxgDNTAV6c5EKnjG6I=;
 b=nPUM3CVGBRmg9ophJkynl20DmxaEhJNal0tBWiD6tXqRsYBy0sQzYXJix9m6RV1jrN
 o2FDW7I2PplRioRFa8+8CrSiNtnJBocqJj/U0gLBiTvc+3G+j7RDm1IssDB+zLswR+uX
 iPA3PK3N0DSFSFsd6eTyLmSax/DT5zLH7Pmd/gIcGPPipFjbmxk8lEpQbZpDUZ+sJMV1
 5fiKnw3nuw6XxREGu2sEjo3cpFXDLANnDT9IOqhpGj6kxY4f4+CJiKAIE2PlKNAKbVnq
 /rSvipGUOC0Y5N28Qf4TTkBYD3vhPRvycjW4i1bVsG8rcQr4PQeYf159h4aUm6/R1JMv
 QdDg==
X-Gm-Message-State: AOAM53077ON4tb+71GZIIJe3ANhxpkkt+TwUl7D842T8jZpJ51TrIPEJ
 uNlUF8pyx0Gj/IhJtQKQ7QcqKGpRy/YX8A==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr7650wrm.294.1603120387422;
 Mon, 19 Oct 2020 08:13:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm309918wma.48.2020.10.19.08.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:13:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/10] target/arm: Implement v8.1M conditional-select insns
Date: Mon, 19 Oct 2020 16:12:54 +0100
Message-Id: <20201019151301.2046-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201019151301.2046-1-peter.maydell@linaro.org>
References: <20201019151301.2046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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
X-TUID: GDOTx5/X4h4z

v8.1M brings four new insns to M-profile:
 * CSEL  : Rd = cond ? Rn : Rm
 * CSINC : Rd = cond ? Rn : Rm+1
 * CSINV : Rd = cond ? Rn : ~Rm
 * CSNEG : Rd = cond ? Rn : -Rm

Implement these.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  |  3 +++
 target/arm/translate.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 7069d821fde..d8454bd814e 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -90,6 +90,9 @@ SBC_rrri         1110101 1011 . .... 0 ... .... .... ....     @s_rrr_shi
 }
 RSB_rrri         1110101 1110 . .... 0 ... .... .... ....     @s_rrr_shi
 
+# v8.1M CSEL and friends
+CSEL             1110101 0010 1 rn:4 10 op:2 rd:4 fcond:4 rm:4
+
 # Data-processing (register-shifted register)
 
 MOV_rxrr         1111 1010 0 shty:2 s:1 rm:4 1111 rd:4 0000 rs:4 \
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d34c1d351a6..c145775438e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8224,6 +8224,66 @@ static bool trans_IT(DisasContext *s, arg_IT *a)
     return true;
 }
 
+/* v8.1M CSEL/CSINC/CSNEG/CSINV */
+static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
+{
+    TCGv_i32 rn, rm, zero;
+    DisasCompare c;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+
+    if (a->rm == 13) {
+        /* SEE "Related encodings" (MVE shifts) */
+        return false;
+    }
+
+    if (a->rd == 13 || a->rd == 15 || a->rn == 13 || a->fcond >= 14) {
+        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+        return false;
+    }
+
+    /* In this insn input reg fields of 0b1111 mean "zero", not "PC" */
+    if (a->rn == 15) {
+        rn = tcg_const_i32(0);
+    } else {
+        rn = load_reg(s, a->rn);
+    }
+    if (a->rm == 15) {
+        rm = tcg_const_i32(0);
+    } else {
+        rm = load_reg(s, a->rm);
+    }
+
+    switch (a->op) {
+    case 0: /* CSEL */
+        break;
+    case 1: /* CSINC */
+        tcg_gen_addi_i32(rm, rm, 1);
+        break;
+    case 2: /* CSINV */
+        tcg_gen_not_i32(rm, rm);
+        break;
+    case 3: /* CSNEG */
+        tcg_gen_neg_i32(rm, rm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    arm_test_cc(&c, a->fcond);
+    zero = tcg_const_i32(0);
+    tcg_gen_movcond_i32(c.cond, rn, c.value, zero, rn, rm);
+    arm_free_cc(&c);
+    tcg_temp_free_i32(zero);
+
+    store_reg(s, a->rd, rn);
+    tcg_temp_free_i32(rm);
+
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
-- 
2.20.1

