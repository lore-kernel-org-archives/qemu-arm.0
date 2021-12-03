Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1181001lfk;
        Thu, 2 Dec 2021 22:30:22 -0800 (PST)
X-Received: by 2002:a17:902:b718:b0:143:72b7:409e with SMTP id d24-20020a170902b71800b0014372b7409emr20879997pls.28.1638513021875;
        Thu, 02 Dec 2021 22:30:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638513021; cv=none;
        d=google.com; s=arc-20160816;
        b=dJ6CxmRDHsWGaVBZeXPV00vr7TbL+iefNcCuQYk4hUk1vkRGqUlzh5KCFetyljXfea
         Gi9a5/lf8j6ect68BI5vNykt+gUftn953WsJV+6e6ra1vtDKSPK8eN6fIH8RSYVH52uh
         xszkL4cDLUXua12A5LzUX2ijxgAaPpwhF3k/IeLwPFo+ZtzM/Pid9bN1kUXR/mXbDUE8
         D8nyCrb6qPNZisoO0O1badDmkrNj8nEuxxj5bwyS1XC2nyqfqfD3uO63RXqe5EAt6owP
         gj6vQRG+yZs/aRjkWx228iwE3PCMZznr3rGofQop7cjYZCRHvSkF5LM9lf2ke9Feo2xs
         JhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4jONKXOMunkyiqT3MSB3vxLJydEqjGHgihDnQVNcsRQ=;
        b=R/ON2sdfMfnmBuPcQPegvGo7yc06BJiwLSSBTiOGAedgE64sxwet/UV4K8Zj7waUfL
         mxXyh4Fo+0YCumdqo4YpA8frgHJl1/EoIR+28gq/8eQFU1ag11KCQ7Je+8e+aZZJCirk
         LcPcZ6fJlbHVERmE0Shq5XNnqZGxfOwvI5HIvzh3jH3RkprUN6AO5iMFechQUsMgP76y
         wnBCuWZLeer1HRwPQmLaufA/GQjr9x8msiWyyMFbuUeb4z5HC/YJ6Qs6BxDaMYOZ36Jx
         eDEjRQUtiU/KGiUbZpkld9O4CNvtvMPo7WZhr6kC9tHZjTutepuAsVhiAdiNiAOc0xSc
         82zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QPmElWqo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y4sor1199994plg.61.2021.12.02.22.30.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Dec 2021 22:30:21 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QPmElWqo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4jONKXOMunkyiqT3MSB3vxLJydEqjGHgihDnQVNcsRQ=;
        b=QPmElWqoZ+MJiFyCMnTLFiMlQuodXv8Km3uWYdG/hnBz3izi/mQJKvQDJL00NkwoZF
         ZkAIvIefp7eiPcO0jCpFZIa23DsjiEKj7+ipeTEkI6IfLUphy/AVFWbHXUH8TN8BrFqS
         QfpnWoTajhUkq+6b4j9HiWP43Fgj3z0+XbaWgKUaYvWQ6xhW2QCyq10d908HjzkcEsMR
         DSX9cwzJ6zaWS2yKqLZXlDJ+Q1DmxpB7b9wHdubngmvqFxbjWPvNSV6JUxr5CXCOglXZ
         kb2kPhbPiArcSIgLYMufoqUqjln8oWx5agqubOYRkY7TLcOMG8lDtGxuvTkWt/mn6sVf
         Xz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4jONKXOMunkyiqT3MSB3vxLJydEqjGHgihDnQVNcsRQ=;
        b=bBXczWxAwRdOPo9+Aa3OWUTvmi+xU1gnE8Ln4d+PZpDfiZ1qyG2kqaT6+dVniOhoQJ
         p7sbBFtTAdjerWryf1xoChFgSvSm1HlHlw56pP+jSPZ9Sv0Ljvcv8PcahmqjZ4fRLFPE
         7udh3uVIrVYpvkxNpGM4wb5IrpIjjbalGdVJP4fuYrm4r2kTGn8I1Pp1grm5eN3cop0c
         YagAlRFcbGbpTWnaI+WZKIeYSljuHr/6fY4u7w9/lPVdbOAJ3NkfTxbiO8xcW+5lJTHe
         ZFr6oNBq5jYDt/PNIa8B/GVVquATdvs8m7aFJ/Hl8TKfcViNZBKdBMek5WxDl/I/HxjA
         uw9A==
X-Gm-Message-State: AOAM531FOj+di/1KHDy9ckqByxbaxO0IVJURshNCzxagbImu62o7A+vk
	vqKgS/qYsvbUvu+/Bct/5WRS2deU
X-Google-Smtp-Source: ABdhPJxg+cEH/zua/TC+w0qO2+fNPiJcNmOUT16L9sTRDb2q5qjjJY7v3c/63N6FOvaKHq318Thkcw==
X-Received: by 2002:a17:902:c643:b0:141:cf6b:6999 with SMTP id s3-20020a170902c64300b00141cf6b6999mr20821735pls.80.1638513021354;
        Thu, 02 Dec 2021 22:30:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id p124sm1757886pfg.110.2021.12.02.22.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 22:30:20 -0800 (PST)
Subject: Re: Suggestions for TCG performance improvements
To: Emilio Cota <cota@braap.org>, Vasilev Oleg <vasilev.oleg@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Plotnik Nikolay <plotnik.nikolay@huawei.com>,
 Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 Konobeev Vladimir <konobeev.vladimir@huawei.com>,
 "Chengen (William, FixNet)" <chengen@huawei.com>
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <CAJY1Aq7-J+nnf1k_HdbUnc3mJvua0VHYPNMokCKeitG1ZbH91g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <abd0ca8a-6272-cf5a-f841-272c40d7f654@linaro.org>
Date: Thu, 2 Dec 2021 22:30:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJY1Aq7-J+nnf1k_HdbUnc3mJvua0VHYPNMokCKeitG1ZbH91g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: BXVfkC1tEUcB

On 12/2/21 9:21 PM, Emilio Cota wrote:
> On Thu, Dec 2, 2021 at 4:47 AM Vasilev Oleg <vasilev.oleg@huawei.com> wrote:
>> The mentioned paper[4] also describes other possible improvements.
>> Some of those are already implemented (such as victim TLB and dynamic
>> size for TLB), but others are not (e.g. TLB lookup uninlining and
>> set-associative TLB layer). Do you think those improvements
>> worth trying?
> 
> I cannot find the emails, but I do remember that Richard wrote tcg-i386 patches
> for uninlining TLB lookups. Unfortunately they resulted in a slowdown on
> modern machines.

That code is still around at
https://github.com/rth7680/qemu/tree/tcg-softmmu-ool


r~
