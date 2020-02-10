Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3649110lfp;
        Mon, 10 Feb 2020 02:01:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqysXbVlWZvKn/9oihJMYQXRnIhMRu+3Awk5qLsu475mP1XJaXSXm7laGO3z/xu/U+/x7Rt3
X-Received: by 2002:ac8:367b:: with SMTP id n56mr9402582qtb.258.1581328904653;
        Mon, 10 Feb 2020 02:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581328904; cv=none;
        d=google.com; s=arc-20160816;
        b=bp1qjKCstzS0gW+CiBOM1+1j3J24M1lA49ZGF5LHHXJ8pQ+GKvrvHWeBIxOfDFoaEd
         QZe/4vS60Fla4HayAIUs56wIBD8GxlEnEDbEVq6DwQBvzgGqKUtUaKSfmoZsRYYsT9Jh
         gPl+favW7dsFYBCczzokS6nFNThFkqmEznw2QLHmectKtfGa8aTFAGkp//rw75rOYgbR
         ukOoPxg8dGOYvdRqv12guFOXEm5DUjfVY+HMWNzHfg70clm26c7pFcWAY8//Sx61lr92
         QizjLWXD6NsBovpocAVzjpLzfa7bxCrK5uRs1i3sm7XVKCY6foD86SiQzaOx9LV4kBRM
         nKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=WLZnqbsvULJflmbDCGQLQC5zqyMuzSCNNKxNEP6giio=;
        b=VENsAqSH+Hj+kpgx/BxLE6p8aj3AZGO7SZzQ2vu9BuSp1cy5wrFpl1OsG2keNXIuQM
         p9zZ2aEm7NdSPUXzUmMqdczCZUKOuwSPSlA58gdM218zHsvE4fMzoIA8JgeVTc0McizM
         70mt9rfUhxl11sJ1zexl1lt5d0cljw1lCC/EkWyOszCQEvk4wDD3WEyluoGJDgbkItcf
         Nezfi+OanWiqhlM4iKOefxmTPFXBrZUmARuvetAsAIUOuUFSUYWfK99wLyghg39a9XER
         8sIcNrr8xUeSJtM1WViAHd9upgmcPKK5MiPGkXjE7eGNxoZiPSjTbQbDH1cYfF0ZPbIu
         s8Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JcNLu0M5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm17si3751774qvb.139.2020.02.10.02.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 02:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JcNLu0M5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j15su-0004SF-1u
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 05:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j15se-0004RI-3f
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:01:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j15sc-0007Nq-DY
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:01:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39793
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j15sb-0007NB-1B
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 05:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581328884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLZnqbsvULJflmbDCGQLQC5zqyMuzSCNNKxNEP6giio=;
 b=JcNLu0M5lQCL+p7QEmA6gIhQ/TD56FR3TqZ4dtH47YsoRRdxhiJotlj5r85PSbtozUjjCZ
 EEB0zvaym6XumKIOJDXKdmEA8syY55iPHqWyJJqRui99Hu9hzNvxX5Tf9rsjhx1P8Gr5I8
 li47sdkwTL1u3kLQaF18dykmk20NaUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-QazSmJnFMRW2eK9JiTKtzQ-1; Mon, 10 Feb 2020 05:01:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56E6E13FC;
 Mon, 10 Feb 2020 10:01:21 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43A8260CD1;
 Mon, 10 Feb 2020 10:01:15 +0000 (UTC)
Date: Mon, 10 Feb 2020 11:01:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 12/13] hw/arm/raspi: Use a unique
 raspi_machine_class_init() method
Message-ID: <20200210110113.43a802d6@redhat.com>
In-Reply-To: <20200208165645.15657-13-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-13-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: QazSmJnFMRW2eK9JiTKtzQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ie01gwk5ljB6

On Sat,  8 Feb 2020 17:56:44 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> With the exception of the ignore_memory_transaction_failures
> flag set for the raspi2, both machine_class_init() methods
> are now identical. Merge them to keep a unique method.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/raspi.c | 31 ++++++-------------------------
>  1 file changed, 6 insertions(+), 25 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 0537fc0a2d..bee6ca0a08 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -294,7 +294,7 @@ static void raspi_machine_init(MachineState *machine)
>      setup_boot(machine, version, machine->ram_size - vcram_size);
>  }
> =20
> -static void raspi2_machine_class_init(ObjectClass *oc, void *data)
> +static void raspi_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>      RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> @@ -311,41 +311,22 @@ static void raspi2_machine_class_init(ObjectClass *=
oc, void *data)
>      mc->min_cpus =3D BCM283X_NCPUS;
>      mc->default_cpus =3D BCM283X_NCPUS;
>      mc->default_ram_size =3D board_ram_size(board_rev);
> -    mc->ignore_memory_transaction_failures =3D true;
> +    if (board_version(board_rev) =3D=3D 2) {
> +        mc->ignore_memory_transaction_failures =3D true;
> +    }
>  };
> =20
> -#ifdef TARGET_AARCH64
> -static void raspi3_machine_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc =3D MACHINE_CLASS(oc);
> -    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> -    uint32_t board_rev =3D (uint32_t)(uintptr_t)data;
> -
> -    rmc->board_rev =3D board_rev;
> -    mc->desc =3D g_strdup_printf("Raspberry Pi %s", board_type(board_rev=
));
> -    mc->init =3D raspi_machine_init;
> -    mc->block_default_type =3D IF_SD;
> -    mc->no_parallel =3D 1;
> -    mc->no_floppy =3D 1;
> -    mc->no_cdrom =3D 1;
> -    mc->max_cpus =3D BCM283X_NCPUS;
> -    mc->min_cpus =3D BCM283X_NCPUS;
> -    mc->default_cpus =3D BCM283X_NCPUS;
> -    mc->default_ram_size =3D board_ram_size(board_rev);
> -}
> -#endif
> -
>  static const TypeInfo raspi_machine_types[] =3D {
>      {
>          .name           =3D MACHINE_TYPE_NAME("raspi2"),
>          .parent         =3D TYPE_RASPI_MACHINE,
> -        .class_init     =3D raspi2_machine_class_init,
> +        .class_init     =3D raspi_machine_class_init,
>          .class_data     =3D (void *)0xa21041,
>  #ifdef TARGET_AARCH64
>      }, {
>          .name           =3D MACHINE_TYPE_NAME("raspi3"),
>          .parent         =3D TYPE_RASPI_MACHINE,
> -        .class_init     =3D raspi3_machine_class_init,
> +        .class_init     =3D raspi_machine_class_init,
>          .class_data     =3D (void *)0xa02082,
>  #endif
>      }, {

