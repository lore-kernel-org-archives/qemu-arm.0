Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp548282ejb;
        Thu, 22 Jun 2023 09:05:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7FyGMX8mD2BwwiOlMujo1SvE88Mhg6BK8/Lsa3182oLXSfRy6t0/pQkM9W8wP9KIDnf6K7
X-Received: by 2002:ac8:5c11:0:b0:3fd:dd56:422d with SMTP id i17-20020ac85c11000000b003fddd56422dmr21807178qti.46.1687449959455;
        Thu, 22 Jun 2023 09:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687449959; cv=none;
        d=google.com; s=arc-20160816;
        b=Kp5Wkc3tdn8EVf9nrurmwvQ+ZErHl6HOCvY4anZWlqu/2JZ/lHBGB9EP/yEJzj/8sm
         zS58DbdRQmK/IQGjfw5sMVnRXYRnwJUiqO0o6bkv2B1ZzEeP+2Qra5NaG5YP2DgGTPRh
         Tb3t/4f+QByd9dEG6qt6i+JflNxmx+jqQm+KRO6lAgBERKa1DUYVk6dVQvrDXHy8t87+
         4oDzzdtpYBCuLA2EYmjHG2dPSRH/luL1Z7G2XxDWMkIUhgg3EdBNsZzisYLvKYe3hRB4
         ph2ryARL7SBs8Ei1FK/oIpM+rhIoa55oUskPhBiGj+Xrh7iceOfuVUmAdTr0dtAClQur
         c41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GKSFzHfoOe8E2L1wD0MShd505mBa2EuWuWm9TG36N5g=;
        b=oN1a1ET9/7Z6gmWBaaejUWjHyq5s4Oi4HK7WT4q4kWhX6nszzMfRiEfVagz0TbkKiv
         5aWhzOs41JjIJd59XgSLZKxQ/MdWZPqFh8ecNnxZ9SqPZnsRgVkmNw7VeU/BJ02U6Vp2
         3Wi096lwcgRpGdHVNoYpl0l0ijjW4uPfRPiP3SyR9fU7xmjp4u95UtMSHAfV9zwTj4lv
         LoFZncRTnCB73cqMIBbm9jl57uHuzDYoKxqWEDoPbJ4YdFRf1pC+Rv2Xj+wL2LvIJFla
         OioiBNpBLlZb/cAY4IF4UietB5kU8turEQpoK1MhhQKOrqUoRpZ0uWa6ADKexwnFgRme
         AupQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGu0aD8V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a05622a028600b0040080acbae4si365847qtw.787.2023.06.22.09.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 09:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGu0aD8V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCMoi-0000y5-R1; Thu, 22 Jun 2023 12:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qCMob-0000wr-BU
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 12:05:47 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qCMoT-000621-PH
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 12:05:40 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so9999302e87.2
 for <qemu-arm@nongnu.org>; Thu, 22 Jun 2023 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687449934; x=1690041934;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GKSFzHfoOe8E2L1wD0MShd505mBa2EuWuWm9TG36N5g=;
 b=LGu0aD8V0nQVF/44KlKCuzurl1chD9j6pU76xxLfD+DTfx/syVNryceP4tSGn60t2S
 P+G22BC1ZjIlymizrXU37AKF3BWJ5WBe4ZWOUZlkthNIhM/w8iggqKtzAA1y97NM+PmD
 fNMLPFDk/BVos0cAFIoDFOzHj8+1KlAgynXaZksWWKTEdvMj+yfyRPWbOPXed/ys5hn3
 QFhnuHcMGg4Op0fyl/fY/sAlmK9Iazqw8XOR4o1cCB7Fesf/1kbpniVI105gnCUlExrZ
 0tLpzoOpQD+9e9eP6fUDw7H/nz2++3SSHnT5zKykjkF6F3lITSxuNgh5fKyaDbCujzkw
 6JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687449934; x=1690041934;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GKSFzHfoOe8E2L1wD0MShd505mBa2EuWuWm9TG36N5g=;
 b=k+qbSGdRKafb7CuwsYnICbsJYwqbnm99+E4Ma4+b3SS/r6TmT88uZh53/2spAwhx1v
 zSDMFMoGwt1JVdX9HBkC4UVU0WuC7Cnp2qJu34JRN0631kF23R93+mi1nER42pZZVlu0
 BvSb+MRI/kCqpgxKy+GkBIbBvCJEPDNEf4JBEPLpksnQgyeCcibNGsbDxvwPTvI93+YQ
 YLQA187XlyEJ2QuOkilCspkJhxubUQeVjLg0rsSaaF1U1hCYcRtJSThnAoMtxWKto9SU
 HtuHYnUwHsfGXzhSKi3YT28r+vj8KyKxMaBdgr5pAFzVcLee+3sZwzzcm55vbZcDfp6b
 cS3w==
X-Gm-Message-State: AC+VfDxjLSycfsz8oKd1S+gEZ1S4JZBo0cguBlaxUnm50emEMB3aRn4d
 I34HGZ13ozqf/EFtvO+foSoJ4w==
X-Received: by 2002:a05:6512:3985:b0:4f9:615f:14dd with SMTP id
 j5-20020a056512398500b004f9615f14ddmr2577505lfu.11.1687449934516; 
 Thu, 22 Jun 2023 09:05:34 -0700 (PDT)
Received: from [192.168.157.227] ([91.223.100.38])
 by smtp.gmail.com with ESMTPSA id
 u23-20020ac24c37000000b004f86df7b2ffsm1140903lfq.267.2023.06.22.09.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 09:05:34 -0700 (PDT)
Message-ID: <d232206c-7bd1-ccc0-5eb9-da295628444a@linaro.org>
Date: Thu, 22 Jun 2023 18:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/9] accel/tcg: Store some tlb flags in CPUTLBEntryFull
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230621121902.1392277-1-richard.henderson@linaro.org>
 <20230621121902.1392277-2-richard.henderson@linaro.org>
 <405f3697-9cc8-3a19-ee79-094e6e130c29@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <405f3697-9cc8-3a19-ee79-094e6e130c29@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: FGUN9d/AiUKs

On 6/22/23 11:58, Philippe Mathieu-Daudé wrote:
> On 21/6/23 14:18, Richard Henderson wrote:
>> We have run out of bits we can use within the CPUTLBEntry comparators,
>> as TLB_FLAGS_MASK cannot overlap alignment.
>>
>> Store slow_flags[] in CPUTLBEntryFull, and merge with the flags from
>> the comparator.  A new TLB_FORCE_SLOW bit is set within the comparator
>> as an indication that the slow path must be used.
>>
>> Move TLB_BSWAP to TLB_SLOW_FLAGS_MASK.  Since we are out of bits,
>> we cannot create a new bit without moving an old one.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/cpu-all.h  | 21 +++++++--
>>   include/exec/cpu-defs.h |  6 +++
>>   accel/tcg/cputlb.c      | 96 ++++++++++++++++++++++++-----------------
>>   3 files changed, 80 insertions(+), 43 deletions(-)
> 
> Do you mind squashing this for clarity?
> 
> -- >8 --
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index c174d5371a..c0f19e5893 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -130,3 +130,3 @@ typedef struct CPUTLBEntryFull {
>        */
> -    uint8_t slow_flags[3];
> +    uint8_t slow_flags[MMU_ACCESS_COUNT];
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 4871ad85f0..d07763fdeb 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -86,2 +86,3 @@ typedef enum MMUAccessType {
>       MMU_INST_FETCH = 2
> +#define MMU_ACCESS_COUNT 3
>   } MMUAccessType;


Done.


r~
