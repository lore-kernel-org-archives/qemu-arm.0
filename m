Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2695290wru;
        Fri, 28 Jun 2019 09:45:00 -0700 (PDT)
X-Received: by 2002:ac2:518d:: with SMTP id u13mr5509782lfi.40.1561740300333;
        Fri, 28 Jun 2019 09:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561740300; cv=none;
        d=google.com; s=arc-20160816;
        b=As7lXqLgu8E3VUvjRfyECr6aiSU004AdPMyWHf4Y7Zw5iNt0AGx/PI6juddunUubs5
         yZ4Vik3fysL0L1eMWY2Iw0qeFz2qCdJ2Zij2U1ic26NO6hXnpDXkdubkWPlgvXvNWyE0
         Dcxst2Eyy7+IsOtPkcxsa7wx8h4at2b4pMYuJ2RUMj0PdRy2bBpPqQM/S6jtVSmvr14u
         UEmxdJE6Ck09ZFbsi+1hp0/OITA7cuwrS8FBGMAGXxfb8S4w7HvKNvfUwY7ii3nbcInB
         3OfTZn3JUak7YpX2GzrVh+8MtkhERRK4UTySH9Pka8goLF4gxN3bKyZz/AEHW2Yk7EvQ
         DuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FiVxb2pOJfybubAFv9x0+poY6MN5spN78Rt4EaXrzRI=;
        b=HQekmRykFsMID1nJKDO0vatsNxgLAM0M25DXtHU9klHWwhb8TuGH0go+66KoK/fTyD
         jZRqukwRa8z8HKfPVENs54f/kLIrVqm6W4fuoWZLKTGXt1BXNFrns61qz+9LWiziy90B
         xE4hJ0e7x0rHSwPgae73oqeJ+0NIwbRhG16l4O4FGugwKeyiX9Le+q9aTeuumZegol+4
         4j1bBysQU5bokAAZhISlJfk7G3ouh89uVZsAgSAOV3VjWdXbqdqIKznuVOiZ94BlkBir
         4xOwfKXGTPT8GaghM6n4i7idVwMMpRvHAxt2P8icrTpQMU3wwWYbHMrRxGgHEDsXJvFP
         D3aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="sGW16S/y";
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z28sor755313lfq.72.2019.06.28.09.45.00
        (Google Transport Security);
        Fri, 28 Jun 2019 09:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="sGW16S/y";
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FiVxb2pOJfybubAFv9x0+poY6MN5spN78Rt4EaXrzRI=;
        b=sGW16S/y76AjFe4FTuEEUM2mZ76ZjEA1+cyHx+AphABhMFR06+6IF3qyeK+SgcfyUR
         eFTScZnllD+/W6ZxN2+PBanJcsBTXddgKorapm0gy74YGKKtPKsBr7b5EO1nd7/wwdS/
         qqHal1su/YE8D2zYikIVSndrpDCw/kLiXvMJJcNvxZQlj9NptsLx/7rvKD6dBqpVQb/O
         BganvY51jWy5H4cMnNBxpSFZs4xe7kvZwLYlnh6/lUr109AzNj0WC9fpwYKmovFLdSLJ
         wfpNPYGfzM4UuwHgYVeOyoZfizKtdTDRrQAT7FFyukgN71rxIU/WPYCt4WwDMrLK9UvN
         KShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FiVxb2pOJfybubAFv9x0+poY6MN5spN78Rt4EaXrzRI=;
        b=jEjF2jvPiICaHkmBUl+18gqfcmzoqa8pJJva38B5BBbOoj7+mO3woSUGNMTlUutw6I
         QhXhJ/zjF+FWLJmt84Uqwq4UUHC+nDUIeb/N0X07vXsGFW/pYoAa1EOuRp6nSXN5plMM
         DqAVbyhnctG4E/mm5eZM4qxp2HFV8gBIgm9KCvh3Pjjh1y2Ebbt15WZuJLXjp0RnHMEY
         Et4Ojj2ZZkufVbDylLNZjuliQEZ01yZ65AG0BE+tDyL78/A64eJ+ms9DBMAkNPlyr1Xi
         VJL+iC2RClOwmcCQPP9iiL9x6DPsxxDWWE/Kd2c7r42L9PzECL6zT+QIM9SMhLw0xCgW
         hFuw==
X-Gm-Message-State: APjAAAVRpD9LFOPv8DTaeF+Ju5S3yrhMAQCDsuhFmXUWPfgyoUl+Xk0f
	bYeZV7Dtz0VpKQ669RblQ/l3b7vbDd/gTkBw2cY=
X-Google-Smtp-Source: APXvYqwSj9eyTu/lY/5xlPIBMmOQ7mKCJA8b1zFJG+9ZZ3JigOzsHkFNgNtG3dOOxViYMGEOJIyCx+X8ayQcauqov2k=
X-Received: by 2002:a19:bec1:: with SMTP id o184mr5180053lff.86.1561740299849;
 Fri, 28 Jun 2019 09:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-14-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-14-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:41:58 -0700
Message-ID: <CAKmqyKNx3ZPctFS4vzhWTsxUkj9qn7SyLc5DcjcVhu6cmoLmtw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 13/28] tests/pflash-cfi02: Refactor to
 support testing multiple configurations
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
X-TUID: jYOT46e2B3QX

On Thu, Jun 27, 2019 at 1:50 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Introduce the FlashConfig structure, to be able to run the same set
> of tests on different flash models/configurations.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/pflash-cfi02-test.c | 386 +++++++++++++++++++++++++++-----------
>  1 file changed, 277 insertions(+), 109 deletions(-)
>
> diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
> index e090b2e3a0..b00f5ca2e7 100644
> --- a/tests/pflash-cfi02-test.c
> +++ b/tests/pflash-cfi02-test.c
> @@ -17,12 +17,18 @@
>   */
>
>  #define MP_FLASH_SIZE_MAX (32 * 1024 * 1024)
> +#define FLASH_SIZE (8 * 1024 * 1024)
>  #define BASE_ADDR (0x100000000ULL - MP_FLASH_SIZE_MAX)
>
> -#define FLASH_WIDTH 2
> -#define CFI_ADDR (FLASH_WIDTH * 0x55)
> -#define UNLOCK0_ADDR (FLASH_WIDTH * 0x555)
> -#define UNLOCK1_ADDR (FLASH_WIDTH * 0x2AA)
> +/* Use a newtype to keep flash addresses separate from byte addresses. *=
/
> +typedef struct {
> +    uint64_t addr;
> +} faddr;
> +#define FLASH_ADDR(x) ((faddr) { .addr =3D (x) })
> +
> +#define CFI_ADDR FLASH_ADDR(0x55)
> +#define UNLOCK0_ADDR FLASH_ADDR(0x555)
> +#define UNLOCK1_ADDR FLASH_ADDR(0x2AA)
>
>  #define CFI_CMD 0x98
>  #define UNLOCK0_CMD 0xAA
> @@ -35,170 +41,313 @@
>  #define UNLOCK_BYPASS_CMD 0x20
>  #define UNLOCK_BYPASS_RESET_CMD 0x00
>
> +typedef struct {
> +    int bank_width;
> +
> +    QTestState *qtest;
> +} FlashConfig;
> +
>  static char image_path[] =3D "/tmp/qtest.XXXXXX";
>
> -static inline void flash_write(uint64_t byte_addr, uint16_t data)
> +/*
> + * The pflash implementation allows some parameters to be unspecified. W=
e want
> + * to test those configurations but we also need to know the real values=
 in
> + * our testing code. So after we launch qemu, we'll need a new FlashConf=
ig
> + * with the correct values filled in.
> + */
> +static FlashConfig expand_config_defaults(const FlashConfig *c)
>  {
> -    qtest_writew(global_qtest, BASE_ADDR + byte_addr, data);
> +    FlashConfig ret =3D *c;
> +
> +    if (ret.bank_width =3D=3D 0) {
> +        ret.bank_width =3D 2;
> +    }
> +
> +    /* XXX: Limitations of test harness. */
> +    assert(ret.bank_width =3D=3D 2);
> +    return ret;
>  }
>
> -static inline uint16_t flash_read(uint64_t byte_addr)
> +/*
> + * Return a bit mask suitable for extracting the least significant
> + * status/query response from an interleaved response.
> + */
> +static inline uint64_t device_mask(const FlashConfig *c)
>  {
> -    return qtest_readw(global_qtest, BASE_ADDR + byte_addr);
> +    return (uint64_t)-1;
>  }
>
> -static void unlock(void)
> +/*
> + * Return a bit mask exactly as long as the bank_width.
> + */
> +static inline uint64_t bank_mask(const FlashConfig *c)
>  {
> -    flash_write(UNLOCK0_ADDR, UNLOCK0_CMD);
> -    flash_write(UNLOCK1_ADDR, UNLOCK1_CMD);
> +    if (c->bank_width =3D=3D 8) {
> +        return (uint64_t)-1;
> +    }
> +    return (1ULL << (c->bank_width * 8)) - 1ULL;
>  }
>
> -static void reset(void)
> +static inline void flash_write(const FlashConfig *c, uint64_t byte_addr,
> +                               uint64_t data)
>  {
> -    flash_write(0, RESET_CMD);
> -}
> -
> -static void sector_erase(uint64_t byte_addr)
> -{
> -    unlock();
> -    flash_write(UNLOCK0_ADDR, 0x80);
> -    unlock();
> -    flash_write(byte_addr, SECTOR_ERASE_CMD);
> -}
> -
> -static void wait_for_completion(uint64_t byte_addr)
> -{
> -    /* If DQ6 is toggling, step the clock and ensure the toggle stops. *=
/
> -    if ((flash_read(byte_addr) & 0x40) ^ (flash_read(byte_addr) & 0x40))=
 {
> -        /* Wait for erase or program to finish. */
> -        clock_step_next();
> -        /* Ensure that DQ6 has stopped toggling. */
> -        g_assert_cmphex(flash_read(byte_addr), =3D=3D, flash_read(byte_a=
ddr));
> +    /* Sanity check our tests. */
> +    assert((data & ~bank_mask(c)) =3D=3D 0);
> +    uint64_t addr =3D BASE_ADDR + byte_addr;
> +    switch (c->bank_width) {
> +    case 1:
> +        qtest_writeb(c->qtest, addr, data);
> +        break;
> +    case 2:
> +        qtest_writew(c->qtest, addr, data);
> +        break;
> +    case 4:
> +        qtest_writel(c->qtest, addr, data);
> +        break;
> +    case 8:
> +        qtest_writeq(c->qtest, addr, data);
> +        break;
> +    default:
> +        abort();
>      }
>  }
>
> -static void bypass_program(uint64_t byte_addr, uint16_t data)
> +static inline uint64_t flash_read(const FlashConfig *c, uint64_t byte_ad=
dr)
>  {
> -    flash_write(UNLOCK0_ADDR, PROGRAM_CMD);
> -    flash_write(byte_addr, data);
> +    uint64_t addr =3D BASE_ADDR + byte_addr;
> +    switch (c->bank_width) {
> +    case 1:
> +        return qtest_readb(c->qtest, addr);
> +    case 2:
> +        return qtest_readw(c->qtest, addr);
> +    case 4:
> +        return qtest_readl(c->qtest, addr);
> +    case 8:
> +        return qtest_readq(c->qtest, addr);
> +    default:
> +        abort();
> +    }
> +}
> +
> +/*
> + * Convert a flash address expressed in the maximum width of the device =
as a
> + * byte address.
> + */
> +static inline uint64_t as_byte_addr(const FlashConfig *c, faddr flash_ad=
dr)
> +{
> +    /*
> +     * Command addresses are always given as addresses in the maximum
> +     * supported bus size for the flash chip. So an x8/x16 chip in x8 mo=
de
> +     * uses addresses 0xAAA and 0x555 to unlock because the least signif=
icant
> +     * bit is ignored. (0x555 rather than 0x554 is traditional.)
> +     *
> +     * In general we need to multiply by the maximum device width.
> +     */
> +    return flash_addr.addr * c->bank_width;
> +}
> +
> +/*
> + * Return the command value or expected status replicated across all dev=
ices.
> + */
> +static inline uint64_t replicate(const FlashConfig *c, uint64_t data)
> +{
> +    /* Sanity check our tests. */
> +    assert((data & ~device_mask(c)) =3D=3D 0);
> +    return data;
> +}
> +
> +static inline void flash_cmd(const FlashConfig *c, faddr cmd_addr,
> +                             uint8_t cmd)
> +{
> +    flash_write(c, as_byte_addr(c, cmd_addr), replicate(c, cmd));
> +}
> +
> +static inline uint64_t flash_query(const FlashConfig *c, faddr query_add=
r)
> +{
> +    return flash_read(c, as_byte_addr(c, query_addr));
> +}
> +
> +static inline uint64_t flash_query_1(const FlashConfig *c, faddr query_a=
ddr)
> +{
> +    return flash_query(c, query_addr) & device_mask(c);
> +}
> +
> +static void unlock(const FlashConfig *c)
> +{
> +    flash_cmd(c, UNLOCK0_ADDR, UNLOCK0_CMD);
> +    flash_cmd(c, UNLOCK1_ADDR, UNLOCK1_CMD);
> +}
> +
> +static void reset(const FlashConfig *c)
> +{
> +    flash_cmd(c, FLASH_ADDR(0), RESET_CMD);
> +}
> +
> +static void sector_erase(const FlashConfig *c, uint64_t byte_addr)
> +{
> +    unlock(c);
> +    flash_cmd(c, UNLOCK0_ADDR, 0x80);
> +    unlock(c);
> +    flash_write(c, byte_addr, replicate(c, SECTOR_ERASE_CMD));
> +}
> +
> +static void wait_for_completion(const FlashConfig *c, uint64_t byte_addr=
)
> +{
> +    /* If DQ6 is toggling, step the clock and ensure the toggle stops. *=
/
> +    const uint64_t dq6 =3D replicate(c, 0x40);
> +    if ((flash_read(c, byte_addr) & dq6) ^ (flash_read(c, byte_addr) & d=
q6)) {
> +        /* Wait for erase or program to finish. */
> +        qtest_clock_step_next(c->qtest);
> +        /* Ensure that DQ6 has stopped toggling. */
> +        g_assert_cmphex(flash_read(c, byte_addr), =3D=3D, flash_read(c, =
byte_addr));
> +    }
> +}
> +
> +static void bypass_program(const FlashConfig *c, uint64_t byte_addr,
> +                           uint16_t data)
> +{
> +    flash_cmd(c, UNLOCK0_ADDR, PROGRAM_CMD);
> +    flash_write(c, byte_addr, data);
>      /*
>       * Data isn't valid until DQ6 stops toggling. We don't model this as
>       * writes are immediate, but if this changes in the future, we can w=
ait
>       * until the program is complete.
>       */
> -    wait_for_completion(byte_addr);
> +    wait_for_completion(c, byte_addr);
>  }
>
> -static void program(uint64_t byte_addr, uint16_t data)
> +static void program(const FlashConfig *c, uint64_t byte_addr, uint16_t d=
ata)
>  {
> -    unlock();
> -    bypass_program(byte_addr, data);
> +    unlock(c);
> +    bypass_program(c, byte_addr, data);
>  }
>
> -static void chip_erase(void)
> +static void chip_erase(const FlashConfig *c)
>  {
> -    unlock();
> -    flash_write(UNLOCK0_ADDR, 0x80);
> -    unlock();
> -    flash_write(UNLOCK0_ADDR, SECTOR_ERASE_CMD);
> +    unlock(c);
> +    flash_cmd(c, UNLOCK0_ADDR, 0x80);
> +    unlock(c);
> +    flash_cmd(c, UNLOCK0_ADDR, CHIP_ERASE_CMD);
>  }
>
> -static void test_flash(void)
> +static void test_flash(const void *opaque)
>  {
> -    global_qtest =3D qtest_initf("-M musicpal,accel=3Dqtest "
> -                               "-drive if=3Dpflash,file=3D%s,format=3Dra=
w,copy-on-read",
> -                               image_path);
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
>      /* Check the IDs. */
> -    unlock();
> -    flash_write(UNLOCK0_ADDR, AUTOSELECT_CMD);
> -    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x0000), =3D=3D, 0x00BF);
> -    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x0001), =3D=3D, 0x236D);
> -    reset();
> +    unlock(c);
> +    flash_cmd(c, UNLOCK0_ADDR, AUTOSELECT_CMD);
> +    g_assert_cmphex(flash_query(c, FLASH_ADDR(0)), =3D=3D, replicate(c, =
0xBF));
> +    if (c->bank_width >=3D 2) {
> +        /*
> +         * XXX: The ID returned by the musicpal flash chip is 16 bits wh=
ich
> +         * wouldn't happen with an 8-bit device. It would probably be be=
st to
> +         * prohibit addresses larger than the device width in pflash_cfi=
02.c,
> +         * but then we couldn't test smaller device widths at all.
> +         */
> +        g_assert_cmphex(flash_query(c, FLASH_ADDR(1)), =3D=3D,
> +                        replicate(c, 0x236D));
> +    }
> +    reset(c);
>
>      /* Check the erase blocks. */
> -    flash_write(CFI_ADDR, CFI_CMD);
> -    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x10), =3D=3D, 'Q');
> -    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x11), =3D=3D, 'R');
> -    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x12), =3D=3D, 'Y');
> -    /* Num erase regions. */
> -    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x2C), >=3D, 1);
> -    uint32_t nb_sectors =3D flash_read(FLASH_WIDTH * 0x2D) +
> -                          (flash_read(FLASH_WIDTH * 0x2E) << 8) + 1;
> -    uint32_t sector_len =3D (flash_read(FLASH_WIDTH * 0x2F) << 8) +
> -                          (flash_read(FLASH_WIDTH * 0x30) << 16);
> -    reset();
> +    flash_cmd(c, CFI_ADDR, CFI_CMD);
> +    g_assert_cmphex(flash_query(c, FLASH_ADDR(0x10)), =3D=3D, replicate(=
c, 'Q'));
> +    g_assert_cmphex(flash_query(c, FLASH_ADDR(0x11)), =3D=3D, replicate(=
c, 'R'));
> +    g_assert_cmphex(flash_query(c, FLASH_ADDR(0x12)), =3D=3D, replicate(=
c, 'Y'));
>
> +    /* Num erase regions. */
> +    g_assert_cmphex(flash_query_1(c, FLASH_ADDR(0x2C)), >=3D, 1);
> +
> +    uint32_t nb_sectors =3D flash_query_1(c, FLASH_ADDR(0x2D)) +
> +                          (flash_query_1(c, FLASH_ADDR(0x2E)) << 8) + 1;
> +    uint32_t sector_len =3D (flash_query_1(c, FLASH_ADDR(0x2F)) << 8) +
> +                          (flash_query_1(c, FLASH_ADDR(0x30)) << 16);
> +    reset(c);
> +
> +    const uint64_t dq7 =3D replicate(c, 0x80);
> +    const uint64_t dq6 =3D replicate(c, 0x40);
>      /* Erase and program sector. */
>      for (uint32_t i =3D 0; i < nb_sectors; ++i) {
>          uint64_t byte_addr =3D i * sector_len;
> -        sector_erase(byte_addr);
> +        sector_erase(c, byte_addr);
>          /* Read toggle. */
> -        uint16_t status0 =3D flash_read(byte_addr);
> +        uint64_t status0 =3D flash_read(c, byte_addr);
>          /* DQ7 is 0 during an erase. */
> -        g_assert_cmphex(status0 & 0x80, =3D=3D, 0);
> -        uint16_t status1 =3D flash_read(byte_addr);
> +        g_assert_cmphex(status0 & dq7, =3D=3D, 0);
> +        uint64_t status1 =3D flash_read(c, byte_addr);
>          /* DQ6 toggles during an erase. */
> -        g_assert_cmphex(status0 & 0x40, !=3D, status1 & 0x40);
> +        g_assert_cmphex(status0 & dq6, =3D=3D, ~status1 & dq6);
>          /* Wait for erase to complete. */
> -        clock_step_next();
> +        qtest_clock_step_next(c->qtest);
>          /* Ensure DQ6 has stopped toggling. */
> -        g_assert_cmphex(flash_read(byte_addr), =3D=3D, flash_read(byte_a=
ddr));
> +        g_assert_cmphex(flash_read(c, byte_addr), =3D=3D, flash_read(c, =
byte_addr));
>          /* Now the data should be valid. */
> -        g_assert_cmphex(flash_read(byte_addr), =3D=3D, 0xFFFF);
> +        g_assert_cmphex(flash_read(c, byte_addr), =3D=3D, bank_mask(c));
>
>          /* Program a bit pattern. */
> -        program(byte_addr, 0x5555);
> -        g_assert_cmphex(flash_read(byte_addr), =3D=3D, 0x5555);
> -        program(byte_addr, 0xAA55);
> -        g_assert_cmphex(flash_read(byte_addr), =3D=3D, 0x0055);
> +        program(c, byte_addr, 0x55);
> +        g_assert_cmphex(flash_read(c, byte_addr) & 0xFF, =3D=3D, 0x55);
> +        program(c, byte_addr, 0xA5);
> +        g_assert_cmphex(flash_read(c, byte_addr) & 0xFF, =3D=3D, 0x05);
>      }
>
>      /* Erase the chip. */
> -    chip_erase();
> +    chip_erase(c);
>      /* Read toggle. */
> -    uint16_t status0 =3D flash_read(0);
> +    uint64_t status0 =3D flash_read(c, 0);
>      /* DQ7 is 0 during an erase. */
> -    g_assert_cmphex(status0 & 0x80, =3D=3D, 0);
> -    uint16_t status1 =3D flash_read(0);
> +    g_assert_cmphex(status0 & dq7, =3D=3D, 0);
> +    uint64_t status1 =3D flash_read(c, 0);
>      /* DQ6 toggles during an erase. */
> -    g_assert_cmphex(status0 & 0x40, !=3D, status1 & 0x40);
> +    g_assert_cmphex(status0 & dq6, =3D=3D, ~status1 & dq6);
>      /* Wait for erase to complete. */
> -    clock_step_next();
> +    qtest_clock_step_next(c->qtest);
>      /* Ensure DQ6 has stopped toggling. */
> -    g_assert_cmphex(flash_read(0), =3D=3D, flash_read(0));
> +    g_assert_cmphex(flash_read(c, 0), =3D=3D, flash_read(c, 0));
>      /* Now the data should be valid. */
> -    g_assert_cmphex(flash_read(0), =3D=3D, 0xFFFF);
> +
> +    for (uint32_t i =3D 0; i < nb_sectors; ++i) {
> +        uint64_t byte_addr =3D i * sector_len;
> +        g_assert_cmphex(flash_read(c, byte_addr), =3D=3D, bank_mask(c));
> +    }
>
>      /* Unlock bypass */
> -    unlock();
> -    flash_write(UNLOCK0_ADDR, UNLOCK_BYPASS_CMD);
> -    bypass_program(0, 0x0123);
> -    bypass_program(2, 0x4567);
> -    bypass_program(4, 0x89AB);
> +    unlock(c);
> +    flash_cmd(c, UNLOCK0_ADDR, UNLOCK_BYPASS_CMD);
> +    bypass_program(c, 0 * c->bank_width, 0x01);
> +    bypass_program(c, 1 * c->bank_width, 0x23);
> +    bypass_program(c, 2 * c->bank_width, 0x45);
>      /*
>       * Test that bypass programming, unlike normal programming can use a=
ny
>       * address for the PROGRAM_CMD.
>       */
> -    flash_write(6, PROGRAM_CMD);
> -    flash_write(6, 0xCDEF);
> -    wait_for_completion(6);
> -    flash_write(0, UNLOCK_BYPASS_RESET_CMD);
> -    bypass_program(8, 0x55AA); /* Should fail. */
> -    g_assert_cmphex(flash_read(0), =3D=3D, 0x0123);
> -    g_assert_cmphex(flash_read(2), =3D=3D, 0x4567);
> -    g_assert_cmphex(flash_read(4), =3D=3D, 0x89AB);
> -    g_assert_cmphex(flash_read(6), =3D=3D, 0xCDEF);
> -    g_assert_cmphex(flash_read(8), =3D=3D, 0xFFFF);
> +    flash_cmd(c, FLASH_ADDR(3 * c->bank_width), PROGRAM_CMD);
> +    flash_write(c, 3 * c->bank_width, 0x67);
> +    wait_for_completion(c, 3 * c->bank_width);
> +    flash_cmd(c, FLASH_ADDR(0), UNLOCK_BYPASS_RESET_CMD);
> +    bypass_program(c, 4 * c->bank_width, 0x89); /* Should fail. */
> +    g_assert_cmphex(flash_read(c, 0 * c->bank_width), =3D=3D, 0x01);
> +    g_assert_cmphex(flash_read(c, 1 * c->bank_width), =3D=3D, 0x23);
> +    g_assert_cmphex(flash_read(c, 2 * c->bank_width), =3D=3D, 0x45);
> +    g_assert_cmphex(flash_read(c, 3 * c->bank_width), =3D=3D, 0x67);
> +    g_assert_cmphex(flash_read(c, 4 * c->bank_width), =3D=3D, bank_mask(=
c));
>
>      /* Test ignored high order bits of address. */
> -    flash_write(FLASH_WIDTH * 0x5555, UNLOCK0_CMD);
> -    flash_write(FLASH_WIDTH * 0x2AAA, UNLOCK1_CMD);
> -    flash_write(FLASH_WIDTH * 0x5555, AUTOSELECT_CMD);
> -    g_assert_cmpint(flash_read(FLASH_WIDTH * 0x0000), =3D=3D, 0x00BF);
> -    g_assert_cmpint(flash_read(FLASH_WIDTH * 0x0001), =3D=3D, 0x236D);
> -    reset();
> +    flash_cmd(c, FLASH_ADDR(0x5555), UNLOCK0_CMD);
> +    flash_cmd(c, FLASH_ADDR(0x2AAA), UNLOCK1_CMD);
> +    flash_cmd(c, FLASH_ADDR(0x5555), AUTOSELECT_CMD);
> +    g_assert_cmphex(flash_query(c, FLASH_ADDR(0)), =3D=3D, replicate(c, =
0xBF));
> +    reset(c);
>
> -    qtest_quit(global_qtest);
> +    qtest_quit(qtest);
>  }
>
>  static void cleanup(void *opaque)
> @@ -206,6 +355,17 @@ static void cleanup(void *opaque)
>      unlink(image_path);
>  }
>
> +/*
> + * XXX: Tests are limited to bank_width =3D 2 for now because that's wha=
t
> + * hw/arm/musicpal.c has.
> + */
> +static const FlashConfig configuration[] =3D {
> +    /* One x16 device. */
> +    {
> +        .bank_width =3D 2,
> +    },
> +};
> +
>  int main(int argc, char **argv)
>  {
>      int fd =3D mkstemp(image_path);
> @@ -214,19 +374,27 @@ int main(int argc, char **argv)
>                     strerror(errno));
>          exit(EXIT_FAILURE);
>      }
> -    if (ftruncate(fd, 8 * 1024 * 1024) < 0) {
> +    if (ftruncate(fd, FLASH_SIZE) < 0) {
>          int error_code =3D errno;
>          close(fd);
>          unlink(image_path);
> -        g_printerr("Failed to truncate file %s to 8 MB: %s\n", image_pat=
h,
> -                   strerror(error_code));
> +        g_printerr("Failed to truncate file %s to %u MB: %s\n", image_pa=
th,
> +                   FLASH_SIZE, strerror(error_code));
>          exit(EXIT_FAILURE);
>      }
>      close(fd);
>
>      qtest_add_abrt_handler(cleanup, NULL);
>      g_test_init(&argc, &argv, NULL);
> -    qtest_add_func("pflash-cfi02", test_flash);
> +
> +    size_t nb_configurations =3D sizeof configuration / sizeof configura=
tion[0];
> +    for (size_t i =3D 0; i < nb_configurations; ++i) {
> +        const FlashConfig *config =3D &configuration[i];
> +        char *path =3D g_strdup_printf("pflash-cfi02/%d",
> +                                     config->bank_width);
> +        qtest_add_data_func(path, config, test_flash);
> +        g_free(path);
> +    }
>      int result =3D g_test_run();
>      cleanup(NULL);
>      return result;
> --
> 2.20.1
>
>
