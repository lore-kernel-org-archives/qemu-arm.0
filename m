Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2730873lfi;
        Tue, 24 Mar 2020 05:53:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuzs4SJW6VMJ402ihjOzKB/mp2nvo0lssjzTX68nTjJAL+K4JjdoXd34RvqLcsTfgxw+MX9
X-Received: by 2002:ad4:4242:: with SMTP id l2mr13585835qvq.98.1585054411234;
        Tue, 24 Mar 2020 05:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585054411; cv=none;
        d=google.com; s=arc-20160816;
        b=iqqLPvvdoyh+NqzT9PSKP+K2FjxIt7I82JlyqAIPgjhNgB75/dXm7olJhOWIzt6qaK
         9qZe8q1oq4XLPW2nAbH6g14VjUbRX+BAb+Oa81z0d0tMjmvBezdD4Zmr+E8BPkFwfdG6
         WKiNHSOyo6Mf+nqLn38U2lhPT7hOSWLhan1EqYcvASzYh/dT1WJApBno+SguzvrL57hK
         N1PKWuG0mTP363pP3KLmnuGDVi21tFfu+IhuF0AN8R6rYMW3YTuJRdz/h7dJwzhiRjEk
         jWzm+JexzvxRbRSR7EVk/ip71NOe7Se8XCYRXll/6fcsIou5B5P1S7hikN25kRbChL7r
         rNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+2NZ7DxN165nxt3Ld/2Dj1pHpLBcwyWWYgmoYn3tmrM=;
        b=yScMgUT3G0U1vZlaDaYoIruuyuFpLLo+/0QYyJcxYPIp7tuDzoTbAlF1ouozagJbK4
         8mYq7yXkCyELERCqleqoErdIDvFMfU11hkEeKzqE+tCisn6NiGJASo2Lh6rtGBofPUc+
         XyDbMP+H1FX2jysbjJqmq8ZFMNOtbAfsNLSzea0GawVqk4wX8dl32v1hOJDtDxAH+Tkr
         uLeONb7pTkEmeJZG2xGrdHbq0Hv9B/+NKrKM74ye7vbSgidYrEjyxgg8CPawTfmFblD+
         60r+pMeJLUYMJnLIGkSKSdfKC+uOrqteRWje/kdnE8DrqRQCHwlE7r4pNzbro2s9LSxl
         D8BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IleU1f1i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k48si10388190qtc.162.2020.03.24.05.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 05:53:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IleU1f1i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGj3i-0007c5-L0
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 08:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGj3a-0007Zc-T9
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 08:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGj3Z-0007Ri-RB
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 08:53:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:34726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGj3Z-0007RX-OD
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 08:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585054401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2NZ7DxN165nxt3Ld/2Dj1pHpLBcwyWWYgmoYn3tmrM=;
 b=IleU1f1iMbjcYuX40Z9AVILrjJU9275Qu0lR0HrxTxnsaOwx3tIhfCNoRlo/XlhqkOM6z6
 Z910yhcYJ+YleeQqd7zKNLhpnlet/bAc7urXIULQP8CrzMD2IO+5jJNky+BMuLfJfiY7o5
 J1s0v6Uw6u3hDb6nDtLIFn6tESJ0j4g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-bV6yhlcOOUCwQSb4vtgDeQ-1; Tue, 24 Mar 2020 08:53:19 -0400
X-MC-Unique: bV6yhlcOOUCwQSb4vtgDeQ-1
Received: by mail-ed1-f69.google.com with SMTP id x1so14739124edv.14
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2020 05:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iC7C9ezAbcbwQKTXyZO5oD6og3EO/2IfuRgori7ynII=;
 b=Pdtm6AFvxxl4O/2R7Bce1G5YZxDi+3Cze5TWhz/RHNQ29so2g2aUmx/W7H1qUqegmJ
 M63007m1bU05qtJeA8dXBKflbNqjQCQvr19ZPZQz2Otp2b+MsVtxe0mr60c2ew0/Vc0v
 Bkq5JM82zIQRMne3erhDjuuk9BWVXyufMN9W1O1zV3zkG+rTo4TTmoi7nbsKuPWrxfVZ
 2HrpJQRzBz52oBh9/qQVqxgU0o2/ld84cWGaGytOqB3IoSjhuASIEB0M566DXUPfWHAi
 pYiAWjW6xSq7uR1vR7l/+zqIpCnHI8EjkC6YkMSXaMVrnMO0/7u94Dx8yrICIo1O3Szx
 VkqA==
X-Gm-Message-State: ANhLgQ1l1nRniMidXhaYPddsGBwYglcdTVULydM9T+GcL/X26dMNV1a9
 RJckbn14JACuHuLDoXVkBQYGzUfEDpzr+szwCPyhf57DpqR05rw5BwBkeiCQtvIVUGGXZFadw2w
 jNl44u2EAN+ES
X-Received: by 2002:a17:906:6987:: with SMTP id
 i7mr24261120ejr.12.1585054398272; 
 Tue, 24 Mar 2020 05:53:18 -0700 (PDT)
X-Received: by 2002:a17:906:6987:: with SMTP id
 i7mr24261104ejr.12.1585054397971; 
 Tue, 24 Mar 2020 05:53:17 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id m21sm1287117edb.90.2020.03.24.05.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 05:53:17 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] hw/arm/fsl-imx6ul: Connect watchdog interrupts
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200322211919.11335-1-linux@roeck-us.net>
 <20200322211919.11335-7-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9088952f-b594-9495-17c2-a33bab7655b2@redhat.com>
Date: Tue, 24 Mar 2020 13:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200322211919.11335-7-linux@roeck-us.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FTV5CYDV4WJr

On 3/22/20 10:19 PM, Guenter Roeck wrote:
> With this commit, the watchdog on mcimx6ul-evk is fully operational,
> including pretimeout support.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: No change
>=20
>   hw/arm/fsl-imx6ul.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>=20
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index 56dfd7cecc..3ecb212da6 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -531,12 +531,22 @@ static void fsl_imx6ul_realize(DeviceState *dev, Er=
ror **errp)
>               FSL_IMX6UL_WDOG2_ADDR,
>               FSL_IMX6UL_WDOG3_ADDR,
>           };
> +        static const int FSL_IMX6UL_WDOGn_IRQ[FSL_IMX6UL_NUM_WDTS] =3D {
> +            FSL_IMX6UL_WDOG1_IRQ,
> +            FSL_IMX6UL_WDOG2_IRQ,
> +            FSL_IMX6UL_WDOG3_IRQ,
> +        };
>  =20
> +        object_property_set_bool(OBJECT(&s->wdt[i]), true, "pretimeout-s=
upport",
> +                                 &error_abort);
>           object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",
>                                    &error_abort);
>  =20
>           sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
>                           FSL_IMX6UL_WDOGn_ADDR[i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> +                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
> +                                            FSL_IMX6UL_WDOGn_IRQ[i]));
>       }
>  =20
>       /*
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

