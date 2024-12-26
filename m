Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5759398njk;
        Thu, 26 Dec 2024 06:17:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZk/P64zKNt2Iw2NHayu/PtJsvO3XV7v7Zgywk/5BjweO2IxNu5cJwd/TWGzC5xaMywm52TVJL+YmMlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEnfbMzvNF2GXcwD8B7K+Q6Cayiz/BHTWjHZYcyQwqBHxd0tCdRHgEKg/g/eGdMBdQhJfXi
X-Received: by 2002:a05:6122:2398:b0:516:11c9:f46 with SMTP id 71dfb90a1353d-51b75d59e06mr16363009e0c.12.1735222637687;
        Thu, 26 Dec 2024 06:17:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735222637; cv=none;
        d=google.com; s=arc-20240605;
        b=KvLV0Wd8Ns2cUy5l8rIPNLKVFfBvgc5i8MMP8NFZmdenkVm5lrnsnZKPPuPion34n9
         SY9fma2bKfCoTd3+EWeBvSg8BqndQkCFSCqSxBaS01JpXlMPIibJTec3nq2mv332RIx8
         uNR5Mhykfjp/eJIt6op2CLAveHmxNPpPnMramLKmEOQuCM439bPo+3BTp0xTO2oWjAbx
         mP/MrxJt+cZGMA1h1RRwv1PGnCAFMu0uyqPxxZabV2nVEGH50SiKNRx4yxDhCm8v/Yhm
         i0bAiNjAFQkbwljHrU/ufZCGBsOjkl2Y9lr1cN6drX3ZLsknVRCbpJn2s7nhzDrmpwhH
         6qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=A9VQq7hJHHqS4qmfKJY6oReR2E6fQaWX3dFbOJ8lijE=;
        fh=4Sz2A6IY8u2hdYLnZOZRoQCxHhvwWNxClzpeKVvtQOE=;
        b=XaNYQhPLeL9+KGygXfruqOZFA1+t2JugJsQRo5dbaWP1B4/KkIpF2kYWP7MsD9I9Jv
         N4E0sxITtOs0zjj0dH/87BQC/ONkoAA9xw86T4RTPsM34zSEbTeXG70bHlAZvhXwpAnn
         AS0/+NPUFEi3tfYtm3i05HoUuFj9AM0qdWrdHS26GPA2itYyO/66eOK2BswdATVxZXnE
         t2m186ovCUgz9PF6q47vMftmrmQZXUrqbrgiFcClgzikJqHv/EdEP3h2vCYsJ/eLwsWX
         XV/ARk/UlqtGi7CD9y+DyAEpi4+zJ98siml1CVL8dEfNcjfMLnLn7PE/hiN0FqY7xR6Y
         VWhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51b68de790dsi5573494e0c.275.2024.12.26.06.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 06:17:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQofa-0008Vq-F3; Thu, 26 Dec 2024 09:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsogomonian@astralinux.ru>)
 id 1tQofX-0008VN-Lt; Thu, 26 Dec 2024 09:16:55 -0500
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsogomonian@astralinux.ru>)
 id 1tQofV-0007GU-JV; Thu, 26 Dec 2024 09:16:55 -0500
Received: from gca-msk-a-srv-ksmg02.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id 2983A1F46F;
 Thu, 26 Dec 2024 17:16:48 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail05.astralinux.ru
 [10.177.185.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Thu, 26 Dec 2024 17:16:46 +0300 (MSK)
Received: from rbta-msk-lt-328534.astralinux.ru (unknown [10.177.20.66])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YJrKV0vRmz1c0sM;
 Thu, 26 Dec 2024 17:16:45 +0300 (MSK)
From: Tigran Sogomonian <tsogomonian@astralinux.ru>
To: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 sdl.qemu@linuxtesting.org
Cc: Tigran Sogomonian <tsogomonian@astralinux.ru>
Subject: [PATCH] hw/misc: cast nand_getio value to uint64_t
Date: Thu, 26 Dec 2024 17:16:26 +0300
Message-Id: <20241226141626.28722-1-tsogomonian@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: tsogomonian@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49
 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_internal2},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; new-mail.astralinux.ru:7.1.1;
 astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190076 [Dec 26 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2024/12/26 12:50:00 #26919000
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
Received-SPF: pass client-ip=195.16.41.108;
 envelope-from=tsogomonian@astralinux.ru; helo=mail-gw02.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YJn5SwXvdAQF

s->buswidth = nand_flash_ids[s->chip_id].width >> 3;
<= 16 >> 3 <= 2.
x <= s->ioaddr[offset] << (s->buswidth << 3)
<= max_uint8_t << 16
With x << 24 overflow is possible.
Other cases are similar.
Thus, need to cast return value to uint64_t.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
---
 hw/misc/omap_gpmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index 67158eb164..b0a48c71de 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -139,8 +139,8 @@ static uint64_t omap_nand_read(void *opaque, hwaddr addr,
         if (size == 2) {
             return v;
         }
-        v |= (nand_getio(f->dev) << 16);
-        v |= (nand_getio(f->dev) << 24);
+        v |= ((uint64_t)nand_getio(f->dev) << 16);
+        v |= ((uint64_t)nand_getio(f->dev) << 24);
         return v;
     case OMAP_GPMC_16BIT:
         v = nand_getio(f->dev);
@@ -151,7 +151,7 @@ static uint64_t omap_nand_read(void *opaque, hwaddr addr,
         if (size == 2) {
             return v;
         }
-        v |= (nand_getio(f->dev) << 16);
+        v |= ((uint64_t)nand_getio(f->dev) << 16);
         return v;
     default:
         abort();
-- 
2.30.2

