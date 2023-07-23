Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1213686ejb;
        Sun, 23 Jul 2023 02:35:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFV6M96yTMnCgFxaw5LRsYnAxKTBDm0gg3pcnpaezC4oFpFDGHKBj5rNAio78/l8uWv9768
X-Received: by 2002:ac8:7d0a:0:b0:405:5092:1b1 with SMTP id g10-20020ac87d0a000000b00405509201b1mr5458783qtb.31.1690104913729;
        Sun, 23 Jul 2023 02:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690104913; cv=none;
        d=google.com; s=arc-20160816;
        b=0VuR3vo2+DyQ20T3NHllDt97rjt6MjEQwtXoB7iQgdI3EBrKlAG8WIJE9wsR4WE5eL
         vkO41iFGrCWHgPFkBxVL1ElpVxncQ6N9VNhwrECj/+rj4efAQWhyefqKMvysoIA13gOo
         bH+9FeGcukTdHF0csGtCt4qkqmo0XolABTN+rHoh//xKYByZxitxb837NW5qyoLIfmZ6
         3J9HChuitLKFfKUtNNc9oUdmR3QUmlo0ezt2jgAPtQCGCkfJqRenoy+VAHJ8r/TggZjh
         q+y3+95fqgaIcCRTttKx6qV0cOkrLQGFq3wTo1Pjb/OmgyPVAZZ6V3HeOIIKHh3c5j2t
         jsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ufTaOqucoACZyX5nZsQaNYieI6w6ujkHPIZ/siWPnLY=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=AxBzQiyoIkmesyKAX68p+TfpVA47UXHdLbn1TLa4JfbZVd9Odnd0K5DtzVPWpFGJ98
         jOuB+HoJcaFnxg4XzK4TV+KF/HWNLtDE5nMIx1qqsK8FqZ8jWBNnN90zUDAzvZlrhMi3
         JUoSaHF4YZL0uBZSRBWUDsRzKWb7UA4eEGe8HAtJPfhUS1SKdaLSFD0jRaWwPenJztCR
         o5RmwUgxjFLNlrN7rlptCRQyAAYb5icP7S68COEIfYfrAsiXwTd7MzaZaSMDF/GoPeA8
         Ttkky2wq2SVWlFZ6Vf2wsdTOANrlCHR9AlQ0uEn48evmkl4WUdX2IuYzdWn+7hAi5krT
         eFQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJ1DKEVo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1-20020ac85a01000000b003f9ae403acasi3685773qta.263.2023.07.23.02.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 02:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJ1DKEVo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNVTw-0005F6-CW; Sun, 23 Jul 2023 05:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNVTu-0005EK-9B
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 05:34:26 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNVTo-0003J6-EX
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 05:34:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fc02a92dcfso26265765e9.0
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 02:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690104858; x=1690709658;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ufTaOqucoACZyX5nZsQaNYieI6w6ujkHPIZ/siWPnLY=;
 b=gJ1DKEVo4UI7AnB89eTLmFH616bFYLT1oJI/nS89JkrMldxODYkIAA/OU9+GNiZsyC
 7nly2Zg8t6vVY5H3a7pdfy7tOJVIj9kro0yS6cQuAXMHD87suAzQbFpbPaPbqgJTP7O+
 sblYZAu8wy46sKejWu3Tu13Ep8A9dQP655yNgUEzO7Y/Q8++hMO1ekqqP+N7v/Z7ACVJ
 OH6Y4bROe/wapsf6y6ura/FWUmjxZ0EWvYVkHpI0r12E/uhme12bR/w+nbUgsWZs+C+L
 /Ixz2uQJxRc7xodwG2PxjwElu/wLeSe7A42HrCtNJecpRZIIrzQlwZow6DHIUK4mLRh0
 PmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690104858; x=1690709658;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ufTaOqucoACZyX5nZsQaNYieI6w6ujkHPIZ/siWPnLY=;
 b=lrhj+hQiJEpgVp4pFRPUsyfY2f+xb14yhT9KrTk8Bo7I9NrVsXbgwWb7wKGSTWWsOu
 G4dTxkrTanNwp9YF1ZAMhednscETl0Tf2AZcv9ik/KhVvCOj8mCteQjL33yNcxDqA1JW
 4S1HQRQaaFgn84vzeRbmoXccehQ8GpBFLYD0KHGL9eZSqKyIz/JubnKyRxR8P5QoPHRT
 M/ptBLrtZjVGceSOaZOmBE1EM277l8ae7AjZVmrOlKHKoOhnJX7IyniA2KQMfCllFZvx
 yBQawDGJLh9jrxzkcBBKoYNxDDUtfF2otbnee6NdCe/GG7oCIzfXgaCTNgAcsNjSGTuG
 WQjw==
X-Gm-Message-State: ABy/qLaWmbQz3DrTUacF2/5OsmJSkQq/+Gagf/qVHbwOMMu6KBG+XK+a
 2LgwiZoL/N1ZZxpeCHQHVmZvuA==
X-Received: by 2002:a7b:c01a:0:b0:3f9:c986:a2ca with SMTP id
 c26-20020a7bc01a000000b003f9c986a2camr5123882wmb.24.1690104857908; 
 Sun, 23 Jul 2023 02:34:17 -0700 (PDT)
Received: from [172.20.2.226]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a7bcb56000000b003fbb5506e54sm7175795wmj.29.2023.07.23.02.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 02:34:17 -0700 (PDT)
Message-ID: <47c6ff2d-85c4-4e44-a381-1e48e7aec7e0@linaro.org>
Date: Sun, 23 Jul 2023 10:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/14] target/arm/ptw: Don't report GPC faults on stage 1
 ptw as stage2 faults
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XUP8ulPSKDz5

On 7/14/23 16:46, Peter Maydell wrote:
> In S1_ptw_translate() we set up the ARMMMUFaultInfo if the attempt to
> translate the page descriptor address into a physical address fails.
> This used to only be possible if we are doing a stage 2 ptw for that
> descriptor address, and so the code always sets fi->stage2 and
> fi->s1ptw to true.  However, with FEAT_RME it is also possible for
> the lookup of the page descriptor address to fail because of a
> Granule Protection Check fault.  These should not be reported as
> stage 2, otherwise arm_deliver_fault() will incorrectly set
> HPFAR_EL2.  Similarly the s1ptw bit should only be set for stage 2
> faults on stage 1 translation table walks, i.e.  not for GPC faults.
> 
> Add a comment to the the other place where we might detect a
> stage2-fault-on-stage-1-ptw, in arm_casq_ptw(), noting why we know in
> that case that it must really be a stage 2 fault and not a GPC fault.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
