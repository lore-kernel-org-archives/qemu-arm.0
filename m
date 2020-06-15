Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2022951lfm;
        Mon, 15 Jun 2020 13:48:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9S8Wv8w3A/qlHK9JoyfgBzEov3kBSqVLT5OjN9n9Qztr/8fVg7NVuCFexlte8vvMyBcju
X-Received: by 2002:a05:6902:1006:: with SMTP id w6mr48790567ybt.411.1592254081677;
        Mon, 15 Jun 2020 13:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592254081; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4xz9KnR/D1fTvXEzfCJylq3AUVb//ceQewMM1srCOSvnQxp64dJls+md6j28arLbk
         a6569RhEZiTCJeb52o325BjjSVGoM3muqTUmMbqpWUT5I0AsUkPqStIXtXBpZtQyllD0
         bUGToueKlhEzieX5/6zDc30DyolySflt6fFbAbHQQvO1sqV8E4BuyVEbC0SrSStNHBVP
         UpyG57ITtnIHymEEj1M4dc9cw8Px7TvfwlYeTM2hBrNcSzRBt6PywTU4xMXFZtjapUyL
         m1Pr0UqKiN3NTBxV6gF/2vctqgtCgnf/8jQIpb2lw1PRDpSQRCOCoWv8dzk6HaWsIe0g
         5aXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aUalZK37/Yf6RDjDIRm81YKOSNrHcQlW47tpV89M240=;
        b=AUv4lAK872p3xpMUchodt6ulWIuzewBglZV4EshAUzHZV9Ce+x1wpi6UzixZq1jUCn
         q49mX/bsF4ZJKaG+/HTOgCX/5owGewIYyK1bDDfMLXbojYRZ6Tl6miU3fxN2oLCErSA/
         J+r2ZXy6WE+PAHMJSwKMsjDwcecSyvAAMf6cXnAP+SSm9gZ01YdveWGiurpyXxlrW2GH
         Iu2FB8S+rBd0Jgcp0qcupSh99GNnf0v2wLj1/LlREQBGf/crc9btUv4gjqNV8Mpw2AFk
         9iyRBNCx/G1H+XkQOr6MkWdSOrTqmlPthxV51M/0bDW1TaU7iQ4H2uGT9H7CIl4Aq/9c
         VeNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KbCiq7XW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si12794240yba.205.2020.06.15.13.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 13:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KbCiq7XW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkw1Q-00061Y-TT
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 16:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuC-0002nu-Gr
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 16:40:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41919
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvu9-0000WR-GS
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 16:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUalZK37/Yf6RDjDIRm81YKOSNrHcQlW47tpV89M240=;
 b=KbCiq7XW9uPYGDKzQsgXHfqmOVcasxW/OtBANDFu9FaUuVeKpeWU/8bhPDmMjqBhgjZ3cs
 ip2HYw75L7d6IfNghNX4vu6APhGKz3nrT2Oo9hDNqF3WhDQ4IfwRcyEGyNfRufGnw/wIcv
 o62ZF1gb8O0Ni0tIrVm/ijA65IEyD64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-cfHd124NMk6fGOCq-uVDwg-1; Mon, 15 Jun 2020 16:40:26 -0400
X-MC-Unique: cfHd124NMk6fGOCq-uVDwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B2A188360D;
 Mon, 15 Jun 2020 20:40:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB7A7CAAD;
 Mon, 15 Jun 2020 20:40:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3664F11385D7; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/84] armv7m: Delete unused "ARM,bitband-memory" devices
Date: Mon, 15 Jun 2020 22:38:52 +0200
Message-Id: <20200615204008.3069956-9-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:40:20
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0X3btzyDk3n6

These devices are optional, and enabled by property "enable-bitband".
armv7m_instance_init() creates them unconditionally, because the
property has not been set then.  armv7m_realize() realizes them only
when the property is true.  Works, although it leaves unrealized
devices hanging around in the QOM composition tree.  Affects machines
microbit, mps2-an505, mps2-an521, musca-a, and musca-b1.

Delete the unused devices by making armv7m_realize() unparent them.
Visible in "info qom-tree"; here's the change for microbit:

     /machine (microbit-machine)
       /microbit.twi (microbit.i2c)
         /microbit.twi[0] (qemu:memory-region)
       /nrf51 (nrf51-soc)
         /armv6m (armv7m)
           /armv7m-container[0] (qemu:memory-region)
    -      /bitband[0] (ARM,bitband-memory)
    -        /bitband[0] (qemu:memory-region)
    -      /bitband[1] (ARM,bitband-memory)
    -        /bitband[0] (qemu:memory-region)
           /cpu (cortex-m0-arm-cpu)

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200609122339.937862-7-armbru@redhat.com>
---
 hw/arm/armv7m.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 7da57f56d3..f930619f53 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -245,8 +245,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->container, 0xe000e000,
                                 sysbus_mmio_get_region(sbd, 0));
 
-    if (s->enable_bitband) {
-        for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
+    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
+        if (s->enable_bitband) {
             Object *obj = OBJECT(&s->bitband[i]);
             SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
 
@@ -265,6 +265,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 
             memory_region_add_subregion(&s->container, bitband_output_addr[i],
                                         sysbus_mmio_get_region(sbd, 0));
+        } else {
+            object_unparent(OBJECT(&s->bitband[i]));
         }
     }
 }
-- 
2.26.2

