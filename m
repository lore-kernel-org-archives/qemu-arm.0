Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4283176lfm;
        Mon, 13 Apr 2020 15:29:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypLyzrdiSDKo1j6GAZkJgRlx/vd4iQmZY/xjUg5aSbHNUB68A8UAyH6h7WIZZ5LjPrVr+Bc1
X-Received: by 2002:a37:6697:: with SMTP id a145mr7760291qkc.479.1586816947062;
        Mon, 13 Apr 2020 15:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586816947; cv=none;
        d=google.com; s=arc-20160816;
        b=SqHQXIPOlJtBbcgp2rXBVNlg6arqVBabNE5WKKyP8oeDhXie4R5YNKbnCW19cM+0k3
         K72DuEDqOxV8NtblGX4Vd5Iyet3iuQtDSljVc7WRpO6eZDb/hOHDsZvgZLel655XCti5
         4kEyRLv8+qNCZA8bHntCUkqXhDHLOje79GZo6v2tMuzLkEp2o5b/fFEM9nttquhKUC39
         NU5NptHCVcQOZJttD5dD9+T30yPJCaAlCYkiJ1GLQqFxAe9OOUygrIi9a8hwVBqsuCWs
         o6OHxtxmPNBfmSn/lqx3nZcbJbsqLimAQQoVVLyRirCX4JUqZ67bvYRdHb6xKdv2w3Ev
         Bq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sPwFUCD5WD03IbhSKbITuz7UtC98LCV4nW8YJYz10tE=;
        b=fa60u0Ahsx7cVIxtsaRNXnrpyLco2BaH66SV2BtWRodm4CQ/oNYqBU6WjUrvtiJv7y
         fc++0l+hM4ld2AInKRbpe4X+hAPdOOutbQmLOLiujnsE8RpLcm81xSsTX/gKsgYZsrxd
         gzMjGgkOr+LNBQWew/cOwRKwfOQD8Nu8TMVgichf//L8IwMk1RrljKhZdVqYWdPtNBJx
         7WuEExhpQY4gtv4Jni+/2hi7GBtcdNWm4bmxTxB40N9AHQQvVOBqDD0KCmBwU47dXYBq
         YuwVgk7p1ggZ6GheoFAQnWUV4+1ByEshr3zS54nx0CWv10AjnwlEq70xdbJv+8V8yZBn
         PGFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UB4VCZiZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si4451411qko.257.2020.04.13.15.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 15:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UB4VCZiZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO7Zi-0008Dv-EA
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 18:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Za-0008AU-I7
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 18:28:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7ZZ-0007d4-Bv
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 18:28:58 -0400
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41]:37363)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7ZT-0007Yn-HC; Mon, 13 Apr 2020 18:28:51 -0400
Received: by mail-vk1-xa41.google.com with SMTP id f195so2694828vka.4;
 Mon, 13 Apr 2020 15:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sPwFUCD5WD03IbhSKbITuz7UtC98LCV4nW8YJYz10tE=;
 b=UB4VCZiZ7rTnlcmBPWRpjT9/QNLTW/YrBtVm6zuXEJMEiDeVdF4BIE0xAPW+MCxY74
 O996QqWcC+XyUjz5SMjMImRJ28H92XviQm7M43K1oNpZY1SHX4AHXoTQ14dHwlpftx2t
 QbfYhXZtQY21ipV7nGHf+zcwNkTnhQdxjVMnOYnzt4dUMEkgFIz4x7GCNP4gPQeujVQh
 he6IkO/+Y++Etu0cY1LnnYqnqPj3wwtc0Ua02OBGJQByUo2yylaTe2VlCvnjha+jC3ZJ
 Oli3EDOvP91i6u/yiWssGjJ2zWICsKaeCNvl0Ao+KRmz6edzb4kh3ID1bKY+NO00JfLN
 0lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sPwFUCD5WD03IbhSKbITuz7UtC98LCV4nW8YJYz10tE=;
 b=F8ZEOLTgr7dAGDJwLXtQvGwuNmVMF4L2tKR+5kGk29Z79990zOjASp2UvGPajA8rdF
 TT094TK24ee0qkmt5VhyOP5wJnE8UmgF16+WvHvAbgK22ioC7Sj1q/T+jVUoXqs2T1NA
 zc9wNiPnYU51cuIgw18fzjtIjwiKJTlORkdyL+uVbJP5y1PZbORv0yGag3HvfXNtnVzw
 sGM0481eyocluEY1i22ZMeBe9d0rJ0+UwTZ7fFUaJy7NsEcNyMC1DZcDqDx0EONTj9FM
 pAm8ioMoNFlSYBRulX/aedgsHduuxdkkkorSbl0O9lKRADtnGnrte237NjHrmLnBtzBo
 5RCg==
X-Gm-Message-State: AGi0PuZ4+PU7MoQWyw115AtconOzudw1Xnx65t6tlR+KT1uMdPSAqbGh
 OEgRjcf9aFA1N6dazrfgcifKk7UwXfLzuMst4ZY=
X-Received: by 2002:a1f:2e8c:: with SMTP id u134mr13040124vku.16.1586816930627; 
 Mon, 13 Apr 2020 15:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-20-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-20-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:20:34 -0700
Message-ID: <CAKmqyKMGO+a3MO33RLkw5ye_OYfJ8zE_HXF+ET3tzHXQgK9cgA@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 19/24] hw/riscv/sifive_e: Move some code from
 realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a41
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uVyVP4gIvZAp

On Sun, Apr 12, 2020 at 3:45 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Coccinelle reported:
>
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/riscv/sifive_e.c
>   >>> possible moves from riscv_sifive_e_soc_init() to riscv_sifive_e_soc=
_realize() in ./hw/riscv/sifive_e.c:135
>
> Move the calls using &error_fatal which don't depend on input
> updated before realize() to init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/riscv/sifive_e.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 646553a7c3..0be8b52147 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -118,7 +118,9 @@ static void riscv_sifive_e_init(MachineState *machine=
)
>  static void riscv_sifive_e_soc_init(Object *obj)
>  {
>      MachineState *ms =3D MACHINE(qdev_get_machine());
> +    const struct MemmapEntry *memmap =3D sifive_e_memmap;
>      SiFiveESoCState *s =3D RISCV_E_SOC(obj);
> +    MemoryRegion *sys_mem =3D get_system_memory();
>
>      object_initialize_child(obj, "cpus", &s->cpus,
>                              sizeof(s->cpus), TYPE_RISCV_HART_ARRAY,
> @@ -130,6 +132,18 @@ static void riscv_sifive_e_soc_init(Object *obj)
>      sysbus_init_child_obj(obj, "riscv.sifive.e.gpio0",
>                            &s->gpio, sizeof(s->gpio),
>                            TYPE_SIFIVE_GPIO);
> +
> +    /* Mask ROM */
> +    memory_region_init_rom(&s->mask_rom, obj, "riscv.sifive.e.mrom",
> +                           memmap[SIFIVE_E_MROM].size, &error_fatal);
> +    memory_region_add_subregion(sys_mem,
> +        memmap[SIFIVE_E_MROM].base, &s->mask_rom);
> +
> +    /* Flash memory */
> +    memory_region_init_rom(&s->xip_mem, obj, "riscv.sifive.e.xip",
> +                           memmap[SIFIVE_E_XIP].size, &error_fatal);
> +    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
> +        &s->xip_mem);
>  }
>
>  static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
> @@ -144,12 +158,6 @@ static void riscv_sifive_e_soc_realize(DeviceState *=
dev, Error **errp)
>      object_property_set_bool(OBJECT(&s->cpus), true, "realized",
>                              &error_abort);
>
> -    /* Mask ROM */
> -    memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mr=
om",
> -                           memmap[SIFIVE_E_MROM].size, &error_fatal);
> -    memory_region_add_subregion(sys_mem,
> -        memmap[SIFIVE_E_MROM].base, &s->mask_rom);
> -
>      /* MMIO */
>      s->plic =3D sifive_plic_create(memmap[SIFIVE_E_PLIC].base,
>          (char *)SIFIVE_E_PLIC_HART_CONFIG,
> @@ -206,12 +214,6 @@ static void riscv_sifive_e_soc_realize(DeviceState *=
dev, Error **errp)
>          memmap[SIFIVE_E_QSPI2].base, memmap[SIFIVE_E_QSPI2].size);
>      create_unimplemented_device("riscv.sifive.e.pwm2",
>          memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
> -
> -    /* Flash memory */
> -    memory_region_init_rom(&s->xip_mem, OBJECT(dev), "riscv.sifive.e.xip=
",
> -                           memmap[SIFIVE_E_XIP].size, &error_fatal);
> -    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
> -        &s->xip_mem);
>  }
>
>  static void riscv_sifive_e_machine_init(MachineClass *mc)
> --
> 2.21.1
>
>
