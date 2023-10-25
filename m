Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2835681ejb;
        Wed, 25 Oct 2023 08:43:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD1NTj7T0mO6iHF7k+wfrAixemW9X2AUu4Qm+C0DrK7Lw+W/+bNMc6RjtyHdbWMs6uYszI
X-Received: by 2002:a05:600c:3146:b0:409:677:31e7 with SMTP id h6-20020a05600c314600b00409067731e7mr6146612wmo.11.1698248584756;
        Wed, 25 Oct 2023 08:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698248584; cv=none;
        d=google.com; s=arc-20160816;
        b=iX+GAmqxR91hH/NIblMpkcpddKpXz3Zyy4bG4VFE6SWkCNQiV2Cbx/hvlQATweY7ow
         Xl5UVsjSVRyw88nRLSzxCwldB/WVOHs+rx50PhozqI2z7r77pgHCp+6KLfQuY5OIrCwZ
         /FdRJp3FGu5/1z5Jj9zEzpvHBkbQq67s/UivrvLAXFHzJ1QI3kgoafrsxie8eltuGvZJ
         JADscn6kDSxdjW07AuotMoHxiwaslogfYhp4rG+9VXUJlFgh3Wd4kFlJfXBC3uD9rKbQ
         LHW9rqjGKIcaW054eCnFm2C4X4LoeQlbn7dHxxWjo62GyBWQER6uQ8f7/33x1vMy0jw2
         ARXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pHBwe3N98CTxQYgA0OpqzFBkPW8+uhBzLc9xXUB5YP4=;
        fh=FNzWux/+zpzkpXsUlMyO0uxwbjBVHp/d4+/vYDk4SqQ=;
        b=EwG2bJEwFzjVLFCOUWbS9Sajh2om9ruCBwaL1bIJml5hvAADxuiXhgV8CFp14DuSLP
         qyowQvA+VLqt8mewYnOBmv76t5Hm8atZJoS4Nq57HXxr+/4Dn1L7wVnYkF43AXvbucJh
         BswrdNSsq2Mea7kkGYisi5qSqwdMiCdsSoe8yuyvdMOoUMGfabbGrmSQ//UzONhE/lNS
         klsBceMlbMixOda/VEVIjB0S47JW8LSXQsVNkVX17xQYATxOIOJFgfl5dWhorAIxmIbU
         puzSatWBFlslHHSPCqE9+bK3miAwtyAr08dV+FmHMGEBoCGW5xts5kcSFld5kMPLOUlJ
         E2BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=le++0LCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a05600c350800b00407755009f4si77388wmq.154.2023.10.25.08.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 08:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=le++0LCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvg1n-0003H3-V7; Wed, 25 Oct 2023 11:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvg1k-0003Fc-Ma
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 11:42:37 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvg1g-0000X7-8r
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 11:42:35 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bdf4752c3cso39104375ad.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698248551; x=1698853351; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pHBwe3N98CTxQYgA0OpqzFBkPW8+uhBzLc9xXUB5YP4=;
 b=le++0LCqqrMepzSApm/zfAQQfbv7NL/UOBcNEXUuGEVvBd3Ob9VU2hILzsVInf5lpb
 xhFZSgHBsPj3YX0Dp3XwouNLuvXoken3wqavKFMkoZM/+1datZs1V+HrUAy3utuaz5rC
 fOy1QKogEy8J011J8bpE5pcX+y1guv8ErfJQDpFulqdG9Sydmnui7JYxHbi3sh0NqeKy
 o6goJO5XLAhr2WT0MUHvTLH1bHw0rtzQL9SZoa6bXrgyw8gMqvG4bNId0NO5oSkSOvlG
 ck1/LITGjBypn6e5CJucgAz1H9S+TRXx032+hdO3DafSjEA2vxT2boc2tiLFuc750e0n
 IiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698248551; x=1698853351;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pHBwe3N98CTxQYgA0OpqzFBkPW8+uhBzLc9xXUB5YP4=;
 b=V4+U1SQ1pW26/2LLNpKskofLvYJ5/qmzldUaHhZefEgHvK6rKToUanhgiNpejHxcgs
 j6FjL6QevOdM5P1hXXKGXj459+rc9g+XQLovLo63Jf5C2uioskvRKSpWOm4dIuHUHsh2
 jNflFdJedEORGiiAXyewziysQnfjQVbLu1loDjTZP3bkZpvfMt/om5L8fqxvO732B/D0
 7hGFUmHNs0g5aDDkgEQhUiorcHQIwSAjeFKNJk3npYyJQOrtsjOWUle+6pLzERant+qm
 6QjFbFSHcG7Himk30RNiOfdxIOoGQctU9GHCfDhnmBNmnI77jTod9JzM6ztmSEKtsaS7
 OM0g==
X-Gm-Message-State: AOJu0YwLWHZNMJfQQ1i/mc2QdckoHVrVN/QT4XtCLs7ng/wQnKnoTmCe
 TWIVfjlvIPOh2ulyziiBCJj1nA==
X-Received: by 2002:a17:902:d904:b0:1c9:e68a:1b58 with SMTP id
 c4-20020a170902d90400b001c9e68a1b58mr10283255plz.54.1698248550870; 
 Wed, 25 Oct 2023 08:42:30 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170902da8600b001bf6ea340a9sm9386306plx.159.2023.10.25.08.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 08:42:30 -0700 (PDT)
Message-ID: <c18da34b-56ae-4c9c-86a8-379e7b0fc759@ventanamicro.com>
Date: Wed, 25 Oct 2023 12:42:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/45] hw/riscv: use qemu_configure_nic_device()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20231022155200.436340-1-dwmw2@infradead.org>
 <20231022155200.436340-39-dwmw2@infradead.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231022155200.436340-39-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hXlxu5XviBXV



On 10/22/23 12:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/riscv/microchip_pfsoc.c | 13 ++-----------
>   hw/riscv/sifive_u.c        |  7 +------
>   2 files changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index b775aa8946..8e0e3aa20c 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -411,17 +411,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>           memmap[MICROCHIP_PFSOC_USB].size);
>   
>       /* GEMs */

I believe you forgot to remove the 'nd' variable. Building with this patch (applying
patches 1 to 4 first) fails with:


../hw/riscv/microchip_pfsoc.c: In function ‘microchip_pfsoc_soc_realize’:
../hw/riscv/microchip_pfsoc.c:205:14: error: unused variable ‘nd’ [-Werror=unused-variable]
   205 |     NICInfo *nd;
       |              ^~
cc1: all warnings being treated as errors


Patch looks good otherwise. Thanks,

Daniel

> -
> -    nd = &nd_table[0];
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem0), nd);
> -    }
> -    nd = &nd_table[1];
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem1), nd);
> -    }
> +    qemu_configure_nic_device(DEVICE(&s->gem0), true, NULL);
> +    qemu_configure_nic_device(DEVICE(&s->gem1), true, NULL);
>   
>       object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
>       object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ec76dce6c9..5207ec1fa5 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -789,7 +789,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>       MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>       char *plic_hart_config;
>       int i, j;
> -    NICInfo *nd = &nd_table[0];
>   
>       qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
>       qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
> @@ -893,11 +892,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>       }
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_DEV_OTP].base);
>   
> -    /* FIXME use qdev NIC properties instead of nd_table[] */
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem), nd);
> -    }
> +    qemu_configure_nic_device(DEVICE(&s->gem), true, NULL);
>       object_property_set_int(OBJECT(&s->gem), "revision", GEM_REVISION,
>                               &error_abort);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem), errp)) {
