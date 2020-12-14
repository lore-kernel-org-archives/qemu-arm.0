Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2490788lfq;
        Mon, 14 Dec 2020 04:36:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDexgyZfd1c9agp9SEvTBlPtJU/qw4f7YCdh6XZ2sGmabnTi6DET6xR/6k0h3VMC4aOe4b
X-Received: by 2002:a25:107:: with SMTP id 7mr20565855ybb.337.1607949382580;
        Mon, 14 Dec 2020 04:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607949382; cv=none;
        d=google.com; s=arc-20160816;
        b=CDmrnGUK8liY7dYPucr1KE+laCWohxIQ9KGMlS3ritz4M/9qxQzh5pQRCSbUlWAyU5
         mzLISG+4et/qr1vCeouItBSslDlVa3SZmQAq5vY09ULT9WFbgb05u0qTAIlJOeWiguRh
         nU7tgT2luycrkltLAG0K4M2drPraKQS1WrxUgtzkUyW1YtQBVlyXH6XHOF2pegtnN/Ds
         Ac8A8umxHEweDJFPsgWjpah4dqvf2nvBqXLb9cnXI7Ep7RGtkwmjsnFIaHjlYaHvQY2x
         bufxuSedpiT3Ahf+imyi5NLlEqBwevHR7txH1JV9YZyUh2wIxU0fZJKxijuJZNR507Rs
         uClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=o5/21Y1Nv+z8LzfT3vNP3hN3hvuHLRR15ZdgGixszlo=;
        b=WOnDBXzGcd3WIRBL1OhF+/1dB062ZtR6lsipXw9oT3/KNINSJBnlWazvWRqLd/ylTj
         4X2pA2cjnvMligo3ynR2Jec3448BwmRSyfmwHNj5e4F6z6iDluUp0q3/99eqDIJmvDvi
         V7pF0PF9h0PUL0DdYBvF7OgGvjP3QirFFOlmn4iiKKhDIBle0OmT72wONm1uBsuLlpNY
         SLy39ubXjHV2zcVEzTXNUHs2Nsp4rti56RolmNT7OclOfqjJqA7hfDGXVZW6md+vj3e3
         EHtwDM2AreJhsuFZHcdfW5lY3IjozLsB9c/mHKxel7tkZ7GTlalEk3tBr3jp8lZutDss
         2RXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=moBUB6E3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si17339637ybc.40.2020.12.14.04.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 04:36:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=moBUB6E3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kon5R-0006GR-G9
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 07:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kon58-0006FU-O0
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 07:36:05 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kon54-0001Ss-Mz
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 07:36:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id r14so16205495wrn.0
 for <qemu-arm@nongnu.org>; Mon, 14 Dec 2020 04:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5/21Y1Nv+z8LzfT3vNP3hN3hvuHLRR15ZdgGixszlo=;
 b=moBUB6E3CaqFzoz1I5lukNpPvKC+xdXfAab+epa/EH88j4Orjr3C4Rjy9GkkpWbLD7
 /217cxX7bQJ0SND3MpY7Cxh+X9aQufavqI5jJQwsjbk5T7PxRqm9ON9d960NnyDKJnKs
 DWkuwX+3fuT8iaEz/aQJGhzx9zx17ySw23GY7NZcHeYqH0KOJacbx9S/DP5N2zxapDTv
 CP24kcbSL/h4jkTbzHiL22R93uCLtuRzLd6GWgPUebOdF6UMGRfTvr7IzkrF9xA16zuT
 /6Fc3Y1VFXdlXqIgxdsbDPm7zDBSJ+7yl70xaXUg3IJd1N5YSxJ3M1n0AHxhiiEnMabE
 nBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5/21Y1Nv+z8LzfT3vNP3hN3hvuHLRR15ZdgGixszlo=;
 b=K1SU/K6Tkj5ZxA4pw3rLEyylPLduIRodCVRKv3o5092hr7AAx5U2Q4PFtOK0EZBv9t
 lmxuRDrrtetDENvrbIKwWyymEvT5UxDXsJ/YOA28Y0i3xIBkmTLq9fRHhA0wtuDUuwsU
 +geDDUZIXRDXaJg13t15iy20wlpIlxGOOj1s4IWbjpuaGfcUXkv/ZCLw7a011SiBMIH7
 9VNzN12D6nr9PSPIf6bgtIJKzpP0MgjANVfoOmLKgfxr6e+OYs6p+ef4n/VZoFgIGw0t
 NUicMUP13YevBgb6aH7MlxWoExFbEqx7RyBlGWgP6TX5SUHYr9YcUdy6M9b2bg5yrjY6
 kOlw==
X-Gm-Message-State: AOAM531zaihIBnmOAb/a/B/Kl5gUYHPOQRf6hA21Yjm8y5jRmtWktnIh
 rHQHCvxU0U1nm2KBpVcOLSJw0p2EtDxbIFCjDdVShYhl5o7nwWt0LNsUOptFrJ+iokjJT+k1te0
 m+RDROZ5Lw4OwTA45lghRCqqu4lDnjrJCA7W2WwACF4ZVQShRqhB2jza/wnzI5eQR
X-Received: by 2002:a5d:558a:: with SMTP id i10mr29435561wrv.363.1607949355969; 
 Mon, 14 Dec 2020 04:35:55 -0800 (PST)
Received: from leonardo.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id d15sm31075531wrx.93.2020.12.14.04.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 04:35:55 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1,
 CTR_EL0 to cpu.h
Date: Mon, 14 Dec 2020 12:35:53 +0000
Message-Id: <20201214123553.2515-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nb3/pE3iOG7E

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
v1->v2:
- Correct CCSIDR_EL1 field sizes.

 target/arm/cpu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fadd1a47df..90ba707b64 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1736,6 +1736,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(CLIDR_EL1, CTYPE1, 0, 3)
+FIELD(CLIDR_EL1, CTYPE2, 3, 3)
+FIELD(CLIDR_EL1, CTYPE3, 6, 3)
+FIELD(CLIDR_EL1, CTYPE4, 9, 3)
+FIELD(CLIDR_EL1, CTYPE5, 12, 3)
+FIELD(CLIDR_EL1, CTYPE6, 15, 3)
+FIELD(CLIDR_EL1, CTYPE7, 18, 3)
+FIELD(CLIDR_EL1, LOUIS, 21, 3)
+FIELD(CLIDR_EL1, LOC, 24, 3)
+FIELD(CLIDR_EL1, LOUU, 27, 3)
+FIELD(CLIDR_EL1, ICB, 30, 3)
+
+FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
+FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
+
+FIELD(CTR_EL0,  IMINLINE, 0, 4)
+FIELD(CTR_EL0,  L1IP, 14, 2)
+FIELD(CTR_EL0,  DMINLINE, 16, 4)
+FIELD(CTR_EL0,  ERG, 20, 4)
+FIELD(CTR_EL0,  CWG, 24, 4)
+FIELD(CTR_EL0,  IDC, 28, 1)
+FIELD(CTR_EL0,  DIC, 29, 1)
+
 FIELD(MIDR_EL1, REVISION, 0, 4)
 FIELD(MIDR_EL1, PARTNUM, 4, 12)
 FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
-- 
2.20.1

