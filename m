Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2798144lfi;
        Tue, 24 Mar 2020 06:51:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vurGo8PreTNp2Ms8Ir1NM7FJqKob3MdPGbEHMfMiPDQybE0btTgT3BV3xiShOeHpnbHIgDp
X-Received: by 2002:a37:d8a:: with SMTP id 132mr8945042qkn.270.1585057912071;
        Tue, 24 Mar 2020 06:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585057912; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTi++KCSnqNyy/w4O9N3gMAwL0m4ORgAIhIeD0mP4i5k2svXyCYOWvtPG6b9vW9Ruw
         hHjg3gOAX7q0KE+0f8Wd7ETXHeAnWBrbKwDNvOTt7x+al8VUcmey5lmExohTIoHc6hc9
         4J+3zGkghY+5b75lMbBO0nhBO+0ZOlaRvVbUAQ1cHqcI1wUwKIxoELbeG8feWzrNUkYa
         TrAGXFueMXCHS7FJKqYkSPKhqxvCpeZjvGCVumObdGW9iCjf0IlMh3XXVJZIYcuYd1xz
         7Up22EDAfC5DQPCinPxHbLJHepHXAlgA5KTcgfVlugaln5+OkD+ZabyJPsqKmYwN5+YN
         GbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NQ3BrcZcRe869MGEG3mEya/2DITKXWpltX6Obh6z5Y8=;
        b=PHWPijSODfw3FeGiKMXQNv8vxVwr4K9n2HPzCjsu2PdcKHU1XCoZu7J1cwTzj2Bksh
         DtV1LMkRb/s0kg9qLwYoz/85+u8X/4GM6S6Mv+JUgKbava10Ra9vNunudCMoZe2P5Dnl
         jjRQN39bY2WCRCcicOoJ34RjpdVAx9m0nvmrFB6KpLRZjVxLpWAeTusnFBw54GMa7/jK
         F6jMEyR17EG/0Ks3toEslS3nAtKcsHPWiIYEVqcq5XHRNKm9T/TeLAsVCc7ZHvqvHz5K
         ndcAY2fULdLDjY7P7ag0vTg//W3pflkkbLtArI7QotRg2kA8EIDCUn3tgIdhHBuh6zZL
         mxjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aI07/rKm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si10277356qkv.147.2020.03.24.06.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 06:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aI07/rKm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGjyB-00045r-HW
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 09:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGjxw-00043K-UE
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGjxv-0004AE-UJ
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:51:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:27427)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGjxv-00049x-RB
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585057895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQ3BrcZcRe869MGEG3mEya/2DITKXWpltX6Obh6z5Y8=;
 b=aI07/rKmQPQVnnDMeXhPQIfjOacxyzrhfFjy+KKHG/y+zcZ6ABg9xrYhlU8VRVHDLZ78Fb
 TxYKy7lCQb6SM66C3/2sP51jFeRvSelww0LA+TGYuvNzAlCCDPTqzaimpvIGI3fHmpszEu
 ZWrMo/OJyn56w4tXWqJe31mSOpTuXww=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-TAjxMBBTOem4NdU560IBKA-1; Tue, 24 Mar 2020 09:51:31 -0400
X-MC-Unique: TAjxMBBTOem4NdU560IBKA-1
Received: by mail-ed1-f70.google.com with SMTP id x1so14876101edv.14
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2020 06:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ckcfv+Xe3KOmGeQUVgWcTejMqOCF+il2FG+fbbla1sE=;
 b=t9vwDw8y7E5JZ45vuESDJPFbNkxZfUzCTA/oGpoJ5dTHaEEvlpjMKtvr+cAUBaGaqf
 9sRKP7LWZuGM0IRT0xdmb6zpuTO471Uy24ggNXdGvL8GzD8UR5X9WZBJQgh85VZAG+CO
 XpQGR85oe1JFoztqqEsC5n5hEPuWVxOOq6CHHSpAFkjPUyzNQe0g+CIuOHoA5hQE2xAN
 ljuLJ0HMBHZI7JoavHhIbOpND45ffzFYzs9eu0ukdsQWOcMgNhdwtNO126I5cypc26ml
 cLrT1b66tToMxQ7vs3OcCqrBiMYrVBLhjzAOMxdyktH4E0YeeIqXvjn5sFlgV4KgWV4r
 7G1A==
X-Gm-Message-State: ANhLgQ0I5bHUTMcGGSj/HpUvrJxujo01fz0HW112ZYNaurlGE2Shj2Lt
 6c5Pl8uLQ4YE7bxuQl5gmTxyKNuTDbiuRfxqgpx0ywQaxgbwepXUAACapG/DQzoXllZKCUzFdSd
 PmW+L9T8EsOj4
X-Received: by 2002:a17:906:4e12:: with SMTP id
 z18mr5854493eju.49.1585057890163; 
 Tue, 24 Mar 2020 06:51:30 -0700 (PDT)
X-Received: by 2002:a17:906:4e12:: with SMTP id
 z18mr5854481eju.49.1585057889833; 
 Tue, 24 Mar 2020 06:51:29 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id w20sm129122ejv.40.2020.03.24.06.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 06:51:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/arm/xlnx-zynqmp.c: Avoid memory leak in
 error-return path
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200324134947.15384-1-peter.maydell@linaro.org>
 <20200324134947.15384-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6451c169-3d1e-0106-42d6-95b2f5d69fd9@redhat.com>
Date: Tue, 24 Mar 2020 14:51:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200324134947.15384-2-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0FityelTK1TY

On 3/24/20 2:49 PM, Peter Maydell wrote:
> In xlnx_zynqmp_realize() if the attempt to realize the SD
> controller object fails then the error-return path will leak
> the 'bus_name' string. Fix this by deferring the allocation
> until after the realize has succeeded.
>=20
> Fixes: Coverity CID 1421911
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/xlnx-zynqmp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 49f1c8d0de2..a13dbeeacec 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -520,7 +520,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR])=
;
>  =20
>       for (i =3D 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> -        char *bus_name =3D g_strdup_printf("sd-bus%d", i);
> +        char *bus_name;
>           SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->sdhci[i]);
>           Object *sdhci =3D OBJECT(&s->sdhci[i]);
>  =20
> @@ -541,6 +541,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>           sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
>  =20
>           /* Alias controller SD bus to the SoC itself */
> +        bus_name =3D g_strdup_printf("sd-bus%d", i);
>           object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus",
>                                     &error_abort);
>           g_free(bus_name);
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

