Received: by 10.25.159.19 with SMTP id i19csp2157581lfe;
        Mon, 18 Jan 2016 14:14:04 -0800 (PST)
X-Received: by 10.140.102.246 with SMTP id w109mr33817815qge.58.1453155244499;
        Mon, 18 Jan 2016 14:14:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16si33281523qge.70.2016.01.18.14.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 14:14:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLI3o-0004QC-11
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 17:14:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLI3m-0004Q0-8F
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 17:14:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLI3l-0004B0-8J
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 17:14:02 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:36302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLI3l-0004At-3V
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 17:14:01 -0500
Received: by mail-vk0-x232.google.com with SMTP id n1so184102960vkb.3
	for <qemu-arm@nongnu.org>; Mon, 18 Jan 2016 14:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zN8qi6pdP91X0Ax4I6avAa6ipgNCB82ATNxdm4JVXl0=;
	b=YsJ/D/qcOJPUOmBNCKWK7nBZqSyY7xS/oZQqmaw6Br1kVw2WhKCsFAAk0xqdFPFOcd
	8L9PP7JhOoiaIhwQiEjtAGRy5NAkAd95olcf6JQdemvSSkl07FAl958d9hlLJyVek1/q
	BcijZixHpiXijU1ILXU+zuTtgtwcxuDJTAc+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zN8qi6pdP91X0Ax4I6avAa6ipgNCB82ATNxdm4JVXl0=;
	b=J2c4cIakc0NoopdgeR8vfrUQjWdckdgoNfZX2k/xtUtHaKQvu9h1zn8G9DN+S8fnkU
	88rqJIBwmAauPSQN1wp0B7ODUnXpoApi8S2OltYvR5FinMTucyxropypIOJZ9+pZnWbP
	tysY8gfemgOBK2z8JjPPtEj2R6EzGyoiwGNtizUqI6Kkhdf1qmxWe8b4GJi9O4zY67wi
	w3L6QP53BSKgKJhHLIrryTZHCIg0dH+Eqgww6ZK2tA6Ds8pTDBd7/7v8SyiX0byGnkGE
	9S4yi8aUbmN9ojjxcJhB8ee3pCtUPVJ4USpkQbUgiUF2y7nYJ0o9PYyoaUkt4/KgjRzq
	qsxw==
X-Gm-Message-State: ALoCoQlpZQdl3glxVO+0fEyWwZnTD83y/UxxDEfLP7t6Dm3OTfeFIjTTPFl6AmqykH+IdzwpFjGGnIek/WAh1KQDWHviId/fgGZqdgP2QVEBVvx3UDFc8TM=
X-Received: by 10.31.107.138 with SMTP id k10mr17227554vki.27.1453155240740;
	Mon, 18 Jan 2016 14:14:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 18 Jan 2016 14:13:41 -0800 (PST)
In-Reply-To: <CAKmqyKNyc2tU0cmGhGDz2tm17q7fYRzqmML-Yo2fE8Ly4fmtAQ@mail.gmail.com>
References: <861da5c44f261ee3f160607c9d128ce0e9f89e9e.1452277501.git.alistair.francis@xilinx.com>
	<CAFEAcA-mmYVGqBP9J855Xm20n0XGVMLoWv4Lze61y00EvFBDyw@mail.gmail.com>
	<CAKmqyKNyc2tU0cmGhGDz2tm17q7fYRzqmML-Yo2fE8Ly4fmtAQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2016 22:13:41 +0000
Message-ID: <CAFEAcA98nrOuWTjgpkJ9W4QRS+pDZprnYLPNNKd=GqYBD9Zc=A@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] arm_gic: Include the GIC
 ArchRev in the ICPIDR2 register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N8aTXHzsS9A6

On 18 January 2016 at 21:41, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Mon, Jan 11, 2016 at 5:58 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The current implementation of the ID registers seems to be
>> simply "like the 11MPCore interrupt controller". I think we
>> should get them right more generally if we're going to fix them:
>>
>>                        fd0 .. fdc     fe0 .. fec      ff0 ... ffc
>> 11MPCore               reserved       90 13 04 00     0d f0 05 b1
>> ARM GICv1 (eg A9)      04 00 00 00    90 b3 1b 00     0d f0 05 b1
>> ARM GICv2 (eg A15)     04 00 00 00    90 b4 2b 00     0d f0 05 b1
>>
>> Your patch doesn't account for ICPIDR1 also having a field that
>> changes between GICv1 and GICv2 (for ARM implementations), and
>> we're missing the fd0..fdc bytes.
>>
>> I think this is probably simplest modelled with several
>> gic_id arrays and using the appropriate one for 11MPCore/GICv1/GICv2,
>> rather than trying to OR extra values into the 11MPCore ID values.
>
> Ok, just to make sure I am reading this right. You think I should just
> create three arrays and then if() the revision to determine which one
> to use?

Yes, something like that. The fd0..fdc being reserved for 11MPCore
is documented to mean RAZ/WI, so you can just make those array elements
zeroes.

thanks
-- PMM
