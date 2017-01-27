Received: by 10.25.77.65 with SMTP id a62csp316116lfb;
        Fri, 27 Jan 2017 08:29:10 -0800 (PST)
X-Received: by 10.237.34.125 with SMTP id o58mr8506057qtc.95.1485534550529;
        Fri, 27 Jan 2017 08:29:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z145si3876340qka.13.2017.01.27.08.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jan 2017 08:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cX9Oe-0005Ad-1T
	for alex.bennee@linaro.org; Fri, 27 Jan 2017 11:29:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <SRS0=IsLg=ZJ=redhat.com=mst@kernel.org>)
	id 1cX9Mx-0004Ck-35
	for qemu-devel@nongnu.org; Fri, 27 Jan 2017 11:27:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <SRS0=IsLg=ZJ=redhat.com=mst@kernel.org>)
	id 1cX9Mw-0007Qp-At
	for qemu-devel@nongnu.org; Fri, 27 Jan 2017 11:27:23 -0500
Received: from mail.kernel.org ([198.145.29.136]:44272)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <SRS0=IsLg=ZJ=redhat.com=mst@kernel.org>)
	id 1cX9Mq-0007OQ-1u; Fri, 27 Jan 2017 11:27:16 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 362D720499;
	Fri, 27 Jan 2017 16:27:13 +0000 (UTC)
Received: from redhat.com (pool-96-237-166-50.bstnma.fios.verizon.net
	[96.237.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 053CE20495;
	Fri, 27 Jan 2017 16:27:11 +0000 (UTC)
Date: Fri, 27 Jan 2017 18:27:10 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1485534415-20887-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.8.0.287.g0deeb61
X-Mutt-Fcc: =sent
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-devel] [PATCH 1/3] arm: better stub version for MISMATCH_CHECK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kymDSnY7k4VM

stub version of MISMATCH_CHECK is empty so it's easy to misuse for
people not building kvm on arm.  Use QEMU_BUILD_BUG_ON similar to the
non-stub version to make it easier to catch bugs.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 target/arm/kvm-consts.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index a2c9518..06b6c92 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -21,7 +21,9 @@
 #define MISMATCH_CHECK(X, Y) QEMU_BUILD_BUG_ON(X != Y)
 
 #else
-#define MISMATCH_CHECK(X, Y)
+
+#define MISMATCH_CHECK(X, Y) QEMU_BUILD_BUG_ON(0)
+
 #endif
 
 #define CP_REG_SIZE_SHIFT 52
-- 
MST

