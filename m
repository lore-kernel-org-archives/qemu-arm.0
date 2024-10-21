Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2343640njb;
        Mon, 21 Oct 2024 05:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOO7NWJkx75Rh+qPTGpmCso4/XPMQt4OJ3Y0yXNkIPypPxDUqtCr/faT+reFcas1aw76gEjPHluRDYUw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZXAgY+Ycr/1tEA6Z+oQJ9P9kLMXYKbL/DKF9WN+FuXmpgOkYU69113MMyW8ycXPe9lGTN
X-Received: by 2002:a05:620a:29d3:b0:7b1:4a0b:88a with SMTP id af79cd13be357-7b157b435a3mr1732438485a.4.1729514900978;
        Mon, 21 Oct 2024 05:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729514900; cv=none;
        d=google.com; s=arc-20240605;
        b=HgI+L44up8mgyNnY5efSW98E8RBwrQAyJoW+6ZwV69U1SurwWXGk6TdruykrJDJnF7
         wBa7Dr9t/v+VVrWQg1K/QtrCMuDYwA9IEbATo4DXpu/LpyKRiLVOehR9PPZ1x20MuuEY
         8KObVAE+mGUrFlymPpV74PTAdjdMvXzs9I9nVzK3uU9dYNJomLMioL9l+SZWqxyQe7bX
         Pt5Qf4DjGEgOIxXdruEPO0FVyd+SMvne/GrGM+krHi6RqCTLX5HBHyttr9UTXBSu6CIA
         P4NKlUCePe6lEu6uI8oEjGtvR7kJYB0odziodAxv1/uBv/8DT0dPZlQnSglbJCkIMjuk
         yNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Q5/hw0xWVSxUw6M8wsWLgeYBNqE8SFaS0Jk1IOaFmQo=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=DUSOB3imGlmHcPbSqqQKZ1efsSPkp3DWBoHiFqgAgD5BULtmuKNgGepxUhn2cVQI5+
         +bcq8T983NkBejv6UVBUdiw9BjjcnCZeyathEBx3QEhG+voUhW8Evtk34LIK7KSzqusq
         JvRlGjS4U6sCGIML94gc9g1IeXq0jcZJXTMoL5lY70tsR2LJXxRxYHYt8yU2+TN9svX+
         Hvz6GrKUdw68fqfEjxWrG8FhM5nKNAUws2oBwPBtg2THGvZY1Pzp6uX6m+zBskwYUSaq
         DcaV6gJcdenHODqzq7Xqyl0VdoHeVhXnbIdK6FAesRQptGBQNDFMDYbfB7K1U9HxnNGc
         9Tig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce0089957csi38415666d6.4.2024.10.21.05.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 05:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2rpE-0007ri-G4; Mon, 21 Oct 2024 08:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2rp8-0007pD-O6; Mon, 21 Oct 2024 08:47:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2rp6-0003sN-Pq; Mon, 21 Oct 2024 08:47:50 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XXFTC5r57z4x11;
 Mon, 21 Oct 2024 23:47:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXFT63qW0z4w2R;
 Mon, 21 Oct 2024 23:47:38 +1100 (AEDT)
Message-ID: <98a39649-3714-440c-bfbc-2aea792a1355@kaod.org>
Date: Mon, 21 Oct 2024 14:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 14/16] test/qtest/aspeed_smc-test: Support to
 test AST1030
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
 <20241018053112.1886173-15-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018053112.1886173-15-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.171, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: ifnG7Iw3nbMg

On 10/18/24 07:31, Jamin Lin wrote:
> Add test_ast1030_evb function and reused testcases for AST1030 testing.
> The base address, flash base address and ce index of fmc_cs0 are
> 0x7E620000, 0x80000000 and 0, respectively.
> The default flash model of fmc_cs0 is "w25q80bl" whose size is 1MB,
> so set jedec_id 0xef4014.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/qtest/aspeed_smc-test.c | 42 +++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 30f997679c..c5c38e23c5 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -774,11 +774,50 @@ static void test_ast2600_evb(TestData *data)
>       qtest_add_data_func("/ast2600/smc/read_status_reg",
>                           data, test_read_status_reg);
>   }
> +
> +static void test_ast1030_evb(TestData *data)
> +{
> +    int ret;
> +    int fd;
> +
> +    fd = g_file_open_tmp("qtest.m25p80.w25q80bl.XXXXXX",
> +                         &data->tmp_path, NULL);
> +    g_assert(fd >= 0);
> +    ret = ftruncate(fd, 1 * 1024 * 1024);
> +    g_assert(ret == 0);
> +    close(fd);
> +
> +    data->s = qtest_initf("-machine ast1030-evb "
> +                          "-drive file=%s,format=raw,if=mtd",
> +                          data->tmp_path);
> +
> +    /* fmc cs0 with w25q80bl flash */
> +    data->flash_base = 0x80000000;
> +    data->spi_base = 0x7E620000;
> +    data->jedec_id = 0xef4014;
> +    data->cs = 0;
> +    data->node = "/machine/soc/fmc/ssi.0/child[0]";
> +    /* beyond 512KB */
> +    data->page_addr = 0x800 * FLASH_PAGE_SIZE;
> +
> +    qtest_add_data_func("/ast1030/smc/read_jedec", data, test_read_jedec);
> +    qtest_add_data_func("/ast1030/smc/erase_sector", data, test_erase_sector);
> +    qtest_add_data_func("/ast1030/smc/erase_all",  data, test_erase_all);
> +    qtest_add_data_func("/ast1030/smc/write_page", data, test_write_page);
> +    qtest_add_data_func("/ast1030/smc/read_page_mem",
> +                        data, test_read_page_mem);
> +    qtest_add_data_func("/ast1030/smc/write_page_mem",
> +                        data, test_write_page_mem);
> +    qtest_add_data_func("/ast1030/smc/read_status_reg",
> +                        data, test_read_status_reg);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       TestData palmetto_data;
>       TestData ast2500_evb_data;
>       TestData ast2600_evb_data;
> +    TestData ast1030_evb_data;
>       int ret;
>   
>       g_test_init(&argc, &argv, NULL);
> @@ -786,13 +825,16 @@ int main(int argc, char **argv)
>       test_palmetto_bmc(&palmetto_data);
>       test_ast2500_evb(&ast2500_evb_data);
>       test_ast2600_evb(&ast2600_evb_data);
> +    test_ast1030_evb(&ast1030_evb_data);
>       ret = g_test_run();
>   
>       qtest_quit(palmetto_data.s);
>       qtest_quit(ast2500_evb_data.s);
>       qtest_quit(ast2600_evb_data.s);
> +    qtest_quit(ast1030_evb_data.s);
>       unlink(palmetto_data.tmp_path);
>       unlink(ast2500_evb_data.tmp_path);
>       unlink(ast2600_evb_data.tmp_path);
> +    unlink(ast1030_evb_data.tmp_path);
>       return ret;
>   }

