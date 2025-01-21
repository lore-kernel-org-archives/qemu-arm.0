Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6494792njn;
        Mon, 20 Jan 2025 23:06:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUp5U34QqoJ6L4FsbJRybR7C3eRwcjhLWJUro9kbcqeABf9Q49I1V2lOxp+QWRlYKv/1vX42ZYnx/oWtQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH7i9ggmkUZMtm+xOkdR0awTAk+tY39sMklsvX6p3lJlTxafxTpF6hD+137TkZbUOssJkHq
X-Received: by 2002:ac8:7f16:0:b0:466:af35:92d5 with SMTP id d75a77b69052e-46e12aaf834mr241811571cf.25.1737443196624;
        Mon, 20 Jan 2025 23:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443196; cv=none;
        d=google.com; s=arc-20240605;
        b=FTjsPY4yj9pFrSPV3IqpgocI9rc9Ea3cIA4OZFTguUcI4p95xJwf3MuBWgaLnrylnQ
         aouL1On3kfZDVgLKmmfpSvwAukwa4YYnSuq93kbmkOL2mfCRnbHqtVrQ6QWTjK4Ma5mr
         QiXXgIJcrDyCF5WsvU0H3ltp47YoV0TS0M0bKixmlLVpDGTk25ah03w5CnI4N2AT227i
         7X8CfYHz9cMnQNZuJ8hMfANwS9mGXcWEoQG0+i4/0SEkw9BrvdSaoBhBUP3jPx4eN+A1
         kedvYRUKWvptVRfFsQCakUWQ++TTUs8PR3YhRJqn3HpGkt3n3RfSUZB5LRqntQPuuWi5
         2sUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vD7PZOzUUkUcdytg5plKPPu2/5GMyUipxcyEz/Egbns=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=fIbkJ3oR4Tk/xHIEStOVfnC4EhpyLzqH7xVaDyt8QfP6yr86o8al+qtn2Obs5EOPVZ
         EwCvNCO5TdUZO2m6MBRIt+EakgZv++9cvCFlnWKYWR4HaaXlLZ1BtHj+d/dHI3mySXPj
         xKo7BInNrhvn3XLiy6U7MPnSy28ePewbirfd6iqu7PeXj0LpnGSXtcY2pC4TFt8Wps8f
         g481kWlxpTJSLHSuwihy/0/0KHadGJ63Cwp5RdoxJXNKlsW5f+EKLx3GwtKZJbTAmDRO
         l06nDnF/gQ6EG92o/MXNKEHyd+6kzBdrrzY2bk0/mb9DTLNJHfhep5EiyuiuSXjJRhoS
         xi4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e104bca45si116124421cf.648.2025.01.20.23.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:06:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ta8Kp-0008ST-KX; Tue, 21 Jan 2025 02:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Ki-0007zu-1C; Tue, 21 Jan 2025 02:05:59 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Kg-0001eA-L1; Tue, 21 Jan 2025 02:05:55 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:29 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 15/18] hw/misc/aspeed_hace: Fix coding style
Date: Tue, 21 Jan 2025 15:04:21 +0800
Message-ID: <20250121070424.2465942-16-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: Y0vEQHNh0REs

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

