Received: by 10.80.166.35 with SMTP id d32csp193500edc;
        Tue, 11 Oct 2016 13:41:48 -0700 (PDT)
X-Received: by 10.200.50.78 with SMTP id y14mr4972446qta.57.1476218508620;
        Tue, 11 Oct 2016 13:41:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o188si2274142qkc.317.2016.10.11.13.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 13:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu3rw-0000hp-3k
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 16:41:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bu3ro-0000fb-VS
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 16:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bu3rn-0000Uu-Rl
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 16:41:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bu3rn-0000Un-LS; Tue, 11 Oct 2016 16:41:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24062C05681A;
	Tue, 11 Oct 2016 20:41:39 +0000 (UTC)
Received: from localhost (ovpn-116-77.phx2.redhat.com [10.3.116.77])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BKfcEm014515; Tue, 11 Oct 2016 16:41:38 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 11 Oct 2016 17:41:19 -0300
Message-Id: <1476218479-3592-7-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1476218479-3592-1-git-send-email-ehabkost@redhat.com>
References: <1476218479-3592-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 11 Oct 2016 20:41:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 6/6] qdev: Warning about using
 object_class_property_add() in new code
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
	"Daniel P. Berrange" <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7GdLlPMuslsi

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
index 831414d..626f844 100644
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

