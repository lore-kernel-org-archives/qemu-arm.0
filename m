Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp324659njc;
        Tue, 20 May 2025 00:36:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtXqg3y1tBJYtQihRswatRxmciPUK/08+bYh0BqQ0MuiPjLUZNWnMReRtjqtyaUvwcrODJCIo0CQgwvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFFnvo9zDcMCjQgoEFkQHheVSITwZLrDcCC1J0f0jTCekWVecy/1nCft8pa7urr4TbNfudg
X-Received: by 2002:a05:620a:2586:b0:7c5:e226:9da2 with SMTP id af79cd13be357-7cd467ab717mr2533526685a.47.1747726570311;
        Tue, 20 May 2025 00:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747726570; cv=none;
        d=google.com; s=arc-20240605;
        b=XZAXDZw7X6VNoOjTkqiIAmWv0/LBFc5dVkICjmde1dchzBebmoHt/axwXCRUxTyqZv
         g9kqKxYZUWPani9Bbp5rQMZiXuTFH4/KoF8rqinJOiLVAnadfSGhdOYWeLYk5aEqnF2T
         MtNIuinYcEkJyl/UISLKWqrp9+8vnyzZwP7qbat3xJLRC+0eGFiwaO9e3K0AjrQXiBMM
         P5QlshWpUPOuhZgYyHtFY5KC1hBseH5g0QYJQ0dvug1JMGQugOqVcYnq7UM820mqQhxI
         yfZOTJNPWNJnYYmijPmiueQ+rwsc2RY+jrAVRK/xFOwbE/6xDkwT0tZ4TbD7gdOtrHaC
         Cw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=LJMMqeQLzYKcRFhIUcoqLyenpT9AUlN9oR5aHYfF0VM=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=RNEOYpiQwHqO1VBVOb1mDbJiIFKV+U4wHQcGel3tdknDlM3QxTSfQbrh4Khk9PsAFB
         yrx7fWZNmGeGL4+cxtja/nZzqGVrLX2XRI8ZyPWPbZLy2/G1gl1ZKd6GCxpW7T1nV3XO
         v9mOgQXm0eNhZMHHQQP2WFxusMkvF1R+Cp7G/CU/isGd/zWwRMWaGRl2Z1T8OTP2/rJN
         g2Hsezob2P4NWGvOQTXuWFM1zOlyu+4jMELbov9W+DFgYbQQHu2CfLQeahpcmFhH3Mwp
         41waWIwlkDuhPhaB7OXeTVetRTC/kcq9PTMOexj84zVPrtTGy0nHZU3SdpPLM8acv0V5
         hvfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468d588fsi1023413085a.581.2025.05.20.00.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 00:36:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHHW8-0002T8-4l; Tue, 20 May 2025 03:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHHW0-0002Ja-31; Tue, 20 May 2025 03:35:57 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHHVx-0003tR-NM; Tue, 20 May 2025 03:35:55 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 May
 2025 15:35:40 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 May 2025 15:35:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 1/3] hw/intc/aspeed: Set impl.min_access_size to 4
Date: Tue, 20 May 2025 15:35:37 +0800
Message-ID: <20250520073540.2014240-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520073540.2014240-1-jamin_lin@aspeedtech.com>
References: <20250520073540.2014240-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UD/f7kXUJy/b

This patch explicitly sets ".impl.min_access_size = 4" to match the
declared ".valid.min_access_size = 4", enforcing stricter access size
checking and preventing inconsistent partial accesses to the interrupt
controller registers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/intc/aspeed_intc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 33fcbe729c..19f88853d8 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -737,6 +737,7 @@ static const MemoryRegionOps aspeed_intc_ops = {
     .read = aspeed_intc_read,
     .write = aspeed_intc_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -747,6 +748,7 @@ static const MemoryRegionOps aspeed_intcio_ops = {
     .read = aspeed_intcio_read,
     .write = aspeed_intcio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -757,6 +759,7 @@ static const MemoryRegionOps aspeed_ssp_intc_ops = {
     .read = aspeed_intc_read,
     .write = aspeed_ssp_intc_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -767,6 +770,7 @@ static const MemoryRegionOps aspeed_ssp_intcio_ops = {
     .read = aspeed_intcio_read,
     .write = aspeed_ssp_intcio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -777,6 +781,7 @@ static const MemoryRegionOps aspeed_tsp_intc_ops = {
     .read = aspeed_intc_read,
     .write = aspeed_tsp_intc_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -787,6 +792,7 @@ static const MemoryRegionOps aspeed_tsp_intcio_ops = {
     .read = aspeed_intcio_read,
     .write = aspeed_tsp_intcio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.43.0

