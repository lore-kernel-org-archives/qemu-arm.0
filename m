Received: by 10.223.161.27 with SMTP id o27csp234544wro;
        Mon, 23 Oct 2017 13:18:07 -0700 (PDT)
X-Received: by 10.129.226.7 with SMTP id p7mr9590628ywl.27.1508789887322;
        Mon, 23 Oct 2017 13:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789887; cv=none;
        d=google.com; s=arc-20160816;
        b=EoUMdROkcct5rHvMQvqFm0DutR6/dE0GXN5YiJoaj7HvF3L4xzyjNpf9Cc/sPE5CRw
         JaDSDLA9Ssa+voiRTgYwj6UWIvHyoiHBrbIiagJoHN3IgP1PQGHPYIHUsOXVtUx4vBBB
         ujiIix22gPjx2epxdeoJ3Se7nq0II+wJqW3T4YgTAuCteqPe0EnuQKGQ7ddKh6TS258U
         wiDXLOBLgej3l1ul6d1Ii0709fmDVKcUlxmSd09Sn1dWtcOknQPcWqLsVNrvlECsic1p
         pXKfBTW7WFN4NX0NuF5GRpBwicWjJrT6rW3rNkwV4s2j2YKj7OtRg2IlMFixQW5iJRX3
         c1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zmFol33kPLVHCkj7Ro+lVg1LTAQod/G9dNqJXtckibI=;
        b=WgTT9rdH3kFEK/AkClSnnMzQxwlT6zFg9g6uH33Lkx9Ja6ETgatdRq99QDn/Ny0WAW
         pinIvo1XCsip7rvl1eKpZWzkI9N8TGEIpjD6n6Eo5d6mRS6DW6G42HLqkGJ8iztsbIBy
         VlO3ymd/zqnj/G2qqDUhbahFDlCRGaSQqB4Igk1AGx8udWmkNZpD+GlqTgzHFZpVgcmq
         2f+I/6WrilhDvW2u4SSuqI3Q8MdSUIX9OP2NrI+g9h7Z7muwBLHrTl284UITEA4O+eQ+
         s6EtlsOWIoAZIz8dGaVGlMHCjMNajrbwybOgo3C/7BsuCD6IAmLLxJEl9A5eRJrayy6S
         69bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D49+KCts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si1333084ybf.694.2017.10.23.13.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:18:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D49+KCts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jAk-0005oz-Ku
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:18:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4K-0000F7-6v
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4J-0002VW-Br
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:28 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:47361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4J-0002VQ-5h; Mon, 23 Oct 2017 16:11:27 -0400
Received: by mail-pf0-x241.google.com with SMTP id z11so17896780pfk.4;
	Mon, 23 Oct 2017 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zmFol33kPLVHCkj7Ro+lVg1LTAQod/G9dNqJXtckibI=;
	b=D49+KCtsebdshdA2kxqNqCWLEOTSRXI61CbfBrS3YYbGspt/3vTIRCLSKNhICr2UOc
	7BhLXRtMKhn2gomHPqqSHOSp+hB5XtMmBNpBpkQyXMHoGkgmjg0IIF02Vzn4i2QzP8C9
	0SDZb6VYnz70J5HY0KZwVfQ+Rc5qgJEfcTHzuzZ4qHcbXxPHYCGYo1yDG6bEULNp2sRB
	GekoCKine5V1Uc+8aKmIeQA3zTXj2BLYqIQFi3UdiEemj94Gs3UFkEkV3kTtCBwBVYep
	CvtbjBMI4Kb2Rcyb7taNS1PwjoXo4nzyPqSftf5CtxE3FYQ6pSHkU8H1cqi4os4RgACQ
	6rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zmFol33kPLVHCkj7Ro+lVg1LTAQod/G9dNqJXtckibI=;
	b=kG94Z4+JpBMpVNtWIASASHAaqcxeUgqF149vlfmPjsUsUZoE69zK/Xq8lz25p+TskP
	u+sFtsuT//gIM/gFEeFYPBUEECFh+cSu6vYqjvy7W+o1dt0CkQS0K4sG2a6PDeXTc7Dw
	YOmEEgzEW+JtEp27yE8L5Yiur7k9cMnq6AGsLtrNa4leHN8KfnBLpZDJ1w2BTVAST/Mt
	p5OmcBALM2s2PfVxV2AqFIC03+BUkFo78Yl0dJkT95uUWQvXOrYnhrJGikBOpxfe2GEl
	dX/N0knNvw1ILQigiiD7mTg2pWBXXdi9ncxWFbWGav3NFgMuMj9Le7dhMerg+f0Pqzqq
	uMRw==
X-Gm-Message-State: AMCzsaVtdnaUNbjj5huOSI8ibhSVAiVnF57PiIS4oVle1IVoBcH6i/W4
	sAtvFi/nF5bYIYfQxgZMU93rvmMn
X-Google-Smtp-Source: ABhQp+Tw1GtSPaSw51tZkI3AfiuyluStPI8C5/3esBqFkirOMfsjtlRNoBcr8lgEf/55RwhQLiI5mQ==
X-Received: by 10.98.65.218 with SMTP id g87mr14269292pfd.105.1508789486104;
	Mon, 23 Oct 2017 13:11:26 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:25 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:38 -0700
Message-Id: <20171023201055.21973-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 10/27] imx_fec: Reserve full 4K page for the
 register file
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QIcT2OsRb/TH

Some i.MX SoCs (e.g. i.MX7) have FEC registers going as far as offset
0x614, so to avoid getting aborts when accessing those on QEMU, extend
the register file to cover 4KB of address space instead of just 1K.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 48d012cad6..e236bc933c 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1252,7 +1252,7 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     memory_region_init_io(&s->iomem, OBJECT(dev), &imx_eth_ops, s,
-                          TYPE_IMX_FEC, 0x400);
+                          TYPE_IMX_FEC, 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq[0]);
     sysbus_init_irq(sbd, &s->irq[1]);
-- 
2.13.5

