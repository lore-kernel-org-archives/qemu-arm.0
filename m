Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4268831lfm;
        Mon, 13 Apr 2020 15:11:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypKj/LdYKnEoQkXo6F2f0TgWh0IcVRZ/GQE7A/xUw7B+T5b7oBeYyLWL5EFDeoXKA/to0HPS
X-Received: by 2002:a37:6044:: with SMTP id u65mr19233138qkb.246.1586815909937;
        Mon, 13 Apr 2020 15:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586815909; cv=none;
        d=google.com; s=arc-20160816;
        b=QHyve5/KBA32Ah72CPU0I8IZ6vQ1K3Ns5+cZznHHNqTxd6Sff7M5PaFUgdm109RZD/
         tj+7pTZ6uTNRdzlETlbflY1/YGzf3/qvb3uAWoygtB5uegqOVnG8mbwTar8q1Qez0bhw
         DPkA4Z8/Jo7ytHi14QVOXRbZU2qhSkUGuyJzKQqiB+HyaT61cHqOH05nuLGliua/D2HF
         cefiNVzgeidi7Ak05/xs97hM9oKoTOEgvX2hwzs7Wm+zzcK13X+qTjAlItuKTzyygNqv
         8d7GKwqJTEMyCW9Mev+kIeO+wlJeWXlUCenlGuqNpAX4ZOI7+0Ng3ueQUNgyvnMtP6mC
         +Oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yp3uRyXUbrr7K91bFkqtrR4DLr8WXPjvVNnCPGpgGQg=;
        b=xlf50ekO1JZgzdBvLghvCUgvyh3UpmFKm4Z2Hc2e/rzYO1tOCHiE0dDKH6/BSwOi6b
         o30rxsE7g5tF33UwyvSn6ZSUya3x3I3fn64QZsTMyDdhE4lJP4UpqHs2DZwfwCZTtr/q
         rfIHzAMZ+4ExUh5s0/ZU8+CzE1Nc0y1HqvRsrxpZag5cBEFBPUwVfdg/AdbXJMVdfUPo
         sfyJzjuwqRjTVaZiDSPF8BkpwJ7RDac368aIWYmaXxF03c/qaGSTKClHvCsSImPn0OS6
         xAfsd/ech4XjZKKBpw4bmtw0yx4sVxT0wEf0XI30YXTzgoo7bgt50ABcQPTApuv47Tyz
         ikTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dDJdDPg4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si6238227qtp.366.2020.04.13.15.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 15:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dDJdDPg4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO7Iz-0006jf-BP
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 18:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Hm-0005d7-H2
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 18:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Hl-00049D-Ca
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 18:10:34 -0400
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42]:42935)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Hl-000492-8J; Mon, 13 Apr 2020 18:10:33 -0400
Received: by mail-vk1-xa42.google.com with SMTP id q7so2665428vkb.9;
 Mon, 13 Apr 2020 15:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yp3uRyXUbrr7K91bFkqtrR4DLr8WXPjvVNnCPGpgGQg=;
 b=dDJdDPg47GYhwoaf0VeWtQsObtsxM3ssPsRwKCQ7QQ7fiDkn8JrTFq49U5kkbdzme9
 Ka4MCRTMhdZwLGfofa+VkAFx688GuPlONs8XlBe2ILGUxr2H8SpFQecTqjHwmAJVg5+P
 CiYWwVyQgK7/ktpfhrI8QcUx1cvIJrLD6HYF46ZSkUyILjmKS+pAcPnQppuIyxE4Ub2C
 aZwkxQRDyzGTy7DENx/lyV97+P1V6mdVyiuzpP1MH8EMD03ZNYDSAmuFQH2xwsiORrr9
 G5hvhKyHlMlHWLWXTaG9OgAOItMKYZG9MyVYQpLIHSf0NS0F6hZlGoj8CSVr3XIfeh9S
 +9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yp3uRyXUbrr7K91bFkqtrR4DLr8WXPjvVNnCPGpgGQg=;
 b=K7fWpAEql+NimJeZxTGZ87nbUthevik8A6rRB86hG33fnQSfucHOE6kGz7cwwituEV
 yXybImSiopK39IrZ4BN0GOItFtDf9tS5ovffxrG4QH0di9n/0OI17tWkLcszTPD9bQU2
 ripYQMfw+XEBnHVzH87v3tg+QabO74fk8AyWABaot/4bzn9KMDMqMyAdP4fAbKgWskm6
 NS4DoTuVfDMKHZRMZra2g4/VZ50uajuuUFOG9bdO11pd+lyAIuNB2L7Mr+ab0PRj/aV5
 TUz5N1ZRpDVG1ye0imNetv+3YpcVtapbhxnmal1oscOfEkaqbJ/1Wi3ivyZfMrt75XjT
 sfqw==
X-Gm-Message-State: AGi0PuYIegpY14/bYVjfq57RyIm6HhUL3crze7ineowwM0FDp5N74PwJ
 qqMR9FxU2ZpUmRwY/0wzLFRGVnnjNaLd1o/TCck=
X-Received: by 2002:a1f:a090:: with SMTP id j138mr13057801vke.37.1586815832589; 
 Mon, 13 Apr 2020 15:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-14-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-14-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:02:16 -0700
Message-ID: <CAKmqyKPRM=BTEfFU5=UvN0QMr5K3LAUzTPgd-0wPbA5okaMq7A@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 13/24] hw/arm/stm32f205_soc: Move some code
 from realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a42
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ql1vwqCIsngY

On Sun, Apr 12, 2020 at 3:42 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Coccinelle reported:
>
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/arm/stm32f205_soc.c
>   >>> possible moves from stm32f205_soc_initfn() to stm32f205_soc_realize=
() in ./hw/arm/stm32f205_soc.c:83
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
>  hw/arm/stm32f205_soc.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 42f4e44134..76b0b0e9be 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -49,6 +49,7 @@ static const int spi_irq[STM_NUM_SPIS] =3D {35, 36, 51}=
;
>  static void stm32f205_soc_initfn(Object *obj)
>  {
>      STM32F205State *s =3D STM32F205_SOC(obj);
> +    MemoryRegion *system_memory =3D get_system_memory();
>      int i;
>
>      sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
> @@ -78,6 +79,14 @@ static void stm32f205_soc_initfn(Object *obj)
>          sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i=
]),
>                                TYPE_STM32F2XX_SPI);
>      }
> +
> +    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
> +                           &error_fatal);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sr=
am);
> +
> +    memory_region_init_rom(&s->flash, obj, "STM32F205.flash",
> +                           FLASH_SIZE, &error_fatal);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->f=
lash);
>  }
>
>  static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -87,19 +96,10 @@ static void stm32f205_soc_realize(DeviceState *dev_so=
c, Error **errp)
>      SysBusDevice *busdev;
>      Error *err =3D NULL;
>      int i;
> -    MemoryRegion *system_memory =3D get_system_memory();
>
> -    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash"=
,
> -                           FLASH_SIZE, &error_fatal);
>      memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
>                               "STM32F205.flash.alias", &s->flash, 0, FLAS=
H_SIZE);
> -
> -    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->f=
lash);
> -    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
> -
> -    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
> -                           &error_fatal);
> -    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sr=
am);
> +    memory_region_add_subregion(get_system_memory(), 0, &s->flash_alias)=
;
>
>      armv7m =3D DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
> --
> 2.21.1
>
>
