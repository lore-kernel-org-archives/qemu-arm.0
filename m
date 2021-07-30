Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp532684lff;
        Fri, 30 Jul 2021 13:01:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWlwml5ku+4sl4/llU2OaMzWuxgcTRKIpPhRol8FpWC3GPvQF3expViKx318/IDfog3TE4
X-Received: by 2002:adf:ea41:: with SMTP id j1mr4916064wrn.147.1627675270942;
        Fri, 30 Jul 2021 13:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627675270; cv=none;
        d=google.com; s=arc-20160816;
        b=CxIqFAAStywW8058kdu+BlQUShWwbw6/tsh+hO7P2b95UCZ4iyUJvfAZo5kHoLEGT7
         5TSIr5LyQcrtXFLu8FNgKoWf6XARyt+zK+Vxtpz0Hpo3zSH+VEe+xIqRlAcIta8vi9t9
         fxPRUlXw6wJ3+2pmQ2INN6XMOIiiG5FwgmAwwPqAASqe8hps+vQ4J2AIErXn+41gpr/X
         G5izseMjXAPntrSFAWYsBYOImjNPLeLteW8I+gwwnB6xxl+sBv6UB1b4Pih86ORhOUHL
         gc6ybM2rR/7xdvFls5cxYn3XXARNh48p4cQoXtt/2lhRop+e9XKAOBQpi44RqsFayUWK
         eQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Sehry0BQkrQxk/mPXpFuQxFtXwBOUZhi/xa0ULIHiMo=;
        b=WBZZeLSc4ExzjZDq3HfzyDZLfNo6ePZA6FhNuHAwl3geSULtw7yUEBDPOq8ITVech8
         2XSWOxks+oqx5zfFBaKvFRt6dOllROmFc8pH7vKm1tbYcTHUicClARX+/xLvG/K6r1GC
         f0z5cK6VBqFxzIpqxDOdLN4aPvLQNBhhp5JBSRqerZI5GZm88Mc5jmzFSb5xV+m0vVsr
         z7oDzilIbwkYnP4UhDq7nJbpItYPZdiY1NBR1hdBc2xVRs1H0hJ46Z1gqyyCDG9nfcrF
         29Rp79VbqIzQEpC/36BCExNynl/Q25+Y0XD1ZaR7HUnEJBaPlnkdvjj3VwPKc0DAoDoT
         tDtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GB+Qf8j4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si3082885ejd.407.2021.07.30.13.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 13:01:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GB+Qf8j4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Ygw-0004e0-1F
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 16:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yfy-0003hb-0r
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:00:12 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yfw-0004s5-1E
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:00:09 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso15959165pjo.1
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Sehry0BQkrQxk/mPXpFuQxFtXwBOUZhi/xa0ULIHiMo=;
 b=GB+Qf8j4EIVwaQONv6//GbiQPsaFxdegJW2GxpvlG73XXCn/JQQjuA6fbryzCTEh5M
 vaA+T1A6CICFcc1mblIQdDZPo6Msetd5+8at7ZnhbdRMPnKoB9Dv16TYdqJzZtPFG+oS
 rX3F6Pb/fpvUQV6GYSmcVENTtXMJHVwTIyT/q7MNsADUodcKjXoSA0WexK+dNseGpiaf
 ADoWangIRyJ9oLPl/h1QYuRTOKKFBGXioA0Zfj0rtqpQhSfuCHWvshEI5ht1+ZDOkf+S
 UUrFhKPoSfeiVdc48W2/wqf3Fov8YQ2mIGuMGtt6mD55XIgGfzApPSbrs84t1SiVAp+Q
 u5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sehry0BQkrQxk/mPXpFuQxFtXwBOUZhi/xa0ULIHiMo=;
 b=tQ8Fta7kI26RiSEdElzgw3VHfbkfbD2xogU2ipcOE1sAuWbjBcsFb/qK5CBqoN5LUR
 z3kerD3KgUqgHE2AP8BwC+NV+HUA1GECkvrGX3ZOH8QdMH9vDXMxj5v8cKrYEU4M1X6R
 rQhZvDnkKfV+reaD0ibfHdM0P58UCFu9Zgz4tGuQY1W4ep4rp4raTowPItTW5y33CZNY
 5JirFXNTDqrwILMXDSti0RB+pTz9m2YAsQg2Y0kG2DOebwTSIbfGqI4cowDlXCCrzi1/
 DGHOakdTtTmmBGt6R/zpnY9sHgjfMgsrXJB6UqHtoM7OgWKgo+YC0stq6+46LsvVog0w
 hWcQ==
X-Gm-Message-State: AOAM530uHa5HfrSn0LtmKebez9HAMrKaDCrd8kOywESENVSUdPYMLe26
 DPlloC2EG3uis+Hwjnzd9mUyLm1SV8jWKA==
X-Received: by 2002:a65:6a4d:: with SMTP id o13mr1743757pgu.361.1627675206351; 
 Fri, 30 Jul 2021 13:00:06 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id x26sm3303870pfm.77.2021.07.30.13.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:00:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 44/53] softfloat: Remove assertion preventing
 silencing of NaN in default-NaN mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-45-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d603e08-9f6c-896f-2ad9-8b5c06291767@linaro.org>
Date: Fri, 30 Jul 2021 10:00:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-45-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
X-TUID: 1SDPCVL2HTDB

On 7/29/21 1:15 AM, Peter Maydell wrote:
> In commit a777d6033447a we added an assertion to parts_silence_nan() that
> prohibits calling float*_silence_nan() when in default-NaN mode.
> This ties together a property of the output ("do we generate a default
> NaN when the result is a NaN?") with an operation on an input ("silence
> this input NaN").
> 
> It's true that most of the time when in default-NaN mode you won't
> need to silence an input NaN, because you can just produce the
> default NaN as the result instead.  But some functions like
> float*_maxnum() are defined to be able to work with quiet NaNs, so
> silencing an input SNaN is still reasonable.  In particular, the
> upcoming implementation of MVE VMAXNMV would fall over this assertion
> if we didn't delete it.
> 
> Delete the assertion.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   fpu/softfloat-specialize.c.inc | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
