Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1006622lft;
        Fri, 1 Jul 2022 00:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ticO2mhnkuZIJqCHY632004G6Q6Ed2L967f40VxfQqF+cCc8iByEYpynUHwJtnk/N8tlgz
X-Received: by 2002:a05:6214:20c6:b0:470:5525:390e with SMTP id 6-20020a05621420c600b004705525390emr15062114qve.39.1656660291837;
        Fri, 01 Jul 2022 00:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656660291; cv=none;
        d=google.com; s=arc-20160816;
        b=rNt5AnD72ebddx6aHGCNg8+vf1r9FW9DvVCkjFojSsNgLUKDwa4kzgYwgk1xhKVxVd
         25zxClUuRI+tjSToSdV3WezAkKZRvTQk+8FyAiiIvRRqxXUAxh5FqlMdAXkieI7/LuAy
         rJbvelzzhi6HroFw93ITirN6DGryH4kU202Q32AxyInFKoNW3ZW3dAzeHTfqA0DLa0fh
         5SvKhkbI2W+lYuPTIRktQrU4+lut54OvkvppkhA9yMFs8AX4OEzvKBmtt54cMXI+sE4S
         6HkzLWHE+ZnXTjiZ1xilodAF6e9vTUax8rJcRVtbP4KYS/dTiDW4gqfRIyzoAUgS8OEx
         fDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=hHK2L8VWmqJqQHznZFW1HAoO3LSkuKypzs0oa0l44ro=;
        b=lEBq9FR5hm5t9XYlxg+UbZ9McParb+i/XsmPI4RDU6rR8syKAuy8tNrd9GgM3NE0cI
         BxvsSnk95NyoDPEKq9EbjRgFbt0fPurjZXqfFZfEUxrwNm85nKTcSnS7T5ftWTRMPTFu
         Lg4RZb73S9Lab+dbip4MwI8h4eFQUTIl0fVqF7ViJg2sD8WMFgl3pCmJhSfUpSDaqn9l
         OVGgW2Iw/61Y7SXQqxIkl7UKx7Ne+sOV3EKJ5EWIyisvi8lwW61rohQm75+eyas7g+Mq
         yowB7OtqIr+CUG7rtz69Pg/VmyWli+aXhTLyU2dAqs1bRyMW841zsJNQCVKc7uwmeoSE
         rufQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a0b5600b006b24f854d89si1782940qkg.626.2022.07.01.00.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 00:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7B1H-00064R-9x
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 03:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7B0o-000614-MP
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 03:24:22 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:36921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7B0k-0003Kg-1f
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 03:24:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0A3D9200B0;
 Fri,  1 Jul 2022 07:24:14 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 1 Jul 2022
 09:24:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005f39df174-f03e-471e-b7ba-ac92f5997db8,
 4AFA7A5FE9B5479AF1021A557A7101AB3AA64E21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bba0b8af-0b12-9cc5-3eb1-e761aeedb391@kaod.org>
Date: Fri, 1 Jul 2022 09:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] hw: m25p80: add tests for BP and TB bit write protect
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
References: <20220627185234.1911337-1-irischenlj@fb.com>
 <20220627185234.1911337-3-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627185234.1911337-3-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9149e6b2-17cf-4943-ad48-5b3e0c9d8d0b
X-Ovh-Tracer-Id: 11609435417859033988
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeguiieglhhishhtsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J8/MFF12dtCc

On 6/27/22 20:52, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>

Palmettos are getting old (2014). We might want to change the machine
model to an ast2600 one.

Anyhow, these are very good tests for both m25p80 and aspeed-smc models.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   tests/qtest/aspeed_smc-test.c | 111 ++++++++++++++++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 1258687eac..05ce941566 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -192,6 +192,24 @@ static void read_page_mem(uint32_t addr, uint32_t *page)
>       }
>   }
>   
> +static void write_page_mem(uint32_t addr, uint32_t write_value)
> +{
> +    spi_ctrl_setmode(CTRL_WRITEMODE, PP);
> +
> +    for (int i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        writel(ASPEED_FLASH_BASE + addr + i * 4, write_value);
> +    }
> +}
> +
> +static void assert_page_mem(uint32_t addr, uint32_t expected_value)
> +{
> +    uint32_t page[FLASH_PAGE_SIZE / 4];
> +    read_page_mem(addr, page);
> +    for (int i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, expected_value);
> +    }
> +}
> +
>   static void test_erase_sector(void)
>   {
>       uint32_t some_page_addr = 0x600 * FLASH_PAGE_SIZE;
> @@ -501,6 +519,95 @@ static void test_status_reg_write_protection(void)
>       flash_reset();
>   }
>   
> +static void test_write_block_protect(void)
> +{
> +    uint32_t sector_size = 65536;
> +    uint32_t n_sectors = 512;
> +
> +    spi_ce_ctrl(1 << CRTL_EXTENDED0);
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    uint32_t bp_bits = 0b0;
> +
> +    for (int i = 0; i < 16; i++) {
> +        bp_bits = ((i & 0b1000) << 3) | ((i & 0b0111) << 2);
> +
> +        spi_ctrl_start_user();
> +        writeb(ASPEED_FLASH_BASE, WREN);
> +        writeb(ASPEED_FLASH_BASE, BULK_ERASE);
> +        writeb(ASPEED_FLASH_BASE, WREN);
> +        writeb(ASPEED_FLASH_BASE, WRSR);
> +        writeb(ASPEED_FLASH_BASE, bp_bits);
> +        writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
> +        writeb(ASPEED_FLASH_BASE, WREN);
> +        spi_ctrl_stop_user();
> +
> +        uint32_t num_protected_sectors = i ? MIN(1 << (i - 1), n_sectors) : 0;
> +        uint32_t protection_start = n_sectors - num_protected_sectors;
> +        uint32_t protection_end = n_sectors;
> +
> +        for (int sector = 0; sector < n_sectors; sector++) {
> +            uint32_t addr = sector * sector_size;
> +
> +            assert_page_mem(addr, 0xffffffff);
> +            write_page_mem(addr, make_be32(0xabcdef12));
> +
> +            uint32_t expected_value = protection_start <= sector
> +                                      && sector < protection_end
> +                                      ? 0xffffffff : 0xabcdef12;
> +
> +            assert_page_mem(addr, expected_value);
> +        }
> +    }
> +
> +    flash_reset();
> +}
> +
> +static void test_write_block_protect_bottom_bit(void)
> +{
> +    uint32_t sector_size = 65536;
> +    uint32_t n_sectors = 512;
> +
> +    spi_ce_ctrl(1 << CRTL_EXTENDED0);
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    /* top bottom bit is enabled */
> +    uint32_t bp_bits = 0b00100 << 3;
> +
> +    for (int i = 0; i < 16; i++) {
> +        bp_bits = (((i & 0b1000) | 0b0100) << 3) | ((i & 0b0111) << 2);
> +
> +        spi_ctrl_start_user();
> +        writeb(ASPEED_FLASH_BASE, WREN);
> +        writeb(ASPEED_FLASH_BASE, BULK_ERASE);
> +        writeb(ASPEED_FLASH_BASE, WREN);
> +        writeb(ASPEED_FLASH_BASE, WRSR);
> +        writeb(ASPEED_FLASH_BASE, bp_bits);
> +        writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
> +        writeb(ASPEED_FLASH_BASE, WREN);
> +        spi_ctrl_stop_user();
> +
> +        uint32_t num_protected_sectors = i ? MIN(1 << (i - 1), n_sectors) : 0;
> +        uint32_t protection_start = 0;
> +        uint32_t protection_end = num_protected_sectors;
> +
> +        for (int sector = 0; sector < n_sectors; sector++) {
> +            uint32_t addr = sector * sector_size;
> +
> +            assert_page_mem(addr, 0xffffffff);
> +            write_page_mem(addr, make_be32(0xabcdef12));
> +
> +            uint32_t expected_value = protection_start <= sector
> +                                      && sector < protection_end
> +                                      ? 0xffffffff : 0xabcdef12;
> +
> +            assert_page_mem(addr, expected_value);
> +        }
> +    }
> +
> +    flash_reset();
> +}
> +
>   static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
>   
>   int main(int argc, char **argv)
> @@ -529,6 +636,10 @@ int main(int argc, char **argv)
>       qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
>       qtest_add_func("/ast2400/smc/status_reg_write_protection",
>                      test_status_reg_write_protection);
> +    qtest_add_func("/ast2400/smc/write_block_protect",
> +                   test_write_block_protect);
> +    qtest_add_func("/ast2400/smc/write_block_protect_bottom_bit",
> +                   test_write_block_protect_bottom_bit);
>   
>       flash_reset();
>       ret = g_test_run();

