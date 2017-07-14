Received: by 10.25.44.15 with SMTP id s15csp760227lfs;
        Fri, 14 Jul 2017 03:51:58 -0700 (PDT)
X-Received: by 10.233.237.211 with SMTP id c202mr9665665qkg.1.1500029518423;
        Fri, 14 Jul 2017 03:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500029518; cv=none;
        d=google.com; s=arc-20160816;
        b=WSEbLK2Rnplmz2BM9jCIxO+aj+UrMb8oEJracqiHuy3MXTvsOs8rpLe8gYFK8Eglsx
         tmd+jG5HDnPpIucBBGUc2t3KiYcMb7uGHOont/3RnMpkzZ59D3QnO9rzKD/bBLFXej/O
         Wvf4WdIquKVmRBXsyBfyWMpB2/UcqFEKM4tlkGdyCkjGPx5u5t+mcKmR7373Wfl4uKze
         tyTGa0TE8Mrpxfs0unvI/s8fcTVSd8mE1+Qvodm+63YYdEYzdP9/i3zJ7kRDsOUV5yz1
         8eBekYIU3h0UIpLkpA2GnYML1sFNdFQVpvvQknMFMr5Dr74SshZruWsvK1P/bLDFpR0D
         0iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=oGL8N2Ir72Wq2PwdocMLtocdYZ7JNW1vuknL23TNHbA=;
        b=SM33rJ0No0Wtr6DgdGucZZcRqCoeDBx50vjSz4ethAZhrCQffL9AY9S0nw1ppx0uAI
         7qQZPI1Hil3r6kJX+o1giuBF9eg3K6hf3LV83v0gz5SLZA/0kLCyD3od/a2wHmTx/8Ip
         LQtHQQ11ITMq/vGHsz98nopkFdFWpJhpWQcRkZGOjFW0Irwuu4OVN8gNqHB2Bhx+g3Jn
         DwrPdESZtWxOEChHIvfQpRmKS0lbibKbTtDDDCDLiN0fny22YakwtWStk26rmvOoLo9A
         dr8/t7JlkIcnWxyCbTruSdARAVQvCeh0cndRnJm73Q8Cu1XnZX10sMO5CwTyk2n/RwTc
         kwxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t69si7379594qka.264.2017.07.14.03.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 03:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVyCR-0004uZ-LX
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 06:51:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCM-0004sm-Ew
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCI-00079R-E8
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:50 -0400
Received: from [2001:8b0:1d0::2] (port=37583 helo=orth.archaic.org.uk)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dVyCI-00072e-79; Fri, 14 Jul 2017 06:51:46 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dVyC4-0007lz-7E; Fri, 14 Jul 2017 11:51:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 11:51:27 +0100
Message-Id: <1500029487-14822-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 9/9] MAINTAINERS: Add entries for MPS2 board
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vHrNIG4pfM7s

Add entries to the MAINTAINERS file for the new MPS2
board and devices.

Since the CMSDK devices are not specific to the MPS2 board,
extend the existing 'PrimeCell' section to cover CMSDK
devices as well; in both cases these are devices implemented
by ARM and provided as RTL that may be used in multiple
SoCs and boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9529c94..10f5cd6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -380,7 +380,7 @@ F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
 
-ARM PrimeCell
+ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
@@ -394,6 +394,10 @@ F: hw/intc/pl190.c
 F: hw/sd/pl181.c
 F: hw/timer/pl031.c
 F: include/hw/arm/primecell.h
+F: hw/timer/cmsdk-apb-timer.c
+F: include/hw/timer/cmsdk-apb-timer.h
+F: hw/char/cmsdk-apb-uart.c
+F: include/hw/char/cmsdk-apb-uart.h
 
 ARM cores
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -455,6 +459,14 @@ S: Maintained
 F: hw/arm/integratorcp.c
 F: hw/misc/arm_integrator_debug.c
 
+MPS2
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/mps2.c
+F: hw/misc/mps2-scc.c
+F: include/hw/misc/mps2-scc.h
+
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
 L: qemu-arm@nongnu.org
-- 
2.7.4

