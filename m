Received: by 10.223.197.9 with SMTP id q9csp2987200wrf;
        Mon, 9 Oct 2017 17:13:29 -0700 (PDT)
X-Received: by 10.55.170.15 with SMTP id t15mr10670896qke.232.1507594409174;
        Mon, 09 Oct 2017 17:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507594409; cv=none;
        d=google.com; s=arc-20160816;
        b=Ta2/EwVDy+jqs89FY/gFmXq39cbxzmTsOJnCdx38tvGubNZVGHKArOgUbEP6028/KP
         XYvuPU5Q4porx3vnsDEug5VVWctJIUk2srxoypyWBGNPM7Lmn9vGW7i8pGQpNjeY+enr
         XDjKVfhJCCiSI9fnXU2tMdQ2ZC2aFFnn0XHp2r9M+QhSKoxHVrPVgSUDSvmtJZXld5l1
         CPLJn300MGVnRfUKmfk0aP0LwP8P3I89ZPZy/QkwhdHBzZmbH/umm6ejA8iImSNCmvqY
         wsdtRt6OAT/gawEQGWc5O+c/eWusfMCdBBNX45SSPsnjINvYv/+LPgvsY2keKqBbXmOM
         JsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ml+jAqVGKNty0fO+LdRW1QPlKHacJMh9BEMhM2KlPH0=;
        b=seOsJYteFnbYOPc5jA7VA9bVFue/llg64BhYGghhxgCmJgBqmaLkpTd/9Q7qg95uUn
         tLNMxn/L9LkFKyv4sRYVQQGBW/qx4V9C+nLli9QajMIfIaDzddAIAH0fJvOpY5JnAzMO
         8J/o4oAdoCR2L86nq6h4De1ZUD2WD2eHjBWmE/FzwRiUeeuDLctEDxmBZrchjHCu+Cf0
         Zz+iV1YaNKuS624AO6HwiLeslzSmuH06pTFrVmYV9KTllHO35y9PGnPnEdqCy/gtO3sD
         QOs/h/RbPEpVceh2N6pMZTsmq5RBNQ7X6GLAkobNIB3ntvqKgQxd4kfaUgUDh1zOqlzF
         Q3jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HpAGq2Ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si1284877qtz.236.2017.10.09.17.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 17:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HpAGq2Ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1iAo-0005Gg-Re
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 20:13:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e1iAc-0005FK-Nn
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 20:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e1iAb-0004eH-Qc
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 20:13:14 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:38687)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1e1iAZ-0004dK-9j; Mon, 09 Oct 2017 20:13:11 -0400
Received: by mail-wm0-x241.google.com with SMTP id q124so23007337wmb.5;
	Mon, 09 Oct 2017 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ml+jAqVGKNty0fO+LdRW1QPlKHacJMh9BEMhM2KlPH0=;
	b=HpAGq2NgrNHSt4tUxCyDIaZFYwyeisXnriN62j7O+ct+eSHiZLjG1Kr1hyJDG4h7fa
	isXmmq+XLpaE5EF2YKhtb6/S5O9mv1LRyT9UJYL+bZH0Q4G/hfwCrBIpO31yEGnlH/XC
	DW5AzdDdKso0EKcRdNutNxvnVssVqzrgJwGTGq43SK1S32IhqaNXmDcsCGR37/0b9kfJ
	eoFZQ7s4+GnsUIAvl9O3AbL9FbC+tx3DEP7lObkKk0RsVFn9igKmTPWJ/Iu/9wGoEQq6
	ABrJr0MBfm0YO37A61xZ2y69YXXgcSKisme9UTf7fUy9oITjAiLbVzagF/p0dmdzteL8
	NmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ml+jAqVGKNty0fO+LdRW1QPlKHacJMh9BEMhM2KlPH0=;
	b=CFX9sayIf0/C1qZfyDAdr2qdYq6d/vJuUmDdm71U6+hp2VCY8yeUYsziGOFUI7asR5
	gi9SRixVUaJayElkESIqszler6G18PXgXXOiZMdmatmGufe2IwH4KDbsWaeuQU/c3zZf
	oFOCjaMyeSS4tAdfbHaVsZSRc2z2MoKt0lnrV7F2eg5vOglQC19LQPiLK7M+UnofWrHT
	zsBgXUvNurhy9C6x6I4dTGWz01agn6w6JWfL/S0kVEBhR6WGPdSBhJjKUddRuQW5U+HP
	GavxoBcEmG6SrgGQ1V7+3L+AKrinVvHnI96Zqwd0kaOLOnmFVOQpObncgiUsue09dDg5
	xIUw==
X-Gm-Message-State: AMCzsaUYfe4iJMSF3fgY+Ls72v31rlEPLoycH9scCXGtBzPMRgC1vvaD
	yKzs0+x5omfUJExb9sc+3ZtkjhPyp9qtfbdfEr8=
X-Google-Smtp-Source: AOwi7QB4hxszUtMsKQuYctBgAQj4bDfDw2yt730I47hl0gGWRpcil5xOiiJq5153bOUcvyYIiHuLzZI56IsY9x4cevo=
X-Received: by 10.223.144.71 with SMTP id h65mr10928853wrh.41.1507594390274;
	Mon, 09 Oct 2017 17:13:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.157.2 with HTTP; Mon, 9 Oct 2017 17:12:39 -0700 (PDT)
In-Reply-To: <20171008222029.GA29979@toto>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
	<20171008222029.GA29979@toto>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 9 Oct 2017 17:12:39 -0700
X-Google-Sender-Auth: 9veDuLk-bwZS8iSLzpZdoE6yOQI
Message-ID: <CAKmqyKMEbQ3JbqMxeeOTBV92ixRVDfw1wFi57xNKGyF82DSC_Q@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH v3 0/8] Add the ZynqMP PMU and IPI
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JIYaU7uZ8wxH

On Sun, Oct 8, 2017 at 3:20 PM, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> On Wed, Sep 20, 2017 at 03:01:31PM -0700, Alistair Francis wrote:
>>
>> This series adds the ZynqMP Power Management Unit (PMU) machine with basic
>> functionality.
>>
>> The machine only has the
>>  - CPU
>>  - Memory
>>  - Interrupt controller
>>  - IPI device
>>
>> connected, but that is enough to run some of the ROM and firmware
>> code on the machine
>>
>> The series also adds the IPI device and connects it to the ZynqMP ARM
>> side and the ZynqMP PMU. These IPI devices don't connect between the ARM
>> and MicroBlaze instances though.
>>
>> v3:
>>  - Add the interrupt controller
>>  - Replace some of the error_fatals with errp
>>  - Fix the PMU CPU name
>
> Hi Alistair,
>
>
> Sorry for the super long delay...
>
> I think this mostly looks good but I was wondering if we really need
> to have a board specific (zcu102) PMU?

It doesn't have to be board specific. What I wanted though was an SoC
and a machine so that maybe one day we could add the PMU SoC to the
ARM ZCU102 machine. After that it was hard to think of a name to
differentiate the SoC and the machine. Do you have a recommendation on
names?

Thanks,
Alistair

>
> Best regards,
> Edgar
>
>
>
>>
>>
>>
>> Alistair Francis (8):
>>   xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
>>   xlnx-zynqmp-pmu: Add the CPU and memory
>>   aarch64-softmmu.mak: Use an ARM specific config
>>   xlnx-pmu-iomod-intc: Add the PMU Interrupt controller
>>   xlnx-zynqmp-pmu: Connect the PMU interrupt controller
>>   xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
>>   xlnx-zynqmp-pmu: Connect the IPI device to the PMU
>>   xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC
>>
>>  default-configs/aarch64-softmmu.mak    |   1 +
>>  default-configs/microblaze-softmmu.mak |   1 +
>>  hw/arm/Makefile.objs                   |   2 +-
>>  hw/arm/xlnx-zynqmp.c                   |  14 +
>>  hw/display/Makefile.objs               |   2 +-
>>  hw/dma/Makefile.objs                   |   2 +-
>>  hw/intc/Makefile.objs                  |   2 +
>>  hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
>>  hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
>>  hw/microblaze/Makefile.objs            |   1 +
>>  hw/microblaze/xlnx-zynqmp-pmu.c        | 200 ++++++++++++
>>  include/hw/arm/xlnx-zynqmp.h           |   2 +
>>  include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
>>  include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
>>  14 files changed, 1270 insertions(+), 3 deletions(-)
>>  create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
>>  create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
>>  create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c
>>  create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
>>  create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h
>>
>> --
>> 2.11.0
>>
