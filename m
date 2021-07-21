Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6156594lfc;
        Wed, 21 Jul 2021 15:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRz11d8pNLkgHt3mL0CuDEo6sZwOmgxzX1ZURARrr0+nvPnb0H8cO2pI1Y9lO+fMWsodOs
X-Received: by 2002:ac8:44c2:: with SMTP id b2mr33130404qto.216.1626905549836;
        Wed, 21 Jul 2021 15:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626905549; cv=none;
        d=google.com; s=arc-20160816;
        b=02q4QRs3qI2yECy2GtAxHB+HSeB4Ng/BaRqlFxn3HQcW2rSyLMIWhSPdLvWiqVT99u
         JhjygytGWADVJWdKFwFqYdGs4ni4Kxe0EYNpl9ofageAjDHxup1yqyWxf3hGrjF4BUg3
         Y6pYYgkMFwJjZGv8EDw/gkIvcDno/x3a4gw/IRCh5wmp/xYExpU2CvipaeHI2LG4aLvt
         +P3ugc8Iv1qU7XUJJpAlYKEBZ9kiNlAOxcdTqbtjYUWgCILBGBFAqi30JqmAM0dIWuup
         SVzto6GbnCsO7oH++p0QtNzzwKbUCU5dcMFYb2w3g9q6B+5MgpORo/c+LJ9KQTgvS/M/
         qdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LayUQ69BDiXkve1Mxxnq9uRKfFJmYdg43KSNCqITGw8=;
        b=UvD/XINGPbKFUQbqBYMXYv7QXLQ+QBJJccB3dach9AB9iplST4ypXRKLrPumyrE+YZ
         mStnyICvSHJVkHcHND6SJ/yPuAVU3bQTPk49jeDf7dja/2Dx5v5cW1v0JTySaV6Bb8FX
         aiLNekNgIQqOpztOt41end+oLmbT0SEcV/I+LM5/wh0ggU76md8qzL3dMeFJHnEpMcDA
         cO39SBcGub/sHY5VMG18q5GIxXOx6j5dG2IFR05e1+BilOv+5dZnsrjDE11lEfpzZZVz
         pibfYhO2in9mLccVTHcCCAwSrE4GRplTFseHVMMC0iUEP8CFskZeyhBIpLYyEHzcKQAg
         yK9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EuRy8kRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si28050613ybm.119.2021.07.21.15.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 15:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EuRy8kRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6KS5-00070I-3E
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 18:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KRx-0006zs-51
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:12:21 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KRu-0003kI-Gg
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:12:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j8-20020a17090aeb08b0290173bac8b9c9so1364955pjz.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 15:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LayUQ69BDiXkve1Mxxnq9uRKfFJmYdg43KSNCqITGw8=;
 b=EuRy8kRj2h1w+/yYYMv4OW+A/oga89gPMiObhdsgw1TKnJKNmtpfQZ93QQDA9BdfXp
 Jg9Je+rtyZjeXP5jZai0PKT+dnjobeHAjbXkmebLkHihrg1VKgaws9Fir5lJ6esec43K
 XuwBxr0LWFW1jfM9Sn+UXn4KeWUdmH0Ed94hLDJ4w4zP4BHptacR58l1Wy9ZzorRvONm
 48IR/NSjm8HX3NLy8UicULF/ZuwA/rIEubhrv2NU6W1Y9GcXc1HVLYIsVlpzSanEl+2l
 wV6XSMDDRF8dtnfu/h5i0rRqRXMI1fU8/I1oORP+HlgNpBa1R5pJ+aVV2KTagC3gn9iK
 +dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LayUQ69BDiXkve1Mxxnq9uRKfFJmYdg43KSNCqITGw8=;
 b=oSS1sFGLDxUs9uVmdGKHHcHwOCoDuS2G/dnFnuCsr+dL5BVAB29d7uXN8iTPXacW3g
 EKU6C9QYBZeWKjU2ReHAUhOqUeyeUp6c9LHGRVyCOtd7LlAQ8PvrQrl/FyGUFLCQEMBH
 Ab+lXaGGSyjtAYAH/uGdxitq/O6qK8uQGCaXLJoKI9YWmQiJcXvUO7AjhGEquctmMFHI
 cVMHgQzs8ILdl0L+pQ6QoVjmFmTaKpzujqvf0kRu2ep5UxKlQUJFTk23bM1sHQAGSOVP
 p6qZbzMja+4QIs9+JY9zsSdiBa6Iosq3TCThBOrmGfl8+JLeFgeclvLqQQkVNlgCYEoy
 jzEg==
X-Gm-Message-State: AOAM530wo8oSgHLZhQL6a16D5SZV5OrMjyuK9BFB9MDyebfeRyPyk7c2
 FSAcpMEJSK9jRdamj7ZpLIDy9Q==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr5816682pjh.173.1626905536976; 
 Wed, 21 Jul 2021 15:12:16 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 33sm18329724pgs.59.2021.07.21.15.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:12:16 -0700 (PDT)
Subject: Re: [PATCH for-6.2 28/34] target/arm: Implement MVE VMAXA, VMINA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c51ba56-df0d-f9d2-34c0-47e40e386299@linaro.org>
Date: Wed, 21 Jul 2021 12:12:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: 0JObmxdBWurG

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VMAXA and VMINA insns, which take the absolute
> value of the signed elements in the input vector and then accumulate
> the unsigned max or min into the destination vector.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  4 ++++
>   target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
