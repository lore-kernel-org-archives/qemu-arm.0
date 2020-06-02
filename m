Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4097168lfc;
        Tue, 2 Jun 2020 06:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUbFGwBSfLBJOW9alu7WqobpYlYmfBb/tFJZExnp6Xnw7cUddLTHHZwXUUnnhPINFOItnQ
X-Received: by 2002:a25:cb06:: with SMTP id b6mr40241023ybg.470.1591105933881;
        Tue, 02 Jun 2020 06:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591105933; cv=none;
        d=google.com; s=arc-20160816;
        b=StBj0pZMwMttFaKCL5FnW5wRlKYYNAP3G3MNXRrSRVEo1yiJBTE43RzkzXG1M1IAw6
         6Ct1mK4IaRnqEZKzBYCvtzhw4dAJErbxwPAdvUpMRMANuca5553rrTtTtWZWmIYozl2q
         ZoLuFLDGn+Em0W8P/4cmqjkUttbRg2zyubb+6//cMaBwyJmTKLCR+48jCG6JGQufOCFH
         KlQqJsZ1y0EqwlHnF0kigIeAExF25GtnYTQJWzn5ZsVLbBqEQcXJotfEngXjnt5Wrv1f
         qY7cDvqBEp+ovvyDV5Foheb8k7m1YV4ki54rSu7Wd/kmTiiX1OEDMFxRaXSYkY+rscO4
         4w2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=XWadEG4/edCRX0Cc5K/KU8fxtur9q7/wNqg4Fnusthw=;
        b=y1/G095uBe5sychVF9tJQQRFE2ykRWOYQL5+iEg5Vc3Ozi3C4JrxMVcaH8AOAkwY/n
         9cJdHSkFb7R4KAccxupznbiK0dPPeHXX3Brw0pMXblg+OQ1s8TFS2Anx1sbU8UIbCwmP
         AxCRtBabBfSuYcXf0TiJDcHios0inciavqGCZenw3wCkO8Aes9/N9fmKfMZT+HvfHMtm
         8ef/MxaqHuBfPQ+fjEc2nixwbuMI0RXxVWacKShBqJ1M4LeP+kGTqagOUiDc09DTaO98
         OevJSYio+dYNmiDj4D2lc/UT8KV3PZ+A2q2HTIeE4iWdXToZW/dgC5PSwpP8rXOJDP3C
         GR1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o83si1920849yba.466.2020.06.02.06.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 06:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg7Kv-0004nd-9M
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 09:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jg7Jr-0003tC-4X
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 09:51:07 -0400
Received: from 1.mo173.mail-out.ovh.net ([178.33.111.180]:50923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jg7Jo-0008CF-7V
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 09:51:06 -0400
Received: from player732.ha.ovh.net (unknown [10.110.208.44])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 7625E1425FA
 for <qemu-arm@nongnu.org>; Tue,  2 Jun 2020 15:51:00 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id 2A27E12D4F05A;
 Tue,  2 Jun 2020 13:50:53 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00187efc2a0-7079-4454-b5a0-9e7c81b30e2b,5E62BD569A294C88FEF25C709A17CDFB03A24EB6)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] docs/system: Document Aspeed boards
Date: Tue,  2 Jun 2020 15:50:50 +0200
Message-Id: <20200602135050.593692-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6432266171118947089
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedgheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvdefmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleeugfeuueejgffhfefhjeffheefkeegtdeghfefudffhfekffdvfeetleeileeinecuffhomhgrihhnpehophgvnhhpohifvghrrdighiiinecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.111.180; envelope-from=clg@kaod.org;
 helo=1.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 09:51:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: av0g2utl+eFS

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 85 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 docs/system/arm/aspeed.rst

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
new file mode 100644
index 000000000000..45f891eb3cad
--- /dev/null
+++ b/docs/system/arm/aspeed.rst
@@ -0,0 +1,85 @@
+Aspeed family boards (``*-bmc``, ``ast2500-evb``, ``ast2600-evb``)
+==================================================================
+
+The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
+Aspeed evaluation boards. They are based on different releases of the
+Aspeed SoC : the AST2400 integrating an ARM926EJ-S CPU (400MHz), the
+AST2500 with an ARM1176JZS CPU (800MHz) and more recently the AST2600
+with dual cores ARM Cortex A7 CPUs (1.2GHz).
+
+The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
+etc.
+
+AST2400 SoC based machines :
+
+- ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
+
+AST2500 SoC based machines :
+
+- ``ast2500-evb``          Aspeed AST2500 Evaluation board
+- ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
+- ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
+- ``sonorapass-bmc``       OCP SonoraPass BMC
+- ``swift-bmc``            OpenPOWER Swift BMC POWER9
+
+AST2600 SoC based machines :
+
+- ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex A7)
+- ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
+
+Supported devices
+-----------------
+
+ * SMP (for the AST2600 Cortex-A7)
+ * Interrupt Controller (VIC)
+ * Timer Controller
+ * RTC Controller
+ * I2C Controller
+ * System Control Unit (SCU)
+ * SRAM mapping
+ * X-DMA Controller (basic interface)
+ * Static Memory Controller (SMC or FMC) - Only SPI Flash support
+ * SPI Memory Controller
+ * USB 2.0 Controller
+ * SD/MMC storage controllers
+ * SDRAM controller (dummy interface for basic settings and training)
+ * Watchdog Controller
+ * GPIO Controller (Master only)
+ * UART
+ * Ethernet controllers
+
+
+Missing devices
+---------------
+
+ * Coprocessor support
+ * ADC (out of tree implementation)
+ * PWM and Fan Controller
+ * LPC Bus Controller
+ * Slave GPIO Controller
+ * Super I/O Controller
+ * Hash/Crypto Engine
+ * PCI-Express 1 Controller
+ * Graphic Display Controller
+ * PECI Controller
+ * MCTP Controller
+ * Mailbox Controller
+ * Virtual UART
+ * eSPI Controller
+ * I3C Controller
+
+Boot options
+------------
+
+The Aspeed machines can be started using the -kernel option to load a
+Linux kernel or from a firmare image which can be downloaded from the
+OpenPOWER jenkins :
+
+   https://openpower.xyz/
+
+The image should be attached as an MTD drive. Run :
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M romulus-bmc -nic user \
+	-drive file=flash-romulus,format=raw,if=mtd -nographic
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index dce384cb0e3e..1bd477a2936c 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -81,6 +81,7 @@ undocumented; you can get a complete list by running
    arm/realview
    arm/versatile
    arm/vexpress
+   arm/aspeed
    arm/musicpal
    arm/nseries
    arm/orangepi
-- 
2.25.4

