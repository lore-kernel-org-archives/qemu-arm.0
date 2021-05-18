Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp480361lfm;
        Tue, 18 May 2021 07:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOh2cdlH9lQ3vmfPhODlcTqOCgI7Kym87edg2bEUlmkTMn4QtlQAnjlfKsZyymluLSXBfU
X-Received: by 2002:a05:6000:1147:: with SMTP id d7mr7668601wrx.302.1621349183200;
        Tue, 18 May 2021 07:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621349183; cv=none;
        d=google.com; s=arc-20160816;
        b=k4+tzAYVVU6V2wX1f4uXyhxb5qW4uCfsYWL4esdTfyfeBsuZHk9AGDQS12RvX4SQ1O
         ctsaVVtTRHCx1UXsphJRYYGuoyHKlCDYjCyLm9bkukicxAAFmBR0+BmTM/Xnlg5P0UgO
         h0Ja22boS3ga092wCO4dpZd3CbGClJnpmbeyQ4b/N9JnxbifEZP+mpK1bctPApxvhXQ/
         53CaTd2EFVi4fB6QtkcKOOT7jUfz2dg9gmaaN9v7RixvE9v01Sn2jAXGjxR17F0OmcpT
         oZq3bXJp8JrgBPVS753Czigz8QiradxzJ2sF2J4dwLZRpKOEQd+jzzOYOHjQ1G5SXIRz
         MMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=da1X5FDtZQFaLk6YknN3fhzzydUuvdyIdH0SwN1kKAQ=;
        b=NY8k4LOapLWrFAuCvCiCMYQGrM/6ZqJsJINoH5DWkg+bgn89kq/JI2JwPzmRJG1BGJ
         +Bt+hUlw7PT5233UZ9Ha8kd3lkcJVsLAjYr+UU9MBFuhpFUeGw+pD/++msVnHftF42oP
         9wQa1ev0ozQFATk8uA/PYCPyswpm+KIpeoNkr5sRISdye2SEUUhLnvhJ/5dmFpYilnA1
         Q16ccvFlUwdOb2l5cQ+uB8h3YQsZIHfGpBWqbgfckelhCKgawDJOZIWX6x2xDPM9J/7H
         vMQfLP7qGq19dcZ6XvxYTpsP7bu4xeVfoHsjbfz6qKUCZv8fOzaM6jwMXZnEldOPRUhl
         8JrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nerQXeJa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si378205wrb.162.2021.05.18.07.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 07:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nerQXeJa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj0zG-0003FL-26
	for alex.bennee@linaro.org; Tue, 18 May 2021 10:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0yP-000353-3r
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:45:43 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:44784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0yI-00031F-HF
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:45:28 -0400
Received: by mail-vk1-xa29.google.com with SMTP id 15so1871889vkn.11
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 07:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=da1X5FDtZQFaLk6YknN3fhzzydUuvdyIdH0SwN1kKAQ=;
 b=nerQXeJaZvqvPeX5A5IaVcnS9Sm0q1YKLrva0qUaA8foIkSn+U85sub19F4w9xUcLb
 RjedmwJPam29h1LhD34c8EJ7mIHw54g4VkbCSO7wbjmL1Td3fybRgcdAnDXGDbDa93BO
 p4KlzUXpg23qCCh5GRhkFYa6QlxDRTbOHKBc2Ej8/iHwRhZKKx9f7OIj6ftl8vPgs6Jc
 JuShjZ8VjT1PhtEMVJWmKqBixg/DoxihwUL0OQlgdVd0afbMaPs4OLlRjqhW/aNcwNLr
 78kkT8jSr7BJ2RCPLMNHpuXX5nKh17HJErmbwBDcSMWZ6NP5gH6fxgpDJSO2pazzMo6M
 +7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=da1X5FDtZQFaLk6YknN3fhzzydUuvdyIdH0SwN1kKAQ=;
 b=Mt8S7fQDo4/lN4CVdSbMZ2f8+S395yomfn2NYiJiUQfRJUrNAnBthBCox+n2d10tPb
 D+50akK1nEdwkWodLzhJx4KjZYqbJQ+7id0RKJlpVbamNtHYWcCeCiBf1FS2P/1RxehR
 PwVk0Xp0YPcLHMZrPJwRUnEpuWxNPH+aztBQ6XFDoZdFS8DaZpmZpvts5KRuf7bbBdp6
 K6LFVGolp27IZijjlcvJStCJukpjAJeTrb04g7JB6lsC13M0WQSVWUnMfW+Gf3mU5ZFn
 StkyfB29oGCT4Hd3qk7Ye+6lk4omuKvT2E+YSLl8oF1CxPJvL7zjFbIutK+2zMvg1DZO
 zvJw==
X-Gm-Message-State: AOAM532ZZjCWr/qGaWdofNeMYWVjMVrb6QqBKWhGwcMp4v5m4C4nz1JJ
 usxKnUGqaHFAHT2cWEk7nsgTSFMkYwxh5wCQ
X-Received: by 2002:a1f:2b14:: with SMTP id r20mr6345684vkr.9.1621349121229;
 Tue, 18 May 2021 07:45:21 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id o72sm1961830vka.30.2021.05.18.07.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:45:20 -0700 (PDT)
Subject: Re: [PATCH v1 08/11] target/arm: Implement bfloat16 matrix multiply
 accumulate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-9-richard.henderson@linaro.org>
 <CAFEAcA_T9f47uZSEt9BRsThxLsvauTPMiDSNM8B5=Dk5xRQ+wg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40bfafe9-ba14-f718-3240-102766f17811@linaro.org>
Date: Tue, 18 May 2021 09:45:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_T9f47uZSEt9BRsThxLsvauTPMiDSNM8B5=Dk5xRQ+wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa29.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ALeaet61535

On 5/18/21 7:37 AM, Peter Maydell wrote:
> On Sat, 17 Apr 2021 at 01:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is BFMMLA for both AArch64 AdvSIMD and SVE,
>> and VMMLA.BF16 for AArch32 NEON.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
>> +{
>> +    intptr_t s, opr_sz = simd_oprsz(desc);
>> +    float32 *d = vd, *a = va;
>> +    uint32_t *n = vn, *m = vm;
>> +
>> +    for (s = 0; s < opr_sz / 4; s += 4) {
>> +        float32 sum00, sum01, sum10, sum11;
>> +
>> +        /*
>> +         * Process the entire segment at once, writing back the
>> +         * results only after we've consumed all of the inputs.
>> +         *
>> +         * Key to indicies by column:
> 
> "indices"
> 
>> +         *               i   j           i   k             j   k
>> +         */
>> +        sum00 = a[s + H4(0 + 0)];
>> +        sum00 = bfdotadd(sum00, n[s + H4(0 + 0)], m[s + H4(0 + 0)]);
>> +        sum00 = bfdotadd(sum00, n[s + H4(0 + 1)], m[s + H4(0 + 1)]);
> 
> I can't make these indices match up with the arm arm pseudocode ones,
> which index by "4*i + 2*k + 0" and "4*i + 2*k + 1", not "2*i + k";
> are we hiding a division by 2 somewhere?

Yes.  We're passing BFloat16 pairs via uint32_t[] to bfdotadd().


r~
