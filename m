Received: by 10.25.159.19 with SMTP id i19csp1197524lfe;
        Wed, 13 Jan 2016 07:45:36 -0800 (PST)
X-Received: by 10.140.88.202 with SMTP id t68mr35765274qgd.86.1452699936832;
        Wed, 13 Jan 2016 07:45:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c16si1845834qkb.85.2016.01.13.07.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 07:45:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJNc8-0007UF-CK
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 10:45:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aJNaM-00040M-N0
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 10:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aJNaL-00015x-Lp
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 10:43:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aJNaL-00015R-GC; Wed, 13 Jan 2016 10:43:45 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 157EA36B377;
	Wed, 13 Jan 2016 15:43:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-28.phx2.redhat.com
	[10.3.113.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0DFhhKE019252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 13 Jan 2016 10:43:44 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 158A93043FCE; Wed, 13 Jan 2016 16:43:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jan 2016 16:43:08 +0100
Message-Id: <1452699819-26608-11-git-send-email-armbru@redhat.com>
In-Reply-To: <1452699819-26608-1-git-send-email-armbru@redhat.com>
References: <1452699819-26608-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PULL 10/41] hw/arm/virt: Fix property "gic-version"
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
X-TUID: j9+RnxkyA9tv

virt_set_gic_version() calls exit(1) when passed an invalid property
value.  Property setters are not supposed to do that.  Screwed up in
commit b92ad39.  Harmless, because the property belongs to a machine.
Set an error object instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fd52b76..92dcd02 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1200,9 +1200,8 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     } else if (!strcmp(value, "host")) {
         vms->gic_version = 0; /* Will probe later */
     } else {
-        error_report("Invalid gic-version option value");
-        error_printf("Allowed gic-version values are: 3, 2, host\n");
-        exit(1);
+        error_setg(errp, "Invalid gic-version value");
+        error_append_hint(errp, "Valid values are 3, 2, host.\n");
     }
 }
 
-- 
2.4.3

