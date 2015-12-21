Received: by 10.182.158.201 with SMTP id ww9csp3082242obb;
        Mon, 21 Dec 2015 15:33:31 -0800 (PST)
X-Received: by 10.140.27.139 with SMTP id 11mr24908293qgx.62.1450740811409;
        Mon, 21 Dec 2015 15:33:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n128si21678695qhn.21.2015.12.21.15.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Dec 2015 15:33:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aB9xL-0006Kl-1G
	for alex.bennee@linaro.org; Mon, 21 Dec 2015 18:33:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aB9xI-0006Hj-BQ
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 18:33:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aB9xG-0006Xa-VP
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 18:33:28 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:35988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aB9xE-0006WG-5A; Mon, 21 Dec 2015 18:33:24 -0500
Received: by mail-wm0-x230.google.com with SMTP id p187so88181785wmp.1;
	Mon, 21 Dec 2015 15:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=2TQWj8haj1rgNLbjzrQrETbrX/iyMGZBS3OvBc1WjSg=;
	b=pgI+IJkwRql+Xd7RnvLbBNvcKRirIcgTHVKI3XrIehpj49BrHZydKSIhCeth9LSU8T
	vplBEwvEyDSDl2JkBj7YwZUGmf5gZvWuwV/7Ywz8ZzfPzz4X2Tywzh80yUDo5E0+Qwd/
	KPRX+hIUmLiOfIuwJtsVw8RuZzlpdMabPmAnpQjLTjBQFCIXGqpUPRpR8+wBA83xIxYZ
	UuCl6I+g5XU5vuwC5oyAiVe1/D59gKDsdp12qj0cvUn2g+D+uDSua6w3Iwsib3/l9j3L
	naBpRtTAT7agWUUZ1DHWyQq2UvoGNCFBkN3Tn9lOzLRbM8rjqXZ/3SilHBTauc/Eos1j
	euxQ==
MIME-Version: 1.0
X-Received: by 10.28.184.136 with SMTP id i130mr4485276wmf.96.1450740803484;
	Mon, 21 Dec 2015 15:33:23 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Mon, 21 Dec 2015 15:33:23 -0800 (PST)
In-Reply-To: <BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
	<BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Mon, 21 Dec 2015 15:33:23 -0800
Message-ID: <CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
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
X-TUID: HuEQqVzpKzrR

On Mon, Dec 21, 2015 at 3:15 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi Peter,
>
> Thanks for the review!
>
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Monday, 21 December 2015 14:49
>> On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> > This adds the system mailboxes which are used to communicate with a
>> > number of GPU peripherals on Pi/Pi2.
>> >
>> > Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
>> > ---
>> >  default-configs/arm-softmmu.mak      |   1 +
>> >  hw/misc/Makefile.objs                |   1 +
>> >  hw/misc/bcm2835_sbm.c                | 280 ++++++++++++++++++++
>>
>> >  include/hw/arm/bcm2835_arm_control.h | 481
>> +++++++++++++++++++++++++++++++++++
>>
>> Do we need this file as of this patch?
>
> Yes, for ARM_MC_IHAVEDATAIRQEN and other related defines.
>
> [...]
>> > +static void bcm2835_sbm_update(BCM2835SbmState *s)
>>
>> What does Sbm stand for? If it is acronym is should be all caps in camel=
 case.
>
> I'm not sure -- it comes from Gregory's code; maybe he can comment? Where=
 this device gets instantiated, there is a comment of
>
> /* Semaphores / Doorbells / Mailboxes */
>
> ... but only mailboxes are implemented here. I'm guessing maybe it's inte=
nded as "system mailboxes". I can rename it.
>
>
>> > +{
>> > +    int set;
>>
>> bool.
>>
>> > +    int done, n;
>> > +    uint32_t value;
>> > +
>> > +    /* Avoid unwanted recursive calls */
>> > +    s->mbox_irq_disabled =3D 1;
>> > +
>> > +    /* Get pending responses and put them in the vc->arm mbox */
>> > +    done =3D 0;
>> > +    while (!done) {
>> > +        done =3D 1;
>> > +        if (s->mbox[0].status & ARM_MS_FULL) {
>> > +            /* vc->arm mbox full, exit */
>>
>> break here.
>>
>> > +        } else {
>>
>> so you can drop the else and get back a level of indent.
>>
>> > +            for (n =3D 0; n < MBOX_CHAN_COUNT; n++) {
>> > +                if (s->available[n]) {
>> > +                    value =3D ldl_phys(&s->mbox_as, n<<4);
>> > +                    if (value !=3D MBOX_INVALID_DATA) {
>> > +                        mbox_push(&s->mbox[0], value);
>> > +                    } else {
>> > +                        /* Hmmm... */
>>
>> Needs more comment :)
>
> Gregory -- help! :)
>
> [...]
>> > +    s->available[irq] =3D level;
>> > +    if (!s->mbox_irq_disabled) {
>>
>> I don't think you need this. IO devices are not thread safe and
>> core-code knows it. So you don't need to worry about interruption and
>> re-entry of your IRQ handler.
>
> I will have to put a debugger on this to confirm, but I think the issue i=
s that we are using a private memory region and GPIOs to route mailbox data=
 and interrupts to the relevant sub peripherals. The ldl_phys invokes anoth=
er device emulation (such as bcm2835_property.c in this series), which may =
cause it to signal an interrupt back to us via qemu_set_irq which will recu=
rsively run our handler. We want that IRQ to be recorded but "squashed".
>
> [...]
>> > +
>> > +    switch (offset) {
>> > +    case 0x80:  /* MAIL0_READ */
>> > +    case 0x84:
>> > +    case 0x88:
>> > +    case 0x8c:
>>
>> case 0x80..0x8c
>
> Woah! Is that standard C?
>

Yes, its probably one of the more recent language standards though.
QEMU does use to more modern features liberally.

> [...]
>> > --- /dev/null
>> > +++ b/include/hw/arm/bcm2835_arm_control.h
>> > @@ -0,0 +1,481 @@
>> > +/*
>> > + *  linux/arch/arm/mach-bcm2708/arm_control.h
> [...]
>> When you have a regular structure like this, you should collapse it
>> down using some arithmatic:
>
> Notice that this file comes from Linux. I know it's not pretty, but can w=
e please keep it as-is, for comparison purposes? I'm not sure there's much =
value in cleaning it up locally...
>

It looks very autogenerated and seems pretty nasty on the repetition.

As implementers of the hardware, it is much rarer to need these
repetitious defs than the software users on the other side. "Do
something specific with CPU#3's Mbox#5" is going to appear in
software, but hardware implementers generally don't have a choice to
implement things specifically and it usually ends up being looped and
the exploded defs are never used. If there are only a handful of
genuinely single defs needed, can they be fished out?

Regards,
Peter

>> > --- /dev/null
>> > +++ b/include/hw/misc/bcm2835_sbm.h
>> > @@ -0,0 +1,37 @@
>> > +/*
>> > + * Raspberry Pi emulation (c) 2012 Gregory Estrade
>> > + * This code is licensed under the GNU GPLv2 and later.
>> > + */
>> > +
>> > +#ifndef BCM2835_SBM_H
>> > +#define BCM2835_SBM_H
>> > +
>> > +#include "hw/sysbus.h"
>> > +#include "exec/address-spaces.h"
>> > +#include "hw/arm/bcm2835_mbox.h"
>> > +
>> > +#define TYPE_BCM2835_SBM "bcm2835_sbm"
>> > +#define BCM2835_SBM(obj) \
>> > +        OBJECT_CHECK(BCM2835SbmState, (obj), TYPE_BCM2835_SBM)
>> > +
>> > +typedef struct {
>> > +    MemoryRegion *mbox_mr;
>> > +    AddressSpace mbox_as;
>>
>> I can't see where these two fields are used. A quick scan shows that
>> the SbmState's copy is uses for all DMA ops. If these are needed,
>> mbox_init should pass a pointer to the the SbmState then this saves
>> the pointer and navigates as needed back to the container structure to
>> get the AS.
>
> You're right. They're uninitialised/unused detritus from a previous refac=
tor. I'll remove them.
>
> Thanks,
> Andrew
