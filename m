Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2702569lfb;
        Sun, 17 May 2020 22:04:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5f2VGELfIGzOoYpd0a3vptiMNYIdU72fFhO5h86VoJ0/RQ7ZB+XUR1/ewJzH4Ur1WBBHE
X-Received: by 2002:a37:6658:: with SMTP id a85mr14325590qkc.493.1589778267537;
        Sun, 17 May 2020 22:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589778267; cv=none;
        d=google.com; s=arc-20160816;
        b=kqu9g5wQ273Eqoleicr+NL8TCoMHExipF5eTsg1ywHdeAohFNyoZzkOeVLWLcOtg6r
         OFU4kftEfb8Ey8rdK7q6bXm+mhCTlD1pDujQBCCu1W02BcUci32iYgw1uurLqvq5jweQ
         PMFQMbh4lyZQ+thsHbL0t6wAawNpfA91B4JGSK6rl1uHuvlkaWHz2NczlQWasbg9uTZT
         NWKH1aU+oKgcbhZ2kRf1i8NDmz/Q7jPINiR4geyBB/csFbrH5E3Dl4u9jYSJupOPTQl9
         juvsrT5Cgf/0GWezeMm31oGHCwRFvcHQ1iChtopD7WRSIhJ+4mnFqB8CjpcXdv8W4dhK
         UhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xRs+DjLR3Y4rVR+MfxAtvurXdFDZgeO6io8w2miIdIQ=;
        b=CKZZCz4rSlxifNthSvkN7Y6eE7zKfZGQG6dQEv0EtA4BNpKBzLjpxbsPY4+huhNjK/
         oNqQyqhZhxVdgvnCdsKGMMTUAWYYWDznJ0mrnop/+pP0mZG3MsSo466CLfCqklK2zwLY
         3MQ8x9NT98O2Y+jVOCf9VzKy9NGyuN9gpbkNma1IVA1H9D65TPQvUcIf7V480mVd/3pz
         KmzvyXvaLu5SNG72MN8RCIPXetLdJkEvEeOvGSGE3zYM1+1L8t6GrKtJC//enQQjOt2V
         PZbIBE+BLplJqxK6pTBcKCsI2VNYB9hTJqESf7uewHY3dGRaGiObXqksj8hR6A/8x0GP
         utdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="eYd/3LF1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si5275537qkf.268.2020.05.17.22.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 May 2020 22:04:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="eYd/3LF1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaXww-0008LI-Os
	for alex.bennee@linaro.org; Mon, 18 May 2020 01:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwk-0008KC-VA
 for qemu-arm@nongnu.org; Mon, 18 May 2020 01:04:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24913
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwj-0004JU-W6
 for qemu-arm@nongnu.org; Mon, 18 May 2020 01:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589778252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRs+DjLR3Y4rVR+MfxAtvurXdFDZgeO6io8w2miIdIQ=;
 b=eYd/3LF1bYUnkWLHp4Lz1KB3MA1GZ5z3/+9TbgH1gYEFS8qzwyMxDyhE4ro3qzCCnkb2EF
 1q09iEeYI57RP43Y0nHpW9F/jtTk+JRyuXYzDddERqjSRTfA+unAo8QT4HsNyN6484WtSy
 HeEP+MhSoMJLwtvFEp5B34ULyiwNML4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-2y-88NA9NP-feCjgufqn3w-1; Mon, 18 May 2020 01:04:10 -0400
X-MC-Unique: 2y-88NA9NP-feCjgufqn3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD9CD872FE0;
 Mon, 18 May 2020 05:04:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F9F3600E5;
 Mon, 18 May 2020 05:04:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1EA3811358BF; Mon, 18 May 2020 07:04:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/24] sd/pxa2xx_mmci: Fix to realize "pxa2xx-mmci" device
Date: Mon, 18 May 2020 07:03:47 +0200
Message-Id: <20200518050408.4579-4-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-1-armbru@redhat.com>
References: <20200518050408.4579-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 ehabkost@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2z7IeQRWmOsc

pxa2xx_mmci_init() creates a "pxa2xx-mmci" device, but neglects to
realize it.  Affects machines akita, borzoi, connex, mainstone, spitz,
terrier, tosa, verdex, and z2.

I wonder how this ever worked.  If the "device becomes real only on
realize" thing actually works, then we've always been missing the
device, yet nobody noticed.

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
---
 hw/sd/pxa2xx_mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 8f9ab0ec16..6a80181bc9 100644
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
2.21.1

