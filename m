Received: by 10.28.71.155 with SMTP id m27csp5110162wmi;
        Wed, 4 Apr 2018 10:20:48 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48dIRMPBFcgP7QejblC63tOyYG7wFkBi8tM9KKQL0w1e8unECgbLnVZo/sIdKJNlIUhZnyh
X-Received: by 10.237.42.229 with SMTP id t92mr28038429qtd.275.1522862448228;
        Wed, 04 Apr 2018 10:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522862448; cv=none;
        d=google.com; s=arc-20160816;
        b=T6czEcHQJSNH5/zUpIE1UmCTCBosLP+rVjWyd/mSxMigCGJNlQ7vvHk7B+XlBjtoRk
         mHuZEx3GXoxHBQi3ZR1derVuKRxR8NcKGftg0hMA480nF0SzGGyrDfpLKX2X0C2rAapi
         jIF5siLj4ZQuAcKhackP1jeAchA98rjRorCxBbuL5iCeORAQsgcui9AU+t7Y61yzGWz+
         cuV6SZ8Klib4n5ZWS/XurUNStogTSp1Ez7jCdaVi99w4acyHkyc6OUhw7d2OFDNigrFG
         sjocyCc8c7kDgRYrwxjGnX8FRxkuugOIQ2nvWM9ZmOxAQg0JS3d8P4vL1MGd0gw7wXpk
         TszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=VUy/czpTxF7yGDKcwAKszZDdqOXW4+9BCkNuabAyNXA=;
        b=K8jrbSZ1hGEDFSUvNxh8kguEDQYDuR7LnhhdgrkYgQPibanTLu2iCd/VIfiUW43IG/
         t6nGUYdGXvzasTs60lWMsRHMeiCCIvJ6dKTjFXIqEt4unFzPCmRUKJI01M3fnlmTYBVO
         OuRkeX7H50d9wizSaTQdNqg6s2NXHEw5wkNsqaspURwJkBx9xlKKU/xxbEk11EUb3H8z
         uiN05CeyfBLMQDwTNuDN5Mq5eUrN574AGcg+qmK8fwuRRGD7XpmSIrdHRBJSk6KrO2jm
         yvj/0UYkiwkw1ZDc+DCmiul445rY0DV8dozsOPdp32d1JxIr6BGDUgnV5w3yh7gv0rcd
         Nv1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m34si219136qtc.121.2018.04.04.10.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 10:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3m5X-0000tW-Ll
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 13:20:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f3m5N-0000r7-4N
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 13:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f3m5J-0000l9-3V
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 13:20:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44538 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1f3m5I-0000kp-SL; Wed, 04 Apr 2018 13:20:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FBC3EB6F6;
	Wed,  4 Apr 2018 17:20:27 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69FED94580;
	Wed,  4 Apr 2018 17:20:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Date: Wed,  4 Apr 2018 19:20:20 +0200
Message-Id: <1522862420-7484-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 04 Apr 2018 17:20:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 04 Apr 2018 17:20:27 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.12] hw/arm/allwinner-a10: Do not use
 nd_table in instance_init function
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fqsf7gKrl2Y9

The instance_init function of a device can be called at any time, even
if the device is not going to be used (i.e. not going to be realized).
So a instance_init function must not do things that could cause QEMU
to exit, like calling qemu_check_nic_model(&nd_table[0], ...) for example.
But this is what the instance_init function of the allwinner-a10 device
is currently doing - and this causes QEMU to quit unexpectedly when
you run the 'device-list-properties' QMP command for example:

$ echo "{'execute':'qmp_capabilities'}"\
       "{'execute':'device-list-properties',"\
       " 'arguments':{'typename':'allwinner-a10'}}" \
       | arm-softmmu/qemu-system-arm -M mps2-an505,accel=qtest -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
Unsupported NIC model: lan9118

... and QEMU quits after printing the last line (which should not happen
just because of running 'device-list-properties' here).

And with the cubieboard, this even causes QEMU to abort():

$ echo "{'execute':'qmp_capabilities'}"\
       "{'execute':'device-list-properties',"\
       " 'arguments':{'typename':'allwinner-a10'}}" \
       | arm-softmmu/qemu-system-arm -M cubieboard,accel=qtest -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
Unexpected error in error_set_from_qdev_prop_error() at hw/core/qdev-properties.c:1095:
Property 'allwinner-emac.netdev' can't take value 'hub0port0', it's in use
Aborted (core dumped)

To fix the problem we've got to move the offending code to the realize
function instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 I know, an even cleaner fix would likely be to remove serial_hds and
 nd_table from the device completely and wire it up from the board code
 instead - but that's a major rework compared to this simple fix here,
 which we likely should avoid at this point in time of the hard freeze
 period.

 hw/arm/allwinner-a10.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 43a3f01..5dbbacb 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -38,11 +38,6 @@ static void aw_a10_init(Object *obj)
 
     object_initialize(&s->emac, sizeof(s->emac), TYPE_AW_EMAC);
     qdev_set_parent_bus(DEVICE(&s->emac), sysbus_get_default());
-    /* FIXME use qdev NIC properties instead of nd_table[] */
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
-        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
-    }
 
     object_initialize(&s->sata, sizeof(s->sata), TYPE_ALLWINNER_AHCI);
     qdev_set_parent_bus(DEVICE(&s->sata), sysbus_get_default());
@@ -91,6 +86,11 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(sysbusdev, 4, s->irq[67]);
     sysbus_connect_irq(sysbusdev, 5, s->irq[68]);
 
+    /* FIXME use qdev NIC properties instead of nd_table[] */
+    if (nd_table[0].used) {
+        qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
+        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
+    }
     object_property_set_bool(OBJECT(&s->emac), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -118,7 +118,7 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = aw_a10_realize;
-    /* Reason: Uses serial_hds in realize and nd_table in instance_init */
+    /* Reason: Uses serial_hds and nd_table in realize function */
     dc->user_creatable = false;
 }
 
-- 
1.8.3.1

