Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1842615wro;
        Fri, 15 Mar 2019 03:08:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4rR/7fGv9UnzezQOm6uWBnin7yJB/S0cZb/acOHtKdEZUhiXRFuRPDgD/1jYh73GX4UQz
X-Received: by 2002:adf:9065:: with SMTP id h92mr1725425wrh.150.1552644503329;
        Fri, 15 Mar 2019 03:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552644503; cv=none;
        d=google.com; s=arc-20160816;
        b=aA5DH3g6Nr725wq4Wpxte8rlloOhJv6Wb7WH7Df+5bfv6344Fk6MVQ/J1IlRn1Lr84
         ZZRD/uA9RSUkUNdwUylOKAWBfNDY5TLGTTtKuMJ/suqF/9fKS8iCh0G4drXj58hiPvMQ
         UsE81Z+J9JGN0UbCyeaSM93mCLxB12LbvJnGAATYld1H6JSzhjyzwY32ByDI31G3uSTL
         VXoxXlFKK3DpCg+tlYa16L/2jOj2irdxa1LtkzG1Bq08QV5E7tC/ZhCBRe0t1M4U5hS9
         qpRgIWSUGwfAvUIQ8x3yYhfosE0igrJJ/bY6/fVNs4hQPUt2p6uDSjTqBPsGgVZu/P3m
         aDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=AQPAVVFYPQO9BLGrVFwWStjiDkzv6k83NnuqXRdfOek=;
        b=nFjN8CVXOtel6RUXMcSld676XB/+8KcoCY474MLVsMgT5mS6WJsMTYSR4q4YZR9sFU
         kl9D46lHek6r+K0CtxaWWvdusp+5YNq8tf5lNCHq3boTYs8uOY1d8TL+vzMPew/RagAR
         rv6K5n7alSKTdOXSqBO8d7KuL+ZaZpY+iiKMpTv41ECKvwZyj4xerPVKmcpGG/dcd1hj
         /UnsZXjvdL0VYTqqao+BKpFnmu6qTyOJXB/sHgjREvOmj4m5GYBCR44oJ8u3LfiG9a9g
         Mc9NMy0RDfipxqWBCQSLimwLbwnj2MCouPw2Jd0xoGju9hW169PsN+c919QeE7vd+l7E
         dNJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vOuj/tBU";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si879399wmj.173.2019.03.15.03.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Mar 2019 03:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vOuj/tBU";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4jlG-0001P0-7y
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 06:08:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1h4jkt-0001NW-Cp
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1h4jks-0000fA-EU
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:07:59 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1h4jks-0000eU-3P
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:07:58 -0400
Received: by mail-pf1-x432.google.com with SMTP id 8so2591724pfr.4
	for <qemu-devel@nongnu.org>; Fri, 15 Mar 2019 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=AQPAVVFYPQO9BLGrVFwWStjiDkzv6k83NnuqXRdfOek=;
	b=vOuj/tBUXutPF0iCgpoukL/39s6zDaqPFstGPIDcrLNJvGxiIV2yBebTZM1ANJScRA
	Y/k4iPNox2Q7KQOYK289M4bnEfHHgJC8lx/Q35gxxtxQOjp6tPDg+rJZrdYHQq/7+z73
	2dLjKLuJy8OfoOoINLl0GKBYkpzmfVCKi1OB0bK8gkHigkQLluZ2TLVFrlLyCqo5OEiq
	NugNRtPcCgQjb33KwdgbCOVFmjlLnoG1kV7axpIV9AwdIbGc46ckmxGh/lRZRJQy4SAt
	nO/K0AwffsUa1pd9JKINAnltzxLz7a4zCXHg9fwtOY5TgRn4xiAnckl6j6wrIifpDRcw
	xENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AQPAVVFYPQO9BLGrVFwWStjiDkzv6k83NnuqXRdfOek=;
	b=j4+ztjdmcI/nlK+lrtBt0P+B8sSMsqEVn/YnsZHmG1EqSN1z1P9Ap6LfLWjTzntU7E
	NESRE3wPMSogzf/HHGagNuu9l9bkmYOqSyAaB61jNoW3iJE6bArFuxDtUwAiyvRWKIb4
	dkdB2OEzkILeSDeWTg0AAccXGb07nceh97B1is81M4wp996QaEDsJVjbhDJz/hm3S2x+
	fFEbIlhc+7q1FRtIIu2PMmpdhI9OSA4jyZ21uCBkCJfX6wWBdF95L0B+xUepUoML3QQ+
	WAx2zU7sMrbJgOPciuJBpgv3Y4VXei09tSqPh9bXynrfnl3CeNv0nYh8fa+/JuG9JIPj
	yd1w==
X-Gm-Message-State: APjAAAXa3TvKyCEMeb/f42AdhuHwjFygD/vlLMuUFATMMovVZhw40KEo
	Pvn0H/LpNUI3qCwfdOB7skXQ4g==
X-Received: by 2002:a63:68ca:: with SMTP id d193mr2583822pgc.53.1552644476475; 
	Fri, 15 Mar 2019 03:07:56 -0700 (PDT)
Received: from localhost.localdomain ([104.237.86.214])
	by smtp.gmail.com with ESMTPSA id b7sm4882128pfi.36.2019.03.15.03.07.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Mar 2019 03:07:55 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 15 Mar 2019 18:07:44 +0800
Message-Id: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::432
Subject: [Qemu-devel] [PATCH v6 0/2] Add Arm SBSA Reference Machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, radoslaw.biernacki@linaro.org,
	leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3HC7DZsModgz

For the Aarch64, there is one machine 'virt', it is primarily meant to
run on KVM and execute virtualization workloads, but we need an
environment as faithful as possible to physical hardware,  to support
firmware and OS development for pysical Aarch64 machines.

This machine comes with:
 - Re-designed memory map.
 - CPU cortex-a57.
 - EL2 and EL3 enabled.
 - GIC version 3.
 - System bus AHCI controller.
 - System bus XHCI controller.
 - CDROM and hard disc on AHCI bus.
 - E1000E ethernet card on PCIE bus.
 - VGA display adaptor on PCIE bus.
 - Only minimal device tree nodes.
And without:
 - virtio deivces.
 - fw_cfg device.
 - ACPI tables.

Arm Trusted Firmware and UEFI porting to this are done accordingly, and
it should supply ACPI tables to load OS, the minimal device tree nodes
supplied from this platform are only to pass the dynamic info reflecting
command line input to firmware, not for loading OS.

v6 changes:
 - rebased to the latest QEMU tree
 - rechecked all the header files included
 - added the newly introduced system bus EHCI controller
 - removed the machine_done callback due to commit 5614ca80
 - updated block comments styles according to checkpatch.pl
 - use Kconfig to add new file
 - use private SBSA* types defination instead of VIRT* in virt.h
   since nobody else using them so they are in the .c file instead
   of a new .h file

v5 changes:
 - removed more lines derived from virt.c
 - designed a new memory map
 - splitted former one patch into two for easier review
 - cancled previous EHCI and new HXCI coming later separately

V4 changes:
 - rebased to v3.0.0
 - removed timer, uart, rtc, *hci device tree nodes
   (others were removerd in v3)
 - other minore codes clean up, mainly unsed header files, comments etc.

V3 changes:
 - rename the platform 'sbsa-ref'
 - move all the codes to a separate file sbsa-ref.c
 - remove paravirtualized fw_cfg device
 - do not supply ACPI tables, since firmware will do it
 - supply only necessary DT nodes
 - and other minor code clean up

In the previous v4 cover letter,
https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg04282.html
I mentioned I had to revert two commits temperarily to run:
 Revert "target/arm: Implement new do_transaction_failed hook"
 Revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB"

Now the 1st one is fixed by Ard Biesheuvel in the edk2 side, and for
the 2nd one, a simple change in firmware side can fix it, so I won't
mention these issues in details in the cover letter any more.

I also put a branch here:
http://git.linaro.org/people/hongbo.zhang/qemu-enterprise.git/log/?h=sbsa-upstream-v6

Hongbo Zhang (2):
  hw/arm: Add arm SBSA reference machine, skeleton part
  hw/arm: Add arm SBSA reference machine, devices part

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Kconfig                  |   3 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/sbsa-ref.c               | 754 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 759 insertions(+)
 create mode 100644 hw/arm/sbsa-ref.c

-- 
2.7.4

