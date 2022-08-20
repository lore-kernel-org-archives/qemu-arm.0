Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp85469ejc;
        Sat, 20 Aug 2022 11:57:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6v/1MWPcYaJfWtfZvq72xsRvK4yqLB4hbXWv8x9rPDBen4/oGwPlO4eMSwXP5T7hatXuM9
X-Received: by 2002:a05:620a:258a:b0:6b6:641c:9edf with SMTP id x10-20020a05620a258a00b006b6641c9edfmr8829215qko.77.1661021865851;
        Sat, 20 Aug 2022 11:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661021865; cv=none;
        d=google.com; s=arc-20160816;
        b=mP2oi4pnaYhKXY3S44Vm3sZwN5SedjMsf+DOBY8uJ/Y17ckSTg5+Bypzk2T4VqRWZ7
         kJqASHewPsRYOVXTH61eaqHaNDYI8bCWJ7BHnpDQzDLJQT1OqX0egD+vJoLRPMGEiH1z
         cXfN1+znYxe641P8AphZTbc99n2XbisoQSrEAsHKvqPIGDRscom+L3vO++NZeI+rW69R
         jBJwjXXcS0Nfc5bBDjdrhNVUpmyLUK4woMoaRW4ZOvZ0a4/IS2f4ZD/2AI/Ilf+X+XpT
         9/fgzbw/CjH1dRpOHGS+uJor/+NmOgxdAsruJu35Vwzk/eA+Hh1Ocjq3RYdvahFvvzCh
         e01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=RcCcG2Xsp4REOgL3NEvHwIpTPCnURS+hNVyxWjRZ4Vs=;
        b=z5C28rGt6gFFAOXT0yYdAmrdxG2p5KUmDh2t1ZKynHL88mIBBY9FgoCovEgrggXrtl
         HaQuYppPqQYKP58yluog1WEQW7G6alm/1u701e0Fe+u7GD6PoNjWgQCB+3sZ4DVGCkVA
         tyD/sSzGpP0JAgD9eHMVZFVdPyEhp9n52nx1NyKDAswmgo+Zc4yBQQE93wQcTfoVo6ur
         H9Un5oPYP4d3zWMFMXYMLJIXu8tFcJ3yKVzbNP7arHMjGCMQuZOI7xFCQi3K/+Hv4z0p
         MPno/YU1np+m0Ju9wEI95Odtqv18l/1n07YWpSs6nlXyWRvZi7ANbmBkVpYYE1E4o7D3
         N/RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o20PnFCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bw7-20020a05622a098700b0031ef6dd96f7si2882561qtb.494.2022.08.20.11.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Aug 2022 11:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o20PnFCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oPTfF-0006dx-Ct
	for alex.bennee@linaro.org; Sat, 20 Aug 2022 14:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPTeK-00068n-1I
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 14:56:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPTeG-00062w-Ge
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 14:56:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id f21so7428464pjt.2
 for <qemu-arm@nongnu.org>; Sat, 20 Aug 2022 11:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=RcCcG2Xsp4REOgL3NEvHwIpTPCnURS+hNVyxWjRZ4Vs=;
 b=o20PnFCvFh/AafdsEXOsK7iTUAQbUU5oMqjziK5/7dzWgDOUptEcnge+R4FqWdi8Qa
 zIMFS9+M4MrJTc0CqK29mhyEesY/nbZTFyNi3qAntG9/XzJYUTW1FRBSOdZj6wxdHsk0
 klPOHHjrYwtQSrku20NGiUVRxLSi6E/gL2DgRpH8cg37IB/nD2fbyXBAXDEBrOIjjipS
 xRD7aA1gWxxn5BmLmCD0IzqBUfIAJBSVlU5H+/xeoTi7dlKIs+b4CjgeIqSdb80GK8Nb
 3JL3W2MVNXQ8KLRUa/oluzQlUH3UQdvsOvh0iiQkO/ByV5xJ//wGopmd7d3TpV7HgKik
 mANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RcCcG2Xsp4REOgL3NEvHwIpTPCnURS+hNVyxWjRZ4Vs=;
 b=WdaBoaUQBSs55LF0NzKAeSNTpa9aKVZz+nNqT5GxiYzvYpf392M1R5g6j31pSpxIWr
 1Ld3r67wUOiccH4RxxDGbAklKNdistceSWrek9/gojf+yEH7rdKCxGBzrKdGw0RsRG6o
 J7/ZdtrpzVGYBHJROrdqpxlXiXz3WkW+VRIVA+L/8ChFECeX7P25WRfUu2MMN+eFFWpn
 gRA9JsYesPkqdfnmun7YjbNF1cGWhit9bPZhShc1tY/ldzxXkvBYncIrBcyhobL32yue
 tmGjPVqgr6t6ZwYYoeHAQz7naKzE7PQ+0y1SpOoVJs65dxqVZpzL0uoARmtQRlu4cR3a
 Z+eA==
X-Gm-Message-State: ACgBeo3U72EDwKmwxx2y2YFRgLPdBUj629mYpY0HYP31C/K9/8DYV8ye
 yBZ3IMGMxOY4IP5Taw9CBw3hxA==
X-Received: by 2002:a17:90a:c381:b0:1fb:c32:6324 with SMTP id
 h1-20020a17090ac38100b001fb0c326324mr2581296pjt.21.1661021797226; 
 Sat, 20 Aug 2022 11:56:37 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:142b:b2fd:5c12:7cf3?
 ([2602:47:d49d:ec01:142b:b2fd:5c12:7cf3])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a62a20e000000b0050dc7628183sm5706462pff.93.2022.08.20.11.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Aug 2022 11:56:36 -0700 (PDT)
Message-ID: <852e5c15-eb4c-dba4-4811-ced13742506c@linaro.org>
Date: Sat, 20 Aug 2022 11:56:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/10] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-11-peter.maydell@linaro.org>
 <CAFEAcA-FTaf1FKYgmaoocaDGdozx3hr3xvQ7zRhUDPacvhxr6A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-FTaf1FKYgmaoocaDGdozx3hr3xvQ7zRhUDPacvhxr6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w9KyjhPpXH0W

On 8/11/22 10:26, Peter Maydell wrote:
> On Thu, 11 Aug 2022 at 18:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
>> compliant PMU.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Oops, forgot the docs update:
> 
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -52,6 +52,7 @@ the following architecture extensions:
>   - FEAT_PMULL (PMULL, PMULL2 instructions)
>   - FEAT_PMUv3p1 (PMU Extensions v3.1)
>   - FEAT_PMUv3p4 (PMU Extensions v3.4)
> +- FEAT_PMUv3p5 (PMU Extensions v3.5)
>   - FEAT_RAS (Reliability, availability, and serviceability)
>   - FEAT_RASv1p1 (RAS Extension v1.1)
>   - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
