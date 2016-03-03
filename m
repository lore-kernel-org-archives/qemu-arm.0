Received: by 10.25.208.211 with SMTP id h202csp2571185lfg;
        Thu, 3 Mar 2016 00:22:15 -0800 (PST)
X-Received: by 10.140.242.16 with SMTP id n16mr1560609qhc.2.1456993335859;
        Thu, 03 Mar 2016 00:22:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v106si9721683qgd.97.2016.03.03.00.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 00:22:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abOWV-000230-CJ
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 03:22:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abOW0-0001QS-16
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:21:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abOVz-0001fU-50
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:21:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1abOVx-0001ew-6t; Thu, 03 Mar 2016 03:21:41 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id DAA68C00B8EB;
	Thu,  3 Mar 2016 08:21:40 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-147.pek2.redhat.com [10.72.5.147])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u238LKKg010446; Thu, 3 Mar 2016 03:21:32 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 Mar 2016 16:21:10 +0800
Message-Id: <1456993272-32292-2-git-send-email-peterx@redhat.com>
In-Reply-To: <1456993272-32292-1-git-send-email-peterx@redhat.com>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	mdroth@linux.vnet.ibm.com, armbru@redhat.com,
	Peter Xu <peterx@redhat.com>, abologna@redhat.com, qemu-arm@nongnu.org
Subject: [Qemu-devel] [PATCH v2 1/3] arm: qmp: add GICCapability struct
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
X-TUID: gEt7nMnlo58L

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

