Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1770873lft;
        Wed, 22 Jun 2022 00:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t92/lbhj0pl+Bk9U9uC9c4SVrKN7DUs/u6BmiV5htySshaFpnslLuHN/NQWBe9GtQfubWg
X-Received: by 2002:a05:6214:d0d:b0:464:55fd:dea3 with SMTP id 13-20020a0562140d0d00b0046455fddea3mr25851173qvh.37.1655883571886;
        Wed, 22 Jun 2022 00:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655883571; cv=none;
        d=google.com; s=arc-20160816;
        b=rI8BmYnpwBZdtFmEaGCF0t1OHkgz4JKRxC5RupbPHk6XZlY4AqsaqmxXr9h70TBWuP
         JuDRdjxD7qBkFLi1K/zFHOWE3OYWbnqNEwJNljl8I6AzqTs1S+XvodDc2M+NTAsroziM
         PI6CVcBGZIRtpRKy91cW/joS8MoAAzCAlb9G++yCi96PGKurLjgYwG0IAXc5y3VL3/0w
         5tURofjznJ93J76lizrmLxLA2q/RLUtG3XAxuAJpfOOrM1NqOsQE1R+h9lkRKETjWh74
         KoriakxG6SH86cZkdQjolTUwbULscHk/RNIC682ovXhwZgTmSK+J1TQ3n+uchiiI9V7U
         n/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=CxLmoh8M2AmZ4vHfMb4KVCewb1yix6qi1WhqQiZrt34=;
        b=yy1G7Dj7VSF9+qCUKejHWEqHhdglKPQQppCHmXbKVZs8RvMFsx3j04yuP8vFO+UzUB
         UZ7bixv7Dqrs5yy6Xbk+0fy2ewOv3fsZmNiM+n05zYZOw01Uhey1wINS07EKWMmDDBgf
         C71LMJ3cc4+FMJ9j8WL4HIPR0y5Ut6weNioEZZFXpz24XiwDd/Sn+Qr0xSomxaHFoSCd
         XCBUZkYJwYUCR7lOlfawviqFSh94mTP4BYh2wEovqA55xCNSNHtUNsy/Hj6YaOS5yi8M
         kY3ldrtNgRb5rsSpIPrJfozrWFn/3ivxsAGK5DviGK4IiJXBviwfa90zCr92wYBA1gFh
         oKXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020a0cd783000000b0046e849a8803si8848696qvi.480.2022.06.22.00.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 00:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3uxX-0008L3-9J
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 03:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o3uw8-0007VM-C4
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 03:38:04 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:60339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o3uw4-0008S2-Ff
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 03:38:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5144921E8D;
 Wed, 22 Jun 2022 07:37:55 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 22 Jun
 2022 09:37:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005917c58df-bd3a-4e90-b8dd-1161851b7585,
 2DC937403B1024A35EC30128D5FB04FD4A6B2553) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e5cdcb1d-fdf7-6a82-959e-7dcb28145544@kaod.org>
Date: Wed, 22 Jun 2022 09:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/1] hw: m25p80: fixing individual test failure when tests
 are running in isolation
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
References: <20220617230903.2542638-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220617230903.2542638-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1a22849a-2274-451e-8666-13d1392f9454
X-Ovh-Tracer-Id: 14326794841229396868
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeguiieglhhishhtsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jnUhSDkCO6HZ

On 6/18/22 01:09, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   tests/qtest/aspeed_smc-test.c | 74 +++++++++++++++++++++++++++++------
>   1 file changed, 63 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index ec233315e6..b1e682db65 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -135,6 +135,9 @@ static void flash_reset(void)
>       spi_ctrl_start_user();
>       writeb(ASPEED_FLASH_BASE, RESET_ENABLE);
>       writeb(ASPEED_FLASH_BASE, RESET_MEMORY);
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    writeb(ASPEED_FLASH_BASE, BULK_ERASE);
> +    writeb(ASPEED_FLASH_BASE, WRDI);
>       spi_ctrl_stop_user();
>   
>       spi_conf_remove(CONF_ENABLE_W0);
> @@ -195,21 +198,41 @@ static void test_erase_sector(void)
>   
>       spi_conf(CONF_ENABLE_W0);
>   
> +    /*
> +     * Previous page should be full of 0xffs after backend is
> +     * initialized
> +     */
> +    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
> +    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, 0xffffffff);
> +    }
> +
>       spi_ctrl_start_user();
> -    writeb(ASPEED_FLASH_BASE, WREN);
>       writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
> -    writeb(ASPEED_FLASH_BASE, ERASE_SECTOR);
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    writeb(ASPEED_FLASH_BASE, PP);
>       writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
> +
> +    /* Fill the page with its own addresses */
> +    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        writel(ASPEED_FLASH_BASE, make_be32(some_page_addr + i * 4));
> +    }
>       spi_ctrl_stop_user();
>   
> -    /* Previous page should be full of zeroes as backend is not
> -     * initialized */
> -    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
> +    /* Check the page is correctly written */
> +    read_page(some_page_addr, page);
>       for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> -        g_assert_cmphex(page[i], ==, 0x0);
> +        g_assert_cmphex(page[i], ==, some_page_addr + i * 4);
>       }
>   
> -    /* But this one was erased */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
> +    writeb(ASPEED_FLASH_BASE, ERASE_SECTOR);
> +    writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
> +    spi_ctrl_stop_user();
> +
> +    /* Check the page is erased */
>       read_page(some_page_addr, page);
>       for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
>           g_assert_cmphex(page[i], ==, 0xffffffff);
> @@ -226,11 +249,31 @@ static void test_erase_all(void)
>   
>       spi_conf(CONF_ENABLE_W0);
>   
> -    /* Check some random page. Should be full of zeroes as backend is
> -     * not initialized */
> +    /*
> +     * Previous page should be full of 0xffs after backend is
> +     * initialized
> +     */
> +    read_page(some_page_addr - FLASH_PAGE_SIZE, page);
> +    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, 0xffffffff);
> +    }
> +
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    writeb(ASPEED_FLASH_BASE, PP);
> +    writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
> +
> +    /* Fill the page with its own addresses */
> +    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        writel(ASPEED_FLASH_BASE, make_be32(some_page_addr + i * 4));
> +    }
> +    spi_ctrl_stop_user();
> +
> +    /* Check the page is correctly written */
>       read_page(some_page_addr, page);
>       for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> -        g_assert_cmphex(page[i], ==, 0x0);
> +        g_assert_cmphex(page[i], ==, some_page_addr + i * 4);
>       }
>   
>       spi_ctrl_start_user();
> @@ -238,7 +281,7 @@ static void test_erase_all(void)
>       writeb(ASPEED_FLASH_BASE, BULK_ERASE);
>       spi_ctrl_stop_user();
>   
> -    /* Recheck that some random page */
> +    /* Check the page is erased */
>       read_page(some_page_addr, page);
>       for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
>           g_assert_cmphex(page[i], ==, 0xffffffff);
> @@ -299,6 +342,14 @@ static void test_read_page_mem(void)
>       spi_conf(CONF_ENABLE_W0);
>       spi_ctrl_start_user();
>       writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    writeb(ASPEED_FLASH_BASE, PP);
> +    writel(ASPEED_FLASH_BASE, make_be32(my_page_addr));
> +
> +    /* Fill the page with its own addresses */
> +    for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        writel(ASPEED_FLASH_BASE, make_be32(my_page_addr + i * 4));
> +    }
>       spi_ctrl_stop_user();
>       spi_conf_remove(CONF_ENABLE_W0);
>   
> @@ -417,6 +468,7 @@ int main(int argc, char **argv)
>       qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
>       qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
>   
> +    flash_reset();
>       ret = g_test_run();
>   
>       qtest_quit(global_qtest);

