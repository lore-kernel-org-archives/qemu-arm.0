Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7347715lff;
        Wed, 15 Jan 2020 11:29:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqylwgc1e30L7WRKZXGJHVwJ8AwEpkdTfsH0eJXx7xRTkja8EXiL6KZVgw34oC5j6H4AbZ9g
X-Received: by 2002:aed:3be1:: with SMTP id s30mr165166qte.163.1579116556184;
        Wed, 15 Jan 2020 11:29:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579116556; cv=none;
        d=google.com; s=arc-20160816;
        b=n7rlazFbkLZ4tUk2RgiRWrUq/7a2wWy9ama1/eFqng+jWO87rO+K7I9J3B9u7XAtKt
         wmc13teTOBmVmtXTVogUaiCYCwv9b+v8RzvDN+vTFeClNeOQNPi09y8pXeNN1Hn3Myq0
         tbT9wNkOa1IBf7+eVKahQChnFThAJy4vIn8qtDO0SJHO6ySNX/VJbBcvI0qYo+Slu5Zo
         k/s2yP7ZSGJRZPz6QM9x+tg/MKmbhbv3HJG3CzCTGC6OorqyRLhxdA8FMAuudOs84zMa
         6mefv9mS4hbhj5fy0neOgBKLFlHhKG1YloM+pTH2HqDHlZKbvKp93PjKuQhrRYk/cNYl
         VdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=a1G9F6OaC6r8VcMdrUFe/BQIWU0G0oM1nX4/KoUtdok=;
        b=xkaXmiyQhrqMM/jyrLmLEE+rzaPWSgI86erdxHuzA5Pih7BUq909yLON+FhJTGco9i
         rHgPAFP3OTQzLECJSFCNMdXPT9HinUGYZ3e/ucGObgjse8wpFhGjcRl+jOZx6tQ20/FR
         3U34Jfl5qXhDXUqMsjXeitfJzjGhKXYtpu8VeTcr0Z2JSxO3+7EWyOCe8B1rO+bGPm4t
         cfdfXDxYegQZ8tigvh8ymdAsh5Q+tfHCUM8Eq86iMgH8KO7ymwkg9URpohg4glJK4Llk
         aPa+tX8kUwhzfX8bpzLqJLf0ddZXTpSQSzgCWr7mjChvXiallP4Va9hptJTiG+nPRE0w
         fCAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y9SbY4lJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si11390764qvu.53.2020.01.15.11.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:29:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y9SbY4lJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iroLr-0006RE-Hr
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iroBl-0000Rf-7s
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:18:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iroBi-0008Jo-9Y
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:18:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iroBi-0008IU-6P
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579115925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1G9F6OaC6r8VcMdrUFe/BQIWU0G0oM1nX4/KoUtdok=;
 b=Y9SbY4lJ19URlUw0HGfCW9xalcrC4Xzrr3e3A4NAruAOo0StjXDrEasJKZvbd38kg7dllS
 9kwPWXxbbvMsVBd54ehuO8S9IawrlamppZsjLfcZk3Zl32kABu8QZ7pCA5ysdalClk9uAv
 tcvJluzK9nbNPH5L1ffXZ2xpeljJN2U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-jj6JTmmrPSi_Aixao-EduA-1; Wed, 15 Jan 2020 14:18:43 -0500
Received: by mail-wr1-f72.google.com with SMTP id w6so8295384wrm.16
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vXDQhNlLeoCnvPYVearnv8QPy7p0K1LW31op/Zn5Eyo=;
 b=NONXKX42F1ATRINau+QJdwA9lLz3zsJapqje1ey+Tj99QX3kWRuyCuxJ8tHt7qO5l1
 tEHM8SPm2ZWcMibLh/ieXUy9dJhNgLGUI1wWE1mm1OtWd16aZ0x5y5MGjHKRNvHXSk6W
 RGH8XrNxEz2TSSJ8LWjzKssHrbx2saHq1IFNM6EPlBf9EZ4dQ7H8pDPWWrZV3ogInsls
 0dvCJnWCI1oIB6FryDSA81PH2Uz3orufy8nQSZLYsB9VNLRg3nTW3epgJz5Mwf8Iil96
 BTQ+RVlmFRJMb70oHErHCw9qh7ycRH8XoJoFxMZ7sbBYD80BxeDeV+B/qZkCzlz8y6FE
 mc/A==
X-Gm-Message-State: APjAAAWlzav4REBZ/Zxk2VxcJJnVtfz6yu4fxFDw3DK7SQ1QMe9nXS86
 eCI4Xz1Yywrfm4VDubVQ+P/cDJwqwPe2yRow9oC651T/Y905g9XLxYy+T96wa1WvrpnJtLm0JCw
 gi4D6wZZyYlCb
X-Received: by 2002:a1c:e108:: with SMTP id y8mr1489393wmg.147.1579115922617; 
 Wed, 15 Jan 2020 11:18:42 -0800 (PST)
X-Received: by 2002:a1c:e108:: with SMTP id y8mr1489375wmg.147.1579115922441; 
 Wed, 15 Jan 2020 11:18:42 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id a1sm1095094wmj.40.2020.01.15.11.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:18:41 -0800 (PST)
Subject: Re: [PATCH v2 14/86] arm:highbank: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-15-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1177e3ef-6c18-b6e7-d96f-bfb7a906250f@redhat.com>
Date: Wed, 15 Jan 2020 20:18:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-15-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: jj6JTmmrPSi_Aixao-EduA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3+391M6vKFKT

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
> CC: robh@kernel.org
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>   hw/arm/highbank.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index 518d935..ac9de94 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -236,7 +236,6 @@ enum cxmachines {
>    */
>   static void calxeda_init(MachineState *machine, enum cxmachines machine=
_id)
>   {
> -    ram_addr_t ram_size =3D machine->ram_size;
>       DeviceState *dev =3D NULL;
>       SysBusDevice *busdev;
>       qemu_irq pic[128];
> @@ -247,7 +246,6 @@ static void calxeda_init(MachineState *machine, enum =
cxmachines machine_id)
>       qemu_irq cpu_virq[4];
>       qemu_irq cpu_vfiq[4];
>       MemoryRegion *sysram;
> -    MemoryRegion *dram;
>       MemoryRegion *sysmem;
>       char *sysboot_filename;
>  =20
> @@ -290,10 +288,8 @@ static void calxeda_init(MachineState *machine, enum=
 cxmachines machine_id)
>       }
>  =20
>       sysmem =3D get_system_memory();
> -    dram =3D g_new(MemoryRegion, 1);
> -    memory_region_allocate_system_memory(dram, NULL, "highbank.dram", ra=
m_size);
>       /* SDRAM at address zero.  */
> -    memory_region_add_subregion(sysmem, 0, dram);
> +    memory_region_add_subregion(sysmem, 0, machine->ram);
>  =20
>       sysram =3D g_new(MemoryRegion, 1);
>       memory_region_init_ram(sysram, NULL, "highbank.sysram", 0x8000,
> @@ -387,7 +383,7 @@ static void calxeda_init(MachineState *machine, enum =
cxmachines machine_id)
>  =20
>       /* TODO create and connect IDE devices for ide_drive_get() */
>  =20
> -    highbank_binfo.ram_size =3D ram_size;
> +    highbank_binfo.ram_size =3D machine->ram_size;
>       /* highbank requires a dtb in order to boot, and the dtb will overr=
ide
>        * the board ID. The following value is ignored, so set it to -1 to=
 be
>        * clear that the value is meaningless.
> @@ -430,6 +426,7 @@ static void highbank_class_init(ObjectClass *oc, void=
 *data)
>       mc->units_per_default_bus =3D 1;
>       mc->max_cpus =3D 4;
>       mc->ignore_memory_transaction_failures =3D true;
> +    mc->default_ram_id =3D "highbank.dram";
>   }
>  =20
>   static const TypeInfo highbank_type =3D {
> @@ -448,6 +445,7 @@ static void midway_class_init(ObjectClass *oc, void *=
data)
>       mc->units_per_default_bus =3D 1;
>       mc->max_cpus =3D 4;
>       mc->ignore_memory_transaction_failures =3D true;
> +    mc->default_ram_id =3D "highbank.dram";
>   }
>  =20
>   static const TypeInfo midway_type =3D {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

