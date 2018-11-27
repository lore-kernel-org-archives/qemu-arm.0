Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1114483wrt;
        Tue, 27 Nov 2018 03:03:47 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WdEj3qaxl9kLNBkqQJpSey1pvYIVHYls+8/vzHjfiUlL3kzWTTWLcrJ2I3XmxmmvVgyqWl
X-Received: by 2002:a25:ed0c:: with SMTP id k12-v6mr31535295ybh.87.1543316627614;
        Tue, 27 Nov 2018 03:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543316627; cv=none;
        d=google.com; s=arc-20160816;
        b=v3AxEaoB9KhmfLr/sqxzixBzScv7OLVy4AcWrJqOrN1qnQNJOKauc1/GIKgRJjQBAj
         AhyZf5D0ODPz3MgqcXzDh9m0hTXTWQ6IHOgHVrJWgOcmbFcCDrgnRcSED7K+2sponJ+p
         VN900E8H46r1YeCEphYkox3XRDs9YVIJ35nJuda2tapG7BO8dJMw7mLUZcDV/jmxAZjp
         +UnzkbkPq94Cu22S4+VLjfNfqv2nofmqExUQ7osfw2SIESDXjIZVcS5YKjM5AGIGRo9n
         xTnisuwB28CN6OYiI4J3ylwbdFr0iiDFjuUzWXMT3FDjmpNfHs3FHWtA/+iV6kkw0buX
         lkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=jAZAdIedU+nCMHVHbY+OU7daVxXZNRcA8sUSRMXVjAs=;
        b=NpRkICAJ0UaoFa3Gix/OT7nJIWoKUGzIPSrE+QGw6lxC5RY+x5IUZNAHskAfat1ExN
         vC+Ge/8+ReZ0MjJWSAXJ76MKiM+N72tFhiXA3Nm40Oa93CVbLeNwWpytNxikld0HfPhf
         jvw4d7B3st63DypiF1p6i2Iwl3KAzKYzZfavOVGj6cAtQzrn0YW6xxNhZtHuudNggyVv
         gFuhTlpzbo/fcQy4XttstSDwygPMmLZUxSqpqR0ZEfjmLUvqSYdNGO76+isoHbC9dbgY
         COAVKp/vkDfLFMIpd8VFGUrLRZHnJYFJv9oFW/uP0eZbvW+3rZ9FlsxYJrrRihWlZU+w
         1MjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uniudc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n141-v6si2292242yba.72.2018.11.27.03.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 03:03:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uniudc.com
Received: from localhost ([::1]:41389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRb9e-0000kO-P6
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 06:03:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luzhipeng@uniudc.com>) id 1gRb9A-0000hw-27
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 06:03:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luzhipeng@uniudc.com>) id 1gRb94-0000eU-FG
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 06:03:14 -0500
Received: from m176115.mail.qiye.163.com ([59.111.176.115]:30013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luzhipeng@uniudc.com>)
	id 1gRb8u-0000Y2-CY; Tue, 27 Nov 2018 06:03:00 -0500
Received: from cvknode54.localdomain (unknown [106.37.239.65])
	by m176115.mail.qiye.163.com (Hmail) with ESMTPA id ED4C06624D9;
	Tue, 27 Nov 2018 19:02:51 +0800 (CST)
From: luzhipeng@uniudc.com
To: peter.maydell@linaro.org
Date: Tue, 27 Nov 2018 19:02:45 +0800
Message-Id: <1543316565-1101590-1-git-send-email-luzhipeng@uniudc.com>
X-Mailer: git-send-email 1.8.3.1
X-HM-Spam-Status: e1kIGBQJHllBS1VLV1koWUFITzdXWS1ZQUlXWQkOFx4IWUFZMjUtOjcyP0
	FLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQg6Kzo5CDkNMy8tGQ4VEBga
	GUIKCghVSlVKTk9ISEpNTkxJT0tJVTMWGhIXVRcOARMSCx4VHDsOFRIOHxhVGBQWRVlXWRILWUFZ
	SktNVUhMVUlIQlVNTllXWQgBWUFKSUhJNwY+
X-HM-Tid: 0a6754d6083f9373kuwsed4c06624d9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 59.111.176.115
Subject: [Qemu-devel] [PATCH RESEND] hw/virt/arm: Add support for Cortex-A72
 in virt
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	ZhiPeng Lu <luzhipeng@uniudc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlQAyIaHliE/

From: ZhiPeng Lu <luzhipeng@uniudc.com>

Signed-off-by: ZhiPeng Lu <luzhipeng@uniudc.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a2b8d8f..f69e7eb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -174,6 +174,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+    ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
1.8.3.1

