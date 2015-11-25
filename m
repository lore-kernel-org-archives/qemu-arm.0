Received: by 10.182.158.201 with SMTP id ww9csp2512626obb;
        Tue, 24 Nov 2015 22:04:30 -0800 (PST)
X-Received: by 10.31.52.68 with SMTP id b65mr31737842vka.150.1448431470664;
        Tue, 24 Nov 2015 22:04:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si22150871vke.6.2015.11.24.22.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 22:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1TBu-0000c9-DK
	for alex.bennee@linaro.org; Wed, 25 Nov 2015 01:04:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a1TBZ-0000Jt-Jc
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 01:04:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a1TBY-0005kh-6t
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 01:04:09 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:34225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a1TBX-0005kN-Ue; Wed, 25 Nov 2015 01:04:08 -0500
Received: by wmvv187 with SMTP id v187so240853883wmv.1;
	Tue, 24 Nov 2015 22:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=rOfuSkY4zBO/MjZSaCsexZoo3zh92fF9OZzLQWIrH88=;
	b=u9AdNT5E49fJtrhm0KUwQvGwj0K/XjK6Co7HRQc+Irh21nrZWXoDPQtCPUoZ413Ctv
	UK7o2zeh/ozGksZnAY6pCBAIG7LbHOnFMT9tZ5aYJYdILJESDtEs8SUpgkIPp7RADvVC
	xgZgYaLZlcDcTdsDETjJRHiLeDGVps7FjxKpaNJJA5qg4zY3wlYTIgLTMToyZh5988SN
	1dfXwT/bjPjNsJA/gekfvbZPAEsnhr2P+jEOZVBBXeAHnavVlS6pe2gPoxWS6qeD5uZA
	o6XEt/oqfV8lvI7qpdR0X3ScOBONHTZNtuG27usC1cL/PhoXeHylDwlJhASQ+NGeF5TK
	RoMA==
MIME-Version: 1.0
X-Received: by 10.194.114.105 with SMTP id jf9mr39994926wjb.102.1448431447308; 
	Tue, 24 Nov 2015 22:04:07 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Tue, 24 Nov 2015 22:04:07 -0800 (PST)
In-Reply-To: <BY2PR0301MB20409F279E0D56AA4DCDCC1F9E050@BY2PR0301MB2040.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pv1CdRojAz5v9xiy=f2WYGOPP1xTCFJJQD6dbqGaYGuA@mail.gmail.com>
	<BY2PR0301MB20409F279E0D56AA4DCDCC1F9E050@BY2PR0301MB2040.namprd03.prod.outlook.com>
Date: Tue, 24 Nov 2015 22:04:07 -0800
Message-ID: <CAPokK=p6yG3JHPR0zcd14xTAE-JNk9ezVSr5hriX9xWpiOaV5A@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::232
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?UTF-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3nj3qkmRdpgV

On Tue, Nov 24, 2015 at 4:00 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi Peter (et al),
>
> I am working on refactoring the Pi support code as you suggested. I have =
split the Pi SOCs into separate objects (bcm2835 and bcm2836) which both in=
stantiate a third common bcm2835_peripherals device that in turn contains a=
ll the common devices. I have also switched the code to use object properti=
es rather than global variables to communicate state where devices interact=
 with each other.
>

Should this be an inheritance of a common SoC rather than an
instantiation of a common container?

> Before I go further, I wanted to ask a couple of high-level questions abo=
ut the desired code style for new devices.
>
> 1. Must every new device have a header file that declares its private sta=
te struct, or is it ok to keep those in the C file for leaf devices and ref=
er to them through opaque pointers?

Headers. The idea is every device state is inline embed-able in a
container objects struct (requiring the header). The plan was to have
some checking mechanisms to ensure private fields remain private
implementing C file.

> 2. What's the status of the sysbus API? It is obviously a fairly thin lay=
er over qdev/qom, but it's not clear whether the APIs are deprecated. Can n=
ew code instantiate children of TYPE_SYS_BUS_DEVICE and use the irq/mmio ex=
port features it provides, or should we be sticking only to lower-level (qd=
ev?) APIs? If so, what's the right way to export interrupts and mmio space =
from a device?

Sysbus is fine to subclass and use for both MMIO and IRQs. Use of
sysbus IRQs should be limited to genuine interrupts. If there are
other GPIOs going around between peripherals, then named GPIOs are the
go. You can use unnamed GPIOs if there is a single homogenous set of
GPIOs (this is common for the input to interrupt controllers) but
anything more complex should go the named GPIOs.

> 3. Similarly, is using SysBusDeviceClass.init ok, or should we be using D=
eviceClass.realize?

That part of sysbus is deprecated. Use .realize and the instance_init.

>In general, what's the guidance on what belongs in object init vs. the rea=
lize method?

If it doesn't depend on property values, it goes in init. If it does
realize. Top level connectivity (e.g. connecting to UARTs are initing
drives) generally are realize.

> 4. I have some property values (e.g. video ram size) that are set in the =
top-level machine definition code (raspi.c), and need to pass down through =
several layers of abstraction (e.g. raspi.c declares the machine class whic=
h instantiates a bcm2836 object which in turn instantiates bcm2835_peripher=
als, which in turn instantiates bcm2835_fb).
> Defining properties at each level just to pass these along is painful/fra=
gile. Is there a programmatic way to have properties that are defined globa=
lly and passed through, roughly equivalent to -global on the command line?

Yes. Alias properties. The SoC can alias a property of an IP. I had
patches on list to implement overloaded aliases if you are interested
in wrangling multiple properties together on the container level.

https://lists.nongnu.org/archive/html/qemu-devel/2015-06/msg03624.ht

>Is it acceptable to use that?
>
> Forgive me if there is documentation/guidance on this stuff already -- I =
didn't manage to find very much.
>

Not much! These are good questions.

Regards,
Peter

> If anyone wants to take a look, my working tree is at:
> https://github.com/0xabu/qemu/tree/raspi
>
> The relevant files are:
>  hw/arm/bcm2835.c                     |   92 +++
>  hw/arm/bcm2835_peripherals.c         |  368 ++++++++++++
>  hw/arm/bcm2836.c                     |  149 +++++
>  hw/arm/raspi.c                       |  228 ++++++++
>  hw/char/bcm2835_aux.c                |  250 ++++++++
>  hw/display/bcm2835_fb.c              |  427 ++++++++++++++
>  hw/dma/bcm2835_dma.c                 |  366 ++++++++++++
>  hw/intc/bcm2835_ic.c                 |  248 ++++++++
>  hw/intc/bcm2836_control.c            |  373 ++++++++++++
>  hw/misc/bcm2835_mphi.c               |  176 ++++++
>  hw/misc/bcm2835_power.c              |  113 ++++
>  hw/misc/bcm2835_property.c           |  417 +++++++++++++
>  hw/misc/bcm2835_sbm.c                |  310 ++++++++++
>  hw/misc/bcm2835_vchiq.c              |  114 ++++
>  hw/sd/bcm2835_emmc.c                 |  844 +++++++++++++++++++++++++++
>  hw/timer/arm_timer.c                 |   39 ++
>  hw/timer/bcm2835_st.c                |  201 +++++++
>  hw/timer/bcm2835_timer.c             |  242 ++++++++
>  hw/usb/bcm2835_usb.c                 |  655 +++++++++++++++++++++
>  hw/usb/bcm2835_usb_regs.h            | 1061 ++++++++++++++++++++++++++++=
++++++
>  include/hw/arm/bcm2835.h             |   31 +
>  include/hw/arm/bcm2835_arm_control.h |  481 +++++++++++++++
>  include/hw/arm/bcm2835_mbox.h        |   14 +
>  include/hw/arm/bcm2835_peripherals.h |   35 ++
>  include/hw/arm/bcm2836.h             |   34 ++
>  include/hw/arm/raspi_platform.h      |  160 +++++
>  include/hw/display/bcm2835_fb.h      |   29 +
>
> Thanks,
> Andrew
