Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp626935lfg;
        Fri, 14 May 2021 10:22:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLbdO9xruTUM1oQFnYBeZ9E21zbfOqYHlTZQP910Z+xCUTtSVk9lnkkcyogRz3CwfFYNH2
X-Received: by 2002:a05:6602:14d3:: with SMTP id b19mr28051744iow.154.1621012940655;
        Fri, 14 May 2021 10:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621012940; cv=none;
        d=google.com; s=arc-20160816;
        b=S2gVyaPzntNwTUfm/RVjtt7MednICcf4m4Cwq8mZI1Vh/YndL65nfZkvvNrRV3ixJp
         M7EzmZ6AwufSfGtZS4Z5ZVnkwN4LK7SpZHU7jL4yS0a7dpWL8B0Q9qj8IHi+D2ZDuRKt
         IC9z06FaRvsdhdou5wxASblAM7Rht4HtmRefJsAnGKhy0PKWT4Q4wt/gR4Zpk85y568V
         6kCTTmj5uF/ySeglOM2GOJmijRjZCHP/Fi85plDDvQk5SFjVWICJ+up+DmSfv1x1hfZJ
         MOmZ6NX/tw3+GzhYgjKHY/Ispe0b/zvapeQ5G3nbQQa6KiOdE6gGcSqjiJ/REI6ae4Po
         q1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=p101JPvnV3TE0rg3qeFEVqnAXcwWkum3wrKOQSta5TA=;
        b=XZ9EL+20KVHX5/tnzVUyzW5f3ZxN++a4DyhhFH5wLAFCA/uNomAD7FDON/mjUgOy0S
         P375T6Z8nRl3/mWElMST7LYAi59Jho22zEL16dtGpwGufu/BUpkyVpvrvfyNwvb/5FSK
         c1BmhGnGyOS/vVQ7IZ9OCHePLFRwXIbUn7fpMK+EmZUcuq2bz1ilo02kZKgk4D+GG3V/
         4WQ1O5hGAIfVACZ48yvC3Buyfsc+a644HfKTBusmuHQ8SdZPVGfEMeJFwrf6GYFHTrIe
         zZoBY00Y7XqGxiLpC5W2i92FgjoAe/qC++a3eYzXqRIDYKXl2YPDkpFBreZRVPZ7uZZX
         pkRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XwqrxWGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si9672099ilm.103.2021.05.14.10.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 May 2021 10:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XwqrxWGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhbW0-00060p-0R
	for alex.bennee@linaro.org; Fri, 14 May 2021 13:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhbVJ-0005yL-QY
 for qemu-arm@nongnu.org; Fri, 14 May 2021 13:21:42 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:39766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhbVE-0002tC-28
 for qemu-arm@nongnu.org; Fri, 14 May 2021 13:21:37 -0400
Received: by mail-qk1-x735.google.com with SMTP id k127so29408662qkc.6
 for <qemu-arm@nongnu.org>; Fri, 14 May 2021 10:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p101JPvnV3TE0rg3qeFEVqnAXcwWkum3wrKOQSta5TA=;
 b=XwqrxWGTRsXCe+LBhw7SUEfuV3ul/XjxxukeXFK2Od5G9ycj79iQ0OUXHcVmltegRx
 /4Zg8BViBgu31RLASyq1aaxrKQISXlyjs8Z1ldXoiQJYMj44oJOrc7jHDKfhQsfc161H
 xvyd0WTKSOHQXKZEvfJ2XSB2qykhn4AexoG2EfXoqQOC7UYaWf7U/61p+4kwrfCZgkgj
 gcDK0vKCC+J1aLRK7AUOJJqo+HVIR7nXshizjvXYXGgNbMvxjatLt4rax8KulKhvQhpY
 vMOQgZpI9MrZN3EZfW6vKGTqsQXJnUfgicyhrjVl5RyDNQ7YnhL84D4Ev0tQ5/xIKuie
 tY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p101JPvnV3TE0rg3qeFEVqnAXcwWkum3wrKOQSta5TA=;
 b=WPURQ1eHtweLtcsSDaC7XVRZ5IoWW3wjGsYVbAcLm5oMsuwixj5lYoQX5+DBW3XWSc
 EXcNoBB4DZpnO/HYRWPJhG6px0Aa7AB7vkxSHnqrjwBUn6iXula60JfsRClUNUEJHLmJ
 c9vhiZ3WwE+9ewdKx0C9LiunaU4AxjjbVKjeLuqv1++WSV4VsaUq3BfGY8otGxpIFDZr
 C5gSJ7I/lbAFrGJLg05F9F9rEB6IGjmENnMucD2UGrBl4Id4KSUd6ULQK6h8mMFdZJy9
 nQlkt8lzhLtds5OG/0EG+deJ2govy4y19/OP0RB8a0OL4YxEZHMnDAFARFr3KDMh0GIJ
 dKbw==
X-Gm-Message-State: AOAM532wlqLjIddf9Net2f5DnBBpCaaihaqa7HKcYtddRMMnYIsPXQHy
 oXolLtKQZJE/QyElhi3ytSO6R1EQaWzsHzml
X-Received: by 2002:a37:a5d7:: with SMTP id o206mr8956632qke.360.1621012890985; 
 Fri, 14 May 2021 10:21:30 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id r72sm5382166qka.18.2021.05.14.10.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 10:21:30 -0700 (PDT)
Subject: Re: [PATCH v6 82/82] target/arm: Enable SVE2 and related extensions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-83-richard.henderson@linaro.org>
 <CAFEAcA8Fic1AfAmsAavzHzsK7aXkNEC8DfTbsa3Krga66KtAdg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e951d14b-0258-8013-d33b-3bd34588a5b7@linaro.org>
Date: Fri, 14 May 2021 12:21:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Fic1AfAmsAavzHzsK7aXkNEC8DfTbsa3Krga66KtAdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
X-TUID: oH5lJ4dP6bRl

On 5/13/21 2:35 PM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.c   |  1 +
>>   target/arm/cpu64.c | 13 +++++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 0dd623e590..30fd5d5ff7 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1464,6 +1464,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>
>>           u = cpu->isar.id_isar6;
>>           u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
>> +        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
>>           cpu->isar.id_isar6 = u;
>>
>>           u = cpu->isar.mvfr0;
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index f0a9e968c9..379f90fab8 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -662,6 +662,7 @@ static void aarch64_max_initfn(Object *obj)
>>           t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
>>           t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
>>           t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
>> +        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
>>           cpu->isar.id_aa64isar1 = t;
>>
>>           t = cpu->isar.id_aa64pfr0;
>> @@ -702,6 +703,17 @@ static void aarch64_max_initfn(Object *obj)
>>           t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
>>           cpu->isar.id_aa64mmfr2 = t;
>>
>> +        t = cpu->isar.id_aa64zfr0;
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
>> +        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
>> +        cpu->isar.id_aa64zfr0 = t;
>> +
>>           /* Replicate the same data to the 32-bit id registers.  */
>>           u = cpu->isar.id_isar5;
>>           u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
>> @@ -718,6 +730,7 @@ static void aarch64_max_initfn(Object *obj)
>>           u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
>>           u = FIELD_DP32(u, ID_ISAR6, SB, 1);
>>           u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
>> +        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
>>           cpu->isar.id_isar6 = u;
>>
>>           u = cpu->isar.id_pfr0;
> 
> Do we need to clear any of these in the "user set has_neon and/or
> has_vfp to false" code in arm_cpu_realizefn() ?

Oh, hmm, yes.  Indeed, I guess we need to disable SVE as well?

I also see that ID_ISAR6.I8MM is currently handled by !has_vfp, but it's really 
an AdvSIMD aka has_neon feature.


r~
