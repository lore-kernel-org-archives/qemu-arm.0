Received: by 10.28.71.27 with SMTP id u27csp973184wma;
        Fri, 19 Jan 2018 09:02:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBotnez6Hz4EuBCGQWZdtfve+diYx+BjQZvKJbw6jdm0a2fv58dje+H4ml9TOmPvkIjX3Jp2G
X-Received: by 10.129.67.14 with SMTP id q14mr9914079ywa.501.1516381357550;
        Fri, 19 Jan 2018 09:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516381357; cv=none;
        d=google.com; s=arc-20160816;
        b=MePo2UPVWvySgg4swINMBvbrLCBvMsKkme2TocdhnCvI2N2/hECqGa5wdMPN5sZoXA
         rU6m4yH5Gddo01UJYqyepL6sUSa/xEqvkzJaCSgWRy+FTmvh9ZfkPZKexHGAJs3FwqGY
         jFwU8uP2QoDEJvOXWFERQNgkKpx4kiXCIl6KZI8jxLuUK1aX5eEAwwBirzVaYdpf1QSc
         yjb9pB7e/fOYKmwNAGs8C4ntYh5f1QrCiR35F0kTuFhSOiCHfl0PVayD9dj6aTkzW0bU
         9jR7LleYWyx6zOh0EA78TXiOzxenNj8nnCQ/Wg8KAGsOnNa7kEPcLZ1Ot9Q1f6W4vmnF
         BOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=7hAA6Qgf76ypxtHjxNZ5oCHHkaORTT4A6ucfPhgfHL8=;
        b=YP0wVAw9OekE3g+pZyrtmX4RuLxGFMVcao1AMU9FZcqZboxQVs96W0keIIae8SMbPN
         0czT99sSgjlm1As/irhTx1V1JpgP1zK+6235y3BYjBKwcZdG7f0f36M/X/AHGNdRsExe
         ec0SbnD8fLN8s4f+hvXKUUK2HcU8lcq9m0XFWxfmp2sh0+jok7PyV7TB2X068QF6cGh5
         ryk3alf7len4hcqT7CYbGTmFUPTko28okv9DFHVu7qV4hWeT+goo3c/yrKW1ovxYHJ18
         4oihykbkWiRhSm16UICsACX5cZFVfa6e2U4Xs0Gcjn8raXFVX/qluMlkHIwJACoxteT3
         4IaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6si666505ybm.146.2018.01.19.09.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 09:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eca3p-0004zM-0C
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 12:02:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecZxA-0007q8-FE
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 11:55:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecZx9-0002td-ML
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 11:55:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39140)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecZx7-0002s0-KC; Fri, 19 Jan 2018 11:55:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99C38780F2;
	Fri, 19 Jan 2018 16:55:40 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-71.ams2.redhat.com [10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA9B660C23;
	Fri, 19 Jan 2018 16:55:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 19 Jan 2018 16:55:25 +0000
Message-Id: <1516380925-15651-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 19 Jan 2018 16:55:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/vfio/platform: Init the interrupt mutex
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9KnjHgwDk4n5

Add the initialization of the mutex protecting the interrupt list.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index da84abf..0d4bc0a 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -643,6 +643,8 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
     vbasedev->dev = dev;
     vbasedev->ops = &vfio_platform_ops;
 
+    qemu_mutex_init(&vdev->intp_mutex);
+
     trace_vfio_platform_realize(vbasedev->sysfsdev ?
                                 vbasedev->sysfsdev : vbasedev->name,
                                 vdev->compat);
-- 
1.9.1

