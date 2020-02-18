Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5901206lfp;
        Tue, 18 Feb 2020 00:57:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyRSpLtmMiffVBc5//LdaJuPnn/erULABkO8cTnargT9diVbRnVKjA3mUmh3x72KZDuUDWb
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr16328364qte.204.1582016273778;
        Tue, 18 Feb 2020 00:57:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25si1467333qtq.34.2020.02.18.00.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 00:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=appDnoOV;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3yhV-0003NU-4R
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 03:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1j3yfi-0002ML-4Z
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 03:56:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luc.michel@greensocs.com>) id 1j3yfh-0001dj-5C
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 03:56:02 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:33320)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luc.michel@greensocs.com>)
 id 1j3yfg-0001dY-SW; Tue, 18 Feb 2020 03:56:01 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 70E2696EF0;
 Tue, 18 Feb 2020 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582016159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnhKFiGzn80VHlML3T1si5xmjUf7aVYSQ788Nc/DGVM=;
 b=appDnoOVYm2PxwF85x4LMIGOwFCRxC9I5tIYjdf5WPbSn8LWhvAG9h/sWFmAheLPmoGI+e
 0tC4aNARZRr4jd2TbaX/zBlS5QjrKFwptPh9L/Gecv6dsWjU24bIxBAcATqKjmG58VAqrF
 +xlJtxs3+Vbq7g2L/E4r7vlr77bkBk8=
Subject: Re: [PATCH v2 06/13] hw/arm/bcm2836: Restrict BCM283XClass
 declaration to C source
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200217114533.17779-1-f4bug@amsat.org>
 <20200217114533.17779-7-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <52bf1d53-7294-2aba-0015-937420f48ae7@greensocs.com>
Date: Tue, 18 Feb 2020 09:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217114533.17779-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-PH
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582016159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnhKFiGzn80VHlML3T1si5xmjUf7aVYSQ788Nc/DGVM=;
 b=Zu3PJxb89Dmqss9DiqnYrlHKupqOAixwEx7sJ3BnZlGH4jOGxwRyBgH+ePTh3msPAEN+BA
 UxAc7e5y1WC7Mn/OxhFDSJWwO8DoAWSvKU1laI3eZPTPuAiCrIQwYBQhqp2nvBXHWdJpOY
 stOGnUDArC4YqgOofkerYUslFelA0IU=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582016159; a=rsa-sha256; cv=none;
 b=52mBx7QIuxRJz/P4sgH4duu44NulGDf890iJLc3ONqMqS+02ljm7gyeznJW4Rx/6qLcEHE
 mc9MMDrUWSmXzLpgk7P58oqPZB6LlHNGCKNBH05LsS2ilBZ11LH3/xWXtI18mb047NJp/V
 oUMvHAHaiAnRX/XJISztkbSaccJ0TrY=
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
X-TUID: P/sT3OcjMb2y

On 2/17/20 12:45 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> No code out of bcm2836.c uses (or requires) this declarations.
> Move it locally to the C source file.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  include/hw/arm/bcm2836.h | 12 ------------
>  hw/arm/bcm2836.c         | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> index 92a6544816..acc75bf553 100644
> --- a/include/hw/arm/bcm2836.h
> +++ b/include/hw/arm/bcm2836.h
> @@ -42,16 +42,4 @@ typedef struct BCM283XState {
>      BCM2835PeripheralState peripherals;
>  } BCM283XState;
> =20
> -typedef struct BCM283XInfo BCM283XInfo;
> -
> -typedef struct BCM283XClass {
> -    DeviceClass parent_class;
> -    const BCM283XInfo *info;
> -} BCM283XClass;
> -
> -#define BCM283X_CLASS(klass) \
> -    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
> -#define BCM283X_GET_CLASS(obj) \
> -    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
> -
>  #endif /* BCM2836_H */
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 38e2941bab..24109fef1d 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -16,6 +16,15 @@
>  #include "hw/arm/raspi_platform.h"
>  #include "hw/sysbus.h"
> =20
> +typedef struct BCM283XInfo BCM283XInfo;
> +
> +typedef struct BCM283XClass {
> +    /*< private >*/
> +    DeviceClass parent_class;
> +    /*< public >*/
> +    const BCM283XInfo *info;
> +} BCM283XClass;
> +
>  struct BCM283XInfo {
>      const char *name;
>      const char *cpu_type;
> @@ -24,6 +33,11 @@ struct BCM283XInfo {
>      int clusterid;
>  };
> =20
> +#define BCM283X_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
> +#define BCM283X_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
> +
>  static const BCM283XInfo bcm283x_socs[] =3D {
>      {
>          .name =3D TYPE_BCM2836,
>=20
