Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7793597wrx;
        Sat, 23 Feb 2019 00:08:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib1F1BKiYzxGl8A3SC6KY9sqllP56EQ6efTeQwMpDIu9NDf74LehhrtDfHk2czsf87F0nga
X-Received: by 2002:a25:3dc4:: with SMTP id k187mr6660514yba.443.1550909330729;
        Sat, 23 Feb 2019 00:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909330; cv=none;
        d=google.com; s=arc-20160816;
        b=RIfhTLuYDU7rq9qa6fNEBCRUAx1tG9hb6MOQvC6ODq9USoR089/nXWl5J0nMLScvNL
         IidenJmiCQJFwgTj588qNO6Muk4NC03nWBowh03cDqdQryV7PVgSNOlDzlPFSzPqxJOH
         VmXsEKDHJVmSya2grVxaQMxnXwzinxqrVxWY+b9PTpOEqdt4OduqFRxfKgszuckgnS8l
         kiAecl9WTjxRT4D188BvoOdLtPBvigD52uWtV3kfMJHqnKNnZ7PF1B591szaf+LabVvL
         pRUAwBwX7uCf3ZfVZejOTpukzsYiSg6YnAgaxRGP6pjhv0NuQuZ5XmWVXBotvB0Rq0HY
         mG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=SYfvnKz2rJjQoWe6pc99UkO68Q+wcYABlTjVlYAPI1s=;
        b=U7mEBq/Vt1NBeHdkvI1Yd3w2ermoB7U6WULXO9qQNRvxJN94AbwFwMLZklpls/qm36
         LND95k/iDIXgUFjrOJRO+kUQkvF3gF5cUi2E/YhZoTNrSc9CvhZ4R92ecdyOGtFAno2P
         FamXUcuj2vDYjnrVnABrD1qPxos5zVdyMcPKgfmjYbjFTKoHI6kCbA6MSSsL/SvigXiZ
         jvnmpAv/RCucitf1pAbRxZB4HDW8xNNN7DHyEcUAW6yz0+fL1SpYcEpK6y6UI0aFOYDL
         wSn4wf7MBVrSJFNncL9f3gql6y3Zj1vWgTxto4UA40GA6x5NrMbJxMaM/1PURHo9/K3J
         wscQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si2257974ybh.187.2019.02.23.00.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:08:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSMc-000263-3t
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5A-0005N5-CG
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS57-0002vG-Uq
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47222)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS55-0002hF-Uq; Sat, 23 Feb 2019 02:50:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C90EC04959C;
	Sat, 23 Feb 2019 07:50:28 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B648E5D9CA;
	Sat, 23 Feb 2019 07:50:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:21 +0100
Message-Id: <1550908162-22644-30-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 23 Feb 2019 07:50:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 29/30] hw/arm: Express dependencies of the
 musca machines with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NI2VvjqNemIm

Dependencies have been determined with trial-and-error and by
looking at the musca.c source file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 06e9e9a..8105587 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -79,6 +79,9 @@ config MAINSTONE
 
 config MUSCA
     bool
+    select ARMSSE
+    select PL011
+    select PL031
 
 config MUSICPAL
     bool
-- 
1.8.3.1

