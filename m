Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3643944lfp;
        Mon, 10 Feb 2020 01:55:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzquHkcBXMdywyqzSASMUp2Q4Cy0jZ+vb/h0QPP9423gWMO5vFFEicoD9N6HjcWM1sFR3xL
X-Received: by 2002:ac8:7b4f:: with SMTP id m15mr9390015qtu.48.1581328534158;
        Mon, 10 Feb 2020 01:55:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581328534; cv=none;
        d=google.com; s=arc-20160816;
        b=QCx1W1O9CIr1HY/9XlbAtfIZu1nATplU2mdojWNFIHs6D7RKdtlKi1S5RmAA2LvueJ
         pySYxpd1rB9WZ6fLYqY8E6Y9d5j8MK+au6Sm5GowfA2u6rReJIn58qdxH1+LWT5SRe+b
         66/la+xAyuBWs1RP0vj2RG2fxJvKS2pgVJi2X2I+8vZPCWg8G29Jk1PR/twqACbhS9+Y
         8dDtnFBdeh1UbO48q0+Az8WH7R30GPS5NiAvzIjlMdFuFSk8X/KgClrupd1u1Vwv09Fx
         0tCVd9mKT2x1cZC/HSElNPApw04/k6bu36PWCe0H7KBZicdMvkBbK+OfU0o1e0xQaAUu
         atHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=4LalPpMW9ng7YCbFD/fK+hthpRjp2vK90qzJFL7t/VU=;
        b=wDesOhUy8Mwk2TCgCq3Vm7qYfehBn636dt77LDsIUUTAbs5gNPNvm7N51o7e1bq9Lo
         /AVUxkNH8MOWP/N40U5CvPoS6SuhH83wp8O90kHAHBadQlPD+GEtH7CXWDJ7vt74H/+3
         3BEBTSZAx8xuDCOogBfX4q5VGhPRtKKrpxBGOvjnBE+abpV8h1foWQLsgFITQZOjwwI/
         4MW4/SNEpnpYnqtxxoWcW3IJoJa4m+Armqw8IHq5DnM5iHX30QGr3QW2ifWlL6k18I7b
         j2k54GQxVHZNGSO4p4V1uxB3vzV7z0a2iBZcHna4WQ3zROz0RhYITux3mH8zqeAv04ie
         OHug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AORFDPiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si3831810qtu.162.2020.02.10.01.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 01:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AORFDPiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j15mv-0000Cl-KL
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 04:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j15ml-00008e-8d
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:55:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j15mk-0002uq-1v
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:55:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20761
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j15mj-0002ta-UD
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 04:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581328521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LalPpMW9ng7YCbFD/fK+hthpRjp2vK90qzJFL7t/VU=;
 b=AORFDPiU4oV4pgEy32qG4mRICSm2Q/2v6Quue3Mcky8uLSuzcU3LzaJBXIzjO8g4cIFZGG
 lS7b6C2jfAib0wykT20COqwsmfJa/PlAUSL3G5A+IfAHH5O30cyTxlbyY/lXVhk4EcyLeY
 g3Lhj1mU7XhW0dATz0f9MYsOU1KfNj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-GRqamLgDNuyHCzzhSqI7pw-1; Mon, 10 Feb 2020 04:55:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A0AC800D41;
 Mon, 10 Feb 2020 09:55:18 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96DBE5C1D4;
 Mon, 10 Feb 2020 09:55:13 +0000 (UTC)
Date: Mon, 10 Feb 2020 10:55:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 09/13] hw/arm/raspi: Let class_init() directly call
 raspi_machine_init()
Message-ID: <20200210105511.2b1c9b37@redhat.com>
In-Reply-To: <20200208165645.15657-10-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-10-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: GRqamLgDNuyHCzzhSqI7pw-1
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
X-TUID: o2D0GhL+C5LB

On Sat,  8 Feb 2020 17:56:41 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> raspi_machine_init() access to board_rev via RaspiMachineClass.
> raspi2_init() and raspi3_init() do nothing. Call raspi_machine_init
> directly.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Squash with previous?
> ---
>  hw/arm/raspi.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index fbfcd29732..1628b0dda7 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -228,7 +228,7 @@ static void setup_boot(MachineState *machine, int ver=
sion, size_t ram_size)
>      arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
>  }
> =20
> -static void raspi_init(MachineState *machine)
> +static void raspi_machine_init(MachineState *machine)
>  {
>      RaspiMachineClass *mc =3D RASPI_MACHINE_GET_CLASS(machine);
>      RaspiMachineState *s =3D RASPI_MACHINE(machine);
> @@ -280,11 +280,6 @@ static void raspi_init(MachineState *machine)
>      setup_boot(machine, version, machine->ram_size - vcram_size);
>  }
> =20
> -static void raspi2_init(MachineState *machine)
> -{
> -    raspi_init(machine);
> -}
> -
>  static void raspi2_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -293,7 +288,7 @@ static void raspi2_machine_class_init(ObjectClass *oc=
, void *data)
> =20
>      rmc->board_rev =3D board_rev;
>      mc->desc =3D "Raspberry Pi 2B";
> -    mc->init =3D raspi2_init;
> +    mc->init =3D raspi_machine_init;

[...]
> @@ -319,7 +309,7 @@ static void raspi3_machine_class_init(ObjectClass *oc=
, void *data)
> =20
>      rmc->board_rev =3D board_rev;
>      mc->desc =3D "Raspberry Pi 3B";
> -    mc->init =3D raspi3_init;
> +    mc->init =3D raspi_machine_init;
[...]

you could set it once in base class_init,
since there is not reason lest to do it per leaf class.

Either with this change or without

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

