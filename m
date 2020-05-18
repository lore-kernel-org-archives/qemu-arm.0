Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2702634lfb;
        Sun, 17 May 2020 22:04:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8SKBRpUIBF8Uf+3Spv4vRkS5t8qIv3STp78yzio+mJkdFZBMBR39/7nSgzHtAdzv5FPKM
X-Received: by 2002:ac8:5311:: with SMTP id t17mr14080334qtn.42.1589778271634;
        Sun, 17 May 2020 22:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589778271; cv=none;
        d=google.com; s=arc-20160816;
        b=xD8MxcWoXFiOMNb3yXwFgLrU3C4GPbFSeAg9EYh2sLu29IcA/LWLdbQpC62n3dQWQM
         1y6zeZ+gcGyJfItB41ac6ch74xHDKoxLxKmLOkH1JYEY85JSrabCDiL2EYNroFNmoXzi
         PLmHwD9+s893xNlW1RzbKdtAOCkGaIsZmWjSxphC0tH0KFGCnaUyUk/JxyAdtGghvhtG
         MTBGHw801IOUBZkwFRfVtz0VSWW0Z0Z7PocCaSxQfog7jEXryNI6iz+sUS81NKfvtzRX
         E/dMq358wKx03FGwZk812L9Gqkn69cyjMuW2REc5IZjD7If5XRIY8pusbO4GIbzS//Dl
         mg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Bq/vFGJHbHphE0awvKup1uIh4VSJsjPyfBqgWMSJ2I8=;
        b=pLwP7068n7U+8lyKDG8CHaB12YZxChX7hm6uhlZvLgtQ8qEbwZcBgYXqtBqyUuNSyL
         J/9A5617RPp5zUJFn82eIOIpbW8WnRx/hcIPydMQvaCUBSIGljkNVzIOJrEVbz9sdd0H
         xYO9gFkToyLHMZndnM7GBGPT6eoEMxfn0G8NVWvbsFvb6MGtd2UhoVfTDvBT6MSOopJI
         NHQEx21v1xW0t1YD9c0Zkc87SKCaThxLXB0BAP+YFzmflAsrZbCcbTrBfDMW4QmvjM1p
         FseOWq7MbMo2NEqpPQN2vg27DuIzsYaxN+tdK4Ux4//yKjHT8uZICm4mXFwmK93KRtzy
         rYBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="h+5m5/UW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m130si5244942qke.166.2020.05.17.22.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 May 2020 22:04:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="h+5m5/UW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaXx1-0008RS-1o
	for alex.bennee@linaro.org; Mon, 18 May 2020 01:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwo-0008Mk-2l
 for qemu-arm@nongnu.org; Mon, 18 May 2020 01:04:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32823
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwk-0004JY-4X
 for qemu-arm@nongnu.org; Mon, 18 May 2020 01:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589778253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bq/vFGJHbHphE0awvKup1uIh4VSJsjPyfBqgWMSJ2I8=;
 b=h+5m5/UW5X12HoH+TPZSMLgUCxwQ6O4tM7QPUbhpguIMy6ygFRCxzjB+VA5YCTaSk+mqxg
 aoUsMpwcIEVR7ek4xoB7fYnfF3VM5eSZYgaEGqZQF/Ex0cNLa9DWy0QYWeawL1+zgWDlLG
 2VQ2Z+7XErcGsIQCwaoaUNc1kbsEc3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-by4MJa-nOs-HiWC9z31mng-1; Mon, 18 May 2020 01:04:11 -0400
X-MC-Unique: by4MJa-nOs-HiWC9z31mng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08CA2107ACCD;
 Mon, 18 May 2020 05:04:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF7279587;
 Mon, 18 May 2020 05:04:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 21D8111358C0; Mon, 18 May 2020 07:04:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/24] aspeed: Don't create unwanted "ftgmac100",
 "aspeed-mmi" devices
Date: Mon, 18 May 2020 07:03:48 +0200
Message-Id: <20200518050408.4579-5-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-1-armbru@redhat.com>
References: <20200518050408.4579-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
 ehabkost@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, pbonzini@redhat.com,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PO2YDC/kNE81

These devices are optional, and controlled by @nb_nics.
aspeed_soc_ast2600_init() and aspeed_soc_init() create the maximum
supported number.  aspeed_soc_ast2600_realize() and
aspeed_soc_realize() realize only the wanted number.  Works, although
it can leave unrealized devices hanging around in the QOM composition
tree.  Affects machines ast2500-evb, ast2600-evb, palmetto-bmc,
romulus-bmc, swift-bmc, tacoma-bmc, and witherspoon-bmc.

Make the init functions create only the wanted ones.  Visible in "info
qom-tree"; here's the change for ast2600-evb:

     /machine (ast2600-evb-machine)
       [...]
       /soc (ast2600-a1)
         [...]
         /ftgmac100[0] (ftgmac100)
           /ftgmac100[0] (qemu:memory-region)
    -    /ftgmac100[1] (ftgmac100)
    -    /ftgmac100[2] (ftgmac100)
    -    /ftgmac100[3] (ftgmac100)
         /gpio (aspeed.gpio-ast2600)
         [...]
         /mii[0] (aspeed-mmi)
           /aspeed-mmi[0] (qemu:memory-region)
    -    /mii[1] (aspeed-mmi)
    -    /mii[2] (aspeed-mmi)
    -    /mii[3] (aspeed-mmi)
         /rtc (aspeed.rtc)

I'm not sure creating @nb_nics devices makes sense.  How many does the
physical chip provide?

Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 hw/arm/aspeed_soc.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 71a0acfe26..0a6a77dd54 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -188,7 +188,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
                               sizeof(s->wdt[i]), typename);
     }
 
-    for (i = 0; i < sc->macs_num; i++) {
+    for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
         sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[i]),
                               sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
 
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index cf6b6dd116..7ca860392a 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -203,7 +203,7 @@ static void aspeed_soc_init(Object *obj)
                               sizeof(s->wdt[i]), typename);
     }
 
-    for (i = 0; i < sc->macs_num; i++) {
+    for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
         sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[i]),
                               sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
     }
-- 
2.21.1

