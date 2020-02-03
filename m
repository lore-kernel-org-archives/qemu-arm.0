Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3741707lfp;
        Mon, 3 Feb 2020 01:58:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzW5BYC+7pST5u26MTCegqXdtTtTpeKmMcaweLcC6hRLrJYIb+HV2UJ+cGGENU5n/rvVqNl
X-Received: by 2002:a37:674d:: with SMTP id b74mr23595335qkc.396.1580723889889;
        Mon, 03 Feb 2020 01:58:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580723889; cv=none;
        d=google.com; s=arc-20160816;
        b=lzA4MAfPJxvatwEjZLDYvg+06sQKxYC1f7Ju/E2rtY8ljLIyGTFLaV6gaT/yailTZY
         U2RIYpdbCDBSdaJuQCTCuyB+Bix89miNxjvgTjIzfv22GOQWcDCQbHrPUOC5WhWvsT+h
         FNsA+bBk+QADj0NpC/TpRDbBlOXB9uDoEKLcaHKfYkRXq/eT4hydFrDmk4JdWIcbGMmq
         JAN4ZMMkmDKrVp8LDuifipaMX7ZK2mw9qQb+yq4jJFr0odQYtIlN69XMcr20BBR3I1Tx
         OPeqBTdCQqS/H52M4gsQt3DaGjBAQOdld1HjVRuNIHmI5TxXunw9S3BHaRp4FR+c5CT1
         Uy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=lydme9jOwB1OFMvTOGgBnuCMfpkt445a2/GNLFZx+2Q=;
        b=Om5BJfPKDcGO6u8zWGFZ5vsCyZixvaBo95q2V75F15dZ2XJqxNHu4/YSbPExQBd8iZ
         3qoGRBS44mRDWKdFYLzM2mF6H4prtEC0lQDNkSB+6iTvopt/fOi1uqdPukWSjh6iSofH
         C+gGZIiEnHZAlwpK7UsTCs8lYEO17Dpf0dHG2adufBM+EsMiTxz4QY+n6exyHKX/riha
         B4adE04L+PqjxgKcvPtnz2QCkh2Rev/WCNy5mlO7c+ychrJmDvmpRxli6OrS1q9SfHro
         3cploXyUK7wRUa4+4IgT0XiQHda8/Ag0ppnyM0FZo+y8WNak2WJs8tEKTrfbUY599Ejx
         DzCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I8py7WZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si11811532qvk.85.2020.02.03.01.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 01:58:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I8py7WZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyYUb-0000jP-Bl
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 04:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iyYUQ-0000jH-Jm
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:57:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iyYUP-0002rC-F3
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:57:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iyYUP-0002q0-Ak
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580723876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lydme9jOwB1OFMvTOGgBnuCMfpkt445a2/GNLFZx+2Q=;
 b=I8py7WZ+cza8C5wzvY+G8Q0l6ElTX7UbtmqOvuC1qhqqedqJTQ/WeLb81s7GQKGMZduWUY
 dPI3p4Qka6FQNMI44PQB7fYdZJ+m+cO892XYTFX7UnSvPvPGu8spwl0jgvWIEh2VKq5dug
 bTeR1gYbacVCco36Y1wb12bB+m80Qx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-jf0vkmY9MnS2djWQKWcwMw-1; Mon, 03 Feb 2020 04:57:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F3C800D41;
 Mon,  3 Feb 2020 09:57:51 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B99B690F51;
 Mon,  3 Feb 2020 09:57:47 +0000 (UTC)
Date: Mon, 3 Feb 2020 10:57:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/6] hw/arm/raspi: Get board version from board revision
 code
Message-ID: <20200203105746.43cc27a7@redhat.com>
In-Reply-To: <20200203082619.7426-3-f4bug@amsat.org>
References: <20200203082619.7426-1-f4bug@amsat.org>
 <20200203082619.7426-3-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: jf0vkmY9MnS2djWQKWcwMw-1
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
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cFXwOGOG3G/1

On Mon,  3 Feb 2020 09:26:15 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The chip ID is encoded in the board revision, and the board version
> is simply 'chip_id + 1'.
> We want to support more boards which follow the same scheme.
> Introduce a new RaspiBoardInfo structure which we'll extend in the
> following commits.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 45 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index ef76a27f33..eaa8c49009 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -36,6 +36,39 @@ typedef struct RasPiState {
>      MemoryRegion ram;
>  } RasPiState;
> =20
> +typedef struct RaspiBoardInfo {
> +    /*
> +     * Board revision codes:
> +     * www.raspberrypi.org/documentation/hardware/raspberrypi/revision-c=
odes/
> +     */
> +    uint32_t board_rev;
> +} RaspiBoardInfo;
> +
> +enum { BOARD_PI2, BOARD_PI3 };
> +
> +static const RaspiBoardInfo raspi_boards[] =3D {
> +    [BOARD_PI2] =3D
> +    {
> +        .board_rev =3D 0xa21041,
> +    },
> +#ifdef TARGET_AARCH64
> +    [BOARD_PI3] =3D
> +    {
> +        .board_rev =3D 0xa02082,
> +    },
> +#endif
> +};

This patter was(is) used widely by embed boards before QOM
(I mean introducing various structures to keep boards configs
and then passing them around). Which I found were cumbersome
to deal with with working on ram refactoring.

But have you considered using machine classes which
perfectly feet the task, instead of repeating old pattern?



> +static int board_chip_id(const RaspiBoardInfo *config)
> +{
> +    return extract32(config->board_rev, 12, 4);
> +}
> +
> +static int board_version(const RaspiBoardInfo *config)
> +{
> +    return board_chip_id(config) + 1;
> +}
> +
>  static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
>  {
>      static const uint32_t smpboot[] =3D {
> @@ -163,9 +196,10 @@ static void setup_boot(MachineState *machine, int ve=
rsion, size_t ram_size)
>      arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
>  }
> =20
> -static void raspi_init(MachineState *machine, int version)
> +static void raspi_init(MachineState *machine, const RaspiBoardInfo *conf=
ig)
>  {
>      RasPiState *s =3D g_new0(RasPiState, 1);
> +    int version =3D board_version(config);
>      uint32_t vcram_size;
>      DriveInfo *di;
>      BlockBackend *blk;
> @@ -191,9 +225,8 @@ static void raspi_init(MachineState *machine, int ver=
sion)
>      /* Setup the SOC */
>      object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ra=
m),
>                                     &error_abort);
> -    int board_rev =3D version =3D=3D 3 ? 0xa02082 : 0xa21041;
> -    object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
> -                            &error_abort);
> +    object_property_set_int(OBJECT(&s->soc), config->board_rev,
> +                            "board-rev", &error_abort);
>      object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_a=
bort);
> =20
>      /* Create and plug in the SD cards */
> @@ -215,7 +248,7 @@ static void raspi_init(MachineState *machine, int ver=
sion)
> =20
>  static void raspi2_init(MachineState *machine)
>  {
> -    raspi_init(machine, 2);
> +    raspi_init(machine, &raspi_boards[BOARD_PI2]);
>  }
> =20
>  static void raspi2_machine_init(MachineClass *mc)
> @@ -237,7 +270,7 @@ DEFINE_MACHINE("raspi2", raspi2_machine_init)
>  #ifdef TARGET_AARCH64
>  static void raspi3_init(MachineState *machine)
>  {
> -    raspi_init(machine, 3);
> +    raspi_init(machine, &raspi_boards[BOARD_PI3]);
>  }
> =20
>  static void raspi3_machine_init(MachineClass *mc)

