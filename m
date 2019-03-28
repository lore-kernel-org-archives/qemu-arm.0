Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp422853wrx;
        Thu, 28 Mar 2019 03:04:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxY6mPf4fDX2d4WDVsH25Di2fI3B8DiqpqnnM8vNX/QN7OjT6KBTgYqhj5Zfv2aQ7gor86u
X-Received: by 2002:a24:eec1:: with SMTP id b184mr6971531iti.49.1553767460955;
        Thu, 28 Mar 2019 03:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553767460; cv=none;
        d=google.com; s=arc-20160816;
        b=QrqDlrPHbBa0jRPwAs13jREiIHGXJtDQma5HEQEv9vCejNxMdPfHl6d/iRrFTtB3QI
         8lOx9YMAO7bpfCzB3MSicdsrAZqlZTbLWJtt466UV2UMPtvrqtSNXikEygpGd+YTC8hv
         Rjl0qjxpMgznC4OwOgDpSPGq3f9nbIb6oxG7Fdl8O//lLLzNej4fVx7PEC2JLDVVggjJ
         6+BDPodheqeUdtXHalqAwMCXPFbv9vcNOlZUBLF2tiIPBuw764Qv7Y1lWDU29Qnv1ZhX
         0aGUMsgCWk+3+TOjK28djU7E9CzdViLADAx16WEeCutBRefmxH4wcP5vKIm5rFCxReMM
         yIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=YeHKWyPP8B+92GniO4g/+lw4RSrgbg3qVWcU8n/OVeQ=;
        b=vbzZXMWRgWL/zjjVf6WnZYzvdFjoegzPfvtTycGLj9byqOVKw4MqGex9myjDEM/7p2
         35s7lHwYaxCuYUA36C2XjGTRcrhW2PIQsjrxTy3S5Mz41xLdEsRgJvDGTU2cW7DDhz2K
         DVZjLyZa9APaGw4PjtCur0AbJt2f/XtWTRQRYUp2092I8MddX1IubygP1aUyT5y6Ajdd
         4UHkB1714aQyXIS7Egwt4/o3B4SOcm66FIq3L0GaQSFsPoMrAHsjSuKpyDFodFTGI7hJ
         a3k3pY9vj6Kts6qMekDMFzC76BfR6zUSvnmzVaYfSJTLt7Hgczeo6UYLnJS25HZgNG7R
         gtCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XTmTuqa8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i189si1477879iti.90.2019.03.28.03.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 03:04:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XTmTuqa8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9RtU-0000UP-7l
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 06:04:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9Rsj-0008Uh-U8
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 06:03:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9Rn2-0001MV-LM
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 05:57:41 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:47038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h9Rn2-0001La-5H
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 05:57:40 -0400
Received: by mail-wr1-x444.google.com with SMTP id t17so1298440wrw.13
	for <qemu-arm@nongnu.org>; Thu, 28 Mar 2019 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YeHKWyPP8B+92GniO4g/+lw4RSrgbg3qVWcU8n/OVeQ=;
	b=XTmTuqa8b7yFsWGyBqo5lzqGnV4mo8F6VxXcoTyrSM30BxckhoFwUjwiq4DFDTCIe9
	OnlIG/jm9IYyqqDjOSPaV3ZJaCxl1d2e9njLD4R1ehnpGNir+STyg6m3wi1AJwj/d84R
	BfH+WnzWiciCGzjVZpDgEniOoHPdCS1oamjSKNbGUAx9yLUpMqUKOfcy/cpr61GCv9Uf
	Hnj0EDTzCualq1xxiT0v0UBFF64QqXES79bZHDOVZB2EmdqVNCNi68ydRF1iSs9PxGjK
	kyhaZf6pS4nFCVVxVQ4L4NT3BEMBrhI3PznDuGs8fvxZV2LOnZv12nQBYcSZuVFPDGcZ
	phjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YeHKWyPP8B+92GniO4g/+lw4RSrgbg3qVWcU8n/OVeQ=;
	b=QvI85o/72iJu488ObyX/YtbasRqnud33dm2oqKgrrP/cPNDxzldx1VHEdJG/qTpSD7
	EMbz6Kilm0TBFYaY3Cq4Kx+zisMP5K+WyYx5wvmvz486Ojs5GNjQCW0hF86RPpGu2neB
	SoPYUU2HQj1ruE+hbIJBanWWBJ6HyHRTv/CPaJ75gtyynbFrDmpNMNpG3Sv16lMgD5cX
	F0fRtTWXus1Mhgwz4XtwmpUjArQQkQ7TWyKnLbyi8O/PGdMUhGPCn+YJg+LwcZMNZ7cS
	Lfa2UaOULBm7pJvxRJMLt+2CRdnziw5D2EYS9UajO39ss6wTDXcgWE6i5u8/PbbknMY4
	8e8Q==
X-Gm-Message-State: APjAAAXsrjAKP4iCVKl0y0cLKdHHxU8C3bAX4tA5njTmdUdAVCw+fdY+
	PwTTwi+YPwJRHBpzLwsmFYT3tYkEuKY=
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr10052738wrn.193.1553767058691;
	Thu, 28 Mar 2019 02:57:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	q3sm13867319wrr.75.2019.03.28.02.57.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 02:57:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 28 Mar 2019 09:57:36 +0000
Message-Id: <20190328095736.4480-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH for-4.0] hw/arm/raspi: Diagnose requests for too
 much RAM
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
	Andrew.Baumann@microsoft.com, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pUt/dUwR1s/I

The Raspberry Pi boards have a physical memory map which does
not allow for more than 1GB of RAM. Currently if the user tries
to ask for more then we fail in a confusing way:

$ qemu-system-aarch64 --machine raspi3 -m 8G
Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
Aborted (core dumped)

Catch this earlier and diagnose it with a more friendly message:
$ qemu-system-aarch64 --machine raspi3 -m 8G
qemu-system-aarch64: Requested ram size is too large for this machine: maximum is 1GB

Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/raspi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 66899c28dc1..c7a18a319bc 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, int version)
     BusState *bus;
     DeviceState *carddev;
 
+    if (machine->ram_size >= 1 * GiB) {
+        error_report("Requested ram size is too large for this machine: "
+                     "maximum is 1GB");
+        exit(1);
+    }
+
     object_initialize(&s->soc, sizeof(s->soc),
                       version == 3 ? TYPE_BCM2837 : TYPE_BCM2836);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
-- 
2.20.1

