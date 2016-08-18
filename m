Received: by 10.25.21.156 with SMTP id 28csp461848lfv;
        Thu, 18 Aug 2016 12:04:50 -0700 (PDT)
X-Received: by 10.237.38.35 with SMTP id z32mr4326213qtc.69.1471547090635;
        Thu, 18 Aug 2016 12:04:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 88si271592qth.150.2016.08.18.12.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 12:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baScU-00039W-1o
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 15:04:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1baScE-00031s-L9
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 15:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1baSc8-0006Aj-Vn
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 15:04:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1baSc8-0006AD-Np; Thu, 18 Aug 2016 15:04:28 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45F013B3C2;
	Thu, 18 Aug 2016 19:04:27 +0000 (UTC)
Received: from work-vm (ovpn-116-93.ams2.redhat.com [10.36.116.93])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7IJ4NMQ030212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Aug 2016 15:04:25 -0400
Date: Thu, 18 Aug 2016 20:04:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160818190421.GE2009@work-vm>
References: <20160818140014.qhbctpmlg6umqkvm@kamzik.localdomain>
	<CAFEAcA9oAi5++H0eYiE-SyHMtLFmD5haw+d0DsN+MLo29f9U_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9oAi5++H0eYiE-SyHMtLFmD5haw+d0DsN+MLo29f9U_A@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 Aug 2016 19:04:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] hw/arm/virt: vmstate-static-checker.py results
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
Cc: Andrew Jones <drjones@redhat.com>, marcin.krzeminski@nokia.com,
	QEMU Developers <qemu-devel@nongnu.org>,
	alistair.francis@xilinx.com, qemu-arm <qemu-arm@nongnu.org>,
	Amit Shah <amit.shah@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U+iyExcKJIH9

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On 18 August 2016 at 15:00, Andrew Jones <drjones@redhat.com> wrote:
> > We've recently started versioning mach-virt, v2.6 was the first versioned
> > release. As an effort to try and make sure we're doing things right, I
> > tried the vmstate-static-checker.py script. I compared a 2.6 machine
> > from a QEMU built from the v2.6.0 tag with a 2.6 machine from a QEMU
> > built from today's latest pull (5844365fe8). I see lots of errors. I have
> > no experience in this area, so I can't even state whether they're truly
> > a concern or not. I can say a few things;
> >
> >  1) Most of the errors look like the same problem. Something is wrong
> >     with xilinx_spi state, which shows up everywhere. Here's an example
> >
> > Section "en25q64", Description "xilinx_spi": expected field "nonvolatile_cfg", got "cur_addr"; skipping rest
> 
> Well, something here is weird, because en25q64 and nonvolatile_cfg
> aren't part of xilinx_spi at all, they're in hw/block/m25p80.c.

Hmm, except there are two separate things with the name "xilinx_spi";
     vmstate_xilinx_spi in hw/ssi/xilinx_spi.c
which is the state for the "xlnx.xps-spi" (aka TYPE_XILINX_SPI) object.

and for added confusion:
      vmstate_m25p80 in hw/block/m25p80.c
which is the state for the "m25p80-generic" (aka TYPE_M25P80) object.
     also calls itself "xilinx_spi".

These went in a pair of Peter Crosthwaite commits at about the same time 4.5 years
ago; I'm guessing it was just a copy-paste.

I think my preference would be to update the name for the m25p80 so it's
not got the clash; but it seems m25p80 contains definitions of about a zillion
flash devices all derived from the m25p80, so I think I'd have to try one of
them to see if the xilinx_spi name finds it's way onto the migration stream;
I suspect it doesn't.

Dave

> However we don't care about migration compatibility in the Xilinx
> boards at all, so the simple fix is just not to try to test them.
> Similarly, aspeed and imx are boards where we're not trying to
> preserve migration compat.
> 
> >  2) Several of the remaining problems are also present on a check of the
> >     x86_64 pc-i440fx-2.6 machine type. To be precise
> >
> > Section "am53c974", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> > Section "dc390", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> > Section "e1000-82544gc", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> > Section "e1000-82545em", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> > Section "e1000", Description "e1000": expected field "tx.ipcss", got "tx.props.ipcss"; skipping rest
> > Section "esp", Description "esp": expected field "cmdlen", got "cmdbuf"; skipping rest
> > Section "rtl8139", Description "rtl8139": expected field "tally_counters", got "tally_counters.TxOk"; skipping rest
> 
> Looking at just the e1000 for an example, this is a false positive
> in your checker. In commit 093454e2 the struct we're putting the
> ipcss/ipcso/etc fields was moved, so:
> 
> -        VMSTATE_UINT8(tx.ipcss, E1000State),
> -        VMSTATE_UINT8(tx.ipcso, E1000State),
> -        VMSTATE_UINT16(tx.ipcse, E1000State),
> -        VMSTATE_UINT8(tx.tucss, E1000State),
> -        VMSTATE_UINT8(tx.tucso, E1000State),
> -        VMSTATE_UINT16(tx.tucse, E1000State),
> -        VMSTATE_UINT32(tx.paylen, E1000State),
> -        VMSTATE_UINT8(tx.hdr_len, E1000State),
> -        VMSTATE_UINT16(tx.mss, E1000State),
> +        VMSTATE_UINT8(tx.props.ipcss, E1000State),
> +        VMSTATE_UINT8(tx.props.ipcso, E1000State),
> +        VMSTATE_UINT16(tx.props.ipcse, E1000State),
> +        VMSTATE_UINT8(tx.props.tucss, E1000State),
> +        VMSTATE_UINT8(tx.props.tucso, E1000State),
> +        VMSTATE_UINT16(tx.props.tucse, E1000State),
> +        VMSTATE_UINT32(tx.props.paylen, E1000State),
> +        VMSTATE_UINT8(tx.props.hdr_len, E1000State),
> +        VMSTATE_UINT16(tx.props.mss, E1000State),
> 
> but the on-the-wire format doesn't include the names of the C struct
> fields so this isn't a migration break.
> 
> >     x86 only has three additional messages, which look harmless to me
> >
> > Section "apic-common" does not exist in dest
> > Section "apic" does not exist in dest
> > Section "kvm-apic" does not exist in dest
> >
> >  3) I analyzed one error I saw, and see it should be fine, as the device
> >     simply went from unmigratable to migratable (for TCG anyway)
> >
> > Section "arm-gicv3-common" Section "arm-gicv3-common" Description "arm_gicv3": minimum version error: 0 < 1
> 
> Yep, that should be fine.
> 
> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
