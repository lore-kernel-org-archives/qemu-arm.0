Received: by 10.25.0.144 with SMTP id 138csp104274lfa;
        Sat, 8 Apr 2017 00:08:05 -0700 (PDT)
X-Received: by 10.200.56.24 with SMTP id q24mr43698659qtb.234.1491635285317;
        Sat, 08 Apr 2017 00:08:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d40si7612563qtb.226.2017.04.08.00.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 08 Apr 2017 00:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cwkTc-0005eV-Oy
	for alex.bennee@linaro.org; Sat, 08 Apr 2017 03:08:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <omar.rizwan@gmail.com>) id 1cwjch-0001EJ-MS
	for qemu-arm@nongnu.org; Sat, 08 Apr 2017 02:13:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <omar.rizwan@gmail.com>) id 1cwjcg-0000oh-HM
	for qemu-arm@nongnu.org; Sat, 08 Apr 2017 02:13:23 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:35698)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <omar.rizwan@gmail.com>)
	id 1cwjce-0000nu-6s; Sat, 08 Apr 2017 02:13:20 -0400
Received: by mail-qt0-x230.google.com with SMTP id n46so792468qta.2;
	Fri, 07 Apr 2017 23:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rDhUIyaZvIFFLaMg4Gh6Xd5v+DIjrqlhxsNzWJC3/hs=;
	b=SMSMm4fPy0LbhLRYbx9Ckz1a6umFUJffppE34NNmgymo7Hu4qoxfSQiwdaXj1BRfh/
	PtBcqb7K7mU/2jp3UlGSrR+7gqCzZ5C+nnosiXcMQikK5Omy1dpljtxyquRYTzzEz/oh
	nX2++ZqNHC7/1CeANom7Tztp/wALZeajks6Ll8l01sPBcbvOsjk2F9r2X9m32xiGWLbd
	cxBwiiw/7iBUMpDJhYOhIQliGBv3z4Wv4Te/wlOxd7iHijqEGwxJ+A3Pdh9nySpmtng0
	CPEM/w3RhUAb4SPfIORASIZWO4HS/nfKv6lotwLUtIZ9LJwZ3Kv5Qg66aU/MY33o5gIv
	WO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rDhUIyaZvIFFLaMg4Gh6Xd5v+DIjrqlhxsNzWJC3/hs=;
	b=XFNoXo9qQL2NxPuHCapV/MbbUZkt9sbyQKVwrhqrC2d/bfPXVQg9lZkbwp3Jn78aM5
	KvON//tjz7dhzO+vQNdYRxDjI1KsJH9IQh4jVMoy8V7q6JSq0WzVOQEr5mFYyG9FFMjq
	+RLx8QSbPwPxA9tB7wEZqfDUvJTTBaDWuy/wGTbfrjk+tyhgHVjf0vxvdkKf5s2SWFIr
	IZF8r5VtovTiOFChTQxMcxPnbPNWI3g3pC46iI8cqu9LmwhekOXVt9TECONyCy3Bj8vj
	ng1+y5x3WSgypbMI05UCJOeSrwlE/VI+LsBqHOxV3GRXMlJV8iVhDszeO+v2nioje56i
	RfnQ==
X-Gm-Message-State: AFeK/H2Jzi5hOGQNi0tM1DR0KPVp8hWExA73j9FOqfmIAZX13DnwxGzkqUo+4ZKKPpF+4d4MGhzas8gD46zAyQ==
X-Received: by 10.200.1.6 with SMTP id e6mr42534421qtg.21.1491631999423; Fri,
	07 Apr 2017 23:13:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.60.239 with HTTP; Fri, 7 Apr 2017 23:13:18 -0700 (PDT)
In-Reply-To: <DM2PR21MB00601A5A86C3F935CCCBAC0D9E0F0@DM2PR21MB0060.namprd21.prod.outlook.com>
References: <20170408054318.19830-1-omar.rizwan@gmail.com>
	<DM2PR21MB00601A5A86C3F935CCCBAC0D9E0F0@DM2PR21MB0060.namprd21.prod.outlook.com>
From: Omar Rizwan <omar.rizwan@gmail.com>
Date: Fri, 7 Apr 2017 23:13:18 -0700
Message-ID: <CAJ=RBN+VF1ysQ39NELKY7dK75aMGcB-iDDGy_sFooC6pTf1rBw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
X-Mailman-Approved-At: Sat, 08 Apr 2017 03:07:59 -0400
Subject: Re: [Qemu-arm] [PATCH] raspi: Add Raspberry Pi 1 support
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jr/3st2Ftzqq

Hi Andrew --

On Fri, Apr 7, 2017 at 10:57 PM Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>
> Hi Omar,
>
> > From: Omar Rizwan [mailto:omar.rizwan@gmail.com]
> > Sent: Friday, 7 April 2017 22:43
>
> Did you do any testing of this? One of the reasons I never got around to =
upstreaming this was that I couldn't get Raspbian working reliably (there w=
as some problem with stalled DMA reads from the MMC controller), and I didn=
't have the cycles to debug it further. Also, IIRC Raspbian on pi1 depended=
 on the system timer devices, so it might not make sense to have this board=
-level support without adding that first.


I did test Raspbian on the raspi machine and maybe encountered the
same issue you did (or, more likely, a systimer related issue);
it would just hang in a loop with program counter at 0xC000A000.

But my use for this is bare-metal code, which works OK.
(Is there some standard that the machine should run Linux before
getting upstreamed?)

I'd like to upstream the system timer next, anyway.

>
> > --- a/hw/arm/bcm2835_peripherals.c
> > +++ b/hw/arm/bcm2835_peripherals.c
> > @@ -34,6 +34,7 @@ static void bcm2835_peripherals_init(Object *obj)
> >      /* Internal memory region for peripheral bus addresses (not export=
ed) */
> >      memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1=
 <<
> > 32);
> >      object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr),
> > NULL);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->gpu_bus_mr);
> >
> >      /* Internal memory region for request/response communication with
> >       * mailbox-addressable peripherals (not exported)
>
> This line looks like it might have snuck in by accident?


Do you recall why that line was removed? bcm2835_realize fails without
it, because the second sysbus_mmio_map_overlap call

sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 1,
                            0x40000000, 1);

fails this assertion in sysbus.c, in sysbus_mmio_map_common:

assert(n >=3D 0 && n < dev->num_mmio);

I can't easily find documentation for that 0x40000000 memory mapping,
which I figured I'd keep in; should it just be removed from bcm2835?
Am I misunderstanding something?

>
>
> Andrew


thanks,
Omar
