Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp802122ejf;
        Fri, 23 Feb 2024 12:35:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXn7TC1mkT6PqzbElvlKHP1aTj6tEpJM2bAUz2ObfVmZyTVLbBGtX2ox7hDTSHhSpv1oA37BaoLJ037SV1YLi0Yx89socYP
X-Google-Smtp-Source: AGHT+IHrCB1cJexC5+HMR3BcE6eDQEpiBQgxh0I6zNVgajWgMxv3tTFh7QhTyO6EGDOIpNJ+8TBb
X-Received: by 2002:a9d:6845:0:b0:6e4:81d6:3b8b with SMTP id c5-20020a9d6845000000b006e481d63b8bmr896199oto.14.1708720508541;
        Fri, 23 Feb 2024 12:35:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708720508; cv=none;
        d=google.com; s=arc-20160816;
        b=hTfDcdTDTGKBxrJurhovgMvIi4HxPJ25mzr9bNv8G/aXs9ElrctBEEgjwTrhIq598B
         X9bTfqLEj8CRA1Mj0s7siQjXjZpQntAuWolNWqK6S2QAZmwkxSXpdrFk+WA/imZcGNg/
         KwQ5x1owqGRPx8TV4BfT0Mzyv2xmxlE3SzUKbjyuEyTTVVQXh9cSYnNI2XE/25PZSKgV
         XIZLMmOusiq36ZEMgoHjjeseEIDkZg3tmmVEPaM3vI4wT1QXZySaJWPsuiyBJCDehSZT
         GiJbZQzqZjz7UYXVzHmW6AR2AEl7A0GNXk71yBZgsIuzYSREyGfRMK4iY/lzqZNPO760
         ytxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=gFyAPbw1Hx/d/Km9k4IjsLwLBFmB0AULaEJef29WAVE=;
        fh=cbaTWf4slVW3nrOnz8a0jituMqJt8BrNlk3sRZ241/w=;
        b=v85DxE7TtrjIzBeBretaDVtDzvmOrX0mkqp77K+7T/xFgyjVDF2yrwl0esoFvsd3SI
         XH5ajZs+mem1cMwz5TpIg6Ft78ivsiWruuNXtzwAGjOi1Jfh4SXiH3+8n/Ymf/Eu81dt
         MnK6XMvXZJatamg+FdcVGTcZRDUGYw+BLXzVU1FR1nGTBmanAz79oMj5K6NaOpqIBVCU
         3tJeWAk2BLRZG4rBis8O/bloQhZ20ytZZyoEjbEcjPl4FvITvnYOdB7wYnqkO10P9mAc
         poJtKuXE8mRLN5ZPuyxHO3Mfwt3Gfk77Whude3ypV3tkxvH9JpYFL500FA3kHm/1nf8p
         isiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cwFajoo+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a05622a041100b0042e03a46231si14653398qtx.306.2024.02.23.12.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 12:35:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cwFajoo+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdcFb-0000Cr-KO; Fri, 23 Feb 2024 15:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbop-0004WK-Ho
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 15:06:52 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbon-0003nb-CA
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 15:06:51 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-299dba8fd24so497571a91.2
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 12:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708718807; x=1709323607; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFyAPbw1Hx/d/Km9k4IjsLwLBFmB0AULaEJef29WAVE=;
 b=cwFajoo+f6KPYLsu8U+yQunD1g6xTZChaGnCgeinSRdkeErKjDJl5tY5mINc+b1/Oo
 eMlB2dx1rDGEnzgiE7zGyUgNTul6CSv4xpVYEBhS9QAQjwpBjXGQ7UDjwcpzs5TGsnCA
 TfG5KYMDMvHr42zxc06RdhGYOyMli9lzIiX1Cu4MyEWgjW1mFGwTxyGg3od061jw/ur6
 m/NbLtKSzSijob0ZOS0gCgxdwNGK6Hs6oOwQ8JauHBUFVT12ymA1ysLQIMMJSLBroocO
 s5e2RDHRJs5/ei6GfhAMQycU+eGLSfmkOej9CsaiJRlczp8cQdG3WI1JHpEifFYKwJSD
 SjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708718807; x=1709323607;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFyAPbw1Hx/d/Km9k4IjsLwLBFmB0AULaEJef29WAVE=;
 b=wxnV2bqX7AagIe0u16RJN0lzkGSEUwwEh8pbK+eDuVySgkqf4xoVwTK55ZzLJeUXUo
 OWUWaljMglaavurshTRnCd51ckbczqV2ILmx6vXvtLaQ/lLOAU+YDkAQXW927g6j/zsq
 wAh7syQmdVEg7tYhMVPVQCQkkP602Y39LpPpo+o5asZXnC7mqlYgNcT602FmRplr+dnA
 9pC1kmQ6kJ9dUzAvtYs9IJgtpWXEYrjIOoUagD9VK6SLNKg2IlwTbSTeM7nLWnzl/uuI
 POezh/1GZgvr+R6u/SJrreYpFwFrvWUFKwcPfCQaHMlO980YI5AMap9BqAP0WE5zXX87
 8Edw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUtWcwsCCwCzhn74PViG/VzE6SQyhBgO9nsQw6nmiiFbr8DnLapzYQ9e7DOUOKj/OS6hPmxi4SqZtl1FjFpvnyE/LHVnU=
X-Gm-Message-State: AOJu0YyO38K2ScW+pTo9Hd1pZG9cA4G8syAhN19cCRpI/kuByx6N4u5b
 l0LfQqTXF7CaSIOlaAKkTFvLpRb6Uq+M8Qe9YUhjVmYKcl0/DSYYcyQoQH74LNs=
X-Received: by 2002:a17:90a:c486:b0:299:1f21:e54d with SMTP id
 j6-20020a17090ac48600b002991f21e54dmr943013pjt.8.1708718807403; 
 Fri, 23 Feb 2024 12:06:47 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 lj10-20020a17090b344a00b00298ca46547fsm1885987pjb.36.2024.02.23.12.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 12:06:46 -0800 (PST)
Message-ID: <9372e773-33a8-40d6-bb49-0d6bdcdd5789@linaro.org>
Date: Fri, 23 Feb 2024 10:06:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 10/21] hw/arm/virt: Wire NMI and VNMI irq lines
 from GIC to CPU
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-11-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-11-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5PYXhTvIbp1E

On 2/23/24 00:32, Jinjie Ruan via wrote:
> Wire the new NMI and VNMI interrupt line from the GIC to each CPU.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v3:
> - Also add VNMI wire.
> ---
>   hw/arm/virt.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
