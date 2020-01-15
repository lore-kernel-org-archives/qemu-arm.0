Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7347656lff;
        Wed, 15 Jan 2020 11:29:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqws92/X4A0Svudv893POBZBGnQ9y6/lS67QCJYM6KwYZpNb4QbF1Cwkb1av3vandUM5uJzV
X-Received: by 2002:a05:6214:923:: with SMTP id dk3mr22933578qvb.96.1579116553228;
        Wed, 15 Jan 2020 11:29:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579116553; cv=none;
        d=google.com; s=arc-20160816;
        b=xd2g8ZC1LNE7UI+xlPof2o4lE84H4G+A24rC2Y1cEYhrxmNudWvWi/mmWexyJOEztb
         fwXiURntaC/1TmvRP6AOrhBUL50CqR7SV/3PAMk5notQbNAGnhUrx4dy+rPWnkTgRjbI
         OZPAcksLcNbB+o8FAnhVId/7eT7GyFmYUbD9iBiuzVusR6Iv+OeB4KHyDzdS7ZzZqsR9
         puxno+5OcQ5KszJvBkY13QLAXqZNqZBxjUTwijda/XivNRnlPdd+H03keHV/UoMx9duT
         jeqSc+vh9qnW28wMnx8USj5OZwSXOPFOpYxmbP6+2+xXAaN502LmHACQoGlnmXqovO+U
         cnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KOBNebwN5ZJDL+Ty5TBdkn9mPdsi5cY+IjZgOi1aV7I=;
        b=0AdH1HfFgv66gCS/YfOixJkPGsi8t2BlRVhFAtfWOJhda0dseb56Mrwg99CwBrxPGV
         uiSVSVEgfz0Iw8SrLPlj8maEQfMohSemOx1AO0D3EAyA5w0n6A4jDahbCPPnQVITTa30
         A0KCtTVCK9VAmv0TNeMnbyZunGaimqUKvKiBgPCrWE1wlf95s3h2YtSKrKTvFjJyIs5g
         qavpoiIAK3Ahu13z3W5IVzbxU29Ax9xNd2UzAeciSuu6yghLu9QIXfK+eTHTbwM9Kf4+
         aZejJZ4CRuMBIQyrxuAbZ6vb+uAJoPvfEFnx15uiUffRpUSt8m2t58vYpmto0608o51F
         H5Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SO/zfZPf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a141si10902895qkg.122.2020.01.15.11.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:29:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SO/zfZPf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iroLo-0006Ha-KQ
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iroEL-00032G-6j
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:21:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iroEH-0001rP-Ao
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:21:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27203
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iroEH-0001rD-7O
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579116084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOBNebwN5ZJDL+Ty5TBdkn9mPdsi5cY+IjZgOi1aV7I=;
 b=SO/zfZPfgJgLPBg1bQOuM1niLrrkFOABLDpOYRgHU6J5NO9rdlZ3NAS6jW1fQZ1v6vjfG2
 1tVXhReLG+6pj1h7De0aZGzJEHawGXKGYRarzcyGslrGEC6SjpbuyDX/vD+n6Ar9f/CA/f
 oaNY1e+NxMcJigSBQYyqwHYQ6Uj62vI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-GEzvm9ulNHauRkvVWkTn9Q-1; Wed, 15 Jan 2020 14:21:23 -0500
Received: by mail-wm1-f70.google.com with SMTP id 18so306116wmp.0
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N6ea6BKh76WzXKHFqhF9XNNKVEaJqpc1BGEfICEg894=;
 b=mDP5nK21+bFcrdQ0n9IPYlFl0zd+Zdt1LvlANltNhcOXYlM8VaCUxmcMbevBL2B6RE
 h9j8nJ2Vw6yGgJD0oQptUDDppt47JsNqD/rVhGPXaXTHKaLoz2wz05wF58VsNPnTEAmi
 jqowgsv55nz9Pi739AakbMowv+CKR/SpFH8B1Z9TQFhjO49UeE0cIHh9BH7/C1b6/v9E
 9w0SewXVLu3nMrut6g7hwTwui8T8WfAxIv+HYK3cEr88FM1q/daRL87zZRqvJ87p2c+N
 opGFSD+n3ZOe99eMrG4uqFxqa05ajcyB8REQVtFVEt55cYl+w7rTRziqGI6G0pfdPTfO
 YlAQ==
X-Gm-Message-State: APjAAAU5JlL2mtW7wsN42SSJ43I+YiBC/PaLm007cQUcSbaqoBufysqv
 +qX3+sx7ZOHG5HG4Juz3nO6UwiWRRlDwOFlj/VOmD8kwI4GRnLmBjcMmW0Vbc3mWZGpqrFxTplu
 ec8OCeZvAGiBB
X-Received: by 2002:a05:600c:141:: with SMTP id
 w1mr1517732wmm.61.1579116082413; 
 Wed, 15 Jan 2020 11:21:22 -0800 (PST)
X-Received: by 2002:a05:600c:141:: with SMTP id
 w1mr1517702wmm.61.1579116082198; 
 Wed, 15 Jan 2020 11:21:22 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id f1sm26023104wru.6.2020.01.15.11.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:21:21 -0800 (PST)
Subject: Re: [PATCH v2 32/86] arm:vexpress: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-33-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ba46b36b-470c-d08d-2cad-f411718ef9fd@redhat.com>
Date: Wed, 15 Jan 2020 20:21:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-33-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: GEzvm9ulNHauRkvVWkTn9Q-1
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
X-TUID: TAFvkJJcf8SG

On 1/15/20 4:06 PM, Igor Mammedov wrote:
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
>   hw/arm/vexpress.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 4673a88..ed683ee 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -273,7 +273,6 @@ static void a9_daughterboard_init(const VexpressMachi=
neState *vms,
>   {
>       MachineState *machine =3D MACHINE(vms);
>       MemoryRegion *sysmem =3D get_system_memory();
> -    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>       MemoryRegion *lowram =3D g_new(MemoryRegion, 1);
>       ram_addr_t low_ram_size;
>  =20
> @@ -283,8 +282,6 @@ static void a9_daughterboard_init(const VexpressMachi=
neState *vms,
>           exit(1);
>       }
>  =20
> -    memory_region_allocate_system_memory(ram, NULL, "vexpress.highmem",
> -                                         ram_size);
>       low_ram_size =3D ram_size;
>       if (low_ram_size > 0x4000000) {
>           low_ram_size =3D 0x4000000;
> @@ -293,9 +290,10 @@ static void a9_daughterboard_init(const VexpressMach=
ineState *vms,
>        * address space should in theory be remappable to various
>        * things including ROM or RAM; we always map the RAM there.
>        */
> -    memory_region_init_alias(lowram, NULL, "vexpress.lowmem", ram, 0, lo=
w_ram_size);
> +    memory_region_init_alias(lowram, NULL, "vexpress.lowmem", machine->r=
am,
> +                             0, low_ram_size);
>       memory_region_add_subregion(sysmem, 0x0, lowram);
> -    memory_region_add_subregion(sysmem, 0x60000000, ram);
> +    memory_region_add_subregion(sysmem, 0x60000000, machine->ram);
>  =20
>       /* 0x1e000000 A9MPCore (SCU) private memory region */
>       init_cpus(machine, cpu_type, TYPE_A9MPCORE_PRIV, 0x1e000000, pic,
> @@ -360,7 +358,6 @@ static void a15_daughterboard_init(const VexpressMach=
ineState *vms,
>   {
>       MachineState *machine =3D MACHINE(vms);
>       MemoryRegion *sysmem =3D get_system_memory();
> -    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>       MemoryRegion *sram =3D g_new(MemoryRegion, 1);
>  =20
>       {
> @@ -375,10 +372,8 @@ static void a15_daughterboard_init(const VexpressMac=
hineState *vms,
>           }
>       }
>  =20
> -    memory_region_allocate_system_memory(ram, NULL, "vexpress.highmem",
> -                                         ram_size);
>       /* RAM is from 0x80000000 upwards; there is no low-memory alias for=
 it. */
> -    memory_region_add_subregion(sysmem, 0x80000000, ram);
> +    memory_region_add_subregion(sysmem, 0x80000000, machine->ram);
>  =20
>       /* 0x2c000000 A15MPCore private memory region (GIC) */
>       init_cpus(machine, cpu_type, TYPE_A15MPCORE_PRIV,
> @@ -795,6 +790,7 @@ static void vexpress_class_init(ObjectClass *oc, void=
 *data)
>       mc->init =3D vexpress_common_init;
>       mc->max_cpus =3D 4;
>       mc->ignore_memory_transaction_failures =3D true;
> +    mc->default_ram_id =3D "vexpress.highmem";
>   }
>  =20
>   static void vexpress_a9_class_init(ObjectClass *oc, void *data)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

