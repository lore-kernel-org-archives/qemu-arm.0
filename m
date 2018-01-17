Received: by 10.28.173.206 with SMTP id w197csp5482333wme;
        Wed, 17 Jan 2018 08:45:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBov35XgJVg4vg6zkvy1FpUp+SnoPLcWdTt5fN7/fRoh9Ts2rW3xSPaWHej1LTRzObNMmRhSb
X-Received: by 10.129.91.196 with SMTP id p187mr3115936ywb.347.1516207538477;
        Wed, 17 Jan 2018 08:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516207538; cv=none;
        d=google.com; s=arc-20160816;
        b=R3xxpsVJYLgTZGuNgsUFx2GII/anOySTvp5lXeQnqNm78CfbOuhENVrbmZw+bn2oY+
         Lj8SkXwAdKzRNcAoS3JvH0L9sdGqkBGxRufC/dH3VQyKoFMDK1ZsrTRHM1xpYmryWn4l
         wcLAYhe9a4+rTSYphLopOjB0U8/pJUw8/rlhUM2PM9qBbONThynNf+W14J8KBe1z3aKI
         MR1uqkOAgLei/YLa23R9KzKojB7hJrAzOEMh2gDtoe8tKm/CvKeL4GwOA6tzmCBPr2oW
         IUDefXGpLzxhkNGpJp4n1US1sKpU7TXdfQGX81IklC8NlraHi4OQb0/JY43n1B2LdvQU
         Z3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=1Mo0ignJgVKiW99tdElHw0eeREP1VEPmfZxYuhODugU=;
        b=x0mq1Ft1RNDpyvyk+HUmPliv1QNWSFcGHn34efsiv4kbhFPMHdYyrWjj1BryIsuxmS
         4zdSN39MwZcomvzZa1VdvWsL83kLac5VJJsoEjgotKCSTlj7n/5fopgtP/ihSJDrmmxb
         QDzMjO0byapvPqf72mR7zo/IVcqYWYxR4Q9wnSsJeauGB4TBDuFIi4QidrMGX/hAiHsc
         Ew1OO4ZJ4GfVZ19n8L9IReHIMxsTN2xUIeuR8JU7nsF48J1V/1xpUxOistT5SXmGtnM6
         cNSLD/UtUJF4yKidUl7DSKUiklKn0A9zK7pNvnwpRnv1rfo9UVDXgqjm/z0Izju38flT
         fxVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p75si1272454ywp.76.2018.01.17.08.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 08:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebqqH-0000FO-QU
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 11:45:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1ebqPs-00011I-69
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 11:18:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1ebqPo-000587-0o
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 11:18:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1ebqPj-00055j-31; Wed, 17 Jan 2018 11:18:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FB074D2D1;
	Wed, 17 Jan 2018 16:18:00 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3D3917C5C;
	Wed, 17 Jan 2018 16:17:40 +0000 (UTC)
To: Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-10-andrew.smirnov@gmail.com>
	<CAFEAcA-hEgWp58nte89Vs6nZnp4wA6_f8-Vaovm2hiJe9SWwHQ@mail.gmail.com>
	<b9661e65-5fb2-46b5-b082-6e768afff7bc@zoho.com>
	<CAHQ1cqFknfW0NmiD-3GFJRedgVE-9bacKhm-pYx0ycviRsmucQ@mail.gmail.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <d060a7d9-b87e-df81-d601-f4cd538a0a88@redhat.com>
Date: Wed, 17 Jan 2018 18:17:27 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAHQ1cqFknfW0NmiD-3GFJRedgVE-9bacKhm-pYx0ycviRsmucQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 17 Jan 2018 16:18:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 09/14] pci: Add support for Designware
 IP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wh1YXqi2ATtE

On 17/01/2018 18:12, Andrey Smirnov wrote:
> On Wed, Jan 17, 2018 at 7:23 AM, Marcel Apfelbaum
> <marcel.apfelbaum@zoho.com> wrote:
>>
>> Hi Peter,
>>
>>
>> On 16/01/2018 16:34, Peter Maydell wrote:
>>>
>>> On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com=
>
>>> wrote:
>>>>
>>>> Add code needed to get a functional PCI subsytem when using in
>>>> conjunction with upstream Linux guest (4.13+). Tested to work agains=
t
>>>> "e1000e" (network adapter, using MSI interrupts) as well as
>>>> "usb-ehci" (USB controller, using legacy PCI interrupts).
>>>>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> Cc: qemu-devel@nongnu.org
>>>> Cc: qemu-arm@nongnu.org
>>>> Cc: yurovsky@gmail.com
>>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>>> ---
>>>>    default-configs/arm-softmmu.mak  |   2 +
>>>>    hw/pci-host/Makefile.objs        |   2 +
>>>>    hw/pci-host/designware.c         | 618
>>>> +++++++++++++++++++++++++++++++++++++++
>>>>    include/hw/pci-host/designware.h |  93 ++++++
>>>>    include/hw/pci/pci_ids.h         |   2 +
>>>>    5 files changed, 717 insertions(+)
>>>>    create mode 100644 hw/pci-host/designware.c
>>>>    create mode 100644 include/hw/pci-host/designware.h
>>>
>>> I'm not familiar enough with our PCI code to be able to review
>>> this, I'm afraid. MST and Marcel are our PCI subsystem maintainers --
>>> could one of you have a look at whether this seems to be a correct
>>> implementation of a pcie host controller ?
>>
>>
>> Sadly PCI Host bridges do not have a standard, each HW vendor
>> can do pretty much what they want.
>>
>> That being said, if Andrey can point me to the PCI spec for the Design=
ware
>> PCI host bridge and what parts they implemented for it I can have a lo=
ok,
>> sure.
>> (I will not be available for a week or so, but right after)
>>
>=20
> Just in case you still want this:
>=20
> To the best of my knowledge, Synposys does not provide specification
> for their PCIe IP to general public and I am in no way affiliated with
> them, so I don't have any backchannels to get it any other way.
>=20
> The next best thing to an actual spec, that I found to be pretty
> useful, is PCIe chapter of i.MX6Q Reference Manual
> (https://www.nxp.com/docs/en/reference-manual/IMX6DQRM.pdf   page
> 4049), which is what I used to implement the code in question.
>=20

Appreciated.

> Last, and probably the most important, "source of truth" was actual
> Linux PCIe driver for i.MX/Designware which I used as a sort of
> inverse reference implementation.
>=20

We did the same for our PVRDMA device implementation :)


Thanks,
Marcel

> Thanks,
> Andrey Smirnov
>=20

