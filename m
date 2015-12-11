Received: by 10.182.158.201 with SMTP id ww9csp170534obb;
        Fri, 11 Dec 2015 08:37:43 -0800 (PST)
X-Received: by 10.141.0.194 with SMTP id b185mr16386864qhd.23.1449851863089;
        Fri, 11 Dec 2015 08:37:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z204si20809647qka.99.2015.12.11.08.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 08:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7QhS-0007kA-Ru
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 11:37:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7Qh7-0007S9-Kw
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:37:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7Qh6-0006Qo-OV
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:37:21 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7Qh6-0006Pi-IR; Fri, 11 Dec 2015 11:37:20 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7Qgx-0001Id-9i; Fri, 11 Dec 2015 16:37:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 11 Dec 2015 16:37:02 +0000
Message-Id: <1449851831-4966-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	patches@linaro.org, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-devel] [PATCH 01/10] hw/sd/sdhci.c: Remove x-drive property
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
X-TUID: l2EwPx52Ni8P

The following commits will remove support for the old sdhci-pci
command line syntax using the x-drive property:
 -device sdhci-pci,x-drive=mydrive -drive id=mydrive,[...]
and replace it with an explicit sd device:
 -device sdhci-pci -drive id=mydrive,[...] -device sd,drive=mydrive

(This is OK because x-drive is experimental.)

This commit removes the x-drive property so that old style
command lines will fail with a reasonable error message:
  -device sdhci-pci,x-drive=mydrive: Property '.x-drive' not found

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/sdhci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8612760..991c9b5 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1221,12 +1221,6 @@ const VMStateDescription sdhci_vmstate = {
 /* Capabilities registers provide information on supported features of this
  * specific host controller implementation */
 static Property sdhci_pci_properties[] = {
-    /*
-     * We currently fuse controller and card into a single device
-     * model, but we intend to separate them.  For that purpose, the
-     * properties that belong to the card are marked as experimental.
-     */
-    DEFINE_PROP_DRIVE("x-drive", SDHCIState, blk),
     DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
             SDHC_CAPAB_REG_DEFAULT),
     DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
-- 
1.9.1

