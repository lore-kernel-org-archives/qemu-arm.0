Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178948njc;
        Fri, 21 Mar 2025 02:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUJGKg8OOsHakWDC+dK/TFcETzVQ53p1g8L5qbFURvS6dsX8WSzwRRFKZ9Q4RT1HhX5Q9et/opeBga2w==@linaro.org
X-Google-Smtp-Source: AGHT+IE0GP6cQ7Sv+1Dt7MXtZy+/z9gf38hxE/O4F+UfbLo7DOM517llhGc7ZC3HCgBnmmtmNEw0
X-Received: by 2002:a05:622a:1e97:b0:476:91f1:9de with SMTP id d75a77b69052e-4771de628a2mr35391171cf.47.1742549371628;
        Fri, 21 Mar 2025 02:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549371; cv=none;
        d=google.com; s=arc-20240605;
        b=XuYR4TQkyYFJ6Z1jrOF/jRSJJE+nUG6MIyJNLwJRBZKW4E8ZMW7/U/M5xH9ufAHtjz
         4YK4SP8/Yz5p0RBzZtSiiwNQXkcVaQdrs9fo1bTAH7bP4nFKyQ+ymO5T7dYyzVYor2sA
         rD2AhNKzvLF3OePdXiES7oDHpf97FaWJNrSEsFt9jMM5dbSt3dz12VPgDH8zMzrb2Iih
         8BgldO5NZdbGJew3XSM6/ymltOde7GLio+/aFBxgmgmEhyfTL8BUVDW7EqE0spqZ12Mj
         Z4uxeHJOHDa5l4OrJECOjFZ1tkOOlSKS3y/C47TAXyqM8wvBcGsuQhg4glLaAp3LCjHZ
         zCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6B8CUZISP04P4GbNRFMScKUSnqGTJuzPUwv0qSHkxEE=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=D+KY2lnaJ9eBI0NnuDCXtLAFKnN1GheykVMhKgu3pyUJNK0jm88kFDvGRpFqHxXOJm
         nUSNalGcKA86hORdogTb2cqd+QJToeb4zDbN+GK3xzAM/ylDDPtz+OEu77Ql9sIayR/v
         Mmgp8UHXNZudnpod72y9OJ/ZY1IvXaVXSqq/YR+6ZMsH1kfjmzfgtYc21Oa1LjIRVT3O
         ncG5tKsHPu5I2MhZPM1KHnl9199+qZ+ovVhymlAo/EcDvO15Avyf5NZGAWepIH31pXyE
         IftuSXZTc/+zwA8YUY0g8nS55pAmi8vYNy8URA/xJq/Ofb2+jvLebET6PuXZoq9HXF70
         jTpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d525a28si15763461cf.414.2025.03.21.02.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvYfg-00019M-Fw; Fri, 21 Mar 2025 05:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYff-00013A-0C; Fri, 21 Mar 2025 05:28:07 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYfd-0005jH-8d; Fri, 21 Mar 2025 05:28:06 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:30 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 19/22] test/qtest/hace: Support 64-bit source and digest
 addresses for AST2700
Date: Fri, 21 Mar 2025 17:26:15 +0800
Message-ID: <20250321092623.2097234-20-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
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
X-TUID: iFR8BZlxPjaJ

Added "HACE_HASH_SRC_HI" and "HACE_HASH_DIGEST_HI", "HACE_HASH_KEY_BUFF_HI"
registers to store upper 32 bits.
Updated "write_regs" to handle 64-bit source and digest addresses.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed-hace-utils.h | 3 +++
 tests/qtest/aspeed-hace-utils.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/tests/qtest/aspeed-hace-utils.h b/tests/qtest/aspeed-hace-utils.h
index 0382570fa2..d8684d3f83 100644
--- a/tests/qtest/aspeed-hace-utils.h
+++ b/tests/qtest/aspeed-hace-utils.h
@@ -36,6 +36,9 @@
 #define HACE_HASH_KEY_BUFF       0x28
 #define HACE_HASH_DATA_LEN       0x2c
 #define HACE_HASH_CMD            0x30
+#define HACE_HASH_SRC_HI         0x90
+#define HACE_HASH_DIGEST_HI      0x94
+#define HACE_HASH_KEY_BUFF_HI    0x98
 
 /* Scatter-Gather Hash */
 #define SG_LIST_LEN_LAST         BIT(31)
diff --git a/tests/qtest/aspeed-hace-utils.c b/tests/qtest/aspeed-hace-utils.c
index f39bb8ea48..8d9c464f72 100644
--- a/tests/qtest/aspeed-hace-utils.c
+++ b/tests/qtest/aspeed-hace-utils.c
@@ -157,7 +157,9 @@ static void write_regs(QTestState *s, uint32_t base, uint64_t src,
                        uint32_t length, uint64_t out, uint32_t method)
 {
         qtest_writel(s, base + HACE_HASH_SRC, extract64(src, 0, 32));
+        qtest_writel(s, base + HACE_HASH_SRC_HI, extract64(src, 32, 32));
         qtest_writel(s, base + HACE_HASH_DIGEST, extract64(out, 0, 32));
+        qtest_writel(s, base + HACE_HASH_DIGEST_HI, extract64(out, 32, 32));
         qtest_writel(s, base + HACE_HASH_DATA_LEN, length);
         qtest_writel(s, base + HACE_HASH_CMD, HACE_SHA_BE_EN | method);
 }
-- 
2.43.0

