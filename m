Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3150268njc;
        Tue, 5 Nov 2024 14:30:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUR74WnQ5KwcEy2BCi9PkNT0wrUz2Q0iWj28hRTgHlabWwp+eJ6UOC61QZ6n+18gXJ9gAGFE+oG28jszw==@linaro.org
X-Google-Smtp-Source: AGHT+IEgz0LZG77okkzzSik2wP6SCUbbTh8LfGy76lVAXjYhALvi9jJlRpYlGsSZWR1qBXNEWbvX
X-Received: by 2002:a05:620a:410b:b0:7b1:4073:e8c9 with SMTP id af79cd13be357-7b2fb964f8emr2503736585a.20.1730845804808;
        Tue, 05 Nov 2024 14:30:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730845804; cv=none;
        d=google.com; s=arc-20240605;
        b=Vsqko2zAdwVtjfBEWEUBPdfgJd6l8judEJ6dpj8swD1vyTTyXeLcy1x/Z0nZe+fGH0
         Kaj7RWrW73CBYNvLqIj6X3JseagfVvts+d4jPWMkZvrKrmmhHiExigsl5xNwkRe1IT7q
         I2h6ZThXYvlpJMQMkNvh8fHsfVlUC2ufLkwObztHblof6DZfQKjmPUD6OeRHV+XpstGW
         BjHvjwIEejacV9uvJJWiRV5TWpI70ErdV3BnZPb9+Kt2WYgdDZquzvgSS21/voFIncRZ
         i6gb3TvvxvfD7pMeSb5bshhCYZBddKqu2+JQfTsFG4i2GU8vayhN0Z4PDhrOd5Lekq3s
         6z3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oGO9MICo6jKhq9VwPdZ6jahDb4TVdUEcMfxq2EiVi48=;
        fh=HDlNf+vPi0UvsY1uuznWHcVqzsQ71tdea9tCl5KaaPA=;
        b=ljf+iRWWyJ3IE2m5PmObEI9PQDNwax8cdW9Lct5D2yzmS3g86SI9k+8GiyJBkBFiPR
         rwAaeClRcVL98j9oZ6Np0TwLGzkuOI0yIhjPqi5jbhQlDQbaeTj4alfbR0RHtN+To9Jy
         G5ikhmkiSNagRfTotsheilirQnQbiLqx0VeFKSRaPq0kmxz5cNUnfgXu3pKXLxoKm8Ga
         OuKi4pCYQfSNwgD8TAo5LXWZjDm2911eVgONRHAmOz069/VUfZ71V19wVVtdhtlJak6q
         dcsCGfsP8Na2HnFnVafiWuw1m+cwA8XAKaFjAbJ2Exb8VFVkOuTX8+TcG4h6tNVMUiBg
         hHvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EJn+ygVY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a9cae9si1577284685a.466.2024.11.05.14.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 14:30:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EJn+ygVY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8S3U-00057x-L0; Tue, 05 Nov 2024 17:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8S3T-00057Q-2j; Tue, 05 Nov 2024 17:29:43 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8S3R-0000ry-Ea; Tue, 05 Nov 2024 17:29:42 -0500
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-84fdb038aaaso1803555241.3; 
 Tue, 05 Nov 2024 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730845780; x=1731450580; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGO9MICo6jKhq9VwPdZ6jahDb4TVdUEcMfxq2EiVi48=;
 b=EJn+ygVYvz/lEbbIG6A2ZAyL9wSao8dRuhdueyhOdY9+iInKkxn5GBX/+8AXSkM5kQ
 J02gu4HEOIzMOVjQde6IXwkIOd4P18lPcJVrbOeBAWjZtgoth1B/t7i12NADqLmqotz8
 yrK/oF7UfXj8nMKi0zHIdh2IKZPi/fnQlFoZ+CQFHPdiS4dCd1yXwPaynxpHdlqx2r1i
 uGWzekc2vDWVEl0nIncjgfXOvScEiWkFwFSA8P0IXbxLcwbOAuLqX3yDmszrfW0tV4kg
 kLg1NjzhnhOwratkflbe4POqauw5hszK7Xt+mxkJRqLfl2q41iYG9kUYmC20HluNyExY
 9yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730845780; x=1731450580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGO9MICo6jKhq9VwPdZ6jahDb4TVdUEcMfxq2EiVi48=;
 b=wVtm7lEI4wLayn5WK1PMkDclcCrvButIVjTzOl89DmJiiMr6JOYML10gND7GRfr5Mt
 gwgaYaztlGE3VAwEhc6ucScYSBw7dQPjVorMnWXmcAsPUR2rhgrHhu71E7lCuq+aTC05
 5jysPG0TXnflwzE1mMKIR5kjQu/meBukR3oHpq20HMuWUfeOM2o6wiD8YsH+ywReZdUa
 Wn3B2UASneYJVbJ5TATtiuBh7Ty/LiXlPqbvM6eHxA7NS300JoL5otbpVqIJSoOei6SS
 ZZFRdmn8p0b7Y2ce5Qej3wgkTd1mpecyT65y+GPLdjdiGeTsjCCjjhDAawx+LYlKgS57
 k0Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjJ1F5CNa0xeu8/5OmtHwtkwIYEUBQIbUzJFFm8tc2+aF8opxVpaY8ZRczetM1sa/wgcrXuTF35g==@nongnu.org
X-Gm-Message-State: AOJu0YzCmEIOudjJ++Hs/Nqm3FQv8JexUFDo5YYtd93xezC5KTYUhv5m
 kqzEhExqQHKNKAqMNCXndY+fqfOt+rBrkCrvlaKS0rhL4RkZ/UhX3H0yLfvbK2Vyqe5hwHR1fli
 SO0hw++j2Ru/t75SOTG8/0w0yUvM=
X-Received: by 2002:a05:6102:370e:b0:498:ef8d:8368 with SMTP id
 ada2fe7eead31-4a962e0b82fmr15497448137.13.1730845779955; Tue, 05 Nov 2024
 14:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-2-philmd@linaro.org>
In-Reply-To: <20241105130431.22564-2-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2024 08:29:14 +1000
Message-ID: <CAKmqyKO+Q5zNa_DPbubooXZ2o681ztzD32S-f1cLPKNhQEBDxg@mail.gmail.com>
Subject: Re: [PATCH 01/19] target/microblaze: Rename CPU endianness property
 as 'little-endian'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1Wr53UnxefAE

On Tue, Nov 5, 2024 at 11:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Rename the 'endian' property as 'little-endian' because the 'ENDI'
> bit is set when the endianness is in little order, and unset in
> big order.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/microblaze/petalogix_ml605_mmu.c | 2 +-
>  hw/microblaze/xlnx-zynqmp-pmu.c     | 2 +-
>  target/microblaze/cpu.c             | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogi=
x_ml605_mmu.c
> index b4183c5267d..df808ac323e 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -90,7 +90,7 @@ petalogix_ml605_init(MachineState *machine)
>      object_property_set_int(OBJECT(cpu), "use-fpu", 1, &error_abort);
>      object_property_set_bool(OBJECT(cpu), "dcache-writeback", true,
>                               &error_abort);
> -    object_property_set_bool(OBJECT(cpu), "endianness", true, &error_abo=
rt);
> +    object_property_set_bool(OBJECT(cpu), "little-endian", true, &error_=
abort);
>      qdev_realize(DEVICE(cpu), NULL, &error_abort);
>
>      /* Attach emulated BRAM through the LMB.  */
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
> index 1bfc9641d29..43608c2dca4 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -90,7 +90,7 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *de=
v, Error **errp)
>      object_property_set_bool(OBJECT(&s->cpu), "use-pcmp-instr", true,
>                               &error_abort);
>      object_property_set_bool(OBJECT(&s->cpu), "use-mmu", false, &error_a=
bort);
> -    object_property_set_bool(OBJECT(&s->cpu), "endianness", true,
> +    object_property_set_bool(OBJECT(&s->cpu), "little-endian", true,
>                               &error_abort);
>      object_property_set_str(OBJECT(&s->cpu), "version", "8.40.b",
>                              &error_abort);
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 135947ee800..e9f98806274 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -368,7 +368,7 @@ static Property mb_properties[] =3D {
>      DEFINE_PROP_UINT8("use-non-secure", MicroBlazeCPU, cfg.use_non_secur=
e, 0),
>      DEFINE_PROP_BOOL("dcache-writeback", MicroBlazeCPU, cfg.dcache_write=
back,
>                       false),
> -    DEFINE_PROP_BOOL("endianness", MicroBlazeCPU, cfg.endi, false),
> +    DEFINE_PROP_BOOL("little-endian", MicroBlazeCPU, cfg.endi, false),
>      /* Enables bus exceptions on failed data accesses (load/stores).  */
>      DEFINE_PROP_BOOL("dopb-bus-exception", MicroBlazeCPU,
>                       cfg.dopb_bus_exception, false),
> --
> 2.45.2
>
>
