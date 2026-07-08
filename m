Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642F4C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 15:36:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whUJo-0002Sb-9v; Wed, 08 Jul 2026 11:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUJm-0002RX-Bz
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:36:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUJk-0004IH-I3
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:36:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4629051c9d1so495596f8f.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 08:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524967; cv=none;
 d=google.com; s=arc-20260327;
 b=eMJEqU+z8tKGiuq2ddWE8wRd9Kfu0HiSVGXZw48crjkyz6aCWpptraJMi+GK2z99gm
 DZhWrJuaKaccA0kPWxTJHBUIrzfqWPsv7Uq/ir9ebvkYsdjl7JqfNlm171js4Q75boKe
 JBDcM5XbjnuBuZ787qkvbVUOLSNLiorrsizM5U0k2VmieQGT+qeP3wysmyGd1pDlhzR5
 tP218oysj8zc8349oqFBMFKy8epJLjPKF3EKLHfGM65tM41qvxpCaonp027WxWzTbQzq
 anvvYdn80hGYCpGcdSuQZ9Q19t9cFkmBVh/r7FzBdcXdPR43IEP+s2bmk4v0F66BYCsg
 vOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+sWvfpeF/Tu8qwPhqM4Er2p5G5pbyvD4idkjt93/NIc=;
 fh=NE2qBTOxIIVQzpZ/T243adtimnuauGoU8JjAhYrJrTw=;
 b=XU2rRVq/Q3t+RAawqL4VyjnGW/e4UhzzTWetz5pXEjRJB+6T9NGVEiuchF/lU8hhDK
 gEtU5f3E6c06IG0gXxegmQvwRgYgh72npQ+U16KUMIEj6Xjn1qf+eGcLHS2aKTJ7bZ1C
 Pfj0CFiULCF+z0jZbsKxGTr5UztDQIM/OMydZk5QKgml90qW+RW7e0mcEb12q+G91t/U
 H96s2x+NY3G0NLupMqpVyrhWcC7gaQ/SBaKOnkx9QONmh1zMuW55EJNlwuspunL+Y5j8
 7mv0LusHQEq4PGxPqKtCA/2ygFznWPdJn8ecccXC3iFwVdIztTS91cVpC04q8x7bCMRq
 74Yw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783524967; x=1784129767; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+sWvfpeF/Tu8qwPhqM4Er2p5G5pbyvD4idkjt93/NIc=;
 b=l6ulZJo8l78iX/ehxtW48muTWjtgPSm8pIfNWf2uZCFFxMQh/usJ+RqDuykmeiX3Ju
 /k4CnBczKdSN/yCyANZuaGLG0YTyrcaUaLaTymbRoJUyzeiovEnFU1ylUqfrkoB51RPM
 tyjXh00hOYr7npD1Pb0qS6PheuEaYXYWTlywJ7E/hHTx8pqwWIDDeHpzTRQj4fL05Vr1
 m43oDSaxMb0vhf4VQBPsPkJvU6vHVLhxTjIdv4fF27Q6ADYirqjKhAmb6WYgRs8Pc3aE
 HNEwp1nKmNCTUopWWIq2NdT0K1fh3IHYVHFwJe4JQG8eVLerSlEAjbwjvSy1unJMfzy8
 yDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783524967; x=1784129767;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+sWvfpeF/Tu8qwPhqM4Er2p5G5pbyvD4idkjt93/NIc=;
 b=ORRqLKa3BqSC9WFjGVJYpJT+y5L/ufahBCM4dNhCxlEgTEY5xN6Sq6gnfCL41t4HZi
 MIElRVCIUqMm9ggkRsXDxTCtkH6EW65OGmBivUZKZik3Ay335BFNFRJ8fNEONp1J4BEJ
 zaKmBHmspa+1ZgXI9ZX4f0ngEgZxyUa+s/PCuFEKo7aS2/IXRHxSFEyv0JRbyFddiusX
 3fauniCYddCZ6QQ8LUoOND4F9D9c6QizM93oWefLoZby8pwJNAxtAhcoJ6aJ521coJyF
 j9g6vsfiKx/nQ9DyMcWE3iniybndMco4gu2PWNkx3IrW2AzxXqslX27Z+7A9I/IuBkus
 PhHA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcSydBKqyo+lYOXSC6xFDASATrkpL6plvlq4Te6ph3+zkgxE2zoGR4nHScwxO6Nt83xfCxYCtr1Q==@nongnu.org
X-Gm-Message-State: AOJu0YwM8yqq8fBn9Lk/OUmjjpYqb4+hOgmIxTuQrlBCG2MdXr61+BY2
 ueGJ008OoCO0I4Wt5aT41iKWg5AANsDpyfesJJwt4yfk9Q2tXkSOqaWomq+9bWxADgg/3PsMyr1
 3JZVonmnbNpeR3OVC5ez5KOPNscP626s=
X-Gm-Gg: AfdE7ckDhG5fqlUwvhjCnI5okFdAr9H3KPmtN9HmkTgAOfiVFLVrg8lgxH5kqDTUdLs
 rtqtNE9TNLV2hxI4FJW86j8X4bh71VdBX3c3RmJCLPn42STn/cpMnm35IEoJ1LxL6hFIDf9RO5E
 IxW1l1QpubxisSSUSQvrza3b8qMy6gNFgLjl2cu3ZA9VJtxmYq3CQxaOsmQW7IO7zjKlzeqlttH
 YzEYFHFdWG3U1NlvRrDkUTMAXsMkJxoqq3PRJ/Q/fZksFBwl1P7TaJPwGR7gNeQa6bTBN/ksNgY
X-Received: by 2002:a5d:5d0e:0:b0:47b:69a5:7243 with SMTP id
 ffacd0b85a97d-47df07a1e31mr3417178f8f.12.1783524966577; Wed, 08 Jul 2026
 08:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260708111544.1440761-1-clg@redhat.com>
 <20260708111544.1440761-5-clg@redhat.com>
In-Reply-To: <20260708111544.1440761-5-clg@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Jul 2026 23:35:52 +0800
X-Gm-Features: AVVi8CfiiIDM7lYQjRVm6dWdFY2ZEn8ChGgtPQrpWVC8djrIHfkGcwEj9kN2pTM
Message-ID: <CAEUhbmVgrnm6HSy4K2zO8bYdX1k+xDEnmo=_GpvNtyb4TKr01Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/qtest: aspeed_smc: Add Quad Output Read (QOR)
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
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
> Add read_page_mem_qor (CTRL_FREADMODE with QOR command and quad data
> IO mode) and write_page_qor (user-mode QOR) tests.
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
> index fbfb94e831d8..f5720f1becc1 100644
> --- a/tests/qtest/aspeed-smc-utils.h
> +++ b/tests/qtest/aspeed-smc-utils.h
> @@ -44,6 +44,7 @@
>  #define   CTRL_FREADMODE       0x1
>  #define   CTRL_WRITEMODE       0x2
>  #define   CTRL_USERMODE        0x3
> +#define   CTRL_IO_QUAD_DATA     BIT(30)

Already defined in line 42.

>  #define   CTRL_IO_DUAL_DATA     BIT(29)
>  #define   CTRL_DUMMY_LOW_SHIFT   6
>  #define   CTRL_DUMMY_HIGH_SHIFT  14
> @@ -60,6 +61,7 @@ enum {
>      READ =3D 0x03,
>      FAST_READ =3D 0x0b,
>      DOR =3D 0x3b,
> +    QOR =3D 0x6b,
>      PP =3D 0x02,
>      WRSR =3D 0x1,
>      WREN =3D 0x6,
> @@ -99,5 +101,7 @@ void aspeed_smc_test_read_page_mem_fast_read(const voi=
d *data);
>  void aspeed_smc_test_write_page_fast_read(const void *data);
>  void aspeed_smc_test_read_page_mem_dor(const void *data);
>  void aspeed_smc_test_write_page_dor(const void *data);
> +void aspeed_smc_test_read_page_mem_qor(const void *data);
> +void aspeed_smc_test_write_page_qor(const void *data);
>
>  #endif /* TESTS_ASPEED_SMC_UTILS_H */
> diff --git a/tests/qtest/aspeed-smc-utils.c b/tests/qtest/aspeed-smc-util=
s.c
> index 25e3d28ec646..bc64a3eb9477 100644
> --- a/tests/qtest/aspeed-smc-utils.c
> +++ b/tests/qtest/aspeed-smc-utils.c
> @@ -796,3 +796,53 @@ void aspeed_smc_test_write_page_dor(const void *data=
)
>  {
>      test_write_page(data, read_page_dor);
>  }
> +
> +static void read_page_mem_qor(const AspeedSMCTestData *data,
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
> +    ctrl |=3D CTRL_FREADMODE | (QOR << 16) |
> +            (1 << CTRL_DUMMY_LOW_SHIFT) |
> +            CTRL_IO_QUAD_DATA;
> +    spi_writel(data, ctrl_reg, ctrl);

Just call spi_ctrl_set_fast_read()?

> +
> +    for (i =3D 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        page[i] =3D make_be32(flash_readl(data, addr + i * 4));
> +    }
> +}
> +
> +void aspeed_smc_test_read_page_mem_qor(const void *data)
> +{
> +    test_read_page_mem(data, read_page_mem_qor);
> +}
> +
> +static void read_page_qor(const AspeedSMCTestData *data,
> +                          uint32_t addr, uint32_t *page)
> +{
> +    int i;
> +
> +    spi_ctrl_start_user(data);
> +
> +    flash_writeb(data, 0, EN_4BYTE_ADDR);
> +    flash_writeb(data, 0, QOR);
> +    flash_writel(data, 0, make_be32(addr));
> +    /* 1 dummy byte for standard SPI QOR */
> +    flash_writeb(data, 0, 0x00);
> +
> +    for (i =3D 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        page[i] =3D make_be32(flash_readl(data, 0));
> +    }
> +    spi_ctrl_stop_user(data);
> +}
> +
> +void aspeed_smc_test_write_page_qor(const void *data)
> +{
> +    test_write_page(data, read_page_qor);
> +}
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.=
c
> index 6d48444fd71b..004951380e9e 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -76,6 +76,10 @@ static void test_palmetto_bmc(AspeedSMCTestData *data)
>                          data, aspeed_smc_test_read_page_mem_dor);
>      qtest_add_data_func("/ast2400/smc/write_page_dor",
>                          data, aspeed_smc_test_write_page_dor);
> +    qtest_add_data_func("/ast2400/smc/read_page_mem_qor",
> +                        data, aspeed_smc_test_read_page_mem_qor);
> +    qtest_add_data_func("/ast2400/smc/write_page_qor",
> +                        data, aspeed_smc_test_write_page_qor);
>      /*
>       * Block protect tests must be run last because the block protect
>       * state is not cleared by reset_memory() and silently prevents
> @@ -136,6 +140,10 @@ static void test_ast2500_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_page_mem_dor);
>      qtest_add_data_func("/ast2500/smc/write_page_dor",
>                          data, aspeed_smc_test_write_page_dor);
> +    qtest_add_data_func("/ast2500/smc/read_page_mem_qor",
> +                        data, aspeed_smc_test_read_page_mem_qor);
> +    qtest_add_data_func("/ast2500/smc/write_page_qor",
> +                        data, aspeed_smc_test_write_page_qor);
>  }
>
>  static void test_ast2600_evb(AspeedSMCTestData *data)
> @@ -187,6 +195,10 @@ static void test_ast2600_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_page_mem_dor);
>      qtest_add_data_func("/ast2600/smc/write_page_dor",
>                          data, aspeed_smc_test_write_page_dor);
> +    qtest_add_data_func("/ast2600/smc/read_page_mem_qor",
> +                        data, aspeed_smc_test_read_page_mem_qor);
> +    qtest_add_data_func("/ast2600/smc/write_page_qor",
> +                        data, aspeed_smc_test_write_page_qor);
>  }
>
>  static void test_ast1030_evb(AspeedSMCTestData *data)
> @@ -238,6 +250,10 @@ static void test_ast1030_evb(AspeedSMCTestData *data=
)
>                          data, aspeed_smc_test_read_page_mem_dor);
>      qtest_add_data_func("/ast1030/smc/write_page_dor",
>                          data, aspeed_smc_test_write_page_dor);
> +    qtest_add_data_func("/ast1030/smc/read_page_mem_qor",
> +                        data, aspeed_smc_test_read_page_mem_qor);
> +    qtest_add_data_func("/ast1030/smc/write_page_qor",
> +                        data, aspeed_smc_test_write_page_qor);
>  }
>
>  int main(int argc, char **argv)
> diff --git a/tests/qtest/ast2700-smc-test.c b/tests/qtest/ast2700-smc-tes=
t.c
> index bd9d3f7905b3..f85077e04ff4 100644
> --- a/tests/qtest/ast2700-smc-test.c
> +++ b/tests/qtest/ast2700-smc-test.c
> @@ -60,6 +60,10 @@ static void test_ast2700_evb(AspeedSMCTestData *data)
>                          data, aspeed_smc_test_read_page_mem_dor);
>      qtest_add_data_func("/ast2700/smc/write_page_dor",
>                          data, aspeed_smc_test_write_page_dor);
> +    qtest_add_data_func("/ast2700/smc/read_page_mem_qor",
> +                        data, aspeed_smc_test_read_page_mem_qor);
> +    qtest_add_data_func("/ast2700/smc/write_page_qor",
> +                        data, aspeed_smc_test_write_page_qor);
>  }
>
>  int main(int argc, char **argv)
> --

Regards,
Bin

