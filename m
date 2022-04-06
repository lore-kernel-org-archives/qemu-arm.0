Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp708457lfu;
        Wed, 6 Apr 2022 06:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnoELo0C0zXI3Kq7odfLlBdLboSmOLCN5C7/RL92nJHx1gBi9LtmT6QHmJXRt/JIShlikC
X-Received: by 2002:a37:6c46:0:b0:60d:d526:7e48 with SMTP id h67-20020a376c46000000b0060dd5267e48mr5672039qkc.451.1649252628134;
        Wed, 06 Apr 2022 06:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649252628; cv=none;
        d=google.com; s=arc-20160816;
        b=coJOYrdYx+LmthpjclWfrefopx31Pfhl7v83ISGcASjo6kznVyvrZ+DrB0Zk2w88tH
         0IN7E4wkIxB+XJ82bfMw+JR9Zlcj05s9UmJK9ZJ4CjfBJI77e/wnzYOQi+mFu93h08Wo
         nh//adgO+ixUGpvTF5fdCHdlDX/52Zb5NZ/VtsxGkFuSqcRpUwDfa/XaUpXFaM8F99Ip
         NDa3d1krIA2B6XKvrv3c2rsauTfTVGnNcKo9YgZbn7waa5uvFsXCcZvMd1B+Cviu+Zyk
         JsXjlEgDe6syh+OVPFKCaOJcagbRouL10xjUQYMU0D9TjhVy4d5LZVBsSk/l/2O/Gu2s
         kLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=z/L5KSTn8cENzzXMrH/98LOK/NOhLWEYpy0sV8oTgow=;
        b=MjQn+dnQL0FbDz98w0lJ7DEZcebTw38wV5b5EIMTcc2zLG4U4AwMnHGrR5MK18XgYG
         XSNu2X5gqnHV2YS6IOdEawkQe4pkgHoysfC2pcPuz+YTNJtDvIlbkPSqtzosN/ERqvqT
         Ff8CBMhfX5NBFPgxCpP7PqO7MvkDh19Cvo7OFqtvu3r6GTAkipK/iWry7oz56J3tmix+
         R5thPVge3pFrtcN9KiYFMR7rSeDcRUw91JgieXr8KrNYQ9/uaiEUFYB297FTGUohibp3
         3aFc09bDBxwSuyxpi2VaEzdMCZgRjR/JVRHV+OgNFxgmS76f98eHdmUe5Km90yru+6x/
         pnfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m27HrFBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020ac87294000000b002e20139ac15si5547616qto.198.2022.04.06.06.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m27HrFBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc5wp-00049Y-JL
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5wf-00049C-UC
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:43:37 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5we-0001kk-7C
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:43:37 -0400
Received: by mail-qv1-xf31.google.com with SMTP id x5so2237223qvk.4
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z/L5KSTn8cENzzXMrH/98LOK/NOhLWEYpy0sV8oTgow=;
 b=m27HrFBih1nnwUbSyA32ILeuMtXqNesTbmjQ/gYD8trzKnfIoHCC04bKQuAitRjo8s
 7VSLTW+lkEJM5gbFJp+XR10/PZCQ4qjOxNAcLXLmnnZEPo8akC39PdBu7vHr1Bw/Jyjw
 TQ3pNEvPziFYEzMr4aBMLFYN4yEPTeWJs/bkJyjRuPD7qq2cZqBMDLcS4xEPkkuVMUx9
 VJUuHg34RxjKd1EBRpT3p0BijCxSrF/cnWeXSxAlha7bG52A66jVVqlglM3GlTz4AMHe
 Jh80zpvCpIBa8nsCEqbUfIAMqnXFooWUbYN+O5fUOOBV3VxqsYtfiS8ksx1I3H9GnB1y
 EnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z/L5KSTn8cENzzXMrH/98LOK/NOhLWEYpy0sV8oTgow=;
 b=ILZAW9BZ+hotA28xPfeFuoV79TzZcptIdiBBt5FBLV/yM/7gHV/xx1Qg/+4nkJ2P+d
 rKst/+Uf1QASUIOzeMCb5C2/N8P1lvTrsKm20q7xcuHdhN7lARagbHnqAHtR64EqfK+J
 ys0HRByYtW2Xe9nOrLyP+6JfBueWozG8WkNr2h5Ckt+PfdDUNw7cTxzT58/1zBHBj82V
 Q2SENbjjzTKbpD8yqz7Bi304JhLnDJ1faespKh4IJH+IZDDZz06SDtyFUkTHCmqCpbVI
 ie/KctjMXNO8TuQjiS+CCMcar7fFV4iYbSx0jZ069Jud/020A84ZLw5ot7wdCCD15tnU
 z1Nw==
X-Gm-Message-State: AOAM533wzss/48N/OXCivVfj6+ENdaRM2RflpGzVEEqlL5mEsu9c+vaC
 vlymwqHHmkRUFaDU5TNS/NWxaw==
X-Received: by 2002:a05:6214:e45:b0:441:73e0:40f9 with SMTP id
 o5-20020a0562140e4500b0044173e040f9mr7501471qvc.40.1649252615188; 
 Wed, 06 Apr 2022 06:43:35 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 x20-20020ac85f14000000b002e1ee1c56c3sm13638579qta.76.2022.04.06.06.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:43:34 -0700 (PDT)
Message-ID: <775aad48-03ed-9e27-f6f8-a22999e4d668@linaro.org>
Date: Wed, 6 Apr 2022 08:43:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 04/18] hw/arm/exynos4210: Drop int_gic_irq[] from
 Exynos4210Irq struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JiNhFh/kIrVu

On 4/4/22 10:46, Peter Maydell wrote:
> The only time we use the int_gic_irq[] array in the Exynos4210Irq
> struct is in the exynos4210_realize() function: we initialize it with
> the GPIO inputs of the a9mpcore device, and then a bit later on we
> connect those to the outputs of the internal combiner.  Now that the
> a9mpcore object is easily accessible as s->a9mpcore we can make the
> connection directly from one device to the other without going via
> this array.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h | 1 -
>   hw/arm/exynos4210.c         | 6 ++----
>   2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
