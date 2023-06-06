Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3541487ejb;
        Tue, 6 Jun 2023 07:49:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6aPOmvjpy4f/X5G5EV6c0yLWKmI1rcVy0o7FDULyDqzd39WrknB6zOKPyDv/Veq1Xklsm7
X-Received: by 2002:a05:620a:24ca:b0:75d:5398:fc70 with SMTP id m10-20020a05620a24ca00b0075d5398fc70mr2667207qkn.38.1686062977312;
        Tue, 06 Jun 2023 07:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686062977; cv=none;
        d=google.com; s=arc-20160816;
        b=NhH8hfG1/hvHP98SjDEhOu9wFVpHslnWHtbNWrziueMcdw+s01xSZzfbwSDfCm8k/8
         UgE5kBOOUHk4eKZv6c1uCFj8CHCf+VB3NswpLOkoEjjN8CEONGDHKAwLsucQ9l//uBQ8
         toGSwzowW6xQUnPIMt7k6Bpxw2V8Nt4+AQ1gt6Befns9bXxU78E2Bw9Q+y8QSiQk5nZa
         vSrplx8iCrJqFzaJrqAPMPRssvitzDiFNInonV06uCAsiOGRfFJMyxy/D5PQanYAnnam
         43kQVIShWJi3mhTb+x2ZN0GfIfGzrl+n+SavijltrCmUgeDfPsjeir4Dz2NWAs2PP+oM
         xPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ojb1cND76xpAWDunP5fQnUJZtmpC4/7Q0Xlav9BCelI=;
        b=bnvdx/0SF3jFFKKRM8f93MvRJJ/EGlAt3VRFBl8wLr7/c2r/NOm8OcWOrqd9YLqdzb
         iVxLkDKMP7b6xyWVBMEbfJ5jjNEVmBcIUE/e1aGBLW4hTDTMGhKFJrggQkpDoB+a7/zx
         nvii7/QrB1FRkoLEfH+g+EnRMH8V92X7dgJC/VpQ+w/qtk7lFWTV+yc+qycKsN8D786y
         Kle3pcq8ySlQbp2Z5G2JjJjV0jfes9iNmaPGTPxqaEKuEGeuxq3//n7TzYNO8X3dffFh
         IvscfbP1YOohsoNFhdrK5XgBHzKj/EiF4Q2n68t61LA/V5MxcswMA9Po6iz3/TP4VHxR
         DJjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zv6X3IEy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020ae9e30b000000b0075d5446b1e4si3391820qkf.416.2023.06.06.07.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:49:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zv6X3IEy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6XzU-0003az-A2; Tue, 06 Jun 2023 10:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6XzJ-0003Zg-SR
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:48:47 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6XzF-0004j6-J8
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:48:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-53fbb3a013dso5697662a12.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jun 2023 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062919; x=1688654919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ojb1cND76xpAWDunP5fQnUJZtmpC4/7Q0Xlav9BCelI=;
 b=Zv6X3IEyqx525/THajyMn3tYezXTjrUTs8wNR8wR38QwQc/zXAq/h/ROY3j5cznFHB
 nrhLXQi1Da0GQLiRGEeqoknDXYpd+ZE8R0XoSMcSlT9wnJg5U5pkGXmFQtZ2X5pcFmNi
 B1qxYIHghsh8RIExYvR9wsR+qVoIJlehp0yYZAiGEyKx5CHrhe7+9L8whG4amd8CI334
 1MSWAayZFBwcKl+G6YBJDtSJpHa3zls3MEe6uXNGbIZ9mbNgzwuNwJyTSzz5bpaoWE69
 23NQwVqsDPc8SUw/ULOcvUVyHC71kgjioPSgQk0+Ngu6iM4VrETNYtnWueRWFA0zIOQS
 sdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062919; x=1688654919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojb1cND76xpAWDunP5fQnUJZtmpC4/7Q0Xlav9BCelI=;
 b=MrA09siu3cQYrAJGjd+t8aTsuuG6m+kEEPBB6sWWe/jyq9EMVDvPStH8CrN73dM7wH
 VT/9ag9cWaEqFibPL+6VFHBAOH5Y26l1faYsPcY3snAqKLNhabXXZL95OlqOsC1XCnNc
 jP/KtcGw1jQClow///OhyI6GnhfcvmhT0kyx0ZATLt3XYXlyXCRctoE4jRon34WHRFjS
 FVcAwY8zPFtwhyuauBRy449my1ZqXLBIqOBADZiKXORGmZIIKs6hdVg9aIRtfADz4Aib
 KfdDqU+gapQTB9scZdGkRSGqx3hFwgPAbhDE9LWcO3vSk8A3+ld/SKss+Au+VVfN6wVU
 8iKg==
X-Gm-Message-State: AC+VfDxaWIJ74b02EgRafmxyOCG3TQcLxTa4f4wtptwGhySTNf7Qf+Iv
 QpK790aGAd7/nk/LNZQss+NZhw==
X-Received: by 2002:a17:903:22c3:b0:1b0:3df1:c293 with SMTP id
 y3-20020a17090322c300b001b03df1c293mr2592900plg.45.1686062919143; 
 Tue, 06 Jun 2023 07:48:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b001ab0a30c895sm8627647plb.202.2023.06.06.07.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:48:38 -0700 (PDT)
Message-ID: <16c75f6a-7621-213f-5786-d0ea34e02478@linaro.org>
Date: Tue, 6 Jun 2023 07:48:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 3/9] target/m68k: Check for USER_ONLY definition
 instead of SOFTMMU one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MUyYJrfswkxV

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> Since we*might*  have user emulation with softmmu,
> replace the system emulation check by !user emulation one.
> 
> Invert some if() ladders for clarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/m68k/helper.h    |  2 +-
>   target/m68k/cpu.c       | 14 ++++++--------
>   target/m68k/helper.c    |  4 ++--
>   target/m68k/translate.c | 28 ++++++++++++++--------------
>   4 files changed, 23 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
