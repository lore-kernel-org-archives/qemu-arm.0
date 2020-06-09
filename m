Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp434327lfc;
        Tue, 9 Jun 2020 05:24:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvLU+SbfpJJ+LzHXVCsisKtF51m+YFv50+WXhMzWihxHBpodIcwe4NE7dQCuu4bS0KkpDe
X-Received: by 2002:a25:7ac5:: with SMTP id v188mr6209176ybc.237.1591705453575;
        Tue, 09 Jun 2020 05:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591705453; cv=none;
        d=google.com; s=arc-20160816;
        b=nFr3m51j9ycUBFyGTflksJiLYavwA3hPe5QAnT12WifyGjYlEg7oIFHBf0H46NQNhO
         35UdpJkFYZf62KXZlgaSeUhzGD0eLuDlfNsxOaF0ezExvA5zRs+sR4GTExZqaudYlmyD
         JXPaCw4idaGexYwOwAn1wyEm2UYro8zpmbJyGfJKWZncbnVYNl7uOH5UmX+SpytVS1tL
         AiPY84OeG4gPPBAhZjMs7nxbamylNrwlOOEmdthhCYZlcDsQTsivrlCpas5c1nKrTGxp
         PfCPjTj7OjA6356AI7Uf2KWlsh/kJsIGN5cVKH5qYW6fW0Sl5+44MBAQNM5GkCs92OEd
         Lv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=96NSDVlLstzrc1zVcESoebf76Jshgi/HIVJtBXAA0ck=;
        b=M7OJMjrXJOAs08HqLRcL7O4esd0dj8nN0FRnMKp++fjEMe4VO1mRHOxsZj8LO+g5C+
         bY1DVe6M9ck4WkTg30ZKDgV5Psj0mT8ZY6+I+vvciV9luf4r0G96FrqIvAGl7SXNTj63
         GiFbdUxNy/ukksdLLuCi238UmcuJxzrOpUddGwzEjv1epytR2m7mhMWJDC3usJiqVplv
         SeL43K6xr58dfQ0G11sHvEVaN2A6lIwxha5ZzhjjWgMwt37MQR6B/gmHBwrFvKTlcA37
         FV0JL5MWtbncdw6WbOJ45ib21718wT4zo/vksNXYL8WKXuTWB8GqTj0bQmtFY2pTbhgN
         jPmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hgEEJJy+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d31si2749397yba.474.2020.06.09.05.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 05:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hgEEJJy+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jidIa-0003G5-TM
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 08:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jidIA-0003Dh-K6
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:23:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39082
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jidI9-0005Oq-AQ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591705424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96NSDVlLstzrc1zVcESoebf76Jshgi/HIVJtBXAA0ck=;
 b=hgEEJJy+pYnUYyp8QZIjaQ+P+6XFwE56szRYiPjjfrIMF8CC4tgi4/v7HkguNerJEB4OwL
 Q+IT6vPGNyV9mk5HBEa7qb5bIqrWhqzO6HlUMS6nOxfNxcRnLkk7Ex7bFX8QoFW3FbPXhb
 hU37/GKb6rKwVMn/SSjFFe49dJzvsIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-urMu2FYIPrGrtNde29_Tsg-1; Tue, 09 Jun 2020 08:23:42 -0400
X-MC-Unique: urMu2FYIPrGrtNde29_Tsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94B3980B73A;
 Tue,  9 Jun 2020 12:23:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61C3C8926E;
 Tue,  9 Jun 2020 12:23:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E3CF711385C8; Tue,  9 Jun 2020 14:23:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/24] sd/pxa2xx_mmci: Fix to realize "pxa2xx-mmci" device
Date: Tue,  9 Jun 2020 14:23:18 +0200
Message-Id: <20200609122339.937862-4-armbru@redhat.com>
In-Reply-To: <20200609122339.937862-1-armbru@redhat.com>
References: <20200609122339.937862-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, pbonzini@redhat.com,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /+IwZGPXxPyH

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

