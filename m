Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp58395njg;
        Mon, 24 Feb 2025 23:57:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVF1OWGZdm+DyxesZnLfFsneiAoIavqQfGG0HICB9zHMHAazpt6zZkta05HeqMY7+wMObpXSFJfEtXB1w==@linaro.org
X-Google-Smtp-Source: AGHT+IEB/h/2gbA46u6QpCPrcncjP4pzrYzovPNivAhXXs3+dh45YcO/h+cAFsK0aGAMSfpjD9XH
X-Received: by 2002:ac8:5f8a:0:b0:472:7a2:c3d9 with SMTP id d75a77b69052e-47377227edfmr34513641cf.23.1740470226215;
        Mon, 24 Feb 2025 23:57:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740470226; cv=none;
        d=google.com; s=arc-20240605;
        b=UAEJhkOkhXpBkd4M1sbqncVnBpnb92If9gj5ga6CCtyd5hfnI3a56MmMqyRY3aF++e
         2oiEkLqzBH67OM+FnVfMq+DFNMiSssUYS4YNcjN8Mirs3qcTC2DhW+mlqCpW/OFU1mDG
         XQMRMmBWfrccHKEo1Xhny+4Kwg+h8ZKcYJW6RZa/Ez+QQyEuS8Wg5JU4yzUGZ+oKkc7Y
         eJ8zVboFIVqWv11/jvVrQCDhzJuVRtvrWQ8SrMI/u2zC4/T0RgwjkyRwzoE3dExB0tGG
         Ch6B+EHn6Y2Hu+NmcHyYFOSNZ8X+LcSJ7g5JZUSU6NgeCz0uSvsoXRubccIjMo1oOkqY
         kGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=avg5SVwFUvIET4I0MJI3Waq2JihAzXcndhsubPiEgls=;
        fh=no4a9QA/0zeIocEYrBrieE6XYIGB9KPekpO3W6wNjNE=;
        b=iOjPm0NAW8kVeKJlw0PI2DyF6H313B8vp2CTx44tzo3TlmXqzvHbt1t8JaBhpT0546
         hw/Tf772SIp1BAXm3lt0WHCff6QksdmjRCs9N3AtuGtaEMvqe6XInUmdsWR1KHHmMsD7
         gXFO9bysCxWah2uZnWUAarnOPYuVX2AMbBYIXD72iuCA50vFg90fVK4qlmg1bam453nZ
         noV0B4/iWwgIsFDC/COBX4KGcbDUcCyR3w6d8hNToj2Yj03VuNEd7eJJvzv7cyR/+TTw
         OdmUzfzYa3HxX6Sj/vIwEEas4SWqhb5TVuOFuQlM/jZIfCIYjeeh4QuExQL7vWeoZRke
         u85A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-473780a77cbsi9816171cf.518.2025.02.24.23.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 23:57:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmpny-00011I-U8; Tue, 25 Feb 2025 02:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tmpnv-00010k-79; Tue, 25 Feb 2025 02:56:35 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tmpnt-0001io-OB; Tue, 25 Feb 2025 02:56:34 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Feb
 2025 15:56:22 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Feb 2025 15:56:22 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 1/4] hw/misc/aspeed_hace: Fix coding style
Date: Tue, 25 Feb 2025 15:56:18 +0800
Message-ID: <20250225075622.305515-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225075622.305515-1-jamin_lin@aspeedtech.com>
References: <20250225075622.305515-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NOAftraFlnK/

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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

