Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3009403ejb;
        Mon, 20 Feb 2023 23:24:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9YP741FXlpt3f90Q7sxuHC4xra9e+AwGL6TNkLSN5YuCWxUMDpJ+nc0ApqbuJLagfFsFPG
X-Received: by 2002:a05:622a:58c:b0:3b8:5461:94ad with SMTP id c12-20020a05622a058c00b003b8546194admr6834630qtb.16.1676964241495;
        Mon, 20 Feb 2023 23:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676964241; cv=none;
        d=google.com; s=arc-20160816;
        b=ayTRZ+RsgmHen1URHQTkWlgfXHyDBesQwqAWxM1pIcpC5xV2L4Xbgsrmz/+FMLWtMA
         D6wJSntda1YTydAhAt50ZEo8iwgkhCCXi63+wqqdPYJmG+IuBRm1TehLzvd1NTT/8jjk
         iT/kshghU0UgBt2RU3n+K1nb8BrI7weLPBeeTRV/S9hFDngkfknohLDUpU/Uyd5K2jpy
         VCI5e9OpfzXCQl/03XQkBNJ2+SUReZVhRV33dNaAByqImz0Z1HP3QVej2CnK4bKABn4f
         UMb30XpBi/toJmPqBMFwHJ045r0NEd+3QpL4XRSA24VtEENJeVr3n29YB+xaJGC6Xirn
         SL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yG0GgYGxIW72pUC8eift4wOkilcDFYhQ4pJALdHg5hM=;
        b=SKG3Td5TbJNBN4+hF+B+0FW1SGj5FBNlTQibXHY6uqwaTc2MSrvpktMn1xX43IgNPK
         gCi+ed+/vRsV1hKMok7CWIkwJ2/EBHwL15T1ZXhhDfcSGjVBOle73anxhdCCPjlqxj//
         QAez/3evTr97q/yJh+/jwD8a+XBuCEL3eCmIeYhnnMnNgDEtheYTJXD50z0MJ93GJEKt
         ORYNMedo8Qjfi9eBvdTTDKSBYSS92Z5wnqJQaW1Xft8J9al7PY1O+J/SRwpiYP1bYtnx
         UCj3WRW1YGRihLRWDYAejAW4LFffcgEoLRgJw6GlPXyUY+PWWLjUm6VfkHlDUXKEvUOJ
         LpAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1jt95i0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4-20020a05620a44c400b0072031f74b9esi3132747qkp.425.2023.02.20.23.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:24:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1jt95i0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUMzt-0001k8-7H; Tue, 21 Feb 2023 02:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMzr-0001jV-6M
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:23:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMzp-0004PQ-Gr
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:23:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l1so3038157wry.10
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 23:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yG0GgYGxIW72pUC8eift4wOkilcDFYhQ4pJALdHg5hM=;
 b=W1jt95i0EgDzXVybEvuvpwETSHZqpPK2mngc6qaKt8lD16t1MCt0qjc/CYHzBuYJTW
 x4+FM/knEO3P1aBcKfxTDPv108U+Fz3cgu1bpbuQJ+a9ACiOsRaqiQVev6Kzl/ee5fYL
 07NB/IZhYdPYnUnIe/3FEKXVK+jMvcKINjYBnsbuB71q+JQyHrp5+hz9CEqV+UGYPsP/
 4zwaJXFw3sAGf0a3z5jSvl4TsWdSycRPydjIRTOfphfbBvsPjhyZI01ZNaJ05tC1w1oM
 WjqBQcn5xVAAQMu8lXSzYVjH5fnIuCniNsdF+tu4H+XvBzxSUb29Rl9vkPb7sS8lwDQS
 7u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yG0GgYGxIW72pUC8eift4wOkilcDFYhQ4pJALdHg5hM=;
 b=EY4joOz+JQn2/UThQnhn/P1D94prDiiKHiEFHR8oSMRonCxwM2mlZ7dLyc9pa6hZJ5
 46j/OxwwlIicr9/ic6Q4K23YhBbMvcMmPxVJeXd8V/QIQfksXry/n6bHbKoY+nUBA6GA
 tqcgBqp9tH4DrRy/2l+hTqNmLsPmpwTqwiVLDSlf5Si2YFBQUZOTP2LFei1M2hEj3UA4
 JEYa9M+AarUE3COrz+PFJaxPO5gjLoJ+SosQxkT0iF0seAy65hCw7SghSudhuRW1gwcT
 YCWRi4kvD6IC5Ez5RtpH9KcKVlmKwBCaQsrwe/Y8hgHgnQ80U9AHxQuNziJFfYdyP6C1
 WEug==
X-Gm-Message-State: AO0yUKVICQtNtv2NTDJM6oVsd72fnTt95hKbMf2eVoIguHGNw27X2Cs3
 PdYwP/37eVo3v2XoTiYIE/CJ/Q==
X-Received: by 2002:adf:db4d:0:b0:2c5:5ed0:7aaf with SMTP id
 f13-20020adfdb4d000000b002c55ed07aafmr3530039wrj.19.1676964207608; 
 Mon, 20 Feb 2023 23:23:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b002c59e001631sm3293457wrs.77.2023.02.20.23.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:23:26 -0800 (PST)
Message-ID: <ea2c0c02-5d58-28b1-cc39-dabc542de39c@linaro.org>
Date: Tue, 21 Feb 2023 08:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 12/14] target/arm: Export arm_v7m_mrs_control
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: 8nNaDAYuxsW7

On 21/2/23 03:19, Richard Henderson wrote:
> From: David Reiss <dreiss@meta.com>
> 
> Allow the function to be used outside of m_helper.c.
> Rename with an "arm_" prefix.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out of a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 3 +++
>   target/arm/m_helper.c  | 6 +++---
>   2 files changed, 6 insertions(+), 3 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

