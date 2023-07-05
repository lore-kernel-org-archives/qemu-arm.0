Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3664140ejy;
        Wed, 5 Jul 2023 08:41:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4wwLJutU090Se73/W92oQ7faKZVSYq6odThoTD181li1Wavt6SwxumK0XCrUlzJYgYatno
X-Received: by 2002:a05:6830:1096:b0:6b7:30cc:6419 with SMTP id y22-20020a056830109600b006b730cc6419mr14175153oto.1.1688571673853;
        Wed, 05 Jul 2023 08:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571673; cv=none;
        d=google.com; s=arc-20160816;
        b=AWdk/CxD7i91Im7+fkHLJpRU7V60dacbkFUOBXYZ+DliIXy/d7acvqf79PiFaE9RFJ
         ehQ6E0j/yOjX7GjU7MOq1Gg3voRTf5rXlRmIMA8eTbQ3akZHcmvHt7NH/ys6ZKXvuXaS
         SnIwGtfQxK1A4jS1w6XsEAdnVeaBWtn+Vl7mipGh024wkInIaTvTFDOU0Ulpav5nafR4
         mbJcHdhJjNbRc5Y4JahZezWWQVzqcn6AayNnTj+LT7Zzswz91Ym0xF/xPYz4Hr5vqdZw
         RYOXKVdumOH/LCjA69EdQzAAA3nClisO44NbfnpFxFQOz6rhgM4FMlWD9fXu0yx+5X8X
         A4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=63v8MvgHzFrmnLCG9jUQWQLThc4dtGA6q7ee9vcXv7I=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=Qof/ut4DKPQ0QVXM8hqXsTwVjfH+pM5+XeszHXmHOBcOzahW+VbL208fCZJ+a/fvTq
         5eTJ7oVvz3XK7dtT1cHkFls6wdTX6iSN+idY1LjYrDS6/3lbpw/hHE9dYSGK2Izuzwyw
         SLhc1i5lFZAwLUMXq626en/ZEbMEF041SnqDhkam6H1cHF7Oin0wuzB+jSR7CoC22v3B
         ql7qOTEWQHsA+3C6v5Vk25JtXXWpUdMVGUanHrrJB9wge+qZREkQiKCj+Q5HBqxfIX1B
         GlSbdIgrmb82+famqPFyKoPbHPkoqyLyL71Y8iBYCDdgBE/TL15pRWE2wQ1Puge6B5lA
         LTuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7hn+dZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a05622a018100b00400eddbce1fsi13621335qtw.685.2023.07.05.08.41.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:41:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7hn+dZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4cy-0000Zg-VN; Wed, 05 Jul 2023 11:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4cx-0000Ur-LN
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:41:11 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4cv-000113-S7
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:41:11 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6f97c7115so28675911fa.2
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571668; x=1691163668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=63v8MvgHzFrmnLCG9jUQWQLThc4dtGA6q7ee9vcXv7I=;
 b=U7hn+dZRH+zREblWmTyV65j/RZCBQaJ+2hKaxR4UlRFdirxXgMYWVEHJlj0DQfCP0v
 mPQI2Pt9AuBUNVN2m6LJB8olXNGkbjBQz+pW2Mp2A3Sy393ikiCaWojippP1TLY+ylcF
 Moqg0HMbULWwmAm/pvMfFylpNeou9bl1UcFA0UDdPMW9HmK6e6YrG0ZJVgUqsYmnimbl
 W5zwqkGUk2vxBjRlx/473s6qM7v3PaeZEE9w97lzeuL3xdS61h9+QwDhj+f4G9rYZH34
 iQbkEWcSoll2alO7iJZBuBTdibdWz2Da0pzZ27jjYRsgYRHT6z+/PrpjOdYDQksA+i0y
 IZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571668; x=1691163668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=63v8MvgHzFrmnLCG9jUQWQLThc4dtGA6q7ee9vcXv7I=;
 b=DuDhKkc0819ujvi5Ugjnlf0IYTNynjtzx1q+UiRkSqZVPr2qcjo4k8PbEL55ix0N89
 TRnn26VXn36Y5NZoPnsLItNg7BUrCg87dQity02f38bOqpDkldyIGurKLTdboeqpDGw1
 RHCG8r/l8FDmh8MQUBTyNamuOCBC6pbOKXzqyYL7O3c6i+VwIT2stRtwcKL1aaJzOzO7
 /viBcp9SWECDT2E+eK26zrOPgEluZPKFallVtGFuyTEcTSugBzWjbpBws2u5pr3mX9EO
 wF0A4W3VgwiJWq8QoCZGNHAExhAFgXRuTwWJqzO9//RgGiRyg+JjHR/ZOPiyifVcJ8Ni
 osGw==
X-Gm-Message-State: ABy/qLYD0Xb+wpKmCRLD1pug0AZVONF+Vsgxo4ycUgDPTHMm6jgjwjHt
 a+OsUMgQj8kzNzc1w7xE60z4rw==
X-Received: by 2002:a2e:9252:0:b0:2b3:4ea3:d020 with SMTP id
 v18-20020a2e9252000000b002b34ea3d020mr11397565ljg.17.1688571667885; 
 Wed, 05 Jul 2023 08:41:07 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a2e7001000000b002b484bdae08sm6322243ljc.32.2023.07.05.08.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:41:07 -0700 (PDT)
Message-ID: <d869697c-0d15-b18a-1f92-19df8d5d536d@linaro.org>
Date: Wed, 5 Jul 2023 17:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 16/19] hw/timer/arm_timer: Extract icp_pit_realize()
 from icp_pit_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-17-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: jRNCit6ybkwk

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> To make the next commit easier to digest, extract icp_pit_realize()
> from icp_pit_init() as a preliminary step.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/timer/arm_timer.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
