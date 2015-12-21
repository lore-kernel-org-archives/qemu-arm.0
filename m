Received: by 10.182.158.201 with SMTP id ww9csp3462454obb;
        Tue, 22 Dec 2015 06:32:06 -0800 (PST)
X-Received: by 10.140.28.66 with SMTP id 60mr32560659qgy.74.1450794726653;
        Tue, 22 Dec 2015 06:32:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o72si18463437qkl.17.2015.12.22.06.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Dec 2015 06:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBNyw-0008RE-1d
	for alex.bennee@linaro.org; Tue, 22 Dec 2015 09:32:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>) id 1aBA01-0007Pc-UL
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 18:36:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>) id 1aBA00-0007Cx-4f
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 18:36:17 -0500
Received: from mail-io0-x22d.google.com ([2607:f8b0:4001:c06::22d]:34681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>)
	id 1aB9zw-0007CN-0w; Mon, 21 Dec 2015 18:36:12 -0500
Received: by mail-io0-x22d.google.com with SMTP id e126so170499344ioa.1;
	Mon, 21 Dec 2015 15:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ocZyZhRtlqKVSSrsKh//Nopjbh6xzUb+UfZ+TgmrDdo=;
	b=l2lG/uos7ePQURPKf7P7EOVjbeuLARmsh62WuMpXksSSV0/7fPwZXMQyQuLp3eIJ2q
	wXbsxa3z+qdiQvX/QpG14mx2Xk/moYnWudiv35mvsBnRgXYVtpdPn0Q/9ZqdQeNrzf7A
	nc/8mNblU58fGG3M16yNKMgSNezI2IKBCjsBRraFfi1r/dFS5m1nu8MWs/P83DXi5lNT
	hGkeHBK/2AyBLO6z+FV2y7i4GpC7F2KCMYpWX3DcwluWy+ZqolBg6jKPZxdODyItZ1V4
	3rEcLiyMwxy4gl3JKv/+OXQJg4qegsExzUvAg5anGGv6qKIuPkR3kUvwgywD4f1GLigw
	X0hQ==
MIME-Version: 1.0
X-Received: by 10.107.129.91 with SMTP id c88mr19835603iod.12.1450740971468;
	Mon, 21 Dec 2015 15:36:11 -0800 (PST)
Received: by 10.79.26.138 with HTTP; Mon, 21 Dec 2015 15:36:11 -0800 (PST)
In-Reply-To: <CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
	<BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
Date: Tue, 22 Dec 2015 00:36:11 +0100
Message-ID: <CAEJ1hmfW34s8Ct7hY07aCqGmEdb6uFVscRv1TVBswE8wGC3eJg@mail.gmail.com>
From: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: multipart/alternative; boundary=001a113eb46643fd36052770f438
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::22d
X-Mailman-Approved-At: Tue, 22 Dec 2015 09:32:04 -0500
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
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
X-TUID: 9cvbGAt1whlH

--001a113eb46643fd36052770f438
Content-Type: text/plain; charset=UTF-8

Indeed, this header is generated from the Broadcom's Linux drivers headers,
with a Perl script.

On Tue, Dec 22, 2015 at 12:33 AM, Peter Crosthwaite <
crosthwaitepeter@gmail.com> wrote:

> On Mon, Dec 21, 2015 at 3:15 PM, Andrew Baumann
> <Andrew.Baumann@microsoft.com> wrote:
> > Hi Peter,
> >
> > Thanks for the review!
> >
> >> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
> >> Sent: Monday, 21 December 2015 14:49
> >> On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann
> >> <Andrew.Baumann@microsoft.com> wrote:
> >> > This adds the system mailboxes which are used to communicate with a
> >> > number of GPU peripherals on Pi/Pi2.
> >> >
> >> > Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> >> > ---
> >> >  default-configs/arm-softmmu.mak      |   1 +
> >> >  hw/misc/Makefile.objs                |   1 +
> >> >  hw/misc/bcm2835_sbm.c                | 280 ++++++++++++++++++++
> >>
> >> >  include/hw/arm/bcm2835_arm_control.h | 481
> >> +++++++++++++++++++++++++++++++++++
> >>
> >> Do we need this file as of this patch?
> >
> > Yes, for ARM_MC_IHAVEDATAIRQEN and other related defines.
> >
> > [...]
> >> > +static void bcm2835_sbm_update(BCM2835SbmState *s)
> >>
> >> What does Sbm stand for? If it is acronym is should be all caps in
> camel case.
> >
> > I'm not sure -- it comes from Gregory's code; maybe he can comment?
> Where this device gets instantiated, there is a comment of
> >
> > /* Semaphores / Doorbells / Mailboxes */
> >
> > ... but only mailboxes are implemented here. I'm guessing maybe it's
> intended as "system mailboxes". I can rename it.
> >
> >
> >> > +{
> >> > +    int set;
> >>
> >> bool.
> >>
> >> > +    int done, n;
> >> > +    uint32_t value;
> >> > +
> >> > +    /* Avoid unwanted recursive calls */
> >> > +    s->mbox_irq_disabled = 1;
> >> > +
> >> > +    /* Get pending responses and put them in the vc->arm mbox */
> >> > +    done = 0;
> >> > +    while (!done) {
> >> > +        done = 1;
> >> > +        if (s->mbox[0].status & ARM_MS_FULL) {
> >> > +            /* vc->arm mbox full, exit */
> >>
> >> break here.
> >>
> >> > +        } else {
> >>
> >> so you can drop the else and get back a level of indent.
> >>
> >> > +            for (n = 0; n < MBOX_CHAN_COUNT; n++) {
> >> > +                if (s->available[n]) {
> >> > +                    value = ldl_phys(&s->mbox_as, n<<4);
> >> > +                    if (value != MBOX_INVALID_DATA) {
> >> > +                        mbox_push(&s->mbox[0], value);
> >> > +                    } else {
> >> > +                        /* Hmmm... */
> >>
> >> Needs more comment :)
> >
> > Gregory -- help! :)
> >
> > [...]
> >> > +    s->available[irq] = level;
> >> > +    if (!s->mbox_irq_disabled) {
> >>
> >> I don't think you need this. IO devices are not thread safe and
> >> core-code knows it. So you don't need to worry about interruption and
> >> re-entry of your IRQ handler.
> >
> > I will have to put a debugger on this to confirm, but I think the issue
> is that we are using a private memory region and GPIOs to route mailbox
> data and interrupts to the relevant sub peripherals. The ldl_phys invokes
> another device emulation (such as bcm2835_property.c in this series), which
> may cause it to signal an interrupt back to us via qemu_set_irq which will
> recursively run our handler. We want that IRQ to be recorded but "squashed".
> >
> > [...]
> >> > +
> >> > +    switch (offset) {
> >> > +    case 0x80:  /* MAIL0_READ */
> >> > +    case 0x84:
> >> > +    case 0x88:
> >> > +    case 0x8c:
> >>
> >> case 0x80..0x8c
> >
> > Woah! Is that standard C?
> >
>
> Yes, its probably one of the more recent language standards though.
> QEMU does use to more modern features liberally.
>
> > [...]
> >> > --- /dev/null
> >> > +++ b/include/hw/arm/bcm2835_arm_control.h
> >> > @@ -0,0 +1,481 @@
> >> > +/*
> >> > + *  linux/arch/arm/mach-bcm2708/arm_control.h
> > [...]
> >> When you have a regular structure like this, you should collapse it
> >> down using some arithmatic:
> >
> > Notice that this file comes from Linux. I know it's not pretty, but can
> we please keep it as-is, for comparison purposes? I'm not sure there's much
> value in cleaning it up locally...
> >
>
> It looks very autogenerated and seems pretty nasty on the repetition.
>
> As implementers of the hardware, it is much rarer to need these
> repetitious defs than the software users on the other side. "Do
> something specific with CPU#3's Mbox#5" is going to appear in
> software, but hardware implementers generally don't have a choice to
> implement things specifically and it usually ends up being looped and
> the exploded defs are never used. If there are only a handful of
> genuinely single defs needed, can they be fished out?
>
> Regards,
> Peter
>
> >> > --- /dev/null
> >> > +++ b/include/hw/misc/bcm2835_sbm.h
> >> > @@ -0,0 +1,37 @@
> >> > +/*
> >> > + * Raspberry Pi emulation (c) 2012 Gregory Estrade
> >> > + * This code is licensed under the GNU GPLv2 and later.
> >> > + */
> >> > +
> >> > +#ifndef BCM2835_SBM_H
> >> > +#define BCM2835_SBM_H
> >> > +
> >> > +#include "hw/sysbus.h"
> >> > +#include "exec/address-spaces.h"
> >> > +#include "hw/arm/bcm2835_mbox.h"
> >> > +
> >> > +#define TYPE_BCM2835_SBM "bcm2835_sbm"
> >> > +#define BCM2835_SBM(obj) \
> >> > +        OBJECT_CHECK(BCM2835SbmState, (obj), TYPE_BCM2835_SBM)
> >> > +
> >> > +typedef struct {
> >> > +    MemoryRegion *mbox_mr;
> >> > +    AddressSpace mbox_as;
> >>
> >> I can't see where these two fields are used. A quick scan shows that
> >> the SbmState's copy is uses for all DMA ops. If these are needed,
> >> mbox_init should pass a pointer to the the SbmState then this saves
> >> the pointer and navigates as needed back to the container structure to
> >> get the AS.
> >
> > You're right. They're uninitialised/unused detritus from a previous
> refactor. I'll remove them.
> >
> > Thanks,
> > Andrew
>

--001a113eb46643fd36052770f438
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Indeed, this header is generated from the Broadcom&#39;s L=
inux drivers headers, with a Perl script.=C2=A0</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Tue, Dec 22, 2015 at 12:33 AM, Peter=
 Crosthwaite <span dir=3D"ltr">&lt;<a href=3D"mailto:crosthwaitepeter@gmail=
.com" target=3D"_blank">crosthwaitepeter@gmail.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Mon, Dec 21, 2015 at 3:15 PM, Andrew Bau=
mann<br>
<div><div class=3D"h5">&lt;<a href=3D"mailto:Andrew.Baumann@microsoft.com">=
Andrew.Baumann@microsoft.com</a>&gt; wrote:<br>
&gt; Hi Peter,<br>
&gt;<br>
&gt; Thanks for the review!<br>
&gt;<br>
&gt;&gt; From: Peter Crosthwaite [mailto:<a href=3D"mailto:crosthwaitepeter=
@gmail.com">crosthwaitepeter@gmail.com</a>]<br>
&gt;&gt; Sent: Monday, 21 December 2015 14:49<br>
&gt;&gt; On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann<br>
&gt;&gt; &lt;<a href=3D"mailto:Andrew.Baumann@microsoft.com">Andrew.Baumann=
@microsoft.com</a>&gt; wrote:<br>
&gt;&gt; &gt; This adds the system mailboxes which are used to communicate =
with a<br>
&gt;&gt; &gt; number of GPU peripherals on Pi/Pi2.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Andrew Baumann &lt;<a href=3D"mailto:Andrew.Ba=
umann@microsoft.com">Andrew.Baumann@microsoft.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 default-configs/arm-softmmu.mak=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 hw/misc/bcm2835_sbm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 280 ++++++++++++++++++++<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 include/hw/arm/bcm2835_arm_control.h | 481<br>
&gt;&gt; +++++++++++++++++++++++++++++++++++<br>
&gt;&gt;<br>
&gt;&gt; Do we need this file as of this patch?<br>
&gt;<br>
&gt; Yes, for ARM_MC_IHAVEDATAIRQEN and other related defines.<br>
&gt;<br>
&gt; [...]<br>
&gt;&gt; &gt; +static void bcm2835_sbm_update(BCM2835SbmState *s)<br>
&gt;&gt;<br>
&gt;&gt; What does Sbm stand for? If it is acronym is should be all caps in=
 camel case.<br>
&gt;<br>
&gt; I&#39;m not sure -- it comes from Gregory&#39;s code; maybe he can com=
ment? Where this device gets instantiated, there is a comment of<br>
&gt;<br>
&gt; /* Semaphores / Doorbells / Mailboxes */<br>
&gt;<br>
&gt; ... but only mailboxes are implemented here. I&#39;m guessing maybe it=
&#39;s intended as &quot;system mailboxes&quot;. I can rename it.<br>
&gt;<br>
&gt;<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int set;<br>
&gt;&gt;<br>
&gt;&gt; bool.<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 int done, n;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 uint32_t value;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 /* Avoid unwanted recursive calls */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s-&gt;mbox_irq_disabled =3D 1;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 /* Get pending responses and put them in the v=
c-&gt;arm mbox */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 done =3D 0;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 while (!done) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 done =3D 1;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;mbox[0].status &amp; A=
RM_MS_FULL) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* vc-&gt;arm mbox=
 full, exit */<br>
&gt;&gt;<br>
&gt;&gt; break here.<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt;<br>
&gt;&gt; so you can drop the else and get back a level of indent.<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (n =3D 0; n &l=
t; MBOX_CHAN_COUNT; n++) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
s-&gt;available[n]) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 value =3D ldl_phys(&amp;s-&gt;mbox_as, n&lt;&lt;4);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (value !=3D MBOX_INVALID_DATA) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 mbox_push(&amp;s-&gt;mbox[0], value);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Hmmm... */<br>
&gt;&gt;<br>
&gt;&gt; Needs more comment :)<br>
&gt;<br>
&gt; Gregory -- help! :)<br>
&gt;<br>
&gt; [...]<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 s-&gt;available[irq] =3D level;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (!s-&gt;mbox_irq_disabled) {<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t think you need this. IO devices are not thread safe an=
d<br>
&gt;&gt; core-code knows it. So you don&#39;t need to worry about interrupt=
ion and<br>
&gt;&gt; re-entry of your IRQ handler.<br>
&gt;<br>
&gt; I will have to put a debugger on this to confirm, but I think the issu=
e is that we are using a private memory region and GPIOs to route mailbox d=
ata and interrupts to the relevant sub peripherals. The ldl_phys invokes an=
other device emulation (such as bcm2835_property.c in this series), which m=
ay cause it to signal an interrupt back to us via qemu_set_irq which will r=
ecursively run our handler. We want that IRQ to be recorded but &quot;squas=
hed&quot;.<br>
&gt;<br>
&gt; [...]<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 0x80:=C2=A0 /* MAIL0_READ */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 0x84:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 0x88:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 case 0x8c:<br>
&gt;&gt;<br>
&gt;&gt; case 0x80..0x8c<br>
&gt;<br>
&gt; Woah! Is that standard C?<br>
&gt;<br>
<br>
</div></div>Yes, its probably one of the more recent language standards tho=
ugh.<br>
QEMU does use to more modern features liberally.<br>
<span class=3D""><br>
&gt; [...]<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/include/hw/arm/bcm2835_arm_control.h<br>
&gt;&gt; &gt; @@ -0,0 +1,481 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + *=C2=A0 linux/arch/arm/mach-bcm2708/arm_control.h<br>
&gt; [...]<br>
&gt;&gt; When you have a regular structure like this, you should collapse i=
t<br>
&gt;&gt; down using some arithmatic:<br>
&gt;<br>
&gt; Notice that this file comes from Linux. I know it&#39;s not pretty, bu=
t can we please keep it as-is, for comparison purposes? I&#39;m not sure th=
ere&#39;s much value in cleaning it up locally...<br>
&gt;<br>
<br>
</span>It looks very autogenerated and seems pretty nasty on the repetition=
.<br>
<br>
As implementers of the hardware, it is much rarer to need these<br>
repetitious defs than the software users on the other side. &quot;Do<br>
something specific with CPU#3&#39;s Mbox#5&quot; is going to appear in<br>
software, but hardware implementers generally don&#39;t have a choice to<br=
>
implement things specifically and it usually ends up being looped and<br>
the exploded defs are never used. If there are only a handful of<br>
genuinely single defs needed, can they be fished out?<br>
<br>
Regards,<br>
Peter<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/include/hw/misc/bcm2835_sbm.h<br>
&gt;&gt; &gt; @@ -0,0 +1,37 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + * Raspberry Pi emulation (c) 2012 Gregory Estrade<br>
&gt;&gt; &gt; + * This code is licensed under the GNU GPLv2 and later.<br>
&gt;&gt; &gt; + */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#ifndef BCM2835_SBM_H<br>
&gt;&gt; &gt; +#define BCM2835_SBM_H<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt;&gt; &gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt;&gt; &gt; +#include &quot;hw/arm/bcm2835_mbox.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#define TYPE_BCM2835_SBM &quot;bcm2835_sbm&quot;<br>
&gt;&gt; &gt; +#define BCM2835_SBM(obj) \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECT_CHECK(BCM2835SbmState, (o=
bj), TYPE_BCM2835_SBM)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +typedef struct {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *mbox_mr;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 AddressSpace mbox_as;<br>
&gt;&gt;<br>
&gt;&gt; I can&#39;t see where these two fields are used. A quick scan show=
s that<br>
&gt;&gt; the SbmState&#39;s copy is uses for all DMA ops. If these are need=
ed,<br>
&gt;&gt; mbox_init should pass a pointer to the the SbmState then this save=
s<br>
&gt;&gt; the pointer and navigates as needed back to the container structur=
e to<br>
&gt;&gt; get the AS.<br>
&gt;<br>
&gt; You&#39;re right. They&#39;re uninitialised/unused detritus from a pre=
vious refactor. I&#39;ll remove them.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Andrew<br>
</div></div></blockquote></div><br></div>

--001a113eb46643fd36052770f438--
