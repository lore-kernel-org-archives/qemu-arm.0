Received: by 10.223.188.70 with SMTP id a6csp5083494wrh;
        Tue, 22 Aug 2017 08:26:50 -0700 (PDT)
X-Received: by 10.55.77.10 with SMTP id a10mr1459987qkb.342.1503415610339;
        Tue, 22 Aug 2017 08:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415610; cv=none;
        d=google.com; s=arc-20160816;
        b=OcjlKRrVZGQ4+x8QrpqBGPRXQrMUvnV0sPkSisoqq3m9QCycHMLMxgooFdcewn2UrJ
         iZy7LjktsYru0XldqG3U6SDOQM8/FvjL/foalLBKqo3shDXoc66OSXLu7/FNGPwv1r/1
         j/+tweLT83iszk8vcnnhjkChnxf4DbnAgZ5RsfYslIAAoCxWkg/791SCNGjcS+cOhweI
         jb3ysdz6NBHdJ7J/fMyPSRgKEv9o5vGxdRYxzPVj+05GpI6vs3fOwJ6At6TS57vKAxFm
         3wfdI2+KAGeTfL5ERE+Fuu01urHKAziqXjg+y19OG3annffIYkNTEVQiG/jUq8/UywkJ
         U/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=hBPQdiMnGELeSnre5oCgXHO7sIFxPW+SgwkBgZKhJIc=;
        b=XcR/Iab594kBVO0wSF++1t+2e6inEOgz2GYmPKJAXcKAM5lKrW7vPkTZsFARuFe663
         /qYL+UfghCcB7OblN1A/j/rjsIY3LufK5vvehAnJZtLVnG96HTjnbNKTi9lU80CxJj7V
         JJU+oKRsssewR3LioRzvygQMuYo+2AoRQwpZOrjFV59Y0XKUi26ou22TQ194IztG2kPK
         HeOmCkaPyNmeWO8im0Ia0NYtxMpUIAmk2ngTynlagTc601QpfCJ2sdgPA5DQmIKMep84
         ofF1JI9NHmwMP2/xgOINjS8bg/VgFuvX22cXcGLlAnzE83ss9AWMMpdDkFCGdL3ryGKT
         VMDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s39si4887906qtc.220.2017.08.22.08.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:26:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkB4p-0004Sl-T9
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:26:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkAl6-0003aJ-Ss
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkAl6-0001nf-0a
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:06:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkAl1-0001lm-Jq; Tue, 22 Aug 2017 11:06:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94E4BC04D313;
	Tue, 22 Aug 2017 15:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 94E4BC04D313
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32C727E21E;
	Tue, 22 Aug 2017 15:06:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 17:06:15 +0200
Message-Id: <1503414375-21009-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 22 Aug 2017 15:06:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/misc/auxbus.c: Mark the aux-to-i2c-bridge
 device as non-hotpluggable
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KmVZgPRMuvfO

QEMU currently aborts if the user tries to do something like this:

$ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
QEMU 2.9.93 monitor - type 'help' for more information
(qemu) device_add aux-to-i2c-bridge,id=x
(qemu) device_del x
**
ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)
Aborted (core dumped)

Looks like the device is not hot-pluggable, so let's mark it
accordingly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/auxbus.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 8a90ddd..2c62515 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -222,9 +222,17 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
     return bridge->i2c_bus;
 }
 
+static void aux_bridge_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->hotpluggable = false;
+}
+
 static const TypeInfo aux_to_i2c_type_info = {
     .name = TYPE_AUXTOI2C,
     .parent = TYPE_DEVICE,
+    .class_init = aux_bridge_class_init,
     .instance_size = sizeof(AUXTOI2CState),
     .instance_init = aux_bridge_init
 };
-- 
1.8.3.1

