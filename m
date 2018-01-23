Received: by 10.28.71.27 with SMTP id u27csp3952160wma;
        Tue, 23 Jan 2018 03:50:14 -0800 (PST)
X-Google-Smtp-Source: AH8x227wwe0Fj9Khv52k/QxGeOxgmHdsY42+yqCpG4gn7Ip1dQsOqTJwAb3q/nt9lqImSi1pw/z8
X-Received: by 10.13.240.5 with SMTP id z5mr2066646ywe.344.1516708214010;
        Tue, 23 Jan 2018 03:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516708214; cv=none;
        d=google.com; s=arc-20160816;
        b=mhW6g966119Do4p9mZ33f0fY+k/a1gKMTPBhM5OAKk7P8vgAoobWFIkxnMRxQYpn2e
         noZQsk6zFHaWf+weF/mCmm071cAyLRQVTzgce6VbCnr/SYQbqjYM4EsPL7JQa2PySke6
         p9Gtd0u4mxrtxrKfw33xV8EcRJhIDhf9qf9+yrlIQ7ImqOqeWcbf8qZnMJLzI+ttZo36
         WbVbyz/1Ho9PkqfGpwDbWlFRHLaIyDGV+o39bLvAiIbmDEtz2GkOkpywngYxPSkx8NRJ
         3YhFQ2tJ7D5qc8xd2YuRcyoGNxV9dPjvMIMq2ZkeWrTlz30DGUHUIvlLWE3s8+9JZ3n2
         i06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wBxsXuNstNnrBdZgr+91sroibZGv5kFgttgQ5WdF8CU=;
        b=UDgU7YclwM+O2gr+qEnHf3sZTY9m7jKS3QmbR/+HmnHyzEFZjxVmqN+sV0baNQrd9Q
         cEhdyfXpgbYMagClaUj2dA64nYcABT1J0jgxZBFtqO+G3Ll3FpSL34VhGl6mo1srSNgP
         vVQdjNhzxbV0JLpb1E4BDxL/UDG1RlQPAr2lH/vzUccsSezo48sFuXqzRaqNNLrpMwMZ
         6boXB4CS7BXx2pCHC8dO8Z0ITD89EFj4oQ+gIo/Bf3exrd0S92vIhthD/y8U5SBv+wHr
         tPwMINicN+6A7I+pJ2Ctp3OoNXamBNmoTdtyjvsq0rMsHbxya1J2PHChLjX9/8k/RpVZ
         5Fmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=nNLZZK4x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h2si505361ywm.148.2018.01.23.03.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 03:50:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=nNLZZK4x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edx5h-0001dZ-Gd
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 06:50:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1edx4g-0001J0-NE
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 06:49:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1edx4e-000064-IE
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 06:49:10 -0500
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:41609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1edx4e-00004s-8h; Tue, 23 Jan 2018 06:49:08 -0500
Received: by mail-pf0-x22c.google.com with SMTP id c6so122550pfi.8;
	Tue, 23 Jan 2018 03:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EBNysyA3SYvnrXbzO1mySMsZP6BOopXkrNPeWezrzXM=;
	b=nNLZZK4xxvOSss6lBXiTi2T6t9VDSi2yNFkDdkbyIaG0tbzEHxv8mNo35/8iyE92zh
	J3PZEBQzwCp1SsW/xhzx0qUB4CwyDnx9DHidG1crOP+5DvRve0BY/ncEd4txDxbSovRQ
	Oad38K90xLByL90eHpP1i3fQpYYrCKuBrYz58ul14tT9CezAD+nO4Nx7333mUT56nsXx
	svnUMJJHSOXCgAGYn1VlKt5e6GgBhk9RI3ZdpiLo0elk4kZPxW32BClG8U2GIIfKXYkn
	hCsnJGLvmRcG89wPkhBODTQ4HcYC9usbOZ+kD2gZTWxFLx1mzOiJMyTuwZqVaHH5J+YE
	xUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EBNysyA3SYvnrXbzO1mySMsZP6BOopXkrNPeWezrzXM=;
	b=W6FT5s8L+UjRYufsQXQgBOhaXt/GAGGY9gErsuPmdg4+qkXR5MMnuFoag2fEoumrf3
	+1II06Z6f8dwIuRtyw2/Dnf5rRDvCz/sOx8rvDtnyLtYyKdvyLVEQuEt0inSsfwpqHmQ
	9wumwVB0K8MgLCc8LSamh6Eac51DYa41iRjGWnhg++8R2IzGoS6cPE0kprs/qzOc65gE
	4vDhf9tbsIzkllmkvO/zpckCWG8dz9Fq85RKTJLWwXe5Y4seyLgNiFpInw3YnyQ8OWZe
	UPVyu0iWbUCHLSrrq4A8zs7eeCVKUV48g3BBaRkTF9JTVcd6x2c+wXCOFQn4+dBkL2x/
	J+bQ==
X-Gm-Message-State: AKwxytcXksIRp2ilVKWWax1uugZFUtV+PTZhrh6FkauQMMcp0cJdHovP
	fG6JqdKagPvhVWm3Oga9cLRNJEDvnGtA1vgtWcM=
X-Received: by 10.101.64.196 with SMTP id u4mr8560926pgp.336.1516708146800;
	Tue, 23 Jan 2018 03:49:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.163.101 with HTTP; Tue, 23 Jan 2018 03:49:06 -0800 (PST)
In-Reply-To: <CAFEAcA--i8RVKaBw5yXn4xRXBy5S+Yk=WDNKbuqzfDxn6jjtOA@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
	<MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
	<CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
	<CAFEAcA--i8RVKaBw5yXn4xRXBy5S+Yk=WDNKbuqzfDxn6jjtOA@mail.gmail.com>
From: bzt bzt <bztemail@gmail.com>
Date: Tue, 23 Jan 2018 12:49:06 +0100
Message-ID: <CADYoBw36gPOyiK36WaS0v_2R=iuWYL-sQAtffrZZJU2DpMv5Bw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22c
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+DBE8EgQueq

Hi,

On Mon, Jan 22, 2018 at 1:12 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 18 January 2018 at 21:39, bzt bzt <bztemail@gmail.com> wrote:
> > Dear All,
> >
> > Since you still haven't merged Alistair's patch, I decided to include it
> in
> > my own.
> > I've shrinked the number of modified files to two, that's the bare
> minimum
> > to support "-M raspi3" switch. Bcm2836.c modified minimally, the rest is
> in
> > raspi.c. I've renamed raspi2_init() to raspi_init() 'cos now it
> initializes
> > raspi3 as well, no additional function.
> >
>
> Can you send this as a proper patch email, not as a reply to
> an existing email thread, please? (This makes our automated tooling
> much happier.)
>

Only if you're not demanding any further nonsense modifications.


>
> In particular we can't apply patches if they don't come with
> the right Signed-off-by: lines from everybody who contributed
> code to them.
>
> I've made some code review comments below.
>
> > diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> > index 8c43291112..5119e00051 100644
> > --- a/hw/arm/bcm2836.c
> > +++ b/hw/arm/bcm2836.c
> > @@ -15,6 +15,7 @@
> >  #include "hw/arm/bcm2836.h"
> >  #include "hw/arm/raspi_platform.h"
> >  #include "hw/sysbus.h"
> > +#include "hw/boards.h"
> >  #include "exec/address-spaces.h"
> >
> >  /* Peripheral base address seen by the CPU */
> > @@ -30,7 +31,7 @@ static void bcm2836_init(Object *obj)
> >
> >      for (n = 0; n < BCM2836_NCPUS; n++) {
> >          object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> > -                          "cortex-a15-" TYPE_ARM_CPU);
> > +                          current_machine->cpu_type);
>
> This SoC code shouldn't be looking at the current_machine settings.
> It should have a QOM property that specifies the cpu type, and

the raspi.c code should set that property. (Call the property
>
'cpu-type' -- if you grep in hw/arm for that string you'll find
> some examples of existing devices/boards that do this.)
>

I'll give you some time to think about why it is nonsense that you asking
for.
Hint: you cannot add properties to an uninitialized object, you can't add
the CPUs in the realize phase (will cause segfaults, I've tried) and SoC
initialization will do call bcm2836_init().

  [...]

> There should be more spaces in this : "version == 3 ? ...".
> If you run your patch through scripts/checkpatch.pl it should
> help with this kind of style nit (though it doesn't always find
> everything and sometimes it gets confused, so it's not always right).
>

Sure thing.


> [...]
> This will get confused if the user passes a -cpu argument. Instead
> we should just have the machine type directly determine the version.
> There are several ways to do this, but the simplest way is to have
> raspi2_machine_init() set mc->init to raspi2_init() and
> raspi3_machine_init()
> set mc->niit to raspi3_init(), and thenthose function calls
> raspi_init(machine, 2) or raspi_init(machine, 3).
>

Auch. Originally there were two raspi_init() functions (with two different
version values), I've reduced the number to one because you asked for it.
I've also tried to access the MachineClass object from raspi_init(), but
it's impossible, MACHINE_CLASS() drops and assert, find_machine_class()
segfaults. Nice model interface you have there.


>
> (The other approach would be to make the board set up a subclass
> of MachineState and then have raspi2 and raspi3 be subclasses of
> that, which gives you a place to define raspi-specific data fields
> like "version". You can see that approach in hw/arm/vexpress.c. But
> that seems like a lot of effort to go to given where we've started,
> so I don't really recommend it.)
>

Again, that is EXACTLY what I originally had, and you (the maintainers)
said there shouldn't be a new BCM2837 class, so I've removed it.
Look, if you can't understand how my patch works, just say so, no shame in
that.


> [...]
>
> I don't want to add new machine types which set the
> ignore_memory_transaction_failures flag to true -- this is
> only for existing board models where we don't know what
> guest code that used to run would break when the flag was
> flipped. For new boards we know that no code runs on them
> so can leave the flag at its correct default.
>

Just copy'n'pasted raspi2, only modified the CPU model in which they differ.


>
> This may mean that you need to add some extra dummy
> devices to the the SoC model using
> create_unimplemented_device() so that your guest image
> doesn't crash trying to probe those devices.
>

This may mean your users will be very upset because mainline qemu won't
emulate raspi3 in the foreseeable future, because it's sure like hell I
won't fix something that's not broken.


>
> I appreciate that this is a bit annoying for a case like this
> where it's adding a new variant of an existing SoC, but
> this is one of the situations where the only practical
> opportunity to get the implementation right without breaking
> existing QEMU users is at the point where we add the new
> board model.
>

It is not annoying at all, it's simply silly. Are you really thought I
would do *your* job?
"Only two things are infinite, the universe and the human stupidity, and
I'm not sure about the former!". Actually I'm very entertained :-D :-D :-D

But seriously, I've showed you a way how to add raspi3, the rest is up to
you. I won't do anything more about it, I'm not a paid qemu maintainer
whatsoever!
Again, my patch is working for me, it does not broke any existing raspi2
machines, and I'm very happy about using it for more than half a year now!
These are the facts, everything else is just talking.

Cheers
bzt


> thanks
> -- PMM
>
