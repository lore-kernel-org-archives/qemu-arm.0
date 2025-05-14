Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1044298njb;
        Wed, 14 May 2025 02:04:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNlXGI74vsOqFDtfv3bXfbi9i2fbbkeoHojPVJGkMNByvDOo3arvHW/hu+cl2JMpJN+hM5kY0PfLneiw==@linaro.org
X-Google-Smtp-Source: AGHT+IFYTJVhkaZCVGw55rM5cO/paU3UTgj+rISKnWoReFGRnYidm+8pO9rv+P0BmCv2dqHJwlFS
X-Received: by 2002:a05:620a:24cb:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7cd2886f374mr454846385a.48.1747213490121;
        Wed, 14 May 2025 02:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747213490; cv=none;
        d=google.com; s=arc-20240605;
        b=QRK0OF21/bhTYV/gr9mFlTAoq3NpazWTMX0JmZKqyZgtetGaiADGidFTYDa+CS0MmK
         YCfSchIpNSsdZ4x4lnRgNP1Jo+HAFYloeowwUGvxEr4aBDL9/hvAcYeyPB0tVz3tpYfQ
         IRktTt6cmTxUrYoSedopPq6VDJsp00kXtmtQPoWV+nTbY8Ilgw1Y/pn/gXSA+JZbYOrI
         kFKleEVHZICeBVbhBTZFDTz4GJGGQeog5rWpthMfdidCyVTqy6rkWku+uvliXn/z78uF
         uKtZ29PEJxvokfRVd6cFvjyvGq+W2+m+hffcmA7pWFufQ/qpRcDjqGWoEKNcdoBfu4Ag
         P+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=F8+3qG6TJGASbBKmtCzvK6zghUCqDPDuCCWa1u3ayKA=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=KaKepAUn0KJMm+SSmWwS3K1ky+I0vVZsU3vuqsN27GI/QL8wOEGTcsNmeHRDCsD26L
         YG/kseu9AtFyx/ySP3fwhhFNoIJKUTqYJvy8S75rD/cCw6kPesgfrbGqOjFSdAM9qV18
         aJab56QASepBP4B6PEWz9NeVoEsJ6UKNkr4WXX0BhdCScK4K36zTGtsFdZMOrhzLYIvO
         57qQ/v85xjEtWIXXbUckyK1jHopWhf4Nv1su4+sBpD1m/SmgBEcC4fcmqLaHtWjkQ2cY
         W93Ll6WlKWQ+ML54k5d3VqkQknd3OrzT+3cLeUEVS57d9fMnJZuPRiZUuof8e8vqL2gW
         zPyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe1aa3si1431619885a.439.2025.05.14.02.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 02:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uF82E-0006hg-2O; Wed, 14 May 2025 05:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uF82B-0006fw-9Y; Wed, 14 May 2025 05:04:15 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uF829-0002Ei-PR; Wed, 14 May 2025 05:04:15 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 14 May
 2025 17:03:55 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 14 May 2025 17:03:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v2 3/5] hw/arm/aspeed_ast27x0-fc: Map ca35 memory into system
 memory
Date: Wed, 14 May 2025 17:03:51 +0800
Message-ID: <20250514090354.1461717-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
References: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JRHd0p1CaUTL

Attach CA35 memory to system_memory to ensure a valid FlatView.
Without this, dma_memory_write() used by ftgmac fail silently,
causing dhcp to break on ast2700fc, as flatview_write() returns
an error when system_memory is empty.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0-fc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index ff64605663..ccba5fc8a1 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -69,6 +69,7 @@ static void ast2700fc_ca35_init(MachineState *machine)
 
     memory_region_init(&s->ca35_memory, OBJECT(&s->ca35), "ca35-memory",
                        UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ca35_memory);
 
     if (!memory_region_init_ram(&s->ca35_dram, OBJECT(&s->ca35), "ca35-dram",
                                 AST2700FC_BMC_RAM_SIZE, &error_abort)) {
-- 
2.43.0

