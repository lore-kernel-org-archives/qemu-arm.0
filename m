Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5091776wrm;
        Mon, 21 Oct 2019 14:02:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxAyATIMkUrVO8G6CQdQZgvWbcNr8rycEZ7IEiQgywmCt9isa5PSGw7c1dSYtLs1jpqoCVR
X-Received: by 2002:ac8:610e:: with SMTP id a14mr26504807qtm.187.1571691775675;
        Mon, 21 Oct 2019 14:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571691775; cv=none;
        d=google.com; s=arc-20160816;
        b=PNvWeF+wWlLgCRvd12HysL4Mqm1axye8QFcHDp2K0CmoqIq9ON1mUsrEaUCOPFoDXF
         j4E7FrFe6/+zXkeB8JKqRw5mDmDEhytgoNn92L3O7P8Bs5h2chEjwVpMV5omX+y9Hfjk
         0omGiq4kip+z2oVcv5kICgurvFeI5/1mKJqzRPsfviw7ssY47Gv8Ybg/ORtriW3pOXvQ
         elrEgSMMMyhNFvHu4/pnGxB3D7AyN6dVM2igssRmdMJ1dpPnh4cVa+B8mErnXdyOUtDW
         jqmMD8ZnroYXONhQvddWdGoT28i/6GZC5Jiz6Dxgx09VOJbEXw3mYQzLe5GtKhjSh3c7
         PBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/4GYEEZxPx2EoffTa5gB5GuX2Y2RuIDNsIu83WJIHSs=;
        b=ub2kFWOC+eBTS/q+Y8C6NBk4fPdJCiKCf06ahOBYSPDuW4AtEzIYyOQgrMvakKxXkh
         oo1Et0l1CxajfHUbms/QdwCDlC0KRFyZGYJq9Kg581PVo0ZbhesWgH4Xxarvv3ND3qjs
         /u25yiog+YuGKzQCI1JZLVyleGNQ3hY2kC5KWF1a22NVspwSVP6FL/bXVH3JQybx1cOv
         3fTSCUWXFZPuseuXI/pNHm2V3OpvEzMA8NTGuz+GKqIhiJPBxSxjX/oUjjLGg882sYUd
         TMwrf4C1dJQwJGTGWp888XfmcLwQvWcM3654UPvhWvIoF77dJGT0q1iAEQ83rpDz8eHi
         hWEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=avK+l72v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f36si15473049qtc.206.2019.10.21.14.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 14:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=avK+l72v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMepL-0007I2-2H
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 17:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43089)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMepA-0007Dp-B7
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:02:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMep9-0008OL-6l
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:02:44 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41261)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMep6-0008N0-P6; Mon, 21 Oct 2019 17:02:40 -0400
Received: by mail-lf1-x143.google.com with SMTP id x4so4951397lfn.8;
 Mon, 21 Oct 2019 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/4GYEEZxPx2EoffTa5gB5GuX2Y2RuIDNsIu83WJIHSs=;
 b=avK+l72vFf0cK4Rb/qZDKD64x6px5QGuyrqSm6Jj1tKlPMyZh9tA8t3aLS0yUx/2dK
 YRQF6eCjEUERU7qfI8ZoOeQb1zaN+lpQaYgB4qD4pDgoXR5MjPFtF4sOWanA8Llg8gt5
 h9Wrc6PEfjjxg+nbtoihbJCfQGa9E3THG9Bc8q4PN4Qvd3KebBlQGav9co4o6l2H4beO
 5I6ln8a2H7zzqJUHe/tZIe8woJ4c7W7WKwiFX8VKQ/6rw2k6BRka+idggGKg6sHk7FCF
 Fc+glqMOEYL/7/RyrvzbRTiy161re3LHePmT9SCU0JexSYmNpOtclHonbta7etrF3XQj
 vVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/4GYEEZxPx2EoffTa5gB5GuX2Y2RuIDNsIu83WJIHSs=;
 b=nA4U0m4d8JFgkXw386bJapS5pNM8s80JNo9T0V5ctdqp8IqUeAamoBRDNRfGahF3fw
 bB1ewZ0fEj8756JpRBuT7a3TM85sxmTiMJXNbwxFeTOo33T/rvFF8uhPEqMEksV6+Veo
 Ik+4cX5oUm4zJYGAQ3V0Dw5mpxyfyZ/mxAU/nMBeJRS1+5mXWfxhvUZOqvcetSHjaV9l
 tFTJf6QrZFJeG+6iho7vUz0M2iQfU93TWa8UEb35cjRyHDY22Q+n6usBl3aj+T0HnsZL
 7H5olq/i+Io2GlpkqunSRo14mKmX44MxTy/YCtnw1/LGbYn/6VelDa3WVxCxwYNM2khV
 nFFA==
X-Gm-Message-State: APjAAAVbDl7hqwcBG/5yC0Lv8HigGPxA/pHW/lQfaTtMwHKyaWg2cQEI
 pzswq2o4ipq8voapGbLuk1AYGAo3B7NZP1Hr3UE=
X-Received: by 2002:a19:855:: with SMTP id 82mr16116361lfi.44.1571691759285;
 Mon, 21 Oct 2019 14:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-17-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-17-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 13:57:23 -0700
Message-ID: <CAKmqyKN9pc+wLV0wUZYgCm9-35dZKdJAM-Yu6zMc0bwY5v8FVw@mail.gmail.com>
Subject: Re: [PATCH 16/21] hw/lm32: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
Cc: Paul Burton <pburton@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Fabien Chouteau <chouteau@adacore.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NzUd0XuvrEMn

On Sun, Oct 20, 2019 at 4:10 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/lm32/lm32_boards.c | 4 ++--
>  hw/lm32/milkymist.c   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
> index 5ae308bfcf..50b607e0cc 100644
> --- a/hw/lm32/lm32_boards.c
> +++ b/hw/lm32/lm32_boards.c
> @@ -107,7 +107,7 @@ static void lm32_evr_init(MachineState *machine)
>
>      reset_info->flash_base =3D flash_base;
>
> -    memory_region_allocate_system_memory(phys_ram, NULL, "lm32_evr.sdram=
",
> +    memory_region_allocate_system_memory(phys_ram, machine, "lm32_evr.sd=
ram",
>                                           ram_size);
>      memory_region_add_subregion(address_space_mem, ram_base, phys_ram);
>
> @@ -200,7 +200,7 @@ static void lm32_uclinux_init(MachineState *machine)
>
>      reset_info->flash_base =3D flash_base;
>
> -    memory_region_allocate_system_memory(phys_ram, NULL,
> +    memory_region_allocate_system_memory(phys_ram, machine,
>                                           "lm32_uclinux.sdram", ram_size)=
;
>      memory_region_add_subregion(address_space_mem, ram_base, phys_ram);
>
> diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
> index 460d322de5..ee2eb1877e 100644
> --- a/hw/lm32/milkymist.c
> +++ b/hw/lm32/milkymist.c
> @@ -116,7 +116,7 @@ milkymist_init(MachineState *machine)
>
>      cpu_lm32_set_phys_msb_ignore(env, 1);
>
> -    memory_region_allocate_system_memory(phys_sdram, NULL, "milkymist.sd=
ram",
> +    memory_region_allocate_system_memory(phys_sdram, machine, "milkymist=
.sdram",
>                                           sdram_size);
>      memory_region_add_subregion(address_space_mem, sdram_base, phys_sdra=
m);
>
> --
> 2.21.0
>
>
