Received: by 10.28.91.67 with SMTP id p64csp857899wmb;
        Tue, 13 Mar 2018 08:44:32 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvi20mFySR4V0q/aeIAT+Yzn2BNzRjaFpLK97icFF22ZI617JtMFVfoD5lksR/57Dtd43PI
X-Received: by 2002:a25:c583:: with SMTP id v125-v6mr861921ybe.368.1520955872056;
        Tue, 13 Mar 2018 08:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955872; cv=none;
        d=google.com; s=arc-20160816;
        b=i1f8Jwwl5pyaDXFdtBf3HvArKb2+7VxRh1kh44toudWckQAqpFFj3dN1MDdrVICW4c
         pXo4k7S3aJlfwO4JRQMhHAvC7V8uNfC8ApQ984Z5fVwGZLd55t10PHF/FJA9PcxaCb7w
         02y9Uub26CBu8H369M8IqtwjxQTu/159awrTjx7WdqpZTyvDUIkj2Xf9OMa4zddR4ZvL
         d0/uLO2WvJucuTTwS71qiN2kOJgNckBA9Wa6vu5KJlkzR4YaoGCED0JLOBb7dRYrSELk
         10YNEXTLCrqXusEcwmWsGhrRvQEjOdeF7zGexVqE8nZ70M9JbkKhOmMTTpvDGJ626shA
         zTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=xwXxUNwT/o72vgoNBnRyX1rPBmR1tINRmh11G2Ia9rw=;
        b=zK2d8gUe5bYJWeApNLNjMsPjNB+An6URkHp4j46OJ0sPRVhLmr4ZCcSn1IRoZylTVT
         fsrsl+WZZiM4uw3u9rCds3yXEqWhRIjKqhu3yb9D6QwDs0HWMeUuEe/NxD5CIwP1pJNi
         jD2C4SaVITlwtj/Bu1qvTEQ9yknA2Y4jvsESQe0nUDwyI0aqZgF2hiw7lWadKaBkDf44
         VFzBupBxaW59mVUmXYqiBZVsZbZ5V6IRUxaQcHMVRR0nxXQ5OQ/5VOzMf6O0GyeC7+g4
         3oW533GtFQLywxUVUk/sjueWHrZrpEkWRa4HBHsjdDP0lyyTXFN/05jFtFJbeEJHRRDF
         3/xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si461438qki.254.2018.03.13.08.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evm6J-0005rQ-GR
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:44:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxQ-0005VH-S1
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxP-0005sJ-Mi
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxP-0005j0-6S; Tue, 13 Mar 2018 11:35:19 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlx6-0003E1-VY; Tue, 13 Mar 2018 15:35:00 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:49 +0000
Message-Id: <20180313153458.26822-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/9] raspi3: various fixes for Linux booting
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
X-TUID: spXfxJF9w7ZS

I had a go at booting Debian's Linux kernel on our raspi3 model.
These patches fix a variety of bugs that were stopping that working:
 * the board was trying to boot in secure mode, which isn't
   right for AArch64 Linux kernels
 * the hw/arm/boot.c code didn't set SCR_EL3.HCE, which meant that
   the HVC instruction would UNDEF and the guest would panic trying
   to initialize KVM
 * BCM2837 uses different affinity (cluster ID) values than BCM2836;
   this really confused Linux since it didn't think the primary CPU
   existed and it ended up panicing in an obscure way.
   I opted to fix this one with a modest refactor of the bcm2836
   code into one device for each SoC, similar to how we handle the
   Aspeed SoCs.
 * the board was trying to use AArch32 code for the secondary
   CPU bootup, so secondaries just went into an infinite UNDEF
   exception loop. Using the correct instruction set and the right
   spintable protocol allows the kernel to detect all the secondaries.

Unfortunately this doesn't entirely suffice to boot, because there's
a problem with our bcm2835_sdhost device model. I've analysed the
problem, but am not sure how to fix it because as far as I can tell
there is no public documentation for this bit of the hardware :-(
Does anybody have a datasheet for it?

[Summary of the sdhost issue:

    The Linux bcm2835_sdhost driver doesn't work on QEMU, because
    our model raises spurious data interrupts. Our function
    bcm2835_sdhost_fifo_run() will flag an interrupt any time
    it is called with s->datacnt == 0, even if the host hasn't
    actually issued a data read or write command yet. This means
    that the driver gets a spurious data interrupt as soon as
    it enables IRQs and then does something else that causes
    us to call the fifo_run routine, like writing to SDHCFG.
    The driver's IRQ handler then spins forever complaining that
    there's no data and the SD controller isn't in a state where
    there's going to be any data:
    [   41.040738] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
    [   41.042059] sdhost-bcm2835 3f202000.mmc: fsm 1, hsts 00000000
    (continues forever).

    Without the h/w docs it's hard to know exactly when we are
    supposed to signal interrupts, though obviously what we do now
    is definitely wrong...
]

thanks
-- PMM


Peter Maydell (9):
  hw/arm/raspi: Don't do board-setup or secure-boot for raspi3
  hw/arm/boot: assert that secure_boot and secure_board_setup are false
    for AArch64
  hw/arm/boot: If booting a kernel in EL2, set SCR_EL3.HCE
  hw/arm/bcm2386: Fix parent type of bcm2386
  hw/arm/bcm2836: Rename bcm2836 type/struct to bcm283x
  hw/arm/bcm2836: Create proper bcm2837 device
  hw/arm/bcm2836: Use correct affinity values for BCM2837
  hw/arm/bcm2836: Hardcode correct CPU type
  hw/arm/raspi: Provide spin-loop code for AArch64 CPUs

 include/hw/arm/bcm2836.h | 31 ++++++++++++++----
 hw/arm/bcm2836.c         | 81 +++++++++++++++++++++++++++++++++++-------------
 hw/arm/boot.c            | 12 +++++++
 hw/arm/raspi.c           | 77 ++++++++++++++++++++++++++++++++++++---------
 4 files changed, 158 insertions(+), 43 deletions(-)

-- 
2.16.2

