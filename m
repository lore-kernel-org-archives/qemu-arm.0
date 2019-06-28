Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp145705wru;
        Fri, 28 Jun 2019 16:11:48 -0700 (PDT)
X-Received: by 2002:a2e:7604:: with SMTP id r4mr7582690ljc.225.1561763508186;
        Fri, 28 Jun 2019 16:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561763508; cv=none;
        d=google.com; s=arc-20160816;
        b=odapcZ1Fv+YRmbx5Bb9Rp2QLeQ77YcUIsTfNyWZeF0n/DEhQhxfVpc5oP7iRrEVUgh
         AbyZKMfh+Y8nRMOTp/uIZj7CMGNqOD+kO7bR8zUvRAGwQyO1l9IiBa2YQOxmjs4mcULv
         FEBCElPmjwVNHDPu6woXnfZpAKzNu0q/MwwwpGm/BTuA+lFmW6LUt+n3B9Obp0XuP066
         PcmR6kSHtAb3RXYRrDAWr7Q7R+B103j7/jETV6CG4sN/8Je2P0GpArOTHQ6dM3ShZDX0
         xD2pqubF8Pc+93m2XOsfQ17I4NSeNig1Ob6tDy2S19oYPS840LpzluHW7qFL1jdzqOGc
         n8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qccsu5x6kB7jCaLQxuOMBdY/fI0UO2VS1SdP2VVyGk8=;
        b=K4HaNEWPNxwC4tBDP0seXs1IsFUyubJpCPQ9WaJsmbYuX4EVG+7PBr7i0V9L/FMcjw
         PC2N+B4Dn4jrL/CU9gMamUpjnZW4BT8rLCWVOF+NOGX5YfbNRpnsf2XkK6Ix+ABpv0g1
         0JCJEd5AxLJ7UmFGzjK+xbsZfLpx8S4oos1Whwd9QF4YelTiMjvCs3JNhXT0WRJKYjCK
         3FQG17Vvw4MHPVq/K6Z0vzuaZYM6rdA8kzqF3vh2pXyb8g2iNdl/5bGDNq0wKanQLwhi
         GlagQqnGMsjcBEXdWYXmIGZHUdE9lEh5rHA1TVtdsBjTAdC5hv50bWTHXlcJVnth03QY
         n9mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IGZ67m6i;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q7sor2374706lje.0.2019.06.28.16.11.48
        (Google Transport Security);
        Fri, 28 Jun 2019 16:11:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IGZ67m6i;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qccsu5x6kB7jCaLQxuOMBdY/fI0UO2VS1SdP2VVyGk8=;
        b=IGZ67m6icfCTAT9pHsv3SlJlXQ3bh03DrZsIiXGsOR8Q/k1cQdZkG+wyVIJcZncemC
         gU2RSLsGEVvjMGIvmcKEIIC8IqCv8/qJpV/BStBTQbiYYw8WsGCky7H6xvUbMto9/ui7
         +WA3qF/GqWFBZ7yXr/GcMdQSuigHLL8H4rIvO1uPlcsT3sZrAMCCgcoIVGhM2Fv+G63n
         +M1fz8N+4NcGUtRDoEVlRtfW2pm6K6D/3iqmwSA/FllH1wNoDfeedW2k7du+31uT5q5K
         OYcbM9LR5j9EJRcUyuNrL0JafjGcDcYefVjTgBu4Zj11hSW1UPs9P+OU0cGv5USBHSmh
         PTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qccsu5x6kB7jCaLQxuOMBdY/fI0UO2VS1SdP2VVyGk8=;
        b=iVlPQX1SwdulRBpJIQQZ+vWPmx2OHDgqPhXXuWtCiAk4RsN2/m7mRfJmFp1HviERT+
         EXZCmEp34DH42JOzIXrWJhT3Zmv7L09f2sciLBr8y56ChvAd69lZF2BM01bCl6D+xPDA
         YtUY3M/YL/tSCzlUdI2KrhE0zLMA9mDYN8uZgRJ+36S4jPRDEGfkxJ7xNgvy8i8LBQGb
         u7GvZl0eawiAySKSRB7fn+iBsKMhb3Yk9Qq3Dclj56+9YeAVOQLy1s5t4lfUz8TQHkyE
         Gtyig8LaHjcVh33v9syOjVmHN7hqv24KT/JuqccHn3vtoZKPEDmxzdqC1JsBFLWSWMMU
         DamQ==
X-Gm-Message-State: APjAAAUi95JspLPDSGhs2JO/ZqFXNFz4Q/gzT5ZzhwIHGt4at69+JgVu
	QqWGgWNK6XpuuYNoSE/TphxuwaZPJEa+qUosMvM=
X-Google-Smtp-Source: APXvYqy79NVVizY6RqRQ0IfOPnbJDd8b5qQGC6oBOGQ6Jv5CtNYODUAmY61f7bF6Mg2/Sh50f+Ly8FlATIX/evH/f7M=
X-Received: by 2002:a2e:5d5a:: with SMTP id r87mr7628182ljb.196.1561763507836;
 Fri, 28 Jun 2019 16:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-22-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-22-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 16:08:47 -0700
Message-ID: <CAKmqyKOX0qNuLGEj1xCritNStfgq9tPKkqdy3P8gd4+y-yuXZg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 21/28] hw/block/pflash_cfi02: Fix CFI in
 autoselect mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Magnus Damm <magnus.damm@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Aurelien Jarno <aurelien@aurel32.net>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3qtDjgoQ+l17

On Thu, Jun 27, 2019 at 2:09 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
>
> After a flash device enters CFI mode from autoselect mode, the reset
> command returns the device to autoselect mode. An additional reset
> command is necessary to return to read array mode.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20190426162624.55977-7-stephen.checkoway@oberlin.edu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c   | 22 ++++++++++++++++++----
>  tests/pflash-cfi02-test.c | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 4 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 08b2bc83cb..13f76fa71d 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -66,6 +66,7 @@ do {                                                   =
    \
>  /* Special write cycles for CFI queries. */
>  enum {
>      WCYCLE_CFI              =3D 7,
> +    WCYCLE_AUTOSELECT_CFI   =3D 8,
>  };
>
>  struct PFlashCFI02 {
> @@ -311,6 +312,12 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>      cmd =3D value;
>      if (pfl->cmd !=3D 0xA0) {
>          if (cmd =3D=3D 0xF0) {
> +            if (pfl->wcycle =3D=3D WCYCLE_AUTOSELECT_CFI) {
> +                /* Return to autoselect mode. */
> +                pfl->wcycle =3D 3;
> +                pfl->cmd =3D 0x90;
> +                return;
> +            }
>              goto reset_flash;
>          }
>      }
> @@ -333,7 +340,6 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>          /* We're in read mode */
>      check_unlock0:
>          if (boff =3D=3D 0x55 && cmd =3D=3D 0x98) {
> -        enter_CFI_mode:
>              /* Enter CFI query mode */
>              pfl->wcycle =3D WCYCLE_CFI;
>              pfl->cmd =3D 0x98;
> @@ -410,9 +416,16 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>                  /* Unlock bypass reset */
>                  goto reset_flash;
>              }
> -            /* We can enter CFI query mode from autoselect mode */
> -            if (boff =3D=3D 0x55 && cmd =3D=3D 0x98)
> -                goto enter_CFI_mode;
> +            /*
> +             * We can enter CFI query mode from autoselect mode, but we =
must
> +             * return to autoselect mode after a reset.
> +             */
> +            if (boff =3D=3D 0x55 && cmd =3D=3D 0x98) {
> +                /* Enter autoselect CFI query mode */
> +                pfl->wcycle =3D WCYCLE_AUTOSELECT_CFI;
> +                pfl->cmd =3D 0x98;
> +                return;
> +            }
>              /* No break here */
>          default:
>              DPRINTF("%s: invalid write for command %02x\n",
> @@ -493,6 +506,7 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>          break;
>      /* Special values for CFI queries */
>      case WCYCLE_CFI:
> +    case WCYCLE_AUTOSELECT_CFI:
>          DPRINTF("%s: invalid write in CFI query mode\n", __func__);
>          goto reset_flash;
>      default:
> diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
> index 1659eaebce..00e2261742 100644
> --- a/tests/pflash-cfi02-test.c
> +++ b/tests/pflash-cfi02-test.c
> @@ -407,6 +407,42 @@ static void test_geometry(const void *opaque)
>      qtest_quit(qtest);
>  }
>
> +/*
> + * Test that
> + * 1. enter autoselect mode;
> + * 2. enter CFI mode; and then
> + * 3. exit CFI mode
> + * leaves the flash device in autoselect mode.
> + */
> +static void test_cfi_in_autoselect(const void *opaque)
> +{
> +    const FlashConfig *config =3D opaque;
> +    QTestState *qtest;
> +    qtest =3D qtest_initf("-M musicpal,accel=3Dqtest"
> +                        " -drive if=3Dpflash,file=3D%s,format=3Draw,copy=
-on-read",
> +                        image_path);
> +    FlashConfig explicit_config =3D expand_config_defaults(config);
> +    explicit_config.qtest =3D qtest;
> +    const FlashConfig *c =3D &explicit_config;
> +
> +    /* 1. Enter autoselect. */
> +    unlock(c);
> +    flash_cmd(c, UNLOCK0_ADDR, AUTOSELECT_CMD);
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0)), =3D=3D, replicate(c, =
0xBF));
> +
> +    /* 2. Enter CFI. */
> +    flash_cmd(c, CFI_ADDR, CFI_CMD);
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x10)), =3D=3D, replicate(=
c, 'Q'));
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x11)), =3D=3D, replicate(=
c, 'R'));
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x12)), =3D=3D, replicate(=
c, 'Y'));
> +
> +    /* 3. Exit CFI. */
> +    reset(c);
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0)), =3D=3D, replicate(c, =
0xBF));
> +
> +    qtest_quit(qtest);
> +}
> +
>  static void cleanup(void *opaque)
>  {
>      unlink(image_path);
> @@ -474,6 +510,9 @@ int main(int argc, char **argv)
>          qtest_add_data_func(path, config, test_geometry);
>          g_free(path);
>      }
> +
> +    qtest_add_data_func("pflash-cfi02/cfi-in-autoselect", &configuration=
[0],
> +                        test_cfi_in_autoselect);
>      int result =3D g_test_run();
>      cleanup(NULL);
>      return result;
> --
> 2.20.1
>
>
