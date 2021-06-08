Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4033333lfa;
        Mon, 7 Jun 2021 19:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9QcnK7oAVAPl+NB4cc6rC82piexnr3LbFVG++nPmsDO0uAUYVRZHRg5OlG5DH7qeRbMkR
X-Received: by 2002:a92:d907:: with SMTP id s7mr18087360iln.30.1623121025980;
        Mon, 07 Jun 2021 19:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623121025; cv=none;
        d=google.com; s=arc-20160816;
        b=GcgRYmzOsckKE1EBtlYnk53hfnDUT8nEqb6JRkC9L6cgOgUlZuoNahkBVP1Tb6x1s1
         ynutBZQm/g0tda5EBm2+vKNwQZHkOH/g4l0JnUfkQQsM0VHSDSQlQXHnDO3Ayy0uh1F4
         UMQaN3cbrHkIrSnBga4PjwJrpQoHJlUhjiRpF5ckgXg8/TcozxHLfXjFiMrOoD8juLZM
         m6SMqu3oICCfIbqTutHPtxA7H2542rGrqIXIHefv0G6u0tvxH7WKqt08pF7/budosA+6
         cdQbb+IGxs5L0q2joUh89tRDXkZNdz1FujmNLiRwf5jyrSWcoAFYnNABbucOcyJu76gH
         HUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zV4bvGiie0e+ZKYKkpeObS7+Xv0XEf3uoVCvVWeXObo=;
        b=ivfOLOpDtvH3EL5+iFITqSHIetaN6Xtcp2TTW1eoRHEjEGaqLkrgwFYiKg1M2MFjxP
         L5h1x1xpYeVudngffK9VTgdk0haslzijXjgUeN2oIdnwDIne9/uhvWJdXdQ3/P5cl8CG
         84t7LiPYqLVYvJ2o9jrF6uFjwqc+ibwTm1s0VUSHfHUl9YQcolYlkvfpj+w0UR6NpGhL
         vK0p5omd4GvhpwmjEqsRR8gFvkEEiTsPGp3sK1H+F5ww27HO/GB1JaJe1fdHnjR/SrJf
         pzbibUFAt8+ipS2sUrfL6e8VrxhdzAQclxGct9gf+JwWvlh8StqN/yLBbgSprCG2Gjnm
         HCuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J9NJ0V7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si1263902jat.39.2021.06.07.19.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 19:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J9NJ0V7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqRvN-00056e-91
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 22:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqRvF-00055R-BV
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 22:56:57 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqRvD-0003g4-A6
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 22:56:57 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x73so14601006pfc.8
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 19:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zV4bvGiie0e+ZKYKkpeObS7+Xv0XEf3uoVCvVWeXObo=;
 b=J9NJ0V7yie7j3ThNHYkXWje2dKPCHOIUL4WvxhCwFRKuNXf9yFTc9rVYNOFTvueqZF
 uZKMMrxF4oJYev/MyF7Iqh1AYCTLnHRZVxXrK8QhmaaF4wRfYGhicFIH6lVowsNaHcgU
 ojUWFbfp7kodzNDPC+vNB6LSwALSPtU/TnzqtwA24w0DFXyF4O+XF+jJsGHhbzi8NqOH
 bWP3e/bW9eo8qyM/qqx1wGmlFzsk3nyI6vTMCvtIaA1+HnxgQvLNm2c4XoWLvW2zBAO5
 kdSGBel2eY8O3FC/uoVfDYwzghvZFPSphUKprKUZyTwKZL2ATPLpbZ/3yQJTiC1d5u2R
 T9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zV4bvGiie0e+ZKYKkpeObS7+Xv0XEf3uoVCvVWeXObo=;
 b=QzjAjlHAmL6uB29KWCBFopXyGohC4K7DJTkTq5ipYIM7aECwtkVQV37cO2MavoXeB0
 lYb1qk9mKhjzvj1czLzxXmnxuDXGE7BtxaWkWJ4exza6Op/rKl29OhY9tFCGO2D4xCfH
 Uhmj5q3JjaX95cn6gRP4LpVmG29bI2qJEdSl3XBolP7Y8jP2QzT5Y2V3eRGfjyJk0qTt
 vxMFAhDpvt37WoEPkdSLSaaSJyD/PyY8Tg1PTSae7HFgEt0RK7Z/OnK6jk3k/SfB5YSd
 9uV7en9VOetqaODo+d3kU0ylnyIS0u4K0Gp7pLgTtnQMNx9d2KhSUfYEQKwnlNPz85TP
 BnLw==
X-Gm-Message-State: AOAM533h0SKJBnDY9WhmSvQys66VhJusQwWR63lfO1r5WUhwdpDFut9X
 7SwDksOVwv6r0GfMJz4U3QZ60g==
X-Received: by 2002:aa7:8509:0:b029:2e5:8cfe:bc17 with SMTP id
 v9-20020aa785090000b02902e58cfebc17mr20059054pfn.2.1623121013740; 
 Mon, 07 Jun 2021 19:56:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j5sm7669641pgl.70.2021.06.07.19.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 19:56:53 -0700 (PDT)
Subject: Re: [PATCH 08/55] target/arm: Implement MVE DLSTP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d099bb6c-661c-87dd-082f-8072ff2537a8@linaro.org>
Date: Mon, 7 Jun 2021 19:56:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: cdTZATTWsbSt

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +    {
> +      # This is DLSTP
> +      DLS        1111 0 0000 0 size:2 rn:4 1110 0000 0000 0001
> +      LCTP       1111 0 0000 000     1111 1110 0000 0000 0001
> +    }

Same comment with LCTP being the more specific encoding.
Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
