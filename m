Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp412024lfg;
        Thu, 28 Jul 2022 10:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ui9FQmX23sT+7uXv5OquDJyN/VrPdnBHUDU/SRGkHGqnNE3xchla7zByK3Trti0AgEfmCS
X-Received: by 2002:a05:622a:1208:b0:31f:36c4:acbc with SMTP id y8-20020a05622a120800b0031f36c4acbcmr17773099qtx.218.1659028539383;
        Thu, 28 Jul 2022 10:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659028539; cv=none;
        d=google.com; s=arc-20160816;
        b=QPVD8FEHbGu30pTI1iTous7s6scyeRJkgbxLcjtHujtIjAciTTzPqrTmaDSQDXIHlK
         L/loooD6iXlP0qLTzmbcqEH2F/hd5jmLQ6IdBukHU3wHcGXD2yMKitc27qYO+m0iT5h8
         IJVSGDTwQEvA1GH37qaC21VboleGa2mQMO0jXr3Z648u7Pkapp9w4qe9cqUM0uSC9dcU
         oDQVuERQxDEAaZUSoPYezpjldyZL0X9Zv4dJoGyO4LGzOjZICbDfRelL1sFQUHa8uDlz
         6uzek9HGlEaVR+W/b+mYE9w2IgAm/uz4MimYdmvGKcEvgXcLcGNZj9QhKgrGRcpm49do
         VeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PxIj9x3Qj7wGGq+L6hnxjPePcB3g34I/8eBsjBNut6s=;
        b=fC0rFKUzG15Z0zB756mZc4qWc65bZ6JydzRvo6HF4380CzgkGda9zDk8VsvMZRaEzA
         CN2Y8LbCu3W0E25M2FwZa3m4CN0/X+02NIGQ7/EfONQZho+V0+VBVeAkcSblh9iLS+0A
         HYidqVhyuxg9R7uv+2aNgUc834InupDSVFECG/6F26GzWDKGwe3EBKd7Gedq+YR8z8m9
         Gv30e2GnvVyMYNYPSuqa/elza/UXPewK7DIXGACtIfkxR2c2WyHnt6nsdTJ7cSberTcl
         qZOsjsdfiZ1L8jW6KsiUetGEmgFr1U1ckT0jNHomVC/ZQ/Wnn2Gyx4a1wOcCIMJUU6Yh
         COQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cccJCNlP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc20-20020a05622a411400b0031edf466b73si776994qtb.64.2022.07.28.10.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 10:15:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cccJCNlP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oH76o-00020v-Sl
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 13:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH75K-0000rN-Ud
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 13:14:06 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:38673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH75I-0003Uo-8h
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 13:14:06 -0400
Received: by mail-pg1-x530.google.com with SMTP id e132so2022478pgc.5
 for <qemu-arm@nongnu.org>; Thu, 28 Jul 2022 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PxIj9x3Qj7wGGq+L6hnxjPePcB3g34I/8eBsjBNut6s=;
 b=cccJCNlPM1Rm9taTXadWt95MWMNMdDdUvioowcAuxYW4cQ0Iehm29e2A8+XMLlnYYD
 On1WFTgHk1mznGgYr0WaAZpG9MZiSbVimID9rSgtY66D9Q7k4ukY3QGq8WnZHT15ytcS
 ECD/PD/5EogZyFXTpECa+T5WP54VP7tunlkACUq39KvarnyUjKhtk8xPLdm5ntykJ+Fa
 F57xkv2ksiwZElFZV/5HbSFRJO4JUJNxy1g812QD+Mk909ojEN2Wg/JQhniD9Yd39e5j
 8qvMEDxYDQ+ZJ+xMmI2JqjLlfiYa0GCdr11o/Z44xoMr6AtycZ7wMKqGG3BoCUr0LeBF
 BI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PxIj9x3Qj7wGGq+L6hnxjPePcB3g34I/8eBsjBNut6s=;
 b=gyCxT2lbrsMmm3kPa1mVvEPadnS8YZDC3S3NUnfkQaAepIeiLPJEblz/AC7QcsODxk
 gISRUQTocudZASeZMaKS3fQSE9PKpM4D6rm0WQmwSIHROUK5BS7HcH5EWz/O7QxqMAGO
 1UYn4+3D7zMmQG1eNCtkQJyrMxWhIZrqIwT769JQfRSOa79vDiYsIgPFoyWYrjhdK6GA
 J6VRQh0Ds/ZBHIJRhldUeCeKj9nfgZ7sfCN64pixcWJ2YX1GDZrWEs2zJ7FGzeCAsPMa
 83L/50upHP98y03gSBywR9piHbIi/cX7KLWB6CSiwRbKxLFrcAiLcuTmXl19/Mbu0/+E
 FLyg==
X-Gm-Message-State: AJIora92DQhOnCwxFg5fziWC7JIUHsbu/qTNXjKSFknrKv6ticoOibnK
 MJDSn2++Jehu+Y0VTnEBCSeB3A==
X-Received: by 2002:a05:6a02:30d:b0:412:9de2:eb48 with SMTP id
 bn13-20020a056a02030d00b004129de2eb48mr23409098pgb.47.1659028442527; 
 Thu, 28 Jul 2022 10:14:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:d1a3:8e57:d847:7607?
 ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 u62-20020a626041000000b0052b94e757ecsm961880pfb.213.2022.07.28.10.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 10:14:02 -0700 (PDT)
Message-ID: <927ec016-4964-47e1-02c4-bd2e9edaec7b@linaro.org>
Date: Thu, 28 Jul 2022 10:13:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1?] kvm: don't use perror() without useful errno
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220728142446.438177-1-cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220728142446.438177-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nD1eu9QvwlcF

On 7/28/22 07:24, Cornelia Huck wrote:
> perror() is designed to append the decoded errno value to a
> string. This, however, only makes sense if we called something that
> actually sets errno prior to that.
> 
> For the callers that check for split irqchip support that is not the
> case, and we end up with confusing error messages that end in
> "success". Use error_report() instead.
> 
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
