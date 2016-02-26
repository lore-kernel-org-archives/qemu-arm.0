Received: by 10.25.208.211 with SMTP id h202csp3355422lfg;
        Fri, 26 Feb 2016 05:25:11 -0800 (PST)
X-Received: by 10.140.101.147 with SMTP id u19mr1867094qge.71.1456493111166;
        Fri, 26 Feb 2016 05:25:11 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l34si13136387qgf.84.2016.02.26.05.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 05:25:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZIOM-0005Sj-Iq
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 08:25:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aZINT-0003xe-Jb
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 08:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aZINS-0006xD-Po
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 08:24:15 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aZINS-0006wk-J2; Fri, 26 Feb 2016 08:24:14 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aZINJ-0003Fb-AF; Fri, 26 Feb 2016 13:24:05 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Feb 2016 13:24:03 +0000
Message-Id: <1456493044-10025-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456493044-10025-1-git-send-email-peter.maydell@linaro.org>
References: <1456493044-10025-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, patches@linaro.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-devel] [PATCH 1/2] sd.c: Handle NULL block backend in
	sd_get_inserted()
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
X-TUID: lxk04hz/PJzZ

The sd.c SD card emulation code can be in a state where the
SDState BlockBackend pointer is NULL; this is treated as
"card not present". Add a missing check to sd_get_inserted()
so that we don't segfault in this situation.

(This could be provoked by the guest writing to the SDHCI
register to do a reset on a xilinx-zynq-a9 board; it will
also happen at startup when sdhci implements its DeviceClass
reset method.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index edb6b32..00c320d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -449,7 +449,7 @@ static void sd_reset(DeviceState *dev)
 
 static bool sd_get_inserted(SDState *sd)
 {
-    return blk_is_inserted(sd->blk);
+    return sd->blk && blk_is_inserted(sd->blk);
 }
 
 static bool sd_get_readonly(SDState *sd)
-- 
1.9.1

