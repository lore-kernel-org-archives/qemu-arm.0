Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1140193ejb;
        Mon, 5 Feb 2024 05:53:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCG+k8r0NgaFldrqMX3957cIO/7aCxVDto7ZYgurV4/UQTKRy4s8scFjA9VFRIKbYPvlPH
X-Received: by 2002:a05:6808:144e:b0:3bd:e783:3df4 with SMTP id x14-20020a056808144e00b003bde7833df4mr18960466oiv.47.1707141180484;
        Mon, 05 Feb 2024 05:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707141180; cv=none;
        d=google.com; s=arc-20160816;
        b=rVm6qk4bxHj3SvBhhRR57vnQwC2QOrDHm7o9Lw3z5uyDVzWkmC+agaHYO5vH1DhMof
         Dscgrkj4rjUmxN1dMe7r6Pp/dBm8b5LT+wi8tjj3AcgKQnLpbljUVj9JhJl7Mp0WsYqp
         NtcLUJISdN6EtjKM5MuBNMFGBF7IMepDgBV6hP7GyLy1fy+2pMffLTo3EeYLrEtlHDpj
         T4kg7WMYaXkxVX38CBPT5g8Il4i7ofugg9o/Q8cXUPZM7jqxVfC2zf0ZCVecnBoZFiZi
         UKfDy96bCsoh97iJHK+5piwzYFEJR5W5TYEcwCR9wGprQlk+6XAihk663SuiRcuJ44gn
         EG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HVbRqMnYEeQsQiEDTFTHE/RBaF3wOwp5DqDF4yy/N3Q=;
        fh=At3m3nQHzhR/kEugQAwLrU6ItX/x4c3kx5nFr7DGkmo=;
        b=ei7B6F4UxsLmNDunqot6HjNl0SmdtwUGPpiPLmXr+HwbFQT+5XYSau+lNxGaMW03ct
         +W385YFGJigL8wYn4AIEi9qiDzWHRX8ZESn3l5Gfyd6uCi/llfaG4VwjWg2nZ/Crml2i
         H78hABXzjMklYRzU8MtRlpL/KiBdm0BqPN4bdBYVx9yFJk20SaVcHUUod2QvbgC+f6am
         uzzgOxR3docS48joKti0W0pbdLCXrN1HtXmOLbwg6dtrhODv7ev5MNFUCjhxD1Aru1yb
         StXhMyt9Fmv9eK7jTl4W1JzDO0XieY2FzrVq4Trzw52lqAMZXX7Ll68WozXHy25y8ZDm
         uO7w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5U3Xtqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXVNLAm9pi7tYZcNhsr2mWzsxetPIAD8d9jVLpWOi8ljj8lgR4mRs418uJbkzzpMvA8lveMxUpWxmLTIB9aSkuXGeic9JTT
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1-20020ac87d01000000b0042bf9849fc8si8654458qtb.31.2024.02.05.05.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 05:53:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5U3Xtqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWzP0-00013F-Nf; Mon, 05 Feb 2024 08:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWzOy-00012U-UG
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 08:52:48 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWzOu-0007Oh-3p
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 08:52:48 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so40602565e9.2
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 05:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707141162; x=1707745962; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HVbRqMnYEeQsQiEDTFTHE/RBaF3wOwp5DqDF4yy/N3Q=;
 b=H5U3XtqfSEp4C71bz9kF4b6zTHTGuaOboEIKZV2g/td6kuCZpEzt01M52Rdc5Q5ifw
 y1ApmhP82rHSrW6C3hiOzup+vxpnG8ZjjMB5G1d73CuPW4bhqEU4Tr/6Xei3pV83l3ld
 NUZraTj3GDYYx2by8d5YBfAj2OmEbVZ6qOvTp9W0YMRyy8PjUPzJ1G7BQNy0BwH5kbx0
 I8PU4Yl+ZLWHdSiKODvqdWNfrwqcIS8P023+DCK8O35dIm/ixYJnmOiunTc6HpqXBm8e
 vCpwi0Z5xcZkw1qdOGmM/e6VvohwuYBQKFAtwsvHd7R+gCiDyvGAcDxX1o0ohuQAcpwj
 hx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707141162; x=1707745962;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HVbRqMnYEeQsQiEDTFTHE/RBaF3wOwp5DqDF4yy/N3Q=;
 b=qbOz7NLOdmoaZeJOGaxEIJTASxHtjMNwpbcAr65NhfQ5WTH273nUQfih1PAAXnq/+Z
 0d64xMsUMeg89ycClRcSpsfyQwawCPZhoISPWt7ZZYcquGzCiHcG/eJ87Khb790iLywK
 /ohhqEchzQRPkBXE1zRHZQdf+2Qh2Gh4uA60SBD2De0hymjXV/7YvTkjv8f2qJhYQknY
 vVrO9kXEx5AsuFUI7m3a1hEi1FJea3twi5oyUEaA4NLAiDUcFQ21nkY6tHc2K/oHUwkX
 85s4joicje/pQqOJFtj55STvp+C6+IPtISH3XpTIIq6eDHzCwMm4KUnMJeIbnPYxO7dg
 07hw==
X-Gm-Message-State: AOJu0YywGV0WPHN8eY4gmHR3qZHxHFPcykUU6LSpyqM63KUQvgQoc7Nc
 Tqx1pIYP332HtO57PTIyoY0UpLmkcxmLJcFbpa2jh/FW5HaHHc19lmCQZXzLEMk=
X-Received: by 2002:a05:600c:4507:b0:40f:df31:6cac with SMTP id
 t7-20020a05600c450700b0040fdf316cacmr69897wmo.4.1707141162022; 
 Mon, 05 Feb 2024 05:52:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWpior6GQUz12W/5pOp0gKAtrNIgbZJlZ14UXG8yRyg8wZvOQS6SFLqaKOs7Gb1VmRaPe4lATM9Cab2uIavTAF4Ki3qsH3WH68WKA0dU8faR/Oyvyfz4wN3DvjX/0BkV0L3Oj8CT5PGfF1ZjGXq+N3OyC8+jBwO8IxMFlchEcbGpMAjQpZ2tvffyD559Fd+jXXVbc2hfkQ63sQgtzharAGoBZq0zFgMWLnc5QtdD3LweIwkVoz4AENjxghdoG8lP22W+rxHHsVaqQEF427TLJ3RI1SJV9GDGXI=
Received: from [192.168.197.175] ([92.88.170.125])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a05600c1c9a00b0040fd3121c4asm6753455wms.46.2024.02.05.05.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:52:41 -0800 (PST)
Message-ID: <909745ef-b3dd-4af0-b4dc-e2be9e76cd83@linaro.org>
Date: Mon, 5 Feb 2024 14:52:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/qtest : Add testcase for DM163
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <sam@rfc1149.net>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20240126193657.792005-1-ines.varhol@telecom-paris.fr>
 <20240126193657.792005-4-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240126193657.792005-4-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yVtjBWxvRuer

Hi Inès,

On 26/1/24 20:31, Inès Varhol wrote:
> `test_dm163_bank()`
> Checks that the pin "sout" of the DM163 led driver outputs the values
> received on pin "sin" with the expected latency (depending on the bank).
> 
> `test_dm163_gpio_connection()`
> Check that changes to relevant STM32L4x5 GPIO pins are prpagated to the
> DM163 device.
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/dm163-test.c | 192 +++++++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build  |   1 +
>   2 files changed, 193 insertions(+)
>   create mode 100644 tests/qtest/dm163-test.c


> +static void test_dm163_gpio_connection(void)
> +{
> +    QTestState *qts = qtest_init("-M b-l475e-iot01a");

This machine is only available in ARM binaries, ...

> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +    qtest_add_data_func("/dm163/bank0", (void *)0, test_dm163_bank);
> +    qtest_add_data_func("/dm163/bank1", (void *)1, test_dm163_bank);
> +    qtest_add_func("/dm163/gpio_connection", test_dm163_gpio_connection);
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 5692da4fc1..e9f6ac46ef 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -22,6 +22,7 @@ qtests_generic = [
>     'qos-test',
>     'readconfig-test',
>     'netdev-socket',
> +  'dm163-test',
... so I'd expect the test to be restricted to ARM & DM163
availability:

-- >8 --
@@ -206,2 +206,3 @@ qtests_stm32l4x5 = \
  qtests_arm = \
+  (config_all_devices.has_key('CONFIG_DM163') ? ['dm163-test'] : []) + \
    (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : 
[]) + \
---

BTW please consider enabling scripts/git.orderfile to ease reviewing
your series :)

Regards,

Phil.
