Received: by 10.182.158.201 with SMTP id ww9csp498923obb;
        Thu, 17 Dec 2015 08:35:31 -0800 (PST)
X-Received: by 10.140.102.35 with SMTP id v32mr71185882qge.72.1450370131458;
        Thu, 17 Dec 2015 08:35:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a141si11995088qkb.16.2015.12.17.08.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 08:35:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9bWc-0007Bv-VQ
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 11:35:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9bWb-00079P-3L
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 11:35:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9bWZ-0003sN-1D
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 11:35:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a9bWY-0003s0-Sj; Thu, 17 Dec 2015 11:35:26 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 7D14A349E49;
	Thu, 17 Dec 2015 16:35:26 +0000 (UTC)
Received: from blackfin.pond.sub.org ([10.3.113.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBHGZOx3001299
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 17 Dec 2015 11:35:26 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5A8D0300185E; Thu, 17 Dec 2015 17:35:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 17 Dec 2015 17:35:15 +0100
Message-Id: <1450370121-5768-8-git-send-email-armbru@redhat.com>
In-Reply-To: <1450370121-5768-1-git-send-email-armbru@redhat.com>
References: <1450370121-5768-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH v3 07/13] hw/arm/virt: Fix property "gic-version"
	error handling
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
X-TUID: w5rK66aGpJij

virt_set_gic_version() calls exit(1) when passed an invalid property
value.  Property setters are not supposed to do that.  Screwed up in
commit b92ad39.  Harmless, because the property belongs to a machine.
Set an error object instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/virt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9c6792c..2a120dd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1126,9 +1126,8 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     } else if (!strcmp(value, "host")) {
         vms->gic_version = 0; /* Will probe later */
     } else {
-        error_report("Invalid gic-version option value");
-        error_printf("Allowed gic-version values are: 3, 2, host\n");
-        exit(1);
+        error_setg(errp, "Invalid gic-version value");
+        error_append_hint(errp, "Valid values are: 3, 2, host\n");
     }
 }
 
-- 
2.4.3

