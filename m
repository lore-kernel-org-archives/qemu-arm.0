Received: by 10.25.159.19 with SMTP id i19csp120743lfe;
        Thu, 14 Jan 2016 15:34:53 -0800 (PST)
X-Received: by 10.140.167.86 with SMTP id n83mr9595978qhn.41.1452814493047;
        Thu, 14 Jan 2016 15:34:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f128si9912651qkb.32.2016.01.14.15.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 15:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJrPo-0005BU-Kz
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 18:34:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJrPl-00059Z-Vz
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 18:34:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJrPl-0007vd-5k
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 18:34:49 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:37965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aJrPj-0007vN-9r; Thu, 14 Jan 2016 18:34:47 -0500
Received: by mail-wm0-x233.google.com with SMTP id b14so383147wmb.1;
	Thu, 14 Jan 2016 15:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=2qZvZ1lNe4c2ld4HGzE+secumL0ZNEE7iB0yxRLHzYc=;
	b=QyatfGgr2xiX6YOnGEWXGrpQ8yvesaLsvj75jE2lvtQk3oENEFRvZ/hP2HqN1SJUYR
	kDbn9N8w9m7MAmFDxnahvBAvHuRE3epd7Y1MvDUZl+qn4sKfv5scxLNPoifjTKlHWUgA
	J/AcvG8twrZyg1Tm9f+IaBqaFV9Ch+b495rUapHzI2XsiO5I+9CJi10YNKhFFbur3W1P
	pL9qnSX86vlWRrZUuIsmPnC3WpdQ8DywTY+g7AM6N4Jjy+DA8psF5QR7S3VJLxNdgTtA
	1OgaVIwKC9pJmjB0dTjbjzgYTNJxNEhiwYqdMxu1jdJC+T7un+XEnYhjjaMK9nIqVyTK
	Z/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=2qZvZ1lNe4c2ld4HGzE+secumL0ZNEE7iB0yxRLHzYc=;
	b=EB3B8cXbr9bYNk7LKcGxB2LBCFXkcBjHiycAKVUxWxZByeR+jVIo/01mgmRnyMv2O0
	pcqf6ILUE/1aqoBg99djw5A3nlcZZr4BxUVaZfwCLbHUyTnCBswHM2igMUa45ZaHZru3
	Me4qFRTSg8CwK82ycydL6zmaHTTru7Sd5qEJ+UBmZ3km7JDnfa2E3A0l/nkhfMF3d9T5
	W6yd/V02jofyf3GPV/PIOEQieiGs4/DqGldpr2rrdQWhm18iITwt0a3ReaeA6bZL6y5e
	oTeYr4s4EdtuHOxlSWVg3+TJL2ZECFXTeQUjLi6UExJJOPyMmpDPUh3ztbO8Sit6Ujtc
	gWkA==
X-Gm-Message-State: AG10YOShYc9zr3QwpIUfIS3KtQuGidpqT81LwTQFPPv5WmZp2GnoSJKa/EPZCn5pE022lBFlJLxTY4/uK/sw4w==
MIME-Version: 1.0
X-Received: by 10.28.217.83 with SMTP id q80mr24474wmg.15.1452814486530; Thu,
	14 Jan 2016 15:34:46 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Thu, 14 Jan 2016 15:34:46 -0800 (PST)
In-Reply-To: <BLUPR0301MB20344588F72A1870A14A673A9ECC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035753.GD3308@pcrost-box>
	<BLUPR0301MB2034BFDBF9CE361133F26B8E9ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=o8x9fRw7K-nfdhSVB=8De9bMi9tZiUq54cevvjNSDP2A@mail.gmail.com>
	<BLUPR0301MB20344588F72A1870A14A673A9ECC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Thu, 14 Jan 2016 15:34:46 -0800
Message-ID: <CAPokK=p44X=0Dymr3BhbKTTf3Gx00tPGJO=B2mCki2TPCh0ZHA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: Stefan Weil <sw@weilnetz.de>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>
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
X-TUID: vr5dtIz0Q+F5

On Thu, Jan 14, 2016 at 3:04 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi Peter,
>
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Tuesday, 12 January 2016 16:44
>> On Tue, Jan 12, 2016 at 3:53 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> >> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> >> Sent: Monday, 11 January 2016 19:58
>> >> > +    /* Allocate and map RAM */
>> >> > +    memory_region_allocate_system_memory(&s->ram,
>> >> OBJECT(machine), "ram",
>> >> > +                                         machine->ram_size);
>> >> > +    memory_region_add_subregion_overlap(get_system_memory(), 0,
>> >> &s->ram, 0);
>> >>
>> >> I thought the SoC handled this now? Why do you need to add to
>> >> system_memory?
>> >
>> > If I don't map it here, how do RAM accesses from the CPUs work?
>> >
>>
>> Do the CPUs not have their AS'es connected to your custom ASes by the So=
C
>> layer?
>>
>> > Or are you saying that I should still do this, but do it in the SoC no=
t the
>> board level?
>> >
>>
>> I was hoping we could get away with 0 use of system_memory.
>
> On further investigation, I don't think it's possible to wire up CPU ASes=
 explicitly. There's no obvious property to set. Each cpu->as is initialise=
d to point to address_space_memory at the top of cpu_exec_init(), and there=
 is no way I could see to override that.
>
> I think what I have now is pretty clean, but if you'd prefer to do the ma=
pping at into the global AS at SoC level that's fine with me too.
>

If it cant be done yet, what is here is a preferable approach. PMM has
some work on list for CPU ASes that may be realted, moreso for the
secure attributes though I think.

Regards,
Peter

> Thanks,
> Andrew
