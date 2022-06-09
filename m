Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp225716lfb;
        Wed, 8 Jun 2022 23:25:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdM9YBwwce2r1JJ0BtZWMW1xeExwkwi2gFW0vcxxm1gA13Uzfif4aVAmRvtnJdhBfDMica
X-Received: by 2002:a05:622a:188:b0:304:f343:bba2 with SMTP id s8-20020a05622a018800b00304f343bba2mr12998124qtw.377.1654755930657;
        Wed, 08 Jun 2022 23:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654755930; cv=none;
        d=google.com; s=arc-20160816;
        b=07wRY7Xt1zhZIPF3cAwJk1NAa9x2oX4iEyqotTLUbIk4zyGMvdbbHrgdT0iy0LSdNC
         7XYRJWCCcXV2LNZZpwBu7o/2oUj//9NR7W8ODjXOyBKb5iLAx0PMkUuwb242c5I+h5Nl
         eEKaizFAuqnRith9CltJeRzgShQGurfO/F0bmfBqOVIBFEWsoKmhNxUyXWEjf/yWyGWe
         yxifZOjLzyO9ixGtRW4t7N1eP/yLHnNVNEv0mr7Tq8j0PjBzvdqVP/qnggVw2WRd4Vab
         5anDLSeO0sf+C5nKjI1whS2UPiip1JT3Coim9NDeVkitXW6g5YX3auG8rKwf7Ri7sQFp
         VJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KHHYGg3liZ9UUg4k7saa3rrUsiZ/XavPZSmKlLHUVjU=;
        b=u+sfwdRNpBDw0GxdTmDyv+uA2yAS9e9gskgUNFmx4ZRLcBveGxZC7IoB7idhZx8BnR
         eYJHwbGVAEqsC+/mMXO1X8I01pvFQn6g2PnU2wPCP/iDEQ1zBFEYSlrGhgsqd448PQjj
         QWt9SOd1xMJRckt+6ctv1qaoV4G8IDpR0L4hXdPFdJRyriueB1KEmQ/scFfVuHglFP8x
         IFYx9uWinvIbbRh6UaiH6pO879Cu7gF5+NJ6WTTfCfD1DtEbTNEiyPFBnesRg+yNVpeI
         4UILdlk0Skvn3V0LBALitRfXgcb/j+q1Ozim1v8Hk93LGjPyjuREMRhxZ367KcKI2DDl
         0tNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gsKrly5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc11-20020a056214230b00b00461f278dae7si12573818qvb.365.2022.06.08.23.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jun 2022 23:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gsKrly5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzBbl-00027v-W1
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 02:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzBbU-00026Y-6J
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 02:25:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzBbP-0005Y3-Dc
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 02:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654755906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHHYGg3liZ9UUg4k7saa3rrUsiZ/XavPZSmKlLHUVjU=;
 b=gsKrly5uhJnek0IdBe53jBJEMc7Tu/FlXu3ZQemPpQaWHg9UsW+cRMAP5bvEWuqB9dvNbk
 GyoV60kdGBHqLqa05/NXqje1+ubkTEID3k+sptTMzOsmraBlaI6TpyoxOgU/itjX+VGmDh
 o5S8hXNnN/wx53VhOKxUppVrPiDvEE0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-JHz-C8XqPpyfLHW5LNYj-g-1; Thu, 09 Jun 2022 02:25:03 -0400
X-MC-Unique: JHz-C8XqPpyfLHW5LNYj-g-1
Received: by mail-wr1-f70.google.com with SMTP id
 j9-20020adfa549000000b00219ac7fa766so410893wrb.8
 for <qemu-arm@nongnu.org>; Wed, 08 Jun 2022 23:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KHHYGg3liZ9UUg4k7saa3rrUsiZ/XavPZSmKlLHUVjU=;
 b=bWwtoFu6VOOdAklv351lLSNFGsEphKtNHay/UwV4fTzN5WUMwV5dLsxpRrPLnQCYeC
 wDCVCr0CbI9IHXFJqA9pwUygisH/ufQKQ8VUkoitKI8nEDHnAc922EtYMdxLwCL9rtaO
 bcxG/dTDFXGPiouWQt3emq1HYD/H2u/R4VKTCYoxoMrfU/xh0OE2+HGn7j5ClAVZCxiy
 4saWfT/3MeVgWJgsZGZfYA9XJws81l7YvDHmhGuO2Fd6EjFXkUh/VoFRl1eWxFd7VR2N
 nZpysZCIXotpNTG/EByRF6wWnI1E6T4GaXs5wP838LLGYA8ept025/s4hFNcMK42mwFY
 pQ0g==
X-Gm-Message-State: AOAM530es5DO5gJT6PUObAbee/JYAE963zDWDIJ15ox8e4rqipAiSPDd
 lfLb6Mvq71fH2xjYPtKkR2n05LJ197tGgofImA0DTwHtCJIhFlxdsZelATvNj3KfGaZXDikU+sN
 H2DOZ7Yc2JrcN
X-Received: by 2002:a7b:c205:0:b0:39c:506d:e294 with SMTP id
 x5-20020a7bc205000000b0039c506de294mr1615039wmi.159.1654755902713; 
 Wed, 08 Jun 2022 23:25:02 -0700 (PDT)
X-Received: by 2002:a7b:c205:0:b0:39c:506d:e294 with SMTP id
 x5-20020a7bc205000000b0039c506de294mr1615001wmi.159.1654755902283; 
 Wed, 08 Jun 2022 23:25:02 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b0039aef592ca0sm26115228wmk.35.2022.06.08.23.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 23:25:01 -0700 (PDT)
Message-ID: <c7a83cff-c215-9c2e-0a88-956c67742f2d@redhat.com>
Date: Thu, 9 Jun 2022 08:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] hw: m25p80: add tests for write protect
To: Iris Chen <irischenlj@fb.com>, qemu-devel@nongnu.org
Cc: pdel@fb.com, qemu-arm@nongnu.org, clg@kaod.org, patrick@stwcx.xyz,
 alistair@alistair23.me, kwolf@redhat.com, hreitz@redhat.com,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 lvivier@redhat.com, pbonzini@redhat.com, qemu-block@nongnu.org
References: <20220609031320.2212468-1-irischenlj@fb.com>
 <20220609031320.2212468-2-irischenlj@fb.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220609031320.2212468-2-irischenlj@fb.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: ym7qHTmJFKnf

On 09/06/2022 05.13, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
> Include the tests in a separate patch. Using qtest_set_irq_in() as per review.
> 
>   tests/qtest/aspeed_smc-test.c | 60 +++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index c5d97d4410..7786addfb8 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -392,6 +392,64 @@ static void test_read_status_reg(void)
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

FWIW, I'd prefer if we could use qtest_writeb / qtest_readb for new code 
instead of writeb / readb, but well, the whole file is already written that 
way, so this is only "consistent" ... so:

Acked-by: Thomas Huth <thuth@redhat.com>

