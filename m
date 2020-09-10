Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1514801lfq;
        Thu, 10 Sep 2020 10:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8ARZsfzKmJhwbR7wqdbSVPs55DHFN9JMrKtWxJOycbKonKRZPdTtpHiwPJnMgtl7BqZxn
X-Received: by 2002:a25:d290:: with SMTP id j138mr14470944ybg.146.1599759588783;
        Thu, 10 Sep 2020 10:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599759588; cv=none;
        d=google.com; s=arc-20160816;
        b=sbyLUwkGdybTV4ImdB4nKTmDxdYDBgfn329PM8jvAuRXeTRwTfQFEuSuW9lKAJ5wwF
         qugJxX9yG2QeD/a4drdm9IeaqrE395YarJXk5aHu7aKiERfRuu7w5yAD4B5f0wacYFOx
         p6+yYI5yvvykcsHzIBtxodoD8TLp79fmhReUYigjAXZXTUCi1FjRu9b8mxbaUiPPsjfz
         LQkXvD3gZz+kSPMvvtHzLNbpSqT1CzI+4t5pKiEJ/hm3wuLGlDhC6vvM/oUKV94azQIw
         IRTxdhXr8IQ1oPjRtppUMsVy3VgdEx5ph0THbYFGGyiAEXizxyAGJ/54PtVMwXSJYhgs
         cNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TGaZ8S9jCTIwlbnlsjzYIzfStZejwdYuXoamg2TI9as=;
        b=gG7SHXBeOokmIoTNXLv2/2ApgTZPyKvmEUQHQiWiqTL5BRFu91VqunslPFQNN0QCY5
         Jqrv7kHc+qeWnABG8y/dIpgn6/sdpjfk0DnH4h1txCRzy85HQgvLjZgKzh5oLWuIx6tH
         LPq9EGhiQIrRgO8cKEgx9l09//u6yJwi3xfCom88b+Kmwdx2QTRv1bA/MQ1ljL7QYons
         7UO28cg1ClJsYiDQfq3dJO+RR8CyU86J+CdtwtjiPttGEDVm07NLJG61uNTlUoN7MeXI
         jVWu5D9qFOTDFw7SGsKclDdKEOFH/u/GC9zxEtjaxW40M6aPd7gKDkZ7t+B/l/11Mu//
         iSNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzRA1BQf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h196si6814449ybg.358.2020.09.10.10.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 10:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzRA1BQf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGQY0-00056B-6Y
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 13:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXP-00041E-6w
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:39:11 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXM-0002pA-LI
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:39:10 -0400
Received: by mail-wm1-x344.google.com with SMTP id a65so940561wme.5
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TGaZ8S9jCTIwlbnlsjzYIzfStZejwdYuXoamg2TI9as=;
 b=UzRA1BQf0o6Y1LDeUINMQgs3MPqkViM6s8XkifXfjoktbwOhaDXxNzzxCPWG/u+wrN
 j/p4y8Qj6siyz9u6l0h3wcqnLk+0Hr3A/XVXJH7nnma/bwWxqIPguf96y5RoD1eAGGlP
 O+hrQc2sUM7J78Mku9S3EYlVvn/oIRvyd0fUBNs2OiHbDcY+whIQU7ZyYbE22Hu+4TRl
 y6D9qlN/IMPGzS7HONOpYWrk6TEu2HctLyEUssAj/0kR8jb0UGfoF8FUyyjirHmu9XS2
 tyUiZTVuQEWX+Igd57fSX4wN/aCNV6PjXJDC6blXcc/Lek9lUUGRwrka3PzqDlqvfxbq
 3fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGaZ8S9jCTIwlbnlsjzYIzfStZejwdYuXoamg2TI9as=;
 b=iJvv7d6FnQ5jJXDCM/23xfFXZ+LzCSii5imQjtENo0+4fKi4fdwiSxA8JUiohTsn9G
 5o6RzGqbtC5bim5WBYGvj1Vqca3EKcg9wdVRevdj/XvksnCPe9FdGsG1PoidhCAh8hFZ
 VyiJfR/PgUSU6aYD1FBNcPKaD9KGbYzT0iwnDyLVkXZ31UDlukcEtXG0xzrL5zexdvqk
 FbN3c8CLojxGqIKq1P/240ZmwMVhrDohNZoUtHrDylbZd6ORUTNEct1De7rOQv+Axojx
 Ce5s025Xwy4zhMskDz1NRpRufb18d8p89Ungy9g8l82m2L+RACKw7DcwuZaiWhRaSBW1
 Mqpw==
X-Gm-Message-State: AOAM532BUZtn5GYhemDva1wt+ko8mNyr1je/P+vsnXMpnbvyaoAlS/Kg
 BJIK1tUs6tTxesXYTX+OVyhWiDPFcOp32bRg
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr1149719wmf.20.1599759547032; 
 Thu, 10 Sep 2020 10:39:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q186sm4603128wma.45.2020.09.10.10.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:39:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] target/arm: Make isar_feature_aa32_fp16_arith() handle
 M-profile
Date: Thu, 10 Sep 2020 18:38:55 +0100
Message-Id: <20200910173855.4068-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910173855.4068-1-peter.maydell@linaro.org>
References: <20200910173855.4068-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
X-TUID: ZtBCIJO72dcm

The M-profile definition of the MVFR1 ID register differs slightly
from the A-profile one, and in particular the check for "does the CPU
support fp16 arithmetic" is not the same.

We don't currently implement any M-profile CPUs with fp16 arithmetic,
so this is not yet a visible bug, but correcting the logic now
disarms this beartrap for when we eventually do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index de2ab41e2a0..8453808b36d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1802,6 +1802,15 @@ FIELD(ID_MMFR4, LSM, 20, 4)
 FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
+FIELD(ID_PFR1, PROGMOD, 0, 4)
+FIELD(ID_PFR1, SECURITY, 4, 4)
+FIELD(ID_PFR1, MPROGMOD, 8, 4)
+FIELD(ID_PFR1, VIRTUALIZATION, 12, 4)
+FIELD(ID_PFR1, GENTIMER, 16, 4)
+FIELD(ID_PFR1, SEC_FRAC, 20, 4)
+FIELD(ID_PFR1, VIRT_FRAC, 24, 4)
+FIELD(ID_PFR1, GIC, 28, 4)
+
 FIELD(ID_AA64ISAR0, AES, 4, 4)
 FIELD(ID_AA64ISAR0, SHA1, 8, 4)
 FIELD(ID_AA64ISAR0, SHA2, 12, 4)
@@ -1919,10 +1928,12 @@ FIELD(MVFR0, FPROUND, 28, 4)
 
 FIELD(MVFR1, FPFTZ, 0, 4)
 FIELD(MVFR1, FPDNAN, 4, 4)
-FIELD(MVFR1, SIMDLS, 8, 4)
-FIELD(MVFR1, SIMDINT, 12, 4)
-FIELD(MVFR1, SIMDSP, 16, 4)
-FIELD(MVFR1, SIMDHP, 20, 4)
+FIELD(MVFR1, SIMDLS, 8, 4) /* A-profile only */
+FIELD(MVFR1, SIMDINT, 12, 4) /* A-profile only */
+FIELD(MVFR1, SIMDSP, 16, 4) /* A-profile only */
+FIELD(MVFR1, SIMDHP, 20, 4) /* A-profile only */
+FIELD(MVFR1, MVE, 8, 4) /* M-profile only */
+FIELD(MVFR1, FP16, 20, 4) /* M-profile only */
 FIELD(MVFR1, FPHP, 24, 4)
 FIELD(MVFR1, SIMDFMAC, 28, 4)
 
@@ -3525,9 +3536,19 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_mprofile(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr1, ID_PFR1, MPROGMOD) != 0;
+}
+
 static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->mvfr1, MVFR1, FPHP) >= 3;
+    /* Sadly this is encoded differently for A-profile and M-profile */
+    if (isar_feature_aa32_mprofile(id)) {
+        return FIELD_EX32(id->mvfr1, MVFR1, FP16) > 0;
+    } else {
+        return FIELD_EX32(id->mvfr1, MVFR1, FPHP) >= 3;
+    }
 }
 
 static inline bool isar_feature_aa32_vfp_simd(const ARMISARegisters *id)
-- 
2.20.1

