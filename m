Received: by 10.25.208.211 with SMTP id h202csp1266901lfg;
        Wed, 16 Mar 2016 08:49:21 -0700 (PDT)
X-Received: by 10.13.236.211 with SMTP id v202mr2261046ywe.308.1458143361368;
        Wed, 16 Mar 2016 08:49:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189si1231543ywa.388.2016.03.16.08.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 08:49:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agDhI-0003pM-SW
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 11:49:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1agDh4-0003Mf-Bs
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:49:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1agDh2-0006Vz-1t
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:49:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35563)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1agDh1-0006Vv-TH; Wed, 16 Mar 2016 11:49:03 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 7B6068E360;
	Wed, 16 Mar 2016 15:49:03 +0000 (UTC)
Received: from redhat.com (vpn1-5-10.ams2.redhat.com [10.36.5.10])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u2GFn05O031536; Wed, 16 Mar 2016 11:49:01 -0400
Date: Wed, 16 Mar 2016 17:48:59 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1458143333-25769-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Greg Bellows <greg.bellows@linaro.org>
Subject: [Qemu-arm] [PATCH] arm: fix machine description
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: naDVUz9Npdyk

Fix what is clearly a copy-and-paste bug.

Fixes: c29196904b ("target-arm: Add virt class and machine types").
Cc: Greg Bellows <greg.bellows@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8c6c996..9cf94e9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1382,7 +1382,7 @@ static void virt_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "ARM Virtual Machine",
+    mc->desc = "ARM Virtual Machine";
     mc->init = machvirt_init;
     /* Start max_cpus at the maximum QEMU supports. We'll further restrict
      * it later in machvirt_init, where we have more information about the
-- 
MST
