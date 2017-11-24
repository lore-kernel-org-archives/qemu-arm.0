Received: by 10.223.159.82 with SMTP id f18csp1841686wrg;
        Fri, 24 Nov 2017 01:44:20 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYynnXBZW3GwU0a2josjlDRHTTpy5EdRnRkFfZhLIWZd2FL/iLiICkP153H2cwkjQl5OXIf
X-Received: by 10.37.216.137 with SMTP id p131mr16752360ybg.397.1511516660765;
        Fri, 24 Nov 2017 01:44:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511516660; cv=none;
        d=google.com; s=arc-20160816;
        b=CdpynuNv2gVCaT7Z9mZJot/Lk8vA4jLwFOwocddoioDDORdpqtXUPh2fzEqesHGWpH
         8KSBLgtJuHqcCkpTdEaSvDuLeQina4TNzoctJS5zyr45ccMHHkZGlu9JI+4YwgC91J3F
         N6POc9StKp7jCF6UpX9pjOxmkcWl6NP8qCQNgR8mbSFDRDn9NvDbf1k0Djj7LeoKH2PU
         NzkHuCw2OMCheiWh5WmGpo7+uO95x9La+Ba6kp0tFYQ8owjlIr9i6d/xaZFhrlus5JhV
         kQkzIj2vQgTor7xLPhsrUHUeU9mQzyRtI5vlEEtmMzTPufaL4uS4tCQmBx+jbllg8sfH
         G8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=2Nyge8f/7OWmPa4qw3zioQzo0IT+JiF8S1oobX/L7qY=;
        b=X88wD/TAwLpk9w8Uy6klElftxuyjHfd4116MLT9kJgHg5DMUfn2kvgskv6ZGl4SJgj
         FFkXGk92o525FUZzmeV1yhHfjYZm+Dx9eiGddatSSnyg+FwTwxdIaoQh8N02RmRakQv4
         BrCRkfupmoMl/dSSuvC01Sa1X32lOAuozidipmh7Bdv74ksuxTpuby5Yx0bzwUf5JJRr
         ut6SN3f24fKPOtYthWF7kD5U/BnBD+g9sO/kwG9beIpUxC1h2Clx3suEFw0/ANT6CI+j
         11/mGY5jkq76/0ZsgxxAn1QX37fbCu9Spw8QBacqTLnSy1oMEMfZt8wHOrRVdF1bXuNe
         OpWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si1806446ywe.265.2017.11.24.01.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 01:44:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIAWy-0002bS-8N
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 04:44:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIAWh-0002Xq-Ad
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 04:44:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIAWd-0003I4-5L
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 04:44:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33570)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIAWc-0003Gq-Ui; Fri, 24 Nov 2017 04:43:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 104D3C034E16;
	Fri, 24 Nov 2017 09:43:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7203600D5;
	Fri, 24 Nov 2017 09:43:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Nov 2017 10:43:46 +0100
Message-Id: <1511516626-21178-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 24 Nov 2017 09:43:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for 2.11] hw/arm/virt: Add 2.11 machine type
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
Cc: drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K9j7ui7tQ5aO

Add virt-2.11 machine type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/virt.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e18b41..151592b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1618,7 +1618,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_10_instance_init(Object *obj)
+static void virt_2_11_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1678,10 +1678,25 @@ static void virt_2_10_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_2_11_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 11)
+
+#define VIRT_COMPAT_2_10 \
+    HW_COMPAT_2_10
+
+static void virt_2_10_instance_init(Object *obj)
+{
+    virt_2_11_instance_init(obj);
+}
+
 static void virt_machine_2_10_options(MachineClass *mc)
 {
+    virt_machine_2_11_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_10);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 10)
+DEFINE_VIRT_MACHINE(2, 10)
 
 #define VIRT_COMPAT_2_9 \
     HW_COMPAT_2_9
-- 
2.5.5

