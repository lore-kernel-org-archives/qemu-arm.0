Received: by 10.80.166.35 with SMTP id d32csp177227edc;
        Wed, 26 Oct 2016 10:12:54 -0700 (PDT)
X-Received: by 10.36.41.129 with SMTP id p123mr7284783itp.105.1477501974019;
        Wed, 26 Oct 2016 10:12:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 86si3408160ioq.55.2016.10.26.10.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 10:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzRkz-0007oK-92
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 13:12:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bzR6Z-0006jC-7f
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 12:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bzR6Y-0003Up-CV
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 12:31:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bzR6S-0003T0-Qe; Wed, 26 Oct 2016 12:31:00 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19187155E3;
	Wed, 26 Oct 2016 16:31:00 +0000 (UTC)
Received: from localhost (ovpn-116-163.phx2.redhat.com [10.3.116.163])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9QGUw95001439; Wed, 26 Oct 2016 12:30:59 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Oct 2016 14:30:26 -0200
Message-Id: <1477499426-9550-9-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1477499426-9550-1-git-send-email-ehabkost@redhat.com>
References: <1477499426-9550-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 26 Oct 2016 16:31:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 8/8] qdev: Warning about using
 object_class_property_add() in new code
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +4Areg5v/4yC

The only remaining user of object_class_property_add() is
arm_cpu_post_init(), but removing it may take some work. While we
don't change it, warn people to not use the function in new code.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index a88753c..53cbaad 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -813,6 +813,10 @@ static void qdev_property_set_to_default(DeviceState *dev, Property *prop,
  * Add a static QOM property to @dev for qdev property @prop.
  * On error, store error in @errp.  Static properties access data in a struct.
  * The type of the QOM property is derived from prop->info.
+ *
+ * Do not use this in new code. Either use qdev_class_set_props(),
+ * or register regular QOM properties using object_property_add() or
+ * object_class_property_add().
  */
 void qdev_property_add_static(DeviceState *dev, Property *prop,
                               Error **errp)
-- 
2.7.4

