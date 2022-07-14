Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp887849lfp;
        Thu, 14 Jul 2022 16:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t7b1AenoDBmw16V9kNEmOqka7Ul0o+jQnmDZHh68O+KQupDebVLx0hetbjJq0KZXDnS54K
X-Received: by 2002:ac8:5b90:0:b0:31e:b9fb:791a with SMTP id a16-20020ac85b90000000b0031eb9fb791amr10301549qta.135.1657841131250;
        Thu, 14 Jul 2022 16:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657841131; cv=none;
        d=google.com; s=arc-20160816;
        b=OGEd3EQuzz5xWfXmiDMzxZdJBQZYAHH2GMCNRYpuwsUAxafjw+Y77O9wiNg3GAeHwL
         YQBDwRg2M3oaSCWe2gwIDwSUG2Lwg1fhD8jUJivSvOE2sOvQmtXsULLtuYkpQVWIN9ff
         rlkvbkbyGwBdmlkqHWUIsOpHymjF706it4vq9FigngAPWRX15kjXb0YUp73AipZYATHF
         Pef41fvqR+n8V8164oXesxDwgmTNzbYS7nkO3kFQDKrq2N9911DkXNB6P0rPk98SR8Tp
         M9YO+rXAtXUBsURmFPVR/2PvQ4v2Lk8gte1E4UNw3ke88/Aw1e6GnJNGzUxgYmJxjgVv
         jD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DYHA0vS6o2loJ0ayUbzePztWuoDPFLJm7DKTMngrwyw=;
        b=SF7JZuF+1WijVzlFEgo7HO88LM4Dh4Ej4AO8CI+pQOaCB46dRihuShjUOiqklz7m5q
         6UB6RVPj4dTqBx7YWPIbnzL0j1aUJOqg2r5PheIDIG2TZ2BjsCOT9VUYWxp3ohJ2DSWb
         FKlgJVYA9+2BpsEtvdul9DEJcPapU3grO0Xp/OKgVd0GQwygmY3KpLSFiArzYGJc2yZQ
         kvgQWTusGkoCz0ETPlkz7EsmjK8dYCxp+ILa8GNesvi8dnUJ/HLLNHMB/Nv4dOfsD2kH
         HsZ2VL/OOV9JHHB2rLNcW6EdoQdxMF8jEw57KIKYZbQRt+mQCxCpPeGvbrvAKZQWIH7e
         0smQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CzD14DgX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05620a078200b006b56da882bbsi1728952qka.158.2022.07.14.16.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 16:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CzD14DgX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC8D4-0003Jq-QA
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 19:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC8Cw-0003IQ-MG
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:25:22 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:46601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC8Cu-0008BK-Kx
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 19:25:22 -0400
Received: by mail-io1-xd35.google.com with SMTP id l24so2685294ion.13
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 16:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DYHA0vS6o2loJ0ayUbzePztWuoDPFLJm7DKTMngrwyw=;
 b=CzD14DgXhuMmnKqXU8CniHR8whVMhWsPZ5Zk1KlkR+/IK0Mbfqzg2tXRZ0GmGEayH6
 IN5ZqxtQINhV2GXUDdEEoebr4o/LhLxImMYs6l56pgpxKEPnlhzicW8W1kolyZ7w4+ZL
 Uj+nbbFr+zP18mpuOR3bwaZi08DD6OtdZBjAe90bku97iM3yJGAzEO9ZVFctCVOYd8e3
 Ql4MJsTTQkHqIQ2O4PHKLnzKegyRuvQ/wOIt2fMT/ihKdCd0jHIspunObE03KYkEm4uj
 AmcINKNo8uiKaji42xoHL5PPLM5bGeFE7Is0ufg9dAVhLw3Y9Yrw0Cnc8NYIPPhVkKrX
 1n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DYHA0vS6o2loJ0ayUbzePztWuoDPFLJm7DKTMngrwyw=;
 b=rRgkcJuCDfudzRnmGX3IeBBbZ0QfjcMI1qaDFpI+wCBiSdW2aawWGwnIwHl75Dc9NJ
 tuHtX2l3etRp8zAd+2EVJx406/2HYXqlNgtSaxaB5/B2b/Zyqf3gXsYxF1wYdu1J1xJx
 N+PO7nYGrLcIIKZYzGtz5/JG5UrsMxJaOzSetFGIcGgCXZmhpeLyQEAll7xa/ka9yWIx
 6gGJQe5hQMQPpooOdxPEdAbS/GfElsQ7S3p8fjpWc00xDaU0MB49RFNVwiBDw73Bbikx
 MCYD0EFuvTshpQLJhVdNdYYtEv6j9AExc/kUqcFr8tLkjth667/RK9I7NFNToa1Stlin
 RiSg==
X-Gm-Message-State: AJIora+XJvb5KKShIZgZOTLWaf1PNevBhePC7HI9m0OnuQ0SlhzU5NPI
 8Uz6zZFoF9KNe4x8YNuo0/bvfA==
X-Received: by 2002:a05:6638:1483:b0:33f:7944:a30d with SMTP id
 j3-20020a056638148300b0033f7944a30dmr6244596jak.155.1657841119498; 
 Thu, 14 Jul 2022 16:25:19 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056638001600b0033a29ec646dsm1288831jao.4.2022.07.14.16.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:25:19 -0700 (PDT)
Message-ID: <23b6b693-be9f-1b22-0397-569988829994@linaro.org>
Date: Fri, 15 Jul 2022 04:55:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 7/7] target/arm: Honour VTCR_EL2 bits in Secure EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd35.google.com
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
X-TUID: fhTIQchIncTK

On 7/14/22 18:53, Peter Maydell wrote:
> In regime_tcr() we return the appropriate TCR register for the
> translation regime.  For Secure EL2, we return the VSTCR_EL2 value,
> but in this translation regime some fields that control behaviour are
> in VTCR_EL2.  When this code was originally written (as the comment
> notes), QEMU didn't care about any of those fields, but we have since
> added support for features such as LPA2 which do need the values from
> those fields.
> 
> Synthesize a TCR value by merging in the relevant VTCR_EL2 fields to
> the VSTCR_EL2 value.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1103
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h       | 19 +++++++++++++++++++
>   target/arm/internals.h | 22 +++++++++++++++++++---
>   2 files changed, 38 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
