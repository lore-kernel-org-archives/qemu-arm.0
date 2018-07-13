Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp433608wrq;
        Fri, 13 Jul 2018 01:39:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpclV7g8uapHiM9E2WABR8oeOmH3anVVecYpdXDwPXUEUmLZlt0s8DJU9xAp6gjfi8Zbaacb
X-Received: by 2002:a0c:d24d:: with SMTP id o13-v6mr5827383qvh.210.1531471159283;
        Fri, 13 Jul 2018 01:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531471159; cv=none;
        d=google.com; s=arc-20160816;
        b=MaJaceT6DLSVVn9V9wad3j8dBGV+6k22JHD3cbN1IzFv5S6ahkSr6sNhgdrScUxUmz
         fK2+O8nki5lX2EIn+Ltqucea/S8tbRtsSlVAGdI0vFBKEWuta5Qk6ZSgt7BnIzGZREBv
         UVPAG/iXEyyQygxrp9SPyDmGik03gCNsiZndY6/l7zQWZYo9/VEnjFA2L0renU8g3Bal
         2WszZHG1/FDw0rAJdqFQfFmaba6nzm5miSC4iN9zAoYEUrsAdeIClKc0zpkmVFipLxVh
         FeK3q8SURTGeJbgA+bIj5Ze2leFysItFYaWnpbrR3rL3WHSpz6v7UpDXvFRSB7LPwIKc
         Pq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TrrS7sJsA7x3hTLpL+wghUNF5G2qO2rKnjcI3zMxtf8=;
        b=gUxRgTNTFFnVEn/mQytB/Lad16M9Vz2Nz39ApdgqK4psjUD2WrzRW2o2SGKmrsAelh
         eeR7DNIPjnlqKnBjTb5Kw7IwcCCkwgs5z1JcmUUOt95jpUhdhmptneFwyf52Stoq5M9E
         6507m9TCIuny9w5K972D7DOOEDXgMxxSrc/6OpI7RLcwa2MOY9+9novlMbGpj5qTZ9xN
         1xaiIXmGnqmGuQ2t/27uzYfuSXgoilF7RQ7Vv0phrOu6mhvfgpjzW7FV/1QrhRFbAqRI
         S9NBNPyTt6Rvt5iKd6fuU2FrzEfMpO+GGCP9BhN7VLt+0DWheSdLLQobunPDGRYqQ9YK
         2+4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n19-v6si8309805qtp.63.2018.07.13.01.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 01:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdtbi-0002vy-N7
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 04:39:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRG-0002jW-Dc
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdtRA-0004v8-Kb
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 04:28:30 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42258 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdtRA-0004uF-FM; Fri, 13 Jul 2018 04:28:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AD4C8182D31;
	Fri, 13 Jul 2018 08:28:24 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 578A12026D6B;
	Fri, 13 Jul 2018 08:28:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jul 2018 10:27:40 +0200
Message-Id: <1531470464-21522-13-git-send-email-thuth@redhat.com>
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:28:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 13 Jul 2018 08:28:24 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 12/16] hw/arm/fsl-imx25: Fix introspection
 problem with the "fsl, imx25" device
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
X-TUID: O6wwKlP6Vsgt

Running QEMU with valgrind indicates a problem here:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'fsl,imx25'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==26724== Invalid read of size 8
==26724==    at 0x6190DA: qdev_print (qdev-monitor.c:686)
==26724==    by 0x6190DA: qbus_print (qdev-monitor.c:719)
[...]

Use the new sysbus_init_child_obj() to make sure that the objects are
cleaned up correctly when the parent gets destroyed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx25.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 37056f9..bd07040 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -39,38 +39,36 @@ static void fsl_imx25_init(Object *obj)
 
     object_initialize(&s->cpu, sizeof(s->cpu), "arm926-" TYPE_ARM_CPU);
 
-    object_initialize(&s->avic, sizeof(s->avic), TYPE_IMX_AVIC);
-    qdev_set_parent_bus(DEVICE(&s->avic), sysbus_get_default());
+    sysbus_init_child_obj(obj, "avic", &s->avic, sizeof(s->avic),
+                          TYPE_IMX_AVIC);
 
-    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX25_CCM);
-    qdev_set_parent_bus(DEVICE(&s->ccm), sysbus_get_default());
+    sysbus_init_child_obj(obj, "ccm", &s->ccm, sizeof(s->ccm), TYPE_IMX25_CCM);
 
     for (i = 0; i < FSL_IMX25_NUM_UARTS; i++) {
-        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_IMX_SERIAL);
-        qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "uart[*]", &s->uart[i], sizeof(s->uart[i]),
+                              TYPE_IMX_SERIAL);
     }
 
     for (i = 0; i < FSL_IMX25_NUM_GPTS; i++) {
-        object_initialize(&s->gpt[i], sizeof(s->gpt[i]), TYPE_IMX25_GPT);
-        qdev_set_parent_bus(DEVICE(&s->gpt[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "gpt[*]", &s->gpt[i], sizeof(s->gpt[i]),
+                              TYPE_IMX25_GPT);
     }
 
     for (i = 0; i < FSL_IMX25_NUM_EPITS; i++) {
-        object_initialize(&s->epit[i], sizeof(s->epit[i]), TYPE_IMX_EPIT);
-        qdev_set_parent_bus(DEVICE(&s->epit[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "epit[*]", &s->epit[i], sizeof(s->epit[i]),
+                              TYPE_IMX_EPIT);
     }
 
-    object_initialize(&s->fec, sizeof(s->fec), TYPE_IMX_FEC);
-    qdev_set_parent_bus(DEVICE(&s->fec), sysbus_get_default());
+    sysbus_init_child_obj(obj, "fec", &s->fec, sizeof(s->fec), TYPE_IMX_FEC);
 
     for (i = 0; i < FSL_IMX25_NUM_I2CS; i++) {
-        object_initialize(&s->i2c[i], sizeof(s->i2c[i]), TYPE_IMX_I2C);
-        qdev_set_parent_bus(DEVICE(&s->i2c[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "i2c[*]", &s->i2c[i], sizeof(s->i2c[i]),
+                              TYPE_IMX_I2C);
     }
 
     for (i = 0; i < FSL_IMX25_NUM_GPIOS; i++) {
-        object_initialize(&s->gpio[i], sizeof(s->gpio[i]), TYPE_IMX_GPIO);
-        qdev_set_parent_bus(DEVICE(&s->gpio[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "gpio[*]", &s->gpio[i], sizeof(s->gpio[i]),
+                              TYPE_IMX_GPIO);
     }
 }
 
-- 
1.8.3.1

