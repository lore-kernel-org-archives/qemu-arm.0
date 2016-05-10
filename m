Received: by 10.25.208.137 with SMTP id h131csp2204726lfg;
        Tue, 10 May 2016 11:19:24 -0700 (PDT)
X-Received: by 10.141.1.134 with SMTP id c128mr15329192qhd.7.1462904364842;
        Tue, 10 May 2016 11:19:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si2282070qhc.122.2016.05.10.11.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 11:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0CFg-0002c1-A6
	for alex.bennee@linaro.org; Tue, 10 May 2016 14:19:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b0CFc-0002ZP-SN
	for qemu-arm@nongnu.org; Tue, 10 May 2016 14:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b0CFb-0000Ob-9I
	for qemu-arm@nongnu.org; Tue, 10 May 2016 14:19:20 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1b0CFb-0000O1-26; Tue, 10 May 2016 14:19:19 -0400
Received: by mail-oi0-x242.google.com with SMTP id i2so2838584oib.3;
	Tue, 10 May 2016 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=PDkQDk9+ShCZBHnJmJNQrAl2dllF+AM/QQlZY1N9zD4=;
	b=qrT2LM2ViO/4Ee4VY9n68mpUpSM2M1KbVErKd0Gb9R/9WKj83qGKk5CxXTytS9J1nS
	akQ1xq1miuhyPzbNujhOwMvuPAfr9tTokTMccjG47KIpdSQ51ooRNLPHVc1BzX/Qyy5o
	/j54hkMsysWYLgqQB8Yktf+7eG/Rk7CC1WlJBbTC27RUHaQP3f6JJ/Ib6jbN4L1MHxlC
	xHbf/V62V6c/YhLbN9X9gmc5oFYZl9Agp/Su3udaiUBRL/7wcLXd6HveiX1v3CE8AQ6O
	HDmQSGvWeZCjb11EuOhj/bOz32I4UigFXazwvACnbEZWTRm6Duj8KE8CjJH24j/ddyO2
	0bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=PDkQDk9+ShCZBHnJmJNQrAl2dllF+AM/QQlZY1N9zD4=;
	b=PdlwaigaCwbiPuIprdqKjConBoRYtvLfT5xw0eA2xY/NkNLl/uH7kEYYbTkcH4IBqG
	qAU1NY7FvgUpOQRL1g4G+8au+RuJsQpwUMLOVOa9gVtLOq87AXakujUtMpVCwNmu6IME
	JEhJUqZl/dsP91Ohuf6//ZUyIpNhJwJkAFdo6mkv5/mbuQmdDa4egzBhPDtkwhRCJLP7
	Ok6h3zszimarxLzZX0OqSNm2u8/m854j3jG5DcEOyb7yanjj1bBt+Iyu//EugocUvyTP
	L630qguzKdpfb4gsVmJx46F31pRjl0sbDYWel7x/sIyBJsC3YrbeM277v3VOoleZCfto
	tGKQ==
X-Gm-Message-State: AOPr4FXcmpRa8VV7EpfYJ6gx6E/NRBdfg/x3yAFwCy0InI7YsASkWP6GUHe5/ScpMXE/pXqdOkYT1qWJNxe4GQ==
X-Received: by 10.157.1.79 with SMTP id 73mr3655361otu.17.1462904358405; Tue,
	10 May 2016 11:19:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.142.193 with HTTP; Tue, 10 May 2016 11:18:49 -0700 (PDT)
In-Reply-To: <20160510103637.GH16305@toto>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
	<20160507015121.GF16305@toto>
	<CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
	<CAFEAcA9cGbU+LdZD9YzkJ8VMEyt+gKd5+8qi+Q-m+tgtNBg10w@mail.gmail.com>
	<CAKmqyKOjOwWOp-6kzOunxf0F8c8r+ua62gxFJ6x2vJR2Yaz_Nw@mail.gmail.com>
	<CAFEAcA84aHCj2ADGkuxEbdx1qy7scu+nXSTU5K70ZPXR2PL1Ng@mail.gmail.com>
	<20160510103637.GH16305@toto>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 10 May 2016 11:18:49 -0700
X-Google-Sender-Auth: ILkQz5gsdo-BevgDPs6Owr9Yrj0
Message-ID: <CAKmqyKMXg1Xfgh5igu4imAgn2MtpGFKk4d8ysHv3Rz8qhr5DWA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 2/2] target-arm: Enable EL2
 for the A53s and A57s
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W2wFzYiuXsP5

On Tue, May 10, 2016 at 3:36 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Tue, May 10, 2016 at 09:09:55AM +0100, Peter Maydell wrote:
>> On 10 May 2016 at 01:16, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> > It is actually a u-boot problem. I originally just assumed it was a
>> > Linux problem, but it happens before u-boot hands off to Linux.
>>
>> OK, that makes sense. u-boot tends to be a bit lower level and less
>> hardware-agnostic. I just wanted to check it wasn't caused by some
>> problem in QEMU's EL3 support we could easily fix.
>>
>> > It appears that u-boot won't work at all with EL3 enabled but EL2
>> > disabled. It always moves to EL2 before moving to EL1 and there is no
>> > code prepared to handle going from EL3 directly to EL1.
>> >
>> > Just for the record, I'm specifically talking about what happens in
>> > the do_nonsec_virt_switch() function.
>> >
>> > It looks like there are three options:
>> >  1. Add support to u-boot to drop from EL3 to EL1 (I'm assuming this
>> > is possible, as not all implementations have EL2)
>> >  2. Just wait until QEMU adds EL2 support
>> >  3. Allow a QEMU command line option to start in EL1 instead of EL3
>
> Alistair,
>
> Our usual ZynqMP boot flow is
>
> ATF at EL3
> ATF hands over to u-boot at EL2
> u-boot hands over to the Linux kernel at EL2
>
> Our ATF has a mode where it can be instructed to start u-boot in
> EL1, bypassing EL2. That would avoid this issue. You don't need to
> recompile ATF. We can discuss the details off-line.

Hey Edgar,

Unfortunately that doesn't work with JTAG boot mode, which is what we are using.

Just to confirm it though I edited the ATF source to handoff to u-boot
in EL1. Then using my device loader patches I managed to boot ATF to
u-boot to Linux. So besides the missing EL2 support the general flow
seems to work. Linux tried to execute code outside RAM or ROM, so I
never made it to a login prompt though.

>
>
>> I would be OK with any of these three from a QEMU perspective.
>> Fixing u-boot is probably conceptually the nicest but I've never
>> looked at u-boot internals so it could be simple or painful...
>>
>> Edgar, do you have the list of what we're still missing before we
>> can turn on EL2?
>
> We're missing the Data Abort ISS:s, we're missing modelling of a few registers
> (like HSTR_EL2). Some regs are quite incomplete like HCR but I think we can
> live with that. GICv2 virtualization is missing. We are also missing a few
> AT_ modes. AArch32 support is probably lacking alot of more stuff.
>
> IIRC, last time this came up we talked about enabling EL2 after ISS and
> GICv2 virtualization support gets merged + a few odd regs. Enough to allow
> Xen and KVM to work under emulation.

Do you have a rough time frame on this? Right now I can't see any way
to boot Linux on the up-streamed ZynqMP machine. If EL2 support will
take a long time we might need to look into one of the alternative
work arounds for the time being.

>
> Cheers,
> Edgar
>
