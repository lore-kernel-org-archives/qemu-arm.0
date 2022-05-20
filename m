Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1905962lfh;
        Fri, 20 May 2022 08:36:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzefsZ/ajHtEPwk5Vo8IpgllRAkrqmckNzbxfy8qTEXS3Cqw+IsQd6CaqRs1TIho9vyaIS
X-Received: by 2002:a05:6214:27c6:b0:45a:bb16:1022 with SMTP id ge6-20020a05621427c600b0045abb161022mr8823049qvb.118.1653061016294;
        Fri, 20 May 2022 08:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653061016; cv=none;
        d=google.com; s=arc-20160816;
        b=IIh7kv5VJGMYfObrWv01N/4y6nXslxSwYN83TpZdySp1M/M9YLBftFHeNz5K/rQCFO
         sD/mvmSztFculVRhzFuO9+JqIlX023TktoGxg67U4WKYoNiwT3NGYkKK2+hz116yxxum
         8frzxU88q4VLN4GcInG5XVsAxM093WBOfr7ubTuAgNB7GHKUxe7ZtFeEJ0dYChH0HnN7
         FalhPotF0jmkhiDDRqD29Qg8iIUYoEhKa/5x2Et8QmaP48SaJP6ZqpeCgH3qJjl+QLe7
         C6I3FdQiW0rsIzgV/lbCdg8aiRrsPgPpZOTjS864ZE5tTz0xIYxzrkjptdglLlb2XC7Y
         tSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=FwWFH7lfd17PKhOaGfN/m5L8aANzn2UWylj4ahB3xEI=;
        b=hHOYkZphqhKA7lT8Bc7KyuKg5175kW6YE9/eP0vyUMxtplgRyz2Q0CVAzzLAw6oIc+
         lSNBaAtSFu1H6AGOAPEALJAYd5fvjX4pfH2+hz3FGKUIjRbZV2mgUeATvHPSbh4a42nP
         6KXYzbMJW3MMWpOgt12QTMbirG9suq8k+cTqsFsgs2asbQeKZDFS5hbuKFwHRo2lKLC8
         ZUCQebcfYE3pAEjShgGCVvZb5Pc4DiG4Z9AZzIY9FWHb4m2SdO/8oXF4IB3l2TwiY1Il
         FNKQOVpp/QW177ouJOO2Pq8d8d+dBd64ylEuFq9uS7BzdKCMLU+9US3Ng5awflLx6a3f
         xcSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XH/GdsPm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020ac85808000000b002f3f7711c52si2713077qtg.200.2022.05.20.08.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 May 2022 08:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XH/GdsPm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ns4gR-0002EM-PM
	for alex.bennee@linaro.org; Fri, 20 May 2022 11:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4gB-0002E6-N6
 for qemu-arm@nongnu.org; Fri, 20 May 2022 11:36:39 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4g9-0006rv-4G
 for qemu-arm@nongnu.org; Fri, 20 May 2022 11:36:39 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so8178327pjq.2
 for <qemu-arm@nongnu.org>; Fri, 20 May 2022 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=FwWFH7lfd17PKhOaGfN/m5L8aANzn2UWylj4ahB3xEI=;
 b=XH/GdsPmQDW0aiLUJRIlFobSM6ANJmhoujSqoit4/8fU8dSf3m2fl17EMm5TX/sO8p
 8noyUjGerxd431R+Kf8eTB7a48AfzUwNANRyG9fpJzirTBuEgt2Ke4bcIHQWXE0e82ZG
 8oKSWvTREi1vfVbUPPfzzuWaeKgYKhx6sp4ALKgFTE7i86+8brtc1k6gGgseqmU5ZFOc
 GseiJDcwqqerblPUPv+0K1a/1oax9/Y3Cb0OrVH7deYWHx9Nci20tx9/nEFC91/ifGQh
 sL77ISf46+YqFnuaApE39OcqJ6ebXufHOHMa5iOMI+KHgn9d8+cYHGC551247RdYw4eq
 0bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FwWFH7lfd17PKhOaGfN/m5L8aANzn2UWylj4ahB3xEI=;
 b=aj9bmYBx4t2JxyuHgsx6gkNuycDvcw/U8ZGQP/FFDJll0CjzQMgTALC1VappRpEWbJ
 I8IyzhAMWDfrY77HFy1Klt7L0UOCvSaMaKbQlLBhpvFmo1mj+QUd1XaBjO/sRsTOZ20T
 TmlULfNsTbrkJ4zrt6YqaEsOIsfSt2jJVCjC5ulEwuRYXJqugOdXLU03vxma6yr9jWQo
 CEmFZJNavI8qAr9HkNUYkZ880cSYjDEYMAnVcnyEXeCzc6M0dvMYCPpeKeT69prAqfWp
 mkRAJDccvalAPv8geK0+B8iwgv7VxARFTbW/6NXJpLJ7bAbclJYmG0Tjl1MDQpoly4QF
 ASOg==
X-Gm-Message-State: AOAM532UVMLL4KBjzcnNjjzpT/S8hFoIN1y4mzIG1B8+7pCZMLFY95oR
 J7EJfXGixq+cJKMzkVs3fgbLBA==
X-Received: by 2002:a17:902:70c3:b0:15e:f8ef:67b5 with SMTP id
 l3-20020a17090270c300b0015ef8ef67b5mr10524937plt.115.1653060995053; 
 Fri, 20 May 2022 08:36:35 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a17090a6d9700b001dbe7ccdd4dsm2018410pjk.10.2022.05.20.08.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:36:34 -0700 (PDT)
Message-ID: <bed03755-576d-6473-efe8-f7d09211f061@linaro.org>
Date: Fri, 20 May 2022 08:36:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] docs/system/arm: Add FEAT_HCX to list of emulated features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220520084320.424166-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220520084320.424166-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AIakUbIP32EB

On 5/20/22 01:43, Peter Maydell wrote:
> In commit 5814d587fe861fe9 we added support for emulating
> FEAT_HCX (Support for the HCRX_EL2 register). However we
> forgot to add it to the list in emulated.rst. Correct the
> omission.
> 
> Fixes: 5814d587fe861fe9 ("target/arm: Enable FEAT_HCX for -cpu max")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Oops, missed this during review...

Oops, my bad.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> 
>   docs/system/arm/emulation.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 3e95bba0d24..49cc3e8340e 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -29,6 +29,7 @@ the following architecture extensions:
>   - FEAT_FRINTTS (Floating-point to integer instructions)
>   - FEAT_FlagM (Flag manipulation instructions v2)
>   - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
> +- FEAT_HCX (Support for the HCRX_EL2 register)
>   - FEAT_HPDS (Hierarchical permission disables)
>   - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
>   - FEAT_IDST (ID space trap handling)

