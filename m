Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1419966ivh;
        Tue, 3 Jul 2018 10:11:07 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf6+Z8OoXoDX3IvFAIZX2bvo46VsSOANXkKIvdhVX+MpmfRCURqKcCYo5l0RX8vHn+Kzb5H
X-Received: by 2002:ac8:f7d:: with SMTP id l58-v6mr10036442qtk.388.1530637867055;
        Tue, 03 Jul 2018 10:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530637867; cv=none;
        d=google.com; s=arc-20160816;
        b=MArpTw5xLZpWWFRQMU9XfR0Zm0EfhpjCwWVK9KbRsP/YLQnMKEKVMFowlSPQqBad20
         YsAX3mGWGNPKdbMBO+1lyIcbAdGu5UXvcLkY7HgnoyuvbrF/am8jANdxyTglNE7QW2TQ
         du1dEtiHq9Jql7DfM8Zk2C0Hko5DcgjTET/nQ8rGPuwiIPCxK2Kle+DGsW9eyigLPkDG
         QxYFi9qM4lJTUrQaPNyCvvD+MAg3okuWd0pG/c/AFnCrlYQC5esxf2dMBNWm/kA5oZle
         T89RraJccUl9ephTke5rSuTKAtSbCYhnfxf5d89NVdHBf0/qSD2xOP/0dG677bdQ+v2v
         al9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=ycGTGgqT4l5iVXWf/axFQmJrQzAcABgysbCt8Z4GjbM=;
        b=RWt+w2s0Ywsw3H9g+yBfEtiz27/MFdWjDaTVT0mKdOTI2KV8Ui46e13PImb3YRk+20
         kYNgcU9bV0ycPdIPyL/eB74cS9EZEo+SYPwosCcJO4EKAWgAyqSGcLEEzefKz589lTBA
         dDLennYBKcDhYx49sIiLT991n7I/4ORZDKsKdYExtPr84DJSySRqASqiQRCXYROIVzTz
         TQzr3d5Iq0agsv635RqRIOAleTFuKfSRDrjlrUt9XrhmVhr9DryaAJWQ6v+tMwo6vIdI
         AOjFiFwA0fcmVHxcTxGFUXegdAAdEKgOBgKBftcRzWzmJGBTJPJPH3JENo3RdXanOOV6
         8p7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m43-v6si1295421qtc.259.2018.07.03.10.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 10:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faOpW-0003T2-EJ
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 13:11:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faOpL-0003Rz-AU
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 13:10:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faOpK-0005DA-HP
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 13:10:55 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1faOpK-00058l-9d; Tue, 03 Jul 2018 13:10:54 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1faOpB-000334-SM; Tue, 03 Jul 2018 18:10:45 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  3 Jul 2018 18:10:40 +0100
Message-Id: <20180703171044.9503-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 0/4] cmsdk-apb-timer: various bugfixes
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
Cc: Guenter Roeck <linux@roeck-us.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w6dKR0yFxpg4

This patchseries includes Guenter's recent patch to suppress
warning messages from the ptimer layer that otherwise occur
from the way the Linux driver for this timer device operates.

The other patches here fix more obscure things:
 * the timer interrupt is only supposed to trigger when the
   counter counts down from 1 to 0, not if it is at 0 for
   some other reason like a direct write of 0 to the VALUE register.
   Handling this requires adding a new policy option to the ptimer
   code, which is what patch 1 does.
 * we were incorrectly setting the NO_IMMEDIATE_TRIGGER
   ptimer policy, which meant we would trigger the interrupt
   one timer clock too late (when we did the timer reload,
   rather than on the 1-to-0 counter transition)
 * if the ptimer had already disabled itself because it was
   in one-shot mode and had expired, writing to RELOAD or
   VALUE needs to cause it to start counting again

Tested with a uCLinux/mps2 kernel and buildroot initfs.

thanks
-- PMM

Guenter Roeck (1):
  hw/timer/cmsdk-apb-timer: Correctly identify and set one-shot mode

Peter Maydell (3):
  ptimer: Add TRIGGER_ONLY_ON_DECREMENT policy option
  hw/timer/cmsdk-apb-timer: Correct ptimer policy settings
  hw/timer/cmsdk-apb-timer: run or stop timer on writes to RELOAD and
    VALUE

 include/hw/ptimer.h        |  9 +++++++++
 hw/core/ptimer.c           | 22 +++++++++++++++++++++-
 hw/timer/cmsdk-apb-timer.c | 20 ++++++++++++++++++--
 tests/ptimer-test.c        | 25 +++++++++++++++++++------
 4 files changed, 67 insertions(+), 9 deletions(-)

-- 
2.17.1

