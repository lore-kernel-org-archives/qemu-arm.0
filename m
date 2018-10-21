Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2198043wrt;
        Sun, 21 Oct 2018 14:26:02 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e78VGYmdMNCBvE0SqM1H+egpSoJ+rUKhQra6i4E0qxNo9LYvwl7FU9vyNv0lci1FeQlc5/
X-Received: by 2002:ac8:76d9:: with SMTP id q25-v6mr11858891qtr.35.1540157162506;
        Sun, 21 Oct 2018 14:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540157162; cv=none;
        d=google.com; s=arc-20160816;
        b=d8P86w7LkQ5FJEB86RYzTupHW3NpvJTV/9+bEnTc4ZMJ9xPoUCT7s80YFxFDTo8OPt
         gdhClsZGkNxJVtnStDpRmHzJMxMvJ011VkpYY04VB9SX4GymVawvx+wMt5CXtpk/iqRL
         YCPzlbP+NrmWjp80FmzGfaOL3IOfbV2DPlj1U1mPSRybJwpQf9k97e3DXsi2YS74LPjY
         nul2Qnq0zv0eFPgjTNtGvhf3+C9hMDsGZn01MyblH5iHgrVRMqDw5q8xBWtdTbIPdhZU
         /yV4vX6pDwWzIFz1s2SiZ37AI6RXAett7jik+WGkXoEhz4bRgE9DU2UYnTQWuvc8IBmJ
         7SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=1JhcE7MUIyoroZoKl/9ZfPJsxxaQWz70Mcm4pLZT4Vg=;
        b=wBwl7vOk1+QKxw0NdgJQpkzakz78TQAlRFrrNkm0u4SVotBEPFZrD0T7pC3CGjysah
         XCimGQQOIxmZ+EUnbXU72ya0kOHX51V+LnuDadL/hVvduRxmyOFVo8DN02lMhv4Gj+qK
         JxgfjUohdopFciHzkfL3L3glmuWnAImw46NPdHjYecoYltpLU+Tp3QNqkTXeGw7G6RNu
         5ZWmEIoiAqSaksitLAQfx3ECVqGxpKzbIZ79C6Up5tGfza/hRX+8pcoSr3TyRyKMOOe9
         WgPer8bzwj+OWmfEy7mcUayIq9O7N4nP9alu2SEuyMRRh9ZpohAU6rfYwQA9a1PxTChK
         rRIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMP8a8cc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w26-v6si4999779qta.290.2018.10.21.14.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Oct 2018 14:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMP8a8cc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gELEV-0002kb-1P
	for alex.bennee@linaro.org; Sun, 21 Oct 2018 17:25:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gELEN-0002kP-1J
	for qemu-arm@nongnu.org; Sun, 21 Oct 2018 17:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gELEM-0006kk-45
	for qemu-arm@nongnu.org; Sun, 21 Oct 2018 17:25:50 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gELEL-0006jx-Jq
	for qemu-arm@nongnu.org; Sun, 21 Oct 2018 17:25:49 -0400
Received: by mail-oi1-x242.google.com with SMTP id y81-v6so30655093oia.6
	for <qemu-arm@nongnu.org>; Sun, 21 Oct 2018 14:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1JhcE7MUIyoroZoKl/9ZfPJsxxaQWz70Mcm4pLZT4Vg=;
	b=JMP8a8ccRz9DDOYW4N6NyI5mH6tmAfmfhP6IKf409k2Jhrw2ayiW2ILjKjDb+0ZV+1
	poIx9Dpwekxc0iaU706v8MXCpF8oEa8Led7FP3FlITh9A8jiBbD8D43cIvPxu1fAcmzQ
	eoGd/RIfx++WOrP8B1IS6Tn9CR2Wx40LHY3Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1JhcE7MUIyoroZoKl/9ZfPJsxxaQWz70Mcm4pLZT4Vg=;
	b=sJtpIcrid5UsWcKHnmIy9UpL4OEowO1Kcogyiwnm580pp0JYtILVvWF6AO+yRQauUt
	HBsuyYMZS59WE1bDXORNuut4JHCxCJ2fgaKSNCozZYojCmEH1Gt35OBqoBKEzlWCiRoQ
	B5hAfIWNTPCCRLdmocZnmWSCDCNQm2NmMTDwBhpNK0oNwzT5//+ff4Y5vMQ+IqgKJ0Eg
	72rv0BuamHBrYF0uWZ91HBjQNzwcjVgE3VbRYda29SNi12qQnCDPLdi7NKrOHYCisPeK
	ixL6rviK4crL/HWwvZ4zfC5uTpX4ayq9hNV3AWMVEGVsCnsNAoi9nmk+Q73iIF7GLcgZ
	HfrA==
X-Gm-Message-State: ABuFfoioBx8KT+X+atxfdjpKR9Sc1LO1VXHYW6qjvw9iRk1Az0I+aCae
	bRQ3a1CWaebUwYoA1XWgAeHg2tNY+L+PUjxZS+ExFg==
X-Received: by 2002:aca:ef56:: with SMTP id
	n83-v6mr21544745oih.146.1540157148790; 
	Sun, 21 Oct 2018 14:25:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Sun, 21 Oct 2018 14:25:28
	-0700 (PDT)
In-Reply-To: <20181021192457.GG4229@toto>
References: <20181017213932.19973-1-edgar.iglesias@gmail.com>
	<20181017213932.19973-4-edgar.iglesias@gmail.com>
	<CAFEAcA9Dd3=52zReFVMgitYFeQsRA=guYsVMxy=0zHsLJ_+z_g@mail.gmail.com>
	<20181021192457.GG4229@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Oct 2018 22:25:28 +0100
Message-ID: <CAFEAcA_URiHwcu1k-MYGpw704y_t4RuUFHGrpa4XA9GTKBb8aA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v3 3/4] hw/arm: versal: Add a model of Xilinx
 Versal SoC
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E9ywgYCQf7JE

On 21 October 2018 at 20:24, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> On Fri, Oct 19, 2018 at 03:18:24PM +0100, Peter Maydell wrote:
>> On 17 October 2018 at 22:39, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>> >
>> > Add a model of Xilinx Versal SoC.
>> >
>> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> > ---
>> >  default-configs/aarch64-softmmu.mak |   1 +
>> >  hw/arm/Makefile.objs                |   1 +
>> >  hw/arm/xlnx-versal.c                | 324 ++++++++++++++++++++++++++++
>> >  include/hw/arm/xlnx-versal.h        | 122 +++++++++++
>> >  4 files changed, 448 insertions(+)
>> >  create mode 100644 hw/arm/xlnx-versal.c
>> >  create mode 100644 include/hw/arm/xlnx-versal.h
>>
>> > +    if (!kvm_irqchip_in_kernel()) {
>> > +        qdev_prop_set_bit(gicdev, "has-security-extensions", true);
>> > +    }
>>
>> Do you really support KVM for this board/SoC ?
>>
>
>
> I haven't tried yet, so probably not, but KVM is something we'd like to support further down the road...
> If you prefer, we can remove this kvm specific check for now though.

I think there's other things you need to do to support KVM
(for instance, you need to disable EL2 and EL3 on all the CPUs,
and you need to either handle a GICv2 or error out properly
if the host system doesn't have a GICv3), so maybe it would
be better to add support properly later. This isn't a subtle
check we'll forget to add in later either -- if you set
has-security-extensions on a KVM GICv3 then the device will
fail its 'realize' method with a suitable error.

...which leads me to notice that here:

+    object_property_set_bool(OBJECT(&s->fpd.apu.gic), true, "realized", errp);

we capture the possible error from realize in errp, but we
don't actually check whether it failed, so the rest of the
function will plough ahead and try to wire up IRQs and
MemoryRegions that won't have been created.

thanks
-- PMM
