Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3374877wrx;
        Tue, 19 Feb 2019 04:58:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbwZTQ7Vpw6iLO0OX58ITNcAIYwdPzOi0gRxahevONTYiBEFd+Q6vUdnXieI/cH68BCItik
X-Received: by 2002:a25:2044:: with SMTP id g65mr12214721ybg.406.1550581112525;
        Tue, 19 Feb 2019 04:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550581112; cv=none;
        d=google.com; s=arc-20160816;
        b=nUQTtOwCqibeEEhXOd8Jz132lY2hfCmc9G2w676UGDz75MqgBOPwQdpazkPoVp7DlE
         PMQhZD3tnY6hYLkuKyhriPvXNLAXuozK2Q5bT5eMXUxE4YHpTS7Y7nCEhzp+w91osKHI
         BaXVxkmWbf0kmqKjdCO3rj6RsOC+wkdFueXvGutHzdVeyXV4/Uoc15UIvwrN3PlAigza
         Pd4bVhlQWNf0QWmW2aFEZt+TuG2bK46ZPw54h7VrGzXNbdatk5XuDZ1ubyqXpAO0QCL7
         sX+ytmNQ86CXHrLeTJYwbv1RJSUzX4rHgxwQB5NoMkq7XG+3uK/ky8UwV2PoZdnqP9Qh
         6FrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=pAOy0SolPTqwWVyQFZINQWfPUA+deCVWsK2WcciQr9M=;
        b=bLD8f6xS59ugWzq/HcOBPxAYWp4qLNwxBIdxEki1C60IedMlnACPGfecggokczxIul
         GCdwzbUGaodarvG9jTpG+zX2+rtAP8esgH1kNXF0s5bPJqCgcv2qVG9KxjVTAjvTgcOX
         8e1RPR1NImRDG0qwCFggnfF1I7Iio+0OwucviBJd5LxYKdTkMJ4GhfSlcHggXTWpCrPL
         A7Gx4ow6kWi9EpsNFrtOxR9SWBDLT2xvnqBf1bgqcEfVnyiR21K4sTsSv23K3x3V/jQo
         FO3Y61zuqFknsiS05J/MRTA4Td3Tdi3eARllRqIO4WunIO6dzWK+C5Hg3b7xw2+f/err
         VSFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A63hwcgs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p124si9644162ywd.454.2019.02.19.04.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 04:58:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A63hwcgs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw4yl-0001gU-TX
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 07:58:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yV-0001fS-GQ
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yU-0002mm-CO
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:15 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:56127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw4yT-0002lt-Fd
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:14 -0500
Received: by mail-wm1-x341.google.com with SMTP id q187so2718694wme.5
	for <qemu-arm@nongnu.org>; Tue, 19 Feb 2019 04:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pAOy0SolPTqwWVyQFZINQWfPUA+deCVWsK2WcciQr9M=;
	b=A63hwcgs+yiU7Hy2FutchNROmM8SinO34FLjuuw1NP3UaeWTyRMV3A01tmt8SJE9Xz
	Id3eAcS7OakyXJ3OJ5ysPLQcRGPrJANyN/XIac0iNe5k3GRqjWjS0bEzDxLP80jevURV
	Uq8y+Zt6sEZ0Uks+rxPRg3CuzWQtCBvsgBf2VVf1SSwadx0HzVmdYrkVcZuicptdGodB
	Sb1qp2lcmkUXP10/XwRWBTEpYXbg77lUQWByDWct+mkuvhGjeXt8Y/ctCeLvAJSmgW3L
	RhXn7wnWIuvqqMiSIGQvr5jPKS3Qu8YrQCtazr7RB95drQunXqWkIWQLOrCU51rgIzVD
	L2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pAOy0SolPTqwWVyQFZINQWfPUA+deCVWsK2WcciQr9M=;
	b=CA3qi2qmOqoHlml16mnXPR5B9XISNm8n01kQWwkmx2XT3HzO+LXCuJv7rYX8q9wO8G
	WWKP+LDuEvsd2lQOoadxibv4LSdBdtU7oGrftgvBHucqfXqWUgPs9zQPKNm72l9gMz3w
	aIs06A4dxaixmCc2yBbaNf6hCJOVY4CbSN5ssE65Op3pwgGxF0IGj1wK4598Iwvj/AXs
	vPgqwtSDDP6KOZgMHm7RKawLjG+Tw1bfqCMQL7U1Agzr0+4EhF/3MYH11BdYd3pWRPlv
	grzp1Ir6g2EatCenco1xGN5un84EeUDLKSkXWdzaUpmTnVEluxED0YU+IBH/KmKjiKYC
	wkLw==
X-Gm-Message-State: AHQUAuYZOoNzRK9OIlB3Xj/k++Epj9+pH/WuQx97col/62wvVpg61nof
	eTfqAf+VwIg0rBQ3TbGk8Awbc4zBPMFzvg==
X-Received: by 2002:a1c:ce02:: with SMTP id e2mr2583387wmg.29.1550581091796;
	Tue, 19 Feb 2019 04:58:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	e75sm5226113wmg.32.2019.02.19.04.58.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 04:58:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Feb 2019 12:58:00 +0000
Message-Id: <20190219125808.25174-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 0/8] ARMSSE: Implement MHUs and dual-core
 capability
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
X-TUID: L1s0sNfv8G63

This patchset adds support for running dual-core guest images on
the boards using the SSE-200 (mps2-tz, musca-a, musca-b1):
 * it implements the Message Handling Units (MHUs), which dual-core
   guests typically use to signal interrupts to each other
 * it implements the handling in the sysctl register block of the
   CPUWAIT register, which is how a guest powers up the second core
 * it adds support for the INITSVTOR[01] registers in the sysctl
   block, which guests typically use to make the second core start
   with a different exception vector table from the first one

The support for the MHUs has not yet landed in the Zephyr RTOS,
but this has been tested with the code and test application
in this pending pull request:
https://github.com/zephyrproject-rtos/zephyr/pull/12722

$ qemu-system-arm -M musca-a -kernel zephyr.elf \
  -device loader,file=zephyr-ns.elf \
  -serial null -serial stdio -display none -d unimp,guest_errors
pl011_read: Bad offset 0x44
pl011_read: Bad offset 0x44
***** Booting Zephyr OS zephyr-v1.13.0-3378-g1a0632c8b0 *****
IPM MHU sample on musca_a
CPU 0, get MHU0 success!
pl011_read: Bad offset 0x44
pl011_read: Bad offset 0x44
***** Booting Zephyr OS zephyr-v1.13.0-3378-g1a0632c8b0 *****
IPM MHU sample on musca_a_nonsecure
CPU 1, get MHU0 success!
MHU ISR on CPU 0
MHU ISR on CPU 1
MHU Test Done.

(The pl011 messages are a Zephyr bug which I have reported to them.)


Based-on: 20190214125107.22178-1-peter.maydell@linaro.org
("Add model of the Arm Musca devboards")

thanks
-- PMM

Peter Maydell (8):
  hw/misc/armsse-mhu.c: Model the SSE-200 Message Handling Unit
  hw/arm/armsse: Wire up the MHUs
  target/arm/cpu: Allow init-svtor property to be set after realize
  target/arm/arm-powerctl: Add new arm_set_cpu_on_and_reset()
  hw/misc/iotkit-sysctl: Correct typo in INITSVTOR0 register name
  hw/arm/iotkit-sysctl: Add SSE-200 registers
  hw/arm/iotkit-sysctl: Implement CPUWAIT and INITSVTOR*
  hw/arm/armsse: Unify init-svtor and cpuwait handling

 hw/misc/Makefile.objs           |   1 +
 include/hw/arm/armsse.h         |   3 +-
 include/hw/misc/armsse-mhu.h    |  44 +++++
 include/hw/misc/iotkit-sysctl.h |  25 ++-
 target/arm/arm-powerctl.h       |  16 ++
 hw/arm/armsse.c                 |  91 +++++++---
 hw/misc/armsse-mhu.c            | 198 +++++++++++++++++++++
 hw/misc/iotkit-sysctl.c         | 294 ++++++++++++++++++++++++++++++--
 target/arm/arm-powerctl.c       |  56 ++++++
 target/arm/cpu.c                |  29 +++-
 MAINTAINERS                     |   2 +
 default-configs/arm-softmmu.mak |   1 +
 hw/misc/trace-events            |   4 +
 13 files changed, 714 insertions(+), 50 deletions(-)
 create mode 100644 include/hw/misc/armsse-mhu.h
 create mode 100644 hw/misc/armsse-mhu.c

-- 
2.20.1

