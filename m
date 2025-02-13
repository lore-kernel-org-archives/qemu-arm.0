Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp345034njc;
        Wed, 12 Feb 2025 19:39:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWt9LumxBFQPBzkZjoP4mlR3s/eOu4wL+G5V/7y6Prg0qzKoryWuVGrdayElQe1p3c1potYdeWaapZXuw==@linaro.org
X-Google-Smtp-Source: AGHT+IGVFhl0NpjDAVIkhQka4NeeNyWuwz08IdSCOU/U5k0P4dV+5oZ7McqyArZwTYpiyTVhUMTr
X-Received: by 2002:a05:6214:1c42:b0:6e4:3faf:3647 with SMTP id 6a1803df08f44-6e46ed82fd5mr90261536d6.15.1739417952531;
        Wed, 12 Feb 2025 19:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739417952; cv=none;
        d=google.com; s=arc-20240605;
        b=O0LYs92fg/SCCZUu7ikzWL1VUcy5AXXBI5vnxZQpmdzIx1P7M57A746I6J10zlIMBS
         56JoCp8auqjLGTJ0T6JAPijbT21rJFyOgEMdKm5nR4ZDlCqoSKYipMqOgajFuf/iQn6s
         oHnWoMH1AUjNtsmV5N2x8r8wm3ICHZOTH1kKyTeAd9X8MJ5+yC74RvOksJE/Fdlid51l
         tLKhAH12fQFOELVkHRk1FpMC11q+xPw0nNQPlXYtU40Z/5IYqRVzKFKICwpU2sqXDNf5
         aTmCxIVU3ilmfnwvL5Wpp9TGkBHDql44yMA6J5C1I+SoeYseglcKuEvOwmWJxDaGsw2b
         vZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vD7PZOzUUkUcdytg5plKPPu2/5GMyUipxcyEz/Egbns=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=U3Nn0PBuYTffbRxdivIX/7q7A1tNJqxVmlMEBX0yhXZq1/6dtCrhgDsRej57Eph9U9
         2j1DBTv1NnI7DC5S+DT0jxUpBtkFx6JzEBDqACdNmKH46+HWtxANTe30NaDcOOtfOUFe
         pvf3LpjD7FaFAdLjtgbrHd0IK3KzaWh3xzf+Ev166QSLzDijASVg/HdhSg0205bAb8qu
         8tXw9qnbcIKtZp4cOFbN0feUSUXxS4R0gvIMtVSLWYB59fOLLc1PfF645ojwP7SQ21+d
         PpQcJ3Pi2PcIMVdhlRNOy2ewDBQT4bqKHuzaN99DpbFOW7oFMy+fs4Ti/JQZtEuWhQAw
         1ufA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9baf33si5846106d6.278.2025.02.12.19.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiQ2Q-0000L7-Pu; Wed, 12 Feb 2025 22:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2H-0008KZ-BW; Wed, 12 Feb 2025 22:37:10 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2F-0000nL-Tb; Wed, 12 Feb 2025 22:37:09 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:39 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 19/28] hw/misc/aspeed_hace: Fix coding style
Date: Thu, 13 Feb 2025 11:35:22 +0800
Message-ID: <20250213033531.3367697-20-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
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
X-TUID: oJzNqWYK7Ofh

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index e3f7df2e86..18b85081c7 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -75,9 +75,12 @@ static const struct {
     { HASH_ALGO_SHA1, QCRYPTO_HASH_ALGO_SHA1 },
     { HASH_ALGO_SHA224, QCRYPTO_HASH_ALGO_SHA224 },
     { HASH_ALGO_SHA256, QCRYPTO_HASH_ALGO_SHA256 },
-    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA512, QCRYPTO_HASH_ALGO_SHA512 },
-    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA384, QCRYPTO_HASH_ALGO_SHA384 },
-    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA256, QCRYPTO_HASH_ALGO_SHA256 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA512,
+      QCRYPTO_HASH_ALGO_SHA512 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA384,
+      QCRYPTO_HASH_ALGO_SHA384 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA256,
+      QCRYPTO_HASH_ALGO_SHA256 },
 };
 
 static int hash_algo_lookup(uint32_t reg)
@@ -201,7 +204,8 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             haddr = address_space_map(&s->dram_as, addr, &plen, false,
                                       MEMTXATTRS_UNSPECIFIED);
             if (haddr == NULL) {
-                qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "%s: qcrypto failed\n", __func__);
                 return;
             }
             iov[i].iov_base = haddr;
-- 
2.34.1

