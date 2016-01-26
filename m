Received: by 10.25.159.19 with SMTP id i19csp1677938lfe;
        Tue, 26 Jan 2016 00:03:35 -0800 (PST)
X-Received: by 10.55.22.204 with SMTP id 73mr759514qkw.41.1453795414223;
        Tue, 26 Jan 2016 00:03:34 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b21si150433qga.128.2016.01.26.00.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jan 2016 00:03:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNyb7-0006dL-QF
	for alex.bennee@linaro.org; Tue, 26 Jan 2016 03:03:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNyak-0006MJ-Bd
	for qemu-devel@nongnu.org; Tue, 26 Jan 2016 03:03:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNyaj-0001ou-Cu
	for qemu-devel@nongnu.org; Tue, 26 Jan 2016 03:03:10 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aNyaj-0001oq-60; Tue, 26 Jan 2016 03:03:09 -0500
Received: by mail-wm0-x242.google.com with SMTP id 123so15857326wmz.2;
	Tue, 26 Jan 2016 00:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oncApFqvtwhT1qH3LRKQAa1Ip6GE44jaRRkAYa1BG7s=;
	b=cGclT69b8xICpRpiy7yyeV8ttqEIOsVeDEry5W8Ga2ZOGXVUb/U5yR1tpp+hRnHnpA
	/iwwd1nKywq04l75qojMk1GvOmraJ1/Qz8EK0Rc27/wC/EUEjVvMf5NXvcB+R4RrzgAC
	dvXs60hH7ef4FBMcrweHial/sqS+T59MfYsojZWSyfd/kxAdPWXIE/+XwLf9ZGCHj5I3
	q3Wcgh+bcI9iC8SWuGuB2TtjfNl2mWD6cHcwGxxlCMbQSH2K26AVHjl/Ffy9vY9e/bXr
	HcGXzM/zbN4QY2ph91qUV0+axSMP8mhgFXf1uMrH6p/4uuaKqM3am/K6vNcIw7klcY+U
	s/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=oncApFqvtwhT1qH3LRKQAa1Ip6GE44jaRRkAYa1BG7s=;
	b=PBJF0+6zi2FSOuHgjO9b9/kKmT8kDCySkNAdSCKZEpjSmxUuLJvJy/RfFlbMeXb7VA
	9oJXzrYdmkeJQgaIMjyH4bdE+crPnSDgT5xUGKMMsKvUoYGfBIRe/O3eKJXQVO36VXGR
	nMUJHQAns/QQkiqXVSl5TDet3FyZAYZ7zrFHdyBzaqyLbMIvPM2I276ZaAP9twMjjjks
	ArYOF9U1rMNIyr7uOARORycjdiFD/LW7M+D7VYG3Mg7LOEKC8jt6AUTP6ijvIDGp+WG5
	Vq0S0SmYxxJttiqJCplMwLvcFFRkmTO7FsOfcNAZo26mxra8d5B7eZii7DFejhpYcMIf
	+wBg==
X-Gm-Message-State: AG10YOSXB2m5Oyf1FLPwY+4ct7FUt9B0OvNHudBFmDT1yIft5MjRRgd5rxMl2v6k+MveFBRdTYibvroE2GGThg==
MIME-Version: 1.0
X-Received: by 10.28.184.136 with SMTP id i130mr21631360wmf.96.1453795388346; 
	Tue, 26 Jan 2016 00:03:08 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Tue, 26 Jan 2016 00:03:08 -0800 (PST)
In-Reply-To: <BLUPR0301MB2034FAE99E63647A00D388E79ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-5-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=qp6vgfLPD+iai2-quyXD3ODPtNQgZLS1Kfwgn-ZCYMRw@mail.gmail.com>
	<BLUPR0301MB2034FAE99E63647A00D388E79ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Tue, 26 Jan 2016 00:03:08 -0800
Message-ID: <CAPokK=rXwURCOc=-W1v+2=Br2kZ4fDXdPUR6gc=UdyoVisY_Bw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-devel] [PATCH v4 4/8] bcm2835_peripherals: add rollup
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
X-TUID: oWT6wgNtUb1O

On Mon, Jan 25, 2016 at 10:23 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Monday, 25 January 2016 22:14
>>
>> On Fri, Jan 15, 2016 at 3:58 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
> [...]
>> > +static void bcm2835_peripherals_init(Object *obj)
>> > +{
>> > +    BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
>> > +
>> > +    /* Memory region for peripheral devices, which we export to our
>> parent */
>> > +    memory_region_init_io(&s->peri_mr, obj, NULL, s, "bcm2835-
>> peripherals",
>> > +                          0x1000000);
>>
>> Should this just be normal memory_region_init?
>
> I think so -- it's just a container region, and I probably copy and pasted the API here. The two MR init APIs seem almost but not-quite identical when NULL callbacks are used. Can you briefly explain the difference?
>

hmm I guess the defaulting to &unassigned_mem_ops. memory_region_init
looks to assume you will populate the usable subregions. Are you
relying on unassigned ops?

>> > +    object_property_add_child(obj, "peripheral-io", OBJECT(&s->peri_mr),
>> NULL);
>>
>> This seems like a weird parenting, to have the SoC as child to an
>> object it just created. Is the problem you need a parent before others
>> can parent to you?
>
> I'm confused by this question: Unless I'm mistaken, the parent here is BCM2835PeripheralState, the child is the new memory region we just called init on.
>

My bad - I have it backwards.

Regards,
Peter

> Thanks,
> Andrew
