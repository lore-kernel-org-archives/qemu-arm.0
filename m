Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp214328wrq;
        Tue, 22 Oct 2019 10:36:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzr7TYxgLxdp71l6xtjImAKizcmyz1Nz5IDpREzhHr409z4REpF+Ym7HIEp+hpa7eRV5cmm
X-Received: by 2002:a37:9bc2:: with SMTP id d185mr3954432qke.299.1571765804304;
        Tue, 22 Oct 2019 10:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571765804; cv=none;
        d=google.com; s=arc-20160816;
        b=mWQO63UZlI/odL/SMZlqkrLDzexQTW2Xbxp4v83cA1i4Lc3UxE7asyGdrSTwitSiIL
         j/vF3pCNBXEU8g2gucd0GtCxWAfXXJofMg+P4yXTZJ0YI6VK8Uai75L+XiCkPtHOoiCr
         7AGdgdOq0F5R0YFSCQAcm0SEZ2GooWMjCAcOY3NhayLHogAYYI+MXY2ZzVypmKoUdQEm
         VGLG4o81i1QGDaST60fRp6J6KrNhQFkN4SjEwFA2nMUyvEfyE1EnoXF/XRJNDX1h2UzF
         n9crhVvlFww8ub+6rQByWixLRawoWqS7pOZo7c+fjZL+kQmfnMnE273a70cdOr9KWp83
         Zsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=njvDPZmR9dAOTk7xcxUiwi+QN8u9RtbSx+C/NzEYklk=;
        b=I8KlN9vJpS3bSsgr8JIwOFJ171uEZICAs/H5Gtyk57r8cW3NsH3IwFSrwGm9QYZjrk
         8OQmAU8hqWlCuGQhPdv950zcv/FEnXlETyUSgpqWnuPBeWbwCnIp1EpIDAV5DLkAMqdU
         4DIBJ35DFFWelZQYOqzrTtPwKbBG192e9jh0S8fwbBvqG6+VaGYXkoD5SvOjaeNlBooH
         7bCL3hIGHdTd/alcjSOIxHtqSNO8zVFDzMKwyIYzPRJXBg9g6s2vinohN+WgCQDD+7br
         r+kdTbzFovSmYmD0LisfGLJcppSZCsCaaFUQO1U9e0HASURh6G28ZSLwJSlgg/ufglm+
         QXPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lu1J5mgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j91si17128515qtd.248.2019.10.22.10.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 10:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lu1J5mgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMy5L-0007UC-Ns
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 13:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMy5D-0007Tw-7Q
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMy5C-0001S5-2S
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:36:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48553
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMy5B-0001Rn-Vq
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571765793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njvDPZmR9dAOTk7xcxUiwi+QN8u9RtbSx+C/NzEYklk=;
 b=Lu1J5mgioEpvwawnym4I+UakpIm6ggA9r+lJOWwh4fbsLqBERud0Qmz/bf5ihxYeqjwZQ+
 BSJYENZKyFx2ofGY1AyaMSw32+xX4XykXhcLltXrdFHUv7ZL1Xx5A/uWP7M+DD4KwLs3KD
 xfqvdGTpFsrOB6TWYSdCGf3QLXD52C8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-xsPb3jDyP5KypXir6W5RCg-1; Tue, 22 Oct 2019 13:36:29 -0400
Received: by mail-wm1-f72.google.com with SMTP id z24so6542971wmk.8
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 10:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SqG/NGKXWX5u1rAz22J+hGb7pyFeNq29aXc9Mor0Zi4=;
 b=qfeTFkPr3J/JswWrBhy4DB6KOjWsr1+x/DQ603ffzUbqDavuoMhghXsIW8VdJRwwqL
 /d8TnowRqu9gHxSBKAx+rnGRAnTW7+UupE+lGMiIin334HImzOPppMbm781RfuccM2Yy
 fb1KU/Q+y6zx1VSarmdxa18e4YzTnuWJiuBBWftbB46tHVFPZvHkRSpfEutfG/z8Xndg
 26US49EwuP6iymZAZslqut/OF6++35inqFUkckdf2Tx0TOx3DwlXpEcgf5yn3YgPTcvu
 ryfEQFCZPsMcs9ta0cyvfhH8ray04ql5SSZmPfmpko3JCUFHi5qflqAzXfCHgLRySJnr
 W7gQ==
X-Gm-Message-State: APjAAAVH2hors7iq4iOykretokO1YpwCbo9mWtb8vxJ0sPTULsd7FBvg
 jc2e5X5Q6Gb8NU5Zk5gYT0CpAxt5lJYu4UQEV/SsV/5Yi9Scq8+mJF1KsJoYanckjkveue4BU6B
 bIyFJKOBCg2x5
X-Received: by 2002:a1c:7414:: with SMTP id p20mr2328577wmc.175.1571765788419; 
 Tue, 22 Oct 2019 10:36:28 -0700 (PDT)
X-Received: by 2002:a1c:7414:: with SMTP id p20mr2328557wmc.175.1571765788149; 
 Tue, 22 Oct 2019 10:36:28 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id p10sm20997816wrx.2.2019.10.22.10.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2019 10:36:27 -0700 (PDT)
Subject: Re: [PATCH 3/5] aspeed: Add a DRAM memory region at the SoC level
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <01328c05-0f16-c53c-19b1-825d3b910dcf@redhat.com>
Date: Tue, 22 Oct 2019 19:36:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016085035.12136-4-clg@kaod.org>
Content-Language: en-US
X-MC-Unique: xsPb3jDyP5KypXir6W5RCg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5UdrD5M1T77I

On 10/16/19 10:50 AM, C=C3=A9dric Le Goater wrote:
> Currently, we link the DRAM memory region to the FMC model (for DMAs)
> through a property alias at the SoC level. The I2C model will need a
> similar region for DMA support, add a DRAM region property at the SoC
> level for both model to use.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h | 1 +
>   hw/arm/aspeed_ast2600.c     | 7 +++++--
>   hw/arm/aspeed_soc.c         | 9 +++++++--
>   3 files changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index cccb684a19bb..3375ef91607f 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -40,6 +40,7 @@ typedef struct AspeedSoCState {
>       ARMCPU cpu[ASPEED_CPUS_NUM];
>       uint32_t num_cpus;
>       A15MPPrivState     a7mpcore;
> +    MemoryRegion *dram_mr;
>       MemoryRegion sram;
>       AspeedVICState vic;
>       AspeedRtcState rtc;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 931887ac681f..a403c2aae067 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -158,8 +158,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
>                             typename);
>       object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
>                                 &error_abort);
> -    object_property_add_alias(obj, "dram", OBJECT(&s->fmc), "dram",
> -                              &error_abort);
>  =20
>       for (i =3D 0; i < sc->spis_num; i++) {
>           snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, =
socname);
> @@ -362,6 +360,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
>       }
>  =20
>       /* FMC, The number of CS is set at the board level */
> +    object_property_set_link(OBJECT(&s->fmc), OBJECT(s->dram_mr), "dram"=
, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>       object_property_set_int(OBJECT(&s->fmc), sc->memmap[ASPEED_SDRAM],
>                               "sdram-base", &err);
>       if (err) {
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index f4fe243458fd..dd1ee0e3336d 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -175,8 +175,6 @@ static void aspeed_soc_init(Object *obj)
>                             typename);
>       object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
>                                 &error_abort);
> -    object_property_add_alias(obj, "dram", OBJECT(&s->fmc), "dram",
> -                              &error_abort);
>  =20
>       for (i =3D 0; i < sc->spis_num; i++) {
>           snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, =
socname);
> @@ -323,6 +321,11 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>                          aspeed_soc_get_irq(s, ASPEED_I2C));
>  =20
>       /* FMC, The number of CS is set at the board level */
> +    object_property_set_link(OBJECT(&s->fmc), OBJECT(s->dram_mr), "dram"=
, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>       object_property_set_int(OBJECT(&s->fmc), sc->memmap[ASPEED_SDRAM],
>                               "sdram-base", &err);
>       if (err) {
> @@ -429,6 +432,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
>   }
>   static Property aspeed_soc_properties[] =3D {
>       DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
> +    DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
> +                     MemoryRegion *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

