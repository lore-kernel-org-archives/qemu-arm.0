Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3637978lfp;
        Mon, 10 Feb 2020 01:47:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYVkwQkpuq4GMwBl0P6Gf0XBA4LblbUQRxf+5vqlhNLCot9yaMjlJdJ1zmkF7eAykUuXph
X-Received: by 2002:a37:4ca:: with SMTP id 193mr499336qke.255.1581328035222;
        Mon, 10 Feb 2020 01:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581328035; cv=none;
        d=google.com; s=arc-20160816;
        b=WlPtML+jvvEOmydloXsO4uBhHPcgp0X4paIUTLSqA4gQFRjICHzWKMDaa4l20Q8meu
         +EQ3i1oUneCf9K47UhfL2ESEf/NmLxPwUo+mTYsH0MZunLcEgzb7E+H3aP028Jn6o0NJ
         2GoHGp8ExKSZyo36Tlkb+YB/uIc/BeA8GG1ilzzKHadI+anLUMFsIIOzJgt3fsmZBduF
         igHRS4LzBjPdcGvbiLTzm4USvucKRFR01wYqcgadtB8BgFeDKI/TmVER7mDNd47W5pFl
         noP29sFkSBtDksLoJoFzCCQLGPZ1XAsNIfrdCQ9QSaPnKWSqLnV3mXJsRj08UFpCshIj
         wv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=g75Y4UAu1ITHdKckEUKo/WrgFjKe0JEqcBdbE3J8Eqc=;
        b=AU9KfhEWXulqqBoHYXKES4dUAmpivaCTvLJI8bJrXLEvSBFEckEdZhGdMyiX00TY5C
         MFHbi8K32CTQsB3nazx9sWNMgzxHkYEkoHOeNsLV/27kMV9ajnudToUx+cgbcfvZrVpi
         wCQz1j9yAVegGMswKAlC2JwzhyWIuYZPNHX3/B4zJGfZzgcr4AkHAce30A8Z63GEORrp
         6Lomw+6F0IWNrusx6PxS1P1U1DGCWKj8nH+moJ+maNMjQO6Al8qpq1GtK3g3oBRhgWqf
         CAmG4KPKQIL8J7c0Lg5HtoE3wY9fbjAXwjDwvAh+L6Ol9fgRdq9RA3xvDHbjXwuMZZy1
         o/JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CsWJl2QL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si3904135qki.266.2020.02.10.01.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 01:47:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CsWJl2QL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j15es-0002L5-ML
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 04:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j15dS-0001Bi-Gq
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:45:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j15dR-0004TB-CT
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:45:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44585
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j15dR-0004SX-8p
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581327944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g75Y4UAu1ITHdKckEUKo/WrgFjKe0JEqcBdbE3J8Eqc=;
 b=CsWJl2QL0iEYg45XO0dn5vhEcJ64V/BHXZEQrb9Gj55jTNLS/6FUMpLsQAVwDFj/YEQXCz
 U2dvGMl38aAUXoa8BDVOznJN8GBdOSMtwetsjbLUOvZnKkqJijDhIjgrfNzvtlfK1m8jQ7
 wGr9qKecq1UIRNYxGjeIgyiBrZOy2tE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-ZvAE1F6dNWq6sN_JytTh3Q-1; Mon, 10 Feb 2020 04:45:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C3E3101FC60;
 Mon, 10 Feb 2020 09:45:41 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93F677FB60;
 Mon, 10 Feb 2020 09:45:36 +0000 (UTC)
Date: Mon, 10 Feb 2020 10:45:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 07/13] hw/arm/raspi: Make machines children of
 abstract RaspiMachineClass
Message-ID: <20200210104535.46c9bad7@redhat.com>
In-Reply-To: <20200208165645.15657-8-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-8-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ZvAE1F6dNWq6sN_JytTh3Q-1
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
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Philippe =?UTF-8?B?TWF0?= =?UTF-8?B?aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zeD/fbzPgN0y

On Sat,  8 Feb 2020 17:56:39 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> QOM'ify RaspiMachineState. Now machines inherit of RaspiMachineClass.
>=20
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v3: Fixed typo in description (Zolt=C3=A1n)
> ---
>  hw/arm/raspi.c | 56 +++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 49 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index b3e6f72b55..62b8df3c2e 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -34,10 +34,28 @@
>  /* Registered machine type (matches RPi Foundation bootloader and U-Boot=
) */
>  #define MACH_TYPE_BCM2708   3138
> =20
> -typedef struct RasPiState {
> +typedef struct RaspiMachineState {
> +    /*< private >*/
> +    MachineState parent_obj;
> +    /*< public >*/
>      BCM283XState soc;
>      MemoryRegion ram;
> -} RasPiState;
> +} RaspiMachineState;
> +
> +typedef struct RaspiMachineClass {
> +    /*< private >*/
> +    MachineClass parent_obj;
> +    /*< public >*/
> +} RaspiMachineClass;
> +
> +#define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
> +#define RASPI_MACHINE(obj) \
> +    OBJECT_CHECK(RaspiMachineState, (obj), TYPE_RASPI_MACHINE)
> +
> +#define RASPI_MACHINE_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(RaspiMachineClass, (klass), TYPE_RASPI_MACHINE)
> +#define RASPI_MACHINE_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(RaspiMachineClass, (obj), TYPE_RASPI_MACHINE)
> =20
>  /*
>   * Board revision codes:
> @@ -211,7 +229,7 @@ static void setup_boot(MachineState *machine, int ver=
sion, size_t ram_size)
> =20
>  static void raspi_init(MachineState *machine, uint32_t board_rev)
>  {
> -    RasPiState *s =3D g_new0(RasPiState, 1);
> +    RaspiMachineState *s =3D RASPI_MACHINE(machine);
>      int version =3D board_version(board_rev);
>      uint64_t ram_size =3D board_ram_size(board_rev);
>      uint32_t vcram_size;
> @@ -264,8 +282,10 @@ static void raspi2_init(MachineState *machine)
>      raspi_init(machine, 0xa21041);
>  }
> =20
> -static void raspi2_machine_init(MachineClass *mc)
> +static void raspi2_machine_class_init(ObjectClass *oc, void *data)
>  {
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
>      mc->desc =3D "Raspberry Pi 2B";
>      mc->init =3D raspi2_init;
>      mc->block_default_type =3D IF_SD;
> @@ -278,7 +298,6 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->default_ram_size =3D 1 * GiB;
>      mc->ignore_memory_transaction_failures =3D true;
>  };
> -DEFINE_MACHINE("raspi2", raspi2_machine_init)
> =20
>  #ifdef TARGET_AARCH64
>  static void raspi3_init(MachineState *machine)
> @@ -286,8 +305,10 @@ static void raspi3_init(MachineState *machine)
>      raspi_init(machine, 0xa02082);
>  }
> =20
> -static void raspi3_machine_init(MachineClass *mc)
> +static void raspi3_machine_class_init(ObjectClass *oc, void *data)
>  {
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
>      mc->desc =3D "Raspberry Pi 3B";
>      mc->init =3D raspi3_init;
>      mc->block_default_type =3D IF_SD;
> @@ -299,5 +320,26 @@ static void raspi3_machine_init(MachineClass *mc)
>      mc->default_cpus =3D BCM283X_NCPUS;
>      mc->default_ram_size =3D 1 * GiB;
>  }
> -DEFINE_MACHINE("raspi3", raspi3_machine_init)
>  #endif
> +
> +static const TypeInfo raspi_machine_types[] =3D {
> +    {
> +        .name           =3D MACHINE_TYPE_NAME("raspi2"),
> +        .parent         =3D TYPE_RASPI_MACHINE,
> +        .class_init     =3D raspi2_machine_class_init,
> +#ifdef TARGET_AARCH64
> +    }, {
> +        .name           =3D MACHINE_TYPE_NAME("raspi3"),
> +        .parent         =3D TYPE_RASPI_MACHINE,
> +        .class_init     =3D raspi3_machine_class_init,
> +#endif
> +    }, {
> +        .name           =3D TYPE_RASPI_MACHINE,
> +        .parent         =3D TYPE_MACHINE,
> +        .instance_size  =3D sizeof(RaspiMachineState),
> +        .class_size     =3D sizeof(RaspiMachineClass),
> +        .abstract       =3D true,
> +    }
> +};
> +
> +DEFINE_TYPES(raspi_machine_types)

