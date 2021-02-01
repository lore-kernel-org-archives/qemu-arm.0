Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3706748lfo;
        Mon, 1 Feb 2021 11:59:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoRTdS5782ilq4/vg9yuv0JBfMYFbvIKkFV4HsQrPoagI+9YyDLZQH6y+wWkZ7PAlbf6Wr
X-Received: by 2002:a25:5754:: with SMTP id l81mr24480198ybb.126.1612209558818;
        Mon, 01 Feb 2021 11:59:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612209558; cv=none;
        d=google.com; s=arc-20160816;
        b=xzPy3NO/KZUwD/nuTwVFwhLijbFsy+T1jY45bPB9+ZVFcCm9CBIvYEU+2VMU8tSZ07
         0SVqTBjaiiG6sx9oOUcu7IBsz8FTk/XbVScz6uGBOuhg8rBEF5FtPOVmAKYlToyFvOkw
         aCAuWoGUjSIFy/RpGk2w05nLvw+RXENBZ+qiJUPIfs/wNzPpga7eNa95mogDdRsQvfWk
         gPD4e+/jzgxFVes+tuwOdJgD1MBDiKTiHprTLjivbpgOHQQAp+AZTJCqUicIfDgQ/dcC
         MiSK7dGYOXS54xoecl+YiHGYt8+Z+Pkfja18z2YFGg6jCzWiuTxSUKngDHhQOxpm0hl1
         jgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=W2dJn2sLoY9H+IKibEtw6/D6QgYv/E2xZxjVcAwjgmk=;
        b=v4zWLTdDCf6Cm6TyUWlks67QlRXBEVOYyFrFC+JY6S6V3wKubajcVlT8vE7YlwsyTB
         zmxcSEddLr4ZevoWoK6MI0J90iiQUZnY/ZNln6IjoKly1FetKwcLZO3u30+sHCF/A3FW
         qliyfmdO1tKWFCEIw9SEnSHmVsKiYWfm9Qjse2W/+DgSHbZpCD03qDRN5haIjr8S4zvs
         m9wP0GwRZay5IlfdPUJICggsQz4KPM+hJsny7GMS77TE1Hlw387t5D4wlCVUtVFGDsY3
         E04kog8GpPwXsLXpNwXpLglbX76vo5o2tFwQZlIoHLBQs7iazKKbItiuLyL1bNmZniQZ
         QjoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LQIs2QwD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z129si15101692ybf.159.2021.02.01.11.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 11:59:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LQIs2QwD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6fLy-0003vl-66
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 14:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fJt-0000r8-NK; Mon, 01 Feb 2021 14:57:10 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:36004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fJr-0005fi-SM; Mon, 01 Feb 2021 14:57:09 -0500
Received: by mail-il1-x12a.google.com with SMTP id p8so16844044ilg.3;
 Mon, 01 Feb 2021 11:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W2dJn2sLoY9H+IKibEtw6/D6QgYv/E2xZxjVcAwjgmk=;
 b=LQIs2QwD80ymhtl44nrZgYq21K0dzZykpVIT/KU5HrBelc9HLidqOViek7clRNiJdY
 IIykWLdTHPR5fNR4jVOg8T8b88mMSYR7W8CspcfCrdkMBceQY2Xs3y/JjxzWfvVq0u/K
 2lb4Yg2EzxleaWBWVguBQnzBUNOZXTuLTu0mn7+VKLuOSSgRzGKoukJsvtj7NpSdvkTT
 vwwqkAvm5FRxY20sEZmzMcjmJF/tajHPj9+KmQWh/ucMhljNmZPZiB4OcOUwmkZq9Ryb
 eoz1SLCbufzUV7SzUzBluxsZ5lAZE2YHWZr4UDcW87l8mkdCWsrYOsa2T/Y8/1jBavo9
 f3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W2dJn2sLoY9H+IKibEtw6/D6QgYv/E2xZxjVcAwjgmk=;
 b=shL6TlI38mbYFHhDHayd8V5KMRrbyCzo9hvawmBt/YAkiswYaz2EY85z1juToQli2Y
 4zND9Gd8RfskRrNQuHtDgAh34YhGef+JME6kbKJygDkFnPXZchhKfCXAKbmRJv3/gKfW
 FjOUDF8hKzWxnmEhLr/sbhYG5LBp10+oVtAvdQOiJjBs8/lFtqEA0pBd4snjbbuy7SqS
 Q34k0gMYxyEnnubaXUtNYwzQ1w/i9W7X5zmh9S4wQiCseYVj/MnC18vpcT4aXrv9QNxg
 VlhND0ndSJjiqNAwyYL1wpfB0fncLW+tB4y/eeozHB/coF3MxJBXVa8AuTQb6oKAqrbp
 vnmg==
X-Gm-Message-State: AOAM530iiTGd3X5N0UDEISlhJAAlBayd0Sfvfs+yrml5gjlOxr2AS3CA
 enJUrbjZFyfPIGJYGlcj6jxRKkD3dXctnD07mOVdv9XZZO8=
X-Received: by 2002:a05:6e02:20e5:: with SMTP id
 q5mr14550714ilv.131.1612209425045; 
 Mon, 01 Feb 2021 11:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20210131184449.382425-1-f4bug@amsat.org>
 <20210131184449.382425-7-f4bug@amsat.org>
In-Reply-To: <20210131184449.382425-7-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:56:37 -0800
Message-ID: <CAKmqyKN-Yg-XOPNh5BVyZG9WLZdmtLm6HPF3rCeRtNryhCwosQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] hw/arm: Display CPU type in machine description
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ip3S2ZNnmgX2

On Sun, Jan 31, 2021 at 10:54 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Most of ARM machines display their CPU when QEMU list the available
> machines (-M help). Some machines do not. Fix to unify the help
> output.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/digic_boards.c  | 2 +-
>  hw/arm/microbit.c      | 2 +-
>  hw/arm/netduino2.c     | 2 +-
>  hw/arm/netduinoplus2.c | 2 +-
>  hw/arm/orangepi.c      | 2 +-
>  hw/arm/stellaris.c     | 4 ++--
>  6 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index be12873673b..6cdc1d83fca 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -142,7 +142,7 @@ static void canon_a1100_init(MachineState *machine)
>
>  static void canon_a1100_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Canon PowerShot A1100 IS";
> +    mc->desc =3D "Canon PowerShot A1100 IS (ARM946)";
>      mc->init =3D &canon_a1100_init;
>      mc->ignore_memory_transaction_failures =3D true;
>      mc->default_ram_size =3D 64 * MiB;
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> index 0947491cb97..e9494334ce7 100644
> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -64,7 +64,7 @@ static void microbit_machine_class_init(ObjectClass *oc=
, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>
> -    mc->desc =3D "BBC micro:bit";
> +    mc->desc =3D "BBC micro:bit (Cortex-M0)";
>      mc->init =3D microbit_init;
>      mc->max_cpus =3D 1;
>  }
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 8f103341443..1733b71507c 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -54,7 +54,7 @@ static void netduino2_init(MachineState *machine)
>
>  static void netduino2_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Netduino 2 Machine";
> +    mc->desc =3D "Netduino 2 Machine (Cortex-M3)";
>      mc->init =3D netduino2_init;
>      mc->ignore_memory_transaction_failures =3D true;
>  }
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index 68abd3ec69d..d3ad7a2b675 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -55,7 +55,7 @@ static void netduinoplus2_init(MachineState *machine)
>
>  static void netduinoplus2_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Netduino Plus 2 Machine";
> +    mc->desc =3D "Netduino Plus 2 Machine (Cortex-M4)";
>      mc->init =3D netduinoplus2_init;
>  }
>
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index d6306dfddae..40cdb5c6d2c 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -113,7 +113,7 @@ static void orangepi_init(MachineState *machine)
>
>  static void orangepi_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Orange Pi PC";
> +    mc->desc =3D "Orange Pi PC (Cortex-A7)";
>      mc->init =3D orangepi_init;
>      mc->block_default_type =3D IF_SD;
>      mc->units_per_default_bus =3D 1;
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index ad72c0959f1..27292ec4113 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1538,7 +1538,7 @@ static void lm3s811evb_class_init(ObjectClass *oc, =
void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>
> -    mc->desc =3D "Stellaris LM3S811EVB";
> +    mc->desc =3D "Stellaris LM3S811EVB (Cortex-M3)";
>      mc->init =3D lm3s811evb_init;
>      mc->ignore_memory_transaction_failures =3D true;
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m3");
> @@ -1554,7 +1554,7 @@ static void lm3s6965evb_class_init(ObjectClass *oc,=
 void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>
> -    mc->desc =3D "Stellaris LM3S6965EVB";
> +    mc->desc =3D "Stellaris LM3S6965EVB (Cortex-M3)";
>      mc->init =3D lm3s6965evb_init;
>      mc->ignore_memory_transaction_failures =3D true;
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m3");
> --
> 2.26.2
>
>
