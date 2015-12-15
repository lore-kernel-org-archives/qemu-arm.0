Received: by 10.182.158.201 with SMTP id ww9csp2758081obb;
        Tue, 15 Dec 2015 14:51:40 -0800 (PST)
X-Received: by 10.140.27.228 with SMTP id 91mr56635135qgx.78.1450219899111;
        Tue, 15 Dec 2015 14:51:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q72si3320261qki.80.2015.12.15.14.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 14:51:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8yRV-0004Cw-Na
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 17:51:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yRT-0004Cj-W1
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:51:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yRS-0001Ui-V3
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:51:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a8yRS-0001Uc-Q1; Tue, 15 Dec 2015 17:51:34 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 57416690;
	Tue, 15 Dec 2015 22:51:34 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBFMpNh2024186; Tue, 15 Dec 2015 17:51:30 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Dec 2015 16:51:10 -0600
Message-Id: <1450219878-5293-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1450219878-5293-1-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v3 1/9] qapi-schema: dump-guest-memory: Improve
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
X-TUID: ZoAjgGqe61tu

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

