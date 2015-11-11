Received: by 10.182.105.169 with SMTP id gn9csp2601032obb;
        Wed, 11 Nov 2015 13:43:30 -0800 (PST)
X-Received: by 10.129.104.197 with SMTP id d188mr12530144ywc.219.1447278210079;
        Wed, 11 Nov 2015 13:43:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q131si7874942ywg.149.2015.11.11.13.43.29
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 11 Nov 2015 13:43:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwdAv-0000iJ-KJ
	for alex.bennee@linaro.org; Wed, 11 Nov 2015 16:43:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ZwdAU-00009I-ML
	for qemu-devel@nongnu.org; Wed, 11 Nov 2015 16:43:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ZwdAT-0003s6-Rc
	for qemu-devel@nongnu.org; Wed, 11 Nov 2015 16:43:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1ZwdAP-0003qq-Id; Wed, 11 Nov 2015 16:42:57 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id AC971B4C4D;
	Wed, 11 Nov 2015 21:42:55 +0000 (UTC)
Received: from localhost (ovpn-113-50.phx2.redhat.com [10.3.113.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tABLgr5W010628; Wed, 11 Nov 2015 16:42:54 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: balrogg@gmail.com
Date: Wed, 11 Nov 2015 19:42:47 -0200
Message-Id: <1447278167-320-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH] nseries: Don't use qemu_hw_version()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l02VW97bmPra

nseries doesn't use qemu_set_hw_version() and doesn't need the
compatibility magic of qemu_hw_version(). Use QEMU_VERSION
directly.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/nseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 2a8835e..f1eab73 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1275,7 +1275,7 @@ static int n8x0_atag_setup(void *p, int model)
     strcpy((void *) w, "hw-build");		/* char component[12] */
     w += 6;
     strcpy((void *) w, "QEMU ");
-    pstrcat((void *) w, 12, qemu_hw_version()); /* char version[12] */
+    pstrcat((void *) w, 12, QEMU_VERSION); /* char version[12] */
     w += 6;
 
     tag = (model == 810) ? "1.1.10-qemu" : "1.1.6-qemu";
-- 
2.1.0

