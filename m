Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7343421lff;
        Wed, 15 Jan 2020 11:24:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPexNWFxpA0kf6upiicRYn2vtr+Pe4ZC61dxMKgr9y+g3paYcWJVlTKU490YsT2IvrQhP3
X-Received: by 2002:a37:2e43:: with SMTP id u64mr22837925qkh.387.1579116298268;
        Wed, 15 Jan 2020 11:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579116298; cv=none;
        d=google.com; s=arc-20160816;
        b=sV3PJG1p4NAstC9LHk9ntWVHaoJfpemEyCLlCLMUnxRqtK8JR76agq7u3syaefFHGz
         J6sU/9p+yKV1utE+Khe661xbwxVPQykT00iBRJRqcVNcbTYGnZFwI1Q/T8ABmAsvjEOG
         yhXpqGSy+DuiTwq5xxoF+HmnfnZe85JbYmN5/TmbSwGcz0hjNRYN/pEuMP7IklmrushL
         lKrOwajhSzKPVBxEBP9GxOHW74LJ5nbTLx/Qdf8ihIboHGvHeSmYNfwQN60vyU6ki22m
         oZORcsQ61LQcVPSSUZfoDqEPBexLd3W2+rXKW+R7QrJ8Fy2IFHbIaIrEEKcdN4J07l65
         hq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lr+NKYaXofPcR7RhfeN0IXT7lsyX1EfsRocFjD8LXa4=;
        b=GngXuYlp2o5h+lbQf2wBaoCZkiuwv+ovAMC9XIgqdJwwMGxvBD1eFDEprRYmtAar2G
         mvDuFtAIS4Peektn1ocZdENp/MDPhvwYctWUZ+ohPQzqgAhVEirg4xmE+etyX7i0rXGy
         uha/GuuScYRfytR3ksz0ftFCeCmuFi9nwuZDR6TSxpQfpPyp18gl+LCVGvE5GmkOCkZy
         7FFT4y8Eh9claqVwqDhw3Khh428ko/+7NTa8z4kV7IZ5716PXGhE386BsnhStt9V4TuK
         9fEWQPpK7cdPqTyRbDxTy8/vWex0TNE8MNpozfLB0UcXzOmEVlPERirfv9HtlwuBNKz6
         CSrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WeHUk40a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si11225378qto.158.2020.01.15.11.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:24:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WeHUk40a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iroHh-00086i-AS
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iroDn-0002Ik-87
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:20:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iroDh-0001Of-2e
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:20:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40895
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iroDg-0001OP-Ux
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579116048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lr+NKYaXofPcR7RhfeN0IXT7lsyX1EfsRocFjD8LXa4=;
 b=WeHUk40anFSZiCM0gyhJ7/Kf2tZMECp27ZthWi+t7z6wfs1C3PJu5DfPQTJXp1/9TXEhfK
 NW0cGX0O0x1xC5huvtr8iUXa27/QqLEtkhNVTRw/8laW+7iUQFlUu0U11vrBkb/Vz24zUb
 2JNtYeBcxjCKd0vai+bFkKXxoT0F8cg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-Dw68F8VaMvCuD5k1327YCQ-1; Wed, 15 Jan 2020 14:20:47 -0500
Received: by mail-wm1-f69.google.com with SMTP id b9so292025wmj.6
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CoCbto6KEXlFgRfezNSysfUhqWHr1+YzcWoymJRp9Ls=;
 b=GtIH6NeWDU0u9RDAVlbJALbuSxAk7KU8qh7ho1YzWK9CoDSN5EDL44k02uGzacayY+
 Ze8nBbS17ak03MDVfVEQ2OqLkeETWkOcO1QpJWdioM37SbvIGZX7QpNZHvpPFMAqHHLC
 NNPN1DUT6z+xvDxE+8qvbMG4On3JhG4/KsfEGJ0bNGpja/wy9a2gTvoJuo1RBPSuU9+T
 nrSWKjXzIizv60ZZetR9jJW9Zh1JiRS1mqhI6B9U76GXf1Jkvee1Io4PXttH4bNGbYIX
 eatRKnyfhz4waBEhOzwkOAo2SeQvkx0bGWucP9sFhjAmz4a8shvbPiXiUz9zN5TcrizU
 vKTA==
X-Gm-Message-State: APjAAAW+D39U+wbpC3d2GArNO1FE6j1OenmBNsUHiHgScs8X9y9n5jis
 IF9fR8g1NPT7Cqra4RHPFjZzBXyI+46HWdQg2BMzA6eQfUChB7sJ4600htL8tgGAxA767ys5W8z
 Fq+K9Kb4wrtig
X-Received: by 2002:a5d:6441:: with SMTP id d1mr32728629wrw.93.1579116046015; 
 Wed, 15 Jan 2020 11:20:46 -0800 (PST)
X-Received: by 2002:a5d:6441:: with SMTP id d1mr32728612wrw.93.1579116045806; 
 Wed, 15 Jan 2020 11:20:45 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id z4sm1100765wma.2.2020.01.15.11.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:20:45 -0800 (PST)
Subject: Re: [PATCH v2 31/86] arm:versatilepb: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-32-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5043dca5-2b49-9f9f-fe56-db286643fe0a@redhat.com>
Date: Wed, 15 Jan 2020 20:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-32-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: Dw68F8VaMvCuD5k1327YCQ-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ZobfLNbJoYD

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
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>   hw/arm/versatilepb.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index e86af01..f3c4a50 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -184,7 +184,6 @@ static void versatile_init(MachineState *machine, int=
 board_id)
>       Object *cpuobj;
>       ARMCPU *cpu;
>       MemoryRegion *sysmem =3D get_system_memory();
> -    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>       qemu_irq pic[32];
>       qemu_irq sic[32];
>       DeviceState *dev, *sysctl;
> @@ -220,11 +219,9 @@ static void versatile_init(MachineState *machine, in=
t board_id)
>  =20
>       cpu =3D ARM_CPU(cpuobj);
>  =20
> -    memory_region_allocate_system_memory(ram, NULL, "versatile.ram",
> -                                         machine->ram_size);
>       /* ??? RAM should repeat to fill physical memory space.  */
>       /* SDRAM at address zero.  */
> -    memory_region_add_subregion(sysmem, 0, ram);
> +    memory_region_add_subregion(sysmem, 0, machine->ram);
>  =20
>       sysctl =3D qdev_create(NULL, "realview_sysctl");
>       qdev_prop_set_uint32(sysctl, "sys_id", 0x41007004);
> @@ -398,6 +395,7 @@ static void versatilepb_class_init(ObjectClass *oc, v=
oid *data)
>       mc->block_default_type =3D IF_SCSI;
>       mc->ignore_memory_transaction_failures =3D true;
>       mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
> +    mc->default_ram_id =3D "versatile.ram";
>   }
>  =20
>   static const TypeInfo versatilepb_type =3D {
> @@ -415,6 +413,7 @@ static void versatileab_class_init(ObjectClass *oc, v=
oid *data)
>       mc->block_default_type =3D IF_SCSI;
>       mc->ignore_memory_transaction_failures =3D true;
>       mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
> +    mc->default_ram_id =3D "versatile.ram";
>   }
>  =20
>   static const TypeInfo versatileab_type =3D {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

