Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1479552wru;
        Mon, 16 Jul 2018 06:03:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdizigPqFPa+OZc0AGD1vF0UWUhFJwMP7F7TUCIqj1GTqB4OVaQkjOkxXE6f4T9WCTwMIqr
X-Received: by 2002:a37:bf82:: with SMTP id p124-v6mr13713005qkf.46.1531746234851;
        Mon, 16 Jul 2018 06:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746234; cv=none;
        d=google.com; s=arc-20160816;
        b=Bc69NOtA4JIU8mmc6na9AUP5JFLf/v3m3YY0xFSPB7j4lFxa5kTKpXy4zeMsdLXF7p
         1fqAEV0z33rDT4XHoxURqwMVb+0ThdkxPUsXiKrcQ0QHm9dDLaUkF+/VEuHh2Lm8JlGG
         6LlaS4+ch5ja7sOFp7BWrUn3tmogaXcGdUCh5ZgYmdcBYM/GrVgrgrDkeeMu/66Bmwy7
         4N+ojdg13kcgvERbWliqs0JrFvjrd/ljL4lR4t06Wp6GdamZ9xMUk7Gw0akNxlYg9ZNp
         cwn9YUWJodDgJe6/q8O0r16MwT+lC5roZsk+vz6P7ML9TlySdXg+nBWlJL5oEMZGuIhK
         tPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qJmLZ5Sy+xx+HEPnZUkAG1Z3vQm0jpXpQLeYeT/C6Lw=;
        b=SxPMlmvhZSUSUQxC7nwFp1CGdnXsK48AKZu7P5n+e/FrTWSzj+MXRKiA8vkeB8xrTE
         8x8SzcNTPYpcIwPdRlK+F5LSUYe+sT13ejSbMoIPPaBLdU1YXIOno7eBDOM8+uEHUgq2
         gP9abvdcdaUBlFPuxcEf/WTtEZaWl05qe/wIh4WidTZeFgr3BxDtVXQ9d3pq4sjynZwr
         8SgKx50hvvaiFRyOSaRQzdu1Ig9l0eCjla0rnpf/vJl2p6wvQ3dhlpvJVJotqlFqYz8N
         p+dx7xMkoR1Oxhg2uSPRfKiG42m6wHZAVT19crgv2A3/bs63rccRNP0jv1sRtZaKdnjp
         3noQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f26-v6si1709641qte.45.2018.07.16.06.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3AQ-0003y4-9I
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:03:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36W-0001Ch-Sl
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36S-00024l-O1
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:59:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38014 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36S-00024R-Iz; Mon, 16 Jul 2018 08:59:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA55341C1B;
	Mon, 16 Jul 2018 12:59:47 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73D5B1C589;
	Mon, 16 Jul 2018 12:59:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:23 +0200
Message-Id: <1531745974-17187-7-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 16 Jul 2018 12:59:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 16 Jul 2018 12:59:48 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 06/17] hw/arm/msf2-soc: Fix introspection
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
X-TUID: th4lxLioKCtv

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
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

