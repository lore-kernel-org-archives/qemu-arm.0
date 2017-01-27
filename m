Received: by 10.25.77.65 with SMTP id a62csp315521lfb;
        Fri, 27 Jan 2017 08:27:29 -0800 (PST)
X-Received: by 10.200.55.112 with SMTP id p45mr9012509qtb.278.1485534449591;
        Fri, 27 Jan 2017 08:27:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si3849297qtg.239.2017.01.27.08.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jan 2017 08:27:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cX9N1-0004Dg-01
	for alex.bennee@linaro.org; Fri, 27 Jan 2017 11:27:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <SRS0=IsLg=ZJ=redhat.com=mst@kernel.org>)
	id 1cX9Mv-0004Bm-Fl
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 11:27:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <SRS0=IsLg=ZJ=redhat.com=mst@kernel.org>)
	id 1cX9Mu-0007Q8-In
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 11:27:21 -0500
Received: from mail.kernel.org ([198.145.29.136]:44332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <SRS0=IsLg=ZJ=redhat.com=mst@kernel.org>)
	id 1cX9Mu-0007Pm-Bk; Fri, 27 Jan 2017 11:27:20 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 7D1C720495;
	Fri, 27 Jan 2017 16:27:18 +0000 (UTC)
Received: from redhat.com (pool-96-237-166-50.bstnma.fios.verizon.net
	[96.237.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 06DD320483;
	Fri, 27 Jan 2017 16:27:16 +0000 (UTC)
Date: Fri, 27 Jan 2017 18:27:16 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1485534415-20887-3-git-send-email-mst@redhat.com>
References: <1485534415-20887-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485534415-20887-1-git-send-email-mst@redhat.com>
X-Mailer: git-send-email 2.8.0.287.g0deeb61
X-Mutt-Fcc: =sent
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 3/3] ppc: switch to constants within BUILD_BUG_ON
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X6Xqb6ze0JO/

We are switching BUILD_BUG_ON to verify that it's parameter is a
compile-time constant, and it turns out that some gcc versions
(specifically gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609) are
not smart enough to figure it out for expressions involving local
variables. This is harmless but means that the check is ineffective for
these platforms.  To fix, replace the variable with macros.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/ppc/spapr.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a642e66..b81f2ac 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2630,8 +2630,8 @@ static void spapr_phb_placement(sPAPRMachineState *spapr, uint32_t index,
      * 1TiB 64-bit MMIO windows for each PHB.
      */
     const uint64_t base_buid = 0x800000020000000ULL;
-    const int max_phbs =
-        (SPAPR_PCI_LIMIT - SPAPR_PCI_BASE) / SPAPR_PCI_MEM64_WIN_SIZE - 1;
+#define SPAPR_MAX_PHBS ((SPAPR_PCI_LIMIT - SPAPR_PCI_BASE) / \
+                        SPAPR_PCI_MEM64_WIN_SIZE - 1)
     int i;
 
     /* Sanity check natural alignments */
@@ -2640,12 +2640,14 @@ static void spapr_phb_placement(sPAPRMachineState *spapr, uint32_t index,
     QEMU_BUILD_BUG_ON((SPAPR_PCI_MEM64_WIN_SIZE % SPAPR_PCI_MEM32_WIN_SIZE) != 0);
     QEMU_BUILD_BUG_ON((SPAPR_PCI_MEM32_WIN_SIZE % SPAPR_PCI_IO_WIN_SIZE) != 0);
     /* Sanity check bounds */
-    QEMU_BUILD_BUG_ON((max_phbs * SPAPR_PCI_IO_WIN_SIZE) > SPAPR_PCI_MEM32_WIN_SIZE);
-    QEMU_BUILD_BUG_ON((max_phbs * SPAPR_PCI_MEM32_WIN_SIZE) > SPAPR_PCI_MEM64_WIN_SIZE);
+    QEMU_BUILD_BUG_ON((SPAPR_MAX_PHBS * SPAPR_PCI_IO_WIN_SIZE) >
+                      SPAPR_PCI_MEM32_WIN_SIZE);
+    QEMU_BUILD_BUG_ON((SPAPR_MAX_PHBS * SPAPR_PCI_MEM32_WIN_SIZE) >
+                      SPAPR_PCI_MEM64_WIN_SIZE);
 
-    if (index >= max_phbs) {
+    if (index >= SPAPR_MAX_PHBS) {
         error_setg(errp, "\"index\" for PAPR PHB is too large (max %u)",
-                   max_phbs - 1);
+                   SPAPR_MAX_PHBS - 1);
         return;
     }
 
-- 
MST

