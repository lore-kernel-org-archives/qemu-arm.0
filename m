Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp812730ejx;
        Wed, 9 Nov 2022 21:41:19 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7TpFZWBt9ul8yw0eecBxOU60RYtGPvapdyG+Opf5IZB8XSrC4VKNOlGgxk67RzqKSIyTqu
X-Received: by 2002:a37:694:0:b0:6ec:51cd:c376 with SMTP id 142-20020a370694000000b006ec51cdc376mr1192435qkg.300.1668058879125;
        Wed, 09 Nov 2022 21:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668058879; cv=none;
        d=google.com; s=arc-20160816;
        b=dHE0sySxa2XuDmC+oltDNkisZhUdQmvOSy2/xdVtRO6lMqs7Qy39derHIMgj6W4L6z
         Prmc7aq0/Ha5Px+dUD65EWz02V3fU+IhPYA7AvlfSAITP2zNpUl93p2jUYkz8oFBAMAX
         a0HURw9xDLcpB4Dy8JiVKzXU9kVZL5xtywiZzC0JDQmAWi/PfTOJUUIfRl1gf3vcC61z
         6ZtNxjewC2DoTxD03wW0AJwoE4Q43YfoIsHEM1rMph/RHnUBde8c657jFG4tf56/8V3U
         mXJ2ldxoMHrScK3735yks5LfdkbE+WP6mVRw5zo+LQWkWewi0LVmTQCMSWJ8StRv9XDS
         Zu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/P3gxgO+QBnDwJGxjmfJCBToANCVMCf/BmXc9OJ8r50=;
        b=XjBaS5KUe0bIARYMN9DHkrWw6O0VUXDXtxUyQkoO8yV4jEtSMlhn20fdS9ylAT4XcM
         EEHITBqgchnqRkG27KAjznEZfGqaiIfFDnTWFEbQ61OUtCYe4yivDnVBYGmaXV+JMwop
         XVg9C3/XbgAPb6e8nR9as4jjd7/h7jFmz9iQvQbVpPBYbNljbklE3Nf6PDaNhg/LOgLp
         LM5ehN5ISCluud/5rr0b7jypYA40LzvCcrisxKIsxurhKq3VplVDTLHNMK1dMDjJxIiN
         EP0tnVOuVW2VtU4e6iDJGOWj/nrUW5vSjPrpt/BO7zioCJVw2Q+aNWWkKw8DLLseWtcl
         mlrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nz+QKYtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw5-20020a0562140f0500b004b1c0f36799si9725679qvb.535.2022.11.09.21.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 21:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nz+QKYtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ot0JD-0007id-Io; Thu, 10 Nov 2022 00:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0JB-0007iE-W2
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:41:02 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0JA-0001QU-AQ
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:41:01 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q9so926902pfg.5
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 21:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/P3gxgO+QBnDwJGxjmfJCBToANCVMCf/BmXc9OJ8r50=;
 b=nz+QKYtY7x09tJiCQTo9YnjRNpQxZMd556emOlwbYYNLwP1sB9kAduXKaq+QX+Pcd0
 hJybfZxacTggrQ0al1ZA/7kpecbl/r8gR7DYVWVbe009eWsTbRlACGY3OW0xs6KJQocX
 VoVJn9mfnyZnlpGGSzh24l5GyBAhw2l3477+yIBshSkjSx1tx+/+6g68yFIkg1YKZhNc
 eyFZ3z2gTUEEPJZGr7Us6zitWsiJXHlNjqVeQmeII3whDZZ+9hyyALEooOA68Fjtd+NW
 2VrHlCOla3MNALb6TBgDA748j18drW1i4iHfKkb2hnR2ZICz1F2B+/6P52DEtsSrdM+c
 4qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/P3gxgO+QBnDwJGxjmfJCBToANCVMCf/BmXc9OJ8r50=;
 b=nWw5c62KAuTwArwlqPJJK+NW8poqoz++cE3UaBHMiqAV1h0hucw9ZzvamcoSjl8OoX
 kSURxfBoFrL3vbmQ+mXsjmvtSLevvpVY+8lIYeruZUajzq1AxHic0EAiPCEwZG+aR1wD
 t5MH2HvZwxw0sN7wSwXGw7V/sCWdC0DZFtHniYhsP037Lpn94vRYYRUoe0TE3/lb2GTR
 C70G+r6gDUOtfZrlhxTOvc/gqZ194Lvtu1BHBbwPnrg+XyHqLCbUCKvL1bMM/vIVkIBM
 zBjloMI8lfCbFU+uzn46WMc/MVplzsn6HHZ3rZUg0lVNaq0ygqTgx2JMtEoIt6oNvSOM
 vTBA==
X-Gm-Message-State: ACrzQf1deA+lTqn69x4gsJFleGMUDAVag61zXRuq61PnDebP5bNTXaOu
 qwau6CDXfMvxZKCX+e8UGI5qaA==
X-Received: by 2002:a63:ce42:0:b0:45a:f77f:a57f with SMTP id
 r2-20020a63ce42000000b0045af77fa57fmr1840402pgi.439.1668058858691; 
 Wed, 09 Nov 2022 21:40:58 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm10145998plf.179.2022.11.09.21.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:40:58 -0800 (PST)
Message-ID: <fd4859ed-1398-f6ea-5e79-e0540506824f@linaro.org>
Date: Thu, 10 Nov 2022 16:40:53 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 1/9] hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DIb6qnICBKAO

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMU device to 3-phase reset.  The legacy method
> doesn't do anything that's invalid in the hold phase, so the
> conversion is simple and not a behaviour change.
> 
> Note that we must convert this base class before we can convert the
> TYPE_ARM_SMMUV3 subclass -- transitional support in Resettable
> handles "chain to parent class reset" when the base class is 3-phase
> and the subclass is still using legacy reset, but not the other way
> around.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/smmu-common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

