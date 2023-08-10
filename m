Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp811742ejc;
        Thu, 10 Aug 2023 09:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGGkqMAJcsI9rdcmri7neblvep/X2nGCWV+u72Uk47CPeJkiiR9HStZgzGJnqGHZCw03SP
X-Received: by 2002:a05:620a:1989:b0:76c:cce2:e7d5 with SMTP id bm9-20020a05620a198900b0076ccce2e7d5mr2764276qkb.62.1691686554361;
        Thu, 10 Aug 2023 09:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691686554; cv=none;
        d=google.com; s=arc-20160816;
        b=MK4VHxEPFO6OIhOtBa5UN9KraGgVOdkDBor1yU4h4lkyvQJzylrKttHAv1es7vSwX4
         EW2vJ8cvzZ0vWlN/3dlZv10W9HbkRsqMEZkVn5xTdJKVJJCVa544oEb/SrUMGe7MVUz0
         0L3zqAfJbfA0fay3xF/668PfELEFxLXMBBwBmZqzM1HDPmBm2vNerwT6Vrv0/Kucn5gC
         Z0PwIV9stzoBUokr1NIGXoSAF55yj69tQLISqG6q9qDSmyY04SVO3Vck2kn/D/LoUBjX
         QAFJXQMCElxYxIfUXtT2nw42oZd1CvvxOeGKBvGz7+Yzr1QuJNBGkd+nxr3F8vEwrZP3
         zSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8JLrsi72dJaTqD97zah1hf72b4FSENd6+9ETRpnla5Q=;
        fh=suv5xTjx36fqisDPVLYE9Wxpju9TBVv1sbkAE72NWoc=;
        b=do9CXpfV0WAZ6BNEAdoXiV1nHfMIxgY29IRp6Hea43vU2sQb5h5SUgJoD96sCCWl55
         zzPjzhh20BopOZH23OoZspmk+wit6ZV9QHgpUpM9YIOUUYxMnWJ7YBY4vKaA/87Mbl+2
         MjYAiRCfb+BSXLN51SvtZVWdcEF8x5OWR3+UIvwD/mQLPKywxYHEjAO3zhq5JiTNgQrr
         GHHAg9R1ctC9eYTHDtifGM3SQqKDf5HOiarHIsRyAvhMTJY8XKWXmdmEtpnrnNEWTRS2
         eVvxas3J7Xr6hzERiysfultoGUTghp5bY0AERcQv//GeaXPs0HAm+uV4udyIKr/iEQrV
         t3eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q0ryHXKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a280100b007698a002e13si1199372qkp.575.2023.08.10.09.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q0ryHXKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8wW-0008JE-96; Thu, 10 Aug 2023 12:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qU8wU-0008I9-DV
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:55:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qU8wR-00040h-U7
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:55:22 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-687087d8ddaso1029704b3a.1
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691686518; x=1692291318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8JLrsi72dJaTqD97zah1hf72b4FSENd6+9ETRpnla5Q=;
 b=q0ryHXKNCcr22ezNw6NtoiLbaDgXGAzHKJ9/GSzOsMYndZcSp8W+jkkewTG/r53Ju+
 sXPn46nenuxlfqfb5nOPVGnU7Zs/P5uAdontyZn3vwgQBgOnpoXW2Cm471dqf3OatYZT
 8+14Q7oYJkJ3++4PFVlqcXGCI7WEs8rBaipBhUZFOTS+GcjGirvHtDzmHcn+JLHLwF26
 1G8c6GFKmWYWRSUR/BYYpmyvGjxqQ4c5Zj25XtAwNN61Pr4EsWvScqg6EjaQI6cGwygw
 sVPK0N9s66byBbc6FDWY8EOG0xkEb2ffVKRmKulUXIha3cRlpyVAszfe9z91HxBXMUcC
 zhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691686518; x=1692291318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8JLrsi72dJaTqD97zah1hf72b4FSENd6+9ETRpnla5Q=;
 b=ks71iqNIV79eEAa0lW8XR4IrwJptlTEUhwPayeltMpNzZCYjzXutVFJDxlTwVQYFTm
 TKzehCYofok8Ak1BP1O7FF54nM6h2GLiS4r+4v+yVWOn3mv4T1IoNZ/MQDjnBfE9QgkF
 gC+cdciQmvlPDxnVsNStGKpPa4K/d/8rpWdRinrEsziO9QNVWCv1/VQXoeh3zVk+sBKu
 xfggZKQbcuS9HAHZdk2ssG14OrR5wx0lLB2/Q1Lm+WgB0gPIgnS9PLB6NNlBaBp2LvM4
 gtM/qRz6O6ZACQ3hXdPENL09UUp5gGLGfCjdxRYBN3/eX8+XyhlvIVMUNdWFQ7RciitR
 Lq7A==
X-Gm-Message-State: AOJu0Ywaz8DQRlVC2QB5FA73gSEBDUEDPmnHegltYjAiT9pDxoTgWbwV
 4CJstr9/hZRrjX9z4Zhgqsjq5Q==
X-Received: by 2002:a05:6a20:bf19:b0:138:1c5b:24c3 with SMTP id
 gc25-20020a056a20bf1900b001381c5b24c3mr3191086pzb.49.1691686518281; 
 Thu, 10 Aug 2023 09:55:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164?
 ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a633745000000b00563da87a52dsm1774337pgn.40.2023.08.10.09.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 09:55:17 -0700 (PDT)
Message-ID: <6dbafe59-f7ce-12f6-e8c7-eefc7665f598@linaro.org>
Date: Thu, 10 Aug 2023 09:55:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 12/24] tcg/aarch64: Implement negsetcond_*
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-13-richard.henderson@linaro.org>
 <CAFEAcA9dqnaqGrLz804UB8zHSnbCEWwhv1nzvdt_j0CS3=mCSg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9dqnaqGrLz804UB8zHSnbCEWwhv1nzvdt_j0CS3=mCSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.156,
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
X-TUID: gs8ZvbFR1P9l

On 8/10/23 09:39, Peter Maydell wrote:
>> +    case INDEX_op_negsetcond_i32:
>> +        a2 = (int32_t)a2;
>> +        /* FALLTHRU */
> 
> I see this is what we already do for setcond and movcond,
> but how does it work when the 2nd input is a register?
> Or is reg-reg guaranteed to always use the _i64 op?

For reg-reg, a2 < 31, so the sign-extend does nothing.


r~
