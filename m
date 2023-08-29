Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3819716ejc;
        Tue, 29 Aug 2023 10:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnyowwbGx4/e4fJaww6nxHskHw6i1Frp07oXU+wgvVdFf97fgGyscFj6Az4+bafWCRCLoZ
X-Received: by 2002:a05:622a:a0b:b0:403:f438:1803 with SMTP id bv11-20020a05622a0a0b00b00403f4381803mr3959703qtb.3.1693330054885;
        Tue, 29 Aug 2023 10:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693330054; cv=none;
        d=google.com; s=arc-20160816;
        b=r8l/7asrpt5+1dmikwH8JmIq/u+KqwUAo/hk3NDOEXnNqcLI0hHhVRRzGzUqLP8BUc
         gahPt0UgpK7VqWuWyAOCwXF+lwgPKAaaaJLvDgyfkRUGAYZko9/s4dBOEoQtwcAaCOJt
         vV6uNhc9VfzmbGmyh+BD2PnCf9zpKiodc4CWlKxdU2jkbUdqjbV1DJT4TZ66sPxoydX4
         PS6aAzucQ8vssATHWvazYkt/OCJ0hYL1PeJsiop7rJSbFr2F6TKvWtCHlMscrK1jUrEB
         jwpLW0s07+vkFvjAJzMIee/88zQLmDfuUM4j1yQZIzSjS8ABNCB1vTR68OC7DFNLD4zG
         KXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Lyv+D+KGyuTqw+YAmZ9qDtHxL9wczkbZBa4v+NA3PLo=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=L6ZckE/F/CrsieWCMd2d5OwgQPx0391l4jcTFLK38uS0UanMsOqQaLI0xbT9mEu57k
         PE4HO1DDwF5ThkYkj56KIg1e2zQkISuJGjN2eogi2uZEGmhIeqpRmYeWBGUdSMwhGA0l
         S+WMLzc7nNvcROxiWd+QhKZxIiEYUzIsS91a0x89itHKHb03LXyhm0myCFbT+nyVCzp4
         JekAV4qQGCuriM9Mt+EizOrMc7cdQNGesEoPLRnEO6mhdHVxPTCt/iHtg9zFYHFLcrU9
         ktTzLV62gJwNMeAwdt8qbBFeDXALN4kmEZE7QDAzofAFxbHmCxUX/EemTIIOgQBfCuuT
         LI/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r2NURfWJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020a05622a174800b004120cdcb199si6062905qtk.796.2023.08.29.10.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 10:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r2NURfWJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qb2UE-00063q-0d; Tue, 29 Aug 2023 13:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2UA-00062x-Dh
 for qemu-devel@nongnu.org; Tue, 29 Aug 2023 13:26:38 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2U7-0001Za-1z
 for qemu-devel@nongnu.org; Tue, 29 Aug 2023 13:26:37 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c0bae4da38so349155ad.0
 for <qemu-devel@nongnu.org>; Tue, 29 Aug 2023 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693329993; x=1693934793;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lyv+D+KGyuTqw+YAmZ9qDtHxL9wczkbZBa4v+NA3PLo=;
 b=r2NURfWJBWbcyEdktyan5AEXSYvjbzjN5NyJo2+QBLmMiaGem0kGumu2ZQmXG9bCi/
 kEoty3bbmaXn6vXwPpjUjuNmVMzlTQAHH+3ZKR5jgGu7gA9eKBrhGevpSxZHa2oKcKb4
 evNkXTGZmiN50E/+Ja7I3R2EThhMUXQSzBo4VR5ScxdVtsZMTSN99mjPoRve0435yrJt
 VVdDxz/B+IVfXvGVwcSmAazgWdRf8IyZ0SNee5Uf6e1A/o/AH+DmLCXOAOJdzT5INKhO
 WaOraxRO8jEcq0RJK8lKU9BGzFI60w5mFZVGj/4kdSBtI4D3KxEfxDAzsYzCJmQQgqvT
 STVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329993; x=1693934793;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lyv+D+KGyuTqw+YAmZ9qDtHxL9wczkbZBa4v+NA3PLo=;
 b=N6TGrcB6h8YgDOBQ2kcDWyMs2sWIbsH7d8ftc7ZpMFncmCahgOiEMV/EAjUsrIVoXi
 k5YH+2yxFUXVriMtEBcMtaQUW30Cm1L8UnKQUiYQqyHAzde6bq9U6coF/10y64UPfUSr
 d2gtRAl5US0LUaxnmFkez+a08tFJWOyZVGD6AQC0bk5S5YOw3PRFycIKE3YlH7xMOY4t
 UzOjDxZWDnI+Ji/BCkT2FoeYILn02EBdnbsZ8LfwshT1itKuK/eFRft7KdnJSphX5meD
 VzZMx1hHcmuO4DFFVr6U+aN2l2uBLISsfpCOI5dI7QuqbSPWPdgFZDigYtVb3VkO22oS
 EDhQ==
X-Gm-Message-State: AOJu0YwWaIpo2fcP9iNlBuEHBqBIqkQmG1piRqCC7s249IZ5hcmuxr24
 N2Vj1icUdL4tDNzHaVEuSaDO5g==
X-Received: by 2002:a17:902:e881:b0:1c0:afda:7707 with SMTP id
 w1-20020a170902e88100b001c0afda7707mr4413488plg.34.1693329993368; 
 Tue, 29 Aug 2023 10:26:33 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 bd10-20020a170902830a00b001bc59cd718asm9520927plb.278.2023.08.29.10.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:26:32 -0700 (PDT)
Message-ID: <cc27c688-ec22-7f7a-5e7e-f681176f7c60@linaro.org>
Date: Tue, 29 Aug 2023 10:26:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.2 3/3] hw/arm: Set number of MPU regions correctly
 for an505, an521, an524
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230724174335.2150499-1-peter.maydell@linaro.org>
 <20230724174335.2150499-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230724174335.2150499-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7OAOP0JVFxil

On 7/24/23 10:43, Peter Maydell wrote:
> The IoTKit, SSE200 and SSE300 all default to 8 MPU regions.  The
> MPS2/MPS3 FPGA images don't override these except in the case of
> AN547, which uses 16 MPU regions.
> 
> Define properties on the ARMSSE object for the MPU regions (using the
> same names as the documented RTL configuration settings, and
> following the pattern we already have for this device of using
> all-caps names as the RTL does), and set them in the board code.
> 
> We don't actually need to override the default except on AN547,
> but it's simpler code to have the board code set them always
> rather than tracking which board subtypes want to set them to
> a non-default value separately from what that value is.
> 
> Tho overall effect is that for mps2-an505, mps2-an521 and mps3-an524
> we now correctly use 8 MPU regions, while mps3-an547 stays at its
> current 16 regions.
> 
> It's possible some guest code wrongly depended on the previous
> incorrectly modeled number of memory regions. (Such guest code
> should ideally check the number of regions via the MPU_TYPE
> register.) The old behaviour can be obtained with additional
> -global arguments to QEMU:
> 
> For mps2-an521 and mps2-an524:
>   -global sse-200.CPU0_MPU_NS=16 -global sse-200.CPU0_MPU_S=16 -global sse-200.CPU1_MPU_NS=16 -global sse-200.CPU1_MPU_S=16
> 
> For mps2-an505:
>   -global sse-200.CPU0_MPU_NS=16 -global sse-200.CPU0_MPU_S=16
> 
> NB that the way the implementation allows this use of -global
> is slightly fragile: if the board code explicitly sets the
> properties on the sse-200 object, this overrides the -global
> command line option. So we rely on:
>   - the boards that need fixing all happen to use the SSE defaults
>   - we can write the board code to only set the property if it
>     is different from the default, rather than having all boards
>     explicitly set the property
>   - the board that does need to use a non-default value happens
>     to need to set it to the same value (16) we previously used
> This works, but there are some kinds of refactoring of the
> mps2-tz.c code that would break the support for -global here.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1772
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I'm not super-enthusiastic about the -global handling here, as you
> may have guessed from the wording above, though it does avoid having
> explicit back-compat code.  The other option for back-compat would be
> to add an explicit board property to say "use the old values".
> ---
>   include/hw/arm/armsse.h |  5 +++++
>   hw/arm/armsse.c         | 16 ++++++++++++++++
>   hw/arm/mps2-tz.c        | 29 +++++++++++++++++++++++++++++
>   3 files changed, 50 insertions(+)

Looks reasonable.  I can't think of any global properties that are better.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
