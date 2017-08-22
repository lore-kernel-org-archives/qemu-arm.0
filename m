Received: by 10.223.188.70 with SMTP id a6csp5117177wrh;
        Tue, 22 Aug 2017 08:57:03 -0700 (PDT)
X-Received: by 10.200.49.157 with SMTP id h29mr1672819qte.269.1503417423748;
        Tue, 22 Aug 2017 08:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503417423; cv=none;
        d=google.com; s=arc-20160816;
        b=C0N79QIZNpzNc312j30Z48b4YAXTm1TdiY1Yj9KUNNo1B1PhRjZdg7fT+q1Hv79XDm
         leMFzzyGOETdMT2HRCr4pvE2htdZFmi/xVPfq/CUa+qTE5EQJq2vJxEuBueYxoHbFsbB
         IS+SIEcGtTl/86hP743qvBJCx1dPpAaxTGjSETDyyxwV/eUZXtq9j1x4619fIRkb+n6r
         Rfy68J1VFATaYezUqPyUdJ4jP/PEQEfAOU1w2xQ2lSlvfeXv9O08MoVO3lJKpMqmtXlG
         tvqyvxlI8FLCSYeBqKzJ+nnrYoNv881GmAWJnbrRQJfI52O2pNc9zXFKzCdtvhEXbt1Z
         h1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=vlbUfs5iAitUUBrtK0/WHq0qsKuCcwsyBJ2+mLja5nM=;
        b=WmcAKhQSWSHh4Zr3NDh3lsWWMVehp4VJejuHxiA5VtWB5293qsqtF8ViKF+4MSwWCi
         lw5ltRRZUssAB+d4Y1cTHP/Cbd5SEzNlZr4gc/aPEfrD+0S8DuMd3Ihr+Q3TXy2NWnyr
         j1DSP4JP3YjnbVg270VcHT+KCsWMyzEV134oE6NQop9vyvhRTMqCx7vf2Txt+3YzgEDw
         D+6ZvVm1Tf8ImgOJ8NalkI18YS8Kh38HoYhctQQF8OesPS2gWSR9zYWPuODZQeJVWope
         DbfB/d04vvG7gY4kEHL63UADXK6JlH5wkXUUmKt/FNCOeL3GVUx2YfA0648euJKZX5RK
         0vDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x123si2464354qka.487.2017.08.22.08.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBY5-0007fZ-Bi
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:57:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkBO0-0007HX-Hm
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkBNx-0005bw-Cu
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:46:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56910)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkBNx-0005bW-6X; Tue, 22 Aug 2017 11:46:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1995981DFC;
	Tue, 22 Aug 2017 15:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1995981DFC
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 956075D724;
	Tue, 22 Aug 2017 15:46:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 17:46:29 +0200
Message-Id: <1503416789-32080-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 22 Aug 2017 15:46:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/allwinner-a10: Mark the allwinner-a10
 device with user_creatable = false
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wuOYPbxvZ1t5

QEMU currently exits unexpectedly when the user accidentially
tries to do something like this:

$ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
QEMU 2.9.93 monitor - type 'help' for more information
(qemu) device_add allwinner-a10
Unsupported NIC model: smc91c111

Exiting just due to a "device_add" should not happen. Looking closer
at the the realize and instance_init function of this device also
reveals that it is using serial_hds and nd_table directly there, so
this device is clearly not creatable by the user and should be marked
accordingly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/allwinner-a10.c    | 2 ++
 scripts/device-crash-test | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index f62a9a3..43a3f01 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -118,6 +118,8 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = aw_a10_realize;
+    /* Reason: Uses serial_hds in realize and nd_table in instance_init */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo aw_a10_type_info = {
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 8eb2d02..74aee68 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -187,7 +187,6 @@ ERROR_WHITELIST = [
     {'log':r"Device [\w.,-]+ can not be dynamically instantiated"},
     {'log':r"Platform Bus: Can not fit MMIO region of size "},
     # other more specific errors we will ignore:
-    {'device':'allwinner-a10', 'log':"Unsupported NIC model:"},
     {'device':'.*-spapr-cpu-core', 'log':r"CPU core type should be"},
     {'log':r"MSI(-X)? is not supported by interrupt controller"},
     {'log':r"pxb-pcie? devices cannot reside on a PCIe? bus"},
-- 
1.8.3.1

