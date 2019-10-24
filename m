Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2274044wrq;
        Thu, 24 Oct 2019 05:20:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzL0ZiAvdWvmxX3AnxWHJjX8+Wu40hXr+OPSyC/ZomtH6OYbbsVVpP8HNJ73vTQbonq0B/u
X-Received: by 2002:a50:b558:: with SMTP id z24mr29779604edd.67.1571919656773;
        Thu, 24 Oct 2019 05:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571919656; cv=none;
        d=google.com; s=arc-20160816;
        b=Q47HJb4Re/kEYbAdM9s/H4rB5NxsRHqHbgVNBneoB+q3vkVzJZidfSXnUwGLnmXbdZ
         VypD6lPAcwD9BQT+aHYMK0DFgSO3j2cCcNWA8Em9yP3Zeq1XrPXAz68hY8T9kSHGH+6Y
         Ff0nmk2fokKgVSDUF6wZANnQ2H2gLqn/tlGDYU8ZRhVvm1tpkBxNfZFSJVvbKxLAQyxg
         CW/XNXDi1IM4K5bHmYq23jFt62hBglZOYf8ONVIHwUm4doEIEvxS6fyTO+O345J/tb2W
         gF+K3oNvjr2I0XfU3pV24vmdQUG5cdxhHmkQnA/Ww8ihuOZieVA7isr0UNJ8SbmmoM/4
         z3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=m6VEKeFoBc+AppoLi2hfrgmxK9Y9W+LfT5fBq/2xbdU=;
        b=d7O9hlme0XdPdi+XecY8QwMht0i90oQ8VmGHrWUCx2L7LwEcNc5F0tzNQpLIdlWHxV
         jEHlNPqlvKvFVF+e/nbS6BEjPsm5A4acGf7wJl0uNKuI5IByPsgNyuI8M3qFFYTWwluf
         bo2mNxijnVVQntqGgSPycVG16nND1trtRzULjTjnyltILH1MAZMArs1hMQkhJEL3/lGI
         lOhtN7uk0/28ypQ0vYoqNBFVa0J28wDTYtz9hSUzx/LYYK+y8VsDe5pNcxf7eopv2NNb
         HULSu4l8hdu7zSw/QRy9fHdxBJik6x1um7mb8VVot4rtJGwtK0urVbpgh7mX4qY6inNG
         q+pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr15si6723695ejb.274.2019.10.24.05.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 05:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNc6o-0003Ko-S5
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 08:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNbbQ-0003Ve-By
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNbbN-0007tH-W6
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:48:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54090)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNbbN-0007mp-Ob
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:48:25 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 469EB59455
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 11:48:16 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id f4so12710724wrj.12
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 04:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ltgiqHhNHaXdrzNuL6lkoiWjNGQwyyjMPT5XIbOJzU=;
 b=FcA2HVN8OMCMvS7EI+onmQnsZbJFTxjNd3n5htXekeGABfVvgakmrYkqZBnU0+xUUx
 L1SRUMvPhNkDR8surN5bMDft13KUMY1VrnkulpbtuyNObdB1XokYO+GMT3fJRaXjvrxw
 UwPQ6EzIcvRQ8/Ng6C6pSpO0ukCrS7SRIo7bbPDUn7senNilaLk7uJE7ZPUhbYS3wfQf
 5Bd1QL0dcsnV4ZCLec2h+X6eEqDTB+4yM41wqYU0vIeeqphusQxK0SC+jsC3PAwWBz72
 XMZgWlkQ/wW//wHG/luXxbn+4vXbmTfnwGtOyW8nLXvudy73pz5kCy18n/w7RtTkcnaa
 Rj+g==
X-Gm-Message-State: APjAAAXrUJZNIK7mc+qKRRl9mbmsI8Uo2m/SOkpVmOczrUSIcukGa8Cn
 i2nDVQ3sPpZ+jPTlrXwi3qhzBZXpMkRF2EtBuYVVODqd9c0+kZXC/G921Khrf+hQzo2AwD6K23/
 E1JJxsj6yfnow
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr4839669wmk.100.1571917694947; 
 Thu, 24 Oct 2019 04:48:14 -0700 (PDT)
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr4839587wmk.100.1571917693909; 
 Thu, 24 Oct 2019 04:48:13 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id d8sm11646908wrr.71.2019.10.24.04.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 04:48:12 -0700 (PDT)
Subject: Re: [PATCH v3 23/33] dp8393x: replace PROP_PTR with PROP_LINK
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-24-marcandre.lureau@redhat.com>
 <06288994-a5d3-038d-794e-ed63acdadd95@redhat.com>
 <CAMxuvawLDSsNkoSXNprXAWVZ13FZT_WZ5V3AXyN0euT9SKa1DQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c4d77b9a-1eac-a05f-a26b-bed097667a1f@redhat.com>
Date: Thu, 24 Oct 2019 13:48:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMxuvawLDSsNkoSXNprXAWVZ13FZT_WZ5V3AXyN0euT9SKa1DQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m3m+dut90pDq

On 10/24/19 1:12 PM, Marc-Andr=C3=A9 Lureau wrote:
> On Thu, Oct 24, 2019 at 1:02 AM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
>>
>> On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
>>> Link property is the correct way to pass a MemoryRegion to a device
>>> for DMA purposes.
>>>
>>> Sidenote: as a sysbus device, this remains non-usercreatable
>>> even though we can drop the specific flag here.
>>>
>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    hw/mips/mips_jazz.c | 3 ++-
>>>    hw/net/dp8393x.c    | 7 +++----
>>>    2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
>>> index 8d010a0b6e..878925a963 100644
>>> --- a/hw/mips/mips_jazz.c
>>> +++ b/hw/mips/mips_jazz.c
>>> @@ -284,7 +284,8 @@ static void mips_jazz_init(MachineState *machine,
>>>                dev =3D qdev_create(NULL, "dp8393x");
>>>                qdev_set_nic_properties(dev, nd);
>>>                qdev_prop_set_uint8(dev, "it_shift", 2);
>>> -            qdev_prop_set_ptr(dev, "dma_mr", rc4030_dma_mr);
>>> +            object_property_set_link(OBJECT(dev), OBJECT(rc4030_dma_=
mr),
>>> +                                     "dma_mr", &error_abort);
>>>                qdev_init_nofail(dev);
>>>                sysbus =3D SYS_BUS_DEVICE(dev);
>>>                sysbus_mmio_map(sysbus, 0, 0x80001000);
>>> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
>>> index a5678e11fa..946c7a8f64 100644
>>> --- a/hw/net/dp8393x.c
>>> +++ b/hw/net/dp8393x.c
>>> @@ -173,7 +173,7 @@ typedef struct dp8393xState {
>>>        int loopback_packet;
>>>
>>>        /* Memory access */
>>> -    void *dma_mr;
>>> +    MemoryRegion *dma_mr;
>>>        AddressSpace as;
>>>    } dp8393xState;
>>>
>>> @@ -922,7 +922,8 @@ static const VMStateDescription vmstate_dp8393x =3D=
 {
>>>
>>>    static Property dp8393x_properties[] =3D {
>>>        DEFINE_NIC_PROPERTIES(dp8393xState, conf),
>>> -    DEFINE_PROP_PTR("dma_mr", dp8393xState, dma_mr),
>>> +    DEFINE_PROP_LINK("dma_mr", dp8393xState, dma_mr,
>>> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>>>        DEFINE_PROP_UINT8("it_shift", dp8393xState, it_shift, 0),
>>>        DEFINE_PROP_END_OF_LIST(),
>>>    };
>>> @@ -936,8 +937,6 @@ static void dp8393x_class_init(ObjectClass *klass=
, void *data)
>>>        dc->reset =3D dp8393x_reset;
>>>        dc->vmsd =3D &vmstate_dp8393x;
>>>        dc->props =3D dp8393x_properties;
>>> -    /* Reason: dma_mr property can't be set */
>>> -    dc->user_creatable =3D false;
>>
>> Patch is OK except this user_creatable change I don't understand.
>=20
> It's a sysbus device, so it's not user-creatable anyway. I'll add a
> commit comment.

With comment:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>=20
>>
>>>    }
>>>
>>>    static const TypeInfo dp8393x_info =3D {
>>>
