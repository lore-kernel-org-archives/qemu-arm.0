Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8070078wrt;
        Tue, 4 Dec 2018 05:30:40 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uk3/zueLHnONVZrFW718sVMO0yYMIqKtefWQx5inuK6YPBaC0Akr0za9Xm0lFOE/bI5fFp
X-Received: by 2002:ac8:2a06:: with SMTP id k6mr19658283qtk.245.1543930240501;
        Tue, 04 Dec 2018 05:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543930240; cv=none;
        d=google.com; s=arc-20160816;
        b=VH83fx83D4PTZCSCdJQsydsz8mZxjG8pAYCKOD8dqpMw2GxpWVYXCxJwPY5bJvjNhf
         DpjJMuM+UncAk+0tlJFLENMvz11FOUOhCK0hiM0VF45PPNWGLzKclTOmotVEz92VrvXa
         rvf83SgURGRkjocaxwZybVMRNUegDS90JsBegWCb48mBKP03ZTvMUs8SG07M7sVZ7f5I
         N6q9tdm1zNwwSOznHxnJvgcnryImtcv6nH5dr9AUYnyyyAiRlddwk0D5dQpdbrVh5U+c
         zsgYm90Ki7klOvsuxhNBHU/1UiKLSDQzF50eg4r7LbkUPum+4kZJv7CTpkN/TATtifKL
         Ah9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=uc8Sm2YkT2hhR55T9E46ZmY31pRXt1gvE10KJXVZll4=;
        b=ntXldXI08ZDV5GDcJcxqE8f3x70LwYvcAdBSFADWCpJ7V4+gWwxKXtbOC6oC8x0BHL
         sXO18cXk4tCcxWIEdFI5w3/r+m7wdyWugbkUJV1IURqfn1EGjP6dlL70Xtm0yvQ3KGKE
         uNNqXK68qqZu1u8IY15XNwH+UP40VcgCvkmC30NY+y7N+gSxNlH++7qsMqUrnFeCOTwF
         oyzEhOs6Sc8x3y9T573lMWj9cUk9LLdDSByuaYYFjOJ8T29ofSN95spWgvH/wktSVW3D
         sncr8M356OTJw3T3CFSzetOEQVy4u8l6asLh7n4es+8ArnRIyM0AEiPUOEkQqN17/iey
         lVow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g30si1816350qtk.14.2018.12.04.05.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:30:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAmd-000812-KD
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:30:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm9-0007jJ-18
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm2-0000wV-3n
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:08 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:53236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gUAm1-0000pO-T1; Tue, 04 Dec 2018 08:30:02 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gUAlt-0008BZ-1w; Tue, 04 Dec 2018 13:29:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 13:29:47 +0000
Message-Id: <20181204132952.2601-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/5] arm: five simple memory leak fixes
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lrTxd8S5mhh9

I ran 'make check' with the clang sanitizers enabled, which
it turns out these days includes LeakSanitizer. That points
out a fair number of memory leaks, most of which are not
terribly significant. This patchset fixes five of them (there
are plenty more to do).

The "device does timer_new() in its instance_init function"
leak seems to be a common one with multiple other devices
showing up as having the same problem. Switching timer_init()
is probably a nicer fix than just moving timer_new() to realize,
but I wasn't sure if going from VMSTATE_TIMER_PTR to
VMSTATE_TIMER would be a migration compat break.

thanks
-- PMM

Peter Maydell (5):
  target/arm: Free name string in ARMCPRegInfo hashtable entries
  hw/arm/mps2-tz.c: Free mscname string in make_dma()
  hw/sd/sdhci: Don't leak memory region in sdhci_sysbus_realize()
  tests/test-arm-mptimer: Don't leak string memory
  target/arm: Create timers in realize, not init

 hw/arm/mps2-tz.c         |   1 +
 hw/sd/sdhci.c            |   5 +-
 target/arm/cpu.c         |  33 ++++++---
 tests/test-arm-mptimer.c | 153 ++++++++++++++++++---------------------
 4 files changed, 95 insertions(+), 97 deletions(-)

-- 
2.19.2

