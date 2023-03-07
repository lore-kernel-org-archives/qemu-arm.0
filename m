Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6106273ejc;
        Tue, 7 Mar 2023 07:57:40 -0800 (PST)
X-Google-Smtp-Source: AK7set99HiD8hzRTNnCuhuSN3uTmy3Ukdnz0UvhZSsYtn0h9VqeuxsuwaXCm2N0dc8UKQjvyJdIe
X-Received: by 2002:a05:622a:5c9:b0:3bf:d366:50d5 with SMTP id d9-20020a05622a05c900b003bfd36650d5mr21596105qtb.56.1678204659842;
        Tue, 07 Mar 2023 07:57:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678204659; cv=none;
        d=google.com; s=arc-20160816;
        b=su6359BG6YSYueLsjRdmTc7+Xq5H90AEFMY2pIRk1BmLk7z38O//rJ/9xN9tEiCLp1
         Z3hEbxaZMpCvONylhXnezUcMc9BTZbkxEGESKaDMStGtQoKmQ+RtMUSXLw7pva3udxiC
         GgvzrNr3pqORERKww9VB4QExLUTiiD6V9FjUpZ6pqBf54X14MhwsFowFa6p3wHoqE0Ka
         XGaix2otjPOyfv1tW51U9yt2ee9hsYOxQpadZIyn+8wDzafabmXsxyLPlEen0GF5D70m
         Y5Kwk3IxK9eD8inmTafTk0AVaBEgClNMhYIgBVehrX2IG46NAEY/iq/Ij7pmDkMe87qz
         RE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Tdbn9uA/PPCiSoucdFqvNnsLtgJxlNqEvmfoM+EFyso=;
        b=Sq6yfqXAiZXDXvKpmy1/I3t9YzEsScrXROz6EXJAFU38/ZAEFWDKnk+7nHGwOT9tW7
         /TG14lvJnc/lsvqLJPsV2CbA4TcT4Xba7UbK99yx+fIsbmq4c4e6INiOPu9+6v0+1lN7
         Sw3I1+IBwVBe6LHjQ8Un+RzyDJaQULeYUEkz0mcVB29jWP2ctLUBWlijeVUx+19TM+Wq
         GbmQ9fW7byzcnQwe7Zj8lEJ6VKCofYcEdl8ZsnmAOy9xZzPlmpD8TsoBsK2VF05k9Ykx
         MDMG64vxis2Qo3brqL9BizATIADF42yuQ4Sp8kyHW4y4k9VXHCdj3ZfFmHACg2P6OFA6
         Q5GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a05620a290600b0073baf97bb4bsi10088574qkp.190.2023.03.07.07.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 07:57:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZfZ-0006N0-IN; Tue, 07 Mar 2023 10:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfW-0006Ke-Bq; Tue, 07 Mar 2023 10:56:02 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfU-0000Tq-N9; Tue, 07 Mar 2023 10:56:02 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PWKmM5VVhz4xDv;
 Wed,  8 Mar 2023 02:55:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PWKmK6lLwz4x8y;
 Wed,  8 Mar 2023 02:55:45 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 5/5] hw/arm/aspeed: Modified BMC FRU byte data in yosemitev2
Date: Tue,  7 Mar 2023 16:55:28 +0100
Message-Id: <20230307155528.3655534-6-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307155528.3655534-1-clg@kaod.org>
References: <20230307155528.3655534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=rbq/=67=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V91M1i6/cjys

From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

Modified BMC FRU data in yosemite v2 platform.

Tested: Tested and Verified in yosemitev2 platform.

Fixes: 34f73a81e6 ("hw/arm/aspeed: Adding new machine Yosemitev2 in QEMU")
Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230307104833.3587947-1-pkarthikeyan1509@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_eeprom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
index 2fb2d5dbb7..dc33a88a54 100644
--- a/hw/arm/aspeed_eeprom.c
+++ b/hw/arm/aspeed_eeprom.c
@@ -101,17 +101,17 @@ const uint8_t fby35_bmc_fruid[] = {
 /* Yosemite V2 BMC FRU */
 const uint8_t yosemitev2_bmc_fruid[] = {
     0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
-    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
-    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
-    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x61,
+    0x73, 0x65, 0x62, 0x6f, 0x61, 0x72, 0x64, 0x20, 0x4d, 0x50, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
     0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
-    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x2e, 0x30, 0x20, 0x45, 0x56, 0x54,
-    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x20, 0x4d, 0x50, 0x00, 0x00, 0x00,
+    0x00, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
-- 
2.39.2

