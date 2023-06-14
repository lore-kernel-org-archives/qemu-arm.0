Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp995667ejb;
        Tue, 13 Jun 2023 23:03:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xNYnuY2zgOW1CU8Y9PeEC46PafuhMIkBa6bpz+humcL+0XBXA6GPxovUfcnTwuSa4GpBf
X-Received: by 2002:a05:620a:2a11:b0:75d:4de8:aec0 with SMTP id o17-20020a05620a2a1100b0075d4de8aec0mr18868465qkp.3.1686722622609;
        Tue, 13 Jun 2023 23:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686722622; cv=none;
        d=google.com; s=arc-20160816;
        b=oKw1rW0LuX4vz3jmKywkQejs2CRBv5Y1sQkH8xdkv0SuQ9ac3GdEUgcx3DVSoE6yHT
         CIdfqDg5xCgEpB4bTBLfiNjpqI7DsEJRMTiMTa4FHaK4irdwmUCcEjwT4wKM8KhzUTHQ
         7VliVfPE00Ednq4wHUB+ZSW9Z8q2ACiOE1syD9QhFVsrIjvhfzUSiEw6+hr/CMGgBYD1
         RbmSp7djyKHKIlFiyyOKbOCLaXy3PqH7SQAUn9QUlh/sG25KVluTAyJcUj4kuFtkWHw2
         5o1hh/P3XMe36/+HeHqDVzlEDpIfq+14EYaLTzp2Yo/AEh5IakD4OZ7Bo9yjzfiKqUHY
         ahbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z1mflwoxiIcBk9lnaXGGSMIDSBExg6+3pv6d7Z4z+S8=;
        b=sqLn+7hoi1h0ScBQk2bVR3AmlGY5PNrVSiNmod6FgNvmGjeXjXix42O6EqxTsIGp9O
         EEo5xJ7HSBy02dHCJ3Z91SJUwYIWEbhZ18d0JnR/UJGYTSwVamC6tTk4kmVKYNoN6HzF
         VQ3LWUbDB4DV78QRaeqGH/zvDSYsggC/Myr1cfzovVW5lIZVcH8wHPYx87YOyEQSR60v
         as6C46o4ec5EQlnO+1xuONqXXeH1o9OZZgQCJA3vt/gsMX6jf3ZDeticrBGCe6CNfIxx
         5DSUt9Nm4mxf79VWPdZRUlR2X+qPtZHL7tGY0RbN8SQD+DVj4ntRCn9a1Ku48Bxtghjb
         oxMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVkHKrOC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o25-20020a05620a131900b0075eda85b564si8198034qkj.270.2023.06.13.23.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 23:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVkHKrOC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9JbU-0004bq-BM; Wed, 14 Jun 2023 02:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9JbO-0004bH-Ab
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 02:03:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9JbM-0004O4-4W
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 02:03:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f8d0e814dfso1696115e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686722606; x=1689314606;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z1mflwoxiIcBk9lnaXGGSMIDSBExg6+3pv6d7Z4z+S8=;
 b=BVkHKrOCZ9Q7rGH/9e+IsUckdyK7TVTeOZT506pfXHrQ+2KZf58fORbc5qHZZchg9o
 M2lHyQGceuQMKUBhwtPoqmGjS4kcwMCp3RjwSYBfqH6/zuqzpnIPN/bKYmw0/anPX0iQ
 Xqnb0sIo+xG0ppGsGlJ0PQKanvTH8QwvJB9riTZooBngQeOaQ0am10vnLByRAVuRV6Xb
 y1i1pP/wFSS87SH1AJ9sGGisF0B1fYcJ4ESkEh4sTFVzYud4dFI5LL/O1ehi+wmShYtK
 hF95aWmMkO6l4lmhG06+JyxZEpeRQCn6knLwQpVDiMxVzzvej5yBQeaWe7i2TQezpxcd
 Xwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686722606; x=1689314606;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1mflwoxiIcBk9lnaXGGSMIDSBExg6+3pv6d7Z4z+S8=;
 b=bAViv7kILPIH1DpC0zme4bEiOg97/kxgor9HdMemUQHGdNgk+eT4Z5JgHP2xfifzJl
 yf0uo/XxZH5npCAuF5AEvwKqJpJqUUwxENmqi5Ft2tjxsDSP5FoYhOz1vuQgWqDEU0Ew
 6emoM+2uuee+2vXxzvcRls4lFQPXzohMfzuIAHBdqn1ToghP6/m+KylkI1PePM6ZvB+L
 Woj6njlbixnIKZozarimFYkz+5vZSuT6L9SjcneDzMiVM8SR4KGvkfaHSCrIIlU8Tjiw
 COoQGmZxKDkw9xnG6KL5R/auQI28hxCr7qpQJx7ewQFWPJmuf0RIxFKqMcobG3bqIp9R
 siTg==
X-Gm-Message-State: AC+VfDz1FdGc3WP1GUMt0jRfdnssW3brNsF/zftoeszX9t4hRqT8LP0D
 wx31UgQogAJCyT/8ShZvFPOrNg==
X-Received: by 2002:a7b:c40b:0:b0:3f4:27ff:7d48 with SMTP id
 k11-20020a7bc40b000000b003f427ff7d48mr9406197wmi.19.1686722606261; 
 Tue, 13 Jun 2023 23:03:26 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bce15000000b003f8cd4892b3sm3581895wmc.3.2023.06.13.23.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 23:03:25 -0700 (PDT)
Message-ID: <d3444e45-a75c-4a48-eb18-5ea807aecfef@linaro.org>
Date: Wed, 14 Jun 2023 08:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/4] hw/misc/bcm2835_property: Use
 'raspberrypi-fw-defs.h' definitions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230612223456.33824-1-philmd@linaro.org>
 <20230612223456.33824-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230612223456.33824-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: aM+KyiMPg2rS

On 6/13/23 00:34, Philippe Mathieu-Daudé wrote:
> From: Sergey Kambalin<sergey.kambalin@auriga.com>
> 
> Replace magic property values by a proper definition,
> removing redundant comments.
> 
> Signed-off-by: Sergey Kambalin<sergey.kambalin@auriga.com>
> Message-Id:<20230531155258.8361-1-sergey.kambalin@auriga.com>
> [PMD: Split from bigger patch: 2/4]
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/misc/bcm2835_property.c | 101 +++++++++++++++++++------------------
>   1 file changed, 51 insertions(+), 50 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
