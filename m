Received: by 10.25.159.19 with SMTP id i19csp102187lfe;
        Mon, 11 Jan 2016 11:56:41 -0800 (PST)
X-Received: by 10.140.163.6 with SMTP id j6mr43901805qhj.36.1452542201084;
        Mon, 11 Jan 2016 11:56:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w80si84267177qhw.30.2016.01.11.11.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 11:56:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIia0-00038L-QA
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 14:56:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiZy-000389-UA
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 14:56:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIiZx-0002qC-9R
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 14:56:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aIiZx-0002q8-4O; Mon, 11 Jan 2016 14:56:37 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id A1DFFC0BF2C2;
	Mon, 11 Jan 2016 19:56:36 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u0BJuU1i012743; Mon, 11 Jan 2016 14:56:34 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 20:56:18 +0100
Message-Id: <1452542185-10914-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1452542185-10914-1-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v4 1/8] qapi-schema: dump-guest-memory: Improve
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
X-TUID: YfNCEDOLkjik

dump-guest-memory is supported by more than just x86, however
the paging option is not.

(No functional change.)

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi-schema.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 2e31733b215bc..0c75465031013 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -2169,8 +2169,7 @@
 # @dump-guest-memory
 #
 # Dump guest's memory to vmcore. It is a synchronous operation that can take
-# very long depending on the amount of guest memory. This command is only
-# supported on i386 and x86_64.
+# very long depending on the amount of guest memory.
 #
 # @paging: if true, do paging to get guest's memory mapping. This allows
 #          using gdb to process the core file.
@@ -2186,6 +2185,7 @@
 #             2. The guest can be in real-mode even if paging is enabled. For
 #                example, the guest uses ACPI to sleep, and ACPI sleep state
 #                goes in real-mode
+#             3. Currently only supported on i386 and x86_64.
 #
 # @protocol: the filename or file descriptor of the vmcore. The supported
 #            protocols are:
-- 
2.4.3

