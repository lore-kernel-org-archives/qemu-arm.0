Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8120853lff;
        Thu, 16 Jan 2020 01:24:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqypjdp/K4hr5/an+8/bz9IqE25RuroFCAdqhl7b6O/QO1PXRITK/rbA1vpFw9zqQGGY/6Tt
X-Received: by 2002:a37:bc04:: with SMTP id m4mr27810695qkf.224.1579166673860;
        Thu, 16 Jan 2020 01:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579166673; cv=none;
        d=google.com; s=arc-20160816;
        b=ns3BObR81XjYrRC66RyuqxazIvWLCcIeWs1oMzEeXuiiJwZcp9nI1aE90ErT6FYCh4
         YQDpaHYHJNFAce4BTXvpvqQNIUQP8PxWK0XK2BAeJjYfR0WGXbDeBuBR5qRw3SQSBFDT
         u59vFiyiEsOxum4pJPDQtsRka3jyWeKqYN2QdH2jiSwnoBZrK3G7kZxiyWi1H0RGw7cq
         wXdEbQhGyl1S7RsxZ5b/cKaN0AWZ8Fsb77JwqnSoL+yEP9PgCeu3iq1pPGjVkv6gh1nO
         5w9KqTjW9/uqHINTFzUPCnEyHKZxDgNbnis6Kzbr0Ml2nFZjq9hgEX0aB/m+AfGpcZua
         tFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=rpofKNCKgXUI2vDXOonZ5o5yU0Yp2/ygK6fpmtKzqKg=;
        b=eCMiMvlKllft8npGzMYnTboQj9JCaCrM+pek6T0b9tn1tRkDbtSJZhHqCCnScCK4Ef
         OzobjFwT7c6G6gy2Qc+WstTHhdrtEmbM22hwdFzLiTiM/vk915l7xrqrME99w+DdKKSv
         H12SLMWXDlBxl6yAha00E7cIc4nAeiUFtniL6BjeANioWtuflPtot1ya+P24VORgEJu8
         W56NL5KhGvyLrrsWtJFhZk5DAO3jS76dF8io2Z7GmLlwGqSltRXEulPB0Cv/sDElbJ9P
         uXPfbURIIribpiMoiq6pkPV1Lj08OoX8WL4r1bUC0EOzrsBJxJZhfAuvaPcQz5jYJ6WH
         xv4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si12077974qvx.2.2020.01.16.01.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 01:24:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is1OD-0002Pu-9F
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 04:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1is1O4-0002PT-9R
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 04:24:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1is1O0-0007Wq-RX
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 04:24:23 -0500
Received: from 3.mo69.mail-out.ovh.net ([188.165.52.203]:42512)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1is1O0-0007Vm-L2
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 04:24:20 -0500
Received: from player734.ha.ovh.net (unknown [10.108.35.95])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 1B29B7C4B1
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 10:24:17 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 2CED2E252228;
 Thu, 16 Jan 2020 09:24:08 +0000 (UTC)
Subject: Re: [PATCH v2 10/86] arm:aspeed: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-11-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8473fe69-36da-35f7-930b-f800bb899732@kaod.org>
Date: Thu, 16 Jan 2020 10:24:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-11-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 3152801215351720880
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdehgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.52.203
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 11ClC10dIZvE

On 1/15/20 4:06 PM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


We need to check 'max_ram' is still needed. I remember that old firmwares
were testing the RAM size by doing write/read checks at the top of the RA=
M.
This was breaking QEMU sometime ago.

C.

> ---
> CC: clg@kaod.org
> CC: peter.maydell@linaro.org
> CC: andrew@aj.id.au
> CC: joel@jms.id.au
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/aspeed.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 525c547..330254b 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -35,7 +35,6 @@ static struct arm_boot_info aspeed_board_binfo =3D {
>  struct AspeedBoardState {
>      AspeedSoCState soc;
>      MemoryRegion ram_container;
> -    MemoryRegion ram;
>      MemoryRegion max_ram;
>  };
> =20
> @@ -184,6 +183,7 @@ static void aspeed_machine_init(MachineState *machi=
ne)
> =20
>      memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-containe=
r",
>                         UINT32_MAX);
> +    memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
> =20
>      object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
>                              (sizeof(bmc->soc)), amc->soc_name, &error_=
abort,
> @@ -215,8 +215,6 @@ static void aspeed_machine_init(MachineState *machi=
ne)
>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>                               &error_fatal);
> =20
> -    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_s=
ize);
> -    memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
>      memory_region_add_subregion(get_system_memory(),
>                                  sc->memmap[ASPEED_SDRAM],
>                                  &bmc->ram_container);
> @@ -393,6 +391,7 @@ static void aspeed_machine_class_init(ObjectClass *=
oc, void *data)
>      mc->no_floppy =3D 1;
>      mc->no_cdrom =3D 1;
>      mc->no_parallel =3D 1;
> +    mc->default_ram_id =3D "ram";
>  }
> =20
>  static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *=
data)
>=20

