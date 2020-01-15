Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7344406lff;
        Wed, 15 Jan 2020 11:25:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5+kNBEzkNqFU5fHfV9ex7p5PEPc/fjbYWWLylPJ4z43cHVcF8nBNrdhilcJCwzoXOtSLs
X-Received: by 2002:ac8:1aeb:: with SMTP id h40mr143759qtk.269.1579116357666;
        Wed, 15 Jan 2020 11:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579116357; cv=none;
        d=google.com; s=arc-20160816;
        b=rvHES8Wp7bflJIWWjMPT1jnMchuXEhpkSa/u1vKv5Ap4OZkza98CL77zA3gOlvqziE
         exeHpT4sjk233xDRLFgBq34lZug6J8R5lRdUe1cRK3Q8cIMS29GCJ/8js0V1qmniBbhW
         ObdAkxOwSL2udlA3Q+sliq527EaMoFSkpUO5CVZ4epOaVdG4gQpYtpD35hmrb+iBQ9nl
         eEy5JAekEtSk/MIwgw0VZzCE1IZ8G5Mh5/VKoU/n3Ka0f5Y1STW0wrdNWFD24D3Gu6gw
         rUBBnxf5pTDIkWLsgZsjOZBH9/Hw7fMgI2rRRgrVaLBoajKUdoyhXpNTJTRF9zYA5aQX
         vsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UkBLISk3oh0poTz7Y/TmFshjgUQCaI9yfJABFuKUAOo=;
        b=V+axGnR3TwCwt3Zwb6FP37t5+FThsCFEzvMB7ESeQDOSQB55ccbbJ1iAlcEt5RizjG
         ooqA5wn7/Y7dn2dwlP/9Q2t/m9xw6mwLVvtOFXOdG/JsBmlN28Xpgy9axxW3JkWbO8g4
         VU18yaVyqHqpRBCyGzrTxGfHcya1eaWintZ3wgESN5r3ZQaCWHEjKqoX777Fj2nCWlkf
         jaFxv4OhVv41eEyAhdVHzFzzQkZlWsUkSVPhhvB3WUqayop8+1S4s9KaFUBsbhF7KsbS
         fC+qb5XTeyO5LgezKKPTKIzEHS7+/Iln8qteiNPCqMt5qGfhgMKKDexH1djBpf7Tpwjz
         EAmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JV0Kk8UV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si11601386qtj.91.2020.01.15.11.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:25:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JV0Kk8UV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iroIe-0001E6-Tv
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iroEm-0003lt-Lw
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:22:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iroEi-0002DH-Ug
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:21:56 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54794
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iroEi-0002CD-R4
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579116112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkBLISk3oh0poTz7Y/TmFshjgUQCaI9yfJABFuKUAOo=;
 b=JV0Kk8UVnMX06/s8Hyds+vDOQWJiyNcmadRqzwy9i5zpSearocMb/pEw9NPjl+hd/MMhUE
 hv1SMwwfAWxRN3Dsy+9DGIDYJK9END6YTqeJS6EtozqDqItvrAHHe0tDZjKXRio7RFojSX
 qyW4obDuK7mkWVI1htSXhw+e2BWj21U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-Xkbg80d5Ou69nFd5OHczTA-1; Wed, 15 Jan 2020 14:21:50 -0500
Received: by mail-wm1-f70.google.com with SMTP id w205so295117wmb.5
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yMhSesZBUDFIkOgoBd1DJGg56X/JlXNd5L2CPlOPFa4=;
 b=A8bSXhVrtkIGNTBn3Pk4K9A+4tuj1iTAIGgrGuQLZueq5CCphJJ2uu8uAfuYTW01lG
 XCZo66AF62hM1zmshF/Of6ferwfMjG0ebCLEKTHUVu0KuY+bGFhe6DQ+e9jZdSmgn77o
 Rgw88r2qgaQmrAeqXTxfGcM1qhclRWsoAMsjYHujCHO0wsaqG5k+zcWCwJE4fXFRV03U
 b+65oC32H01CDIfGzmPAgNwKmlGSC5tvIi7rkfzBZDSKmaqF+jpFrUrpR9ln0ptyyNkG
 +DI71FeV5d5ZmgAOe8VlE+39c3ww8hClRBfZ7sS8LuZ1qwbSg6g1RMW4EvtpN5V8sO/A
 Ym6A==
X-Gm-Message-State: APjAAAVu6PunuHEIyJCHBngceFkD3rQ4fxrYjy7nwHeW6K+Cuvp5pBk7
 jHGXlgBjhw3R/Cp9iD6FAyhn4dMBI/A1sCSvg9gkHKR1yHUV8GM3ifzr3VYLFMtQ7yeAFzTomzj
 vu8dgFNZ77Cov
X-Received: by 2002:a7b:c151:: with SMTP id z17mr1546114wmi.137.1579116109802; 
 Wed, 15 Jan 2020 11:21:49 -0800 (PST)
X-Received: by 2002:a7b:c151:: with SMTP id z17mr1546092wmi.137.1579116109619; 
 Wed, 15 Jan 2020 11:21:49 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id x18sm25975069wrr.75.2020.01.15.11.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:21:49 -0800 (PST)
Subject: Re: [PATCH v2 37/86] arm:xlnx-zcu102: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-38-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <67822ed4-e957-b005-cd4d-477d539fd82b@redhat.com>
Date: Wed, 15 Jan 2020 20:21:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-38-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: Xkbg80d5Ou69nFd5OHczTA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: alistair@alistair23.me, qemu-arm@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qa5tTQl7Zv46

On 1/15/20 4:06 PM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>    MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: alistair@alistair23.me
> CC: edgar.iglesias@gmail.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>   hw/arm/xlnx-zcu102.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 53cfe7c..bd645ad 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -28,7 +28,6 @@ typedef struct XlnxZCU102 {
>       MachineState parent_obj;
>  =20
>       XlnxZynqMPState soc;
> -    MemoryRegion ddr_ram;
>  =20
>       bool secure;
>       bool virt;
> @@ -87,13 +86,10 @@ static void xlnx_zcu102_init(MachineState *machine)
>                    ram_size);
>       }
>  =20
> -    memory_region_allocate_system_memory(&s->ddr_ram, NULL, "ddr-ram",
> -                                         ram_size);
> -
>       object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->=
soc),
>                               TYPE_XLNX_ZYNQMP, &error_abort, NULL);
>  =20
> -    object_property_set_link(OBJECT(&s->soc), OBJECT(&s->ddr_ram),
> +    object_property_set_link(OBJECT(&s->soc), OBJECT(machine->ram),
>                            "ddr-ram", &error_abort);
>       object_property_set_bool(OBJECT(&s->soc), s->secure, "secure",
>                                &error_fatal);
> @@ -211,6 +207,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClas=
s *oc, void *data)
>       mc->ignore_memory_transaction_failures =3D true;
>       mc->max_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPU=
S;
>       mc->default_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS;
> +    mc->default_ram_id =3D "ddr-ram";
>   }
>  =20
>   static const TypeInfo xlnx_zcu102_machine_init_typeinfo =3D {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

