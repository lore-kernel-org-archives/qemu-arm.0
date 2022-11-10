Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp812954ejx;
        Wed, 9 Nov 2022 21:41:57 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5RGxQ/Jz52KZHnWjsn0u6l4Q4EPBDoSCQ48s3ORGwL9ZTQMWm9eKsRh5OXtx57Juc/J16P
X-Received: by 2002:a05:6214:5086:b0:4bb:cb21:d369 with SMTP id kk6-20020a056214508600b004bbcb21d369mr56484567qvb.124.1668058917502;
        Wed, 09 Nov 2022 21:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668058917; cv=none;
        d=google.com; s=arc-20160816;
        b=lX7IqM1NNjh2HGqehXzOwPG3H4p24KMJP5lfkIBrK4/gMLBqAcxgOR9QqORWg1ktKh
         b1V0+Pqe4g0bXVvr4t0kEOcwCtEiablKIcbkgb7UoTOIXt6+eMrRN8FLPPfcjnGTCbVT
         GZMHGR5JAYPNqaSDZ9bly+Td3pp71r9eXZw+asiuxswW0kB21TOrOY/ZgmKM1JHiV1IS
         u7WHLtX4RNjbtOxOKEjkOPaZY4V+ikksXCcWAEQenr+evVvY2n2k6vARaVBwYJIHDL9+
         0w6aDvNRjC17U0uriA0tloqpQT6NdaQc2vNH0wbtdFtg38iILSwEE/gqQig6u/VmSTmU
         CySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rQXhA4Oyy0yFYYRexi166bjice8R7QX7i1WuCZtn2+Q=;
        b=0AG+KVRLWJtX4Jz6OJt5eBbcF53NoH6kQe3bY7Cr+SQjd+yNPDTA1FKrx190WJPz7v
         ynoo+rk0tZ3k+85JB6MNPHREb3FKqCXn3PlytY1xmwZhPuuapPLgICnBlT4p4NmmzjDa
         K917AoxqpampkJgW1ZVGAM74NyHkquv72d+4CqmgZXNvnevO02qiMgISq/BGQHgVVWUa
         pJA5N1PBoFj6Uo9g2Wx5Zs+zaNO/2A+2KUphDRZBRxJeyd1zl9pCC/5jWDhWe0J0/SBx
         /TOM4gdX3sHCo2YW8gGsSZF6Yp/TnE9i//H5+u8KlrArCvqwa/Xu/U/7fNIeG7mP+OSL
         +Ang==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yx0rOMhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020a0cf851000000b004bb5ce188e4si8606744qvo.479.2022.11.09.21.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 21:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yx0rOMhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ot0Jw-0000b3-Pc; Thu, 10 Nov 2022 00:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Jv-0000Wx-5Q
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:41:47 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Jt-0003dT-JZ
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:41:46 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so3864647pjk.2
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 21:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQXhA4Oyy0yFYYRexi166bjice8R7QX7i1WuCZtn2+Q=;
 b=yx0rOMhCFoSAd4qE/sf66RIoVvekeK1Drwy6DBQz5gLdAcspcsRxO89RbZerSt9qRD
 uPJbOaNNyLKWn3qOAGVuvRStl9f2dXm3gtrAJhMRp/KFA25GAKgtA1RmN0pCf1Z7ZbnW
 jVFXrywVRH28pujtVtLfjJOe5yM9OEz4G7BR7iyXx3/kQYZwjz7ijO7YzBcP6IIyP4oz
 aIPd5w2DOvPK0FU5G2mYQ9gXDGcpDvN9V4X9M1LxXUOzmYr2JNK3rWJaD6oXv4tLDubH
 bC1AKTREaLl7TRLVCGbnkmKjU93qeoPpRXrc20IKQwttUU5hY3bNIZ/TgKEED0CclO48
 XGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQXhA4Oyy0yFYYRexi166bjice8R7QX7i1WuCZtn2+Q=;
 b=ibYvctsDYJJZ+E43rzs6fk6FobbJbIUsyiuI4VY1NdJY6TIXzFRuVdeAq7g37RVkT+
 7fYyKUE22UzFGLySttr3nLcqK9Ops+OwHt4Bw6SSoJvtESIlOa3WWmJJSUXTiQM4Kfb2
 TwWJ8Ff4gmvfPF7Fi9VTVqU/hcMlwTjWw9IwVO9VgPMtSz6OjFjDLeJboCSrpEWCxmGO
 1hzQ6Nmo6hhEf5+NF6oAVTF/TOsrB3gICe7qJu8uSOXuHwoznExcZj1PT2g0wqe1JdYh
 lTrUmz8zthlKjHfZXTBIIow6480SWo4IQG05RRJsZu4CKbCYKaOvz2w3oYkSztxJ2emW
 ZDTQ==
X-Gm-Message-State: ACrzQf1qX9APCYGW9CzJw6zYLG740GYLfFgHsyHyBzLJ8TY7wDKmjmOi
 IHp7ADB9BLQyhAWHKjd19v0rtg==
X-Received: by 2002:a17:90a:b383:b0:216:df8f:3c3 with SMTP id
 e3-20020a17090ab38300b00216df8f03c3mr33241274pjr.8.1668058904258; 
 Wed, 09 Nov 2022 21:41:44 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 a7-20020aa78e87000000b0056b9c2699cesm9235405pfr.46.2022.11.09.21.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:41:43 -0800 (PST)
Message-ID: <4eeae5b0-dd1b-c724-ae8d-950cc047389c@linaro.org>
Date: Thu, 10 Nov 2022 16:41:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 2/9] hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: Q0DUJLiQA/Kr

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMUV3 device to 3-phase reset.  The legacy
> reset method doesn't do anything that's invalid in the hold phase, so
> the conversion only requires changing it to a hold phase method, and
> using the 3-phase versions of the "save the parent reset method and
> chain to it" code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/smmuv3.h |  2 +-
>   hw/arm/smmuv3.c         | 12 ++++++++----
>   2 files changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
