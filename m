Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1627356njb;
        Thu, 9 Jan 2025 07:54:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWL7KkKtzOtPY6NfdVWzi5o+sZNDQTsVECEfLHugekl/8dteh/FoGW497TaDIrQlRJcRWL83fXWY0jRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG8MZa4UmStO4PwQ30ImquoZtyXWXAdKneLaailT1xwS4gZ+BScH1heA62/DG7CPpEmZ16i
X-Received: by 2002:a05:6214:5404:b0:6d8:a610:21cc with SMTP id 6a1803df08f44-6df9b1bb685mr98634136d6.1.1736438048693;
        Thu, 09 Jan 2025 07:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736438048; cv=none;
        d=google.com; s=arc-20240605;
        b=kF4OjvYXz6GMj4vDw/ga+XWKOObs06DchMgbR/r7J1Yn3bYf8CLnWHcPdOxurYiCgp
         Cg130SwvmsuR7CDL1rhs6MceKD3G4YdZMMNKmWNF70z0gM234R4V1dPq/y5l+OUJIcQG
         lCDitUV5rOfjbESc/hVf5u+VCr7zRZSfytcuZbj454xdHLDl+FExyHDQEsDnOrMYhff9
         HHXyep1maZVnvi3sqxKUfxTtQfuEBTY6eNubFaZ4rOrrsuhK3yfrcCLcic1gHPCl/uq+
         5AHGU8lZL75aO/L8a07iW+GAyb2lTsGIyK+uDkez0NkrAt+nMRGJjTLCB8XnmHiGupNP
         SXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PxAYVqsb6CEaTqgp8MsnpCsVpeTXhTf0kuyXHkUfDRI=;
        fh=cXX/8ks6fvlJRvUJdEfHPd4t2jL63NwAPdBCU4msZDk=;
        b=F7BT5k0KkDO7D2lQqyOVNyvWUGeH65DwYDOlNNvLL1cPA5Uf4xZQW3pvf4NlH49Z9y
         orM0UyhJuhoMnOx7jPUrhvi3rNwUwU/+KgbGZ2yrZFg5TJBqwcbtRk+igwYnVVIetm4Y
         Jcmaykz/RHV+3wtk+pZO9uwdnx3bWUOdt62mKxYfTB0rzc4XZStQPmvqX7gYXXmI7nSS
         KtzHzvIMScD0qqtRDNegQwezAD/3a8Easapj9viJO2znWhVNjbMUC6hdIwPe9P5zOtlr
         V/sXBGuywo8DfkD5+jjqIrXwVN2OKFW9GHifdYms1ElsT0NY3pPmfkCp/A1Dp0h5fVQm
         ahKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQ4dup5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfad27c898si726416d6.223.2025.01.09.07.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 07:54:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQ4dup5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVuqT-0006Hi-A4; Thu, 09 Jan 2025 10:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tVuqR-0006Gu-6L
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 10:53:15 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tVuqE-0002Sd-CJ
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 10:53:14 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21661be2c2dso16783375ad.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 07:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736437979; x=1737042779; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PxAYVqsb6CEaTqgp8MsnpCsVpeTXhTf0kuyXHkUfDRI=;
 b=TQ4dup5Z6K7iCEp4Xk7qrzd1mQuN3m7/9hSoP3hzhrFImc06Xb1yI3B4eWAwzwADaZ
 YP6a2PgN0xC7Q07ArDcAlS3WCxbxPJjYU/ZqQxgvzKtfEDVti5Sj2mui1r+C/U3xJ8v8
 eZMDGjg394GruVIqDxYhNaW0sQv+6AR4dA5zxbHM6MIhJXETGkt4sWIRM/RfzREyyUie
 thCdYgFeL/C7np6HmTFggyXlwqQRgsLlvdjbTzVUFuMrTnQcw6I1sXkCAR7FBO1KntKJ
 3cdzB1P4mklrgpZNE+PKwpWATzxlw2KOUQqNqgVkQRBvjVOfEo7pBHQyy+QbUkgCnk7j
 Jspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736437979; x=1737042779;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PxAYVqsb6CEaTqgp8MsnpCsVpeTXhTf0kuyXHkUfDRI=;
 b=M5CailQwA682cydpdF4sRoWAV/0mX7JnJmwwHLmmOw09yJyX51+NUqefCJypKf8uWo
 NdU6WCWIR7Y6KoNmDLCoq8OQZPJ6WEHkx3g0TPrhGJsuPi4voGPg3UC52PSsoX6iCgrt
 xhMJqm7FTJ3cuA+vj4qsnpbXB+IS8NTcQ8MxBYoYQlwvJAHuJNUhfO/8mslAv45jIvmY
 3yJG2saHaBSQ4M3jMewtWp6kE4hjQzAcPA6cRRLoCc9DhMt3zfq90KTqr6PrKPJDJAw8
 zgZDnwGGH+oMvzqyIZoGOrNv0C41Z6k7WEgkeo+X6kHWfiN54v0od7jdJIJARXuMWiIf
 7BhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEC2mqZYiFNxgKJUaZKzJDigdsQ0ETvJQuY7cqQn+7aRmobwaP7v2qnq5J9qn4NqA1C2ITTOn9Ug==@nongnu.org
X-Gm-Message-State: AOJu0Yy4hR5+S+X8iXR/7L8biVMWKgonUPv4B8WVqQJCiEdLAsePdmyV
 QafpAIkQO+Y/FMKjUVfoDB1+sZ52+GttFcNIy1p0MDoXhCCJBA1PxWAw2MMDpR4=
X-Gm-Gg: ASbGnctQyat3FFJjvq3WJN8lZAei62HTMKKaNemRCzUFmVJokUzyLD/lKvpUjzTKE3G
 BMRCEgCmYE2OzV/0W/995ZdPfodVjHp/899kbVVH1k9c/m5bEFvN1bJ/6RySJQiwQS90qRaPTuc
 hd1H3gzmUIdzxA0LdEB2vQiWiO5ayztRaSJnfi2Wj7Dbqd4Z7SlxP6E7DogHa9Hjyz8Rf7+9bJp
 BpPoBOeZP7wBgiRJfMR55y/WFuLvvqh2DM3Vzo6ft8AGJR6A7Htryvj1+ElLzkw4F2i3/MrVA0V
 s8gjc98kha5ffZ8OcaE9lIPj/X8IYKo=
X-Received: by 2002:a17:902:dad1:b0:21a:8716:fa97 with SMTP id
 d9443c01a7336-21a87264051mr78793795ad.13.1736437979149; 
 Thu, 09 Jan 2025 07:52:59 -0800 (PST)
Received: from [192.168.132.227] (76-14-228-138.or.wavecable.com.
 [76.14.228.138]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a91766da1sm14415255ad.46.2025.01.09.07.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:52:58 -0800 (PST)
Message-ID: <1612c0c9-7c45-4bda-a977-8b7cd51ee0f9@linaro.org>
Date: Thu, 9 Jan 2025 07:52:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/cpus: Remove pointless re-assignment of
 CPUState::halted
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stafford Horne <shorne@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-ppc@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241230153929.87137-1-philmd@linaro.org>
 <20241230153929.87137-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241230153929.87137-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 07CuS6863GQE

On 12/30/24 07:39, Philippe Mathieu-Daudé wrote:
> The CPUState::halted field is always re-initialized in
> cpu_common_reset_hold(), itself called by cpu_reset().
> No need to have targets manually initializing it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/misc/mips_cpc.c        | 1 -
>   hw/ppc/e500.c             | 1 -
>   target/arm/arm-powerctl.c | 2 --
>   target/hppa/cpu.c         | 1 -
>   4 files changed, 5 deletions(-)

This is a behavior change if cpu->start_powered_off.

I think it's likely that "start powered off' should not apply to warm reset, and that 
otherwise this change is ok.  But I think there's that nit to address first.


r~
