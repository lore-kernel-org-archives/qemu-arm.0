Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2316965njb;
        Mon, 21 Oct 2024 05:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXjMohaUCyKF4BI+bhJa902awwi+tIfFr7bE13qcI9C3GY7c2ByVWps2CillrjmPnwliWTSSWwOZxsgg==@linaro.org
X-Google-Smtp-Source: AGHT+IFN5CJ3r2P/PYH/vn4l4dyXnBox9J8WbRndqoqlFjfexmJy/qFisA80TXcTDtBWcOlt+JF6
X-Received: by 2002:a05:622a:1992:b0:45f:8ee:1859 with SMTP id d75a77b69052e-460aeba0e48mr192112001cf.0.1729512246828;
        Mon, 21 Oct 2024 05:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729512246; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6fUXCCzj0E8GpPJN7cb0CI72wIqjMOO9DCWgo2O2Kg9nuPFebbug6oT8wyS0b37an
         XbGF2RDHl2PsCPs6Xjz2yu7L6WoAq3DoFzu+JDicFXdT0/B5g0Q0HQfWwxWNNatFCmc4
         0J17YmlcrCtaqRF4cp7lerBR4srRCHVbmjsUC8FY5tq9cpJHGC/TNrq9Bq487OKPuE49
         24niufvox+EJwbVd300L6FwUYUu41Iy3VyAGyNni5WfVwiJa2INgIzpe7ywRaHh+36Zt
         KECocWBPsMqLAr1KLMgr7SsKiIuR9sBoTfXpG8P4V1or2C/CujXGMPOJYBiedPsO7mWr
         X87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id;
        bh=ooieuRfafTMjUU78NqPhmZrZysZxjHDjuBUvpf34Ej4=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=XCBDM1JtBvZyb8ahyHVtF7NPytjbVqDuvt7ZTiZi+wCeL+8Sw/W/J+dVTRUBhfGgAy
         qxl1/j+r8UZ/SL/M0xQshcHT+tpQ2OGKmKvU3KENEcFVtgfKfKRkgevXuVrU7ZEgfUoN
         lI8V+m68SRFKLYAJ19vwxS9g/4MX3vG8o+a6AOxLNoMt3anu3Vsuik72Y54TYeInmGzZ
         HB7CRIHF4xm3Db+wfMtkbfLqbXgkWjBGXuUfc3u0jK5WU+gLwfIRNVQMgGAfQSkhFc//
         T0UtWtJ49JdQ0LgkNvc7Y9SEQsSRvfDcX3NT2uMH85qfF3DJMRRQ/kQZxN9sqjJv+HvN
         mrRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3b38e95si39047531cf.54.2024.10.21.05.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 05:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2r8G-0008J1-PT; Mon, 21 Oct 2024 08:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2r8E-0008Hy-1c; Mon, 21 Oct 2024 08:03:30 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2r89-0004UC-2w; Mon, 21 Oct 2024 08:03:29 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XXDTy4WBMz4wyh;
 Mon, 21 Oct 2024 23:03:18 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXDTs2rhfz4wxf;
 Mon, 21 Oct 2024 23:03:13 +1100 (AEDT)
Message-ID: <89792943-4cda-4d9c-a223-7adaf2023361@kaod.org>
Date: Mon, 21 Oct 2024 14:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [SPAM] [PATCH v1 08/16] test/qtest/aspeed_smc-test: Move
 testcases to test_palmetto_bmc function
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
 <20241018053112.1886173-9-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
In-Reply-To: <20241018053112.1886173-9-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.171, RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: pBD+tazFthp7

On 10/18/24 07:31, Jamin Lin wrote:
> So far, the test cases are used for testing SMC model with AST2400 BMC.
> However, AST2400 is end off live and ASPEED is no longer support this SOC.
> To test SMC model for AST2500, AST2600 and AST1030, move the test cases
> from main to test_palmetto_bmc function.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/qtest/aspeed_smc-test.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 4673371d95..ec1fa6ec15 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -610,14 +610,12 @@ static void test_write_block_protect_bottom_bit(void)
>       flash_reset();
>   }
>   
> -int main(int argc, char **argv)
> +static int test_palmetto_bmc(void)
>   {
>       g_autofree char *tmp_path = NULL;
>       int ret;
>       int fd;
>   
> -    g_test_init(&argc, &argv, NULL);
> -
>       fd = g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
>       g_assert(fd >= 0);
>       ret = ftruncate(fd, FLASH_SIZE);
> @@ -644,8 +642,18 @@ int main(int argc, char **argv)
>   
>       flash_reset();
>       ret = g_test_run();
> -
>       qtest_quit(global_qtest);
>       unlink(tmp_path);
> +
> +    return ret;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +    ret = test_palmetto_bmc();
> +
>       return ret;
>   }

