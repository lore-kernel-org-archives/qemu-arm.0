Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3641587lfp;
        Mon, 10 Feb 2020 01:52:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtIXeF7QrGspmM2gd1C3zzj9BI7qEcSqc8P80uc1WDjQIor0Yo2wlxpMmAg274ytK9mXoC
X-Received: by 2002:ac8:7b29:: with SMTP id l9mr8863262qtu.141.1581328338560;
        Mon, 10 Feb 2020 01:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581328338; cv=none;
        d=google.com; s=arc-20160816;
        b=M7vvo+03JSkdCub/2Mni/RLM2Ogrs/ncWxu6AJadTqiS3kOnn/uEsFz/HkznSJeLSl
         SFQHwp1dr88VP9SHa3FGeZ04a6ch8LwcJobYZkf1oFm4nqS6gfF+gPKpKgS0V1HmolI9
         FDMIO+dKTtYFKMxzMIK6mKcp0Laxuf0v5rr7wsyCrsro9tfRvqoTd0xnf+7AQARwrD4t
         i/3jayzCLl8cU6FWKOf1NPIiOZx63NHO+M8AgkoNCe71g1pWZfG0gceOmPrB4cA/uZUC
         N/TnYkwMmPkw3KJgV5Bhm2rt79upezYrVHmye6ke2YCsGXFCVQN+/RIcoNRG11X7vBGv
         FPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=lgND+WbSjy59JQeQH0Hq6JuIAJkZjVWDvNJPT1uiqK8=;
        b=ZXIS/u4HUSj75hUlTgOc+/Tfl1IbBFG0jjAqcKpF2cC1Je4WsELrf9nSHiBmBtX2zH
         AY59F1dIjnLquQKgBHcis+mZKAm6HTT8gR0i8h3O3m149nCtStJXmJr1Rw5xHX4QzF7B
         BYdegM1Z8eW+TgpV0J8BRAa3jTb+a3u6ODz9ZmHr4Hb0loh2xMACeIw1cO3ulqAD0EPm
         /XwkN+e8REeAVmLPbC1o+ltjVVqX6oppsUQgZVcHy2cuqETA54cb9qDi9WXxAg5fhCIr
         gYUMDbYHCu/whxqPNT9CGeTW7ehlhRytVoakf/85eYZRktYH+uW3wmECC7DCGnBCl3C/
         moew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iD7rcmMr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si3594296qvw.172.2020.02.10.01.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 01:52:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iD7rcmMr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j15jl-0006Pz-Vi
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 04:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j15iT-0005BT-Oh
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:50:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j15iS-00086S-KI
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:50:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36997
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j15iS-00085R-5a
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581328254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgND+WbSjy59JQeQH0Hq6JuIAJkZjVWDvNJPT1uiqK8=;
 b=iD7rcmMr5NS0C9RUz9AxiXwuH4O9tcdHtAFshkAKm6xsj/7rIoXXRZ51Xy+5GkhmmSZHSB
 ++C7wLT0aqpombIN5Sa/znrcLRa7gGZbvAYF7U9kjwhcwpppZUXYWiM0z1mHjmDddiehmm
 QTGrGUof9bJptbch8ukLWB99+q0fPMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-Y4-qKZ8uNwmRM9hTNCDffA-1; Mon, 10 Feb 2020 04:50:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E204D13E6;
 Mon, 10 Feb 2020 09:50:49 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 956FE87B08;
 Mon, 10 Feb 2020 09:50:44 +0000 (UTC)
Date: Mon, 10 Feb 2020 10:50:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 08/13] hw/arm/raspi: Make board_rev a field of
 RaspiMachineClass
Message-ID: <20200210105042.7e76e4e6@redhat.com>
In-Reply-To: <20200208165645.15657-9-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-9-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Y4-qKZ8uNwmRM9hTNCDffA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WNLoGi8HzByO

On Sat,  8 Feb 2020 17:56:40 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> We want to have a common class_init(). The only value that
> matters (and changes) is the board revision.
> Pass the board_rev as class_data to class_init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 62b8df3c2e..fbfcd29732 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -46,6 +46,7 @@ typedef struct RaspiMachineClass {
>      /*< private >*/
>      MachineClass parent_obj;
>      /*< public >*/
> +    uint32_t board_rev;
>  } RaspiMachineClass;
> =20
>  #define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
> @@ -227,9 +228,11 @@ static void setup_boot(MachineState *machine, int ve=
rsion, size_t ram_size)
>      arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
>  }
> =20
> -static void raspi_init(MachineState *machine, uint32_t board_rev)
> +static void raspi_init(MachineState *machine)
>  {
> +    RaspiMachineClass *mc =3D RASPI_MACHINE_GET_CLASS(machine);
>      RaspiMachineState *s =3D RASPI_MACHINE(machine);
> +    uint32_t board_rev =3D mc->board_rev;
>      int version =3D board_version(board_rev);
>      uint64_t ram_size =3D board_ram_size(board_rev);
>      uint32_t vcram_size;
> @@ -279,13 +282,16 @@ static void raspi_init(MachineState *machine, uint3=
2_t board_rev)
> =20
>  static void raspi2_init(MachineState *machine)
>  {
> -    raspi_init(machine, 0xa21041);
> +    raspi_init(machine);
>  }
> =20
>  static void raspi2_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> +    uint32_t board_rev =3D (uint32_t)(uintptr_t)data;
> =20
> +    rmc->board_rev =3D board_rev;

instead of doing a bit obscure ".class_data     =3D (void *)0xa21041," and
using it here, I'd just do

       rmc->board_rev =3D 0xa21041;

using value specific for each leaf class

with this change
 Reviewed-by: Igor Mammedov <imammedo@redhat.com>

>      mc->desc =3D "Raspberry Pi 2B";
>      mc->init =3D raspi2_init;
>      mc->block_default_type =3D IF_SD;
> @@ -302,13 +308,16 @@ static void raspi2_machine_class_init(ObjectClass *=
oc, void *data)
>  #ifdef TARGET_AARCH64
>  static void raspi3_init(MachineState *machine)
>  {
> -    raspi_init(machine, 0xa02082);
> +    raspi_init(machine);
>  }
> =20
>  static void raspi3_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> +    uint32_t board_rev =3D (uint32_t)(uintptr_t)data;
> =20
> +    rmc->board_rev =3D board_rev;
>      mc->desc =3D "Raspberry Pi 3B";
>      mc->init =3D raspi3_init;
>      mc->block_default_type =3D IF_SD;
> @@ -327,11 +336,13 @@ static const TypeInfo raspi_machine_types[] =3D {
>          .name           =3D MACHINE_TYPE_NAME("raspi2"),
>          .parent         =3D TYPE_RASPI_MACHINE,
>          .class_init     =3D raspi2_machine_class_init,
> +        .class_data     =3D (void *)0xa21041,
>  #ifdef TARGET_AARCH64
>      }, {
>          .name           =3D MACHINE_TYPE_NAME("raspi3"),
>          .parent         =3D TYPE_RASPI_MACHINE,
>          .class_init     =3D raspi3_machine_class_init,
> +        .class_data     =3D (void *)0xa02082,
>  #endif
>      }, {
>          .name           =3D TYPE_RASPI_MACHINE,

