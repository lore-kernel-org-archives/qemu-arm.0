Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp612104njb;
        Thu, 17 Oct 2024 22:33:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQZPw6D9HG+8Hy+4njXU8R/mnGocDlTPSWSSrI0tSvSglDaoQapa05vJvxxuLOzbpf0tvKmePWEyUV9g==@linaro.org
X-Google-Smtp-Source: AGHT+IGoV+nEc7TwbQ80QUMFuS+CUV2qLUZDgHz+aWwJ2qvEuXdYnjw8/vjrWXhPk6mo3b1TFxSA
X-Received: by 2002:a05:622a:214:b0:460:abb1:63b6 with SMTP id d75a77b69052e-460aece8a0emr16778111cf.9.1729229601452;
        Thu, 17 Oct 2024 22:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229601; cv=none;
        d=google.com; s=arc-20240605;
        b=ERXcJ/Hd5CnfwBre3nX86rp4DpVn1bv1SNRAe3ITYLjE3L3Si9tO1XUfWGuxPIlsnz
         59IymMq+gSpu8sp+D69B6DLP9/HNzCF+D25uA91BQ5FvkzZmPR8jIwqM66JCPl8vAeZn
         tc65XNePz9cp1fAZWJhfq6sihg5EiPf+QjwKXER/qI6fZJ4oEEbrBwAg5ElzeBYyHgYH
         7CwcAb0pS48C0YQKzOYlf4wiPHc9H5vhEK/nSXqXOTbp8smg29G9O7saI07QAAuqlCC5
         U5J6E9NGfDZUCljSxGjKNgjXK8qnQnFxwgMNnxpqbhBEqU7DZ1DnF4ie5n1qqwTzSiQb
         BeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=pWqikRL0uH7M0i3W73whBoymvn+yZvgycOTXzg43zLc=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=ItYFjaYirp3Yh7tGLkMXJ/pZhov/xnH4q+fw7NbvyW9w/nO75yki4NmEgT2GNNJ6kc
         GZF3MdKpMl3vifZT2wrYohUZPvY7fjZbK53meLGazI1BOtQ3gnl1V7AAqKFSm86SwqVW
         zSrXhWZFVPvAw7FKsYGojh2qVazfhgK/PIkIgH2Sh8M3qhY2XUQNsQtB3dOcr9LWuBwN
         i3umWbSKKo8yOAGodjqNUEWAX6ukMQ4D/D+nm4dsoR0gbJ5k20oqoA81iRsjGpTjbkeh
         yfvNhHaKXp0yjqOUv1m/kFdIAlX/HFxo6p+Jz3igfDRrCX5w879xiI97SsMLZ3WV9y3W
         jSmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460aeabe94esi9719361cf.710.2024.10.17.22.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t1faa-0008R8-K8; Fri, 18 Oct 2024 01:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faL-0008Hb-IX; Fri, 18 Oct 2024 01:31:38 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faK-00089Y-2O; Fri, 18 Oct 2024 01:31:37 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:13 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 04/16] hw/block/m25p80: Add SFDP table for w25q80bl flash
Date: Fri, 18 Oct 2024 13:31:00 +0800
Message-ID: <20241018053112.1886173-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
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
X-TUID: hKBiEvw963os

Add the SFDP table for the Windbond w25q80bl flash.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/block/m25p80.c      |  3 ++-
 hw/block/m25p80_sfdp.c | 36 ++++++++++++++++++++++++++++++++++++
 hw/block/m25p80_sfdp.h |  2 +-
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 411d810d3b..e2e84f8b5f 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -356,7 +356,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("w25x64",      0xef3017,      0,  64 << 10, 128, ER_4K) },
     { INFO("w25q64",      0xef4017,      0,  64 << 10, 128, ER_4K) },
     { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
-    { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
+    { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K),
+      .sfdp_read = m25p80_sfdp_w25q80bl },
     { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K),
       .sfdp_read = m25p80_sfdp_w25q256 },
     { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K),
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index 82d84cc21f..a03a291a09 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -404,6 +404,42 @@ static const uint8_t sfdp_w25q01jvq[] = {
 };
 define_sfdp_read(w25q01jvq);
 
+static const uint8_t sfdp_w25q80bl[] = {
+    0x53, 0x46, 0x44, 0x50, 0x05, 0x01, 0x00, 0xff,
+    0x00, 0x05, 0x01, 0x10, 0x80, 0x00, 0x00, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xf1, 0xff, 0xff, 0xff, 0x7f, 0x00,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x42, 0xbb,
+    0xee, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
+    0xff, 0xff, 0x00, 0x00, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0x00, 0x23, 0x02, 0xa6, 0x00,
+    0x81, 0x6c, 0x14, 0xa7, 0xed, 0x61, 0x76, 0x33,
+    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xa2, 0xd5, 0x5c,
+    0x00, 0xf7, 0x1d, 0xff, 0xe9, 0x30, 0xc0, 0x80,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+define_sfdp_read(w25q80bl);
+
 /*
  * Integrated Silicon Solution (ISSI)
  */
diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index 89c2d8f72d..35785686a0 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -25,7 +25,7 @@ uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
 
 uint8_t m25p80_sfdp_w25q256(uint32_t addr);
 uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
-
+uint8_t m25p80_sfdp_w25q80bl(uint32_t addr);
 uint8_t m25p80_sfdp_w25q01jvq(uint32_t addr);
 
 uint8_t m25p80_sfdp_is25wp256(uint32_t addr);
-- 
2.34.1

