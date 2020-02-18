Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5909679lfp;
        Tue, 18 Feb 2020 01:07:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDJI/XvPsmZW5AxO1Ws09gslvN2rlWEjgaPrgGRqMqYTOh4lIgsDRJWyxyzZ7tDU5cNXBc
X-Received: by 2002:a37:7a06:: with SMTP id v6mr18230775qkc.378.1582016877029;
        Tue, 18 Feb 2020 01:07:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb19si1392359qvb.115.2020.02.18.01.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zoJ2nwmf;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3yrE-0003Rq-8F
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1j3yqn-0003O0-Dq
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:07:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luc.michel@greensocs.com>) id 1j3yqm-0004zp-By
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:07:29 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:33880)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luc.michel@greensocs.com>)
 id 1j3yqm-0004yJ-4A; Tue, 18 Feb 2020 04:07:28 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8DBB696EF0;
 Tue, 18 Feb 2020 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582016846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEBeQOCfBea+/8WEfac4d7SyXNcXU8AzYjmb1LCt6dQ=;
 b=zoJ2nwmfavUMkxdmrFT6/ATRhUk8Un9czFe/CA3R9RHISdKcoHGzBjrcTR9gSl8kIQ2V9z
 zUWSPT7yjA0Tn4+DspVhAF4Rw5JFhMCxEPdPrmy66srWJ4Q4d4n4nwHN8u4IVjRUVGsT3B
 RiWW7JLpZcw84eNuvqXRaWxz9rNI3t0=
Subject: Re: [PATCH v2 03/13] hw/arm/raspi: Use more specific machine names
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200217114533.17779-1-f4bug@amsat.org>
 <20200217114533.17779-4-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <a9e4bedd-4c32-8f00-a69d-627965db8118@greensocs.com>
Date: Tue, 18 Feb 2020 10:07:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217114533.17779-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-PH
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582016846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEBeQOCfBea+/8WEfac4d7SyXNcXU8AzYjmb1LCt6dQ=;
 b=t2pi8SQ6vtjuFZKwB5HTWdB7Lf0fd9iUioIeoFglcZWebPS1v5RW/So0UZ5zIvvxv3v42S
 3WLwgQtRjfWDPTEGORqMUUbf6G+I+lOQq38Ki7qMI8KI4SLGsRcWNzhuKSCHPC6uDV7WiL
 zUVgRkqn7pD8axamhtpFPj1Ypm6T4A0=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582016846; a=rsa-sha256; cv=none;
 b=41mOPnruNV6UPSsyvM3bcTX61e297qjB4NODKMmgltiCJpjWd/6JvhV+BaXTB9neJAcLHU
 vqJN0Pw+kZ0dWh/YlnzWSzdyUApYbdkAjDxyIubaGKlgcr2aB9ql6fCCuXh4WEZ+tKzV1w
 7NE8Icfo+gfvbU9cvdJQbDiqhxC/1LI=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tSGvzzQJI77x

On 2/17/20 12:45 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Now that we can instantiate different machines based on their
> board_rev register value, we can have various raspi2 and raspi3.
>=20
> In commit fc78a990ec103 we corrected the machine description.
> Correct the machine names too. For backward compatibility, add
> an alias to the previous generic name.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/raspi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 1a8c135dc6..d9e8acfe3b 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -327,6 +327,7 @@ static void raspi2b_machine_class_init(ObjectClass =
*oc, void *data)
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>      RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> =20
> +    mc->alias =3D "raspi2";
>      rmc->board_rev =3D 0xa21041;
>      raspi_machine_class_common_init(mc, rmc->board_rev);
>  };
> @@ -337,6 +338,7 @@ static void raspi3b_machine_class_init(ObjectClass =
*oc, void *data)
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>      RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> =20
> +    mc->alias =3D "raspi3";
>      rmc->board_rev =3D 0xa02082;
>      raspi_machine_class_common_init(mc, rmc->board_rev);
>  };
> @@ -344,12 +346,12 @@ static void raspi3b_machine_class_init(ObjectClas=
s *oc, void *data)
> =20
>  static const TypeInfo raspi_machine_types[] =3D {
>      {
> -        .name           =3D MACHINE_TYPE_NAME("raspi2"),
> +        .name           =3D MACHINE_TYPE_NAME("raspi2b"),
>          .parent         =3D TYPE_RASPI_MACHINE,
>          .class_init     =3D raspi2b_machine_class_init,
>  #ifdef TARGET_AARCH64
>      }, {
> -        .name           =3D MACHINE_TYPE_NAME("raspi3"),
> +        .name           =3D MACHINE_TYPE_NAME("raspi3b"),
>          .parent         =3D TYPE_RASPI_MACHINE,
>          .class_init     =3D raspi3b_machine_class_init,
>  #endif
>=20
