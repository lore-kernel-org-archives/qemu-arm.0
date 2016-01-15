Received: by 10.25.159.19 with SMTP id i19csp156668lfe;
        Thu, 14 Jan 2016 17:09:43 -0800 (PST)
X-Received: by 10.140.82.11 with SMTP id g11mr9337866qgd.77.1452820183013;
        Thu, 14 Jan 2016 17:09:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r16si10283421qhb.114.2016.01.14.17.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 17:09:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJsta-0003rO-E0
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 20:09:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJstY-0003qX-Ti
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 20:09:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJstX-0004A5-TA
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 20:09:40 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36549)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aJstV-00049f-JJ; Thu, 14 Jan 2016 20:09:37 -0500
Received: by mail-wm0-x234.google.com with SMTP id l65so2072891wmf.1;
	Thu, 14 Jan 2016 17:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=FKc4/MaeS7+hSO/UJtcKcjxRADqrw7L+3UhbysyZO7A=;
	b=whuccMoqZqEl2z5jQ81OnGl6M4hCrn5OZWX/s3fZcpVC9R4YNVR0RcHXWf2zo+e5a4
	wNsWXlxMPMu2o9dw2cpPZYU/+6ODBH2jBAWGIFu4cyGT9OTLULYjE2hDYx6ht/UGhUWe
	sCnYJDjoki3o7wVieTzwN0IaCgiWgSgUaJrVVv4rrkCDD907aSRa0u/KJgIR8T3blLd5
	NO4mOiEC1+RBcapYp+/nRsnrv3u//A/EjNB3eVuTdXC/AxMpjsbj1kioiEGn8v07o8YS
	2y7Ft8K7RTjLGzs00xNDSFQaYMNkwpH3DmNCNNv22ouWkyziCaSCSzT+w1AAC70GHzGU
	+soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=FKc4/MaeS7+hSO/UJtcKcjxRADqrw7L+3UhbysyZO7A=;
	b=CSKnLdRWDHNxKMlfBlwR/n1v9R9ybWBHiW3LRTrsveimoQB5QjkaoJNY676b7MHRq0
	Tf3tEL4CQNW353WKH2koJg7HAUtA2ILR55OZUk5Q0BzGaLfVYINWiHCxF5P4rUlt80wJ
	8WvdxecBJdEJ06q+z9luxPMQHUFYSIO4uriVhlu1GzQgIZJmnQRTtvVKKrODovnmxo1G
	aQhyFWpGYjqFS3VjgSLxlooynr05jjvG+tKqI5eb9jsOf9LdwlmpnogYZaSMFxfmQfbk
	KL2AgPx0t8eWk6HbNTtEfBj5C+UZCritjVjGUbk1yd9LEfvHhorC55axNj2FXjPUL2+Z
	9SCQ==
X-Gm-Message-State: AG10YOQIdM2CWii+WoK9e8rtKGLzOkCVmf0uHjtkeLYM+070EqrQ+ge4FVFHzK/z9YudNp6MzYnw2Va/E7HmUQ==
MIME-Version: 1.0
X-Received: by 10.28.63.22 with SMTP id m22mr286410wma.59.1452820176895; Thu,
	14 Jan 2016 17:09:36 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Thu, 14 Jan 2016 17:09:36 -0800 (PST)
In-Reply-To: <BLUPR0301MB2034E184E428D6EA2A2ED9BF9ECD0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035753.GD3308@pcrost-box>
	<BLUPR0301MB2034BFDBF9CE361133F26B8E9ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=o8x9fRw7K-nfdhSVB=8De9bMi9tZiUq54cevvjNSDP2A@mail.gmail.com>
	<BLUPR0301MB20344588F72A1870A14A673A9ECC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=p44X=0Dymr3BhbKTTf3Gx00tPGJO=B2mCki2TPCh0ZHA@mail.gmail.com>
	<BLUPR0301MB2034E184E428D6EA2A2ED9BF9ECD0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Thu, 14 Jan 2016 17:09:36 -0800
Message-ID: <CAPokK=paENkGho5dPRqpCqZed9deCcNVASBjhX5FnJydiFZXWA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 7/7] raspi: add raspberry pi 2 machine
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
X-TUID: 8wx0h2z4higY

On Thu, Jan 14, 2016 at 4:43 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Thursday, 14 January 2016 15:35
>>
>> On Thu, Jan 14, 2016 at 3:04 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> > Hi Peter,
>> >
>> >> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> >> Sent: Tuesday, 12 January 2016 16:44
>> >> On Tue, Jan 12, 2016 at 3:53 PM, Andrew Baumann
>> >> <Andrew.Baumann@microsoft.com> wrote:
>> >> >> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> >> >> Sent: Monday, 11 January 2016 19:58
>> >> >> > +    /* Allocate and map RAM */
>> >> >> > +    memory_region_allocate_system_memory(&s->ram,
>> >> >> OBJECT(machine), "ram",
>> >> >> > +                                         machine->ram_size);
>> >> >> > +
>> memory_region_add_subregion_overlap(get_system_memory(), 0,
>> >> >> &s->ram, 0);
>> >> >>
>> >> >> I thought the SoC handled this now? Why do you need to add to
>> >> >> system_memory?
>> >> >
>> >> > If I don't map it here, how do RAM accesses from the CPUs work?
>> >> >
>> >>
>> >> Do the CPUs not have their AS'es connected to your custom ASes by the
>> SoC
>> >> layer?
>> >>
>> >> > Or are you saying that I should still do this, but do it in the SoC=
 not the
>> >> board level?
>> >> >
>> >>
>> >> I was hoping we could get away with 0 use of system_memory.
>> >
>> > On further investigation, I don't think it's possible to wire up CPU A=
Ses
>> explicitly. There's no obvious property to set. Each cpu->as is initiali=
sed to
>> point to address_space_memory at the top of cpu_exec_init(), and there i=
s
>> no way I could see to override that.
>> >
>> > I think what I have now is pretty clean, but if you'd prefer to do the
>> mapping at into the global AS at SoC level that's fine with me too.
>> >
>>
>> If it cant be done yet, what is here is a preferable approach. PMM has
>> some work on list for CPU ASes that may be realted, moreso for the
>> secure attributes though I think.
>
> Ok. It looks like the patch you CCed me on would enable this. But I don't=
 really want to wait for that with Pi, and honestly I don't think this is t=
oo bad -- there are only a handful of things in the system_memory space (th=
e RAM, the peripherals blob, and the 2836 multi-core controller on pi2), an=
d it seems unlikely to be of great benefit unless some future madman starts=
 building multi-pi boards with bizarre mapping schemes. Let's hope not :)
>

Agree

Regards,
Peter

> Andrew
