Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6336227lfp;
        Tue, 18 Feb 2020 09:10:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHkjI60HKQNG+q86S2xOoOZSUUHxhzydg2hoCGRbXJEzOqwxiVs+NRC4wHdA0/I81ssEAs
X-Received: by 2002:a05:620a:989:: with SMTP id x9mr20260700qkx.371.1582045815335;
        Tue, 18 Feb 2020 09:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582045815; cv=none;
        d=google.com; s=arc-20160816;
        b=OpKiCKVGrL2lSHLUZ5sa8JV9CzUMiAZ4WOve18ksrv8R9bpsKeZdPk+N4Qn32RhxfM
         CpL3fitKgMgiZye5vEonl+CJKweLMrm48L6MFwv892UWUsXsrJx+wWB3Y+CwKldii1/C
         ogVhsNFvQGF2Yu8T4QxnSGpq+XeZB1GWgHh2ZdkO5dEEN51LeXVWa339QsLzk8LVMRyd
         ms2VMm7IhvaKDOYUgSbJ7yuI0SW82UcxQEupAmjx78cjK28XfDdFpRRH0932NqIhkh6f
         Lgz0ldpzOh/xfx9qL/UbDc2+oI8AwLfDYeaf6jhTVmByqYWk3s5y9ZJBskE4ER6dcdrC
         aCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eLOEipOG6BV/mcfTUVfmGcKHAJZ55fXPUK6kib39XtA=;
        b=d/MdP0kGh9fSFE/Yqp3ONEy+h9x+/WY3ODrk/jaQqS58cGAWaHbbMmeze5EGGRqDHf
         xgtsHlkE1L9cTocUulz8xk2fuQwfJ2sqGlwj/HqKYlnQlwG7ubdAvwD3RrI03FSrhiBh
         UAIytmUdMEWvy2MQQgbv60yA9185mp+s5yi6Xslw3qxMeNhQvSXL27CRwPZMPO/uGbSX
         0WbVyuss37RsNskQa5YePSmcmHVrPE7UzgnuMLSoXNcCEgxwDYHGLbRgqh2zb4AIA/Vm
         eEa+FqHVifN+eFtJoL7FMLN33O4Rp9bD1dX8scF/pBXVeqTcFN0GX05mUuEYerFQnyjx
         CnFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XFi2PNt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si2250514qkg.185.2020.02.18.09.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 09:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XFi2PNt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j46Ny-0000Ro-PD
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 12:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j46No-0000Oe-Lj
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:10:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j46Nn-0004WM-3Z
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:10:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60981
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j46Nm-0004Vr-W6
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582045802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLOEipOG6BV/mcfTUVfmGcKHAJZ55fXPUK6kib39XtA=;
 b=XFi2PNt98oPjmI3zDRqvMuZOBZafnCWx24VouNuwckbqd5yc2EWfPaHPtTX9OTj0YHSiF+
 RcXi5O/VPNmLY4v8eqj341osnyT6m5zXDkjO7R2N48ZBM/rG75Z0Wg6GtoZK8etwQMRDwD
 e31X6qKYksK+woJJjJxtguxpNWJui8o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-iMIjSprKPtOR6olnhBxU7g-1; Tue, 18 Feb 2020 12:10:00 -0500
Received: by mail-wr1-f71.google.com with SMTP id t3so11080950wrm.23
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 09:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7RtQCbW0b+aKzndCbvJg3sBSxYHmJ3YBEZv7TOdcoQU=;
 b=EQxjC0hRnNQKUPxgwYrOnsjxWbEDJZrbhRZYMT9bKDHb9NLqhixfEO9pvdjAjRNST8
 /U33Qb5BSEwfmLbX76fmawW0VHu/mCtAXu7Ea05FKEa006DXkOyfZZRUyDvv8NtRZK2r
 tuO9QbZ5n1/zokrvtLybgzLbH566a0fUVoCFwYoIsVzkKF45qOXX9Wv01wEKcUEWe6td
 8C+d+jHmBHxOmk61ISDjlcrjC1JZmhZ9+FkFEbzEMqc5hqMJ6OUM2ZY9f6FM51R5Z21M
 F9F2GORXROm3Hryxqfy430BQDv3eQhfq6q8b744MN7GhYcyEHBcRIZOPH2i84ZQr4o82
 0Ijg==
X-Gm-Message-State: APjAAAUk7ABxuZfobND7aF02CiqmKc7IrSvvt9tt9FVKNkmYR8+ZrGUW
 tmbvWMDDkkMSnbsQJLgR30TfOWyKNCj6Oy5ENaRcZFi7yYWO155+fwjoOqT7jAjID5tcFz2cF58
 XRZGn0EMeUCmi
X-Received: by 2002:a5d:65c6:: with SMTP id e6mr3496482wrw.45.1582045798465;
 Tue, 18 Feb 2020 09:09:58 -0800 (PST)
X-Received: by 2002:a5d:65c6:: with SMTP id e6mr3496461wrw.45.1582045798176;
 Tue, 18 Feb 2020 09:09:58 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id j15sm7368873wrp.9.2020.02.18.09.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 09:09:57 -0800 (PST)
Subject: Re: [PATCH v5 17/79] arm/integratorcp: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-18-imammedo@redhat.com>
 <5e21adc1-a197-9d37-133c-ea510b9b9926@redhat.com>
 <20200218174117.1dab2b41@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e61ab250-1aa7-ebd4-18de-5bf8d2ba2971@redhat.com>
Date: Tue, 18 Feb 2020 18:09:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218174117.1dab2b41@redhat.com>
Content-Language: en-US
X-MC-Unique: iMIjSprKPtOR6olnhBxU7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: msydkYQfq9y6

On 2/18/20 5:41 PM, Igor Mammedov wrote:
> On Tue, 18 Feb 2020 07:55:14 +0100
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
>=20
>> On 2/17/20 6:33 PM, Igor Mammedov wrote:
>>> memory_region_allocate_system_memory() API is going away, so
>>> replace it with memdev allocated MemoryRegion. The later is
>>> initialized by generic code, so board only needs to opt in
>>> to memdev scheme by providing
>>>     MachineClass::default_ram_id
>>> and using MachineState::ram instead of manually initializing
>>> RAM memory region.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>> ---
>>> CC: peter.chubb@nicta.com.au
>>> ---
>>>    hw/arm/integratorcp.c | 9 ++++-----
>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
>>> index 0cd94d9f09..cc845b8534 100644
>>> --- a/hw/arm/integratorcp.c
>>> +++ b/hw/arm/integratorcp.c
>>> @@ -585,7 +585,6 @@ static void integratorcp_init(MachineState *machine=
)
>>>        Object *cpuobj;
>>>        ARMCPU *cpu;
>>>        MemoryRegion *address_space_mem =3D get_system_memory();
>>> -    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>>>        MemoryRegion *ram_alias =3D g_new(MemoryRegion, 1);
>>>        qemu_irq pic[32];
>>>        DeviceState *dev, *sic, *icp;
>>> @@ -605,14 +604,13 @@ static void integratorcp_init(MachineState *machi=
ne)
>>>   =20
>>>        cpu =3D ARM_CPU(cpuobj);
>>>   =20
>>> -    memory_region_allocate_system_memory(ram, NULL, "integrator.ram",
>>> -                                         ram_size);
>>>        /* ??? On a real system the first 1Mb is mapped as SSRAM or boot=
 flash.  */
>>>        /* ??? RAM should repeat to fill physical memory space.  */
>>>        /* SDRAM at address zero*/
>>> -    memory_region_add_subregion(address_space_mem, 0, ram);
>>> +    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>>>        /* And again at address 0x80000000 */
>>> -    memory_region_init_alias(ram_alias, NULL, "ram.alias", ram, 0, ram=
_size);
>>> +    memory_region_init_alias(ram_alias, NULL, "ram.alias", machine->ra=
m,
>>> +                             0, ram_size);
>>>        memory_region_add_subregion(address_space_mem, 0x80000000, ram_a=
lias);
>>>   =20
>>>        dev =3D qdev_create(NULL, TYPE_INTEGRATOR_CM);
>>> @@ -660,6 +658,7 @@ static void integratorcp_machine_init(MachineClass =
*mc)
>>>        mc->init =3D integratorcp_init;
>>>        mc->ignore_memory_transaction_failures =3D true;
>>>        mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
>>> +    mc->default_ram_id =3D "integrator.ram";
>>>    }
>>>   =20
>>>    DEFINE_MACHINE("integratorcp", integratorcp_machine_init)
>>>   =20
>>
>> Looking at integratorcm_realize() this machine seems to handle at most
>> 512MiB.
>=20
> According to
> http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.dui0159b/Ce=
geadbj.html
>=20
> it supports "optionally, 16 to 256MB of SDRAM plugged into the DIMM socke=
t"
> so I'm not sure that realize is valid reference here.
> (well I don't know anything about arm boards, but it probably should be
> double checked by maintainer).
>=20
> PS:
> It should not hold this series (as check wasn't there to begin with),
> I'll post a patch on top to add check once we decide to what limit it
> should be set.

This is certainly not a blocking comment (neither am I waiting for you=20
to fix this, I was just making a comment while reviewing the whole).=20
Sorry if this was not clear.

