Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6167361lfc;
        Wed, 21 Jul 2021 15:34:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB0+XxBxzHraXHQDuA2n4bvmSCa5UmBMwy97hlYNx5q4R9VCClsg2e1zF9s6Xy3AkjS2FB
X-Received: by 2002:a25:2e49:: with SMTP id b9mr50539092ybn.250.1626906848589;
        Wed, 21 Jul 2021 15:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626906848; cv=none;
        d=google.com; s=arc-20160816;
        b=EJX2uajPRZ0C0GT6N8IKdgBOLdN1Schn4of38/Vy56NNOe8dp9BalC3tMB1yn+LhoJ
         zCLbCEe8XTwDcx5p063us5UMWWrlqhqjeWKsx8fSjx/euWpMqG51O0iVNJKc91q8YXGd
         wTolKnWfx5L7ZWQhJGUwcoGNsO392gaw8KxxJQEdwH20xlOFcgK1TeiStMmOq2XgLzb/
         2Vi+mxoQo3TZ9gOL0M/OYVsVrVM3uVmdkl4KMNrTDW9vLYEGrZFpWqYNQoG8is6FGTZ0
         xa1A2YyLOb3rN7JUAhq/Kq2zu0j2zYyTkiF9P63GfXSTGZCla3NBmMEfYvkiS0ljGwUV
         7nsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1ALymvoYRloylPo4+w+nemdh1GjsTeSHcaqUHYYfKaI=;
        b=p3RHwrZ7jwR2iP/Oj1gbPy9rHYD++MbUQf3Dm0O4dLTdSNBdd/+LT5BAM4Z6qbxhr1
         XPcKdIolFPPr3XD+WFPvomvnhdMSroxTdRWq/yF5hv3wcarBekdxY4mGVYoEq9XZhckI
         v16hmOEdCxq4kNHvH3wWFxYMw7rhAfRYakNEcxdcknulfM8GPtAf3nGMk2Sq9iPjmxg4
         SS4ZbEHePaTo/edIBpDcGJmx1CwVt+spIp4wx7SmWes3PnFakIZf9TZH91nT/2zxTvaX
         c0nTj6BdmkwPFz+KjFDoPX+g/fbpHZ1BgfgiejU3KmXQSFhDXMQYqv+6cneFno/2tAhB
         qF7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lCSwb0RR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si28021525ybg.288.2021.07.21.15.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 15:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lCSwb0RR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6Kn1-0005hj-Vq
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 18:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Kmh-0005hS-MS
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:33:47 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Kmf-0001Od-UV
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:33:47 -0400
Received: by mail-pl1-x636.google.com with SMTP id x16so2272699plg.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1ALymvoYRloylPo4+w+nemdh1GjsTeSHcaqUHYYfKaI=;
 b=lCSwb0RRriJ7fMTcNvmJ+p5ATt8FWkcN0rzU7wYczi6nVv04sJfN5/HQcr0MCdgUQ8
 fu6rmV8FWRjXQ+Pk25o5556VbkkCbzkUmag1tGRji/hqLi+CcndN3ZkGEDfa2wGUdfrL
 MJo4qbxtQOH+28E2CU+SbasC2nA502I4yiFOBufBc4i7i5LHOAhDGA7+PWpSY8yPGeIQ
 ZCsZW4tG1d1V7zsWa72A07L3yu1ZZNrYqRPXHRweOhEgB8pLWSr7M/GfNs0bgThFvmOU
 M9QL2+AyvG5TiMwd73PcPUyW19hKAH7aIFLmxasY3cmAqgnZq1cpsi0i2d3s5a714bw8
 yFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ALymvoYRloylPo4+w+nemdh1GjsTeSHcaqUHYYfKaI=;
 b=IXCV5GXZtUUoDqn5GQ7oIQmN30tBwVmG6DfDoPBxvL9o63VffMq/lZ+sZofiInj6le
 gX7RUaVwEb4peUDLQ7gWBeRj2Zyj+u/c5M497WrS3pZmDG3zB41+sjlDZAzWcj3WBvjf
 cl2nlIPt6zW2jbsE8LgY9vxYgIpS1ySpQsdfMqPLPI277h8CWyJwaTgmf4MC80cISHn1
 Ec5Edk3IFnVeo+YQwTW1bvktH6zI1yXAtxPe3+mpCMCnUVQBvUUVgKPXhWG2EU8vnKZ/
 Y/NfdkIMgRv5WxEMA2dkArjgKcX14BGi31LVlnJlc2BwlhDckBOipNoVFYoWex7XWH1P
 6lDQ==
X-Gm-Message-State: AOAM531uU8tZHgK7cdQ0PRRbjAkQL/peOwsqR1ZQ1DvfLTy2t//BqZRu
 j0I4gi/oWP23iCEvaZDBW+nuSA==
X-Received: by 2002:a63:e250:: with SMTP id y16mr38423713pgj.247.1626906824118; 
 Wed, 21 Jul 2021 15:33:44 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v7sm17673200pjk.37.2021.07.21.15.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:33:43 -0700 (PDT)
Subject: Re: [PATCH for-6.2 31/34] target/arm: Implement MVE VCTP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f65e081-e173-d841-c145-c8db03e72c28@linaro.org>
Date: Wed, 21 Jul 2021 12:33:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: TsMhYqk/aOys

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VCTP insn, which sets the VPR.P0 predicate bits so
> as to predicate any element at index Rn or greater is predicated.  As
> with VPNOT, this insn itself is predicable and subject to beatwise
> execution.
> 
> The calculation of the mask is the same as is used to determine
> ltpmask in mve_element_mask(), but we precalculate masklen in
> generated code to avoid having to have 4 helpers specialized by size.
> 
> We put the decode line in with the low-overhead-loop insns in
> t32.decode because it's logically part of that collection of insn
> patterns, even though it is an MVE only insn.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  2 ++
>   target/arm/translate-a32.h |  1 +
>   target/arm/t32.decode      |  1 +
>   target/arm/mve_helper.c    | 20 ++++++++++++++++++++
>   target/arm/translate-mve.c |  2 +-
>   target/arm/translate.c     | 33 +++++++++++++++++++++++++++++++++
>   6 files changed, 58 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
