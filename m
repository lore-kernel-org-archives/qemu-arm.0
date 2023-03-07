Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5789493ejc;
        Tue, 7 Mar 2023 02:50:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8eUuxF3a+/yIP+zbQXrBu9kGgEWMBBJvlO/EIV4S7u9pVow48A+tNN74//rQTPPVagFIju
X-Received: by 2002:a05:622a:110:b0:3b8:4adb:c603 with SMTP id u16-20020a05622a011000b003b84adbc603mr21850867qtw.60.1678186248500;
        Tue, 07 Mar 2023 02:50:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678186248; cv=none;
        d=google.com; s=arc-20160816;
        b=uEtjbYkiRXisZoX1x62rb9pXwVeo19211DhcDPbOdLAjJmA2foQxNl0a6uhzPI6FBv
         emJ1d32hKe45G+TBufXJTItfc+Pfb7wygosbk+EuQMpuAaqDlCuYERj5OkGBtiP1BAkA
         uGQftLoCmrI+rrBCCmN/H890hBSHZth3pYDeRVk9a2suFvEb/79NCYrtar1t889B511L
         6VbDu1NqcLaNZ5W7/LSm5t7ZNvwzxUlSkyeXGPf+4Pe/+GVSCfuZb5QhDzyrVQftdTV0
         IF2e19Tq/c53JLwHzx3AEhyyj083jNcZPBImJajg0Zqcvl5Dqqh/JFyHbRjedHGmXxoR
         Bd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6ej4/vsCVtl6r1vwYqpF6hQCd0jMrIGhlisU7rXo65Q=;
        b=sJUjg97ITkrV5LRuFoUU5gVKgfxo4fWe7yPy0MCv8GMwouzPN6yxEiK6oXpd/aPI3G
         CodlPHejH9qzz/sFgcEFBwLK9M9TH2zkIM/2g2a7tCCNHtrpBTVb/ydo8bsaGIKYDe6O
         8kVCBY/S8DyPr8/i+6NtjBwUwqfsAWW2cu23Co64Gt9hkjHzehAj6bhET/MXUFH36I5h
         4EYFTvYOvzuU7y7f5UplXavgpUG6x901JtdJwpr7B02gT+Smx7RoTi4ugTTlY6TL+ZYO
         06TY1s5cf0rVv0xx2dVkEPcdw/djE75GUFB+PfC4Y7Y03fucrNiemO+fqv9xTmv5izk0
         DnRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="o/l2WqtN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05622a055100b003bbd8bdb93asi9710851qtx.798.2023.03.07.02.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 02:50:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="o/l2WqtN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZUtm-0006H6-J4; Tue, 07 Mar 2023 05:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUte-0006Gd-QC; Tue, 07 Mar 2023 05:50:19 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUtc-0007vs-OU; Tue, 07 Mar 2023 05:50:18 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 130so7319110pgg.3;
 Tue, 07 Mar 2023 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678186214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ej4/vsCVtl6r1vwYqpF6hQCd0jMrIGhlisU7rXo65Q=;
 b=o/l2WqtNXIhs/tpx7bK3kTOD0wUTW8kkGQ8J5P2rbpc6iq2ToUaOb/LT5Vl3cfqyRm
 7x3YQ/FtdATEa7U6DUCnBMqmURPV0gm9Ko/kSPTvy05dKIouQZSBnDrzuxyVEOxf8O8M
 /V2n7tleoKvWkuMoBxz+or/w+64XpYcY9EJWSVy4+f7psVWl3zBIqEbIB8G1h1/OIFd3
 lbRENFLqYeEFNfes9CJ/wInNyrTKz/00u3W/i8lFQ8Y0zyf65V5haQ8D9rKSH8h6aiT2
 GGHCF0q7mDHpmiLuvfny2vRjFh5pmMbwQp2xaYMdOQa6vFg6FFhLW1vk5D9SGYhMvchB
 ZAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ej4/vsCVtl6r1vwYqpF6hQCd0jMrIGhlisU7rXo65Q=;
 b=xU/KB3nHxEnM0Nq6/wFv9UMAsVkTks9/rIOM88xVe1TrV5TjSjlUPqG04tRYs7UyGM
 BNPE8mzZmTu6JSYTzQMZpdZRQBNfQJCMpkQ/Q7d/yoXP6UKss8Nyasd/QeuXPpPjLwLW
 TP3vPj10TkGydja5miC66emsz1DLVOAR9yIehqjNnJowenPVl5o+lkYshhNAExFamK43
 ZfigYckLXc9p+Y+/QZYhgm5LSI9XUg9W2hZyiLDkE2CXowQ+GEqMf8vx32JlmzoJrtmk
 QTV41VPkH56Vy+OYALVtifa+031djCc7aan4m39QDxZwqApNvKvfGdzJ6oRgruBpuFL0
 xCPA==
X-Gm-Message-State: AO0yUKWWyy5XBfl1hS/ZlKbiIELJG5IgbnXRwefH6JmtTYIeyy3Jiozd
 2ftY6KoYDaiD9KG4IKEGeSs=
X-Received: by 2002:a62:7b58:0:b0:5a8:d364:62ab with SMTP id
 w85-20020a627b58000000b005a8d36462abmr12264241pfc.17.1678186214053; 
 Tue, 07 Mar 2023 02:50:14 -0800 (PST)
Received: from hcl-ThinkPad-T495.. ([2401:4900:1ce1:a87f:e556:a76c:ebd0:7cad])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a62ee05000000b00608dae58695sm7629615pfi.209.2023.03.07.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 02:50:13 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v1] Modified BMC FRU byte data in yosemitev2
Date: Tue,  7 Mar 2023 16:18:34 +0530
Message-Id: <20230307104833.3587947-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TKahgz+4k2AI

Modified BMC FRU data in yosemite v2 platform.

Tested: Tested and Verified in yosemitev2 platform.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
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
2.34.1

