Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2381863wrt;
        Thu, 18 Oct 2018 07:36:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV614qFpF+g4i+WQEPUl0RZij+UliUCOJq1ejHyjoSoyZZ2QJYvCpT1AnvR3S1ZNdFcw6lqjP
X-Received: by 2002:a0c:9425:: with SMTP id h34mr31445229qvh.0.1539873377326;
        Thu, 18 Oct 2018 07:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873377; cv=none;
        d=google.com; s=arc-20160816;
        b=YqSaDMUrX3Eqc8Fraxfa84IepuqH3klFKEUrueDQjO67XWQ0W0o/LhbCucRjJo0S5y
         E5vV6Z55kZA0BN65mQAvdTk4kYIm/B9P2phpanPIqx85Gz2udWUsPly7+q8Y+yqUbKjr
         ekxV422IMMaEiUmR9KkYl0E5b2i9Nd7v1z+LB/kRPYTPCuS1fyoiA91UiZMrXdnld86M
         qqt8GrXe8VALh/gR+VjGHwijRrNiwaGW9X9LMPRy/5dyE+W2uGCVcuJYtFovYVS64nDa
         3qOWC92UbGIaJKbCgUTkphMjcXcael7xiy/ZRzd7VheYOd3y1sshvOKuP20vOiMP3OxU
         b0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=l/XQ01gZqiiHGXCSpXtaUGoAqmyUu66H+zLh4bjWPpk=;
        b=ILjlnliBGTj5zVozWByJW+5r5nULyP5/dM8lPmLeCGCc2m3/hBBkaJDMNumn1K9YcI
         joDhSNlDCYjsyqrW69cy+msBHClionMTSjO3aX2D5QFAal1b9sdII0Kch4g7qsQe5/6m
         ySeqA5T/KawtiZ67zzaCKnfGKqtAGqKibfpCjxhjVegtUCB/YvBOL8sBV/zeORgbGBhN
         DkoHmFfk1ugoCjv3QTA8ilJ4UtOsYznxfn2AYhAZfjLh8oUeRK98ab/7NrIx8ckGUQq4
         PATgNzwgnmJVhS8EA62aKjT4dmx8Thepvry++g0TVC7Dj1nWRPZ4NPeM7sGiPxOKAlt/
         Peig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f17-v6si1647063qte.179.2018.10.18.07.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9PM-0001Sr-MX
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:36:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Ku-0005qm-SB
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Kt-0007Dj-G3
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9Kt-00072u-2q; Thu, 18 Oct 2018 10:31:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AB0E31676A7;
	Thu, 18 Oct 2018 14:31:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 026BF60150;
	Thu, 18 Oct 2018 14:31:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:32 +0200
Message-Id: <20181018143042.29588-7-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 18 Oct 2018 14:31:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 06/16] hw/arm/virt: Add virt-3.2 machine type
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lVHX1iBixmcf

Add virt-3.2 machine type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f677825f9..f920ef247b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1796,7 +1796,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_3_1_instance_init(Object *obj)
+static void virt_3_2_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1866,10 +1866,21 @@ static void virt_3_1_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
-static void virt_machine_3_1_options(MachineClass *mc)
+static void virt_machine_3_2_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
+DEFINE_VIRT_MACHINE_AS_LATEST(3, 2)
+
+static void virt_3_1_instance_init(Object *obj)
+{
+    virt_3_2_instance_init(obj);
+}
+
+static void virt_machine_3_1_options(MachineClass *mc)
+{
+    virt_machine_3_2_options(mc);
+}
+DEFINE_VIRT_MACHINE(3, 1)
 
 static void virt_3_0_instance_init(Object *obj)
 {
-- 
2.17.1

