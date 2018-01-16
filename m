Received: by 10.28.173.206 with SMTP id w197csp4577753wme;
        Tue, 16 Jan 2018 15:34:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBouSg5p4KQE348XQY3SBSp0LPvwcVIcz9PZ8SPfInUeeLnVbS3VaCn3WmF5HWFDFsapYBT9h
X-Received: by 10.37.207.4 with SMTP id f4mr4402677ybg.19.1516145696473;
        Tue, 16 Jan 2018 15:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516145696; cv=none;
        d=google.com; s=arc-20160816;
        b=jWhN07Tz0sIen0r3PsuFUjyifjl4K7z1VT4pvjg/j03wbBn4XhGIIag5sqaOs8J8jK
         cDuA2T8JZH/EPu7Ukj1ShkwOuvUh6W6MAM248Xk+xQqXCEinp0TgCDIqakc6sfglJX4i
         Zt8rABCsC2b1fqVmimHC+hx4qjpIDJbPdMu3nPifkhJeX4NRNfch4sJhExJu4FMvD2Wj
         MbS/cmVRGRmLsgg7hATLWzpwbMdjK/ZPLjHJJHOJK6XG4kAJqYT8Jm0HgBC/I2pIeuQS
         2eI7D76749f17Gk/S9EcjYXTfvICsyj5mDFrKViCc9KRTN8QlMNBA+KkXusYMfQZ3+U2
         +dMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=on4gA6FyPEBPGe4YQ1yMZu0VAxVzzQkdZD95izVgqfw=;
        b=rtCWYAlmcgeL8eJ4CuWSqHaqpRHzTNB5dNhKbCQlttMEl4iA0NB89KnhbLYTqCsADl
         406WhDcDT+U1UR6ezAdQsbQPX2rG10goAufFwP8+U/+oV3O4Ehb2jaQKiLI/6N+NEJgQ
         mbbZH/Ejg0RsTmlSlTO14crjn9agHk0ixmdZ3AcxCOYkXoczQf0kchTBOS5XRxoC/MbG
         gIiT8t2JO5UpMpH6uBPDrnYkQH9Kj0EAhdrrcWGn8QJSltVVRnZRee21KtwDfNxGSbFT
         MkwnqgXixe2ZIE9MErfS/levZ0ohY4OsSZmjhUO+sWmjVeMsdKcIiIkmeg4oHiktL53Z
         DsFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LPc8Hksj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si764269ybe.811.2018.01.16.15.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 15:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LPc8Hksj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebakp-0001lk-ST
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 18:34:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ebai2-0008Q9-7U
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 18:32:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ebai1-0004nB-6H
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 18:32:02 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35647)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ebai0-0004mK-V2; Tue, 16 Jan 2018 18:32:01 -0500
Received: by mail-lf0-x242.google.com with SMTP id a204so11258009lfa.2;
	Tue, 16 Jan 2018 15:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=on4gA6FyPEBPGe4YQ1yMZu0VAxVzzQkdZD95izVgqfw=;
	b=LPc8HksjgCOHoSNzFG0QaLBCtxHcaXfi2uU+J7JbM9v7kdzDoeVaOrcQLASyd3kgiD
	RluWRMuWnHp+/XYoShhoyN35xkbcJVSX497MNgmCrRiXLlR2vNfHHJXUInXDl+NjZIyz
	AxWih4KZZO0O1aBU2AQXBmXF/2OoLeWwNL+fh3hmpMi/dcjNq/4UGHWt0dI6Vdp85Xa/
	IZgfwT7dH0fHsf3WtLgusF8ZiwV+finCNaS2RccVHezTcbIEp0yptg0jDPtFeU+OprAw
	NQ2n/f6m53XcM+2Dc0EKKW9I8kDytWYHY8x2qW38OiorYWiw0tGC9Sv/IUaPrzfraRRG
	ONQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=on4gA6FyPEBPGe4YQ1yMZu0VAxVzzQkdZD95izVgqfw=;
	b=UISEVlRyxJ45nucf/PTtD2S8Ne76GNlpyk8BeCtO2Tg70SYmZ05JKFkX83LKvbsnUR
	cLTGCXE2TjIFGSCx8ws8BJywPc4q5wZ+qHLUnkNqhjwskayxRCMoMuZrrTwMJ2chxDcE
	vzLbosy1RfTPBRQ/2qiO82N6agKwN2rx+etskSERJHyBrXQhmr7NdSLnyZ4XINKTaZKA
	Feh15MKoDt1F4uSpf1akvGcmE2r/7CDTYJnC4OnhSOURbHVO0siMPR2N2+5uf91PVIcP
	aY0m+dbgx4McjUwivP2LWUtC9/iN5v8LFtXYVAuztU/MDCdatQ6SUw3kRIDiRyvMdGOY
	RS6A==
X-Gm-Message-State: AKwxyteHqXssdMXO4crhSvGuRcn0OnJOrTGpr4uYmAECGcqhmYWrSXpJ
	zmjz447xwaLxA70Xr3honor7BGgJyuKjOXFq4uI=
X-Received: by 10.25.20.31 with SMTP id k31mr17131725lfi.87.1516145519666;
	Tue, 16 Jan 2018 15:31:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.64.196 with HTTP; Tue, 16 Jan 2018 15:31:29 -0800 (PST)
In-Reply-To: <cover.1516144891.git.alistair.francis@xilinx.com>
References: <cover.1516144891.git.alistair.francis@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jan 2018 15:31:29 -0800
Message-ID: <CAKmqyKPE6cheSsr_k9QcJaX8K-wn1iV54Ozr585NTGoBwB1VPA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-devel] [PATCH v5 0/9] Add the ZynqMP PMU and IPI
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Edgar Iglesias <edgar.iglesias@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: skW2YHaGSafJ

On Tue, Jan 16, 2018 at 3:22 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
>
> This series adds the ZynqMP Power Management Unit (PMU) machine with basi=
c
> functionality.
>
> The machine only has the
>  - CPU
>  - Memory
>  - Interrupt controller
>  - IPI device
>
> connected, but that is enough to run some of the ROM and firmware
> code on the machine
>
> The series also adds the IPI device and connects it to the ZynqMP ARM
> side and the ZynqMP PMU. These IPI devices don't connect between the ARM
> and MicroBlaze instances though.
>
> V5:
>  - Fix clang makecheck error
>  - Rebase on master
> V4:
>  - Rename the ZCU102 machine to just ZynqMP
>  - Rename the PMC SoC to "xlnx,zynqmp-pmu-soc"
>  - Move the IPI device to the machine instead of the SoC
> V3:
>  - Add the interrupt controller
>  - Replace some of the error_fatals with errp
>  - Fix the PMU CPU name
>
>
>
> Alistair Francis (9):
>   microblaze: boot.c: Don't try to find NULL pointer
>   xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
>   xlnx-zynqmp-pmu: Add the CPU and memory
>   aarch64-softmmu.mak: Use an ARM specific config
>   xlnx-pmu-iomod-intc: Add the PMU Interrupt controller
>   xlnx-zynqmp-pmu: Connect the PMU interrupt controller
>   xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
>   xlnx-zynqmp-pmu: Connect the IPI device to the PMU
>   xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC
>
>  default-configs/aarch64-softmmu.mak    |   1 +
>  default-configs/microblaze-softmmu.mak |   1 +
>  hw/arm/Makefile.objs                   |   2 +-
>  hw/arm/xlnx-zynqmp.c                   |  14 +
>  hw/display/Makefile.objs               |   2 +-
>  hw/dma/Makefile.objs                   |   1 +
>  hw/intc/Makefile.objs                  |   2 +
>  hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++=
++++++
>  hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
>  hw/microblaze/Makefile.objs            |   1 +
>  hw/microblaze/boot.c                   |   2 +-
>  hw/microblaze/xlnx-zynqmp-pmu.c        | 204 ++++++++++++
>  include/hw/arm/xlnx-zynqmp.h           |   2 +
>  include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
>  include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
>  15 files changed, 1275 insertions(+), 3 deletions(-)
>  create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
>  create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
>  create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c
>  create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
>  create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h
>
> --
> 2.14.1
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.

ARGH! Apparently Xilinx started this crap up again. I didn't realise
this is on all my emails. I'll work on getting it removed.

Alistair
