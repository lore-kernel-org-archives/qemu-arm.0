Received: by 10.223.197.9 with SMTP id q9csp3824473wrf;
        Tue, 10 Oct 2017 10:59:53 -0700 (PDT)
X-Received: by 10.237.60.154 with SMTP id d26mr19218695qtf.227.1507658393174;
        Tue, 10 Oct 2017 10:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507658393; cv=none;
        d=google.com; s=arc-20160816;
        b=U7neFODcKS/Sk1l1ZkL8/aIvpZ0+EdXQq/Dy5X2OJYEDEAUTO9O5q+Fzvem+Omns/M
         Yh+8wbxS2TVBdebLzgocVc7pZDdM92Txe4DDK7yuer87IKJpl7GAZTzVr5AprD51j7+F
         a5n43b4Cf/BRFJHYhZcpeq9J/WIvWTtMRRWExUhlaB3qoYi1/X7Rrrd0fjGkfDsJ1A+E
         Vl15WT5Rax5+b56st3LzwhOebLYUL4yX8sf6LNsGqepzvpUFdSjSX7FoaOrRHilEMy/G
         drgtY9Qceh8oBjLhgvrQTXaILwwjbH1pJK2iuEsnNcf3LHAnyNKeJkQL4/+g2V8MuKcG
         XKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Vp66oPe2PtbiViiAHpBhBw+p3Ge6eAfcuj/KI9gfoM8=;
        b=ZT7AXkB4EXwAvDMWeucCKgQAmoaynZix+xyRFRl2wgMSb2AYCBCX+AxWco7dJi1Ahb
         clZAXC5HMl6Tvrh57+1PLnx2tOwzuqS9wn+ftsXlySnVpgP0BKNl9Wg9lveAUJQZe4tU
         eA3JgYA4c+0+yGRKle2rTOey/HuFXBOIqy7zNFuasF5xWrep4pVh/aDWTmqQ6+Ma7cum
         GouGDcjB/OWGhdYTfw4FMNxHrFQm8TeVPenAy6zljadJb9B0fNAAQZDkSTyWyDJPqHxj
         T7Wk1Og9sZwjQq/AlAnYLfeWeC+lh0rGKZdCudHwfLXOWSsKRZ2ky/dU/lniNwFKYDlb
         0ybQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DOtBl+Z5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y140si147645qky.192.2017.10.10.10.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 10:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DOtBl+Z5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1yoo-0001Mc-Uo
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 13:59:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e1yog-0001MT-AT
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 13:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e1yoe-0003YG-CI
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 13:59:42 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:53025)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1e1yoe-0003Xw-4Q; Tue, 10 Oct 2017 13:59:40 -0400
Received: by mail-wm0-x230.google.com with SMTP id k4so7663146wmc.1;
	Tue, 10 Oct 2017 10:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Vp66oPe2PtbiViiAHpBhBw+p3Ge6eAfcuj/KI9gfoM8=;
	b=DOtBl+Z5BiXfhpUl8ns+bs0hAsn8Nq1c4bwtj9LolknBTmm3cf15xUegYryUa64FRg
	QRYgN7eRy83Rds4iPzFUWAWyS4aLt+TG9lUoFVQZVKWUfoRYXDoq0wbl8jAU4+HyfHLr
	bChOxP2bw6cocTM4bEuBWLWn85k46cOoO+n4bDLBEgaqg0dP+q6TPi1Vz4yTtXUV+mjP
	gLy4TaUezypU7q4Fhgl3fmL1YWFk8R2+eWLOXg6h0YhN3QG4YXcwpbQTNJagaDPpLza1
	mTwfN5SVKPiwOGgWVIuniJ1pVDaS68j73K3Hwqjwb3Qr9/61WwHdPCkNM8ZWF6Iefx02
	UM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Vp66oPe2PtbiViiAHpBhBw+p3Ge6eAfcuj/KI9gfoM8=;
	b=LTJ9NWhaacBx/ftBl6XHjFxArfQJT3AxeiZEDj+NieiYJxa6gbMnzavsZ6uT63cAU3
	U1cfgedNNwHTq8ZNov/pmPfA3knEpNKFKdPSMEkpjH7mAgmv9cpavN+YEqo421ngfEyY
	Qx4rDJ+6zpeIr4ZDhIX2NYI3veQ7zQ1u/055j8V2vdf7+TgrH8Tpxn+aqYUF4uvZqf0h
	dqYNcMTHO8b0uZ29zHRyjZqgGOcXnHn4srTbWnNx09NpptIhptusI94HVLy1h9dQ4/ie
	R5LtPWH7mywvnR3FBh+LF4eudK1EbBK7+ORG8QzDt/j5h6m6UzxzJYTUwCL+d5Jos7/Z
	J1UA==
X-Gm-Message-State: AMCzsaXd1XOY8hqOxuK71Xw1wn5BP5w4GYwAj4MU7pqOBtk/nWFe3NkD
	5TGxUlGp47ouEEgGD0FK6vGMhwhb5bRRhYf1kcHm+g==
X-Google-Smtp-Source: AOwi7QC8zCbp/FbYCaO41rP3qGjjZQrx+Mad8z14S8ycdICFR+fcIIIO6d9Ye6Uc/lDVcAatLXF+8teq3Saa8Sy4jYg=
X-Received: by 10.223.131.65 with SMTP id 59mr12358488wrd.66.1507658378693;
	Tue, 10 Oct 2017 10:59:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.157.2 with HTTP; Tue, 10 Oct 2017 10:59:08 -0700 (PDT)
In-Reply-To: <20171010144834.GC5553@toto>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
	<20171008222029.GA29979@toto>
	<CAKmqyKMEbQ3JbqMxeeOTBV92ixRVDfw1wFi57xNKGyF82DSC_Q@mail.gmail.com>
	<20171010144834.GC5553@toto>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 10 Oct 2017 10:59:08 -0700
X-Google-Sender-Auth: V6KWOSzZDMgnBedl_Lnx3E16spU
Message-ID: <CAKmqyKMTqZA+t77XV3s2aicsbHHbF8h96w=dmWO9VHJkE0Uw8w@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/8] Add the ZynqMP PMU and
 IPI
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I+rBRW3LHxKS

On Tue, Oct 10, 2017 at 7:48 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Mon, Oct 09, 2017 at 05:12:39PM -0700, Alistair Francis wrote:
>> On Sun, Oct 8, 2017 at 3:20 PM, Edgar E. Iglesias
>> <edgar.iglesias@xilinx.com> wrote:
>> > On Wed, Sep 20, 2017 at 03:01:31PM -0700, Alistair Francis wrote:
>> >>
>> >> This series adds the ZynqMP Power Management Unit (PMU) machine with basic
>> >> functionality.
>> >>
>> >> The machine only has the
>> >>  - CPU
>> >>  - Memory
>> >>  - Interrupt controller
>> >>  - IPI device
>> >>
>> >> connected, but that is enough to run some of the ROM and firmware
>> >> code on the machine
>> >>
>> >> The series also adds the IPI device and connects it to the ZynqMP ARM
>> >> side and the ZynqMP PMU. These IPI devices don't connect between the ARM
>> >> and MicroBlaze instances though.
>> >>
>> >> v3:
>> >>  - Add the interrupt controller
>> >>  - Replace some of the error_fatals with errp
>> >>  - Fix the PMU CPU name
>> >
>> > Hi Alistair,
>> >
>> >
>> > Sorry for the super long delay...
>> >
>> > I think this mostly looks good but I was wondering if we really need
>> > to have a board specific (zcu102) PMU?
>>
>> It doesn't have to be board specific. What I wanted though was an SoC
>> and a machine so that maybe one day we could add the PMU SoC to the
>> ARM ZCU102 machine. After that it was hard to think of a name to
>> differentiate the SoC and the machine. Do you have a recommendation on
>> names?
>
>
> Hi Alistair,
>
> Yes, I agree with your approach but I got a little confused by the names.
>
> I think all the stuff that is inside the PMU subsystem architecture-wise
> should have generic PMU names (no ZCU102). I.e the ROM, the RAM, the IOModule,
> interrupt controller etc.

Ok I can rename them to the ZynqMP PMU (the machine/board) and the
ZynqMP PMU SoC. Does that work?

>
> The IPI block can be outside of the PMU module and be instantiated by the
> board or perhaps better if we could reuse some of the ZynqMP modules
> instantiated by the ZCU102 machine to get a CPU-less PS for the PMU
> to interact with. Or something along those lines.
> How does that sound?>

I'm a little unclear what you mean here.

Thanks,
Alistair

> Best regards,
> Edgar
>
