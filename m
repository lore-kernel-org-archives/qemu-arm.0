Received: by 10.182.158.201 with SMTP id ww9csp3462466obb;
        Tue, 22 Dec 2015 06:32:07 -0800 (PST)
X-Received: by 10.140.31.37 with SMTP id e34mr32785305qge.28.1450794727840;
        Tue, 22 Dec 2015 06:32:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si33336891qkb.126.2015.12.22.06.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Dec 2015 06:32:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBNyx-0008Rj-Im
	for alex.bennee@linaro.org; Tue, 22 Dec 2015 09:32:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>) id 1aB9yK-0007F2-HD
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 18:34:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>) id 1aB9yI-0006ms-Uj
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 18:34:32 -0500
Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234]:37211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>)
	id 1aB9yF-0006lN-HK; Mon, 21 Dec 2015 18:34:27 -0500
Received: by mail-ig0-x234.google.com with SMTP id to18so46542429igc.0;
	Mon, 21 Dec 2015 15:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WdV5atkY06hbcd0SjpezJZkh+5IISWYhULjR8M1JqSU=;
	b=dnIUsQWWM4cau2KX/WjnK5tUuZJlZblEdqroOSvXrbR5yO7/iDw/Dcm9CVdrnCuZOD
	KtoRLAQ6Jwot0vUiDIFVHU9mF091R95m0nIrboSfctftT9WlFZVCYfHI1PErMdxSQ6iP
	a2xe3Faan0Akg7YRGzSLrnqc1UKBzJD9TDclrZdx0gEvTZ9y9+xjQauUgMl+osleIbh4
	KYKob+Ebx/CUQUx7wHn6sGJKS+g3YGLOFg8iw/+OIoYI24o3JzP6NfZZvdF119fVTWUx
	R96UhTM7v/75tB9Jtc5vAQv60+sbfgtZjdNZMi24qjTWk1GAKIRJpcdLYcCIWzOuLRmV
	0aoA==
MIME-Version: 1.0
X-Received: by 10.50.8.72 with SMTP id p8mr20046116iga.67.1450740866389; Mon,
	21 Dec 2015 15:34:26 -0800 (PST)
Received: by 10.79.26.138 with HTTP; Mon, 21 Dec 2015 15:34:26 -0800 (PST)
In-Reply-To: <BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
	<BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Tue, 22 Dec 2015 00:34:26 +0100
Message-ID: <CAEJ1hme78NOO0SLYbe0AVtJNWz96oNPf3iWK1ueX+Mn+o19=Zw@mail.gmail.com>
From: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: multipart/alternative; boundary=089e01184c1a009cfc052770ee79
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::234
X-Mailman-Approved-At: Tue, 22 Dec 2015 09:32:04 -0500
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
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
X-TUID: bqhE72MqKyXt

--089e01184c1a009cfc052770ee79
Content-Type: text/plain; charset=UTF-8

Hi,
The "sbm" is a typo. It was meant to be "smb": Semaphore MailBoxes...
Sorry about that.

Regards,
Gregory

On Tue, Dec 22, 2015 at 12:15 AM, Andrew Baumann <
Andrew.Baumann@microsoft.com> wrote:

> Hi Peter,
>
> Thanks for the review!
>
> > From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
> > Sent: Monday, 21 December 2015 14:49
> > On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann
> > <Andrew.Baumann@microsoft.com> wrote:
> > > This adds the system mailboxes which are used to communicate with a
> > > number of GPU peripherals on Pi/Pi2.
> > >
> > > Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> > > ---
> > >  default-configs/arm-softmmu.mak      |   1 +
> > >  hw/misc/Makefile.objs                |   1 +
> > >  hw/misc/bcm2835_sbm.c                | 280 ++++++++++++++++++++
> >
> > >  include/hw/arm/bcm2835_arm_control.h | 481
> > +++++++++++++++++++++++++++++++++++
> >
> > Do we need this file as of this patch?
>
> Yes, for ARM_MC_IHAVEDATAIRQEN and other related defines.
>
> [...]
> > > +static void bcm2835_sbm_update(BCM2835SbmState *s)
> >
> > What does Sbm stand for? If it is acronym is should be all caps in camel
> case.
>
> I'm not sure -- it comes from Gregory's code; maybe he can comment? Where
> this device gets instantiated, there is a comment of
>
> /* Semaphores / Doorbells / Mailboxes */
>
> ... but only mailboxes are implemented here. I'm guessing maybe it's
> intended as "system mailboxes". I can rename it.
>
>
> > > +{
> > > +    int set;
> >
> > bool.
> >
> > > +    int done, n;
> > > +    uint32_t value;
> > > +
> > > +    /* Avoid unwanted recursive calls */
> > > +    s->mbox_irq_disabled = 1;
> > > +
> > > +    /* Get pending responses and put them in the vc->arm mbox */
> > > +    done = 0;
> > > +    while (!done) {
> > > +        done = 1;
> > > +        if (s->mbox[0].status & ARM_MS_FULL) {
> > > +            /* vc->arm mbox full, exit */
> >
> > break here.
> >
> > > +        } else {
> >
> > so you can drop the else and get back a level of indent.
> >
> > > +            for (n = 0; n < MBOX_CHAN_COUNT; n++) {
> > > +                if (s->available[n]) {
> > > +                    value = ldl_phys(&s->mbox_as, n<<4);
> > > +                    if (value != MBOX_INVALID_DATA) {
> > > +                        mbox_push(&s->mbox[0], value);
> > > +                    } else {
> > > +                        /* Hmmm... */
> >
> > Needs more comment :)
>
> Gregory -- help! :)
>
> [...]
> > > +    s->available[irq] = level;
> > > +    if (!s->mbox_irq_disabled) {
> >
> > I don't think you need this. IO devices are not thread safe and
> > core-code knows it. So you don't need to worry about interruption and
> > re-entry of your IRQ handler.
>
> I will have to put a debugger on this to confirm, but I think the issue is
> that we are using a private memory region and GPIOs to route mailbox data
> and interrupts to the relevant sub peripherals. The ldl_phys invokes
> another device emulation (such as bcm2835_property.c in this series), which
> may cause it to signal an interrupt back to us via qemu_set_irq which will
> recursively run our handler. We want that IRQ to be recorded but "squashed".
>
> [...]
> > > +
> > > +    switch (offset) {
> > > +    case 0x80:  /* MAIL0_READ */
> > > +    case 0x84:
> > > +    case 0x88:
> > > +    case 0x8c:
> >
> > case 0x80..0x8c
>
> Woah! Is that standard C?
>
> [...]
> > > --- /dev/null
> > > +++ b/include/hw/arm/bcm2835_arm_control.h
> > > @@ -0,0 +1,481 @@
> > > +/*
> > > + *  linux/arch/arm/mach-bcm2708/arm_control.h
> [...]
> > When you have a regular structure like this, you should collapse it
> > down using some arithmatic:
>
> Notice that this file comes from Linux. I know it's not pretty, but can we
> please keep it as-is, for comparison purposes? I'm not sure there's much
> value in cleaning it up locally...
>
> > > --- /dev/null
> > > +++ b/include/hw/misc/bcm2835_sbm.h
> > > @@ -0,0 +1,37 @@
> > > +/*
> > > + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> > > + * This code is licensed under the GNU GPLv2 and later.
> > > + */
> > > +
> > > +#ifndef BCM2835_SBM_H
> > > +#define BCM2835_SBM_H
> > > +
> > > +#include "hw/sysbus.h"
> > > +#include "exec/address-spaces.h"
> > > +#include "hw/arm/bcm2835_mbox.h"
> > > +
> > > +#define TYPE_BCM2835_SBM "bcm2835_sbm"
> > > +#define BCM2835_SBM(obj) \
> > > +        OBJECT_CHECK(BCM2835SbmState, (obj), TYPE_BCM2835_SBM)
> > > +
> > > +typedef struct {
> > > +    MemoryRegion *mbox_mr;
> > > +    AddressSpace mbox_as;
> >
> > I can't see where these two fields are used. A quick scan shows that
> > the SbmState's copy is uses for all DMA ops. If these are needed,
> > mbox_init should pass a pointer to the the SbmState then this saves
> > the pointer and navigates as needed back to the container structure to
> > get the AS.
>
> You're right. They're uninitialised/unused detritus from a previous
> refactor. I'll remove them.
>
> Thanks,
> Andrew
>

--089e01184c1a009cfc052770ee79
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>The &quot;sbm&quot; is a typo. It was meant to be =
&quot;smb&quot;: Semaphore MailBoxes...</div><div>Sorry about that.</div><d=
iv><br></div><div>Regards,</div><div>Gregory=C2=A0</div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Dec 22, 2015 at 12:15 =
AM, Andrew Baumann <span dir=3D"ltr">&lt;<a href=3D"mailto:Andrew.Baumann@m=
icrosoft.com" target=3D"_blank">Andrew.Baumann@microsoft.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi Peter,<br>
<br>
Thanks for the review!<br>
<span class=3D""><br>
&gt; From: Peter Crosthwaite [mailto:<a href=3D"mailto:crosthwaitepeter@gma=
il.com">crosthwaitepeter@gmail.com</a>]<br>
</span>&gt; Sent: Monday, 21 December 2015 14:49<br>
<span class=3D"">&gt; On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann<br>
&gt; &lt;<a href=3D"mailto:Andrew.Baumann@microsoft.com">Andrew.Baumann@mic=
rosoft.com</a>&gt; wrote:<br>
&gt; &gt; This adds the system mailboxes which are used to communicate with=
 a<br>
&gt; &gt; number of GPU peripherals on Pi/Pi2.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Andrew Baumann &lt;<a href=3D"mailto:Andrew.Bauman=
n@microsoft.com">Andrew.Baumann@microsoft.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 default-configs/arm-softmmu.mak=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +<br>
&gt; &gt;=C2=A0 hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 hw/misc/bcm2835_sbm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 280 ++++++++++++++++++++<br>
&gt;<br>
&gt; &gt;=C2=A0 include/hw/arm/bcm2835_arm_control.h | 481<br>
&gt; +++++++++++++++++++++++++++++++++++<br>
&gt;<br>
&gt; Do we need this file as of this patch?<br>
<br>
</span>Yes, for ARM_MC_IHAVEDATAIRQEN and other related defines.<br>
<br>
[...]<br>
<span class=3D"">&gt; &gt; +static void bcm2835_sbm_update(BCM2835SbmState =
*s)<br>
&gt;<br>
&gt; What does Sbm stand for? If it is acronym is should be all caps in cam=
el case.<br>
<br>
</span>I&#39;m not sure -- it comes from Gregory&#39;s code; maybe he can c=
omment? Where this device gets instantiated, there is a comment of<br>
<br>
/* Semaphores / Doorbells / Mailboxes */<br>
<br>
... but only mailboxes are implemented here. I&#39;m guessing maybe it&#39;=
s intended as &quot;system mailboxes&quot;. I can rename it.<br>
<div><div class=3D"h5"><br>
<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 int set;<br>
&gt;<br>
&gt; bool.<br>
&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 int done, n;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t value;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Avoid unwanted recursive calls */<br>
&gt; &gt; +=C2=A0 =C2=A0 s-&gt;mbox_irq_disabled =3D 1;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Get pending responses and put them in the vc-&g=
t;arm mbox */<br>
&gt; &gt; +=C2=A0 =C2=A0 done =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 while (!done) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 done =3D 1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;mbox[0].status &amp; ARM_M=
S_FULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* vc-&gt;arm mbox ful=
l, exit */<br>
&gt;<br>
&gt; break here.<br>
&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;<br>
&gt; so you can drop the else and get back a level of indent.<br>
&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (n =3D 0; n &lt; M=
BOX_CHAN_COUNT; n++) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&g=
t;available[n]) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 value =3D ldl_phys(&amp;s-&gt;mbox_as, n&lt;&lt;4);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (value !=3D MBOX_INVALID_DATA) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mbox_push(&amp;s-&gt;mbox[0], value);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 } else {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* Hmmm... */<br>
&gt;<br>
&gt; Needs more comment :)<br>
<br>
</div></div>Gregory -- help! :)<br>
<br>
[...]<br>
<span class=3D"">&gt; &gt; +=C2=A0 =C2=A0 s-&gt;available[irq] =3D level;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 if (!s-&gt;mbox_irq_disabled) {<br>
&gt;<br>
&gt; I don&#39;t think you need this. IO devices are not thread safe and<br=
>
&gt; core-code knows it. So you don&#39;t need to worry about interruption =
and<br>
&gt; re-entry of your IRQ handler.<br>
<br>
</span>I will have to put a debugger on this to confirm, but I think the is=
sue is that we are using a private memory region and GPIOs to route mailbox=
 data and interrupts to the relevant sub peripherals. The ldl_phys invokes =
another device emulation (such as bcm2835_property.c in this series), which=
 may cause it to signal an interrupt back to us via qemu_set_irq which will=
 recursively run our handler. We want that IRQ to be recorded but &quot;squ=
ashed&quot;.<br>
<br>
[...]<br>
<span class=3D"">&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt; &gt; +=C2=A0 =C2=A0 case 0x80:=C2=A0 /* MAIL0_READ */<br>
&gt; &gt; +=C2=A0 =C2=A0 case 0x84:<br>
&gt; &gt; +=C2=A0 =C2=A0 case 0x88:<br>
&gt; &gt; +=C2=A0 =C2=A0 case 0x8c:<br>
&gt;<br>
&gt; case 0x80..0x8c<br>
<br>
</span>Woah! Is that standard C?<br>
<br>
[...]<br>
<span class=3D"">&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/include/hw/arm/bcm2835_arm_control.h<br>
&gt; &gt; @@ -0,0 +1,481 @@<br>
&gt; &gt; +/*<br>
&gt; &gt; + *=C2=A0 linux/arch/arm/mach-bcm2708/arm_control.h<br>
</span>[...]<br>
<span class=3D"">&gt; When you have a regular structure like this, you shou=
ld collapse it<br>
&gt; down using some arithmatic:<br>
<br>
</span>Notice that this file comes from Linux. I know it&#39;s not pretty, =
but can we please keep it as-is, for comparison purposes? I&#39;m not sure =
there&#39;s much value in cleaning it up locally...<br>
<div><div class=3D"h5"><br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/include/hw/misc/bcm2835_sbm.h<br>
&gt; &gt; @@ -0,0 +1,37 @@<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Raspberry Pi emulation (c) 2012 Gregory Estrade<br>
&gt; &gt; + * This code is licensed under the GNU GPLv2 and later.<br>
&gt; &gt; + */<br>
&gt; &gt; +<br>
&gt; &gt; +#ifndef BCM2835_SBM_H<br>
&gt; &gt; +#define BCM2835_SBM_H<br>
&gt; &gt; +<br>
&gt; &gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; &gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt; &gt; +#include &quot;hw/arm/bcm2835_mbox.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +#define TYPE_BCM2835_SBM &quot;bcm2835_sbm&quot;<br>
&gt; &gt; +#define BCM2835_SBM(obj) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECT_CHECK(BCM2835SbmState, (obj),=
 TYPE_BCM2835_SBM)<br>
&gt; &gt; +<br>
&gt; &gt; +typedef struct {<br>
&gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *mbox_mr;<br>
&gt; &gt; +=C2=A0 =C2=A0 AddressSpace mbox_as;<br>
&gt;<br>
&gt; I can&#39;t see where these two fields are used. A quick scan shows th=
at<br>
&gt; the SbmState&#39;s copy is uses for all DMA ops. If these are needed,<=
br>
&gt; mbox_init should pass a pointer to the the SbmState then this saves<br=
>
&gt; the pointer and navigates as needed back to the container structure to=
<br>
&gt; get the AS.<br>
<br>
</div></div>You&#39;re right. They&#39;re uninitialised/unused detritus fro=
m a previous refactor. I&#39;ll remove them.<br>
<br>
Thanks,<br>
Andrew<br>
</blockquote></div><br></div>

--089e01184c1a009cfc052770ee79--
