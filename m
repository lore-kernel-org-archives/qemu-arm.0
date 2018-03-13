Received: by 10.28.91.67 with SMTP id p64csp852783wmb;
        Tue, 13 Mar 2018 08:39:14 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs2ktQ7HOk1RQhZI1a4zDn+BMwfwqHg69BXk2DpsIe+AmTsPq6V2XeAiKRBvq+3TYf8U0F5
X-Received: by 10.55.198.3 with SMTP id b3mr1562667qkj.196.1520955554345;
        Tue, 13 Mar 2018 08:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955554; cv=none;
        d=google.com; s=arc-20160816;
        b=wNYadFMrdrSLhYS10wUzOTJvrVOPCw3aXYfqNLHOCC3JyPPD8zkHqh8U7+lOHWwZR0
         sEbJEDbrPCKtNSvETDWTgGADu+w1W92XtJDqIr0rxa0y1c+SV6j0SJ4SoWFi/Ee2r3EB
         mr76OmWObS03xafdGUZ2OOAtF4vEJA+jM4yJ99wx86dSO+9w+4FyU/qal/+3VXoRoB2s
         5LC6cXl96mb7P2fI3yFHPJglCr1ZMVLdxFZb378KmTKyV66hsq/oylfooY9qlGUiksjn
         5vwPW0b8xNM7q0xpzPRq67rEK3vOpyy0ndhgDzyMXinERFyav4vPGeldAzzhDsd6FjHT
         De5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Moax0p294uKndt3CiguMn4SsRQy9dHzyxg2cfG3e5vo=;
        b=Z1G+tZSeGXQ8s7Ev3lheGKUk46BJ4VoZF5aMxkSKBEDrelehEG2vromUcYR4jS4QCa
         yzGicuRmnoifLDaNriDQiA2JmtdC2JelFyR9fPzNUlGQuZ/F4K1QjP7PzV8btCFHcvNQ
         zuXlhFSaOgURunahZX+QIx/JzTq8fW12Uv+ytOgwd8IWDyBi7frLNIrILx9D0PoCJu0y
         PBpZW5l55HRmpfX7kVvd5+Hwg9AEJptF12uOH7THf5AlSu/MnYmN1+uHlyf5dTN6VGs4
         CRfXAMScjm0g4FzpjQrEIZ0gMfUXLPj3ZC5WRDw9V0bThuv7Q6ejNPGeShdF1YimXhTr
         u4iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g125si434469qkd.467.2018.03.13.08.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evm1B-00013j-LO
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:39:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxK-0005Mh-79
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxG-0005mg-6r
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:11 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxF-0005j0-Vu; Tue, 13 Mar 2018 11:35:10 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlx7-0003EE-O2; Tue, 13 Mar 2018 15:35:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:50 +0000
Message-Id: <20180313153458.26822-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/9] hw/arm/raspi: Don't do board-setup or
 secure-boot for raspi3
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7b7IhCe75dq5

For the rpi1 and 2 we want to boot the Linux kernel via some
custom setup code that makes sure that the SMC instruction
acts as a no-op, because it's used for cache maintenance.
The rpi3 boots AArch64 kernels, which don't need SMC for
cache maintenance and always expect to be booted non-secure.
Don't fill in the aarch32-specific parts of the binfo struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/raspi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index a37881433c..1ac0737149 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -82,10 +82,19 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     binfo.board_id = raspi_boardid[version];
     binfo.ram_size = ram_size;
     binfo.nb_cpus = smp_cpus;
-    binfo.board_setup_addr = BOARDSETUP_ADDR;
-    binfo.write_board_setup = write_board_setup;
-    binfo.secure_board_setup = true;
-    binfo.secure_boot = true;
+
+    if (version <= 2) {
+        /* The rpi1 and 2 require some custom setup code to run in Secure
+         * mode before booting a kernel (to set up the SMC vectors so
+         * that we get a no-op SMC; this is used by Linux to call the
+         * firmware for some cache maintenance operations.
+         * The rpi3 doesn't need this.
+         */
+        binfo.board_setup_addr = BOARDSETUP_ADDR;
+        binfo.write_board_setup = write_board_setup;
+        binfo.secure_board_setup = true;
+        binfo.secure_boot = true;
+    }
 
     /* Pi2 and Pi3 requires SMP setup */
     if (version >= 2) {
-- 
2.16.2

