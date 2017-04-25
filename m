Received: by 10.25.0.144 with SMTP id 138csp1789281lfa;
        Tue, 25 Apr 2017 03:05:06 -0700 (PDT)
X-Received: by 10.55.176.7 with SMTP id z7mr28058406qke.182.1493114706362;
        Tue, 25 Apr 2017 03:05:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s41si21481933qtg.168.2017.04.25.03.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Apr 2017 03:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d2xLF-0001rh-RR
	for alex.bennee@linaro.org; Tue, 25 Apr 2017 06:05:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d2xLC-0001qw-9H
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 06:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d2xLB-0003Vs-D9
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 06:05:02 -0400
Received: from mail-yb0-x232.google.com ([2607:f8b0:4002:c09::232]:33930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d2xL9-0003VM-6g; Tue, 25 Apr 2017 06:04:59 -0400
Received: by mail-yb0-x232.google.com with SMTP id 11so63206743ybw.1;
	Tue, 25 Apr 2017 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9jdsP5JjPOquyJRvTCaF4T+CqpYYw3l92dLni1UkEDs=;
	b=jpGx58ZSDz+7hFdsgUnqiAoUycYDiw+gvacoI2HetKdundmSHQLNpTATpdQPKWA1pF
	Fhk0ZqFGY+PRcFQfxKOC7JGjsAvSCnEj1l4VJnoZP9ILuarJu+N6au4sdrdmiVv50DTQ
	Kqzoijgc+ATNooGoCITFx3Xl5Z6lExC+T5LvBX20u2hZOahnfm5/ZrMvneNUwHoVcDCr
	6H+Unj4lf33FX7laCg0AQnfZP1hJMn3XzONgfzLAf6YE+IYcthdhXEhvFmlmX9uxnMr6
	H2MA+3vCVqfI4HCCqf1F65uERP6zd7OYfthWxZ4BVL0ImE8KrUerdDgVoKghmDXUoWwR
	yx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9jdsP5JjPOquyJRvTCaF4T+CqpYYw3l92dLni1UkEDs=;
	b=XWHunDHEnqV2NkqoGM8H1GPqe5+SmhjBJ6lsMyVFs9CbRFgz0FPNJrwq/QpdAJOgct
	fo5ZBtKhXDWs03qCnJGsAl6O7frOiocDaqixS12Nh98wigI3b9oRhn5IL535lJl5oTGO
	garZ1a1HcVin6LdDc84JipC+makei7wzUzYlrkbZgT1hdwLRZx4FHZCrPCzBLAVWtEff
	X/Y4TwfPsN8mNyIN7RR9M1BQlBd3hQ6FbUwnfUuKK85Z0/9sPKvWGvivXPVx119n2Meb
	bsJ4ZoqBgxkf7sa7VLu+OFsSOvwQmAhIbIGYGO91bMGK43CWKc1wfx6lz7DxBkyvYIhU
	hrXQ==
X-Gm-Message-State: AN3rC/7Ko7n7blPpsbmQ5uhpYQBiPZz74JT5vVzk9fKSP3jWkItr7Tob
	neHxi/L4unk6SCEOSaPeu4gKXPVSDg==
X-Received: by 10.37.171.19 with SMTP id u19mr7913050ybi.196.1493114698142;
	Tue, 25 Apr 2017 03:04:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Tue, 25 Apr 2017 03:04:57 -0700 (PDT)
In-Reply-To: <CAKmqyKOMyR+DH8F4OUgZjzeM-CmXVurwQwWKGKLOUj68jAuzqw@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<1491736758-19540-5-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPAwL27-ina2X4DUJ-x_POTqRdf5HAr1mNUVYQBeUAjPQ@mail.gmail.com>
	<CALHRZuo3s-NRXPpJvfkkaf7FzNoyv2uSmox-nhycSz1x+r6fGg@mail.gmail.com>
	<CAKmqyKOMyR+DH8F4OUgZjzeM-CmXVurwQwWKGKLOUj68jAuzqw@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 25 Apr 2017 15:34:57 +0530
Message-ID: <CALHRZuqtGZDxEgBTs4NbgSed0OwPLO4ns8zC2oXwC-CFMrGj7w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::232
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel RFC v2 4/4] msf2: Add
 Emcraft's Smartfusion2 SOM kit.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uwNAI5sOqy8T

Hi Alistair,

On Mon, Apr 24, 2017 at 11:23 PM, Alistair Francis <alistair23@gmail.com> wrote:
>>>
>>> Instead of calling all of these in the init function you should split
>>> it up over the machines init and realize function.
>>>
>>> Look at the stm32f205_soc or xlnx-zynqmp files for examples of how to do this.
>>>
>>> It also moves away from calling qdev_create() and qdev_init_nofail()
>>> and instead manually creates the objects.
>>>
>> I am still learning all these. Please correct me if am wrong.
>> I need to create a SoC file and a board file like stm32f205 and
>> xlnx-zynqmp now right?
>
> Hey Sundeep,
>
> I don't think you have to do it like that. I think for some
> SoCs/boards it makes sense. For example the ZynqMP SoCs are included
> on multiple different boards (EP108 and ZCU102) so it makes sense to
> have a SoC and a board separately defined. On the other hand if you
> had a SoC that is always on the same board it doesn't make as much
> sense.
>
> It is probably is a good idea to split it between a board and an SoC
> unless you have a good reason not to though.

There are multiples boards with the SoC. I will split into seperate files.

Thanks,
Sundeep
>
> Thanks,
>
> Alistair
>
>>
>>> Otherwise this patch looks pretty good.
>>
>> Thank you :)
>> Sundeep
>>
>>>
>>> Thanks,
>>>
>>> Alistair
>>>
>>>> +}
>>>> +
>>>> +static void msf2_machine_init(MachineClass *mc)
>>>> +{
>>>> +    mc->desc = "SmartFusion2 SOM kit from Emcraft";
>>>> +    mc->init = msf2_init;
>>>> +}
>>>> +
>>>> +DEFINE_MACHINE("smartfusion2-som", msf2_machine_init)
>>>> --
>>>> 2.5.0
>>>>
>>>>
