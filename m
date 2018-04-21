Received: by 10.28.4.212 with SMTP id 203csp1637944wme;
        Sat, 21 Apr 2018 02:07:48 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+4EbfpsrD1DBy+4TabX0jfpuku5W4m2aOn4ZcELE3Ilrm0M9S7NzQ4XUEmmyWTjrpzBvWt
X-Received: by 10.55.60.202 with SMTP id j193mr13249514qka.66.1524301668764;
        Sat, 21 Apr 2018 02:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524301668; cv=none;
        d=google.com; s=arc-20160816;
        b=fduIMPxHoP66hEaeZZ2sLGb5hjfyk965lkckSt3WlYc0zg3L7719IgDcXFt2IiTgLG
         KzOXOnm13x+dv7AStIwDIxgQEYfHANqVZuf0GbMYopVWStoI4LrYRMHQJYOknTlzKAnm
         RRFW5+PBsDsZN4+szTWvhCJ9By8YdXzykvk+CCTVTo8dlQbNy70Ct+uIqMv/3SHWyOOk
         QzViOva/4Bc+qzAcJHF2b24OW4VojJsPSXSHEm+XOAcHgDoC3mbKR+onuPkc1FNhUmhf
         AeYfsdPwi2LbfcTo+sC/enWiesdnoDUY1M3lieDEZCyKtm5L4dKz+mLZW/67osoXz9kr
         7FPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Lo1xhL0QD9kdwRvpkAjtWPuv8OEiETsemaIVdC7MPTg=;
        b=DLUZAFFVtAghVYj3wI/dhMI3dTLAiU/tJ09G1jfWXsCZW6USD4tu3mNsMx0wp+uKT4
         vaDr14hZSK7egavmsJw4gIX6HXHN1VnV6o2d46IqmnVpRkgRVyIEjOWRrKGzPhVR00x1
         +nEmwYhQzHzTTHB5M+KoV+S4PnA69xsblQTiQbrxePS1pUR0phT84tIyZWsxLCWFO/Wl
         FZIr2Epur/e9Hu17+rrsM9QkY5QJCDaFdVgnx4tF6luABLHgRuX9UWZGpU/zpWI8B4HV
         FTGz16N/mQT+246BG5Qpr3HQ/uY317s42hYThOdC5T3p2lxNrbJ7t6RNM4DO/+9OGcXD
         Gikg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10-v6si4086507qth.328.2018.04.21.02.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Apr 2018 02:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9oUm-0001gT-7p
	for alex.bennee@linaro.org; Sat, 21 Apr 2018 05:07:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1f9oUW-0001de-MJ
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1f9oUT-0003TS-Hj
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:07:32 -0400
Received: from 2.mo6.mail-out.ovh.net ([46.105.76.65]:43925)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1f9oUT-0003Rv-B9
	for qemu-arm@nongnu.org; Sat, 21 Apr 2018 05:07:29 -0400
Received: from player796.ha.ovh.net (unknown [10.109.105.98])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 8F6AE156588
	for <qemu-arm@nongnu.org>; Sat, 21 Apr 2018 11:07:27 +0200 (CEST)
Received: from zorba.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: postmaster@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id CD19C5C009D;
	Sat, 21 Apr 2018 11:07:21 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180420124835.7268-1-peter.maydell@linaro.org>
	<20180420124835.7268-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <518fe8ea-b9f1-f5a8-e3b5-525e48b0d1c5@kaod.org>
Date: Sat, 21 Apr 2018 11:07:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180420124835.7268-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 18396923005704112946
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrjeelgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.76.65
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/arm/aspeed_soc: don't use
 vmstate_register_ram_global for SRAM
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
Cc: Rob Herring <robh@kernel.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /cXlyXPUsREo

On 04/20/2018 02:48 PM, Peter Maydell wrote:
> Currently we use vmstate_register_ram_global() for the SRAM;
> this is not a good idea for devices, because it means that
> you can only ever create one instance of the device, as
> the second instance would get a RAM block name clash.
> Instead, use memory_region_init_ram(), which automatically
> registers the RAM block with a local-to-the-device name.
>=20
> Note that this is a cross-version migration compatibility break
> for the "palmetto-bmc", "ast2500-evb" and "romulus-bmc" machines.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

On palmetto, romulus and ast2500-evb boards=20

Thanks

C.> ---
>  hw/arm/aspeed_soc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 30d25f8b06..407f10d0d4 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -186,13 +186,12 @@ static void aspeed_soc_realize(DeviceState *dev, =
Error **errp)
>      }
> =20
>      /* SRAM */
> -    memory_region_init_ram_nomigrate(&s->sram, OBJECT(dev), "aspeed.sr=
am",
> +    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
>                             sc->info->sram_size, &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> -    vmstate_register_ram_global(&s->sram);
>      memory_region_add_subregion(get_system_memory(), ASPEED_SOC_SRAM_B=
ASE,
>                                  &s->sram);
> =20
>=20

