Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7346193lff;
        Wed, 15 Jan 2020 11:27:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMvZINZk6Xq7VjewG7ap/lwJqLoGf29WCROAXdsIurGOsugTP5UiNfyeRtDQ+DxLzPKwBi
X-Received: by 2002:a17:906:5a95:: with SMTP id l21mr29854661ejq.24.1579116467742;
        Wed, 15 Jan 2020 11:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579116467; cv=none;
        d=google.com; s=arc-20160816;
        b=x5J7+aoYT6SLQCjCBioz4AOLZ5JKp7ICPzqiL5NWNkQtDwI3gB7/jq1++Ir8or3zNF
         mzebtuOsKPXoCf5JdYfjWXqd6rAfBlvzzr8BP5Xh3GbXdVIYWWHhJ+ULliiV1l0C/40l
         ujKxl4ZRBm4jQBfY41muKQ5Rc0Wnc90kseVkbIetu/hYKmVXvSKrjCBWPJAeP/532cRR
         eW6RKwmxa+Enrfz+rKO+rv88sQAzpduypN0WwgddsM+6SzgW3Ti24FBZcETB4oKXaHvc
         1Rm1ILYmjJE3bgXgwCf4D01L2WHlocRkKwpttf1fUl+eZzhvy5QCX8X1VBfFHMmQD9JJ
         vRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=icvhrBW1PVxpIIX+PKFYZC6iPa3UKQeyZdq9YW+nQjM=;
        b=nV02ZrBLlZOpfOfP4veKpECvtFhxe2ld6mO7Mcv90KLBD24fu0LV/v7CqA9aiNrSD6
         RnErYKcfNrD3qCZdsZRcOmm6ojDRuzjf/chnN/N5ajZ2/IYKY3aslVMK45oLiEjHRuam
         BP/GB6RmaoSth6GgwOmAnTiDEpVQA72zgbp84vhdQDPi2ntd3h4rvblc3RRSsS2bHIdg
         ncwcNSYQ9Qdva/sWeg+8MQ4eoPKNRiLAdlk7uIEVTLMop6653w8Va+dzeWQm+HjshY7g
         Kd+Nq7B/fULC2KaavmiT07uXTd7BmWGUpvx+yYKjnOyX5+9OWslt2Gm9nlj+iwCU8ULU
         tZGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dvvQcMPZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23si11347393edw.463.2020.01.15.11.27.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 11:27:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dvvQcMPZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iroKQ-0004KK-Hy
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 14:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iroCn-0001dl-LD
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:19:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iroCk-0000hy-6U
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:19:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31219
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iroCk-0000hk-3J
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 14:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579115989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icvhrBW1PVxpIIX+PKFYZC6iPa3UKQeyZdq9YW+nQjM=;
 b=dvvQcMPZ14k06q9/dD1K+YWAPiVMsGmdZsbbA//J5fk4i4iqBWYQICpiyQDJCq6vAqDmkV
 mLP/Dyc7hTCFFBQRRNVxBpF+1l2TAkz7bGrCFsQIKNCpDzMsZtXxRQMs65+6wFRYs2aWyB
 JOEovtfC12F/YLnrE0+B8CZZTF6tGZI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-mWt1U7SePAWC4_oDLR4l8A-1; Wed, 15 Jan 2020 14:19:46 -0500
Received: by mail-wr1-f71.google.com with SMTP id r2so8342631wrp.7
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 11:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E3IfmtLSaR04KvkBZVsKCcUXay0mUZAhGTTj4Sxtw+s=;
 b=DGjv2uFIirNxjM2vOQLKEqfBvywps+LtDR6YVuvLzpsvAWN0S6a6lCiJv5ykCB2EM1
 5dO/+gJFJ2LSv+FqNfpswo6bkNcqhojmY1N6z+0I6RjzdB93TcVFzP+35yUF5z0PDHdE
 BSsTK8/Tqp3XmrK0CO00Wrt5hUR21RDcdbEqDoxVVf15+ekOAm4w/XczCwVYb80IH/S7
 V4sDNAEmZcIRiHUSr0stZx4+2KJGZIOvb8CNLBdmekHVzr+Sdu9yqYkL9NZYs2EtNUj5
 pEiXlmK9+T6QbZihQ2UDWKdUI+lmipY66C5moImxgq76Gc2dJI7Lz20IHrOp/UK7SAkd
 X2gA==
X-Gm-Message-State: APjAAAVsrqgoI8PjKcN+Isp/sXXtwMo0DnuoM2SftVICZxchXZ7Vh26o
 4P5Nee+dZFljuxNvi7qt/Tvy7uyxAkC9P6MHHiRih2xedivH08uq0gGxrMXMAz2RPXfYcbKDmAR
 n19Wx2rGhspPv
X-Received: by 2002:adf:e290:: with SMTP id v16mr33958810wri.16.1579115985559; 
 Wed, 15 Jan 2020 11:19:45 -0800 (PST)
X-Received: by 2002:adf:e290:: with SMTP id v16mr33958798wri.16.1579115985385; 
 Wed, 15 Jan 2020 11:19:45 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id o16sm569027wmc.18.2020.01.15.11.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:19:44 -0800 (PST)
Subject: Re: [PATCH v2 10/86] arm:aspeed: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-11-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <db0a48be-4c18-664b-42f4-d415bedc72e6@redhat.com>
Date: Wed, 15 Jan 2020 20:19:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579100861-73692-11-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-MC-Unique: mWt1U7SePAWC4_oDLR4l8A-1
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PgOw++ImT8ck

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
> CC: clg@kaod.org
> CC: peter.maydell@linaro.org
> CC: andrew@aj.id.au
> CC: joel@jms.id.au
> CC: qemu-arm@nongnu.org
> ---
>   hw/arm/aspeed.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 525c547..330254b 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -35,7 +35,6 @@ static struct arm_boot_info aspeed_board_binfo =3D {
>   struct AspeedBoardState {
>       AspeedSoCState soc;
>       MemoryRegion ram_container;
> -    MemoryRegion ram;
>       MemoryRegion max_ram;
>   };
>  =20
> @@ -184,6 +183,7 @@ static void aspeed_machine_init(MachineState *machine=
)
>  =20
>       memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container=
",
>                          UINT32_MAX);
> +    memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
>  =20
>       object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
>                               (sizeof(bmc->soc)), amc->soc_name, &error_a=
bort,
> @@ -215,8 +215,6 @@ static void aspeed_machine_init(MachineState *machine=
)
>       object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>                                &error_fatal);
>  =20
> -    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
> -    memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
>       memory_region_add_subregion(get_system_memory(),
>                                   sc->memmap[ASPEED_SDRAM],
>                                   &bmc->ram_container);
> @@ -393,6 +391,7 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
>       mc->no_floppy =3D 1;
>       mc->no_cdrom =3D 1;
>       mc->no_parallel =3D 1;
> +    mc->default_ram_id =3D "ram";
>   }
>  =20
>   static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *d=
ata)
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

