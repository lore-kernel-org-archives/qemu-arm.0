Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1566592wrx;
        Fri, 19 Apr 2019 01:13:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrYcW9pe2Dj5DIzYBMJDhTO+BNRh7mc8CFWwBt4U8UHKH5f2zK7MH1qqS5y0xSRhFb+kkp
X-Received: by 2002:a1c:5588:: with SMTP id j130mr1845289wmb.72.1555661592115;
        Fri, 19 Apr 2019 01:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555661592; cv=none;
        d=google.com; s=arc-20160816;
        b=laeEkamWALGUwtKZMZ4vwXQBRpZfN2AzrugSp2OvaIV6IJvrgXp4FwlwtnB73MzTvt
         tVeTioxs1dP8LPRJh23x+1HXeYPNVmzZUyqOlyxmVuYzqPUNhiMb6wMxZz+WhpDeU2LB
         FzjT5gKZJaAeN3UTZ+/rcUhD+1HBmhPdoP2ZZci28I2luocBTqJr+itSr8/vgHX+slOw
         EADN7qNkK+oJVrMOUq7odFEPFIyuIKTthhJgGs/Yn2CRtgquO5dTfmaSMuX2FNamwRxN
         hQLxZeImb6htiYaJFizjuNEv/ucZtbpg7Kq7Tz8fH1iFBfokuwUSi8unX+1/6NQiiXFG
         c1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=b4MBGCOL+4v9Cc9JkI6Dr6QiY8+vC9WYTFQo2e1hS5s=;
        b=xhcLlNDPT3UJO7AmZOXx1ESmuGcpEj6ZS31hsKP2zLK7RvcFhGtpv0DiMdKpun+S1p
         /LFNBdUOInvNaBFr3mvqLv94JglYBXxbvqmPzwoNc/SIyhOra85JxUEepNAXl7fL9iN3
         +dQMbnsj9lkryhEKa5PKL6U59xllHxqJLaRGN9p2Rf7EKsmJDknn1tbhN7nOBiWdo2Xg
         4N92TNg6vrAywv8+1vQAoq7S1pJQ6w7XOU7994P7r7YF7ynQlx6/CVuZcc0WRg+9L7xO
         ZFY3akSpptM3PB7m2fGNn1Nwy22298GAQ+ga+H/UgfJ4OJLDYTPEl8OVE0eCx2uEYS+R
         RMNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t187si3271819wmg.87.2019.04.19.01.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Apr 2019 01:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:53142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHOdz-0007wl-6G
	for alex.bennee@linaro.org; Fri, 19 Apr 2019 04:13:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hHOdn-0007vP-9p
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 04:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hHOdm-00005L-Aw
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 04:12:59 -0400
Received: from 7.mo69.mail-out.ovh.net ([46.105.50.32]:34108)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hHOdm-0008SR-5o
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 04:12:58 -0400
Received: from player699.ha.ovh.net (unknown [10.109.146.50])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 3E80A4BDDC
	for <qemu-arm@nongnu.org>; Fri, 19 Apr 2019 10:12:49 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id A92214ECE35F;
	Fri, 19 Apr 2019 08:12:20 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-16-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <46e2a455-45ef-a5b2-7bdb-f0d67ab270ba@kaod.org>
Date: Fri, 19 Apr 2019 10:12:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-16-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9439544821477903212
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.50.32
Subject: Re: [Qemu-arm] [PATCH for-QEMU-4.1 v5 15/29] hw/arm: Express
 dependencies of the aspeed boards with Kconfig
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
Cc: Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, John Snow <jsnow@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohNR7/NA1GWa

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Dependencies have been determined by looking at hw/arm/aspeed.c

Looks correct to me.=20

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks Thomas,

C.

>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak |  7 +------
>  hw/arm/Kconfig                  | 10 ++++++++++
>  2 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-soft=
mmu.mak
> index 25e8f717ac..2580584281 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -26,15 +26,12 @@ CONFIG_SPITZ=3Dy
>  CONFIG_TOSA=3Dy
>  CONFIG_Z2=3Dy
>  CONFIG_COLLIE=3Dy
> +CONFIG_ASPEED_SOC=3Dy
> =20
>  CONFIG_VGA=3Dy
> -CONFIG_TMP421=3Dy
> -CONFIG_PCA9552=3Dy
>  CONFIG_SSI_M25P80=3Dy
>  CONFIG_ALLWINNER_EMAC=3Dy
>  CONFIG_IMX_FEC=3Dy
> -CONFIG_FTGMAC100=3Dy
> -CONFIG_DS1338=3Dy
>  CONFIG_PLATFORM_BUS=3Dy
>  CONFIG_VIRTIO_MMIO=3Dy
> =20
> @@ -92,8 +89,6 @@ CONFIG_I82801B11=3Dy
>  CONFIG_ACPI=3Dy
>  CONFIG_ARM_VIRT=3Dy
>  CONFIG_SMBIOS=3Dy
> -CONFIG_ASPEED_SOC=3Dy
> -CONFIG_SMBUS_EEPROM=3Dy
>  CONFIG_GPIO_KEY=3Dy
>  CONFIG_MSF2=3Dy
>  CONFIG_FW_CFG_DMA=3Dy
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 325133c129..abeaa54d88 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -254,6 +254,16 @@ config FSL_IMX6
> =20
>  config ASPEED_SOC
>      bool
> +    select DS1338
> +    select FTGMAC100
> +    select I2C
> +    select PCA9552
> +    select SERIAL
> +    select SMBUS_EEPROM
> +    select SSI
> +    select SSI_M25P80
> +    select TMP105
> +    select TMP421
> =20
>  config MPS2
>      bool
>=20

