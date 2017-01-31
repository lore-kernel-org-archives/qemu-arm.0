Received: by 10.25.77.65 with SMTP id a62csp38055lfb;
        Tue, 31 Jan 2017 12:48:27 -0800 (PST)
X-Received: by 10.200.46.6 with SMTP id r6mr26893646qta.251.1485895707460;
        Tue, 31 Jan 2017 12:48:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y38si12828862qtb.249.2017.01.31.12.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 12:48:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYfLm-0007O6-TO
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 15:48:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <SRS0=CMim=ZN=redhat.com=mst@kernel.org>)
	id 1cYeuR-0004Zy-T9
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 15:20:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <SRS0=CMim=ZN=redhat.com=mst@kernel.org>)
	id 1cYeuR-0004Ys-5C
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 15:20:11 -0500
Received: from mail.kernel.org ([198.145.29.136]:53026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <SRS0=CMim=ZN=redhat.com=mst@kernel.org>)
	id 1cYeuQ-0004Yc-W3; Tue, 31 Jan 2017 15:20:11 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 6C75020225;
	Tue, 31 Jan 2017 20:20:09 +0000 (UTC)
Received: from redhat.com (pool-96-237-166-50.bstnma.fios.verizon.net
	[96.237.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 35B9520212;
	Tue, 31 Jan 2017 20:20:08 +0000 (UTC)
Date: Tue, 31 Jan 2017 22:20:06 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1485893872-26524-22-git-send-email-mst@redhat.com>
References: <1485893872-26524-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485893872-26524-1-git-send-email-mst@redhat.com>
X-Mailer: git-send-email 2.8.0.287.g0deeb61
X-Mutt-Fcc: =sent
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PULL v5 21/22] arm: better stub version for
 MISMATCH_CHECK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WTbIxZRCT8Q6

stub version of MISMATCH_CHECK is empty so it's easy to misuse for
people not building kvm on arm.  Use QEMU_BUILD_BUG_ON similar to the
non-stub version to make it easier to catch bugs.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

