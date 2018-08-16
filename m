Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1810860wru;
        Thu, 16 Aug 2018 05:48:56 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzctSfoEQ9NHoFdsnFaI3GkyCgMerf3LYWEeR73tNhiyujqNGalYxyeb3OcUajAIwmyuKeX
X-Received: by 2002:a0c:8261:: with SMTP id h88-v6mr26828281qva.117.1534423736171;
        Thu, 16 Aug 2018 05:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534423736; cv=none;
        d=google.com; s=arc-20160816;
        b=0i+5Ol5ehcpiiXDWuJ9B+hOleqCG+Eze4hi6EAZ45UJX2ymCymLN/1hTt/d4SMzpm/
         FGdxnI4NQQkYgK6UnJdjFdtO70O4SbyEdhoipk4RbkzTlcuXiqj6+0IFdyJeEL9fC3Dd
         N+jV0OxOLf8KYKbk+9spbquTO84o0AuvuY4t+zmLuvyda6HEcBWA/RiX+y1v3d7CZyaQ
         ld1k8L+AEFjkqpBMBDBWPSHXkSrH7aOkPW02IA1Q2E0bkRwG1dSWfiWILqV9hBwwcv9g
         A+xAZUHFvPsaOMHnxRTuvdYTeY1g0jFq2lmPhgQD/VzTc37bwGq5LFUy0pL4JB800vz5
         xAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=3vMDWqnEi5yKHYsBZQ29/9Af/z1PHMXlvaDIwDhkzRc=;
        b=NQ1SFrQlaQWU9S0avbA89z6PkhmleP8YbNk/00p7c6hispAzuTQGCoPCCC2szjCE0e
         U/fcz76IxZcHA2rI/0vgEgO70mAsbxA23qJQINIPfi5nl04XHMD98PuYxA2Uy6scRu9r
         oMI77lrXRXvZpgh5lGfZZKMiNSKnj3iC94mp4Biwl7ksQ/P73TH8B10WamIaOmIU5JiQ
         nmlAKeyH6mhx7r6/xgZKG4aJWLg8TDTTzT9rRp6HTkd/evUGNCtn27nnz7Yhm4Ex5+1q
         Xiv7cAWIz8hdbhqFZhvYG93U9VRuj0F18s6Oec30t7e4+hyRFljmF6Du81vbR+/VYdnQ
         Pl3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HDbd+Q+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5-v6si4209172qvo.196.2018.08.16.05.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 05:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HDbd+Q+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqHhv-0000k1-MK
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 08:48:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHha-0000aj-7E
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:48:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHhY-0002zU-6B
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:48:34 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqHhX-0002z1-Uj
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:48:32 -0400
Received: by mail-oi0-x242.google.com with SMTP id 13-v6so7764718ois.1
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3vMDWqnEi5yKHYsBZQ29/9Af/z1PHMXlvaDIwDhkzRc=;
	b=HDbd+Q+mb5tq0hxzb2ILIcVs5LgeFE1h8bld3dBOiWgSyCIo03ELfBEUc3GEqe3Wgb
	cmFsDqtENT5/Jli1K8ZRnq92U4IRd03GbZIKjZwTodmGQmn+q98Yb55SJPehPeP9xbx3
	BPyJ/RNULtG/Q9O0R9AJIbeSeIESbbKHUMlYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3vMDWqnEi5yKHYsBZQ29/9Af/z1PHMXlvaDIwDhkzRc=;
	b=Jt5RFQEoO8ZBfgDn75GVwnYP16TfbmmwraIisAThgCoETkiqUt/0kLD8VySPyVjJhq
	XxZlbsTPDQYPtMMdgS6/U77powJWxpOFGhY34GT1VWILwImPfRdBwqJmJALNGD//pciD
	gR5hV5/EU65FvVBco51g1sNFIGxfUaSltytdaGWPdzL8TdFAIX96eFJkyrwbivBj1PSe
	1MdHqJOQT4myt+k4ra4mzip3Rll7mebeRQrTWeZjKgnJCpVhZBlAEmBXK37x6gO1I4gx
	hTjfr4l56argEcJDNgozFhj8mPTkxeolvGqnfsP7CoikuavWRyDmtK8wxoN69zrcdtdA
	lCcQ==
X-Gm-Message-State: AOUpUlGAez5nTOmN38rJ92b2URJn4cD/Eje2pbiSN3s9w55YW+Sl9ly1
	GNHRj4MzWBwUfKsqoDBkTZc+izAGEuM6vA2ZL07FMg==
X-Received: by 2002:aca:6142:: with SMTP id
	v63-v6mr33617711oib.137.1534423711111; 
	Thu, 16 Aug 2018 05:48:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 05:48:10
	-0700 (PDT)
In-Reply-To: <20180807075757.7242-7-joel@jms.id.au>
References: <20180807075757.7242-1-joel@jms.id.au>
	<20180807075757.7242-7-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 13:48:10 +0100
Message-ID: <CAFEAcA8eUOzyHgF6YEBo80xQLzdnaVeZMYRiPPJWFBNv7dhZTQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 6/7] aspeed: add a max_ram_size property to
 the memory controller
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bzYo58BmaXF1

On 7 August 2018 at 08:57, Joel Stanley <joel@jms.id.au> wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>
> This will be used to construct a memory region beyond the RAM region
> to let firmwares scan the address space with load/store to guess how
> much RAM the SoC has.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed.c               | 31 +++++++++++++++++++++++++++++++
>  hw/arm/aspeed_soc.c           |  2 ++
>  hw/misc/aspeed_sdmc.c         |  3 +++
>  include/hw/misc/aspeed_sdmc.h |  1 +
>  4 files changed, 37 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index bb9d33848d3f..e078269266bc 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -31,6 +31,7 @@ static struct arm_boot_info aspeed_board_binfo =3D {
>  typedef struct AspeedBoardState {
>      AspeedSoCState soc;
>      MemoryRegion ram;
> +    MemoryRegion max_ram;
>  } AspeedBoardState;
>
>  typedef struct AspeedBoardConfig {
> @@ -127,6 +128,27 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
>      },
>  };
>
> +/*
> + * The max ram region is for firmwares that scan the address space
> + * with load/store to guess how much RAM the SoC has.
> + */
> +static uint64_t max_ram_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void max_ram_write(void *opaque, hwaddr offset, uint64_t value,
> +                           unsigned size)
> +{
> +    /* Disacard writes */
> +}
> +
> +static const MemoryRegionOps max_ram_ops =3D {
> +    .read =3D max_ram_read,
> +    .write =3D max_ram_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
>  #define FIRMWARE_ADDR 0x0
>
>  static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_siz=
e,
> @@ -187,6 +209,7 @@ static void aspeed_board_init(MachineState *machine,
>      AspeedBoardState *bmc;
>      AspeedSoCClass *sc;
>      DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);
> +    ram_addr_t max_ram_size;
>
>      bmc =3D g_new0(AspeedBoardState, 1);
>      object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
> @@ -226,6 +249,14 @@ static void aspeed_board_init(MachineState *machine,
>      object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
>                                     &error_abort);
>
> +    max_ram_size =3D object_property_get_uint(OBJECT(&bmc->soc), "max-ra=
m-size",
> +                                            &error_abort);
> +    memory_region_init_io(&bmc->max_ram, NULL, &max_ram_ops, NULL,
> +                          "max_ram", max_ram_size  - ram_size);
> +    memory_region_add_subregion(get_system_memory(),
> +                                sc->info->sdram_base + ram_size,
> +                                &bmc->max_ram);

I'm surprised that you need the IO ops, ie that it doesn't work
just to define an empty container region with memory_region_init().

thanks
-- PMM
