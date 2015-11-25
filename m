Received: by 10.182.158.201 with SMTP id ww9csp2404287obb;
        Tue, 24 Nov 2015 16:38:16 -0800 (PST)
X-Received: by 10.31.131.201 with SMTP id f192mr30467628vkd.90.1448411895177;
        Tue, 24 Nov 2015 16:38:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i3si20966665vki.131.2015.11.24.16.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 16:38:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1O6A-0005VY-RF
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 19:38:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O68-0005Ty-8x
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O67-0002DS-03
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48023)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a1O66-0002D8-QS; Tue, 24 Nov 2015 19:38:10 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 7AB8F43;
	Wed, 25 Nov 2015 00:38:10 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAP0c1rw014074; Tue, 24 Nov 2015 19:38:06 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 19:37:52 -0500
Message-Id: <1448411877-22019-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1448411877-22019-1-git-send-email-drjones@redhat.com>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v2 1/6] qapi-schema: dump-guest-memory: Improve
	text
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
X-TUID: oUyYG3+rZwfQ

dump-guest-memory is supported by more than just x86, however
the paging option is not.

(No functional change.)

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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

