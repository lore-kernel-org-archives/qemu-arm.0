Received: by 10.25.208.137 with SMTP id h131csp2005385lfg;
        Tue, 10 May 2016 03:36:50 -0700 (PDT)
X-Received: by 10.140.232.137 with SMTP id d131mr43248898qhc.87.1462876610539;
        Tue, 10 May 2016 03:36:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13si943410qkb.79.2016.05.10.03.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 03:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0522-0004gG-3V
	for alex.bennee@linaro.org; Tue, 10 May 2016 06:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b051y-0004dI-Rr
	for qemu-arm@nongnu.org; Tue, 10 May 2016 06:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b051s-0000Yw-PA
	for qemu-arm@nongnu.org; Tue, 10 May 2016 06:36:45 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:36235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b051s-0000Ys-DG; Tue, 10 May 2016 06:36:40 -0400
Received: by mail-wm0-x22a.google.com with SMTP id n129so172385358wmn.1;
	Tue, 10 May 2016 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hvYmGvD5zWv6F50G6ZoNLGzVLz1qlr9ScmKqB0oTR7I=;
	b=eQDcsfAapgN2YQwCfD2E6jkLt1m2PTHaE2ZNWpkTaDnsCSCy76dAjPN95ZEuiK7+iD
	53Y1v58Vx6l6q5KURnWI73y7XP539x4Y2Oju7eDn2caLPcaF0gLWEPGVz5zLj2GALIe7
	rgruSdj+QykzsqOM/ZF62fx5MxNMf153t2WV/qAD/sabLC7ygPmiW5SAOlRRCZMA/OQF
	I+J5ldTI5u2PsImZsf+Q6SpOOa/KNIO89/Jo5Vdr9I78slN7WjCH3pbCo998O9p5f/U+
	LI5EAuscJAaMtXf5VLwlU1nFschkG2MzuBctI0t75fOENFDTGdMAd8/02vBTJJEGOh4c
	8WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hvYmGvD5zWv6F50G6ZoNLGzVLz1qlr9ScmKqB0oTR7I=;
	b=NzUFNiIX52I9SWuc4OCXrnzWCTCusK7tsJmL9Ft/XnUp0l7MqKTTL8/B+DKXgS7N/y
	DUsbl7KjFH2OC5bg3DTdP3ljb/l6GIcpS9qB3mcCsqZv1i5w3JD3JKUw8QHPzO8x0qQn
	ro597JidhrdmPRdfdO1z8dyVEc1AlcmEJ+QcD1al8LRkxxOzhg30oZ+2q8yn5NY9hGVN
	G6OuFkvcIRTelp5H8dGldDTNefY/w+lw/2JGKA44YmoLCEesfhiQt5jFXugm8OYTSM7S
	hluTM7Lhk6K+zw1SNFS+oERuC0iu5rDWP5we1rFblegYjKXHgzFL6MHRuoCRV2oyI3iF
	TERQ==
X-Gm-Message-State: AOPr4FUCtVsPUejI6xtOSnhgyHs7vmQOjfWeeYa24MU49Zfqw2bjsw8TXMQzh9zs2mecVw==
X-Received: by 10.194.136.203 with SMTP id qc11mr38743206wjb.42.1462876599292; 
	Tue, 10 May 2016 03:36:39 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id y1sm1750612wjy.36.2016.05.10.03.36.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 May 2016 03:36:38 -0700 (PDT)
Date: Tue, 10 May 2016 12:36:37 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160510103637.GH16305@toto>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
	<20160507015121.GF16305@toto>
	<CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
	<CAFEAcA9cGbU+LdZD9YzkJ8VMEyt+gKd5+8qi+Q-m+tgtNBg10w@mail.gmail.com>
	<CAKmqyKOjOwWOp-6kzOunxf0F8c8r+ua62gxFJ6x2vJR2Yaz_Nw@mail.gmail.com>
	<CAFEAcA84aHCj2ADGkuxEbdx1qy7scu+nXSTU5K70ZPXR2PL1Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA84aHCj2ADGkuxEbdx1qy7scu+nXSTU5K70ZPXR2PL1Ng@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
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
X-TUID: Fklpwg+AqRuN

On Tue, May 10, 2016 at 09:09:55AM +0100, Peter Maydell wrote:
> On 10 May 2016 at 01:16, Alistair Francis <alistair.francis@xilinx.com> wrote:
> > It is actually a u-boot problem. I originally just assumed it was a
> > Linux problem, but it happens before u-boot hands off to Linux.
> 
> OK, that makes sense. u-boot tends to be a bit lower level and less
> hardware-agnostic. I just wanted to check it wasn't caused by some
> problem in QEMU's EL3 support we could easily fix.
> 
> > It appears that u-boot won't work at all with EL3 enabled but EL2
> > disabled. It always moves to EL2 before moving to EL1 and there is no
> > code prepared to handle going from EL3 directly to EL1.
> >
> > Just for the record, I'm specifically talking about what happens in
> > the do_nonsec_virt_switch() function.
> >
> > It looks like there are three options:
> >  1. Add support to u-boot to drop from EL3 to EL1 (I'm assuming this
> > is possible, as not all implementations have EL2)
> >  2. Just wait until QEMU adds EL2 support
> >  3. Allow a QEMU command line option to start in EL1 instead of EL3

Alistair,

Our usual ZynqMP boot flow is

ATF at EL3
ATF hands over to u-boot at EL2
u-boot hands over to the Linux kernel at EL2

Our ATF has a mode where it can be instructed to start u-boot in
EL1, bypassing EL2. That would avoid this issue. You don't need to
recompile ATF. We can discuss the details off-line.


> I would be OK with any of these three from a QEMU perspective.
> Fixing u-boot is probably conceptually the nicest but I've never
> looked at u-boot internals so it could be simple or painful...
> 
> Edgar, do you have the list of what we're still missing before we
> can turn on EL2?

We're missing the Data Abort ISS:s, we're missing modelling of a few registers
(like HSTR_EL2). Some regs are quite incomplete like HCR but I think we can
live with that. GICv2 virtualization is missing. We are also missing a few
AT_ modes. AArch32 support is probably lacking alot of more stuff.

IIRC, last time this came up we talked about enabling EL2 after ISS and
GICv2 virtualization support gets merged + a few odd regs. Enough to allow
Xen and KVM to work under emulation.

Cheers,
Edgar
