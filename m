Received: by 2002:a05:7022:658f:b0:69:9a19:fb41 with SMTP id bd15csp1735859dlb;
        Mon, 28 Aug 2023 14:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdK/85jyQPUEoLg3cSN2tbFurbhDBsy6pGBxX64uOtWdhCbVySDLDhxKNPdsouW6UZOHPm
X-Received: by 2002:a0c:f3cf:0:b0:63c:ee64:8b98 with SMTP id f15-20020a0cf3cf000000b0063cee648b98mr29744275qvm.13.1693259139610;
        Mon, 28 Aug 2023 14:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693259139; cv=none;
        d=google.com; s=arc-20160816;
        b=WIdFlr7rP3QhAfeGncojU3+gND2gh+nsCzpZRStp6b6baqeB0x3btxejodk8FtCClz
         ekIF4YsK8e13ORJk7zKthsurqhDZHIbfJnDxmEyI7thX3B7mw9JgBM5MFvDObPWyyOrP
         2fi5Mh4dnUdIZ6UnWDl3NN8Pbo+C5GDyBoiFMIGbMJLs4xci9fFRc8a2ph+IJduRBIOd
         OBE9J/smiUGjMZzC9YxO+g9/RDqlIkMLlu8aK5uBT6Z9cggGZf/NIdbefDfKS47DBdEq
         NUc/H3Sdu9b+n0RC8sqB7jQgtzskSpnVMJF4MzmnRxcNtcjeSNIvR7hSqTg0N7fwx6hq
         yw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/h/vWdv5CmDOL9Cr4FGosR9u+cFVbfE1GllsGXlBpk4=;
        fh=pRIqGhWxk7ftaJ+M8zsARGOMvhjPktmrX0FNV2kooGA=;
        b=JACL2qlCanZrp3gpNlo8SErGW22VVeOq87YKMLDrPlsiuJG1v/DLOUsVjkmTGoDAsQ
         +meM7y8z3JmW5wZQrwuuVvSOKSfAGpESPvgqlQ8NuBt1ig2GhB6+jISj3Ttan787HL/2
         fEzvxNN41W4wOnkC74vZe7CrXZzseyBfDOOI3mJaMUqVFY8XHJ7R3xylum6EX6xYbvVi
         V8OmfklmI0GEyRsTF50EhBOfOeAveVZy9dsdJKiy11cJMopdQ24mk5hwe/CsbJ5bAG2H
         DfBcr3WKeRDHrRuHKPocC0WSxfYmMR033x3Jsx9kXB8abpsdTN3Ugg6wq9w4FhugR9r+
         puFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o2VpZ41X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020a0cf00c000000b0064b37be0bfesi5243930qvk.132.2023.08.28.14.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 14:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o2VpZ41X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qak38-0002TH-77; Mon, 28 Aug 2023 17:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qak36-0002RJ-A9
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 17:45:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qak34-0007dv-0v
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 17:45:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401ceda85cdso8586075e9.1
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 14:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693259124; x=1693863924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/h/vWdv5CmDOL9Cr4FGosR9u+cFVbfE1GllsGXlBpk4=;
 b=o2VpZ41XfhcHJoU58RphZIm6NHsd5gR6IAkvSmOgL+0B/SBbFJogZeMpPJXPLBQAvg
 oUbMYl50ma54Fp7bbsc0NaGqyjKMZxAJl0FWxIB/Emgauc61WFOVC/R+nA2SmmJlHx+r
 duzBi4LvUQUpidXnzhB/1JBPrVcJAiqxFXUbVdbtRJx1hf4DcUhDwURjIeyUnfmWyh1n
 nqpxEwdy0LtZv3YgbLf+GPO1U/D+eHxRtROEJgIgTYSFac1iZDsAGHjorw9akP/vklMM
 PSE/nJ5Gh0asqKs3qsBLv7XTgcKidWag6p4jowHLDHi1oa6sB80lJHdT3L7oX+lughPS
 SzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693259124; x=1693863924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/h/vWdv5CmDOL9Cr4FGosR9u+cFVbfE1GllsGXlBpk4=;
 b=L/BN+q1H8L1VyLPbWG5c/QVAHim2nvL2iwp62GFBzZOVa+q6ZfQzJtwap6PURv0iin
 g5j8425I3l1130MXAtnLH9jIS0PnoHUtGWpbZKojYc+ryWGUr1wIJQtsQ6giX82SvvIj
 ECcnY7+rsqeoBsf50r+rtnj6vBnOwxqIiDInbiQ5vInOlkyxY7xN0oDlp1iXX5qqAL2y
 Mj8JPIEGccxVzg3Is7sDtLR0o1DatF1t+fJFeElb7z7Lmd0ODuNabOXPU7ZCxKHzFlpP
 7wMFqJ3pqSO1JWLulFalp+8n1ia0bCKglg/lVki3J95aFBoWC5Kmj03z5ecy+enko9Vi
 4UEA==
X-Gm-Message-State: AOJu0Ywy2lX00d5TSamOxYazP82y4UDfXK504kkJBrHmd8sK5r4eFf/3
 Vna6xWYXi4b/Szrrr9kgMWzmiA==
X-Received: by 2002:a05:600c:21c5:b0:401:bd2e:49fc with SMTP id
 x5-20020a05600c21c500b00401bd2e49fcmr6102608wmj.24.1693259124064; 
 Mon, 28 Aug 2023 14:45:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c045000b003fee0741b8csm14982848wmb.23.2023.08.28.14.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 14:45:23 -0700 (PDT)
Message-ID: <ac9fafb6-a751-1503-a5c8-f71c9909a6e2@linaro.org>
Date: Mon, 28 Aug 2023 23:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 7/8] target/helper: Remove unnecessary 'qemu/main-loop.h'
 header
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-8-philmd@linaro.org>
 <37e187bd-a21e-f9a2-ec51-a114cb5083aa@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <37e187bd-a21e-f9a2-ec51-a114cb5083aa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: NNAP0c5zaweA

On 28/8/23 20:40, Richard Henderson wrote:
> On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
>> "qemu/main-loop.h" declares functions related to QEMU's
>> main loop mutex, which these files don't access. Remove
>> the unused "qemu/main-loop.h" header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/riscv/pmu.h                   | 2 --
>>   target/xtensa/mmu_helper.c           | 2 --
>>   target/xtensa/op_helper.c            | 2 --
> 
> At least these 3 files do two things.

I can compile these files adding '#error' in "qemu/main-loop.h".

