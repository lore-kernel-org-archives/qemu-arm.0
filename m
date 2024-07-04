Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp452424njb;
        Thu, 4 Jul 2024 01:30:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7rUYuNUhMoKd7DxvX/drlWVFjilL/VIt4xO/xukOjiW82QuedjaTpmYp2Dw+Bp5+SkG9CoeIojNOgU9TPmNbIWuMO7Dkl
X-Google-Smtp-Source: AGHT+IGcvt2OE4fInzKIGjW/diphu0GuX8MEjT6bvsB0TA7iTlBAH9PSS9yc60C8c1mQMaStE9yu
X-Received: by 2002:a05:6214:3d0d:b0:6b0:91a4:ece7 with SMTP id 6a1803df08f44-6b5ed03fafemr10957656d6.46.1720081817733;
        Thu, 04 Jul 2024 01:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720081817; cv=none;
        d=google.com; s=arc-20160816;
        b=a9aMloiFzTxOoKmjLbOI5pdpNJ87RkD6ydHwbN8GdxNN1ZLojxKa5+dvQbHilgiZyH
         eGsRuC8egrnYE1LQzXyc7ap4m2WoYk1s4Vm991PAqoDQj2UWb8/IaN3rstVcaqa3U1Rc
         XOmWrB9LlGULlRKJdRprx0ZnU8NVbXGnwdX1nUCPrPNb3fXzxoy1Wupk14boZzyJTg28
         xfMlp8JsZdDAZxXrx5+zMRRhrT6eVX3Jddbu6is8oXFlhCYa3lsOUHSWe6JkLXKpOyZZ
         oHqLcNT2FcuIuV58Q7DWwQ8Fip6qiyTBWrwc+lul3shP9/JIzQkxfnbF/sIcPyzrNg0f
         2v/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=zzL+M/h3q/ClAifOUAjVIa2SXVmh8whSx6oq6EfvUZw=;
        fh=Vva0SnTfFpZ62XWQNW5X4TL2jFj5cBikmg9Gp1PrOrY=;
        b=XbOeJg+/ehj4/xblFtIDBEg2oMdHR6E41hpR5HG+/iEXZDjbXWjLl0hRtv4scUvWXi
         arwaV1ZrPmJKM/wS/Xe/deMeMjsv9g+Mu6Ug8o7mhRPSCT0wtHM2hi+n0nVnmoXfJJX3
         VkrObViJPhNGD2N71wlrbbflGKzNm6vMX1wC0VcJplb0Cws9wuSL5g9XwKGu/TADX2/d
         IhTOe3pqKi9QU41AaLEMYKeASl5DwSzrmibk5MGvjF68pIsDcEl4xYvtYxe0uehyHX5v
         dsVEm/5ZexJxNAdD1hGYn1JyI1SxBPFSvJ3OcBEdmzPp/SaDiFuV/tKdrVFdGUIjPuKH
         SkgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5dd21c954si43038926d6.234.2024.07.04.01.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 01:30:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPHqW-0000Oo-8t; Thu, 04 Jul 2024 04:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHqU-0000OK-Kl; Thu, 04 Jul 2024 04:29:38 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sPHqS-0002HT-S1; Thu, 04 Jul 2024 04:29:38 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 4 Jul
 2024 16:29:22 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 4 Jul 2024 16:29:22 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 1/8] hw/net:ftgmac100: update memory region size to 64KB
Date: Thu, 4 Jul 2024 16:29:15 +0800
Message-ID: <20240704082922.1464317-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5YfPidvhY/lx

According to the datasheet of ASPEED SOCs,
one MAC controller owns 128KB of register space for AST2500.
However, one MAC controller only owns 64KB of register space for AST2600
and AST2700. It set the memory region size 128KB and it occupied another
controllers Address Spaces.

Update one MAC controller memory region size to 0x1000
because AST2500 did not use register spaces over than 64KB.

Introduce a new container region size to 0x1000 and its range
is from 0 to 0xfff. This container is mapped a sub region
for the current set of register.
This sub region range is from 0 to 0xff.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/net/ftgmac100.c         | 11 ++++++++---
 include/hw/net/ftgmac100.h |  4 ++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 25e4c0cd5b..9e1f12cd33 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -1107,9 +1107,14 @@ static void ftgmac100_realize(DeviceState *dev, Error **errp)
         s->rxdes0_edorr = FTGMAC100_RXDES0_EDORR;
     }
 
-    memory_region_init_io(&s->iomem, OBJECT(dev), &ftgmac100_ops, s,
-                          TYPE_FTGMAC100, 0x2000);
-    sysbus_init_mmio(sbd, &s->iomem);
+    memory_region_init(&s->iomem_container, OBJECT(s),
+                       TYPE_FTGMAC100 ".container", FTGMAC100_MEM_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem_container);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &ftgmac100_ops, s,
+                          TYPE_FTGMAC100 ".regs", FTGMAC100_REG_MEM_SIZE);
+    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
+
     sysbus_init_irq(sbd, &s->irq);
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index 765d1538a4..269446e858 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -14,6 +14,9 @@
 #define TYPE_FTGMAC100 "ftgmac100"
 OBJECT_DECLARE_SIMPLE_TYPE(FTGMAC100State, FTGMAC100)
 
+#define FTGMAC100_MEM_SIZE 0x1000
+#define FTGMAC100_REG_MEM_SIZE 0x100
+
 #include "hw/sysbus.h"
 #include "net/net.h"
 
@@ -30,6 +33,7 @@ struct FTGMAC100State {
     NICState *nic;
     NICConf conf;
     qemu_irq irq;
+    MemoryRegion iomem_container;
     MemoryRegion iomem;
 
     uint8_t frame[FTGMAC100_MAX_FRAME_SIZE];
-- 
2.34.1

