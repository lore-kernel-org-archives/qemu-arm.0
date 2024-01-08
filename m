Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp22970ejs;
        Mon, 8 Jan 2024 13:32:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkkmMTYu44Q28ZL/n7zN2vDFK99ezo4y28R1CViyuXBHJg/Ntej4NVUBH9cKORT5p4cqrs
X-Received: by 2002:a05:6358:948b:b0:175:6b16:437 with SMTP id i11-20020a056358948b00b001756b160437mr2595240rwb.41.1704749525245;
        Mon, 08 Jan 2024 13:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704749525; cv=none;
        d=google.com; s=arc-20160816;
        b=Xth43hKLEG0svvSVrVWmVU/+rjlZnAz/087rAOvgH472FKJAoAZugGRI4R5t0LoIyc
         99QsTxl09HbTs5lXslHc6FxpzNKj39F3ufPsXDRA5jBUwN08GlogZ32ENe8riM4sfYhN
         Vpq2xuWQ9RcfrGv4U6m/wE0yO9lafAyvR5qhf6y0pBXfIhKbcy5PIyXaeAGggWTW6+rg
         I/HmxEC6tonftoQlthjcJV3rUVf557SWE1huyNIU6G5VFUVmhtUZ9rNTkCIp5gKfoNyu
         1YxZHtwVVcMGdSEUF/QzEsyZzPSfb8kgvK7KaWH7n8+m5I7fByl0m0Lukvsgji3M1K14
         tbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OEhRa4ky0ClGTJnMw/IFLdTI/yN89QqMN3LqT6kC2ww=;
        fh=hq2byktaHg9e6xLRKdnSzEFtH/cMMNp2Rtm+HM9wgtE=;
        b=Uasd9LV1d8pUhiK8gcuyBewYFFM9y6toTRhDy7jWbkEf7L9Dtw8HDOvQAl+77ymEbq
         Dih32nSzBGsZTpoCP30fXflWqAxvJa98PdpblhFNmJBiT2oXpeDfBlggoNP11QZTC2Tg
         RDvR168RV19dE/D0SV8SWkt6q0hvGyiLhIk6gytawfTAdVaPldm5yhFJtOx/arbJ0fAi
         Nb59hLN8E3sSTekNs1qqCdd3dOrEn6ZURtpAO0/NMCn9jAgD/D5IS1JTyysnUFF1OGXS
         BLzzPEmZqb37stXEnIjrsEXmgssnONWVbqZoGxmMKk7budWd6WxUnKz0mzIWSQDWgOZb
         9YXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uARAAAEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020a05622a025300b0042977cd5f07si581289qtx.721.2024.01.08.13.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 13:32:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uARAAAEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMxDz-0003tZ-Jy; Mon, 08 Jan 2024 16:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMxDy-0003t2-74
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 16:31:58 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMxDw-0001g3-5m
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 16:31:57 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e43fb2659so17427325e9.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 13:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704749514; x=1705354314; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OEhRa4ky0ClGTJnMw/IFLdTI/yN89QqMN3LqT6kC2ww=;
 b=uARAAAEJcUH0t7OfCKtfzUh1G03xBLbFcoQ29LQHdxUGwc71MO6HlYbu9dylKu1b6a
 9Xtvh0vaJ6bwDJgowpnvpRNCI/NaYLJIyX/7+oEjPvIDLuns+nV0Dijm7bhY1U30N9HL
 0I+5a8GCmv+VFFe6u3UlZc6eOqtQa9/eKh/Xjh0rUr2Rp9vLeb4GOmMd8SD4czfKng+c
 OJjoSFBZd9N7UDHhCColfISX/PR+pnqkXj3OgdT1rwWfjIWc34QpPEYTOyCk+JTXVXMC
 7VfdE8UHH2xtV3ugn6fxBBDab8TN2apa0X89ynt8nYPwvUOT+leZkv0Sj2WhyI7kPu/o
 BRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704749514; x=1705354314;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OEhRa4ky0ClGTJnMw/IFLdTI/yN89QqMN3LqT6kC2ww=;
 b=Mnuxnb86sm7tPWAY8+/8rbIyZqQVDUaFx5fAIjdThsnSg8KZ+gJ9tllUwVhNOGrL/B
 B9p82ESYEXLt3OGzriG7MtnBr2oQ0rN8VceDrtTeF1TQAUjktQeXSZAjPYH76Tyz7/NN
 NBz7FpgK1XKDCp9ZBjc+X/KGc9K/bElkY6ZdlZaGWydB5MeXSGNs/YId4v8Ebz990DuR
 IYN9A5RIqPYtCanb5HWm1lRDOxLASsyXDAcuzW0DU+/VjfZRbu3JF/xm+pTsrQyPly/B
 INupK3X+SaES6bagD6oW4b+brKWfOg62+inR7LRrGF4WwSJAVCzx5ddynbSDSOi1yNev
 2zcQ==
X-Gm-Message-State: AOJu0YwLKa+8NSKnPJOndB4278mj6ItByie2Chp4wJj3aYiDwdbqJqAU
 YkHRzlU8HbJgMF3wYAnC6iP+Ual6Npp33g==
X-Received: by 2002:a05:600c:3551:b0:40d:8944:657b with SMTP id
 i17-20020a05600c355100b0040d8944657bmr2227186wmq.26.1704749513978; 
 Mon, 08 Jan 2024 13:31:53 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.16])
 by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b0040d887fda00sm1094810wms.26.2024.01.08.13.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 13:31:53 -0800 (PST)
Message-ID: <d4fcdfd9-8ead-4adb-8a88-0f5999fa9659@linaro.org>
Date: Mon, 8 Jan 2024 22:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20240108181104.46880-1-ines.varhol@telecom-paris.fr>
 <20240108181104.46880-4-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240108181104.46880-4-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UfUzjAviQ8g4

Hi Inès,

On 8/1/24 19:03, Inès Varhol wrote:
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/meson.build           |   5 +
>   tests/qtest/stm32l4x5_exti-test.c | 590 ++++++++++++++++++++++++++++++
>   2 files changed, 595 insertions(+)
>   create mode 100644 tests/qtest/stm32l4x5_exti-test.c


> +static void test_reg_write_read(void)
> +{
> +    /* Test that non-reserved bits in xMR and xTSR can be set and cleared */
> +
> +    exti_writel(EXTI_IMR1, 0xFFFFFFFF);
> +    uint32_t imr1 = exti_readl(EXTI_IMR1);
> +    g_assert_cmpuint(imr1, ==, 0xFFFFFFFF);
> +    exti_writel(EXTI_IMR1, 0x00000000);
> +    imr1 = exti_readl(EXTI_IMR1);
> +    g_assert_cmpuint(imr1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_EMR1, 0xFFFFFFFF);
> +    uint32_t emr1 = exti_readl(EXTI_EMR1);

Per QEMU Coding Style [*]:

   Mixed declarations (interleaving statements and declarations within
   blocks) are generally not allowed; declarations should be at the
   beginning of blocks.

Up to the maintainers to accept as is or request a change. Personally
this looks good enough, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

[*] https://qemu-project.gitlab.io/qemu/devel/style.html#declarations

> +    g_assert_cmpuint(emr1, ==, 0xFFFFFFFF);
> +    exti_writel(EXTI_EMR1, 0x00000000);
> +    emr1 = exti_readl(EXTI_EMR1);
> +    g_assert_cmpuint(emr1, ==, 0x00000000);
[...]
