Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1214182lfp;
        Tue, 21 Jan 2020 00:51:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTWsmzY0gQZZ8V47E9zBXzxY4gYmomgqpx++tzQDmcHmbFt5+cvtKXl59LPVVVcBh0oLBr
X-Received: by 2002:a0c:edc2:: with SMTP id i2mr3798486qvr.62.1579596689892;
        Tue, 21 Jan 2020 00:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579596689; cv=none;
        d=google.com; s=arc-20160816;
        b=TCJ9SlpFe8gKuMVnEHMczUj0a2QUZm7R7XmFJGENx4OzqeeBCvxhbbr075JZCXTDeZ
         ag8TVz+VQW5d0coOtrxnHVBB6pKmpnOv3Qr0oCeGamK4GMjjwISb5ZHBPg2TBa/yWj1L
         iUaQCvVNJFs2jX2ZTJ2t52mCyhwS/W6JIWEqIw3DOhJ+bcXZeu4YFm11hk7CfLWCwqYe
         xfSICPFj1vLudZytgFq8jG/+qjwsJyTCOm5BIXomrSBKBkYuJdcQOJp97I0ECTGy4CLD
         gzJDpxrlPqFsrBDXcPdn+oGAQ2GFxSbIXQDez1en47KpiB2UZ7ZCLEK9VE+Y8uOhniKQ
         KmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yjHPxg5qB8KbvaBa0oMco9NZs9Nm0MWWrx+PgSbqDhw=;
        b=dz/IyD5VYsKn3a1UBiVK6yra9Qm5m4IoMI6F2eBS+u4whsGzSPixfLvfAHQIJ5Ydn3
         asinldkQtH+G/2Kci13yyvVsyvr6p7eisrXyQ7cD8pVEBxdB6HqAl8GWmfzN7rsSKly5
         GaJv0Y44plZLH+NJjnr2kC0GohI72+bHbuXo3Keo1s4u29JcB7sPP3/UTTQ44s0UdZlx
         aaJAFq4eb1H9sx2RZHDIF3YFfiTwYp1QNOnW1lhRR3wxJUSxu7dZ5mkGK53MFkqk0HvR
         3y7m2FrZFBW+rhXzGrZrOENM0pcXtmCIoR1tNy1ULAY1U4Yw00A0I6iOp0x4q3BkZ9aV
         SMKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2plpXL6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx5si21373418qvb.197.2020.01.21.00.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 00:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2plpXL6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itpFx-0004Ip-9y
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 03:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itpF0-0003ok-PQ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 03:50:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itpEw-0007s9-Gd
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 03:50:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53635
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itpEw-0007rt-CB
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 03:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579596625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjHPxg5qB8KbvaBa0oMco9NZs9Nm0MWWrx+PgSbqDhw=;
 b=f2plpXL6T8uJYYtpEpO6Xe2+gys6ztOQRt8CwCSKhK3w9O9R6ROFqnes945FcQIVjga4lP
 mKej34nDGnNCPqXoiEEH9MAe8+QlgFvyAEk6w/G+dlg6SbdotEq+5hrNU8RHTS9emfmiQx
 oaxjyHA8RaWMeVAQVIvbOy1mkFY9/Gk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-lr5QoUiAMzevxWsuyjP3nA-1; Tue, 21 Jan 2020 03:50:24 -0500
Received: by mail-wm1-f70.google.com with SMTP id g26so215626wmk.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 00:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ugJAjvR5ekoeAAftioBbAxnSs8SCfOCAgEIwawD2q0=;
 b=ucQbV2SigPxekYQkXnCuzGPKziW0DzTPivE4M35GI789JiZHtgKggGTiOK/0x9z6bc
 bkhU4lbTNUYc4gsOwA+j7YHMDNEotS8gjr6Ner557Vi+CP/NLj7OsnhXf9J9AMVsMXrb
 m4hmkb1MMA1iwAl6Tm7zKeBfNKw8wueQcVgXfLh78qJkflsnTF5Sw2vCe48Bl0m6w5VO
 YcUzECRryBNMzLMCU4zdjFyp2Ne8yRWero34mzLpjTxzA3LS8ny+3PYU5ArcczAI9izG
 tRfnSbTcrMDa3jYegZEp+1OejCXFshYihByotbzqvG/mSdd9AP7A5HWKV6mlBlGyWWa7
 vRvA==
X-Gm-Message-State: APjAAAV7206VT7Q/6qL6jFZ4AtPO9RDaVBkJ1pksRJEYXyQ3+1Nab6H8
 WH1KNSsRAYqZcIZx+wRZiulOLkIZki+G/7IGE2OyIqnU2yLuP6ifx8toWBkb56gEMOwCn9X4sg8
 bosadN6kbVcFJecc=
X-Received: by 2002:adf:ea42:: with SMTP id j2mr3832464wrn.270.1579596623135; 
 Tue, 21 Jan 2020 00:50:23 -0800 (PST)
X-Received: by 2002:adf:ea42:: with SMTP id j2mr3832421wrn.270.1579596622665; 
 Tue, 21 Jan 2020 00:50:22 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id p5sm49154069wrt.79.2020.01.21.00.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 00:50:22 -0800 (PST)
Subject: Re: [PATCH 1/2] aspeed/scu: Create separate write callbacks
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20200121013302.43839-1-joel@jms.id.au>
 <20200121013302.43839-2-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <acc9731a-9920-b2c4-94ff-7cc74810f0f2@redhat.com>
Date: Tue, 21 Jan 2020 09:50:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121013302.43839-2-joel@jms.id.au>
Content-Language: en-US
X-MC-Unique: lr5QoUiAMzevxWsuyjP3nA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t0OlPWvTUhN/



On 1/21/20 2:33 AM, Joel Stanley wrote:
> This splits the common write callback into separate ast2400 and ast2500
> implementations. This makes it clearer when implementing differing
> behaviour.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/misc/aspeed_scu.c | 80 +++++++++++++++++++++++++++++++-------------
>   1 file changed, 57 insertions(+), 23 deletions(-)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index f62fa25e3474..7108cad8c6a7 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -232,8 +232,47 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr=
 offset, unsigned size)
>       return s->regs[reg];
>   }
>  =20
> -static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
> -                             unsigned size)
> +static void aspeed_ast2400_scu_write(void *opaque, hwaddr offset,
> +                                     uint64_t data, unsigned size)
> +{
> +    AspeedSCUState *s =3D ASPEED_SCU(opaque);
> +    int reg =3D TO_REG(offset);
> +

I'd move the trace call here:

        trace_aspeed_scu_write(offset, size, data);

(we might be running with tracing enabled but not guest_errors).

Regardless:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +    if (reg >=3D ASPEED_SCU_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRI=
x "\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    if (reg > PROT_KEY && reg < CPU2_BASE_SEG1 &&
> +            !s->regs[PROT_KEY]) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__)=
;
> +    }
> +
> +    trace_aspeed_scu_write(offset, size, data);
> +
> +    switch (reg) {
> +    case PROT_KEY:
> +        s->regs[reg] =3D (data =3D=3D ASPEED_SCU_PROT_KEY) ? 1 : 0;
> +        return;
> +    case SILICON_REV:
> +    case FREQ_CNTR_EVAL:
> +    case VGA_SCRATCH1 ... VGA_SCRATCH8:
> +    case RNG_DATA:
> +    case FREE_CNTR4:
> +    case FREE_CNTR4_EXT:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Write to read-only offset 0x%" HWADDR_PRIx "\=
n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    s->regs[reg] =3D data;
> +}
> +
> +static void aspeed_ast2500_scu_write(void *opaque, hwaddr offset,
> +                                     uint64_t data, unsigned size)
>   {
>       AspeedSCUState *s =3D ASPEED_SCU(opaque);
>       int reg =3D TO_REG(offset);
> @@ -257,25 +296,11 @@ static void aspeed_scu_write(void *opaque, hwaddr o=
ffset, uint64_t data,
>       case PROT_KEY:
>           s->regs[reg] =3D (data =3D=3D ASPEED_SCU_PROT_KEY) ? 1 : 0;
>           return;
> -    case CLK_SEL:
> -        s->regs[reg] =3D data;
> -        break;
>       case HW_STRAP1:
> -        if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
> -            s->regs[HW_STRAP1] |=3D data;
> -            return;
> -        }
> -        /* Jump to assignment below */
> -        break;
> +        s->regs[HW_STRAP1] |=3D data;
> +        return;
>       case SILICON_REV:
> -        if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
> -            s->regs[HW_STRAP1] &=3D ~data;
> -        } else {
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "%s: Write to read-only offset 0x%" HWADDR_PRI=
x "\n",
> -                          __func__, offset);
> -        }
> -        /* Avoid assignment below, we've handled everything */
> +        s->regs[HW_STRAP1] &=3D ~data;
>           return;
>       case FREQ_CNTR_EVAL:
>       case VGA_SCRATCH1 ... VGA_SCRATCH8:
> @@ -291,9 +316,18 @@ static void aspeed_scu_write(void *opaque, hwaddr of=
fset, uint64_t data,
>       s->regs[reg] =3D data;
>   }
>  =20
> -static const MemoryRegionOps aspeed_scu_ops =3D {
> +static const MemoryRegionOps aspeed_ast2400_scu_ops =3D {
> +    .read =3D aspeed_scu_read,
> +    .write =3D aspeed_ast2400_scu_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid.min_access_size =3D 4,
> +    .valid.max_access_size =3D 4,
> +    .valid.unaligned =3D false,
> +};
> +
> +static const MemoryRegionOps aspeed_ast2500_scu_ops =3D {
>       .read =3D aspeed_scu_read,
> -    .write =3D aspeed_scu_write,
> +    .write =3D aspeed_ast2500_scu_write,
>       .endianness =3D DEVICE_LITTLE_ENDIAN,
>       .valid.min_access_size =3D 4,
>       .valid.max_access_size =3D 4,
> @@ -469,7 +503,7 @@ static void aspeed_2400_scu_class_init(ObjectClass *k=
lass, void *data)
>       asc->calc_hpll =3D aspeed_2400_scu_calc_hpll;
>       asc->apb_divider =3D 2;
>       asc->nr_regs =3D ASPEED_SCU_NR_REGS;
> -    asc->ops =3D &aspeed_scu_ops;
> +    asc->ops =3D &aspeed_ast2400_scu_ops;
>   }
>  =20
>   static const TypeInfo aspeed_2400_scu_info =3D {
> @@ -489,7 +523,7 @@ static void aspeed_2500_scu_class_init(ObjectClass *k=
lass, void *data)
>       asc->calc_hpll =3D aspeed_2500_scu_calc_hpll;
>       asc->apb_divider =3D 4;
>       asc->nr_regs =3D ASPEED_SCU_NR_REGS;
> -    asc->ops =3D &aspeed_scu_ops;
> +    asc->ops =3D &aspeed_ast2500_scu_ops;
>   }
>  =20
>   static const TypeInfo aspeed_2500_scu_info =3D {
>=20

