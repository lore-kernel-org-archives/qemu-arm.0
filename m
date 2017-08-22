Received: by 10.223.188.70 with SMTP id a6csp5064436wrh;
        Tue, 22 Aug 2017 08:10:18 -0700 (PDT)
X-Received: by 10.200.24.139 with SMTP id s11mr1386201qtj.122.1503414617608;
        Tue, 22 Aug 2017 08:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503414617; cv=none;
        d=google.com; s=arc-20160816;
        b=A4blEV2z4IZi/Lk7cEnpb/tfUBypBEyhcG5gzg2BatdcSHjXk9LuQwdfFH0ibnd6AZ
         10uRknKW3nIxIAynbqNx59/4e1WuJdAWpVKzmL5kES5rYvxNRvMo3CrHbgFJjsyuU5LB
         H/d5wErNOwQpF/xXWWX+S0GDzt6om+UV0KS+buUrtouH0x6hMi3Af/dmqEpVn7Sv3gTd
         vKZnt7NDUXU9MD1WcuOoRZX1p98BhA2No7qE2qJvOhWaqZ5X/BHqx8YkRFIIB1ZamWUK
         f73vly8egBC4pO6AinhSzn2mhXrVTavd0QgyYG5Yn+fK4SR8t5Yu6sMIXF71QhGATuNA
         61Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=vbVN1QgykYb9pj7inp142KNHcXoGXfYcnhggvATDbto=;
        b=DixymzUzJsjpHHahUXRaLUMRMzeNPWHBe+cv1wlZ+5GtYSSkkJwohrTQD2ydDbPpIg
         UENvJuZZdtcMJUe/dysi1vEQ9UiY7ZcYPQ5eUsrWa1l+O9tgxen+8pl41UwC2XLJmgR0
         p+h0utBiFdGN1M7Zy2flFq6/3jvhtEzzFLGWqs8fEA9VFe6VLVuyGpn4FPOYlGLJLnO/
         twwhGKQiPFGiT25Xu36rwbyxE1sC4DxV5HZBvug+1KAHZgsqSuyfDad96t1Vw78izqMC
         YMSgGwfRZMOg2WCOIZuhpWVW+k0mnUDKc5caFXcRZ8qdSUa0Af8tv/fLsNJHsXxy4PeI
         bSFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r190si12560613qkd.470.2017.08.22.08.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:10:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkAop-00075l-6K
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:10:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkACY-0005Zn-At
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 10:30:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkACX-0001tn-77
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 10:30:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkACQ-0001qE-SO; Tue, 22 Aug 2017 10:30:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C739680C06;
	Tue, 22 Aug 2017 14:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C739680C06
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8797C60C16;
	Tue, 22 Aug 2017 14:30:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:30:31 +0200
Message-Id: <1503412231-13961-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 22 Aug 2017 14:30:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] hw/arm/digic: Mark device with
 user_creatable = false
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
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P7uCQ7EqJkPK

QEMU currently shows some unexpected behavior when the user trys to
do a "device_add digic" on an unrelated ARM machine like integratorcp
in "-nographic" mode (the device_add command does not immediately
return to the monitor prompt), and trying to "device_del" the device
later results in a "qemu/qdev-monitor.c:872:qdev_unplug: assertion
failed: (hotplug_ctrl)" error condition.
Looking at the realize function of the device, it uses serial_hds
directly and this means that the device can not be added a second
time, so let's simply mark it with "user_creatable = false" now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Updated the comment and the patch description

 hw/arm/digic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 94f3263..6184020 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -101,6 +101,8 @@ static void digic_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = digic_realize;
+    /* Reason: Uses serial_hds in the realize function --> not usable twice */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo digic_type_info = {
-- 
1.8.3.1

