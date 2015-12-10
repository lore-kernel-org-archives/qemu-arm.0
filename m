Received: by 10.182.158.201 with SMTP id ww9csp385404obb;
        Thu, 10 Dec 2015 02:30:49 -0800 (PST)
X-Received: by 10.140.157.145 with SMTP id d139mr5524106qhd.19.1449743449483;
        Thu, 10 Dec 2015 02:30:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si14154842qku.93.2015.12.10.02.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 02:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6yUr-0000p7-6n
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 05:30:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a6yTm-0007n0-Ur
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 05:29:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a6yTl-0007QQ-VP
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 05:29:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a6yTj-0007Nl-1K; Thu, 10 Dec 2015 05:29:39 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id B126BC0B7A06;
	Thu, 10 Dec 2015 10:29:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-204-39.brq.redhat.com
	[10.40.204.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAATZFo006060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 10 Dec 2015 05:29:38 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A9CF33002534; Thu, 10 Dec 2015 11:29:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 10 Dec 2015 11:29:26 +0100
Message-Id: <1449743372-17169-7-git-send-email-armbru@redhat.com>
In-Reply-To: <1449743372-17169-1-git-send-email-armbru@redhat.com>
References: <1449743372-17169-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [Qemu-devel] [PATCH 06/12] hw/arm/virt: Fix property "gic-version"
	error handling
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
X-TUID: 22kxjWaCmqvE

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

