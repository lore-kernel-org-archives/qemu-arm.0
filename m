Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp211552njc;
        Fri, 27 Sep 2024 02:30:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBZ3wYhic2Q2cYxsHU71hLHlYtw+c6KE34blpj6JOkeiApP1zuS5akP+v8+5LSRNyrfXfQImF+rzR3lQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEsa8BdGz7Lp71Csou/ORpaXEo0IJJHV/D1dN5nsTen/Up3cx5asd8yXbQgwaEmlQpPSvgk
X-Received: by 2002:a05:622a:287:b0:458:5441:362a with SMTP id d75a77b69052e-45c9f2a7aa3mr27915261cf.58.1727429443359;
        Fri, 27 Sep 2024 02:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727429443; cv=none;
        d=google.com; s=arc-20240605;
        b=GtGg3ZqsyfeTNpKPMBWmd9M/rBCosU1SUupMaCZ94WAntJ+tW6z5O0oAHUul0OCSty
         Uhp48eKwYPz3Ozzrh6M+QFedeTOR6ErLOxCX7u7wXgUxsdnaMQtxeASYkZCkfyv5AYlc
         ennbQ20I3CI3p4UrVNM67DbSXFC7duf8Gf7YGpy/h1KhylF+ISfUFlQ6ZRyfLjmSXCOG
         RJ52UyGJL0rmPsaxmmL97XT+dOB+0P03gvYM/EAT5FMyDja9TF5wFOAMiA3CiUmBOBwC
         kuuRTZ/W6AgVqwszTwomLQEhIyPybkb4L578WZC81+9fjKTa6Yl16ppNvK2ycZelWfPT
         sInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=05ZE16n0d092iDI2xtV1S/GyJvgOevhxTLSnFokSsiw=;
        fh=A7qH744epd1KI6TZXL2Sdlr5koE/9DpTd2zxPLL44x0=;
        b=SDzQbTsAjD30y040f+EFcbW8vt2kOG1hs05Q0EGR3XUPLYli/gLa8ZGGJ8gxvfcHky
         ilbuo0uyyQzzH02kXHVrDBzyG1Fw9/K8QYrEQtjOGtulVwEgRk4psL7pd01eqgEkx0Tt
         FsqTpoQ5eJJsWO2RTya2Xo1JKBRx388MPevl43XJl07KU8TdcS1jhndv6ll6BJj61SzD
         5VLewmHb/fyx+Iehv1uJxkFhel47N2DDzQEzPI8e1tuOPXvgWVwnDUHGF98AKhqhNb22
         CexLt72zZnoFdrafnRfN9Amo13ytGd5UKu1gGt9d8Aif5t9I+r5Si+qY4u8Mw9G6wveR
         qgIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SdnGI1QN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f34e19asi17611971cf.504.2024.09.27.02.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 02:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SdnGI1QN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su7IS-0005WV-UQ; Fri, 27 Sep 2024 05:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1su7IP-0005Lv-Tc
 for qemu-arm@nongnu.org; Fri, 27 Sep 2024 05:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1su7I8-0002WX-Dj
 for qemu-arm@nongnu.org; Fri, 27 Sep 2024 05:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727429374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=05ZE16n0d092iDI2xtV1S/GyJvgOevhxTLSnFokSsiw=;
 b=SdnGI1QNqABG/9ojpyyKDqbvCX2o5ZDrtmxJAHM5lyH5E/aByZrANrJXTrE42Lz32tr0VW
 XOlDPTRa5wH9+IDYApuRgAYHaAA2iEQTSPe2EA8vXi3nhqCCbdNIK1dYgYeWtkOwFKtK4E
 hSEHzC+WlbbNyDbAqNwUHesMTwF1tmE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-xCcGfm3JNvytkqGxGv7a1A-1; Fri, 27 Sep 2024 05:29:32 -0400
X-MC-Unique: xCcGfm3JNvytkqGxGv7a1A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42cb2c5d634so12096725e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2024 02:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727429371; x=1728034171;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=05ZE16n0d092iDI2xtV1S/GyJvgOevhxTLSnFokSsiw=;
 b=GhqggDewJEhllueFfaLVUjeM4Il98eoRoUaTe3eg6M+baNHk3iGqCy5Y2gLjH0OKy1
 eTZx1HCCOrwrKy1dBe65VrqX+UuTTTfYjSTERPRmsEmeEO6e0UlqbZ8w+aBKLpRoGwg7
 Zvri4Z2BsKPNyzHDaPw+1rOyHlNKHz0Qc1Q3a+MzYne+V43ct6j/RpNIB7sqfnCHKkHs
 R0DVLTRGvfPI0D3vut1iLmLNtlsjB+8TcX0v12m1NikhGx0kCPtzUxmpGXoXBZ2m9X+w
 z43IMOusBo5BJYGfpzqDzJf3i7svGJg5jXxhfXFQtCBqmsqcv9FXxOcMgNzd5MCgc2Hg
 c0Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ1l+IWhyFhkOUtbLNtpfy7yWF1TswI8XiItav4NjD7oG/CPe6Qtcm7/wTKgnDhdc60aevotfqug==@nongnu.org
X-Gm-Message-State: AOJu0YyKayhycQkpOlMyC6cWrZ/73milOvS2+D9JEsRnidmK1KbTEwsK
 YSwWyy31xnO4MwxJLucywPoevmzd+2vj8YXmOGsqn9KdvRyR/O3KWTniz+KQw0qktP39W004Uye
 GPuddGJtXBu4zmdVIRNfVzJu9e/I0f0AU1SWeC+hgzpzCmJ7CaA==
X-Received: by 2002:a05:600c:350f:b0:42c:b34d:720c with SMTP id
 5b1f17b1804b1-42f5840ce88mr15635405e9.4.1727429371603; 
 Fri, 27 Sep 2024 02:29:31 -0700 (PDT)
X-Received: by 2002:a05:600c:350f:b0:42c:b34d:720c with SMTP id
 5b1f17b1804b1-42f5840ce88mr15635225e9.4.1727429371154; 
 Fri, 27 Sep 2024 02:29:31 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-48-176.web.vodafone.de.
 [109.42.48.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f57dec169sm20705005e9.21.2024.09.27.02.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 02:29:30 -0700 (PDT)
Message-ID: <4d4a0c9b-45df-4d2e-b47d-f9ab898801cd@redhat.com>
Date: Fri, 27 Sep 2024 11:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] hw/gpio/aspeed: Add test case for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
 <20240927083351.2637798-8-jamin_lin@aspeedtech.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240927083351.2637798-8-jamin_lin@aspeedtech.com>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.131,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: x48tVGSBs2v/

On 27/09/2024 10.33, Jamin Lin wrote:
> Add test case to test GPIO output and input pins from A0 to D7 for AST2700.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/qtest/aspeed_gpio-test.c | 68 ++++++++++++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> index d38f51d719..9d978b70e0 100644
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
> @@ -72,8 +76,64 @@ static void test_set_input_pins(const void *data)
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
> +
> +
>   int main(int argc, char **argv)
>   {
> +    const char *arch = qtest_get_arch();
>       QTestState *s;
>       int r;
>   
> @@ -83,6 +143,14 @@ int main(int argc, char **argv)
>       qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
>                           test_set_colocated_pins);
>       qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
> +
> +    if (strcmp(arch, "aarch64") == 0) {
> +        s = qtest_init("-machine ast2700-evb");
> +        qtest_add_data_func("/ast2700/gpio/input_pins",
> +                            s, test_2700_input_pins);
> +        qtest_add_data_func("/ast2700/gpio/out_pins", s, test_2700_output_pins);
> +    }

Are you sure that this is executed here at all? As far as I can see, 
aspeed_gpio-test is not executed for the aarch64 target at all, so this 
looks like dead code to me.

  Thomas

