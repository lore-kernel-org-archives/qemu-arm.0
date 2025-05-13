Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp324250njb;
        Mon, 12 May 2025 23:36:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxBosiHEcYFI+Yvi59lGprfYfTNUKiixaoY5928XSSBLo57Z1zs4Njc3syPH+3kzoIRbB/dh3JO2/CRw==@linaro.org
X-Google-Smtp-Source: AGHT+IHw+6g2Qto0dmD2tV2NAqhn+NRSIKZzI/Kv4oKb0NcLxnSjTmU8l59PMIK7jN7gkjntmI8P
X-Received: by 2002:a05:622a:4891:b0:48a:bbd7:19c2 with SMTP id d75a77b69052e-4945273c366mr204018401cf.15.1747118157066;
        Mon, 12 May 2025 23:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747118157; cv=none;
        d=google.com; s=arc-20240605;
        b=PA9Aj9HARIh5JJFtmQ/aZA9rjpUjvkKJePMRVB+mgTyWMuN3D/fLshx4jNVARk2xNv
         H50S7JaSg75jsK1twygEeNlRhw8x6IXxd9Clbzi1w8G9bMeRtDlw6nyK5RmjWVk8wnEV
         B416J4TsQ49kdRz7/ULtDLXIkDPH+NdXdKv0gh50lEIdkmrEKp+vZoyFT11EGAmBWzzK
         t1fdRzyD99HjmFpAb4nR+9c44hns+rZ85rE0UDLTfksWMVdtkaeUCIjASHCCSSvpttSD
         65V4PaaoEBpDhUUQWkwn1HiQWHFE6WmyzW2NuwClYVXOiCKO3xGD70csVJvr2evyZcd0
         azVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=xji1dOiSq6OxJgg0KonpJmvvD1PMV4rM5ncRnDXr0cM=;
        fh=HOpiatFOnx6Qe0fRCbmTPNKe4Ajfqa5KxAPfGCatY1Y=;
        b=Gr1IHUnDVKKmYHV4+g/fqIX2s46egXmCtqsVwTqUGUQ3P7jQzz15kfgOZNkqH8LShK
         oz1uNDjRn0DCBFTcKYbWybE2zTqUW7gGUQ5VCaryvqcN3aJwEoOD6kYDvNt6tv0XwDk1
         KqsfwnBOx7+OnkAuuArb+jva34dmYPrEs7Kc1FP+qwWG79m1q0yP5goDpHR0Vj+asj0J
         3Rga+lZITS+lZ/Xs3HQsUf+hGqvBxYaoqBGjl+gn7i43BGAFhgMkrBY8mA6GGCcoe5N+
         9zexzn7cETt5bi8vaPDShvfzIc9RajN43RN8o7Xq2PC3dWtGag9H+QSmZYBZaHfKbkrg
         3vLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452581e5csi109953651cf.433.2025.05.12.23.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjDW-00009h-FQ; Tue, 13 May 2025 02:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjBR-0005nT-6U; Tue, 13 May 2025 02:32:12 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjBP-00029w-HT; Tue, 13 May 2025 02:32:08 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:10 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:10 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 22/25] test/qtest/hace: Support 64-bit source and digest
 addresses for AST2700
Date: Tue, 13 May 2025 14:28:52 +0800
Message-ID: <20250513062901.2256865-23-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
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
X-TUID: UpvrMfQLWpNU

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

