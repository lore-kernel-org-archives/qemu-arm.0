Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3092592njb;
        Tue, 22 Oct 2024 06:49:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKjpJmbBZWDAfcSYxKasEOC6+kemkIO7H0EQtEaqddhyG4BnqJEmo10g1f1/QpXTt/BEs8K7v+IE4X0g==@linaro.org
X-Google-Smtp-Source: AGHT+IFuQ6DCcc++2a0Jnd1cj+HJ3awrbdhZaeemfH2eT0SBsYITIq0ho0H+ZMZVksegs0HexWy/
X-Received: by 2002:a05:622a:1a8a:b0:460:bb96:dda5 with SMTP id d75a77b69052e-46100fad7demr31848061cf.18.1729604970890;
        Tue, 22 Oct 2024 06:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604970; cv=none;
        d=google.com; s=arc-20240605;
        b=KJddHHhIR+jvIz/wIZLfRjBBQvROyuao1t9IBUDZ6wo3+xEZzw7SVWe77KDbXOk8mc
         +o5VKVXZjafYHH/a48NhdYLszLBEFLqGMMZVvG6msX6Z7JSwc40Gq9l+IAIINgRv7jX4
         AzokROGsTdJDCfYUyX66RQXo0lkQEwyS5qQLZiXWlXC3LpchzgGXQ34QYJNFeDHVCMN/
         09KOfiKafq52b46YcbvkON7ig8lWxj6R2910kjcm76oeo089ENJiwWOv8YFiKVwrit2E
         iQ+NzDRTJf4HHbo+Yv6/zkBXAmOziVj3++RFowxI7LBgujnwHGknkxiiwLp3ANuE0rOf
         GDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=BhEURasNiYjCyeIWl3+mVE7VmsUApFKlZoBj587+hmE=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=VI3Yt21EkGpVWQzCJus8O4Il+VY7659BvI/i8IMUpiwAX43rRGIuUDf0ST7ROyibPA
         VLsroh2GKb+vkw2v2vfcJ2gUdWDIrDwNC+isA4PyBgUQlh0qhaZTRhKhbRZBqgG7Q9Xl
         SFZWvcxiDS4q2eD8FnDMrC4Tp+r9AurdN+qIgy36c2HN3fYaVOqhhcFNqItZweBUWAIY
         BJ7fhE3eW03GzP4w/i3l4toxL4LXAt6oCO0KV1ZU9dAuiFDcPHXg0k6mDCMWCifHoPEM
         BPjizMm4cj8mM/G3M1WSvk522SpitgUAfg3zjVihzcTHFWFGeFsbrbbK2GN4qzetCn5m
         GsFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce009d8b12si63316446d6.376.2024.10.22.06.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:49:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t3FGC-0002ov-VS; Tue, 22 Oct 2024 09:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=pGrG=RS=kaod.org=clg@ozlabs.org>)
 id 1t3FG2-0002kE-Dz; Tue, 22 Oct 2024 09:49:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=pGrG=RS=kaod.org=clg@ozlabs.org>)
 id 1t3FG0-0001cf-2V; Tue, 22 Oct 2024 09:49:10 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XXtnT2lczz4wbr;
 Wed, 23 Oct 2024 00:49:01 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXtnM6WRQz4wb1;
 Wed, 23 Oct 2024 00:48:55 +1100 (AEDT)
Message-ID: <ead07059-5ec5-4674-a25b-2afbd4a8dba9@kaod.org>
Date: Tue, 22 Oct 2024 15:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/18] test/qtest/aspeed_smc-test: Introducing a
 "page_addr" data field
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
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
 <20241022094110.1574011-13-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241022094110.1574011-13-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=pGrG=RS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.169, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: FKxVFkLz7wNG

On 10/22/24 11:41, Jamin Lin wrote:
> Currently, these test cases used the hardcode offset 0x1400000 (0x14000 * 256)
> which was beyond the 16MB flash size for flash page read/write command testing.
> However, the default fmc flash model of ast1030-a1 EVB is "w25q80bl" whose size
> is 1MB. To test all flash models, introduces a new page_addr member in TestData

I will change : s/all/SoC/

> structure, so users can set the offset for flash parge read/write command
> testing.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

with that,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/qtest/aspeed_smc-test.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index b8ab20b43d..6db18451d2 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -72,6 +72,7 @@ typedef struct TestData {
>       char *tmp_path;
>       uint8_t cs;
>       const char *node;
> +    uint32_t page_addr;
>   } TestData;
>   
>   /*
> @@ -256,7 +257,7 @@ static void assert_page_mem(const TestData *data, uint32_t addr,
>   static void test_erase_sector(const void *data)
>   {
>       const TestData *test_data = (const TestData *)data;
> -    uint32_t some_page_addr = 0x600 * FLASH_PAGE_SIZE;
> +    uint32_t some_page_addr = test_data->page_addr;
>       uint32_t page[FLASH_PAGE_SIZE / 4];
>       int i;
>   
> @@ -308,7 +309,7 @@ static void test_erase_sector(const void *data)
>   static void test_erase_all(const void *data)
>   {
>       const TestData *test_data = (const TestData *)data;
> -    uint32_t some_page_addr = 0x15000 * FLASH_PAGE_SIZE;
> +    uint32_t some_page_addr = test_data->page_addr;
>       uint32_t page[FLASH_PAGE_SIZE / 4];
>       int i;
>   
> @@ -358,8 +359,8 @@ static void test_erase_all(const void *data)
>   static void test_write_page(const void *data)
>   {
>       const TestData *test_data = (const TestData *)data;
> -    uint32_t my_page_addr = 0x14000 * FLASH_PAGE_SIZE; /* beyond 16MB */
> -    uint32_t some_page_addr = 0x15000 * FLASH_PAGE_SIZE;
> +    uint32_t my_page_addr = test_data->page_addr;
> +    uint32_t some_page_addr = my_page_addr + FLASH_PAGE_SIZE;
>       uint32_t page[FLASH_PAGE_SIZE / 4];
>       int i;
>   
> @@ -395,8 +396,8 @@ static void test_write_page(const void *data)
>   static void test_read_page_mem(const void *data)
>   {
>       const TestData *test_data = (const TestData *)data;
> -    uint32_t my_page_addr = 0x14000 * FLASH_PAGE_SIZE; /* beyond 16MB */
> -    uint32_t some_page_addr = 0x15000 * FLASH_PAGE_SIZE;
> +    uint32_t my_page_addr = test_data->page_addr;
> +    uint32_t some_page_addr = my_page_addr + FLASH_PAGE_SIZE;
>       uint32_t page[FLASH_PAGE_SIZE / 4];
>       int i;
>   
> @@ -438,7 +439,7 @@ static void test_read_page_mem(const void *data)
>   static void test_write_page_mem(const void *data)
>   {
>       const TestData *test_data = (const TestData *)data;
> -    uint32_t my_page_addr = 0x15000 * FLASH_PAGE_SIZE;
> +    uint32_t my_page_addr = test_data->page_addr;
>       uint32_t page[FLASH_PAGE_SIZE / 4];
>       int i;
>   
> @@ -679,6 +680,8 @@ static void test_palmetto_bmc(TestData *data)
>       data->jedec_id = 0x20ba19;
>       data->cs = 0;
>       data->node = "/machine/soc/fmc/ssi.0/child[0]";
> +    /* beyond 16MB */
> +    data->page_addr = 0x14000 * FLASH_PAGE_SIZE;
>   
>       qtest_add_data_func("/ast2400/smc/read_jedec", data, test_read_jedec);
>       qtest_add_data_func("/ast2400/smc/erase_sector", data, test_erase_sector);

