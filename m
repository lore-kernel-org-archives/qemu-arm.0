Received: by 10.182.158.201 with SMTP id ww9csp2039211obb;
        Sat, 19 Dec 2015 21:44:05 -0800 (PST)
X-Received: by 10.140.20.144 with SMTP id 16mr16968142qgj.45.1450590245259;
        Sat, 19 Dec 2015 21:44:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64si14585871qgj.38.2015.12.19.21.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 21:44:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAWmq-0006v6-S3
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 00:44:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmo-0006sv-MG
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 00:44:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmn-0000bj-U3
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 00:44:02 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:32809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAWml-0000bE-NU; Sun, 20 Dec 2015 00:43:59 -0500
Received: by mail-pa0-x230.google.com with SMTP id cy9so124879pac.0;
	Sat, 19 Dec 2015 21:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cRfoWX9Hp0b4XYZiz5jDfmSuw6/QXdNiOH4KF+VOcK4=;
	b=ZMNCWc8jwZitOyIcfwCw2tOOVbx3+XfwnkkqMo2E/+rxrZRSjtWmrPc149r277vVv3
	SOG0cmWZf0InWeeZfkeK3/N8MxYCvxbLBXaIfViAoMokQ6HhvHo2gd7pNJ3zomxBajS1
	grx1JlnEuf29iCV5IH1DnzNjx6kCIiQm696Nhx5W26Wto/5/VyJR2xY6Qv7BJyTYKSYI
	YkfbmPdMqFxvHuTMvrVwsj4ego1NiuivyaC3/GJQP7+X7KMiSuTMw0gJizjwjGX/Myfd
	+Oi6f32JQfWZ9w2HbVoa+atAlwpoJRe0y2B8BHMtKLkBxncFmpQQAy0xbCLSF/qJQ/At
	nHkA==
X-Received: by 10.67.3.196 with SMTP id by4mr17461823pad.67.1450590239196;
	Sat, 19 Dec 2015 21:43:59 -0800 (PST)
Received: from localhost.localdomain
	(c211-31-14-155.rochd5.qld.optusnet.com.au. [211.31.14.155])
	by smtp.gmail.com with ESMTPSA id c27sm894550pfd.50.2015.12.19.21.43.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 21:43:58 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 19 Dec 2015 21:43:33 -0800
Message-Id: <72794c95e3ccdadd4db71fe83d9c1855a91148ae.1450570397.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::230
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
	alistair.francis@xilinx.com
Subject: [Qemu-arm] [PATCH v6 1/6] qdev: get_child_bus(): Use QOM lookup if
	available
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
X-TUID: tFxfFmbBOKKB

qbus_realize() adds busses as a QOM child of the device in addition to
adding it to the qdev bus list. Change get_child_bus() to use the QOM
child if it is available. This takes priority over the bus-list, but
the child object is checked for type correctness.

This prepares support for aliasing of buses. The use case is SoCs,
where a SoC container needs to present buses to the board level, but
the buses are implemented by controller IP we already model as self
contained qbus-containing devices.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Currently qbus_realize() ignores errors from object_property_add_child,
so it is hard to guarantee that the QOM linkage is reliable. If it were
the case that that object_property_add_child was supposed to be error
asserting, we could remove the old bus-list strcmp iterator altogether.

 hw/core/qdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index b3ad467..c96c464 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -581,6 +581,12 @@ void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
 BusState *qdev_get_child_bus(DeviceState *dev, const char *name)
 {
     BusState *bus;
+    Object *child = object_resolve_path_component(OBJECT(dev), name);
+
+    bus = (BusState *)object_dynamic_cast(child, TYPE_BUS);
+    if (bus) {
+        return bus;
+    }
 
     QLIST_FOREACH(bus, &dev->child_bus, sibling) {
         if (strcmp(name, bus->name) == 0) {
-- 
1.9.1

