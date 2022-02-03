Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1542419lfk;
        Wed, 2 Feb 2022 18:15:30 -0800 (PST)
X-Received: by 2002:a63:10c:: with SMTP id 12mr26188690pgb.512.1643854530397;
        Wed, 02 Feb 2022 18:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643854530; cv=none;
        d=google.com; s=arc-20160816;
        b=oG652LZDjnZCa6tH8UA5WYj5iucK5O0AJzaojadrdReVkS9GoPGY3irS/AoxvXjC4g
         jaGIDPCgXxSMIka6fp19MPiBhFOnM31W6Z8DvZwWVkroq0H88RFvP2+hYQaRGdwpiuTW
         6YMdFEUv5LnKnUXPeVAeqn7VxGzOFOSsKzKxM7z8AUPajRYTBVGn1iZyUySuP6IGjdSA
         o3AeWPrh015DTSQVzhC6QW8Csz5AfslU+ovGuiHGkuhK4xL8U84RG+Wngax1ByXFKPG1
         JeQ0LhetYTWGVVyc06IBlfgRcoSHii4rvNdHc5JhAaw54sClqaor6HitFkvr0ad+wBf5
         LjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=odaOo4DJMCQfl7oKUK6USSyGGQog4w0fIWCrWvUQ7x8=;
        b=llcg/q20f7I4oNQdiCZvPiSeqalokAT6HkBP/u1Y0VFQaALvL7A/NWV1S6Vn0/rr3J
         HDHkkbAG5DHODR+5xXWw2JwIii2tFS8WJAollQig4IFgDyyVVz089X5aGXFRn+ola9dv
         v17AZZwVV2Wl/LqC7F0D2HVD1auTTh+VAiaiznlSmw1vEEOW4LOzYNwN2lCQCtxm4/qD
         4FZa21+VSExdcSvf4vNW2PjyGgg/KLllQSrGkgHixQR0qDo22PHZxJFK8MYGyHs/4T51
         skTsecMcvNER8SC3yaHL+OoMhXn2LdFUYTnS+521EAH7TrmqgwxAmepVqcNyLlbN0sTr
         wcIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKyxbXL3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my15sor1644347pjb.6.2022.02.02.18.15.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 18:15:30 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKyxbXL3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=odaOo4DJMCQfl7oKUK6USSyGGQog4w0fIWCrWvUQ7x8=;
        b=EKyxbXL39agnM0P9rHl1FfyqtFMnvmOcmxCLJzmjuRegdAcABO5DZ6tfPykJdu7wxS
         iQmzhw0HRVMIMWgqrU64pxJE6cHgCbNGgrkAcGJHlpcyoTgO+OrZI37zSJlZHyYscqti
         Uex9OUQSZip+prjelvlowLQrooYB5R6Zxcs4z8IHpiXQ92BuY5DolHkkBnOO8XL9hAZ4
         jQBULxY/VqDgJBrTRTwiC1MyquT6bH8SjOOiKzsH2SfoeEn2hdXvWp18SDpghmRPtsX1
         2BRIMZ8+g0d6wLpC6SUtpPQSCNpsehJRoBXiXVRsKG4qonjxYyyKDBt59HIbTyW/hXNg
         Ouug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=odaOo4DJMCQfl7oKUK6USSyGGQog4w0fIWCrWvUQ7x8=;
        b=6eHyX2rBl6Bvc12WW73GAwbrFCF9GV0jBbh1GhqXTbDdoX1NsLAh6qjH7F8P3PONKE
         J1/pof1W1m6OLBPicWz1Ff9BrQC5QibIcwqDwO5shNhMhzygfqvPy4WJ144R+IakcX3p
         YRXbHGmSNQAHBpg1wNfKCYiGcL0F/yxXjwnawXLMF0+m1h6JpNsXdNNtjQZmb/NN5rEW
         0EeZH34bJxc9XUy6bphw4JmjcEsvckOrDOmXIS+Z2KZ86NFkCLTIVprPwLxKpZg92tBI
         RnGWi6FEpvb9v0iUejyOMxW/oE6qGx0uXt22QkB6XPmydmz5+HH0MPg8AXHzC5JLA27t
         n6ZQ==
X-Gm-Message-State: AOAM531Set1WlglUwij17tOtPZ15aMYPPqYufUqSFy9GAEQCGaGliKDR
	3RYgJ45nIfiB7kOIgr3uDs7YnYWp
X-Google-Smtp-Source: ABdhPJy+o6UBvn9gYD1MMtMCNg2x8j3NXyiLdACpJJup594a1FhzGVuFE9MExockMD47PNyAHghJNw==
X-Received: by 2002:a17:90a:e285:: with SMTP id d5mr2358857pjz.16.1643854529740;
        Wed, 02 Feb 2022 18:15:29 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id s15sm27656970pfg.145.2022.02.02.18.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 18:15:29 -0800 (PST)
Message-ID: <891811db-ee3c-a6f6-265e-1fd3ee9980bf@linaro.org>
Date: Thu, 3 Feb 2022 13:15:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/13] hw/intc/arm_gicv3_its: Use address_space_map() to
 access command queue packets
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: buNXRwBthwyn

On 2/2/22 06:31, Peter Maydell wrote:
> Currently the ITS accesses each 8-byte doubleword in a 4-doubleword
> command packet with a separate address_space_ldq_le() call.  This is
> awkward because the individual command processing functions have
> ended up with code to handle "load more doublewords out of the
> packet", which is both unwieldy and also a potential source of bugs
> because it's not obvious when looking at a line that pulls a field
> out of the 'value' variable which of the 4 doublewords that variable
> currently holds.
> 
> Switch to using address_space_map() to map the whole command packet
> at once and fish the four doublewords out of it.  Then each process_*
> function can start with a few lines of code that extract the fields
> it cares about.
> 
> This requires us to split out the guts of process_its_cmd() into a
> new do_process_its_cmd(), because we were previously overloading the
> value and offset arguments as a backdoor way to directly pass the
> devid and eventid from a write to GITS_TRANSLATER.  The new
> do_process_its_cmd() takes those arguments directly, and
> process_its_cmd() is just a wrapper that does the "read fields from
> command packet" part.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h |   4 +-
>   hw/intc/arm_gicv3_its.c  | 208 +++++++++++----------------------------
>   2 files changed, 62 insertions(+), 150 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
