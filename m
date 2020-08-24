Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2607427lfy;
        Mon, 24 Aug 2020 07:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+teuPn/58JhAJYlh/Gaf+Kmp7MQmJHWDd1CjqkSLzLjIoqMXYptrGke0zf4kuhPdMikGp
X-Received: by 2002:a5b:508:: with SMTP id o8mr8685365ybp.43.1598279506339;
        Mon, 24 Aug 2020 07:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279506; cv=none;
        d=google.com; s=arc-20160816;
        b=e4OjbQFVIFQsDtP7slGdwhUPnhBZNGg5ttdUxvESJxKH1bN7S95g/0849nv7kZACdk
         v1ttdxZ+9mCjPx4LP8QtU4NHg3lgMW2VycybTGGQtZ4nng7OrCOSaFuXe/gOGD7T+PL2
         7JjDTTgxF1Sax1JrWqPFi6KkNWrhcs8BFGRykKrF8VTV4IJhzI/S6a3raHY6apUC9PZ3
         u+/LAYtJJdxXOrVVXc/0bTFX2MQJnz5PmEzYc6qdWaOrX0TJIcd63hM4L3pH/Xs3f2N0
         5mXSpimABPBJYlhPFsoLJKmKqri6OMvIInnDOB4yCwh70W1wZqlJjuRyufW/fOK7Lc1M
         fxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YdTVCHUYqmChsgF+ID02/aH4U8m+3sURh89+kDcA5H8=;
        b=ssFB6oYgVlQ1FdUgYqUMLun3tOKasOFT5gfabp2Y5K2y7vtXH5zWsrGsIZNe9l+N2B
         3aW3rhWIUdmwGS0fLh3ejat8PxqoYII8YV2Tsz/VdKLa80qO1wM6kvziGN5FgAnMu7be
         XAJ74wyM3uH0/XRb11In+/nZB3YWyCxDmC8IixvFms/FTRo2srB+kY1dskS03gPGprDl
         ezoW/RnTPaRApU/ADG9oBo4r7ruBbiSa9zYgnkq03YwbDVps8937B8j3KAGej9O4Ua7e
         AIYRHOGbQ32Kg8967q5AZanvARwPZkpHikfHACsxfnceyOsh4YRJ/fBHV2e/b8Ds9RJB
         xV7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jf5Au5CE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si11055635ybp.59.2020.08.24.07.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jf5Au5CE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADVh-0002M1-Lp
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTr-0008PV-M7
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:29:51 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:32773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTp-0002i9-Ov
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 10:29:51 -0400
Received: by mail-wr1-x442.google.com with SMTP id o4so4873806wrn.0
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YdTVCHUYqmChsgF+ID02/aH4U8m+3sURh89+kDcA5H8=;
 b=jf5Au5CEMc3kFyO8VL66vAeTClmn83aFqvvhmOvSe7XE1jczFrNJRew1PkMRg/Mfzn
 cBxFgiEOTWYsnGpn49GLgbhswrLyFOIDwmUumE1Pjp0AbUkTRLayk6T4t8I8mfoWuCAT
 vDxe+nTV9QCvcbzF/OznJAWJQ8HnXs3C3VW30NVxSRvV66BDe9pnYxZuco9O0RwEjUun
 APMEzElAyfl7TT1d1XzqU5qVncMVXpwFH//zJxvPcqmf1DtmnL+9pRE0/3pKiG7X7js2
 QkKOPO+UDhqvwupNCbp++xcXfDQsFOtZDTpS0IyTKqHgY1oNZjFQPKsgCy5XdnVBT30K
 tMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdTVCHUYqmChsgF+ID02/aH4U8m+3sURh89+kDcA5H8=;
 b=earalbRFXRDGPIWvkpLX25lac/731UZuVvxgtPjy+LpwcEqX9MtCN6N/YTnjlsliHf
 itcM3P/s8d5tJDxhXqsQmjSIewZdrTLWGhRlvUoPKkga55ByzpCo8J6le21f99ugg/Ip
 vbFA97vEgAorR6CMRza6YCVGv7EEVgRjgGiJIjATYIm0W3xl1gs0Cuea1AsHwlZj/eMA
 qtWSiRvCAqjZLJcyRlxIhhqx9xezNS+W9pS3o8C4GI11nz9jKE++RAV7iV18BDcPVE+m
 prxCSBTX06LtzgL1uXml1PYW6Ej4mbihK+oT6uQ3WDoC+xgFTyi0PECaB+Mh9QFaHXxR
 AV/A==
X-Gm-Message-State: AOAM530vN65alNrB6/ZluLf7qgYqujMWhOt51cc5eBO97GWC93DmpNOZ
 4dqLkZLih0bdgbOxB5WRG/CGzQ==
X-Received: by 2002:a5d:5052:: with SMTP id h18mr6341120wrt.156.1598279388452; 
 Mon, 24 Aug 2020 07:29:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/22] target/arm: Implement VFP fp16 VLDR and VSTR
Date: Mon, 24 Aug 2020 15:29:23 +0100
Message-Id: <20200824142934.20850-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qdPlhJGxpsSh

Implement the fp16 versions of the VFP VLDR/VSTR (immediate).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp.decode          |  3 +--
 target/arm/translate-vfp.c.inc | 35 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index b213da4b55d..37f96e2d261 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -79,8 +79,7 @@ VMOV_single  ---- 1110 000 l:1 .... rt:4 1010 . 001 0000    vn=%vn_sp
 VMOV_64_sp   ---- 1100 010 op:1 rt2:4 rt:4 1010 00.1 ....   vm=%vm_sp
 VMOV_64_dp   ---- 1100 010 op:1 rt2:4 rt:4 1011 00.1 ....   vm=%vm_dp
 
-# Note that the half-precision variants of VLDR and VSTR are
-# not part of this decodetree at all because they have bits [9:8] == 0b01
+VLDR_VSTR_hp ---- 1101 u:1 .0 l:1 rn:4 .... 1001 imm:8      vd=%vd_sp
 VLDR_VSTR_sp ---- 1101 u:1 .0 l:1 rn:4 .... 1010 imm:8      vd=%vd_sp
 VLDR_VSTR_dp ---- 1101 u:1 .0 l:1 rn:4 .... 1011 imm:8      vd=%vd_dp
 
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 00a6363e1e1..59ef4d4fbc3 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -886,6 +886,41 @@ static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_dp *a)
     return true;
 }
 
+static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
+{
+    uint32_t offset;
+    TCGv_i32 addr, tmp;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /* imm8 field is offset/2 for fp16, unlike fp32 and fp64 */
+    offset = a->imm << 1;
+    if (!a->u) {
+        offset = -offset;
+    }
+
+    /* For thumb, use of PC is UNPREDICTABLE.  */
+    addr = add_reg_for_lit(s, a->rn, offset);
+    tmp = tcg_temp_new_i32();
+    if (a->l) {
+        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        neon_store_reg32(tmp, a->vd);
+    } else {
+        neon_load_reg32(tmp, a->vd);
+        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+    }
+    tcg_temp_free_i32(tmp);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
 static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
 {
     uint32_t offset;
-- 
2.20.1

