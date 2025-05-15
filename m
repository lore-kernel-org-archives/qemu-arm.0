Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1692130njb;
        Thu, 15 May 2025 01:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/8hn4fEy5mhCOfZ9JOh0I1pdYRNlgRZFXCXPRdhfLlMHyDCZpxIOwQ0rkebHEB9nsGrqUC+DHxIAYsw==@linaro.org
X-Google-Smtp-Source: AGHT+IFKPu5ldLzlesuBHS9cLW4otIbdpZULV5ZgQ90Ie2IetAYW+F/i8S/yv5umSD1wT0ZccoSE
X-Received: by 2002:a05:622a:2447:b0:476:6b20:2cef with SMTP id d75a77b69052e-494a3435de2mr32511181cf.41.1747296830581;
        Thu, 15 May 2025 01:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296830; cv=none;
        d=google.com; s=arc-20240605;
        b=f3ONuiLbLfps4Bpyf0VfPQVHfke3oUYdNf2RSHkG8o5kri+MYJOVuiMYnzjasC2Fd9
         6902g4F0cGerNL4dfKcQ/+7GpC73h/xw5T4OemeBFjasJtXh0zZwdhrssR17ECsYfCYk
         DslM5XcTBmnk00qqBSVnrre90K00njsX0sfFZA2ytKo9vNZNnTObKpTzIHvjVyMYnAR7
         OlaO080Kg8calRMotodDGEzQeKGULi5JUUWio1vtxrijUqAuJjWnSIf0T8PvgECtHhfT
         5qtx4+VqaHkBbaOfoW7fzCgyfdEv1l5hlIZFiOadRu+o8T3mzeuA7oD8ztL+cwIf/muQ
         lfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=xji1dOiSq6OxJgg0KonpJmvvD1PMV4rM5ncRnDXr0cM=;
        fh=HOpiatFOnx6Qe0fRCbmTPNKe4Ajfqa5KxAPfGCatY1Y=;
        b=AJPiv8fVFeuPn5xhVm1d/YDeO0tD31UJpDDG0JIqzgAbw+0xrEShPvzWAF+9svKuSh
         fnAIbK1k8nXRpkQycBHRAoarSWVBJe3dWry2NLwdaXDlE9+1+sJpT7fHVEtAblCYuLSh
         9EY3lfr664QbQoO7GQd6oiDrjedwkjTszgRPVLll8lO9bIfsDa37F2UpM/ZCsNt4ZbHa
         ugAk2UjGThDzJkY3Tb1q4+iJAh3v1rLATDH+1e2QyF4iGUbXuAlK0gVjhoxV/DpS7IzE
         hnx0YDpYoNuVDSwTqkt52JQtrxHX/XIpL81lnYEEmPvYgIpgnMKg4gkZg584HMpkWQLu
         T2VQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945257e2c0si156288841cf.359.2025.05.15.01.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFTik-0007JQ-S9; Thu, 15 May 2025 04:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFThb-0001Pi-4q; Thu, 15 May 2025 04:12:27 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFThZ-0001HG-Dd; Thu, 15 May 2025 04:12:26 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:17 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:17 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 25/28] test/qtest/hace: Support 64-bit source and digest
 addresses for AST2700
Date: Thu, 15 May 2025 16:09:57 +0800
Message-ID: <20250515081008.583578-26-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
References: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: MV1Sm7a/K0AT

Added "HACE_HASH_SRC_HI" and "HACE_HASH_DIGEST_HI", "HACE_HASH_KEY_BUFF_HI"
registers to store upper 32 bits.
Updated "write_regs" to handle 64-bit source and digest addresses.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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
index 1b54870dd4..842bf5630d 100644
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

