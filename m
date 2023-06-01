Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp142667ejb;
        Wed, 31 May 2023 20:10:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ70LjQ7ehaCOPlZl9PS2CCj0uQMk5WF+1aqQCqyVfjEuFr+SCrHpP99DLm8RO75viCP43/o
X-Received: by 2002:a05:6214:e4b:b0:5ea:d52:7042 with SMTP id o11-20020a0562140e4b00b005ea0d527042mr8388648qvc.31.1685589018817;
        Wed, 31 May 2023 20:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685589018; cv=none;
        d=google.com; s=arc-20160816;
        b=r+q2Bphp64jnV614AYrk9xk2ktufE7NduKJoW0JC+ACU95LhYU4nTeDZjzCDRT/Hl9
         XxzniJtp337zAr/Y+bLmRA+zSyN9tx0AnC7arUiILkBXkl2+dWzEkubuft1ji0AGtKZz
         jMmNix589lX3ovQmo6KEGEyhxjJEqzOkfDJjOiU4H1tUOIzp5G8m5oASUkIa9+4poq66
         s0hZZmR5TyMkJD0axPolQ5M1tKuYms1/2qdUXVVtThd1+nFcuuCCNhRc8jm1+soOLoB6
         2gNATJDydAXOdr3ilc8R8arKTRm6gew2JHb+CGQcFMR778jOGAhDopVK1qJyzjlqY125
         5qHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=376KjYjs6cIczYw3jg1YphMynMdhpj5XTJNtf8c9HIE=;
        b=0zSe2LZvj1GCrDJqsLGWQDjDsPsA7zIqAFH522Yieiy1IAx2M1wSgoMenWYx3BA8uM
         NNNpBYeqyASUJqWZtzv1sTCNTA6p+dGKMnFgYOgi7L3kQnzYlmABBBbn2fXEpgIpS98R
         QTZogPrVf1kf3QLLPR3jcNjGSyrdvPo4MzIEATeIPs1er52WU0okotj6t65lDlQ/B0rM
         qB1SNuxX0mCfiHtFgBQiA/v8ghbvLZ5wfbvJag0Zk0RRw7aknt3CWm0ruibdz9NRJxmg
         omLBjvz2FZCet9vMQR5SU+aVWtWc16InYe8IpKt60GuJdDlI8RiqIQbjGABXAziQrys7
         sWGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E9DASwS4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv9-20020ad44ee9000000b006283c2f6d3bsi983797qvb.120.2023.05.31.20.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 20:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E9DASwS4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4YhB-0002rD-5l; Wed, 31 May 2023 23:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yh9-0002qR-FN
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:09:47 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yh6-0001Qo-Qd
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:09:46 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-39a53c7648fso232375b6e.1
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 20:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685588983; x=1688180983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=376KjYjs6cIczYw3jg1YphMynMdhpj5XTJNtf8c9HIE=;
 b=E9DASwS4NS9TW9ms3TYpHBm+sAIB2AIZCXflW15o0LuSG/l6oIA6LzEvaW8lnPac4C
 Yz5drjy+PNZsUfWaUIZbRx+A1MR+7R6I6lRkm7l628LWKN3IDXOgCGrmIWy4hN8sTU/C
 zGysWg1u146/drxfygxJ34pOYEBuJispDR60pneJ6TPJjJn9jMwKwCDk13n+U1YC+L27
 3roLkfUYPb3wmvi6lh4wSY308a7wAOCC5RHCcouYqaioQK5qunUzBlhKwnEOgThIxVIa
 SyMRCZ2+bngLA00wTnKTAtNBtUBx/dP+keHWC0TFxOOyhCKd5dEb/Or+9StZfUMow9KL
 VAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685588983; x=1688180983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=376KjYjs6cIczYw3jg1YphMynMdhpj5XTJNtf8c9HIE=;
 b=h1NevCJkgskpk4VZ1rg0t1mN4B4P+2PRiRGr+Se73THhUg8716Yfu7UO35IdH6lr0t
 O1SctPb85oC6Fcf+8HHBCoZhfjbYdAG4f/H5nHnA+qUD7uxvkkyYy8qbhMNWPZZlpf+j
 IQ93xG788S5Z8Eeyos7hlOjRf/NqaX7ZzWFKNU0jZwXxpHhZo5hzsq8b2bhFgElDBdT+
 YndIHPWffbbo4UJVeG9LRdJc+8KzFm2ISTaZEC3oPqfKCtFAknMq1X4sVNCAPD9ljqs6
 Buf189kH+bKgwjIh6m089AC4fFUKrQTq3TTEWTkxkuxzci2pvk94miiocHCVDkoUmWI6
 jrnw==
X-Gm-Message-State: AC+VfDwaicUjq++xtzcUDgmBTLqnTZqYjSznX1+WVtPyFnslSVADpQsR
 0VW+J3TyUNxuK8Zcq9Npqv3fYw==
X-Received: by 2002:a05:6808:8c2:b0:398:36a0:d42 with SMTP id
 k2-20020a05680808c200b0039836a00d42mr6020755oij.39.1685588983605; 
 Wed, 31 May 2023 20:09:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7?
 ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a170902760600b001b1920cffdasm751783pll.204.2023.05.31.20.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 20:09:43 -0700 (PDT)
Message-ID: <edddb52e-d8e3-55e7-6c16-869e08160125@linaro.org>
Date: Wed, 31 May 2023 20:09:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/7] hw/usb/hcd-xhci: Use sysbus_init_irqs()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230531223341.34827-1-philmd@linaro.org>
 <20230531223341.34827-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230531223341.34827-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: A7BKUGmpOpWm

On 5/31/23 15:33, Philippe Mathieu-Daudé wrote:
> The SYSBUS_DEVICE_GPIO_IRQ definition should be internal to
> the SysBus API. Use the recently introduced sysbus_init_irqs()
> method to avoid using this internal definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/hcd-xhci-sysbus.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
