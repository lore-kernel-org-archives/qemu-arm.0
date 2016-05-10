Received: by 10.25.208.137 with SMTP id h131csp2202482lfg;
        Tue, 10 May 2016 11:13:43 -0700 (PDT)
X-Received: by 10.141.2.9 with SMTP id e9mr46264590qhd.18.1462904023052;
        Tue, 10 May 2016 11:13:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y62si2251582qke.261.2016.05.10.11.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 11:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0CAA-0004I5-I3
	for alex.bennee@linaro.org; Tue, 10 May 2016 14:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b0CA6-0004Ea-Vk
	for qemu-arm@nongnu.org; Tue, 10 May 2016 14:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b0CA4-0007bX-Fw
	for qemu-arm@nongnu.org; Tue, 10 May 2016 14:13:37 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1b0CA4-0007bB-Bl; Tue, 10 May 2016 14:13:36 -0400
Received: by mail-oi0-x241.google.com with SMTP id w198so2808428oiw.2;
	Tue, 10 May 2016 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=uAouqN5FJ8ShBokzbVQDcMoV00BWHawlDstdJuDpK+Q=;
	b=SIKHQuceZq4hxMOLvWki7aum2Mm/oBwDd+hG8ThFL9i8FndPnqX+k8HwmfAOKWRbBz
	pDWGMyiprkuX2cbfI8R2RHIOy4DMxW9/LQ66AlTfOveFRagHpyYT0PtIEl3u3Nk49m7i
	fY5+TGbsD9rRfFNekkLIm+GsgF1sd2qGKhBicPdthhm8KW7LFiePUa6fbU7tRArcDV4E
	RSraW2JIyiXpxjA/rh5jEKyI6uguAxbaVhEJ4RZNbHf4dwEEqKTVBeJIr0w9Ud9SygbA
	8mDto/iAXuD2WcP1FemfHcce8wc+UmnSH90mACcI4jdeO5b41PwROIwpFHjh++SeyRDx
	LeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=uAouqN5FJ8ShBokzbVQDcMoV00BWHawlDstdJuDpK+Q=;
	b=UpKsiYCNlPTUwG6iAvBahZOpqRzyDb4iuRZSdNh85u+s0uuuhOdGDowtTiaDLfC0JS
	zK4FT+Riyt04T5LJdGFLHkmERIJAFT87lEUlkSQHj3bf+aMMrwQHDe+luv4920z0AHWZ
	NU3Tv168mNhR6fn5RN6KtwhqbFRJbMpH1VLkCvH8xjTwXhQbyzZ4RQhLYSJXXiZYqt93
	qDKZTcvF94J0mBocdP2u1Z/gsU+V9hNDTMqNLrFVLVL4K0OcWZ2dRxjqp149ckpMWT5v
	EMq00OTh+sINANFHBOpmx6EcSQkgTWNw92Z4hTGSFHq6TCSYAnaT2q+KekmJkyzSD+2P
	N2Mg==
X-Gm-Message-State: AOPr4FX4HisMe5z7S3V1zc3IX3wNDoGgZa4MHebDnoK9mN3DD2QZjwpPBpbMvdjtSyk6GUSw4gdys4vh2dd7AA==
X-Received: by 10.202.203.78 with SMTP id b75mr11595476oig.161.1462904013893; 
	Tue, 10 May 2016 11:13:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.142.193 with HTTP; Tue, 10 May 2016 11:13:04 -0700 (PDT)
In-Reply-To: <CAFEAcA84aHCj2ADGkuxEbdx1qy7scu+nXSTU5K70ZPXR2PL1Ng@mail.gmail.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
	<20160507015121.GF16305@toto>
	<CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
	<CAFEAcA9cGbU+LdZD9YzkJ8VMEyt+gKd5+8qi+Q-m+tgtNBg10w@mail.gmail.com>
	<CAKmqyKOjOwWOp-6kzOunxf0F8c8r+ua62gxFJ6x2vJR2Yaz_Nw@mail.gmail.com>
	<CAFEAcA84aHCj2ADGkuxEbdx1qy7scu+nXSTU5K70ZPXR2PL1Ng@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 10 May 2016 11:13:04 -0700
X-Google-Sender-Auth: VytEwUavWd-my-VQ_tb3y01-hPw
Message-ID: <CAKmqyKP+SRd6ciE_8ZQDu1oGm=bvDzNGLfevsUngZ5kCJ+t8fA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pYIhugV3CqqK

On Tue, May 10, 2016 at 1:09 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 10 May 2016 at 01:16, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> It is actually a u-boot problem. I originally just assumed it was a
>> Linux problem, but it happens before u-boot hands off to Linux.
>
> OK, that makes sense. u-boot tends to be a bit lower level and less
> hardware-agnostic. I just wanted to check it wasn't caused by some
> problem in QEMU's EL3 support we could easily fix.
>
>> It appears that u-boot won't work at all with EL3 enabled but EL2
>> disabled. It always moves to EL2 before moving to EL1 and there is no
>> code prepared to handle going from EL3 directly to EL1.
>>
>> Just for the record, I'm specifically talking about what happens in
>> the do_nonsec_virt_switch() function.
>>
>> It looks like there are three options:
>>  1. Add support to u-boot to drop from EL3 to EL1 (I'm assuming this
>> is possible, as not all implementations have EL2)
>>  2. Just wait until QEMU adds EL2 support
>>  3. Allow a QEMU command line option to start in EL1 instead of EL3
>
> I would be OK with any of these three from a QEMU perspective.
> Fixing u-boot is probably conceptually the nicest but I've never
> looked at u-boot internals so it could be simple or painful...

I had a quick look and it didn't look easy to do unfortunately.

Thanks,

Alistair

>
> Edgar, do you have the list of what we're still missing before we
> can turn on EL2?
>
> thanks
> -- PMM
>
