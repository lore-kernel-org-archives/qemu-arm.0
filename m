Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7342305lff;
        Wed, 15 Jan 2020 11:23:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmCkxnLegIZsIJTjsnM6F+R51QE90YynBz0hzqhICuGYpG9lxFGAPKdE5IVbSk+H5bkLFr
X-Received: by 2002:a05:620a:142c:: with SMTP id k12mr29466220qkj.207.1579116227112;
        Wed, 15 Jan 2020 11:23:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579116227; cv=none;
        d=google.com; s=arc-20160816;
        b=kL9+l2G3Z/6ArRPukp+HxcTCVo1LnNwcU6BXYgnkoZqSRzFGUCrrm0WbBvbTItj9Oe
         Sw0m/RQ5d4SyhCnjCivQRr9BpUS+ZOoEFCOe82A+kY5aBOut6mpDplOgU/gfvw6OhbrM
         gghJ1As8LvLBU/qQg45jIG+d63fq7F0/newo67dOSFeN+2NzYF1XWYx4pMhVIM8OBbSa
         OtIXvcI5LXivl+iC80ve6JuxhN9aQaDlf1+ntSa56vgpPiMXzIbxRemto48VoA1dgGDe
         2TymG7juHnm5nuZg3d2phmOou9jBqQC+48k6hRdy7dYDv5MoXvnuGss1QIF2Vzyg8QXt
         YobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QHzYjqVTnAwixztFu7z1kbWDzci633cZIYmwB/CDKAI=;
        b=N0ltYwCYX2l0oKmHbL70xdTe09GztJFxFp+8sEEU8VmdKCWxE5WM4C/6V7OhYFuEjW
         YoUzzm7WK5filwQ/TwBBA7Yo7D6Ikx0mCUh2MW5GPfFwjJcQewatOSgtNPXD4xBW7ogd
         lV5XjRTPAOl/tg35Ut8FgAO0UNNqZVAsm+ogIlcGBYP4kWJDRtxDTpLbubslbWdEeMLQ
         ELYQkym8hpLUFmZ1XuT/gslGrkTIwS7fA6UT89bxFig4nCJvPKOGRRvZXMQ1E6wbGWt6
         p+ostMVgpqBcfjm/j/eVWGYHAUSeRC5y8JFhw8Orbd1F3jfMdedsOaEPuXZjTGSQ2uoz
         QmFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N2j43Jto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si11516461qtr.366.2020.01.15.11.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:23:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N2j43Jto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iroGX-0006KG-OQ
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iroBA-0007n1-4h
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:18:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iroB6-0007lD-Ig
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:18:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48855
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iroB6-0007ky-FU
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579115888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHzYjqVTnAwixztFu7z1kbWDzci633cZIYmwB/CDKAI=;
 b=N2j43Jtoh06M+E3jdI8fU2tvCk/SgXi1TOpZbUzgPV0AfRVOhN+aUdCHyZYVOAx6++H4kP
 TfsaaYsTg89qOG39ugGK0lUy0/sHXHgHyGyxBW3jBx6jXOmFM9Ig+guyj7HAJYiwin7Qwy
 8T32Mz4xL1TwT+DnujF93M30ISKdqSQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-wlMtjlyEODi2UCnq2Zs_6A-1; Wed, 15 Jan 2020 14:18:06 -0500
Received: by mail-wr1-f72.google.com with SMTP id z15so8394589wrw.0
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i4YATXztQZOZ/x4C/L2US+OKK9XL0+Zvc8nEnaJFZKY=;
 b=J+D3gTpCtNBT/s0WcuaiLiT01rTaV+0FjyG5woQGhHkO6ydAwF2DZntpoqO+gNcwzV
 WIqzbjj3Mg6ETNKREijL1bx8RVvTT5ziqDrm7IAj4Pw1NsGK2VywLbvlCn+6v5hl50nm
 CGrSPYxl2L6QUDwqwKMjSLDX+QdT38G+5O1CFvunzaOUp9cPeXwe8m96DA8YMZUgLfEK
 T+s6aq/Me5Loswy7EsIsimZ6m/8lwiO9xTcnMz/1R+XhPCUvCxPXLE7Cr+jofh+/8WbF
 v406tzCHAUvtr7qbeV/6EudOJPqsYiHHPFe7mU8fwlGxkpG/zPsmz/hFxY67KOBWPvqt
 Rn2g==
X-Gm-Message-State: APjAAAWaum9/Ld1KHIJpsa9xUCDnYfF3VlM48ucEh6fqKMyQMA8F+uh6
 2yUkwiYyIhrplYcwTp/+Bt5vBRZD2m/kZRKsrJSHvFsewY3C0WYDdzmhRGJG9iM7EqOGDCX4GCZ
 YkRQqsyZE478G
X-Received: by 2002:a05:600c:305:: with SMTP id
 q5mr1527502wmd.167.1579115885545; 
 Wed, 15 Jan 2020 11:18:05 -0800 (PST)
X-Received: by 2002:a05:600c:305:: with SMTP id
 q5mr1527477wmd.167.1579115885384; 
 Wed, 15 Jan 2020 11:18:05 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id h2sm27064873wrt.45.2020.01.15.11.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:18:04 -0800 (PST)
Subject: Re: [PATCH v2 16/86] arm:imx25_pdk: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-17-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d636889a-2400-8bf6-c236-3ea1433cf354@redhat.com>
Date: Wed, 15 Jan 2020 20:18:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-17-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: wlMtjlyEODi2UCnq2Zs_6A-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jcd@tribudubois.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H2fdkuYPTqqs

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
> CC: jcd@tribudubois.net
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>   hw/arm/imx25_pdk.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index a2b7b35..9087fcb 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -58,7 +58,6 @@
>  =20
>   typedef struct IMX25PDK {
>       FslIMX25State soc;
> -    MemoryRegion ram;
>       MemoryRegion ram_alias;
>   } IMX25PDK;
>  =20
> @@ -84,10 +83,8 @@ static void imx25_pdk_init(MachineState *machine)
>           exit(EXIT_FAILURE);
>       }
>  =20
> -    memory_region_allocate_system_memory(&s->ram, NULL, "imx25.ram",
> -                                         machine->ram_size);
>       memory_region_add_subregion(get_system_memory(), FSL_IMX25_SDRAM0_A=
DDR,
> -                                &s->ram);
> +                                machine->ram);
>  =20
>       /* initialize the alias memory if any */
>       for (i =3D 0, ram_size =3D machine->ram_size, alias_offset =3D 0;
> @@ -107,7 +104,8 @@ static void imx25_pdk_init(MachineState *machine)
>  =20
>           if (size < ram[i].size) {
>               memory_region_init_alias(&s->ram_alias, NULL, "ram.alias",
> -                                     &s->ram, alias_offset, ram[i].size =
- size);
> +                                     machine->ram,
> +                                     alias_offset, ram[i].size - size);
>               memory_region_add_subregion(get_system_memory(),
>                                           ram[i].addr + size, &s->ram_ali=
as);
>           }
> @@ -135,6 +133,7 @@ static void imx25_pdk_machine_init(MachineClass *mc)
>       mc->desc =3D "ARM i.MX25 PDK board (ARM926)";
>       mc->init =3D imx25_pdk_init;
>       mc->ignore_memory_transaction_failures =3D true;
> +    mc->default_ram_id =3D "imx25.ram";
>   }
>  =20
>   DEFINE_MACHINE("imx25-pdk", imx25_pdk_machine_init)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

