Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5744906lfm;
        Tue, 28 Apr 2020 09:50:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypIvzx98GQt2QferkAjcWQfgkF0yyb+CFjfvR+RrEEYiE4o+F/3kw2+YMfbTJjkwKeoXKC3d
X-Received: by 2002:aed:2d27:: with SMTP id h36mr29699245qtd.228.1588092628127;
        Tue, 28 Apr 2020 09:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588092628; cv=none;
        d=google.com; s=arc-20160816;
        b=iwF4dMl4BNOrFLHj/iJFpwSQJoytgML5sOp+D0vLlD5xuSuicZEBgOry+1fjdYUoQn
         D7deScEyE45v89hB3dxHmnb4ZqQM2mzn3vADz9/SAhsVmAOFmPa6Zo7Jtl6Abvj7eWyF
         9zcyJHF0n56AsF6iLAJ2IWpzmBFyNoPFdEAy3eiuI//oorm3y/GGBlF7YmEuUlgErhXn
         lMQdFaT4IQDN/psJcJQ5qfvjm0lmZBlLknvxQ9x0vcOiHnJ0NWCj7ViFKGvYJ0PZmX9q
         rLzylgVjUxRsASKZJboysms0qa6lnYBdD3UsWuvyfAK22UVFefcapRbs/AAKq9CkfRQx
         dr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bSbfMAJ4GnwLUv0Gh7iU3vhxKU1k0E4h/igRgZgLE7A=;
        b=ock8LTjFUq4rYabI41X291rDbbxVc+2B11cWghd4U5q9w9kB+jq9HAAUZvSEZk1Cms
         WY5Hby406Y7v1Y19DQRNdjEdRtoauC7/LYPB7thj/Q5Sttq+blhtNOP2mMNHaQxGY7hO
         NCQJXkEhE5wa4Mu1Ijy75Wq/kVH/1lWpZcUS4y+l4WOGtbYtExfGpw6sQ/o1mcMIYKJX
         5HfohjKZpKni/DZGwFGUJ/hl+yRn5glNocSl5RwxgazzDMQ9WqFabIgTrUW9whwATKT7
         0kSu4NIgMrxtSKSoqO3QJSi8Ja9ONs2u7Qilrp2tEUX/rZFTsvB+PNU+L6uqrzCqog5A
         Qm/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yop9O1ei;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 207si10917089qki.158.2020.04.28.09.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 09:50:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yop9O1ei;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTTRD-0002Mo-D7
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 12:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTTFG-0006lI-5H
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTTBn-0000tC-5L
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:38:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55757
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTTBm-0000sI-Lr
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 12:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588091669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSbfMAJ4GnwLUv0Gh7iU3vhxKU1k0E4h/igRgZgLE7A=;
 b=Yop9O1eiLHxyINJdYseGmp41VZBI493mIAzZ/9u61OH2chdMph0vVny1Q/FLOY4RnPczGd
 j0w1gQRWTYf38hpZRCYJzOfNO6cg731K8sG3MfDCZrRr5QQ5GkyS0T4zlOz4kp4HLHLNG9
 /sBarcc8ebufKxYth/EeHlMxwl+w7dY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-CpeKPK0GPaSNkJqmYvPgBA-1; Tue, 28 Apr 2020 12:34:27 -0400
X-MC-Unique: CpeKPK0GPaSNkJqmYvPgBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 820C8EC1A2;
 Tue, 28 Apr 2020 16:34:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF7A6607D;
 Tue, 28 Apr 2020 16:34:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 22D2711358C7; Tue, 28 Apr 2020 18:34:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] hw/arm/bcm2835: Drop futile attempts at QOM-adopting
 memory
Date: Tue, 28 Apr 2020 18:34:13 +0200
Message-Id: <20200428163419.4483-12-armbru@redhat.com>
In-Reply-To: <20200428163419.4483-1-armbru@redhat.com>
References: <20200428163419.4483-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 04:15:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 qemu-arm@nongnu.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2XwXiOTJoTa5

The "bcm2835-peripherals" device's .instance_init() method
bcm2835_peripherals_init() attempts to make two memory regions QOM
children of the device.  This is futile, because memory_region_init()
already did.  The errors are ignored (a later commit will change
that).  Drop the useless calls.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/bcm2835_peripherals.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index edcaa4916d..8b399d67ff 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -43,12 +43,10 @@ static void bcm2835_peripherals_init(Object *obj)
=20
     /* Memory region for peripheral devices, which we export to our parent=
 */
     memory_region_init(&s->peri_mr, obj,"bcm2835-peripherals", 0x1000000);
-    object_property_add_child(obj, "peripheral-io", OBJECT(&s->peri_mr), N=
ULL);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
=20
     /* Internal memory region for peripheral bus addresses (not exported) =
*/
     memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1 << =
32);
-    object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr), NULL=
);
=20
     /* Internal memory region for request/response communication with
      * mailbox-addressable peripherals (not exported)
--=20
2.21.1

