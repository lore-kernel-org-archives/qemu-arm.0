Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA5FC43602
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 15:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whUGq-0001rV-An; Wed, 08 Jul 2026 11:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUGn-0001qm-Uc
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:33:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUGm-0003BW-51
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:33:05 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so22618435e9.0
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 08:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524782; cv=none;
 d=google.com; s=arc-20260327;
 b=Tpt6XXXtaiu1bV/fcGyY+wrNdti8XlwUZw0LetHS88LUkFog69ke4f3Q9gCF7+O5ih
 IgLtoOymeSykEJXlzq95xZrRGPEeP5gVolwqFflBn/9VgGZ0JP+rkYL8ouy3fTfebWG5
 H9pXKxRgS+2Xrw/oPy0S0JpafQWLDKoXqpRfZl0PTgyzaE9q75757jOma3m7F1H0ayzh
 T8JtccMjLVjk2gdIauntd+lxYBtsr4tuIXWCyojPTFlLOxoe2XfwvzLORIYYCiKfX+EM
 U/hEeDcmsCPwaDGcbaSn3L+p8OKwODn4uPOp9SYYqv4KPiTDLSJXVyieBJVl2g8OAIGf
 pflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KeQZbn0X0CZ9xShCLOKdXeQ4rBY+DrWW9kZGVFdK8cA=;
 fh=duu0A2gRMnJVbwQo/RMeafFfv29lSqDq93nL6lp0YJY=;
 b=edaR5XUjVR139G2Uf4pjpSWIBOm8lab4wBnYgRLfryH3YOB1WBhVjk4DQD8zHu85dB
 9YJa9CydmmobMNZi8Xw0MvFXYLK3xtueoY5D/EuSCAhMyAWgZEGIU8ub6eFmW9TEQ+H2
 4bNCWgs1gOvygxkWjbVOsTPKth7/sRMxt1R/g7Gd/aHE52939dvHpGTeYUYj/okHqEcw
 4mrGgLlEwMExXkuUl0lNg7gY41qBsFPOErTp5BXxc9uUjJ3+gQP3Q+Se35FXmfciR6bP
 mbcYMqWGbAiv+3mPvUzQ59QQITRNkzI1xEloQSZu09GNOwMo8ar3qAEUC2FFWShdKIn1
 GYtQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783524782; x=1784129582; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KeQZbn0X0CZ9xShCLOKdXeQ4rBY+DrWW9kZGVFdK8cA=;
 b=WqnyNfOWtUIQEtukFEVo2KAV0XgkEFdWfpnj7YuwFqMUsLD13tJW3Ky9sj7vKot1E0
 BSEAA0kHJssrNM/rglI46p09uCuEa6OlQHMfOSGGqPF5b2V6OdxVGzfN37ip9ynCwIoJ
 tuOQ3ozLvTpc45fFIFXRbiX/5z/UYbmgtdEcOM3uu9m6+x4tHdQUV/77Q+hMogf0b8ry
 IpiUOJw2sQV7s2rwUXruYWqdIZGJE1rv6KNP/g6zYECaFCPLjUSQdDyyHkyV3uVdJfeG
 7syUVWRfwMkaLuz+ErjXpOPWFkVVXJU5yb47xEL9bj9YPzG/Ox7JnafSCNeN4Tz8kuwO
 rrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783524782; x=1784129582;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KeQZbn0X0CZ9xShCLOKdXeQ4rBY+DrWW9kZGVFdK8cA=;
 b=CXdvXSta/FOKpqSVngkkOPUqBySBF5PQ+l7ANFExcfDsk+8dNwtvAyqWFeBt7FvDOM
 TeT1JTnVr61tAKc6bnVurgfN0T0MoSSwT6tLB+DW5oAcu2ta2x5pm73EsBq/dYOmzzLS
 nV2gJthBm3LhbBgPZcSjV0JO5br5iABEPchom+qkvGFknPgiNu6hA43D1b5u523RLRco
 oXJ25OrjuhQpchHcZ1QSb8V3vv/njs+d2DdpNGV5jArZ8g6G3S/pE/fmrSG70NFxtF4N
 ItGYFhIoDZ8ieJlcTfNHYb3OGMOz9MkZjKkeol6dLrdsRcQa31+0m0ZgNrEvFGZCX2Cq
 OLYA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpbDAhNBmk5rLkXBginxptTREPyWWQfC4ha+wJ5hEBtU+5uPjbACksym+XYeuv9bvwMbo/FadSzdg==@nongnu.org
X-Gm-Message-State: AOJu0YwovBG9cngXBeYNwM1gQg5PI+KYkcPwD+xkw1mzaQ32NdA0iJW4
 s/jWl48V161H6S+pyBBnAS+wMkFUzL3ANKSYdRvM052hQeEDUWLxEgnQPYEhT+qthWgjxAqPqxF
 eulB2dsvun362nOnVClQ0rN4VAwsgcqg=
X-Gm-Gg: AfdE7cnMo2X/p9/90LPQTVYg/KeYEoy6VLIueoWBGUTTtwvnJ7ea/AWwLXoLgpdiGor
 5yN409L9TQHyhKqKpc3FvLq8n6vZl/17tKJnw85iJUo1J9cKZl47Qe7vKeH8HOmHbJM3AJOi5TW
 nh4/myPt4UJwcKax0x+SXEOBT1kRrrP1ISGWtgd65HDEivpw1P30wJFGKe5hWU7p0ZKeYfSQt+f
 APF6zBL8qdVF5Hj8K25WNkF09A0u96rROngMD6pgoNbQ9//pivJuWsJhDbNBPeWWZpGT6QBZ0fc
X-Received: by 2002:a05:600c:6208:b0:493:e542:ffd5 with SMTP id
 5b1f17b1804b1-493e63706b2mr31156525e9.5.1783524782228; Wed, 08 Jul 2026
 08:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260708111544.1440761-1-clg@redhat.com>
 <20260708111544.1440761-4-clg@redhat.com>
In-Reply-To: <20260708111544.1440761-4-clg@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Jul 2026 23:32:49 +0800
X-Gm-Features: AVVi8CfVN7kAN5i60RG52c3IYmmGyad6SNr2mBp3gLiMbfQOIt58l1v9JR4992s
Message-ID: <CAEUhbmV0Q2xpwVLUxv9NEDbb8pMgnjdChupPngtPvCuFFedv7A@mail.gmail.com>
Subject: Re: [PATCH 3/4] tests/qtest: aspeed_smc: Add Dual Output Read (DOR)
 test coverage
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
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Add read_page_mem_dor (CTRL_FREADMODE with DOR command and dual data
> IO mode) and write_page_dor (user-mode DOR) tests.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  tests/qtest/aspeed-smc-utils.h |  4 +++
>  tests/qtest/aspeed-smc-utils.c | 50 ++++++++++++++++++++++++++++++++++
>  tests/qtest/aspeed_smc-test.c  | 16 +++++++++++
>  tests/qtest/ast2700-smc-test.c |  4 +++
>  4 files changed, 74 insertions(+)
>
> diff --git a/tests/qtest/aspeed-smc-utils.h b/tests/qtest/aspeed-smc-util=
s.h
> index 5a86514caf35..fbfb94e831d8 100644
> --- a/tests/qtest/aspeed-smc-utils.h
> +++ b/tests/qtest/aspeed-smc-utils.h
> @@ -44,6 +44,7 @@
>  #define   CTRL_FREADMODE       0x1
>  #define   CTRL_WRITEMODE       0x2
>  #define   CTRL_USERMODE        0x3
> +#define   CTRL_IO_DUAL_DATA     BIT(29)

This macro is already defined in aspeed-smc-utils.h:43

>  #define   CTRL_DUMMY_LOW_SHIFT   6
>  #define   CTRL_DUMMY_HIGH_SHIFT  14
>  #define SR_WEL BIT(1)
> @@ -58,6 +59,7 @@ enum {
>      BULK_ERASE =3D 0xc7,
>      READ =3D 0x03,
>      FAST_READ =3D 0x0b,
> +    DOR =3D 0x3b,
>      PP =3D 0x02,
>      WRSR =3D 0x1,
>      WREN =3D 0x6,
> @@ -95,5 +97,7 @@ void aspeed_smc_test_write_block_protect_bottom_bit(con=
st void *data);
>  void aspeed_smc_test_write_page_qpi(const void *data);
>  void aspeed_smc_test_read_page_mem_fast_read(const void *data);
>  void aspeed_smc_test_write_page_fast_read(const void *data);
> +void aspeed_smc_test_read_page_mem_dor(const void *data);
> +void aspeed_smc_test_write_page_dor(const void *data);
>
>  #endif /* TESTS_ASPEED_SMC_UTILS_H */
> diff --git a/tests/qtest/aspeed-smc-utils.c b/tests/qtest/aspeed-smc-util=
s.c
> index 9883ade0815c..25e3d28ec646 100644
> --- a/tests/qtest/aspeed-smc-utils.c
> +++ b/tests/qtest/aspeed-smc-utils.c
> @@ -746,3 +746,53 @@ void aspeed_smc_test_write_page_fast_read(const void=
 *data)
>  {
>      test_write_page(data, read_page_fast_read);
>  }
> +
> +static void read_page_mem_dor(const AspeedSMCTestData *data,
> +                              uint32_t addr, uint32_t *page)
> +{
> +    uint32_t ctrl_reg =3D R_CTRL0 + data->cs * 4;
> +    uint32_t ctrl =3D spi_readl(data, ctrl_reg);
> +    int i;
> +
> +    ctrl &=3D ~(CTRL_USERMODE | (0xff << 16) |
> +              (0x3 << CTRL_DUMMY_LOW_SHIFT) |
> +              (0x1 << CTRL_DUMMY_HIGH_SHIFT) |
> +              CTRL_IO_MODE_MASK);
> +    ctrl |=3D CTRL_FREADMODE | (DOR << 16) |
> +            (1 << CTRL_DUMMY_LOW_SHIFT) |
> +            CTRL_IO_DUAL_DATA;
> +    spi_writel(data, ctrl_reg, ctrl);
> +
> +    for (i =3D 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        page[i] =3D make_be32(flash_readl(data, addr + i * 4));
> +    }
> +}
> +
> +void aspeed_smc_test_read_page_mem_dor(const void *data)
> +{
> +    test_read_page_mem(data, read_page_mem_dor);
> +}
> +
> +static void read_page_dor(const AspeedSMCTestData *data,
> +                          uint32_t addr, uint32_t *page)
> +{
> +    int i;
> +
> +    spi_ctrl_start_user(data);
> +
> +    flash_writeb(data, 0, EN_4BYTE_ADDR);
> +    flash_writeb(data, 0, DOR);
> +    flash_writel(data, 0, make_be32(addr));
> +    /* 1 dummy byte for standard SPI DOR */
> +    flash_writeb(data, 0, 0x00);
> +
> +    for (i =3D 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        page[i] =3D make_be32(flash_readl(data, 0));
> +    }
> +    spi_ctrl_stop_user(data);
> +}
> +
> +void aspeed_smc_test_write_page_dor(const void *data)
> +{
> +    test_write_page(data, read_page_dor);
> +}
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.=
c
> index bbda15ad17ea..6d48444fd71b 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -72,6 +72,10 @@ static void test_palmetto_bmc(AspeedSMCTestData *data)
>                          data, aspeed_smc_test_read_page_mem_fast_read);
>      qtest_add_data_func("/ast2400/smc/write_page_fast_read",
>                          data, aspeed_smc_test_write_page_fast_read);
> +    qtest_add_data_func("/ast2400/smc/read_page_mem_dor",
> +                        data, aspeed_smc_test_read_page_mem_dor);
> +    qtest_add_data_func("/ast2400/smc/write_page_dor",
> +                        data, aspeed_smc_test_write_page_dor);
>      /*
>       * Block protect tests must be run last because the block protect
>       * state is not cleared by reset_memory() and silently prevents
> @@ -128,6 +132,10 @@ static void test_ast2500_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_page_mem_fast_read);
>      qtest_add_data_func("/ast2500/smc/write_page_fast_read",
>                          data, aspeed_smc_test_write_page_fast_read);
> +    qtest_add_data_func("/ast2500/smc/read_page_mem_dor",
> +                        data, aspeed_smc_test_read_page_mem_dor);
> +    qtest_add_data_func("/ast2500/smc/write_page_dor",
> +                        data, aspeed_smc_test_write_page_dor);
>  }
>
>  static void test_ast2600_evb(AspeedSMCTestData *data)
> @@ -175,6 +183,10 @@ static void test_ast2600_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_page_mem_fast_read);
>      qtest_add_data_func("/ast2600/smc/write_page_fast_read",
>                          data, aspeed_smc_test_write_page_fast_read);
> +    qtest_add_data_func("/ast2600/smc/read_page_mem_dor",
> +                        data, aspeed_smc_test_read_page_mem_dor);
> +    qtest_add_data_func("/ast2600/smc/write_page_dor",
> +                        data, aspeed_smc_test_write_page_dor);
>  }
>
>  static void test_ast1030_evb(AspeedSMCTestData *data)
> @@ -222,6 +234,10 @@ static void test_ast1030_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_page_mem_fast_read);
>      qtest_add_data_func("/ast1030/smc/write_page_fast_read",
>                          data, aspeed_smc_test_write_page_fast_read);
> +    qtest_add_data_func("/ast1030/smc/read_page_mem_dor",
> +                        data, aspeed_smc_test_read_page_mem_dor);
> +    qtest_add_data_func("/ast1030/smc/write_page_dor",
> +                        data, aspeed_smc_test_write_page_dor);
>  }
>
>  int main(int argc, char **argv)
> diff --git a/tests/qtest/ast2700-smc-test.c b/tests/qtest/ast2700-smc-tes=
t.c
> index 9ad04b574c0d..bd9d3f7905b3 100644
> --- a/tests/qtest/ast2700-smc-test.c
> +++ b/tests/qtest/ast2700-smc-test.c
> @@ -56,6 +56,10 @@ static void test_ast2700_evb(AspeedSMCTestData *data)
>                          data, aspeed_smc_test_read_page_mem_fast_read);
>      qtest_add_data_func("/ast2700/smc/write_page_fast_read",
>                          data, aspeed_smc_test_write_page_fast_read);
> +    qtest_add_data_func("/ast2700/smc/read_page_mem_dor",
> +                        data, aspeed_smc_test_read_page_mem_dor);
> +    qtest_add_data_func("/ast2700/smc/write_page_dor",
> +                        data, aspeed_smc_test_write_page_dor);
>  }
>
>  int main(int argc, char **argv)
> --

Otherwise,
Reviewed-by: Bin Meng <bin.meng@processmission.com>

