Received: by 10.25.208.211 with SMTP id h202csp1190007lfg;
        Sun, 6 Mar 2016 20:24:52 -0800 (PST)
X-Received: by 10.55.73.85 with SMTP id w82mr26250410qka.52.1457324692404;
        Sun, 06 Mar 2016 20:24:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e5si15192749qkb.92.2016.03.06.20.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 20:24:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acmix-0007fl-TM
	for alex.bennee@linaro.org; Sun, 06 Mar 2016 23:24:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1acmi1-0006CR-9U
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 23:23:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1acmi0-0005Yc-EW
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 23:23:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1acmi0-0005YY-9A; Sun, 06 Mar 2016 23:23:52 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id ED877C0006FF;
	Mon,  7 Mar 2016 04:23:51 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-200.pek2.redhat.com [10.72.5.200])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u274NYnS001687; Sun, 6 Mar 2016 23:23:44 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 12:23:26 +0800
Message-Id: <1457324608-11434-2-git-send-email-peterx@redhat.com>
In-Reply-To: <1457324608-11434-1-git-send-email-peterx@redhat.com>
References: <1457324608-11434-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v3 1/3] arm: qmp: add GICCapability struct
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
X-TUID: BeY912ysymjm

Define new struct to describe whether we support specific GIC version.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 qapi-schema.json | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/qapi-schema.json b/qapi-schema.json
index 7b8f2a1..0b2de6c 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -4135,3 +4135,25 @@
 ##
 { 'enum': 'ReplayMode',
   'data': [ 'none', 'record', 'play' ] }
+
+##
+# @GICCapability:
+#
+# This struct describes capability for a specific GIC version. These
+# bits are not only decided by QEMU/KVM software version, but also
+# decided by the hardware that the program is running upon.
+#
+# @version:  version of GIC to be described.
+#
+# @emulated: whether current QEMU/hardware supports emulated GIC
+#            device in user space.
+#
+# @kernel:   whether current QEMU/hardware supports hardware
+#            accelerated GIC device in kernel.
+#
+# Since: 2.6
+##
+{ 'struct': 'GICCapability',
+  'data': { 'version': 'int',
+            'emulated': 'bool',
+            'kernel': 'bool' } }
-- 
2.4.3

