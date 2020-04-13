Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4277765lfm;
        Mon, 13 Apr 2020 15:22:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypKCpfR5lQZ5nVkUvBm4gjjzICLOp1ZlVZ0KMrAWjJ6u2aqxPoUbO01EOqSJMrK8gYCwtq67
X-Received: by 2002:aed:3225:: with SMTP id y34mr13725050qtd.19.1586816520598;
        Mon, 13 Apr 2020 15:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586816520; cv=none;
        d=google.com; s=arc-20160816;
        b=p9sqZddrwo6Q45RBi+5/YUGIbipZt6pqgELV4QlzCB7xXcU7bUqqLmQNy1Rspj3lYI
         XW5MHbtNyXhVpqmEG5F3yQhm0ZPyhGWmGYsYHbRbqHfXcytSGNNB8y+8FhgY0ag7I7T5
         pLC0H5o9Dt3F1+6mN1kXKZoNABCbVdMQmt86/l7xnRnO19rbriC1DTxSVb7UMAyS06GI
         GzsYyKnT9xQcsXtxElgXQTSWJYCRGiSQqNIC1cBsEw8CwUTRx4CuSK8AlOtctO0nYMoB
         Q3JaulLrqWzxTQ5yo/osPb0hByqTKTudSiT4uCceH7M1M10/exIOUBqUiqJtQHHLvvuV
         VCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=toRP5OdDSqL37nOVTtbDzZz9Y6NSxog2RE0ose10fSM=;
        b=CYfGY2GQXNbO6QeR8yZYe6UicynzASJ/TjIOMgPn2pONyeCoTuVGuPRc0ylBSaipwk
         S/ZKfJsxnjvuCl1PZYpB10fy9qsnSbtpyBNJGco2UGbSmI1lshTc21aaSMGom0rbT6IE
         cl9Y7K7FybH4e9gp+CYda5VSAsG90we90mjTR0AgKxznynYBFcP1Eijv7gev1H/7gv0Y
         0UOFUhkRWBNyLct9tLqdycjF6LofpZeG81b0owufUSBVowQi2LYGj4wmzdBmgvZy1kp0
         1GfxM7vR97s7BPzczOWtSWWUHjYeyWMccEjSJVQpgWnNcobFcGVkJWwmTrOD+VDUuEjh
         5RFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Lz0PVq/A";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20si6708308qtu.383.2020.04.13.15.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 15:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Lz0PVq/A";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO7Sp-0007DA-RM
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 18:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Rb-00062Y-F3
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 18:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Ra-0005gk-97
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 18:20:43 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:36447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Ra-0005gF-4n; Mon, 13 Apr 2020 18:20:42 -0400
Received: by mail-ua1-x944.google.com with SMTP id m15so3730682uao.3;
 Mon, 13 Apr 2020 15:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=toRP5OdDSqL37nOVTtbDzZz9Y6NSxog2RE0ose10fSM=;
 b=Lz0PVq/AAPYY7OhzNipMMEv90XYIzcdSGE4EwnXvk7uCDP3HNaWnZICooiC793ZDB+
 TXs3h1kGDNHRpe2rdeFBSHU0QtQcOBY8cxU5aUUVKJL3H22x7MZyOcdd/xZl7YyFlevR
 jDRJ/nDVcN8mZtDLlrbeEQiR71lfR/b2lPfzPNH4cAgTnVKIcFGls6GEGndtQgMjXLZ7
 C/s3PW0JOxy9Qivn8o7KJUo7spGm9mY36C6Hqj8dyzj4cKQ9arhGyFAfZEe7NokIZvUU
 l7VbsGiICoQ6YSsDStinfY+FKAyw4ZRXPDa1wi7at8ykMPxlpYSkKM88QwpBNG2d0eeG
 GeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=toRP5OdDSqL37nOVTtbDzZz9Y6NSxog2RE0ose10fSM=;
 b=uZMHgShfzkmSZ48EaS+19YrGofUsYh+F/HFgKC2gL+JKZJE5Fujyv00dBMyHS2qEo6
 c2LKDvgJPtQCb0qV3QQYfUdKLSpCgvCQ9lQrVd0ny25Qgy6NH8j8nBgeTPW6TKh1TPDH
 GVuCr27EH7M6UU7+7ztTDoJi4f5mkdywrVydvQ0zR4WeF4vJPnhIepW+dRDeh+6eM+lz
 7X0aEIfehGbA2YTnvpjsNQTpeZA1MceBjuCTYH1x0wxMzQ6SnKIVqNatHRjSbMimFVC/
 yJSpZdQEv/3lp5F4SK6Beq38RTx7XqsC266o0h6pN9X4iM7MhjdOYRyZM1jGjz2OGz97
 P97g==
X-Gm-Message-State: AGi0PuYVNsZ7v9H6Ypz90bt+cGs6PX0d6gwwAxGvhCFPwEAyt5c8IM9A
 3Q6N4T3VDuRSQz69IfXM7QTsiPIqhsHt0o/6TvM=
X-Received: by 2002:a9f:27ca:: with SMTP id b68mr10657548uab.8.1586816441036; 
 Mon, 13 Apr 2020 15:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200412224144.12205-1-f4bug@amsat.org>
 <20200412224144.12205-8-f4bug@amsat.org>
In-Reply-To: <20200412224144.12205-8-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:12:24 -0700
Message-ID: <CAKmqyKNKw9hye2AaGocrKozyTA0xb-qDFB=yJ06iV+4xGT8-OA@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 07/23] hw/riscv/sifive: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::944
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z0dJPNl35FPM

On Sun, Apr 12, 2020 at 4:00 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_e.c |  6 +++++-
>  hw/riscv/sifive_u.c | 24 ++++++++++++++++++++----
>  2 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 0be8b52147..6d4e141ff7 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -156,7 +156,11 @@ static void riscv_sifive_e_soc_realize(DeviceState *=
dev, Error **errp)
>      MemoryRegion *sys_mem =3D get_system_memory();
>
>      object_property_set_bool(OBJECT(&s->cpus), true, "realized",
> -                            &error_abort);
> +                            &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>
>      /* MMIO */
>      s->plic =3D sifive_plic_create(memmap[SIFIVE_E_PLIC].base,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index e13ab34de4..b07526aba1 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -508,9 +508,17 @@ static void riscv_sifive_u_soc_realize(DeviceState *=
dev, Error **errp)
>      NICInfo *nd =3D &nd_table[0];
>
>      object_property_set_bool(OBJECT(&s->e_cpus), true, "realized",
> -                             &error_abort);
> +                             &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->u_cpus), true, "realized",
> -                             &error_abort);
> +                             &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      /*
>       * The cluster must be realized after the RISC-V hart array containe=
r,
>       * as the container's CPU object is only created on realize, and the
> @@ -518,9 +526,17 @@ static void riscv_sifive_u_soc_realize(DeviceState *=
dev, Error **errp)
>       * cluster is realized.
>       */
>      object_property_set_bool(OBJECT(&s->e_cluster), true, "realized",
> -                             &error_abort);
> +                             &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->u_cluster), true, "realized",
> -                             &error_abort);
> +                             &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>
>      /* create PLIC hart topology configuration string */
>      plic_hart_config_len =3D (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
> --
> 2.21.1
>
>
