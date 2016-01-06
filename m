Received: by 10.182.158.201 with SMTP id ww9csp11776868obb;
        Wed, 6 Jan 2016 05:32:57 -0800 (PST)
X-Received: by 10.140.44.38 with SMTP id f35mr57382999qga.49.1452087177559;
        Wed, 06 Jan 2016 05:32:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si47329715qgm.43.2016.01.06.05.32.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 05:32:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGoCv-0007ED-6l
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 08:32:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGoCs-0007Bj-If
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 08:32:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGoCr-0004Si-JC
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 08:32:54 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:33925)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aGoCk-0004Rx-6O; Wed, 06 Jan 2016 08:32:46 -0500
Received: by mail-wm0-x22b.google.com with SMTP id u188so60258902wmu.1;
	Wed, 06 Jan 2016 05:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=3sAJMzfJNgkbjhk8j8kyVrf2AEEC+HA1QwEHcrs819k=;
	b=USRehotYdjDngFyek8TT0JTlx8BvbqKwn1+7gR9GbyCDuuniC+22V9V0R76uYr9D/e
	b6jYum7aP2CaR3BSkb6NR0ronjQ1D2co4Od9Ncd2lNdP/rpKoAEM/K7NVTH0recNIwUP
	/dkoI//PF6CSVdN1JrP7UDNH7Ou9IQzvuAGZ8G66jKgOJCMelp7aqm18lqohSochW183
	7nt/x2EMKxWMemHTD2xJTdMAd8in2u8JLVk7JmLsKYdq3noXcR/5QxevS1ASX69fCsDq
	lEqOt/uMcKclSsAauhd7GVzlkzmn39mIiW/5kicwx4AKcQ6D4rcnN2a+d23E7Hq/F/Hl
	VRZQ==
MIME-Version: 1.0
X-Received: by 10.28.218.75 with SMTP id r72mr9599286wmg.59.1452087165574;
	Wed, 06 Jan 2016 05:32:45 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 6 Jan 2016 05:32:45 -0800 (PST)
In-Reply-To: <BLUPR0301MB2034F8C3EC30A73B8B5DD2B59EF40@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-5-git-send-email-Andrew.Baumann@microsoft.com>
	<CAKmqyKNhzTUAvexC-N+mxekuWgcteEoujg6fQo2vL+tHsHw=Og@mail.gmail.com>
	<BLUPR0301MB2034F8C3EC30A73B8B5DD2B59EF40@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Wed, 6 Jan 2016 05:32:45 -0800
Message-ID: <CAPokK=r5G1Bf8zKSpvBcQnUHm3j4dhamPqLOwUgCpbGF8ifCFQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/7] bcm2835_peripherals: add
 rollup device for bcm2835 peripherals
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9tDMV1JRrdg1

On Tue, Jan 5, 2016 at 10:07 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Alistair Francis [mailto:alistair23@gmail.com]
>> Sent: Tuesday, 5 January 2016 18:14
>> On Thu, Dec 31, 2015 at 4:31 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> > This device maintains all the non-CPU peripherals on bcm2835 (Pi1)
>> > which are also present on bcm2836 (Pi2). It also implements the
>> > private address spaces used for DMA and mailboxes.
> [...]
>> > +    obj =3D object_property_get_link(OBJECT(dev), "ram", &err);
>> > +    if (obj =3D=3D NULL) {
>> > +        error_setg(errp, "%s: required ram link not found: %s",
>> > +                   __func__, error_get_pretty(err));
>> > +        return;
>> > +    }
>>
>> I only had a quick read of this patch, but this RAM linking looks fine
>> to me. Out of curiosity is there a reason you use
>> object_property_get_link() instead of object_property_add_link() in
>> the init?
>

The const link system removes the need for the object to have storage
for the link pointer in state. This means you don't need the state
field or add_link(), but the only way to get the pointer for your own
use is to get_link() on yourself. This is slightly simpler but has the
disadvantage that you cannot unlink and then relink something else (I
think?).

I don't have an opinion over which way is more correct so both are
fine for me but if the QOM people have a preferred style we should
probably make the two patches consistent.

Regards,
Peter

> I'm not sure I understand your question... it wouldn't work the other way=
. I allocate the ram and add the link using object_property_add_const_link(=
) in hw/arm/raspi.c. This file needs to consume the ram to setup alias mapp=
ings, so it is using get_link(). (Note there's also level of indirection; r=
aspi creates bcm2836, which does nothing but get the link set by its parent=
 and add it to its bcm2835_peripherals child.)
>
> I suppose I could do it the other way around (allocate and set link in bc=
m2835_peripherals, based on a size passed from the board), but it seemed mo=
re logical to treat the RAM as created/owned of the board rather than the S=
oC.
>
> Cheers,
> Andrew
