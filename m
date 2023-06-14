Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp980675ejb;
        Tue, 13 Jun 2023 22:17:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6R0z8kaEQyUYBd0YBbuRzNlp/h42KqY0CxfqYSQOBVncMggQrYbnxId1HjggJMYJa9aQNv
X-Received: by 2002:ad4:5aac:0:b0:5ef:865f:e5c9 with SMTP id u12-20020ad45aac000000b005ef865fe5c9mr17761546qvg.29.1686719842989;
        Tue, 13 Jun 2023 22:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686719842; cv=none;
        d=google.com; s=arc-20160816;
        b=AQkAZn6dhWdjU39nXd3ujx42OnzBujXASADA6br0zXJhel5QWqUVwm6lRszkVzMAhT
         kfuYqoJzV0A8ycJOqfssXzyJYcRzTRj3eVM2+pByQEybPfwiATsxH1+5rF+JinwDO0nG
         Uu+6S0qK9x5XNxPCjqRJVab3jIcC61ntRtEUYk+3uOFcF2ZMjxsYzPlSuvMA/JfB+JAJ
         W9RucWT0/FPmX/Z0w4hEo3LlOmC+t5DT1yIEzY/69eVaLjrCFctBccVLwayhLRUWLKkq
         /plVLvZPIlX+VMA/UXjCKNLzUvqaf/vmcdP/cVEfbTJMTBRJ7zQNu/G8qZ7YkLAVGqWT
         aAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RUixE331uCC1TmqrKK2xSaxt4BSc1VuFgFBldd9cxmE=;
        b=pSih1C60C1yXl86jRcVI/ip5JBSiPNHMw8r3kz5bdnJB8dhXhgOnsCQoRv1jBjoGVs
         4lrSX4T1yGUy5lVVqq+06rNLtUsGgLgQ5QAwzjIWCtpmVeFAaj4OaPS4YypbjgDyxsrQ
         q4vSYTviJebV3UpqWPQ40bhtvDKUsV0txQWcjkuiYeE58E3Fk+VbXCwqEKDm5PtogW/V
         sdUVkAADVCBqVLBPg5jVHRenzziilJR/FLVdLoWON1IjhH3qlruBoYQHbaw/mGo1Ytsv
         uftiQNZUgk5YyTDhOZ4hejhJ689cM8CzF81ZVyEyagROowDvuv7s/LKP0RUJJZKa9GPv
         u0cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sDkm3emt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if5-20020a0562141c4500b00625a05e6fbcsi8673753qvb.322.2023.06.13.22.17.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sDkm3emt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9Isg-0006SK-MY; Wed, 14 Jun 2023 01:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Isd-0006Kq-DN
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:17:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IsZ-0001PH-N1
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:17:14 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f81b449357so3190305e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 22:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686719826; x=1689311826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RUixE331uCC1TmqrKK2xSaxt4BSc1VuFgFBldd9cxmE=;
 b=sDkm3emtXKbGZigvZxWrGyACN2XSTrOuCgKCvclc77uUXo8jQCHb+zSu6Seh1N1KbN
 /JTm8Yr4BCeh4lMUUQf6KABWIJcf4xLjv5M2wJ6xzKgMe8H3a8q/Go3dVaqjkmdjzI1J
 kZxqXg2V4SLER9x2jzFdBwZPqZqalF1dimbJuX62NEiwmt8kjvnY6cGc5fOSan2F/PeJ
 ydcE7NK980ZdciLBJNCM/TPs7yMmeQPYRs2hKW1mm64CJcIuezgd8l7SFi6xWxO2Ny7u
 s9AaHEP7kgpIRVeMC7q1q7K/Blq4QKlM7YtWa9imS7dWZr3rvWWikeJRvANumbSZV9Me
 wscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686719826; x=1689311826;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUixE331uCC1TmqrKK2xSaxt4BSc1VuFgFBldd9cxmE=;
 b=WaHvARPDm99Xu3HVgKpWn7QFIanHJgPMP1hGVgXMRgXoOXA4vUV2+8umtIP1LtWUOJ
 YldnnfxE21TpyNHg3/CUiyv0GdMO5+9MO+YxqEsc/IHsUn/gW7noWvMEmZYrs+W5lcJ9
 Yl1AbfQsfOuifNIsJG6ukmaIeKRusZSu76hUhvGMsdLVZ/Dg616wteVoO3ixfJKvcpzr
 mXzFmFBETe3wAmmdIboxJodbwYxr0MKLNNUMaaO3OQOC6OFJRB0MKc9mIhnNOBLG6MHG
 YDtrGq403Siah0DNi2bOqnrgY27B7c+Zj8TCCP4rwGFnpyK1D5h+EZSbrP+4kimhW4v/
 RSRg==
X-Gm-Message-State: AC+VfDwZVOOOl1W2YAoNhwq24g+wtQeVY3ojIddyqQE5nl8sW8a0V6U/
 D+Vrr57mCaWkJa2B2GRu/bXDEQ==
X-Received: by 2002:a7b:c3cb:0:b0:3f8:1af0:802f with SMTP id
 t11-20020a7bc3cb000000b003f81af0802fmr5646688wmj.24.1686719826542; 
 Tue, 13 Jun 2023 22:17:06 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a7bc7ce000000b003f50d6ee334sm16182641wmk.47.2023.06.13.22.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:17:06 -0700 (PDT)
Message-ID: <06aafe2e-afba-431e-c863-c9e124ef1c93@linaro.org>
Date: Wed, 14 Jun 2023 07:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 8/9] meson: Replace CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230613133347.82210-1-philmd@linaro.org>
 <20230613133347.82210-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230613133347.82210-9-philmd@linaro.org>
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
X-TUID: jACB4MIypO0w

On 6/13/23 15:33, Philippe Mathieu-Daudé wrote:
> Since we*might*  have user emulation with softmmu,
> use the clearer 'CONFIG_SYSTEM_ONLY' key to check
> for system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   meson.build                        | 4 ++--
>   accel/qtest/meson.build            | 2 +-
>   accel/stubs/meson.build            | 2 +-
>   accel/tcg/meson.build              | 6 +++---
>   dump/meson.build                   | 2 +-
>   hw/i386/kvm/meson.build            | 2 +-
>   migration/meson.build              | 2 +-
>   monitor/meson.build                | 2 +-
>   qapi/meson.build                   | 2 +-
>   semihosting/meson.build            | 2 +-
>   softmmu/meson.build                | 4 ++--
>   target/i386/tcg/sysemu/meson.build | 2 +-
>   ui/meson.build                     | 4 ++--
>   13 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
