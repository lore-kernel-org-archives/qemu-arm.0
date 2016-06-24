Received: by 10.25.21.96 with SMTP id l93csp945038lfi;
        Fri, 24 Jun 2016 02:25:21 -0700 (PDT)
X-Received: by 10.200.49.73 with SMTP id h9mr3301860qtb.60.1466760321698;
        Fri, 24 Jun 2016 02:25:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o131si4245664qka.76.2016.06.24.02.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 02:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGNMW-0006uj-Vi
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 05:25:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bGNMT-0006uc-9a
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 05:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bGNMP-0005Gg-5b
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 05:25:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bGNMO-0005Ga-W7; Fri, 24 Jun 2016 05:25:13 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 081F278231;
	Fri, 24 Jun 2016 09:25:12 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-34.ams2.redhat.com [10.36.116.34])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5O9P7DH029926; Fri, 24 Jun 2016 05:25:09 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 11:25:06 +0200
Message-Id: <1466760306-21849-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 24 Jun 2016 09:25:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] arm: Re-enable tmp105 test
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s3MmyHD0st8b

The tmp105 test is currently not executed since the following
line in the Makefile overwrites the check-qtest-arm-y variable
instead of extending it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index fd2dba4..6c09962 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -251,7 +251,7 @@ check-qtest-sparc64-y = tests/endianness-test$(EXESUF)
 gcov-files-sparc-y += hw/timer/m48t59.c
 gcov-files-sparc64-y += hw/timer/m48t59.c
 check-qtest-arm-y = tests/tmp105-test$(EXESUF)
-check-qtest-arm-y = tests/ds1338-test$(EXESUF)
+check-qtest-arm-y += tests/ds1338-test$(EXESUF)
 gcov-files-arm-y += hw/misc/tmp105.c
 check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
 gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
-- 
1.8.3.1

