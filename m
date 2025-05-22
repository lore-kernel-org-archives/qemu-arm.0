Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1583639njc;
        Wed, 21 May 2025 19:33:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3bD+DtpwhT0LOEoGclPustQwugEbXaSrHhBzFT78Eh0Ms8pX/e40UNQP7f0bqdktTrEpR4xN1mq2V0A==@linaro.org
X-Google-Smtp-Source: AGHT+IHZTeWGuuPIzsWwNH6cJfbkJJ3k/CcWvh/hSxtp7OyIhTxymot+PUqu4KsqZgKXafYwJRfj
X-Received: by 2002:a05:6e02:3784:b0:3d9:6485:39f0 with SMTP id e9e14a558f8ab-3db842bd205mr234159745ab.9.1747881224113;
        Wed, 21 May 2025 19:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747881224; cv=none;
        d=google.com; s=arc-20240605;
        b=fseZQYeCaqe5ct2aGiLObX8OXFGWH/bPKAtkaN6XZdeK9s60F5b12f3WyAy0bmnhyh
         je34fCi38CQgTvQoEWyxt4BPTv91IpZaZzg+E5wuJQCuQc2WFWN4sA7axyok0h3DhRwR
         voosoig7t+vZsX9OmTHlLZe4ZkXuwyr92TjskyWUVlXukHG8S6heekAw4KYvPA3g7h03
         TMvIXVQV6j7AzfApBGL2MmdPPA1YJEzyRsvaXIAXr38SeK4afmOTQdgC4NmAjT9PkXAL
         +WL1DycgFu2e0pBexkOtlzuom6DQqQL5/8gd5Zd6AHiuZTszX3wRUBJL52kRFtfMkjiy
         s2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JIUwWoojE8GKsABD7MQuLGxqDCkGPBrJEtf+woUoHPo=;
        fh=no4a9QA/0zeIocEYrBrieE6XYIGB9KPekpO3W6wNjNE=;
        b=ZSCN/tzOdSPV0h0DwZ33Y52RkvvKNzXxiIV2jCKnbOA6UCe6ef9eu8gWC1YkMoR4j1
         H7CkqmEntnFiZ0P3XfwWbLdWjf7LGmRfOUk1McQHX6E6124Cd1FzM4hGuAx1LTnhe6W9
         fzGrhjnxaPO94bY4rOsApOG/bdAcchPp4bs8827LDqwDkaqPHealc5mwQ7eaM+LdnL9W
         hsADYrfVIMPHB96nsEz5Q908rjZPBftNnkkGA7SnV9392Qu7RVXMXyE+RCYgSwO0xpaD
         9/B3q2oNs0iP/aG2g7e6QndJ3bXbsQXmsQpwUUUGQ6LJ11trh0QwnDjKkJYPZtg8urs/
         QiwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3dc8a2cd540si27987765ab.55.2025.05.21.19.33.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 19:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHvkV-0003KQ-1z; Wed, 21 May 2025 22:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHvkF-0003J0-QG; Wed, 21 May 2025 22:33:21 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHvkD-00010W-Gl; Wed, 21 May 2025 22:33:19 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 10:33:05 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 10:33:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 1/3] hw/intc/aspeed: Set impl.min_access_size to 4
Date: Thu, 22 May 2025 10:33:02 +0800
Message-ID: <20250522023305.2486536-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522023305.2486536-1-jamin_lin@aspeedtech.com>
References: <20250522023305.2486536-1-jamin_lin@aspeedtech.com>
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
X-TUID: xtSfbwdZNdRC

This patch explicitly sets ".impl.min_access_size = 4" to match the
declared ".valid.min_access_size = 4", enforcing stricter access size
checking and preventing inconsistent partial accesses to the interrupt
controller registers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 33fcbe729c..19f88853d8 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -737,6 +737,7 @@ static const MemoryRegionOps aspeed_intc_ops = {
     .read = aspeed_intc_read,
     .write = aspeed_intc_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -747,6 +748,7 @@ static const MemoryRegionOps aspeed_intcio_ops = {
     .read = aspeed_intcio_read,
     .write = aspeed_intcio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -757,6 +759,7 @@ static const MemoryRegionOps aspeed_ssp_intc_ops = {
     .read = aspeed_intc_read,
     .write = aspeed_ssp_intc_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -767,6 +770,7 @@ static const MemoryRegionOps aspeed_ssp_intcio_ops = {
     .read = aspeed_intcio_read,
     .write = aspeed_ssp_intcio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -777,6 +781,7 @@ static const MemoryRegionOps aspeed_tsp_intc_ops = {
     .read = aspeed_intc_read,
     .write = aspeed_tsp_intc_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -787,6 +792,7 @@ static const MemoryRegionOps aspeed_tsp_intcio_ops = {
     .read = aspeed_intcio_read,
     .write = aspeed_tsp_intcio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.43.0

