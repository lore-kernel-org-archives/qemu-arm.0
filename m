Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2808428ejc;
        Thu, 28 Sep 2023 13:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfIwbZGy2405UVtFdWCR+DD4r1r+5vGDwL3CZD2ItCUMpsbcMqoHj1iAe64g1JBaxpr1j+
X-Received: by 2002:a25:5f41:0:b0:d88:a049:e902 with SMTP id h1-20020a255f41000000b00d88a049e902mr2268839ybm.53.1695932817934;
        Thu, 28 Sep 2023 13:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695932817; cv=none;
        d=google.com; s=arc-20160816;
        b=w+mVky+bNSB05yw/RwVWVJ9HJ7PHgq4jql98KRxfzhh/d1aoaGjimArVG5jj40qy3/
         TMV6NtQQvs5nDiaO+KMwqe86NAG/+/cNlbPfp1MF6NWWFaedrcvBWi+hfu5CmGDomnpL
         wLzuk+tAOtcH5XMkMHXx0Gib79ozyQ+cpDs5/yh5MMsU7ur+q3GTTLZaqJNybyzwmdFp
         yZEavleITxcZu9vuuIVPT8sNoLEGzDFxuf+17fLJkD17OueUiEy0djq+cEcHBMXF7ZuZ
         1HTWjimmpUT3Pe5gIIWMpQqp03GWukFARYvyEFia/y+O1ekp1wVhh5HV9x1MX4Vvreyt
         as6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=EWOO8jCQcutgbslrnR2UNLBsL4KqnEPWgcrfNQiOLdA=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=qx1cnu3a04fiPKouGd8JDcSt3TLDFJLNRj3ncCcqqcGABfm2mGwMKVYMLFWSRU5Og/
         cYDo4tQBp4wxb0OYdwEYWLeozkzkJrCzX82sMKfoDEgxGlCsYEzKEYhFcXpb1PhMRAgX
         wrFtcGWVR+hEx7X/h01nXzN4t75aP3sqrNtMOJtTaJVIAegMSC7px4DmNmN8x9awS6EA
         5UkA5KwD5l6AcqUPSQnQyhUEjo+8Y4tjl5Lds6nP1nFjA93K3N+1VPd+jBLkj1REoRd+
         GGwreFposy71xA1itvvHxR/qoSH8VZyOwOsdgd2Wss9K8s0Rurm7Kd0xSHc4TwOyp23X
         4caQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwYv5e3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a0cf143000000b0065af7163b61si6202466qvl.82.2023.09.28.13.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 13:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwYv5e3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlxal-0000o7-5l; Thu, 28 Sep 2023 16:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qlxaj-0000nR-2w
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 16:26:33 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qlxah-0003L8-DN
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 16:26:32 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5859a7d6556so184009a12.0
 for <qemu-arm@nongnu.org>; Thu, 28 Sep 2023 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695932790; x=1696537590; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EWOO8jCQcutgbslrnR2UNLBsL4KqnEPWgcrfNQiOLdA=;
 b=CwYv5e3jd4kUlq49Wkp37Sfpwbkxbf27HOzY9FGdFTr5auUt8Z5g/SU5RJ+yxY5sbV
 JD7Ywgwf6loQnIDDjZhTU4FkgLf93of804qagMez4kCHRzuiMPhRycMD3GWhy1pLr8c0
 v77+WN3jO4+JfWtUIFbwkW31pWk41gD2rgvZj0pjpbxqTOyyhoCcxKcqsWu7XBs53foz
 ZZgNKyI39QdYwAOB0fy8FXvW6tvDxAR92Qd4aC3RD27ONhVxlzLlYSekS+sSaTIOJ6C8
 sbg/FFvsxLOxsTUsDKEnojS5C2b9m4mJg+0gCzF3Vabx2R/ZFzje5eO1KajhYQ8ZnGZx
 76Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695932790; x=1696537590;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EWOO8jCQcutgbslrnR2UNLBsL4KqnEPWgcrfNQiOLdA=;
 b=kTYfv4HPQHVD6gXz4jbswTAATCwdZbtL17hWJVx3IoYjqPmvkZKJyLdMIwwWEgzHGV
 m0vDZu0+eg9KRtyvWbpz0139BUIMH4CqLYgkFjnrGkQj7jwsyCC194NxhUMn/+vqCft+
 N5e8QvGPVNWFUBfczi8pG+E6ptYE+6/ibex5nclE48L78zldSmC2gbLtaVpncT/m0WuK
 P3ywi6YgUy+nWiq5PS2Id6HVJrUlDoZ4MUuVjnMvOph6hW+VXzpa1kGjp+/5RGOMqB7H
 HOjdG+Y4NTULz5OwIxcmyA7UZX9R7R0HbGFAsIoOXB8PbGl5yOPZrHEJ9cMydnI7hXnu
 jEIA==
X-Gm-Message-State: AOJu0Yw5+kgmxLrKQei5/YBFDttKkhffl4yqg81JDbzq78WHsqYYd59u
 AzQbPsT/P42BasUaDTMt2dpf8A==
X-Received: by 2002:a17:903:11d2:b0:1c7:2697:ec0a with SMTP id
 q18-20020a17090311d200b001c72697ec0amr2417399plh.30.1695932789764; 
 Thu, 28 Sep 2023 13:26:29 -0700 (PDT)
Received: from [192.168.0.4] (174-21-146-124.tukw.qwest.net. [174.21.146.124])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170902eb4b00b001c61921d4d2sm8966449pli.302.2023.09.28.13.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 13:26:28 -0700 (PDT)
Message-ID: <4648e9df-5cff-c470-6c7f-e34f505d294f@linaro.org>
Date: Thu, 28 Sep 2023 13:26:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] target/arm/arm-powerctl: Correctly init CPUs when powered
 on to lower EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230926155619.4028618-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230926155619.4028618-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: OEslFo+fiWrL

On 9/26/23 11:56, Peter Maydell wrote:
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1899
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h          | 22 +++++++++
>   hw/arm/boot.c             | 95 ++++++++++-----------------------------
>   target/arm/arm-powerctl.c | 53 +---------------------
>   target/arm/cpu.c          | 95 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 141 insertions(+), 124 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
