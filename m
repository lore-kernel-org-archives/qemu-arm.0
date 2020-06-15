Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2020741lfm;
        Mon, 15 Jun 2020 13:44:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymtJ73w7j3MAMSyroKrH+pa2zrOLIsUBd4t9pzMs9knlot2zUbwE1hrE4Lr0DjDbdJzNX/
X-Received: by 2002:a25:b992:: with SMTP id r18mr34884428ybg.283.1592253856256;
        Mon, 15 Jun 2020 13:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592253856; cv=none;
        d=google.com; s=arc-20160816;
        b=nez87j//XimgjSmK4gFRlfRSdKEePnp1tYDvLlKrH5Ns5X7ilaPvfrO5u2vNVHpwK6
         85IqOTCfN/UNzHbiZcqj/wHpHJ+oiu/M9JERzGWSOut5zWlmbQtKnEVWiWjn9C8vivRy
         A2KC0zSNTSI9a3Us+QfmhsbhylgFmGe5ooucdELYmZwbtoMRPRpJLkhDnsip0sIMRMmo
         URGS52Ogb5zWLBImy735qOvuTFIX9Cq/fJlpq8j9xG4aXgO+XgyZ3I7YTZ/EcG3k+Dry
         GGIXDKspYHBoWyRj7Q2TwSof8K7HI8K+7RJlyrlE5zEJVOlN1NdJfSQR3M/cvMZfY5Ev
         utBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S8OHXstICHIC+hovIl+/RriqD3QELX6OjkA5CTr+5Jk=;
        b=azMhV/nzfArdfsAG3Gb5wrNsdzXtJcguYBvUY+JmDYkrVdfkx4GDp6bqpV2TcX4Oug
         JC1jj6Un9gt0kFXs24Vd/MNHXCVqkHxpLbp9FO3S/urO2Jm8TtbHw2ixSakQOHwmrA+T
         /dXTF6Cjyqbil1jAke0Q8Zxlm6hpNn0JssjkUaLXhTrRFWgRjGW3xQ1/jz9GVkXxqjvm
         O/QVr3h66BjvmaqlKAR9I0ZLrj6UPDDJx0yOB/gldYJD60gh4/UbhPAl3BfHZ+dbnaFx
         6Q9/Pviv9o2xAg+l1/74ASYxO4YIr7SVcIh+TsdxdSq0A6Z0/wycUkYSzwof+pxIlyAc
         MnwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J1L3Pfb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d69si13840541ybh.331.2020.06.15.13.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 13:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J1L3Pfb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkvxn-0008P1-Hs
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 16:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvu3-0002Rk-01
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 16:40:23 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28507
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvu1-0000TQ-7a
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 16:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8OHXstICHIC+hovIl+/RriqD3QELX6OjkA5CTr+5Jk=;
 b=J1L3Pfb8pJ/KwkcLCwH0MELhFD4aoZeUUuVcNxKbDshkgVO0VqFKkt5dRQd/WjdpXFkDHA
 LnmdG/Am9pbo2Wk48+mp7Fdhr+uU1osJ7rcdGPjsJdKrbhrjlVQHjEkWiHo0edA6ucG4nz
 eX5uwQ6J21Yta11PVqdXioj/qXazGno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-SUx_y-NwPhqatfQQ0Kyplw-1; Mon, 15 Jun 2020 16:40:18 -0400
X-MC-Unique: SUx_y-NwPhqatfQQ0Kyplw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5B6873415;
 Mon, 15 Jun 2020 20:40:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7315C1D6;
 Mon, 15 Jun 2020 20:40:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2AC9111385FC; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/84] sd/pxa2xx_mmci: Fix to realize "pxa2xx-mmci" device
Date: Mon, 15 Jun 2020 22:38:49 +0200
Message-Id: <20200615204008.3069956-6-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T7CHoP/T55mU

pxa2xx_mmci_init() creates a "pxa2xx-mmci" device, but neglects to
realize it.  Affects machines akita, borzoi, connex, mainstone, spitz,
terrier, tosa, verdex, and z2.

In theory, a device becomes real only on realize.  In practice, the
transition from unreal to real is a fuzzy one.  The work to make a
device real can be spread between realize methods (fine),
instance_init methods (wrong), and board code wiring up the device
(fine as long as it effectively happens on realize).  Depending on
what exactly is done where, a device can work even when we neglect
to realize it.

This one appears to work.  Nevertheless, it's a clear misuse of the
interface.  Even when it works today (more or less by chance), it can
break tomorrow.

Fix by realizing it right away.  Visible in "info qom-tree"; here's
the change for akita:

     /machine (akita-machine)
       [...]
       /unattached (container)
         [...]
    +    /device[5] (pxa2xx-mmci)
    +      /pxa2xx-mmci[0] (qemu:memory-region)
    +      /sd-bus (pxa2xx-mmci-bus)
         [rest of device[*] renumbered...]

Fixes: 7a9468c92517e19037bfe2272f64f5dadaf9db15
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200609122339.937862-4-armbru@redhat.com>
---
 hw/sd/pxa2xx_mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index f9c50ddda5..c32df1b8f9 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -492,6 +492,7 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
     sysbus_connect_irq(sbd, 0, irq);
     qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
+    qdev_init_nofail(dev);
 
     /* Create and plug in the sd card */
     carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
-- 
2.26.2

