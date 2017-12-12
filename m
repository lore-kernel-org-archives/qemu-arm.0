Received: by 10.223.159.74 with SMTP id f10csp3876378wrg;
        Tue, 12 Dec 2017 06:20:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBouYx0DWC6MuydzvNggPn9rZsqbbbvAVrHHWRJuu6vkZU1fYfkZ29DL6yMx8mCiFJB6wSHov
X-Received: by 10.129.231.1 with SMTP id x1mr2964445ywl.83.1513088453511;
        Tue, 12 Dec 2017 06:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513088453; cv=none;
        d=google.com; s=arc-20160816;
        b=sxiY0CvqrXxwKuy6MZKIVQxOMbExULyNS5vJdieZji+QfFco/+Pfpk8Wcjpgerq7RB
         2DpyniQaVrEXcjBVfnaRkZb2TWIrwOt7NGPzdfg0gL73Ycz9X2IFikKZ0mBgfd99JsJt
         rB+DaD0gU3/Xeio6dmr73edSrM7/+lxDYZYp8SR8L9XV6vQQPWGCqEBHQjf28hx6R/hR
         OYUu8aUfh1XcC0UK3TiHKbTZX6+bXLtdoofzwXUzwn4JRW3Uc/rzkn93puoTXUnszvRj
         dCLVQ0M0EXVVIMU9J1ljtd2XLo9bvQo38FYG9UXsn7Nc5QK0I6LU89PwtZt8OlQSR7hh
         b8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=msby4gC8Lmcl2h0UTu2wjCZT1NyyDsH3u3DIYCWVbLA=;
        b=wKdSKYpjLpQLhnWWzx/MzTSSQtS7aSOtkTU8yVmLFjir3YNzTVqxIqSxelRkjPRaiU
         4dpF9bSUSAeP0QCXqiNPSjsAHi9RcbtTwIdys0DmMny6d5mHbXahN1qEnirREdhEaJxA
         hW/sPGi1epH8ApOMPv7qI7jT8NViDtCKl9qvCDnKY93sKeR8vLWxECpIJdIrOCEm3Hb+
         ffANfLU74QRtc3E4bK55Qwt8d0+LlE9iclhbgXolITquTLXXEUhxcovxIDs0UBvAAkwP
         tyNt55aSy/+GzYCroX+9XIdqnAu+hzwTN9eukY6XusktIh6oHTNDlJZ8Y7MmDyN1EFtl
         WVLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1si789836ywa.393.2017.12.12.06.20.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:20:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlQS-0004ax-Pv
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:20:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOlOa-0003WF-N1
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:18:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOlOS-00081O-9q
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:18:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48462)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eOlOH-0007ov-AT; Tue, 12 Dec 2017 09:18:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A410C04AC47;
	Tue, 12 Dec 2017 14:18:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB9B5620BC;
	Tue, 12 Dec 2017 14:18:34 +0000 (UTC)
Date: Tue, 12 Dec 2017 15:18:32 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20171212141832.gsvlcm77cxg7zbhc@kamzik.brq.redhat.com>
References: <ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
	<d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
	<CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Dec 2017 14:18:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add second
 UART to ACPI tables
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PR+1Eh++eljf

On Tue, Dec 12, 2017 at 01:56:44PM +0000, Ard Biesheuvel wrote:
> On 12 December 2017 at 13:28, Laszlo Ersek <lersek@redhat.com> wrote:
> > On 12/12/17 13:47, Peter Maydell wrote:
> >> On 12 December 2017 at 12:41, Laszlo Ersek <lersek@redhat.com> wrote:
> >>> I agree. There's one user-visible complication: while with one UART,
> >>> it's not possible to mix things up, with two UARTs, users will
> >>> inevitably want to assign inverse roles to them, relative to what QEMU /
> >>> the firmware assigns originally.
> >>>
> >>> E.g. if one PL011 is redirected to a regular file (debug messages) and
> >>> the other one to stdio (console), there will be complaints that "I
> >>> wanted it the other way around". The redirection happens on the backend
> >>> (chardev) level, but the firmware won't see the difference on the
> >>> frontend (PL011) level.
> >>>
> >>> Is it possible to add a new property to the UART nodes in the DTB, like
> >>> "purpose"?
> >>
> >> This is what the "chosen" stdout-path node in the DTB is for,
> >> but you said you didn't want to look at that :-) (it means
> >> "device to be used for boot console output".)
> >
> > :(
> >
> > Ard is right that we really shouldn't do that kind of parsing magic in
> > very early UEFI stuff.
> >
> >
> >>> Or can we make a virt-arm policy that "first -serial is always ...,
> >>> second -serial is always ..."?
> >>
> >> Well, the first -serial will always be the 0x09000000 one
> >> that we have today, and the second -serial will be the other
> >> one (unless you have -machine secure=yes, in which case
> >> second -serial is the secure-only UART and third -serial is
> >> the second NS UART).
> >>
> >> Is this any different to the x86 case, where there are two
> >> UARTs at different IO port/IRQ locations?
> >
> > OVMF (x86) uses two distinct devices for the two purposes discussed.
> >
> > * It uses the "debug console device" for debug message output, at
> > hard-coded IO port 0x402; so if you'd like to capture those messages,
> > then you have to add:
> >
> >   -chardev file,id=debugfile,path=debug.log \
> >   -device isa-debugcon,iobase=0x402,chardev=debugfile \
> >
> > (or the more traditional
> >
> >   -debugcon file:debug.log \
> >   -global isa-debugcon.iobase=0x402 \
> > )
> >
> > * For console I/O, it uses the first serial port. (I think I have once
> > investigated what it takes to use other serial ports for console I/O --
> > I'm no longer sure if "it happens to be impossible in OVMF", or just
> > "nobody ever does that".)
> >
> >
> > The important distinction (on the UEFI level anyway) is that the debug
> > messages need to go to a super dumb device, while console I/O can use a
> > much higher-level serial IO abstraction ("protocol").
> >
> >
> >> I think the only thing users really expect is that if you're
> >> using just the one serial port for anything then it's the
> >> first one.
> >
> > You are right -- we've never had two (non-secure) UARTs on virt-arm, so
> > we can invent whatever assignment, as long as:
> >
> > - the single UART case doesn't break (keeps receiving both debug output
> > and console IO),
> >
> > - whatever we invent for the two UARTs case now, it remains consistent
> > over time. I think this implies we can rely on the FDT node ordering in
> > the firmware (if we want to use the 2nd UART at all, that is), and then
> > QEMU shouldn't change the serial_hds[] <-> FDT node mapping in the
> > future, in machvirt_init() and the callees thereof.
> >
> 
> Given that the DEBUG output is only produced on DEBUG builds, couldn't
> we simply stipulate that DEBUG output appears on the PL011 with the
> lowest physical address? That keeps the current status quo, and is
> probably sufficient for 99% of the use cases of people using the DEBUG
> builds.

I was thinking that if AAVMF learned to use a second UART for debug
output, that the debug builds could go away, as they have for x86 (IIUC).
If a user wires up a second UART, then AAVMF could unconditionally
output debug messages to it. Not wiring it up would lose the messages,
which is no different than the non-verbose build we have today. It
would be nice if could tell AAVMF not to use a second UART for debug
messages too, though, as the debug messages make AAVMF quite slow, and
the user may want to provide the guest a second UART.

> 
> Then, we can introduce some code to decode stdout-path in FdtClientDxe
> (a higher level DT parsing driver) so that the actual serial console
> gets installed onto whichever UART is described as the system console.
> Also, given that ArmVirtQemu is tightly coupled to QEMU/mach-virt, we
> could decide to only use node names in stdout-path (as we do
> currently) to simplify the parsing logic.
>

That sounds reasonable and would only require adding a comment above
the setting of stdout-path in the QEMU code to formalize it.

Thanks,
drew
