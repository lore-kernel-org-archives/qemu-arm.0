Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1121120ejc;
        Thu, 23 Feb 2023 13:28:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/a48C1es1jlo8OLG3HC0YV6Q31t9FPXfueMf1UpCa8ly37i5w4LORpuAe39MqZx3i01/xM
X-Received: by 2002:ac8:7d03:0:b0:3b8:6cb3:e54a with SMTP id g3-20020ac87d03000000b003b86cb3e54amr13548670qtb.5.1677187681992;
        Thu, 23 Feb 2023 13:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677187681; cv=none;
        d=google.com; s=arc-20160816;
        b=UoukjUgZWqunOBEve+R9q5AhhdbZgA0ylYCmIk6Pid4s13UEQiALkpUoPtGvAnuihv
         /X5oBrQ2vHqeNUR7KMTD0eB0zfGY7Ck2EoRsxDI144Dzdt0a5lOSq1RXzhrELH80sbLd
         /Lod9JyduKdf2WQDj1xzL7bDMipbaV6sBCaI1cd+YwvCnItNuNdlX3aEK7p7rOFXOJMY
         bQlQoCs/CXC9AMDTzKQPyctQBbnhPJrbHxq5/0J57KjT3AqRzUIU6R4xOv9xO9nFCTz4
         AmTJLKGGc7UJwTxxIpikCArx0RTbP4LaMbuXAQ8gPXMznH59/MMhirVwnvE47XtvIRdH
         u7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4m4bF9u+6z0gKSMiMEbU7jDKImeSK+8cUSpx0GZuv3w=;
        b=ZAVLkd0cJiObByzdeUvxMisKMxoDi2wAAjK1Wj/ISJNgntjZrlPg44xGJV+3kpW/sx
         aUIQu2QUk06aO6aAJp5WSZ2SwcdOZ3OtHNfl2k8g7leyNQUa/SqVw20en1utuEd5ps0K
         SqpQxFrgw8Gvn0CzZFRVRs3CGlOI8ctLTHrnuj5ZgpoWlLNRX/LwL0O3eRetwV0nxL8h
         p0dzrJqAfTfk1meM3tTXWKNHQgC+xM0PhysRnMfrBvC/t7LzdTY68fOmGuPvJNkh/by5
         +7gxFMH7DRRi2K5nY0JGX5+oD2klVU+RilsfG6xeVrQFtagMHdF2fm0XBfCXdBszDFq1
         xXMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gGAFcPG/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10-20020ac8014a000000b003b1db7f5648si8016710qtg.189.2023.02.23.13.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 13:28:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gGAFcPG/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVJ84-00075v-OJ; Thu, 23 Feb 2023 16:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ83-00075f-Ig
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 16:27:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ82-0001eP-1j
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 16:27:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so437320wmb.1
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 13:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4m4bF9u+6z0gKSMiMEbU7jDKImeSK+8cUSpx0GZuv3w=;
 b=gGAFcPG/WQEx1MCepSJYxfpvrfsu8akjuYAtbQmTH2B71XbiHnnsSIHkYdTugeNo7C
 zg94+Ca4DTlSmr4LNU4chwF598JrIzcrOqZQF82wqRCUbF4XQ+finQHrdGaIzc3gaNn6
 DrN4itDhbAjpc05p0+32YH431UB6mTuYaeghLnz+ydqAvuVQ/y8LpTBZAyfVoWI5At/i
 UPRoTSMpC8PKu2xAG5G68tLwvgrlvIFgYSsbo8WxJ+SCZPO678e0shppDCa8RZh0b7Zm
 oiQMzwCvvkTHpnkO5DWD4dQoe0fPAiDv8kRaMW3YpBJu2dWFfVSB3IJSat/9mDr4ymlT
 jxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4m4bF9u+6z0gKSMiMEbU7jDKImeSK+8cUSpx0GZuv3w=;
 b=qGkQ6IM+E22OPIqMbvqeSzbwu2AiYzvh3vIJV27ngXOXpNIkvcgiGR1Wl6SF10RayY
 qq1DOU7jAPD51ChmxL/aM4bB6m0EPmF8bjUjSpiWT8Y1/ivGx4fosckHDWMRwoLhIUNV
 YWLUM4a7EzrMrWlbmiFiCxxInCJ/U8ceRVhgHPgyg/UwaiAg/UFrakvQ4l4Xs5iLDxFL
 1WVYq2rK1Hd27Yp6XQWnWXhAyztrKVjUttu9aUdLurHeO1xnWc3LK1MJSGvsEyOtzrIi
 cSAENfLLDXsSTMq8/tUSJhOsC9EKNxxVWan4RJBHSbIdpgHlxt6WDMRpz+7TnNGQNL5O
 gJsA==
X-Gm-Message-State: AO0yUKXOwdUqtxon1jEtzxwJYn3BCYTnNxG03tlzFZnICNrwwtn3/QIE
 i2IuqhpKHrUXnDOQTPiZ6H06bxi8/llQfhqP
X-Received: by 2002:a05:600c:1d23:b0:3e7:f108:664c with SMTP id
 l35-20020a05600c1d2300b003e7f108664cmr8066771wms.40.1677187668290; 
 Thu, 23 Feb 2023 13:27:48 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a5d453b000000b002c577e2fc87sm12953853wra.15.2023.02.23.13.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:27:47 -0800 (PST)
Message-ID: <c82c10b6-d50d-b7a7-5b53-05ee9f1f69e6@linaro.org>
Date: Thu, 23 Feb 2023 22:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 05/13] softmmu/physmem: Check watchpoints for read+write
 at once
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223204342.1093632-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: btU5icMlBVje

On 23/2/23 21:43, Richard Henderson wrote:
> Atomic operations are read-modify-write, and we'd like to
> be able to test both read and write with one call.  This is
> easy enough, with BP_MEM_READ | BP_MEM_WRITE.
> 
> Add BP_HIT_SHIFT to make it easy to set BP_WATCHPOINT_HIT_*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h |  7 ++++---
>   softmmu/physmem.c     | 19 ++++++++++---------
>   2 files changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

