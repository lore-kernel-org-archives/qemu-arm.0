Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2224769lft;
        Mon, 27 Jun 2022 02:46:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uf3r2ZnWDO2aD/HxPwzTHSfYv6rW4cs09x5ZQ6gm/BTY3LT4jvdv7xDgAr7MvI9YTeBIMt
X-Received: by 2002:ad4:5f47:0:b0:46e:4bb7:eea4 with SMTP id p7-20020ad45f47000000b0046e4bb7eea4mr7979325qvg.26.1656323182488;
        Mon, 27 Jun 2022 02:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656323182; cv=none;
        d=google.com; s=arc-20160816;
        b=VX98iWsqPpOdM27E3uE616mcMF9NeedcLJftOcmMBvtxAcphcZUc8OUE/RBFMMgkr1
         RtCFXG7VZsv9W8Fp+fsMZMottPXAPMKRMEXyzxs7O/jLZpkgg7kboGYn2RzK0AgIGo6T
         aj9WkWZpYCz2TfGrF0tiFVZJLsLoHS3wJydRQEZRHXLmOUaw4TRnLJC2vopMHEd2LOya
         AqzAbP1ZcdMMbNv5x8pP6dZ6qdZr+p4SqyRdXAh8aqJJP+mtRlUlvzPfquWeTUruvJ2b
         /D/DTCmrR1ttmHbO004KVcsPNLtRTPx5UNJY95YRV244OcuHlUL7QNtGTaBmWUhSVv5P
         cTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=N/5sVC6GPBUL96Qd8EGZyrnKLpvCRoH9vbcM7Er/eBU=;
        b=ZesrFr/m1h5+nNxwe0m2tcnFVtgRiewb/6qot+euOIwiTzQa4ZcA2BeozIR+PiASR5
         KLQpOawMvzwICv+41axPuh0gdv2j1QCrYqJrq6mxZHZiX2583xor+Ib6AfLVInpYXxdt
         EANIE2UCNSMkENzIX0p4PamJVpnmZ4h8s3b1cX02A+EqfuYLdtkDVnBXXw3W2mRq0YJZ
         GHzVN4RaHcA/rac+WK7mK+hQc2ARoRWCjsEWz/uKxud9/S0eOJMw04Svqf5vV9oHp7ph
         Non1aSUeIXbA3MNo03OICd/RzM6wKThMSbxD7YwdMKgXL1AblD0SonwFC74gKQLRv68Q
         OYUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk5-20020ad45d45000000b0047057274012si6356600qvb.117.2022.06.27.02.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 02:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5lK1-0000YA-VW
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 05:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5lId-0008Rh-7u
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 05:44:56 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:49221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5lIa-0006Am-FN
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 05:44:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 860C1111B3AE6;
 Mon, 27 Jun 2022 11:44:41 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 11:44:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e822b5c6-ad83-45a9-886e-856dbc549403,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <963efd69-0ed8-0400-ae2c-bc9b66d14f57@kaod.org>
Date: Mon, 27 Jun 2022 11:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4] hw: m25p80: add tests for write protect (WP# and SRWD
 bit)
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>
References: <20220624183016.2125264-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624183016.2125264-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9115939f-d3d4-48bf-821a-79d76d2d8b84
X-Ovh-Tracer-Id: 8937674938322422657
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
X-TUID: MiHzM6dEHymp

On 6/24/22 20:30, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> Adding Signed Off By tag -- sorry I missed that !
> 
>   tests/qtest/aspeed_smc-test.c | 62 +++++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index ec233315e6..7786addfb8 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -56,7 +56,9 @@ enum {
>       BULK_ERASE = 0xc7,
>       READ = 0x03,
>       PP = 0x02,
> +    WRSR = 0x1,
>       WREN = 0x6,
> +    SRWD = 0x80,
>       RESET_ENABLE = 0x66,
>       RESET_MEMORY = 0x99,
>       EN_4BYTE_ADDR = 0xB7,
> @@ -390,6 +392,64 @@ static void test_read_status_reg(void)
>       flash_reset();
>   }
>   
> +static void test_status_reg_write_protection(void)
> +{
> +    uint8_t r;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    /* default case: WP# is high and SRWD is low -> status register writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, SRWD);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    /* WP# high and SRWD high -> status register writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, 0);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, 0);
> +
> +    /* WP# low and SRWD low -> status register writable */
> +    qtest_set_irq_in(global_qtest,
> +                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 0);
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, SRWD);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    /* WP# low and SRWD high -> status register NOT writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, 0);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    /* write is not successful */
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    qtest_set_irq_in(global_qtest,
> +                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 1);
> +    flash_reset();
> +}
> +
>   static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
>   
>   int main(int argc, char **argv)
> @@ -416,6 +476,8 @@ int main(int argc, char **argv)
>       qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
>       qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
>       qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
> +    qtest_add_func("/ast2400/smc/status_reg_write_protection",
> +                   test_status_reg_write_protection);
>   
>       ret = g_test_run();
>   

