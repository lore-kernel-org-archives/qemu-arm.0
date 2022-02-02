Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1396008lfk;
        Wed, 2 Feb 2022 13:05:37 -0800 (PST)
X-Received: by 2002:a17:90a:ab90:: with SMTP id n16mr10123692pjq.229.1643835937244;
        Wed, 02 Feb 2022 13:05:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643835937; cv=none;
        d=google.com; s=arc-20160816;
        b=di6O4sM6Rquhq+T20wb/Tr0vmUz2v0NNgLjgWkq9JddWjOVOrToa4OCkVZGVC8ssHX
         vmpJe3My3hFDhOH34RgilltcPCMwO7Xodi0MEjAWjiTRzotljdeXtEE2KvRgyqSLoHlP
         8e4+6v/IB9iQ+REP0BWMTrxlX2A9KflPVeE71/icQsubMkAO93vcPegWKojKcx/jtN2M
         44xmvFrV7YBmDZ7ZJ5kxlIMB+iYoYtalYynmsT/VrthIXoIGsFG6N1bce37lo2QNm472
         06U+JUdJ4lkHh9dOXfqP11QpH2RKVHdxR9PydU9PFnoP+7qYOvBEzu2smnKYqWK13AMi
         LEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FY43W1BqQEbNta1/LemvogZcm+nQnWPyMFInU93nZbk=;
        b=bKNbGZziz3gjVb1NG46omkhAFTrEzG8J4BZ8caX5TWjuF+sbugLV8wXYALTT9Eju6h
         xcW8IgV1o/TSz8A3h+4SDmrrNoGAeiHw8uf795UsMI5ViKPLLhi1HD0OnFTjt3n4GsxM
         2plTTh/ZA+zoG82DMZm0ZxkIe4Ld9GTgAXY5adJc2W15V2uKFXZ87N3c2/0+sat7i4eu
         IZqlnmGT6SeLZ8+aQZJhAEnfSIpnj1FmVXX5gtESsyjJvOFv9bnjeOzdcMuOE7R7LHd4
         M6G4c/En366rXZDyCXQNwHIYhtG51cYrv8E5KGTEtwfCRwILkFsN3PswD6qnPB9IxmKK
         266A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHTJ+xeA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k26sor10213208pgm.31.2022.02.02.13.05.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 13:05:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHTJ+xeA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FY43W1BqQEbNta1/LemvogZcm+nQnWPyMFInU93nZbk=;
        b=vHTJ+xeAybyz9wGzTCvVxvz5x1N1SnAz1xOMsbev+hHDugF67LHalVmoc105alwoKh
         ZEErtc6tXLYK8jKhe7JABRxOixosXfVoz8d0Nt6/lyXUNjUodNn9O53K8YfelBpIDk9N
         K3YkxThJzdxnTBrq559/QgJsJMwhEIaG0FSJcB30bmQaiRXs9sU1mk5vnuXCqG7/Wh3l
         COBrKpKpcTVUxBLDPBr0JrngfG13i2WE4UQPHk6kzAmMpHWOn21RErylJoNVH1+1nW10
         OE/wcNoxOI6mhhrk7GO3JayyhWCr6TdOIyTEzaqOLRh67GtAvtctpZF2FP9nGcCNPIWP
         kQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FY43W1BqQEbNta1/LemvogZcm+nQnWPyMFInU93nZbk=;
        b=f+ktGfDWtBYSsBMYHM+/dDUpMvSvJt0sYizS8cdPfgqcUObENefpTV/CZuI0vmc5Wg
         dbTBXyIh/FgYofJTg2qkESjwbHbEZnDQuTUcirzWlssLoQ/q+U4hBp+ZrrjdgFF76A9i
         cC8Jd45VFLBj4ood7BYt6+4NJtzOyc5FgvKqDMIH2JEqaM66Kn+eEjyfScNwDoj8CEmo
         x/BBU5ajRk9bg857rUEDXqm7/t/eDGCtxtiRHKKDrz1P4UjhJ2Aa/RbBN4mNEM4ibGMN
         heQX63Dh4BPTyFhkOp9/z0rywYs1qIwLgTxozs9JalcVKgYkfqKxbeK5J8cux10nqVo0
         DwwA==
X-Gm-Message-State: AOAM530r33SCgn1d9pPeWANhNABp0cTpupsuSLnXRcFbJGzaL/37hvPb
	c4CpIHI0HOeIaIxFzl6r/kE/IOsmaM3SwAna564=
X-Google-Smtp-Source: ABdhPJxUCcFa8phulyMw1NwVqraRTumXVyqGav2DneamLkSQL5wfA6ulnAc70+3ZlBCd/f/JFG/YJg==
X-Received: by 2002:a63:f156:: with SMTP id o22mr5877249pgk.387.1643835936770;
        Wed, 02 Feb 2022 13:05:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:420b:54a2:470e:6ebd? ([2001:8003:3a49:fd00:420b:54a2:470e:6ebd])
        by smtp.gmail.com with ESMTPSA id c2sm35685329pgi.55.2022.02.02.13.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 13:05:35 -0800 (PST)
Message-ID: <0c7e5756-8bae-da8d-5feb-a393832b5ef5@linaro.org>
Date: Thu, 3 Feb 2022 08:05:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/4] tests/tcg: cleanup sha1 source code
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <20220202191242.652607-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202191242.652607-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Xlm+yo5ZfhiX

On 2/3/22 06:12, Alex Bennée wrote:
> We have a lot of legacy mess in this imported code which makes
> figuring out what is going on harder. Clean it up:
> 
>    - delete non-SHA1HANDSOFF legs, remove symbol
>    - don't bother clearing variables at the end
>    - remove #if 0 dead code
>    - some light indentation fixes
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/sha1.c | 67 ++++++++++----------------------------
>   1 file changed, 17 insertions(+), 50 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
