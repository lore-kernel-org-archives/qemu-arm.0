Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1350660njc;
        Mon, 30 Sep 2024 09:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWn9gjl3P+EjQ6mnooNHK3Lj8doxpWsl9eFVt//TgRV9OOsz+JLfU7j9C1b+OoXe0tU39TUP/BsDVmk9w==@linaro.org
X-Google-Smtp-Source: AGHT+IErjDS/wfD5GptDFB4Q5jo5QGEs7pqUSdwSkBK7qf6uvZwshTbiUb6SFlqkNa58MAO13MPn
X-Received: by 2002:a05:622a:50:b0:458:3a34:b7b8 with SMTP id d75a77b69052e-45c9f211ff9mr225375491cf.25.1727714244843;
        Mon, 30 Sep 2024 09:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727714244; cv=none;
        d=google.com; s=arc-20240605;
        b=QqyiRzNAiFx6zgiFFdv/O2uNz5KugIbDPtfE4xsDdeEEbTUPJc1WxcJangWYjN/5Qj
         08E/ROanAquHedIwpCbBOznk8KiAjV9vHRjBWwUuRu6HVGbaElmRcR/sQZB2wcf0Nttm
         P3UnO4qhGs15tPvpv8tOgxArWxnWJOao8Qh7Ez5XAPltQCZuOWiJCgnpwSAIelkG1+wC
         ebwWMpEQLbTtlDh4e61AsqkvYXnbrutZRLVfW2PSez6yMhwBkMGowXdEJDqs1HJPpOKu
         TYtocsR3HfOggz1aP27FMA9jlEJAohVmiA9zI++zEziG2NebjWVfTpKsIwOfqUXzMiFc
         tv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Yb94j3vRM+NpzfYheQTDsZWP4NMxNiowy0/QwfkQogw=;
        fh=cgK3/F8KxOBWkL6C/EquQnFCD8nQFCjQQ2xMOh01sj8=;
        b=DPjhDsIFnNFkuSw+wrckWxf4zSVwhtD/N9wAb1YSWB5EBbZLYYk68TKWp91JPKsDtR
         mFwnLvHlFPXOszoKtGlAQevIfPF4Kz2GXuu3tVJ7nrIARUM8jHhbQkHm1IoXQVzTGPvv
         ijiBw7hELFDrjukyenBRg0L6QPTCRhIJCt4XHJ/JtCYAWuGRMSBCFUC40TgNxLnjhq2s
         P2jZr/5f9g+El42wDw/Mwh0eogsRPoca4TiCEx7ypqPuLZ40DGVO9Ovc+tmyZlDKXh0p
         f64uHCXY6XRCBOv6ndbdqouuqcjxEeckhGU6ezTOS+7W7+PjRccbO4cTcZd2Dd3QgAVm
         dtKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BCM9fE9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f34b6efsi96801051cf.406.2024.09.30.09.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 09:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BCM9fE9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svJOV-0004PQ-81; Mon, 30 Sep 2024 12:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svJOT-0004Mn-Oz
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 12:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svJOR-0006Hx-L2
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 12:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727714222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Yb94j3vRM+NpzfYheQTDsZWP4NMxNiowy0/QwfkQogw=;
 b=BCM9fE9LXcn4Eb8FWs7m4ykbq+vEvqPIqnSp79GKSrASxEknPHtxzD/Vb7uAviun0Bi09d
 FrWUqR6UvCCUdQKYVn9ywFudrm8Kl9cLLySk2AXmDkyLbPD5q+/m4JlARZg3eFQoM1J/Iw
 7PmUvz76FxWRYwItLgsnYaaLX2+qVkg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-AGjrFuiYOKyoUz3iRJDJzw-1; Mon, 30 Sep 2024 12:37:00 -0400
X-MC-Unique: AGjrFuiYOKyoUz3iRJDJzw-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6c58e9bf10bso83393576d6.3
 for <qemu-arm@nongnu.org>; Mon, 30 Sep 2024 09:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727714220; x=1728319020;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yb94j3vRM+NpzfYheQTDsZWP4NMxNiowy0/QwfkQogw=;
 b=M8KC5luCAqGbK+u2Ifvr/JZ8ZNEJh/nqAa46VtEVtpTLcRQfKITCaoQLTug1nZtZOE
 xUyTSuzeY1o0rH9LL5pH5nTsb7rV9xb3KPAOJZRP19yGYIaCK20CUR+b3LaSu/hR2LUR
 FNuex+pZ2JRHMclzT0vfz/XUEKWAstXC4casSCzEJLos0cDlusnn/JQjLy4rMvERLMZ/
 uXEjq5nj6E0ufWq9HoHePBx4A3OMzdwEhVyNY+HLPtJWjqFFQuvklgGfigcv8A4cy32i
 EmaHTtOZPYxe1mhPgBP1D33upG4LsiJxZyWRipAW5zma4s/pKIVZzpj+wOwlX0UJwqbC
 JUBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+e6thIrtPPTQqVeSH98ZDIlpXhFKwZjCRnbbgXeKTvzyrTWjMRtNSOIdiLEPVZ6CcKzEmsC6h0A==@nongnu.org
X-Gm-Message-State: AOJu0YydhSn/xqmbRNDFb34wjvy/1EjOaGIr0T5lFzRuBNGvuf7dMFqB
 nfuLOOXdo6WFG35hPqJ42FxsBfodJ90JqPCWxofRdfHvJlgmZpvzXwP7ZPtvAPmuGdcL/LNFyUH
 b+73wHtDDCACAfywK7aQlvZ7dbBXS6om4HqIaUsxsuCV/Nl5HFw==
X-Received: by 2002:a05:6214:3b8a:b0:6cb:4e76:25d with SMTP id
 6a1803df08f44-6cb4e76028amr123765476d6.37.1727714220023; 
 Mon, 30 Sep 2024 09:37:00 -0700 (PDT)
X-Received: by 2002:a05:6214:3b8a:b0:6cb:4e76:25d with SMTP id
 6a1803df08f44-6cb4e76028amr123765116d6.37.1727714219645; 
 Mon, 30 Sep 2024 09:36:59 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-48-176.web.vodafone.de.
 [109.42.48.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b66d0d5sm41495686d6.81.2024.09.30.09.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 09:36:59 -0700 (PDT)
Message-ID: <e3f31190-85fb-41c9-9ecb-eefdaa8c5c49@redhat.com>
Date: Mon, 30 Sep 2024 18:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] hw/gpio/aspeed: Add test case for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
 <20240930085239.3089901-9-jamin_lin@aspeedtech.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240930085239.3089901-9-jamin_lin@aspeedtech.com>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bckEMa21mQOb

On 30/09/2024 10.52, Jamin Lin wrote:
> Add test case to test GPIO output and input pins from A0 to D7 for AST2700.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/qtest/aspeed_gpio-test.c | 77 ++++++++++++++++++++++++++++++++--
>   tests/qtest/meson.build        |  3 ++
>   2 files changed, 76 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> index d38f51d719..03b3b1c2b2 100644
> --- a/tests/qtest/aspeed_gpio-test.c
> +++ b/tests/qtest/aspeed_gpio-test.c
> @@ -33,6 +33,10 @@
>   #define GPIO_ABCD_DATA_VALUE 0x000
>   #define GPIO_ABCD_DIRECTION  0x004
>   
> +/* AST2700 */
> +#define AST2700_GPIO_BASE 0x14C0B000
> +#define GPIOA0_CONTROL 0x180
> +
>   static void test_set_colocated_pins(const void *data)
>   {
>       QTestState *s = (QTestState *)data;
> @@ -72,17 +76,82 @@ static void test_set_input_pins(const void *data)
>       g_assert_cmphex(value, ==, 0xffffffff);
>   }
>   
> +static void test_2700_output_pins(const void *data)
> +{
> +    QTestState *s = (QTestState *)data;
> +    uint32_t offset = 0;
> +    uint32_t value = 0;
> +    uint32_t pin = 0;
> +
> +    for (char c = 'A'; c <= 'D'; c++) {
> +        for (int i = 0; i < 8; i++) {
> +            offset = AST2700_GPIO_BASE + GPIOA0_CONTROL + (pin * 4);
> +
> +            /* output direction and output hi */
> +            qtest_writel(s, offset, 0x00000003);
> +            value = qtest_readl(s, offset);
> +            g_assert_cmphex(value, ==, 0x00000003);
> +
> +            /* output direction and output low */
> +            qtest_writel(s, offset, 0x00000002);
> +            value = qtest_readl(s, offset);
> +            g_assert_cmphex(value, ==, 0x00000002);
> +            pin++;
> +        }
> +    }
> +}
> +
> +static void test_2700_input_pins(const void *data)
> +{
> +    QTestState *s = (QTestState *)data;
> +    char name[16];
> +    uint32_t offset = 0;
> +    uint32_t value = 0;
> +    uint32_t pin = 0;
> +
> +    for (char c = 'A'; c <= 'D'; c++) {
> +        for (int i = 0; i < 8; i++) {
> +            sprintf(name, "gpio%c%d", c, i);
> +            offset = AST2700_GPIO_BASE + GPIOA0_CONTROL + (pin * 4);
> +            /* input direction */
> +            qtest_writel(s, offset, 0);
> +
> +            /* set input */
> +            qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
> +            value = qtest_readl(s, offset);
> +            g_assert_cmphex(value, ==, 0x00002000);
> +
> +            /* clear input */
> +            qtest_qom_set_bool(s, "/machine/soc/gpio", name, false);
> +            value = qtest_readl(s, offset);
> +            g_assert_cmphex(value, ==, 0);
> +            pin++;
> +        }
> +    }
> +}

As far as I can see, there is nothing in these two functions that requires 
any of the other code in this file ...

> +
>   int main(int argc, char **argv)
>   {
> +    const char *arch = qtest_get_arch();
>       QTestState *s;
>       int r;
>   
>       g_test_init(&argc, &argv, NULL);
>   
> -    s = qtest_init("-machine ast2600-evb");
> -    qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
> -                        test_set_colocated_pins);
> -    qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
> +    if (strcmp(arch, "aarch64") == 0) {
> +        s = qtest_init("-machine ast2700-evb");
> +        qtest_add_data_func("/ast2700/gpio/input_pins",
> +                            s, test_2700_input_pins);
> +        qtest_add_data_func("/ast2700/gpio/out_pins", s, test_2700_output_pins);
> +    } else {
> +        s = qtest_init("-machine ast2600-evb");
> +        qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
> +                            test_set_colocated_pins);
> +        qtest_add_data_func("/ast2600/gpio/set_input_pins", s,
> +                            test_set_input_pins);
> +    }

... so the more I look at this, the more I think your new test should reside 
in a separate file that only gets executed for aarch64, while this file here 
should stay for arm 32-bit. Or is there a real compelling reason for putting 
your code in this file here?

  Thomas


>       r = g_test_run();
>       qtest_quit(s);
>   
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 310865e49c..292980e3ad 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -209,6 +209,8 @@ qtests_aspeed = \
>     ['aspeed_hace-test',
>      'aspeed_smc-test',
>      'aspeed_gpio-test']
> +qtests_aspeed64 = \
> +  ['aspeed_gpio-test']
>   
>   qtests_stm32l4x5 = \
>     ['stm32l4x5_exti-test',
> @@ -247,6 +249,7 @@ qtests_aarch64 = \
>     (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2835-i2c-test'] : []) +  \
>     (config_all_accel.has_key('CONFIG_TCG') and                                            \
>      config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',

