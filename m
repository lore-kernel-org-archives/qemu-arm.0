Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp180719wrx;
        Wed, 17 Apr 2019 21:05:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5h7AsvGIGUel3U+c3f5cvq309XpiW5sBc9JeAYos/w8zYkpdtyHMzly6TjKZTetVLqBkY
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr1316674wma.53.1555560331834;
        Wed, 17 Apr 2019 21:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555560331; cv=none;
        d=google.com; s=arc-20160816;
        b=R1WOAjLiJbcCjSdssrc3nNpzj2zDPH2qYJkBGc76Vucgl2u5U4oXLW4WQ1X3+FRXtJ
         QzlWKWpyxCrsBuLEk435rb0kOLfZQQ/cxSw7ropPSQKSISwWnhYudjpDTBEvuc8k1tCj
         AWQZTSRzq8DZ76VxUjcGYcc0aXgnJsp0R8T2I30teo19+Baxk3GO6X3HAE8kOGu4SzjF
         z+wC8RiRu66fhQeN2AsU2xaQ+/8lboj59fsdsMHnJ7lgK1XHIQMgVAiQvTP8RhliQm7v
         KsDJMRmSJKGMjtFJZdp+Vh29cUAzoxsLzYd8uXjY6zKLxCOOq13lfr5M0QzvoRmVheSI
         ZHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=ipCTowXe446W73k2Vwrsnaf0r5pLUqeNQXv5HiqvNbk=;
        b=GroHvMR8mbsd9D0H0I53qTGWhnvAxH0i6D6bZwYQv+oqEnRkiKQW4xTFsfECgiAyyl
         6vKh6ICBqnWC69v5K5sLgv80ffZVOWq6vvjX4Os4m6TEJ83PL1lPaLwTxlGIflBwtZpK
         WIftEf2W5uFktjTr0K2n4cFFFlG2tEbpmoyCNh4BKYXcEHar0UeWTMe9q39YZXx9i/nq
         iLEv1QP0JDI/zDbg7kqG9Htrxk5fCj1mFCwPjewJdqt7pl6n+MiglgPA7OvkNU5kNhVR
         9pein5f6K9qyN944GcDultxty19MrwKfcg+lvsAUsOPu03uByNf08r/F0tVgbsBnsor4
         QAEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x1fbTxBp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si632306wrx.148.2019.04.17.21.05.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Apr 2019 21:05:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x1fbTxBp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGyIk-00023J-M3
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 00:05:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hGyIV-00021q-6h
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 00:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hGyIS-0001pt-CL
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 00:05:15 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1hGyIR-0001mG-UU
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 00:05:12 -0400
Received: by mail-pg1-x543.google.com with SMTP id y3so529752pgk.12
	for <qemu-arm@nongnu.org>; Wed, 17 Apr 2019 21:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ipCTowXe446W73k2Vwrsnaf0r5pLUqeNQXv5HiqvNbk=;
	b=x1fbTxBp2La9EgVubLuqRwSWaJwdPyG2p+Eimg/8XdAFB7iFLkDn3tcNgfu2dUZprF
	N+IWduh4UUNW3BKCE2tYSKZkG2dvMIoMAUwxXZWtc/I//xV8/ytNpX4Y3I7+P9d+qt9+
	Pc1R53vDtFB+ab3NbN0TlmUKSSBtALeurPhHCFuAsDFyYH1M5hxXihzZ1UR5XIvLmnsd
	n78bsXLbJoULmzBPI+p2xyGJBLbyzFxXe+cWB6j7vO6K3U79zGjI9fBSM7hTFUSLhNNi
	RvJUYROBVt1B6eyLljPrJeQq8E95T7Yr29joF5yOI2z0TCYs8Bzin6u2LWDH7hTWH7xr
	fwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ipCTowXe446W73k2Vwrsnaf0r5pLUqeNQXv5HiqvNbk=;
	b=Q1plAix6mrsv+TxYLuMZ7EKZBPj1tXxTxsUGy8jgc2bb1Ypunk6ua99L/tkLwSRkEf
	sxg5jW6T/IfrSGo7BSa17m+NGR5jsEt+npP3K3EyKGOFSvfDSPMba5dX4st/BUWc4fzz
	Osf6ciZOJ6dldUUmxbobN+i7twdyewoPerfRHvN5wkIBUtm5GOOAo2aAEm0A7XhhT22I
	JurBqxSplbHyDg7iM4f9gupM80yvKak9+VcbZ0sHC74Z5aObbsGqIhktthpGBnMQMBZa
	P/yeMYM+mEpibF53Pd2DGjjAeJjLdPHnhlKczm4Ug2aShvBVGewZfREU7F4ZBS/NKRrQ
	4HMA==
X-Gm-Message-State: APjAAAXbcV+mQwnDV4BbicYqHVPQ98jYjZZk1qMbosaMWmmxAhsiWRDl
	L5FZWBwJhpGmlaBk9QWg9PkY2w==
X-Received: by 2002:a63:5c56:: with SMTP id n22mr74890116pgm.108.1555560309080;
	Wed, 17 Apr 2019 21:05:09 -0700 (PDT)
Received: from localhost.localdomain ([38.106.11.25])
	by smtp.gmail.com with ESMTPSA id h8sm910688pfo.149.2019.04.17.21.05.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Apr 2019 21:05:08 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 18 Apr 2019 12:04:49 +0800
Message-Id: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v7 0/2] Add Arm SBSA Reference Machine
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, radoslaw.biernacki@linaro.org,
	leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nMar2mwCzyOE

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

v7 changes:
 - edit memory map for PCIE slightly
 - add another secure UART which can be used for RAS and MM from EL0.

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

Hongbo Zhang (2):
  hw/arm: Add arm SBSA reference machine, skeleton part
  hw/arm: Add arm SBSA reference machine, devices part

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Kconfig                  |   3 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/sbsa-ref.c               | 757 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 762 insertions(+)
 create mode 100644 hw/arm/sbsa-ref.c

-- 
2.7.4

