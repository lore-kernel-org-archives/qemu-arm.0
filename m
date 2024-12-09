Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2563780njb;
        Mon, 9 Dec 2024 05:10:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8HZl5FcObQbPi0d/gAg6s2WBiM5f2dLc9Q9H+HMvrBYHV+wUm3vw6flHKHvzUEIKqp7FJ3Xl88vC/qg==@linaro.org
X-Google-Smtp-Source: AGHT+IGgnKFCaJbQeECd/2un3Y6FyQ6V2vaqNt1J6wqxcjFlPifEfxt7DsmfQ5jSww/KCFHPbZJj
X-Received: by 2002:a05:620a:260d:b0:79f:18d4:d613 with SMTP id af79cd13be357-7b6dce86c6dmr41610385a.38.1733749822502;
        Mon, 09 Dec 2024 05:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733749822; cv=none;
        d=google.com; s=arc-20240605;
        b=J8ADnJDmWN6OjN6JTUKfcQh52F+9Yvcm3967PAsLK/8PHRk3fxQbjkScwT6ykTVrgb
         2wbuE35B4DoQLQjHsGnvPPq0Gs+U1b1TTgarzzLwsfCDVkQyBKCDSnf/YNqk2hMXsr1K
         xtxk0TW3zSS1nGbojcExcsf4a+Wbzu5Za+ALPdXrY/pnnjUl1IVpcMYunR+jdIp2zp+9
         pyvz+nGfdWWyciDY14H0J2h8bj7Tt7QEF2nCybB270uPd0LL3lf9UPEHOV2DGWGa/xFs
         1Yw3P0TVrb0aQy02RBwtlSZmqMKBSg/ruCkHyP5GLyy4HiOjhRuG75rmniG+/MlNW/Fm
         z3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=Pm41FAD36ONM/NO/0FQMvwcV3rYs01Z3QQ7zNNqYJn0=;
        fh=oedLfDKd0DFZm7v5kJpvBvmgDh8OETCHiWUWrPGSMro=;
        b=BN5037yZvOG+0JdEdppdssdouwlmIh0lHmJo7P2miRL6tGYL2/c2u83fCeQkDw+ezl
         6q+VMwXp8L9N8YaN8h4SirK34ZPxjuD7ZpBtfhDuT9l543b60yIJ7FS0ESkN8MCApvQW
         a4Aa4HZdIqiqXoqsm06oqTm2TGndHdiP32+r6IrHcIvUjRHMfltB4FmVP71UhHmRblf0
         2SgR/JwsnOI4eUPB3b5jDD0H5vzZZi4xpSuh48HqiZB2EK6zGblGiPYeeP/KPn9Ueg+z
         4A/gz2xcA/dKALkhoaFQdi9OhqwoSohVGOvTw30at+yYfCCP0mSbzjC4biVYMKabNPgn
         r1RQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afe0d12f2bsi1135748137.4.2024.12.09.05.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 05:10:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tKdWU-0008K3-4o; Mon, 09 Dec 2024 08:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=7enf=TC=kaod.org=clg@ozlabs.org>)
 id 1tKdWK-0008FW-F6; Mon, 09 Dec 2024 08:09:52 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=7enf=TC=kaod.org=clg@ozlabs.org>)
 id 1tKdWI-0003Hf-Ch; Mon, 09 Dec 2024 08:09:52 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Y6Mdz5sWsz4wcr;
 Tue, 10 Dec 2024 00:09:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6Mdv2x1Rz4wbx;
 Tue, 10 Dec 2024 00:09:39 +1100 (AEDT)
Message-ID: <71f9503e-080f-4d4b-a4af-4d7649c7e39c@kaod.org>
Date: Mon, 9 Dec 2024 14:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] test/qtest/ast2700-smc-test: Support to test
 AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241127091543.1243114-1-jamin_lin@aspeedtech.com>
 <20241127091543.1243114-11-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20241127091543.1243114-11-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=7enf=TC=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DjisBCx14GOA

On 11/27/24 10:15, Jamin Lin wrote:
> Add test_ast2700_evb function and reused testcases which are from
> aspeed_smc-test.c for AST2700 testing. The base address, flash base address
> and ce index of fmc_cs0 are 0x14000000, 0x100000000 and 0, respectively.
> The default flash model of fmc_cs0 is "w25q01jvq" whose size is 128MB,
> so set jedec_id 0xef4021.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/qtest/ast2700-smc-test.c | 71 ++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build        |  4 +-
>   2 files changed, 74 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/ast2700-smc-test.c
> 
> diff --git a/tests/qtest/ast2700-smc-test.c b/tests/qtest/ast2700-smc-test.c
> new file mode 100644
> index 0000000000..d1c4856307
> --- /dev/null
> +++ b/tests/qtest/ast2700-smc-test.c
> @@ -0,0 +1,71 @@
> +/*
> + * QTest testcase for the M25P80 Flash using the ASPEED SPI Controller since
> + * AST2700.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2024 ASPEED Technology Inc.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bswap.h"
> +#include "libqtest-single.h"
> +#include "qemu/bitops.h"
> +#include "aspeed-smc-utils.h"
> +
> +static void test_ast2700_evb(AspeedSMCTestData *data)
> +{
> +    int ret;
> +    int fd;
> +
> +    fd = g_file_open_tmp("qtest.m25p80.w25q01jvq.XXXXXX",
> +                         &data->tmp_path, NULL);
> +    g_assert(fd >= 0);
> +    ret = ftruncate(fd, 128 * 1024 * 1024);
> +    g_assert(ret == 0);
> +    close(fd);
> +
> +    data->s = qtest_initf("-machine ast2700-evb "
> +                          "-drive file=%s,format=raw,if=mtd",
> +                          data->tmp_path);
> +
> +    /* fmc cs0 with w25q01jvq flash */
> +    data->flash_base = 0x100000000;
> +    data->spi_base = 0x14000000;
> +    data->jedec_id = 0xef4021;
> +    data->cs = 0;
> +    data->node = "/machine/soc/fmc/ssi.0/child[0]";
> +    /* beyond 64MB */
> +    data->page_addr = 0x40000 * FLASH_PAGE_SIZE;
> +
> +    qtest_add_data_func("/ast2700/smc/read_jedec",
> +                        data, aspeed_smc_test_read_jedec);
> +    qtest_add_data_func("/ast2700/smc/erase_sector",
> +                        data, aspeed_smc_test_erase_sector);
> +    qtest_add_data_func("/ast2700/smc/erase_all",
> +                        data, aspeed_smc_test_erase_all);
> +    qtest_add_data_func("/ast2700/smc/write_page",
> +                        data, aspeed_smc_test_write_page);
> +    qtest_add_data_func("/ast2700/smc/read_page_mem",
> +                        data, aspeed_smc_test_read_page_mem);
> +    qtest_add_data_func("/ast2700/smc/write_page_mem",
> +                        data, aspeed_smc_test_write_page_mem);
> +    qtest_add_data_func("/ast2700/smc/read_status_reg",
> +                        data, aspeed_smc_test_read_status_reg);
> +    qtest_add_data_func("/ast2700/smc/write_page_qpi",
> +                        data, aspeed_smc_test_write_page_qpi);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    AspeedSMCTestData ast2700_evb_data;
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    test_ast2700_evb(&ast2700_evb_data);
> +    ret = g_test_run();
> +
> +    qtest_quit(ast2700_evb_data.s);
> +    unlink(ast2700_evb_data.tmp_path);
> +    return ret;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index ea68ec1441..21e9320a95 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -214,7 +214,8 @@ qtests_aspeed = \
>      'aspeed_smc-test',
>      'aspeed_gpio-test']
>   qtests_aspeed64 = \
> -  ['ast2700-gpio-test']
> +  ['ast2700-gpio-test',
> +   'ast2700-smc-test']
>   
>   qtests_stm32l4x5 = \
>     ['stm32l4x5_exti-test',
> @@ -361,6 +362,7 @@ qtests = {
>     'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
>     'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
>     'aspeed_smc-test': files('aspeed-smc-utils.c', 'aspeed_smc-test.c'),
> +  'ast2700-smc-test': files('aspeed-smc-utils.c', 'ast2700-smc-test.c'),
>   }
>   
>   if vnc.found()

