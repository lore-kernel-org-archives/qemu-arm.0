Received: by 10.25.159.19 with SMTP id i19csp1199672lfe;
        Fri, 29 Jan 2016 14:41:22 -0800 (PST)
X-Received: by 10.140.42.139 with SMTP id c11mr13942874qga.5.1454107282398;
        Fri, 29 Jan 2016 14:41:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i84si19284588qhc.45.2016.01.29.14.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:41:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHjF-000584-Tk
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:41:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aPHit-0004ni-5C
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:41:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aPHir-0005me-UN
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:40:59 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36066)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aPHir-0005mM-Jk; Fri, 29 Jan 2016 17:40:57 -0500
Received: by mail-wm0-x243.google.com with SMTP id 128so10144800wmz.3;
	Fri, 29 Jan 2016 14:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4uBPWjLuwNA4Sv0vVa0p79dg1psz0dfUFMLLrb7d4+4=;
	b=CDaxZKDQLW7nUG8TWb9zEWE3kQErEhFwLB4rJfpH0ANoRbjKxeHfSkbbKPmDJHqG1k
	l69pXomBBAmU0saZ6ThMnJ2jfch7ABlmQnQmWd5gjwgT64jq0ZLeTGDOpH8Fu6Bvz79S
	SvUW7Df/aOZpMH6rTPQoryppQA9AyrIKU6wu7URt2/Jv4s6wNmOZORzrj2Bn61QorHyE
	myaAQH0eAuIvefYqtM3e6BhHNiCRRP1FBbJvYOAVNBvYWUxrce5WRMTzU8oU160bcVjs
	AOF4pQYTXS7YpUITZZKqeZ83mAZbMbvg/rQ1LpUspjDnUP5JLdN+iSm5zuB8t9FE0xe+
	NAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4uBPWjLuwNA4Sv0vVa0p79dg1psz0dfUFMLLrb7d4+4=;
	b=SAjUSFlezL5zcYWOAe4mlIu0U1C9ezTM63MEdQJPD2hwwVK6FOplUhsxrspwWm8Pam
	0qRCkthEt4Ng3tQPQN5QxfqVSyC8qFE2VBLPkhAI5kCVN9NVrZWd5Ajm0mblZBalLW4j
	J5HKg+CVdpCVjoA5YbG6PIjSRLqdSiF6vS4VRijFoB4awNgWix/eyKgc0hP2g1SyhFdP
	iYjzF3bhFzK6PS5JFugotOhKtzulQ2r63lz1ev7EMQO8grLUUtXEFOihtL7rMa5IiKbW
	nNtdnYSK4RyG7gcnnkgDgkTATWh06okD+mjgXq6dIKruqteVfqpj3hCvzn/5fvFYvXN5
	PVPg==
X-Gm-Message-State: AG10YOQZc2Jz0IehzxKji7ogZs4l2jQBsrGoGCTU9rrv1ypjLyHnsPDLfNnAc/7rtWhYFqQN8ESflfOYNj7BOQ==
MIME-Version: 1.0
X-Received: by 10.28.217.83 with SMTP id q80mr10968373wmg.15.1454107256800;
	Fri, 29 Jan 2016 14:40:56 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Fri, 29 Jan 2016 14:40:56 -0800 (PST)
In-Reply-To: <BLUPR0301MB2034C0FA82D60BAF82916E779EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-9-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=ory3pnNPsBgde12BqGGW_L3QOG0OVdtLNJomK0QhxxYQ@mail.gmail.com>
	<BLUPR0301MB2034170EF1FBCB3856E044FB9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pLw9OVv3_FHedk12byTu0gjGFy80UT1T1TUFTewi5kpg@mail.gmail.com>
	<BLUPR0301MB2034C0FA82D60BAF82916E779EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Fri, 29 Jan 2016 14:40:56 -0800
Message-ID: <CAPokK=qsgcxVkuU9yRTDV+NXkyqQpUT8mMhZmk_QN4yE_PEg=w@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-devel] [PATCH v4 8/8] raspi: add raspberry pi 2 machine
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
X-TUID: nxbOSXYY8QbS

On Fri, Jan 29, 2016 at 2:28 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Friday, 29 January 2016 14:23
>>
>> On Fri, Jan 29, 2016 at 1:50 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> > Hi Peter,
>> >
>> > Thanks for all the reviews. I should have a respun version on the list shortly.
>> There's one minor change to this last patch:
>> >
>> >> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> >> Sent: Thursday, 28 January 2016 23:31
>> >> > On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> >  [...]
>> >> > +typedef struct RaspiState {
>> >>
>> >> A quick google search, I see the camel case form for rpi is usually
>> >> "RasPi". Should we follow?
>> >
>> > Ok.
>> >
>> >> > +    union {
>> >>
>> >> union not needed.
>> >
>> > I know it's not needed now, but it will be as soon as we add pi1, which I
>> hope to address in the next patch series. It will make that diff cleaner if we
>> keep this here now, so I'm going to leave it as-is. I hope that's ok with you.
>> >
>>
>> It sounds like you are implementing an inheritance outside QOM. I'm
>> not sure about this, can we just drop the union and figure it out on
>> the next series?
>
> It's nothing nearly that clever/complicated. See https://github.com/0xabu/qemu/blob/raspi/hw/arm/raspi.c#L116
>
>     switch (version) {
>     case 1:
>         object_initialize(&s->soc.pi1, sizeof(s->soc.pi1), TYPE_BCM2835);
>         break;
>     case 2:
>         object_initialize(&s->soc.pi2, sizeof(s->soc.pi2), TYPE_BCM2836);
>         break;
>     }
>
> And then later, we always refer simply to OBJECT(&s->soc). I suppose I could use a generic Object pointer instead, and allocate the soc-specific type elsewhere, but it seemed simpler with the union.
>

But this is effectively an upcast to an abstract type, here:

+
+    /* Setup the SOC */
+    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
+                                   &error_abort);
+    object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
+                            &error_abort);

Where that concrete type musts implement "ram" and "enabled-cpus". So
I am unsure of having a split implementation of "ram", "enabled-cpus"
etc from one SoC to the other as you are using a QOM property name as
an abstract interface definition.

Regards,
Peter

> Andrew
