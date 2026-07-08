Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D2AC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 15:29:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whUDD-00016Y-NI; Wed, 08 Jul 2026 11:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUDB-00015u-TR
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:29:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUD8-0001Yu-GH
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:29:21 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47d70879764so613433f8f.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 08:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524556; cv=none;
 d=google.com; s=arc-20260327;
 b=KVv2OASFYRXJ04pbN00Wz2CpEanLA0BaaJrl+qRimbJv7gkawYnDTtfTNgutGaXygq
 6RSe9SKxuRjvKngHyuJANmvkBgGXgsdpm4YQe9KfesdCHAIMUPcCoHKB5zjGv9n8iZBt
 pRyqtYQOuNMR1/D9lFkqjm512WvfFUmVJVhrKYexcpTuA+1dac5Fy7aazuq2d4g2JMFa
 Hbfo50fSNaozgvEHpdXNTXtiyg+RMkbi05Iv3c4TjxM7FiqohTHY7JoZWwgE0SrlMzNL
 5WTTaJ/STxRCy9cF3saevcCJSWy61BIPpOHySeBROcnZNc2ZIrvQkiryidQwBiHfsyV+
 vN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HoMQvPMP4ny+19fgg1l8RqVDO/Mokzld/gdT8zr+FvU=;
 fh=6Kuyu8SuMJsywhash19QU50VvXDtL5cbqn/7mXHASlM=;
 b=jqAwVsDDnd+apzSA7TM6SJH6xMXIO/GiGBjIlBME6JAygKo/amImTCTLSAFS5kxryR
 0KQmAJHF6npFmizDV5MXnip94b3GIARcE4rRlNpr4IJROIOfcAHmzgRa7BDoEqpd5YAo
 endyXtAZZZMppy94eCtXDe4R0UF6MVzJZxl4NEWOxQvUawZ+zzECy3nMWpsLfpSAO9gg
 fdoYwHL1qGOR0gAZtWfTqd8qxqW0NUWl1waM8JuONOSUwn5R/+pJKxSp48pA98LcF5mG
 Qk23+zeP8vSJZ1uJ6Wnb/H5smOoCCx+S0x7v13Bhk6E1fRPAYXUxZ3Y3aPptcFm4f3Gv
 aDKg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783524556; x=1784129356; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HoMQvPMP4ny+19fgg1l8RqVDO/Mokzld/gdT8zr+FvU=;
 b=LSdQqt49hzHgwmgRWcSyWnh4uKOe6Zx0pFRFhbI18paaoInAGYNbTEs+/YTYlocryt
 xW6P/fYzRbWao+fGzjol9Pjy6nvtxbCMBim9h5z4ejEcixFRKfn5XkGYtXmnHxxRXlUf
 VEZ+Yeze/f7LH0XGm/ICQA7rL8BziTfOKmytNI/MwSxuWk8zjDhoAjsp+28fokFJ/Iwc
 Yrm74GP6QIJ/jJmfCJi85I9Z9Eis0XANF1ktsLvtUJH3rS3xtkSMksc+JqvQY7GdjlXA
 z9WoZT0JsvYijjhS+ivtrJdQiuPs5xAWUisRa96ospnnCtfpM2jQdGgKE9p3aFfrsxmG
 vZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783524556; x=1784129356;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HoMQvPMP4ny+19fgg1l8RqVDO/Mokzld/gdT8zr+FvU=;
 b=DO2scrVcOBTeHROggBpRxsiz5YuyWq7uGDSsD9tCubYEoyvC6hL1/P80oM5XqxqQtd
 hKuXRG5VRqzen47a4edUMtA+byhst9lhgARWnJjMrydFmgfgIBPdx1m4HtH9lBJV0QYt
 nJZCc51vkhOGSSkLQhvcjUqFOQfcLZN6OUZUKsSN1qnno+xalVkedoCKwhvWfLpiN3sh
 NCrBMAeh/yEE03aUq0K8PGnbsGADT/XbKCBhsDZJbyxu9a0qUFRj+fY9jxlurU9bbNad
 dbDVYHMfw8pt2Goii25w6g5B3vjjFWgpmuoVn3FzsawLhcPcnwfMOwLP25YZY9WWXnA8
 MTTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpeOT2KNgmB7YOgYEXGj1mSvZyG3tyD8QyMlQpUwwtrkQUyJ74RwP9Z5zdN99AbnuKMilwcA5yk/g==@nongnu.org
X-Gm-Message-State: AOJu0YyM3Gu+HeMsCt9wFBTKs7BwnAtqLAOotN8YQPgOnGFQXeh5J9iq
 GVpfoaohRng8ErmlhC5Uhw5kd44u3+HSOhKYsUCa5H/vPob5/h7H2q3zAQKa05BLEZGRdLDk/vv
 1vk/LBz53VUG7MUv4AR0Q26F93Lf48zk=
X-Gm-Gg: AfdE7cmnCd3vt14zDAePJKgEYPQelyj5zBU66KTVgNEKSqpg26vV2CqxeNqihONq7am
 TO6xV4V9BdtZaepx8rBk2KAUHD1Zemgc5Fj/W0qMI8gOUsiGwvQ/Mzl3mf9xnxYziKHDMNuoiX0
 tKQYBjolvKCINXinaZneSlsVmmo7IFS3cWhm8l1S29/Y9KK3TCmufeYfnxLGOI81YE5ddJVBgKX
 yYmeWbwNwJm4fE0A52FO3HDixeLq0qUJyzmm2ChPVaMdQ1Zyzg9jBikh3SB24QfjZbchifd0tky
 CSaka9uuVw==
X-Received: by 2002:a05:6000:2911:b0:46f:9d18:bd3c with SMTP id
 ffacd0b85a97d-47df07a959bmr3655604f8f.12.1783524555660; Wed, 08 Jul 2026
 08:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260708111544.1440761-1-clg@redhat.com>
 <20260708111544.1440761-3-clg@redhat.com>
In-Reply-To: <20260708111544.1440761-3-clg@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Jul 2026 23:29:03 +0800
X-Gm-Features: AVVi8CeikI2FNQGUnCpq9U1LObkJgLcF5AXhFw6GOcBvGK0qomZmNccpaDR6djQ
Message-ID: <CAEUhbmWWmX9BKwS2m12vPk=rN_DxzCKqsm=h9g26QdHcX3gHqw@mail.gmail.com>
Subject: Re: [PATCH 2/4] tests/qtest: aspeed_smc: Add fast-read test coverage
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@processmission.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jul 8, 2026 at 7:17=E2=80=AFPM C=C3=A9dric Le Goater <clg@redhat.co=
m> wrote:
>
> Add read_page_mem_fast_read (CTRL_FREADMODE with dummy byte) and
> write_page_fast_read (user-mode FAST_READ) tests.
>
> Signed-off-by: Cedric Le Goater <clg@redhat.com>
> ---
>  tests/qtest/aspeed-smc-utils.h |  5 ++++
>  tests/qtest/aspeed-smc-utils.c | 49 ++++++++++++++++++++++++++++++++++
>  tests/qtest/aspeed_smc-test.c  | 21 +++++++++++++++
>  tests/qtest/ast2700-smc-test.c |  4 +++
>  4 files changed, 79 insertions(+)
>
> diff --git a/tests/qtest/aspeed-smc-utils.h b/tests/qtest/aspeed-smc-util=
s.h
> index e2fd8ff1bd16..5a86514caf35 100644
> --- a/tests/qtest/aspeed-smc-utils.h
> +++ b/tests/qtest/aspeed-smc-utils.h
> @@ -44,6 +44,8 @@
>  #define   CTRL_FREADMODE       0x1
>  #define   CTRL_WRITEMODE       0x2
>  #define   CTRL_USERMODE        0x3
> +#define   CTRL_DUMMY_LOW_SHIFT   6
> +#define   CTRL_DUMMY_HIGH_SHIFT  14
>  #define SR_WEL BIT(1)
>
>  /*
> @@ -55,6 +57,7 @@ enum {
>      WRDI =3D 0x4,
>      BULK_ERASE =3D 0xc7,
>      READ =3D 0x03,
> +    FAST_READ =3D 0x0b,
>      PP =3D 0x02,
>      WRSR =3D 0x1,
>      WREN =3D 0x6,
> @@ -90,5 +93,7 @@ void aspeed_smc_test_status_reg_write_protection(const =
void *data);
>  void aspeed_smc_test_write_block_protect(const void *data);
>  void aspeed_smc_test_write_block_protect_bottom_bit(const void *data);
>  void aspeed_smc_test_write_page_qpi(const void *data);
> +void aspeed_smc_test_read_page_mem_fast_read(const void *data);
> +void aspeed_smc_test_write_page_fast_read(const void *data);
>
>  #endif /* TESTS_ASPEED_SMC_UTILS_H */
> diff --git a/tests/qtest/aspeed-smc-utils.c b/tests/qtest/aspeed-smc-util=
s.c
> index ed125741eb36..9883ade0815c 100644
> --- a/tests/qtest/aspeed-smc-utils.c
> +++ b/tests/qtest/aspeed-smc-utils.c
> @@ -697,3 +697,52 @@ void aspeed_smc_test_write_page_qpi(const void *data=
)
>      flash_reset(test_data);
>  }
>
> +static void read_page_mem_fast_read(const AspeedSMCTestData *data,
> +                                uint32_t addr, uint32_t *page)
> +{
> +    uint32_t ctrl_reg =3D R_CTRL0 + data->cs * 4;
> +    uint32_t ctrl =3D spi_readl(data, ctrl_reg);
> +    int i;
> +
> +    /* Set FREADMODE with FAST_READ command and 1 dummy byte */
> +    ctrl &=3D ~(CTRL_USERMODE | (0xff << 16) |
> +              (0x3 << CTRL_DUMMY_LOW_SHIFT) |
> +              (0x1 << CTRL_DUMMY_HIGH_SHIFT) |
> +              CTRL_IO_MODE_MASK);
> +    ctrl |=3D CTRL_FREADMODE | (FAST_READ << 16) |
> +            (1 << CTRL_DUMMY_LOW_SHIFT);
> +    spi_writel(data, ctrl_reg, ctrl);

Could just call spi_ctrl_set_fast_read()?

> +
> +    for (i =3D 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        page[i] =3D make_be32(flash_readl(data, addr + i * 4));
> +    }
> +}
> +
> +void aspeed_smc_test_read_page_mem_fast_read(const void *data)
> +{
> +    test_read_page_mem(data, read_page_mem_fast_read);
> +}
> +
> +static void read_page_fast_read(const AspeedSMCTestData *data,
> +                                uint32_t addr, uint32_t *page)
> +{
> +    int i;
> +
> +    spi_ctrl_start_user(data);
> +
> +    flash_writeb(data, 0, EN_4BYTE_ADDR);
> +    flash_writeb(data, 0, FAST_READ);
> +    flash_writel(data, 0, make_be32(addr));
> +    /* 1 dummy byte for standard SPI fast-read */
> +    flash_writeb(data, 0, 0x00);
> +
> +    for (i =3D 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        page[i] =3D make_be32(flash_readl(data, 0));
> +    }
> +    spi_ctrl_stop_user(data);
> +}
> +
> +void aspeed_smc_test_write_page_fast_read(const void *data)
> +{
> +    test_write_page(data, read_page_fast_read);
> +}
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.=
c
> index 39af1df0ed75..bbda15ad17ea 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -68,6 +68,15 @@ static void test_palmetto_bmc(AspeedSMCTestData *data)
>                          data, aspeed_smc_test_read_status_reg);
>      qtest_add_data_func("/ast2400/smc/status_reg_write_protection",
>                          data, aspeed_smc_test_status_reg_write_protectio=
n);
> +    qtest_add_data_func("/ast2400/smc/read_page_mem_fast_read",
> +                        data, aspeed_smc_test_read_page_mem_fast_read);
> +    qtest_add_data_func("/ast2400/smc/write_page_fast_read",
> +                        data, aspeed_smc_test_write_page_fast_read);
> +    /*
> +     * Block protect tests must be run last because the block protect
> +     * state is not cleared by reset_memory() and silently prevents
> +     * subsequent flash writes.
> +     */
>      qtest_add_data_func("/ast2400/smc/write_block_protect",
>                          data, aspeed_smc_test_write_block_protect);
>      qtest_add_data_func("/ast2400/smc/write_block_protect_bottom_bit",
> @@ -115,6 +124,10 @@ static void test_ast2500_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_status_reg);
>      qtest_add_data_func("/ast2500/smc/write_page_qpi",
>                          data, aspeed_smc_test_write_page_qpi);
> +    qtest_add_data_func("/ast2500/smc/read_page_mem_fast_read",
> +                        data, aspeed_smc_test_read_page_mem_fast_read);
> +    qtest_add_data_func("/ast2500/smc/write_page_fast_read",
> +                        data, aspeed_smc_test_write_page_fast_read);
>  }
>
>  static void test_ast2600_evb(AspeedSMCTestData *data)
> @@ -158,6 +171,10 @@ static void test_ast2600_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_status_reg);
>      qtest_add_data_func("/ast2600/smc/write_page_qpi",
>                          data, aspeed_smc_test_write_page_qpi);
> +    qtest_add_data_func("/ast2600/smc/read_page_mem_fast_read",
> +                        data, aspeed_smc_test_read_page_mem_fast_read);
> +    qtest_add_data_func("/ast2600/smc/write_page_fast_read",
> +                        data, aspeed_smc_test_write_page_fast_read);
>  }
>
>  static void test_ast1030_evb(AspeedSMCTestData *data)
> @@ -201,6 +218,10 @@ static void test_ast1030_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_status_reg);
>      qtest_add_data_func("/ast1030/smc/write_page_qpi",
>                          data, aspeed_smc_test_write_page_qpi);
> +    qtest_add_data_func("/ast1030/smc/read_page_mem_fast_read",
> +                        data, aspeed_smc_test_read_page_mem_fast_read);
> +    qtest_add_data_func("/ast1030/smc/write_page_fast_read",
> +                        data, aspeed_smc_test_write_page_fast_read);
>  }
>
>  int main(int argc, char **argv)
> diff --git a/tests/qtest/ast2700-smc-test.c b/tests/qtest/ast2700-smc-tes=
t.c
> index 33fc47230ee5..9ad04b574c0d 100644
> --- a/tests/qtest/ast2700-smc-test.c
> +++ b/tests/qtest/ast2700-smc-test.c
> @@ -52,6 +52,10 @@ static void test_ast2700_evb(AspeedSMCTestData *data)
>                          data, aspeed_smc_test_read_status_reg);
>      qtest_add_data_func("/ast2700/smc/write_page_qpi",
>                          data, aspeed_smc_test_write_page_qpi);
> +    qtest_add_data_func("/ast2700/smc/read_page_mem_fast_read",
> +                        data, aspeed_smc_test_read_page_mem_fast_read);
> +    qtest_add_data_func("/ast2700/smc/write_page_fast_read",
> +                        data, aspeed_smc_test_write_page_fast_read);
>  }
>
>  int main(int argc, char **argv)

Regards,
Bin

