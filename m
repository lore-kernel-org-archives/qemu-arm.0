Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp429996wrq;
        Fri, 13 Jul 2018 01:34:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeWH9aVttEAVaEXHFLaiRNY1fUsUGHpCJ76hVCYeDLasnstmpUzAh0/GxDGPA7y18yxkARx
X-Received: by 2002:a0c:f94e:: with SMTP id i14-v6mr5951015qvo.73.1531470875567;
        Fri, 13 Jul 2018 01:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531470875; cv=none;
        d=google.com; s=arc-20160816;
        b=QRLNnoikzyXMUhzB+fieC6GDAWMRlL7hZwXKA077tCnY2hGHtAhDIfhgh7rPCPjHcK
         cw/5gI05CXMsmSICkUfB6R4dE78aYgNalMXWo1WxaDlA0xdi/bgPSsCIkQw6LKKIRmMW
         MY0SqMZoJ2/6BcHiqSJ39Ndpu7+IiCDbcOnP313/Ciqn2mSBYc6l6fqBklrwMyLxy4L4
         K9XyY2OzwYqbSkkCdGfsMF9i/AgReNQcpyHj80PjkklaK2qDssRRlV+/Jqtmmwz2+Z5q
         zV82PGPoPR1fgrbnbRX7wOAFuiUYig8iIUPqi3JLNFcfwAQTiEW/tBnuvs6DqZcChRGv
         8szg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PlYLh00djNk8w7Jumj+MqA+I32BDaxDowt5Yzzdty0U=;
        b=A3Do0eV4X7d4YShF6yifMS2aqJXwQNyOoHgU02/n2N24PiNdseEmqaPWfXhvJBNH3O
         NWFiDVAKUF5W4FHBJEjR0syoxLJg37L2/2TtROWE82qKhj45c49Pae3Dlm4Jpd0obzj3
         S6akz0gQ4SoZsR22aUQyjXwWe/YjmrpqdSTNcv4RVoZ5GdmADLy+QGaQyfdXpYMpwK1b
         GFWWT/nyuvjHbGJxhlDPQfLVR/oUyLWakdF0sqg4KBmhFTnejswgjf3KdEr9ZUvGw188
         VAtPeUgXTbv7NxNdKRcBqRaU4I9OMfvjQ7L3umaeB2VgVsTh18Qno5CS3W9Mt6FBN2Yb
         dpGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c62-v6si11366478qkh.295.2018.07.13.01.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtX9-0007ZL-16
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:34:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQz-0002Pt-Ky
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtQy-0004ei-NT
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56474 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtQy-0004do-JL; Fri, 13 Jul 2018 04:28:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AA40402382F;
	Fri, 13 Jul 2018 08:28:12 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 758752026D6B;
	Fri, 13 Jul 2018 08:28:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:36 +0200
Message-Id: <1531470464-21522-9-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 08:28:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Jul 2018 08:28:12 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 08/16] hw/arm/msf2-soc: Fix introspection
 problem with the "msf2-soc" device
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /bjedYRdCEgH

Valgrind currently reports a problem when running QEMU like this:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'msf2-soc'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==23097== Invalid read of size 8
==23097==    at 0x6192AA: qdev_print (qdev-monitor.c:686)
==23097==    by 0x6192AA: qbus_print (qdev-monitor.c:719)
[...]

Use the new sysbus_init_child_obj() function to make sure that the child
objects are cleaned up correctly when the parent gets destroyed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/msf2-soc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index edb3ba8..dbefade 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -68,19 +68,18 @@ static void m2sxxx_soc_initfn(Object *obj)
     MSF2State *s = MSF2_SOC(obj);
     int i;
 
-    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
-    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
+    sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
+                          TYPE_ARMV7M);
 
-    object_initialize(&s->sysreg, sizeof(s->sysreg), TYPE_MSF2_SYSREG);
-    qdev_set_parent_bus(DEVICE(&s->sysreg), sysbus_get_default());
+    sysbus_init_child_obj(obj, "sysreg", &s->sysreg, sizeof(s->sysreg),
+                          TYPE_MSF2_SYSREG);
 
-    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSS_TIMER);
-    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
+    sysbus_init_child_obj(obj, "timer", &s->timer, sizeof(s->timer),
+                          TYPE_MSS_TIMER);
 
     for (i = 0; i < MSF2_NUM_SPIS; i++) {
-        object_initialize(&s->spi[i], sizeof(s->spi[i]),
+        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
                           TYPE_MSS_SPI);
-        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
     }
 }
 
-- 
1.8.3.1

