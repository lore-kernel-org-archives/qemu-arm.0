Received: by 10.182.158.201 with SMTP id ww9csp162130obb;
        Wed, 6 Jan 2016 12:05:51 -0800 (PST)
X-Received: by 10.55.71.82 with SMTP id u79mr133872793qka.55.1452110751571;
        Wed, 06 Jan 2016 12:05:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v205si792284qka.27.2016.01.06.12.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 12:05:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGuL9-0001UZ-7n
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 15:05:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aGuKo-0001DT-Oz
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 15:05:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aGuKn-0005uX-O5
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 15:05:30 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aGuKn-0005uR-IV; Wed, 06 Jan 2016 15:05:29 -0500
Received: by mail-oi0-x242.google.com with SMTP id l9so27917705oia.0;
	Wed, 06 Jan 2016 12:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=XiFMnpbZKYVXCh7PtibNccNcoVO0BD/iGqaj/QW9lW4=;
	b=h+UjVPHyfzQWVoJayDoLJPVHzhbXAjEak+5FUSyVFhNhmU5ZWUSgkfzYfjw+Xwy7yx
	jPvRuhekozAAb/3K74w+Dipdjouy513ym/kTTCFa1UkCjs/Ssq6/l8kU/qUMQ0VzeFOj
	FixsQS2u30PG95NI9tMsOrYcbz7GbsSrfGlYLakWtC3sCTlsINLbbZWIzOwQHSkpXvXh
	vJe4nDNwmqMMU1tn7bjUcVVadY5XSUX6KQwgC4ggIQd/ao4rAM8K7ESxpub4r6ysXT7x
	6GMghoVZ4tL2OCxSmmKo2YqNMdmOHWTFSM2OjMUD7vKdfj5ug7cZ4SA+F/oVy9Oq8Uq7
	6BGQ==
X-Received: by 10.202.208.65 with SMTP id h62mr69391838oig.57.1452110728987;
	Wed, 06 Jan 2016 12:05:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 6 Jan 2016 12:04:59 -0800 (PST)
In-Reply-To: <CAPokK=r5G1Bf8zKSpvBcQnUHm3j4dhamPqLOwUgCpbGF8ifCFQ@mail.gmail.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-5-git-send-email-Andrew.Baumann@microsoft.com>
	<CAKmqyKNhzTUAvexC-N+mxekuWgcteEoujg6fQo2vL+tHsHw=Og@mail.gmail.com>
	<BLUPR0301MB2034F8C3EC30A73B8B5DD2B59EF40@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=r5G1Bf8zKSpvBcQnUHm3j4dhamPqLOwUgCpbGF8ifCFQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Jan 2016 12:04:59 -0800
Message-ID: <CAKmqyKNmd_ehh0xuqUrizo=_zb-OLTKgLK_M3rdCbrR5hQcw2A@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-devel] [PATCH v3 4/7] bcm2835_peripherals: add rollup
 device for bcm2835 peripherals
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
X-TUID: WmyA+q1f2pQC

On Wed, Jan 6, 2016 at 5:32 AM, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Tue, Jan 5, 2016 at 10:07 PM, Andrew Baumann
> <Andrew.Baumann@microsoft.com> wrote:
>>> From: Alistair Francis [mailto:alistair23@gmail.com]
>>> Sent: Tuesday, 5 January 2016 18:14
>>> On Thu, Dec 31, 2015 at 4:31 PM, Andrew Baumann
>>> <Andrew.Baumann@microsoft.com> wrote:
>>> > This device maintains all the non-CPU peripherals on bcm2835 (Pi1)
>>> > which are also present on bcm2836 (Pi2). It also implements the
>>> > private address spaces used for DMA and mailboxes.
>> [...]
>>> > +    obj =3D object_property_get_link(OBJECT(dev), "ram", &err);
>>> > +    if (obj =3D=3D NULL) {
>>> > +        error_setg(errp, "%s: required ram link not found: %s",
>>> > +                   __func__, error_get_pretty(err));
>>> > +        return;
>>> > +    }
>>>
>>> I only had a quick read of this patch, but this RAM linking looks fine
>>> to me. Out of curiosity is there a reason you use
>>> object_property_get_link() instead of object_property_add_link() in
>>> the init?
>>
>
> The const link system removes the need for the object to have storage
> for the link pointer in state. This means you don't need the state
> field or add_link(), but the only way to get the pointer for your own
> use is to get_link() on yourself. This is slightly simpler but has the
> disadvantage that you cannot unlink and then relink something else (I
> think?).

Ok, that makes sense.

Thanks,

Alistair

>
> I don't have an opinion over which way is more correct so both are
> fine for me but if the QOM people have a preferred style we should
> probably make the two patches consistent.
>
> Regards,
> Peter
>
>> I'm not sure I understand your question... it wouldn't work the other wa=
y. I allocate the ram and add the link using object_property_add_const_link=
() in hw/arm/raspi.c. This file needs to consume the ram to setup alias map=
pings, so it is using get_link(). (Note there's also level of indirection; =
raspi creates bcm2836, which does nothing but get the link set by its paren=
t and add it to its bcm2835_peripherals child.)
>>
>> I suppose I could do it the other way around (allocate and set link in b=
cm2835_peripherals, based on a size passed from the board), but it seemed m=
ore logical to treat the RAM as created/owned of the board rather than the =
SoC.
>>
>> Cheers,
>> Andrew
