Received: by 10.25.208.211 with SMTP id h202csp1453224lfg;
        Tue, 16 Feb 2016 10:21:19 -0800 (PST)
X-Received: by 10.55.81.2 with SMTP id f2mr29158090qkb.87.1455646876441;
        Tue, 16 Feb 2016 10:21:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f89si41738223qga.111.2016.02.16.10.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:21:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkFP-0004Ry-SD
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:21:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4d-0002Cy-Cm
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:10:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4Z-0005vK-HM
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:10:07 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4X-0005sC-0x; Tue, 16 Feb 2016 13:10:01 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4P-0003S7-2s; Tue, 16 Feb 2016 18:09:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 18:09:43 +0000
Message-Id: <1455646193-13238-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH v3 01/10] hw/sd/sdhci.c: Remove x-drive property
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
X-TUID: Dd3xGFkdqnDt

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
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/sd/sdhci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 30e3bf4..3d1eb85 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1220,12 +1220,6 @@ const VMStateDescription sdhci_vmstate = {
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

