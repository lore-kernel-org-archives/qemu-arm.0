Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7316573lff;
        Wed, 15 Jan 2020 11:01:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6CXF2STI2E492TGZVuUJNIogA0IN3yxEVcvnrBgxLbrwdaRwadVAkZxQuI458at63J+NA
X-Received: by 2002:ac8:7297:: with SMTP id v23mr46042qto.135.1579114902514;
        Wed, 15 Jan 2020 11:01:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579114902; cv=none;
        d=google.com; s=arc-20160816;
        b=E1mlBG4I/jRDZFPK9iRNR3pd0IG2hRRWKddq7Om6d5C8p2lR9DFlgOo1E/zTxcVvGd
         l1AI8YF8cXbh3zq+ca9nMwmo8M/Bvmdu4QP2RPaHIiF6Jgbas1FAOqD4Uanh+6T22/8O
         huxzsPrs+YgGzQJLYcA892VGnIrKJPQu2Q/tf0IDRQoa0hLDXAIK17eb/MShM8YsHv8x
         ex/nglKH7iRt4BczFHYa+7c0a6dG0ddDcPSapKSYzFPj+OiGBbwANm7xOVo5RX3j9glS
         n6EMISAHX5Sym7bzPXAlffpzt5zSJEUO9+V6+wvraprYO6S8XmvgLKcw67sfAyqZZkeS
         h6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UuQLGzgmKwdYQbCUGfTuunVa5Cdppnywdo26qugUDpk=;
        b=fbUmVexFeJXsprOAPZHDKcSbUVnN0MkwnYRc/uO/u7sZ1qBGbcg/Jbm6dajVbDJUKD
         ISZMADWon777xoFdyYa0kqhS8f+6/tRQnw+mmHxzp2roTyIyDblf5EBsRu5AVQm0qEqL
         f+FkeBOWEoWJL3I11EYjyjLGN4Wj5NeQo3BzNvhMV/Qh4iNPMyQUuwb5jkYtxInj2SCI
         cMQSmGWqz2Uun5dDwdYdz4Ctm/tvzl59Aeh/51Xyo0f5fxsCzf7Zk6ZrOaackO9NEh8R
         PRcLTXJUr0l58XlJdWgL+NK3Z7tEshVosGB7PM27OdOTr3979a4TpaU/wZoopE/FgESz
         vbyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U4nIOTKk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si11969244qtg.186.2020.01.15.11.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:01:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U4nIOTKk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irnvB-0008WL-3x
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:01:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1irnut-0008RB-D8
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:01:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1irnup-00050m-Av
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:01:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51617
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1irnup-00050T-7X
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579114878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuQLGzgmKwdYQbCUGfTuunVa5Cdppnywdo26qugUDpk=;
 b=U4nIOTKk9zZJQDDGLZ3p1iq/8KwjPxCktuN/tTOwnXddgI4bcjnmhpBHxzj3VGC4nbeGCo
 eR6TggX9OckRBKgHWO12ElYhiswdPdnGmGwFMaOIyMvzggNfLifkxQYVxE/rR6qi121BPC
 waIEVUm/xuw36+ynaYca6s8oOaNkPE4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-MpxFYIdbPZyzAtdyjrhfJQ-1; Wed, 15 Jan 2020 14:01:15 -0500
Received: by mail-wr1-f69.google.com with SMTP id f15so8415594wrr.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2gUAuuy9ejenWLB4RsCZ6mGR1t6R2WZ7s/fAGzHi2Pk=;
 b=o+Zaix6cQV2fR+zUw0yLn85BnoaboZtUcd/LT3NjxN4RtSNxYpIfuRXjMcpGS8xyCo
 +JLDAqzsBfahIevyNR0wPKFQiPdOqwkNWMDFvLFXCJTNesEk4Z+8X+tcTB0LxK/3Q7Uq
 juHDnB5O6kGgBYupGV3xf8yh1xK8iFUQwNtFIlbKVby72xgyb5RB7brBxo81davyaoxg
 C/wL6fSukf7SoOYw4tdvpAU+p4mUJs/3pWUKSqdzuBubu6BL2mFwsZzMyfKB6zE3LlaU
 8DDXpaixyT0nL6R00IHq+obOPueABVtCAzVnp/LiBPXKqj1wki13ujWTYZQAu6VGsPHz
 Af7A==
X-Gm-Message-State: APjAAAV8jM6Uxc8Gka6iEDK7YISk/fiDftJo1j5ODh+R0csk4bbUrDNf
 8hjfZVKpnhpRSWR8ob6gCo0GSk2dxi7NKPcZUkWwVWi59hMOYUz1djOgzxwCqJQ6oXY79Dsi3e2
 KmV6dd7i4oLIr
X-Received: by 2002:a5d:6211:: with SMTP id y17mr32674671wru.344.1579114874515; 
 Wed, 15 Jan 2020 11:01:14 -0800 (PST)
X-Received: by 2002:a5d:6211:: with SMTP id y17mr32674638wru.344.1579114874227; 
 Wed, 15 Jan 2020 11:01:14 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id z123sm1132669wme.18.2020.01.15.11.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:01:13 -0800 (PST)
Subject: Re: [PATCH v2 35/86] arm:xilinx_zynq: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-36-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2131c7ec-943e-1806-03c4-fe49371caa08@redhat.com>
Date: Wed, 15 Jan 2020 20:01:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-36-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: MpxFYIdbPZyzAtdyjrhfJQ-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alistair@alistair23.me
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uy0JS96wYEFo

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
> CC: edgar.iglesias@gmail.com
> CC: alistair@alistair23.me
> ---
>   hw/arm/xilinx_zynq.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index df950fc..0ef9688 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -160,7 +160,6 @@ static void zynq_init(MachineState *machine)
>   {
>       ARMCPU *cpu;
>       MemoryRegion *address_space_mem =3D get_system_memory();
> -    MemoryRegion *ext_ram =3D g_new(MemoryRegion, 1);
>       MemoryRegion *ocm_ram =3D g_new(MemoryRegion, 1);
>       DeviceState *dev;
>       SysBusDevice *busdev;
> @@ -190,9 +189,7 @@ static void zynq_init(MachineState *machine)
>       object_property_set_bool(OBJECT(cpu), true, "realized", &error_fata=
l);
>  =20
>       /* DDR remapped to address zero.  */
> -    memory_region_allocate_system_memory(ext_ram, NULL, "zynq.ext_ram",
> -                                         machine->ram_size);
> -    memory_region_add_subregion(address_space_mem, 0, ext_ram);
> +    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>  =20
>       /* 256K of on-chip memory */
>       memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
> @@ -318,6 +315,7 @@ static void zynq_machine_init(MachineClass *mc)
>       mc->no_sdcard =3D 1;
>       mc->ignore_memory_transaction_failures =3D true;
>       mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a9");
> +    mc->default_ram_id =3D "zynq.ext_ram";
>   }
>  =20
>   DEFINE_MACHINE("xilinx-zynq-a9", zynq_machine_init)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

