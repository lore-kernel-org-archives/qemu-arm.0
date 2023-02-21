Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3003837ejb;
        Mon, 20 Feb 2023 23:14:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9wzovsRXBkFp53nynkVpx3Y+URY8SmcSaB+m1/N9nmQxxxjszDsQ+HPfWXkZ1EdHlfuLA7
X-Received: by 2002:ad4:5aac:0:b0:56e:b251:a8e7 with SMTP id u12-20020ad45aac000000b0056eb251a8e7mr9099633qvg.2.1676963688980;
        Mon, 20 Feb 2023 23:14:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676963688; cv=none;
        d=google.com; s=arc-20160816;
        b=WXIKpPdPapKoW6abZ8nfGGHBz+7pm84dfJfdEBuBPEuqjyLJOkV1JIOrm1RB0dLThc
         5YYXDQrrxw39NaQUmal1zN2HxLMH/j5IMQyn5psJqIsgjliw8A5/kgMMGf7lNEMg1WVE
         LFlxmFw0jp+eDtvS2oIr9ZlZ/NjLif7UEVakW1K4LW0J3UZH38Wj8URZGwSb9SWmTevz
         V0bd7j189qWfbpoE5+KbN3ThYaQh6OnWWz+COV6IPAME2llu3exRtsmsre1mt1r7iyF5
         QfRLeXafSY4WnuxxxV3GOtkXiPXlzb0o3JfyDflY1E2TwQqctrOrK3z7m9ue9UjIqe4y
         0i4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wf1MQPuxatJmmu/y6kl7TakTBmw760iOz8YwyMKGumA=;
        b=ht59VK9vHuZlRvUDjiUkSsRVFSkK8/32XPZDNWiLyM0km17UoizraqvOP91muio+9V
         7J4DGaixX+enhJ9gdlnBpEw2m2oZK5FqE2C51Z0I+6FqjrKOyfD24TxBK53Lxcc0N+VP
         4qdmAQy9Nhy9XYcWLS8anjiod1dgsx9sQgHmzYentysLKf73UzBIZ4akCk31392XojrS
         EPd1UCiqvUK1P5XBgPCAgxwlQ+xer39V3GLY+Un36gxtkqlYBblRL0WQIAKvgpEAbcEg
         ZXxiyI+dTx0t8mZnj5F7FOnfiFV4Y6WHAiDL4REgPQAD+x6SpjE0SxmvkaFNJ6TBHI18
         Gtsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e+iX3M/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020a0cdc06000000b0056eda581378si10141792qvk.34.2023.02.20.23.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:14:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e+iX3M/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUMr9-0003jY-Dr; Tue, 21 Feb 2023 02:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMr8-0003hE-Jl
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:14:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMr6-00036U-R5
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:14:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id l1so3021958wry.10
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 23:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wf1MQPuxatJmmu/y6kl7TakTBmw760iOz8YwyMKGumA=;
 b=e+iX3M/nZ8ET9ktIugY8N/8irhInh4KdIMDZPCNYvXJroQbf+5bnW1+5vSxWGDd98m
 717+Dtb61G8SauPrYjCIid8RmUxjwcaWteyoOT7fbO0RDMA+zio04FcEdlLQqo1P1hIe
 K1wHKshXBKPxl6fMEquNMSXkFMhOoSuay0vppen5sDglDi4vzWYjtVbHca+JTQh1Rjok
 ZuGf08JH4yFcW7aMVZYcizdI3VujXsYQCVhsxg6ZDIy3i20uFBcvIUR7QgCpm5pylUzq
 ma03jlBVPsAGjYZc62yoB2LwIE1f4A511BiiuR0yHpbge5yf/vUNVoaznjTTJAojJ94b
 peqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wf1MQPuxatJmmu/y6kl7TakTBmw760iOz8YwyMKGumA=;
 b=18IB/ydIRdxZdZQ1rIu4UWkJhQiS3WAZNC0AoHp9qnV5D3n7Rq5QfD2lIA64uwN2Ds
 lFoqxH/z1xR/hAR262kRgQS9PGE/oYU8g1kGoVCQVgC/Z5Ivf2zGu+tL0wJHa3vvusV8
 lh7OHDoz8a/31knP/NuJhdF6c2/H8Doljj4HwHNl5DSwps8SV8SN4NH5QVpODDHa5eSm
 +fT/Bjv3IjGSzzqix2f+4MyzGub+zD8vh3pkkEQgXvdK9e0iAFJF4qZ0i0HN+ZTQXt9t
 kLkCLoO93L525D0xYcgDnWDk78SW1+QMQ3XAHEWx5sxo0BQjF0sHkZWAz/gxk5aVSPnt
 dYgA==
X-Gm-Message-State: AO0yUKWT2I2FAuIx6ai2GXDYhIEUb3rpCHrZJSm3N+rrtK8wChB3T2fF
 bFZvDuNGtF4Zhx5Puw5AV0qWaQ==
X-Received: by 2002:a5d:474a:0:b0:2c5:52b7:8436 with SMTP id
 o10-20020a5d474a000000b002c552b78436mr3742441wrs.21.1676963667298; 
 Mon, 20 Feb 2023 23:14:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d6991000000b002c54911f50bsm4292800wru.84.2023.02.20.23.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:14:26 -0800 (PST)
Message-ID: <2b6fb761-00fd-4ff2-32f2-5e185ece2c84@linaro.org>
Date: Tue, 21 Feb 2023 08:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/14] target/arm: Unexport arm_gen_dynamic_sysreg_xml
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 063gHMpuNCyk

On 21/2/23 03:19, Richard Henderson wrote:
> This function is not used outside gdbstub.c.
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h     | 1 -
>   target/arm/gdbstub.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

