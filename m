Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3929504lfa;
        Mon, 7 Jun 2021 16:50:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6adDkeLsJ9JKIzxke58sjnaGHTkil5+HCrlD7rVaVE1RHtJJhj1+FBqQUmNiYg31+6o4m
X-Received: by 2002:ac8:1188:: with SMTP id d8mr18578863qtj.218.1623109851094;
        Mon, 07 Jun 2021 16:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623109851; cv=none;
        d=google.com; s=arc-20160816;
        b=us7zg5AvBdKJGg96m45IGnHt9NYbY7JYTVaZZHgZpQ/eXqQPFd+qhQNQQONf6G61G9
         lWZpbfVopDMer3iEx8itLar2s0mgmkIf45uuWSOFvK6hxMEMalYvInr8ntpa86bgRf8z
         9XotCwihybodTLkw9Os9wtXtNxI4pOEFrA2Zsa/cxOAoObGQYHcCWTeNsFNPvm/Xx2Y9
         lqYJirnwlbPc6Ee94UEy56c3PEDnQcGV8o/OxaVBAG4rJOLsiAfr0zgPV8N4v5QReNJy
         ucfR6rGOg9euRcfRoXALMk9D8H3+Yin46OqKLljRbUYp72VBOC/8hQD9pGq86IYwWqDg
         K29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jdED51TAuB9TNMe+MlCQsJfh4AeOA+tfzS6KZ9hNIa8=;
        b=KnD2yzjcwHZFqwUR3ZvEIlvHpLirRSrHgYJARvZNWYlWUyNMuZfMG8iuoZCIaQBU61
         MiSw9qPkof4IJRr9daXdtuG+syhl8HEoMxgrC3QLg0Z/IMSlM+P+rt/8qh1pouCmeIJG
         hD6BR7JITKmlxVdmuG1g2y5UycniXtnpX6IgSwgNF2Sj9aDzNoi7jqxSTk6muuk2fNtW
         C8n8AjtgXOmi+2DzkYvTniRKSvIF8F5WB9EO2CcFLWDqynrZbzXQy2JsOfECIa6YQhC/
         RyQ3dkk/Ec6d2CiUY8bD9GlGYr46p/+Jpp8mYkksA8QdJNtDijP+LNeHjnNaLA/wB8kP
         PRZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IscrLSQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si5349827qkp.356.2021.06.07.16.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 16:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IscrLSQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqP18-000370-EF
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 19:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqP0s-0002t0-Sp
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 19:50:34 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqP0q-0004p5-PI
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 19:50:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso1066434pjb.5
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 16:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jdED51TAuB9TNMe+MlCQsJfh4AeOA+tfzS6KZ9hNIa8=;
 b=IscrLSQO33bKvMxlEFVIbKZeQjRj5zVN27AH7RdMTEOpMMtBGifCv7SVrQraxiI+S1
 GXTDinRpP+Ckhp/SFiDA56u4/UjfpRD/FXsQ21IBlcscX5T6CfzNm0owEz0KAkkWom/3
 rgfJMECf/fM+UAX09aUoOAbS4g+wmaI0CFI06c39HBnLv6sEXQLJhhzHzFKM+yD94TUj
 EchKPKZ2lzM3by6xfl7qNHof4UUft8jKtgtVFpD+r7Nl0LtD+NDPtdYppN6XWnvw5++/
 TCWyIBTnTEVVMieigXnaKq8C1anLvKUywKKxAJxKCb9WCx4wUWWqBbiSkcPHR8rqATvk
 jUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jdED51TAuB9TNMe+MlCQsJfh4AeOA+tfzS6KZ9hNIa8=;
 b=j+V7ncCJ0oc5pCNl3KiUuxAv4sS/hxObZl6hy+BrRHEHnNNyHa1jQxiNIBINjH/rj5
 U665bOQN6UCz2r0INtFhC1GPq2KSEcLX6bdz9zNZvGWthlZFyEuuP6RqwgSAsofnWWMV
 Mo4Jhd+UaDW0pgsRmjvGcLoOBNLc5AKRrX4N8ojYvYeqLCxiuFgoID5dyBmYJCbX+Y9H
 Li0X4c4nY8YniUXkrQg73hSfYDK+aBKIcoXooPo7bh9obAJA2mLlv5NU3fwlGOV550xR
 AUC9sgrA9PvFr9Mv32eHlfPHfMhqUxceOXMhBWUwJeNyQbqeIfciduv7oRfuArxTmP0h
 55Sw==
X-Gm-Message-State: AOAM530MgOomEIEUP1wwQKspKcl9PcdRxv+tfNRECGW2DNzyUW6qNxnW
 yk1y74p2ok2k0ooV3jr3Z/KuDA==
X-Received: by 2002:a17:902:9a42:b029:f5:1cf7:2e52 with SMTP id
 x2-20020a1709029a42b02900f51cf72e52mr20221053plv.25.1623109831019; 
 Mon, 07 Jun 2021 16:50:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 l128sm9921988pgl.18.2021.06.07.16.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 16:50:30 -0700 (PDT)
Subject: Re: [PATCH 05/55] target/arm: Let vfp_access_check() handle late NOCP
 checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc54c530-ae79-1006-b645-fe05cb821072@linaro.org>
Date: Mon, 7 Jun 2021 16:50:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: KEj9vcu7qNlf

On 6/7/21 9:57 AM, Peter Maydell wrote:
> In commit a3494d4671797c we reworked the M-profile handling of its
> checks for when the NOCP exception should be raised because the FPU
> is disabled, so that (in line with the architecture) the NOCP check
> is done early over a large range of the encoding space, and takes
> precedence over UNDEF exceptions.  As part of this, we removed the
> code from full_vfp_access_check() which raised an exception there for
> M-profile with the FPU disabled, because it was no longer reachable.
> 
> For MVE, some instructions which are outside the "coprocessor space"
> region of the encoding space must nonetheless do "is the FPU enabled"
> checks and possibly raise a NOCP exception.  (In particular this
> covers the MVE-specific low-overhead branch insns LCTP, DLSTP and
> WLSTP.) To support these insns, reinstate the code in
> full_vfp_access_check(), so that their trans functions can call
> vfp_access_check() and get the correct behaviour.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
