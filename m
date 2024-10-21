Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2346582njb;
        Mon, 21 Oct 2024 05:54:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/XUfOdP1qGiTfJOL8KRztMAZSAKHlsMvYLyJUhClURSZVQhki49s0vF9j+O+00gn910R74ncPCl1TAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHGuolbZ09RidUs0a3cEvHiGE4fwc9m1069EQb9s/TGmXbr8z4arSY1azEdWq2mRsmayKRL
X-Received: by 2002:a05:6214:5988:b0:6cc:2305:a4c3 with SMTP id 6a1803df08f44-6cde15ec4edmr208231556d6.39.1729515240011;
        Mon, 21 Oct 2024 05:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729515239; cv=none;
        d=google.com; s=arc-20240605;
        b=HUGpm/QqhVh0OKupvWbT1W20YRzrzDsdz5W61W5r5dm6DwTpk2DyPM0gh5ySgaTImY
         3lxK9WnJK6aJFSJswoMHq93WVto1LuwMXUEAftJSKt2tF4UF12V3YVg+N+JIOCIflj6B
         GugbiZK75GTAowa7/cw+aquY6zvZcwtUJG432TTLku4KoDT1ZDNS8MEGRH0ByCZdJku7
         GDTN+MllRJ3ZWMwRFlE5skAuJeiZSrnceUOkNRbYQwDx40WIzqikeuGntec3awooq6E0
         ZWSNQ0SmZ054Q3P8Pys/vh9iyzPJa7gbrCl3eCRddOLboCf5NRIWAVqSCrgCu0K6Mekl
         ww/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=aKiy4cAmjZSloaq0iJ6M2NpqzmV0wUXQKSprzdYfm9w=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=hb0l09KV+1ACgc5quaqVz5jD4j9HaulYgOKHOB28RibRm67bvkRM3dD6ewn6O4QtK1
         2oxzJ4KB5vTlnZWrIPNVOzrlB9JUSJeKB4pRE74CPSJm9jJVP9t47NzAMuP89QkCYZia
         RTCFp19mCznYaoFOmtD/U5iCBiKaby28q+viCW3UUtsQQw99lAE5BJyvoaRDKHW3wBUY
         leKIPU70F9eDtDIGdf1hJGf01oq2cJy7uS7Mj0lX8MeXzafxEar3NxDXMrwfok4lZHQ3
         JLOL/3t+kOP5YFhTcWk58woroRJow3E9nSeKOLQLBDnTrSKzinwjiM6rqlJXXmvcB9BT
         0CVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce008f3f7esi37830016d6.137.2024.10.21.05.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 05:53:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2rui-0002VQ-Ce; Mon, 21 Oct 2024 08:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2rug-0002Ux-O4; Mon, 21 Oct 2024 08:53:34 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2rue-0004hH-BS; Mon, 21 Oct 2024 08:53:34 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XXFbp0Lh1z4wyh;
 Mon, 21 Oct 2024 23:53:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXFbh2tf8z4wc1;
 Mon, 21 Oct 2024 23:53:20 +1100 (AEDT)
Message-ID: <3eef9cfe-acbc-44bb-a0fb-a49575c80b61@kaod.org>
Date: Mon, 21 Oct 2024 14:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 15/16] test/qtest/aspeed_smc-test: Support write
 page command with QPI mode
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
 <20241018053112.1886173-16-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018053112.1886173-16-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.171, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /fz1lnahxteZ

On 10/18/24 07:31, Jamin Lin wrote:
> Add a new testcase for write page command with QPI mode testing.
> Currently, only run this testcase for AST2500, AST2600 and AST1030.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/qtest/aspeed_smc-test.c | 74 +++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index c5c38e23c5..59f3876cdc 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -36,6 +36,7 @@
>   #define R_CE_CTRL           0x04
>   #define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
>   #define R_CTRL0             0x10
> +#define   CTRL_IO_QUAD_IO      BIT(31)
>   #define   CTRL_CE_STOP_ACTIVE  BIT(2)
>   #define   CTRL_READMODE        0x0
>   #define   CTRL_FREADMODE       0x1
> @@ -62,6 +63,7 @@ enum {
>       ERASE_SECTOR = 0xd8,
>   };
>   
> +#define CTRL_IO_MODE_MASK  (BIT(31) | BIT(30) | BIT(29) | BIT(28))
>   #define FLASH_PAGE_SIZE           256
>   
>   typedef struct TestData {
> @@ -171,6 +173,18 @@ static void spi_ctrl_stop_user(const TestData *data)
>       spi_writel(data, ctrl_reg, ctrl);
>   }
>   
> +static void spi_ctrl_set_io_mode(const TestData *data, uint32_t value)
> +{
> +    uint32_t ctrl_reg = R_CTRL0 + data->cs * 4;
> +    uint32_t ctrl = spi_readl(data, ctrl_reg);
> +    uint32_t mode;
> +
> +    mode = value & CTRL_IO_MODE_MASK;
> +    ctrl &= ~CTRL_IO_MODE_MASK;
> +    ctrl |= mode;
> +    spi_writel(data, ctrl_reg, ctrl);
> +}
> +
>   static void flash_reset(const TestData *data)
>   {
>       spi_conf(data, 1 << (CONF_ENABLE_W0 + data->cs));
> @@ -659,6 +673,60 @@ static void test_write_block_protect_bottom_bit(const void *data)
>       flash_reset(test_data);
>   }
>   
> +static void test_write_page_qpi(const void *data)
> +{
> +    const TestData *test_data = (const TestData *)data;
> +    uint32_t my_page_addr = test_data->page_addr;
> +    uint32_t some_page_addr = my_page_addr + FLASH_PAGE_SIZE;
> +    uint32_t page[FLASH_PAGE_SIZE / 4];
> +    uint32_t page_pattern[] = {
> +        0xebd8c134, 0x5da196bc, 0xae15e729, 0x5085ccdf
> +    };
> +    int i;
> +
> +    spi_conf(test_data, 1 << (CONF_ENABLE_W0 + test_data->cs));
> +
> +    spi_ctrl_start_user(test_data);
> +    flash_writeb(test_data, 0, EN_4BYTE_ADDR);
> +    flash_writeb(test_data, 0, WREN);
> +    flash_writeb(test_data, 0, PP);
> +    flash_writel(test_data, 0, make_be32(my_page_addr));
> +
> +    /* Set QPI mode */
> +    spi_ctrl_set_io_mode(test_data, CTRL_IO_QUAD_IO);
> +
> +    /* Fill the page pattern */
> +    for (i = 0; i < ARRAY_SIZE(page_pattern); i++) {
> +        flash_writel(test_data, 0, make_be32(page_pattern[i]));
> +    }
> +
> +    /* Fill the page with its own addresses */
> +    for (; i < FLASH_PAGE_SIZE / 4; i++) {
> +        flash_writel(test_data, 0, make_be32(my_page_addr + i * 4));
> +    }
> +
> +    /* Restore io mode */
> +    spi_ctrl_set_io_mode(test_data, 0);
> +    spi_ctrl_stop_user(test_data);
> +
> +    /* Check what was written */
> +    read_page(test_data, my_page_addr, page);
> +    for (i = 0; i < ARRAY_SIZE(page_pattern); i++) {
> +        g_assert_cmphex(page[i], ==, page_pattern[i]);
> +    }
> +    for (; i < FLASH_PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, my_page_addr + i * 4);
> +    }
> +
> +    /* Check some other page. It should be full of 0xff */
> +    read_page(test_data, some_page_addr, page);
> +    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, 0xffffffff);
> +    }
> +
> +    flash_reset(test_data);
> +}
> +
>   static void test_palmetto_bmc(TestData *data)
>   {
>       int ret;
> @@ -736,6 +804,8 @@ static void test_ast2500_evb(TestData *data)
>                           data, test_write_page_mem);
>       qtest_add_data_func("/ast2500/smc/read_status_reg",
>                           data, test_read_status_reg);
> +    qtest_add_data_func("/ast2500/smc/write_page_qpi",
> +                        data, test_write_page_qpi);
>   }
>   
>   static void test_ast2600_evb(TestData *data)
> @@ -773,6 +843,8 @@ static void test_ast2600_evb(TestData *data)
>                           data, test_write_page_mem);
>       qtest_add_data_func("/ast2600/smc/read_status_reg",
>                           data, test_read_status_reg);
> +    qtest_add_data_func("/ast2600/smc/write_page_qpi",
> +                        data, test_write_page_qpi);
>   }
>   
>   static void test_ast1030_evb(TestData *data)
> @@ -810,6 +882,8 @@ static void test_ast1030_evb(TestData *data)
>                           data, test_write_page_mem);
>       qtest_add_data_func("/ast1030/smc/read_status_reg",
>                           data, test_read_status_reg);
> +    qtest_add_data_func("/ast1030/smc/write_page_qpi",
> +                        data, test_write_page_qpi);
>   }
>   
>   int main(int argc, char **argv)

