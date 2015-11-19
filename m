Received: by 10.182.158.201 with SMTP id ww9csp2002838obb;
        Thu, 19 Nov 2015 06:53:57 -0800 (PST)
X-Received: by 10.31.41.74 with SMTP id p71mr5450522vkp.103.1447944837586;
        Thu, 19 Nov 2015 06:53:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b69si4348579vkf.122.2015.11.19.06.53.57
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 19 Nov 2015 06:53:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzQaz-000896-9w
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 09:53:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ZzQax-00087i-1b
	for qemu-arm@nongnu.org; Thu, 19 Nov 2015 09:53:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ZzQar-00011x-Sn
	for qemu-arm@nongnu.org; Thu, 19 Nov 2015 09:53:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1ZzQar-00011t-Mz; Thu, 19 Nov 2015 09:53:49 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 4B23C8EFC1;
	Thu, 19 Nov 2015 14:53:49 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-106.ams2.redhat.com
	[10.36.116.106])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJEreNJ000808; Thu, 19 Nov 2015 09:53:45 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 Nov 2015 09:53:33 -0500
Message-Id: <1447944817-13286-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1447944817-13286-1-git-send-email-drjones@redhat.com>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH 1/5] qapi-schema: dump-guest-memory: Improve text
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
X-TUID: /QQubl0EHUpS

dump-guest-memory is supported by more than just x86, however
the paging option is not.

(No functional change.)

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 qapi-schema.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 8b1a423fa7973..ebbad01c40948 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -2089,8 +2089,7 @@
 # @dump-guest-memory
 #
 # Dump guest's memory to vmcore. It is a synchronous operation that can take
-# very long depending on the amount of guest memory. This command is only
-# supported on i386 and x86_64.
+# very long depending on the amount of guest memory.
 #
 # @paging: if true, do paging to get guest's memory mapping. This allows
 #          using gdb to process the core file.
@@ -2106,6 +2105,7 @@
 #             2. The guest can be in real-mode even if paging is enabled. For
 #                example, the guest uses ACPI to sleep, and ACPI sleep state
 #                goes in real-mode
+#             3. Currently only supported on i386 and x86_64.
 #
 # @protocol: the filename or file descriptor of the vmcore. The supported
 #            protocols are:
-- 
2.4.3

