Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1863571lfm;
        Sat, 11 Jul 2020 12:30:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHxZl4tEbrpAoao9e/+zTrbgbEpkfL0m7MrPdmu3aUtGwjNob3rUV9C3PSol5qgUm+rUvm
X-Received: by 2002:a25:3447:: with SMTP id b68mr56749248yba.15.1594495840599;
        Sat, 11 Jul 2020 12:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594495840; cv=none;
        d=google.com; s=arc-20160816;
        b=tzBo2G2EtPX3paZ4S4hPoXcXwuiu+HFfPHo56KypcV9txdhcEGDs2a5YA+C7uwA64H
         f6p6TfXZ/Oqg0P/nWknflS7C9TG+UUD9AfqP4r4KOMuFhko5smn/PIaIcdSkpeLDMc8d
         HSwzTwk/Il5772z+7vwnyDEzbm4X5gJ32h3wIKVhmY7MDtsjBWN2wEI5xIEqnwjrcTQ6
         mTdKV4X1M2rluz5wkSCYsv4Fi2JRCMIU3t+P8GnTKjszJSiqbxRcn95RPlokoD0/ij9G
         RkNHAXItKytNXz7qcugzKtZzFR2/aSl6n7WXSpo5L4vUFsQDwhRZ+Hek5xZ75BCasVYN
         cX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ADqhXlBAKOY1A6rUObovQLsndeam+0jy3VqgCTTXjgA=;
        b=kZMU1DyZHnIyn2567/wbKxjCjnhx6EX9T3w6E1GkMXhCnCr6s92jhCSQcU4f/Nw22y
         isVGn0rn+2QYK/ze+9Wyws0YMZ8CAYbtsjpc8s2BMH6x0l/yT+qdvY8L+2+E2wSKmPg0
         PyPyvldtqxjUu5z16FuhqwId8EOdlxeI/ugh59L5V8gbCL8EDKxvjfY79wfb9p/cCcNy
         P9e+rex2jEZqwtFTVciC4G3MuSsuccTJs3igBUTR2i9Q0KgUKGvAG0Mx3g0cLresWFI3
         PSWjgFPAWjIFi5wREf+BThv2eSqIFDnXKMWmEedaBcctHm3g/YB7n8WGrasjqH925z8U
         nZ9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yl2KexIG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si8611412ybk.368.2020.07.11.12.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jul 2020 12:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yl2KexIG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juLCp-0007nN-On
	for alex.bennee@linaro.org; Sat, 11 Jul 2020 15:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1juLCh-0007n1-2l
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 15:30:31 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1juLCc-0005SX-FT
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 15:30:30 -0400
Received: by mail-pf1-x441.google.com with SMTP id z3so4023973pfn.12
 for <qemu-arm@nongnu.org>; Sat, 11 Jul 2020 12:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ADqhXlBAKOY1A6rUObovQLsndeam+0jy3VqgCTTXjgA=;
 b=yl2KexIGCkF5uTK47FyKzjNwxvzkxDP5JkACYb6IwxkFV+783DAzhZuUw8UW59LE4x
 qhGaUk9jfmXNcDVqt2wAgA6RyUVIsTWToWRuZCvC6NDLLzYFPUx0xiFWawGnOXiEz54L
 LixeS+DDw9YTzhIgLBrZpiFoX9u3TVXlGr3IdrK3SQ7YRCOZHl/gTUqDlTzF7SBwjD+e
 SY68VtYk/sX4sQm4eSmaSlv7/eKaAddNogpeqRhVdxsn4SMwI1318raBR5vrBc/tZUH7
 oDtTMyGDQER6bkgenZmaf6FJA5y+eemb991eFavkKjeNbzTx57ggNCo1lMkn+/OekJ/v
 btqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ADqhXlBAKOY1A6rUObovQLsndeam+0jy3VqgCTTXjgA=;
 b=oh8kCKAgB+ydJumymbyIlZBnfaGdDqZrPSkQUbvIP+moa1dPGlhaj6a1W+y5sZLT6J
 JiyATdkAc0Tr9bRR5/4+0oiIj3vSDaDHH5JWiseHrC3CO67yXXYT8SfIgvPe7UjYXoGK
 DOVVHx00XX5UH4VQ84XfWpWl/f8pXfli27eu45b1cnawFogpgg/qCitZT3AogpGTJe/G
 wG0wqlH9444FTj9eT3cLmLUxNc81/dRj1cnDc2dyNjFUIpMaO3p4iN8qzdrKrU5/sYrr
 l0qBM3W1VeMoNEvHmrTf7YVx2jsJ9W1QvINzoE39W1KGRFjuVu8LzWI8N0ieDMVH6ffJ
 Ap7A==
X-Gm-Message-State: AOAM5322DqFetvZHLjBYrFbYKLeXNq2eu+kHjBe+H3J47rLMlXTGXMTg
 FHufBeOkrgtNKxsJiwEZRrtipA==
X-Received: by 2002:a63:b50e:: with SMTP id y14mr31977543pge.416.1594495823820; 
 Sat, 11 Jul 2020 12:30:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j3sm9359026pfe.102.2020.07.11.12.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jul 2020 12:30:23 -0700 (PDT)
Subject: Re: [PATCH v2 06/17] linux-user: Do not use guest_addr_valid for
 h2g_valid
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-7-richard.henderson@linaro.org>
 <CAFEAcA_ca4vAxB-2qfsXVUNPUdyFTJQtcBdkegn4ub8SOiR2TA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6c82116-8b33-716f-e76b-ecad2f24267d@linaro.org>
Date: Sat, 11 Jul 2020 12:30:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ca4vAxB-2qfsXVUNPUdyFTJQtcBdkegn4ub8SOiR2TA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /pe55NF3vThg

On 6/25/20 9:34 AM, Peter Maydell wrote:
> On Fri, 5 Jun 2020 at 05:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is the only use of guest_addr_valid that does not begin
>> with a guest address, but a host address being transformed to
>> a guest address.
>>
>> We will shortly adjust guest_addr_valid to handle guest memory
>> tags, and the host address should not be subjected to that.
>>
>> Move h2g_valid adjacent to the other h2g macros.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/exec/cpu_ldst.h | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
>> index c14a48f65e..3930362e20 100644
>> --- a/include/exec/cpu_ldst.h
>> +++ b/include/exec/cpu_ldst.h
>> @@ -77,15 +77,16 @@ typedef uint64_t abi_ptr;
>>  #else
>>  #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
>>  #endif
>> -#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
>>
>>  static inline int guest_range_valid(unsigned long start, unsigned long len)
>>  {
>>      return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
>>  }
>>
>> +#define h2g_valid(x)  ((uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
> 
> The old implementation returns true for
> HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
> (because there's a different definition of guest_addr_valid() there)
> but this one does a range check even in that case.

It's part and parcel with patch 1, wherein we are in fact attempting to limit
the guest address space to GUEST_ADDR_MAX.

That's why I put patch 1 first, so the behaviour change happens there.

>>  #define h2g_nocheck(x) ({ \
>> -    unsigned long __ret = (unsigned long)(x) - guest_base; \
>> +    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
>>      (abi_ptr)__ret; \
>>  })
> 
> Why the type change? This seems unrelated.

Dropped.  Though at some point we should purge unsigned long, as there is
always a clearer type to use.


r~
