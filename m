Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3058136ejx;
        Mon, 7 Nov 2022 06:39:16 -0800 (PST)
X-Received: by 2002:adf:e4cb:0:b0:236:dce2:3604 with SMTP id v11-20020adfe4cb000000b00236dce23604mr23907013wrm.525.1667831956341;
        Mon, 07 Nov 2022 06:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667831956; cv=none;
        d=google.com; s=arc-20160816;
        b=Grqa2JkMoDedxBiG5Bj58+rGriB015FMshzmKRGzmPE2TzmEsma3CZriTrA+6yds8n
         g7jhb3O6pqGOit4nuvc2Pd0qGSa+HXraer2UelAIP1UAgx4lIC4MXVuqkKadW//WBc3t
         isJbxg9JJSaONfqP5rMDt2VXMsb9LnGfbcO70A6Ugfp7cB5U4j48CwphqMrsIvOon7F8
         JoTTyeM6Jmq9cvhswMbyLTpwDyYvYxQg7bYiTTWv9wtFKKIgcQKn4x8d7v3+8OCBZs13
         KJ3F020M/oDsWp9BjNFOWMd3Ut3cQscM/yBFHK7mpKkwDBJVcFP216YZXyG7NKBHVgQm
         GiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IXs6PaEBUPBAgalsZO5rOuCXzL1sRHPyoX1MVSmBbM0=;
        b=cgw6f2rLi+xP3BttyhbQAKHkyDrvOjbpU3z1DCGOaO/2qC4QDtN16ibxv/oxam5DIN
         ZYofpeI050l4dmMSoUvJdnxsJt6y9xNy/cHTTuacChR4yxbDe1a9eU5b7FgClB8+tCT/
         oYDOz+vEEqy4ZY3DCrvmFgm4Sw9H9nRjAvRAkyxXy5OMeJeNOGVDfuieKQXt2uFX/b3/
         5Gbh2q/yWx5XrrccQLVU5AaBDp0HlHAt9l4CvbeUMhMnqCElfAqRn+Rh0rMmcr0yESXB
         j4u82+aEQ96XFP5ruLj6Z9ipdqcwM/Cw5v/kJJ71Z9vrUTwbL8KpU8qIdR9LztUC/IFv
         Cstw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZNUR42hr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n10-20020a05600c500a00b003b33ca58887sor1641128wmr.40.2022.11.07.06.39.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Nov 2022 06:39:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZNUR42hr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXs6PaEBUPBAgalsZO5rOuCXzL1sRHPyoX1MVSmBbM0=;
        b=ZNUR42hr/eYrJi8SHQHjk/7wfL8dOyjLtd/aIgVS3fu72AOCcEvbkrfRKEVmEGGie1
         mena68B2A9BLihxdKo5xMn52Fb5sbmMcvIsHqJfWk2MMoBrm0y8eJRZ02ZGRKRp27xXh
         ZpSVzJmyhJr1BmoEzPBM/e6aAmHy8R7mnijXeM/tCYzAK6cj7ElWWbb1YI8ilYCFnuWd
         ehh2jJtPpqV6Yvf2IJWV1BToJAczvC+ZekvxK7OpPPlKT2prfCy9MpssI8Y0gvJPZT7b
         YYWts9gKtEcax8uuGn7brcltEyzkvtuw9jWXQpVmPG7bgoHb2fiUP+s+cbDUnpJSRT6/
         2I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXs6PaEBUPBAgalsZO5rOuCXzL1sRHPyoX1MVSmBbM0=;
        b=abX3S6t8pbRpdzKdfKKFq18t5lHtVeZ9+CCrFB8N9NKS7uPObrza3IKkH51lfTf+Qb
         6tfF0zio/jfRECx2yOPF/3GWxQu0Vvnrwykl7pmQ7A5SaBNd/b2j5HB08eMgURlT3XwW
         ds9ZmCU7Gv1F2vejNND7OpII3YTyJWVnVul1MnjfDwlDkIedmUTgDaBxdfmd3zMazfwV
         CidIocTKH065xbY+ZXG0nureiHutqqMHRwu/qZEna9UwTwApIz1/d9Rg7N1fyTFUF+uu
         GFeamf5ybDbeDnosDN3TV/kqd4Ze6WCi6kkucHJlY12GPCOAeqv6wsXA0IcWe1/2gdYC
         nIAg==
X-Gm-Message-State: ACrzQf3qiChko1bQxC7+3VAtk/5NEWjNdLTloIOe8xyXVTUxH2feIzh4
	PsCGrO2sMO6jzpffxQH64i5tnVms3OmV2K2Q
X-Google-Smtp-Source: AMsMyM5R8VHjbYk8ERW9E9y7nJVmap1KHyMsseUdQ6CHsG6bQPZa1SM+XXyAtaVg6ooG0ELYPrrA+A==
X-Received: by 2002:a05:600c:4ecf:b0:3cf:8762:1a67 with SMTP id g15-20020a05600c4ecf00b003cf87621a67mr20372390wmq.41.1667831955951;
        Mon, 07 Nov 2022 06:39:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d5290000000b0022e36c1113fsm7489803wrv.13.2022.11.07.06.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 06:39:15 -0800 (PST)
Message-ID: <0a146956-a397-54c1-71dd-cd90a68218f7@linaro.org>
Date: Mon, 7 Nov 2022 15:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 1/3] arm: move KVM breakpoints helpers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, agraf@csgraf.de, pbonzini@redhat.com,
 Francesco Cagnin <fcagnin@quarkslab.com>, qemu-arm@nongnu.org
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-2-fcagnin@quarkslab.com> <87a652hmoe.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87a652hmoe.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FuXkDOqT1HPK

On 7/11/22 15:15, Alex Bennée wrote:
> 
> francesco.cagnin@gmail.com writes:
> 
>> From: Francesco Cagnin <fcagnin@quarkslab.com>
>>
>> These helpers will be also used for HVF. Aside from reformatting a
>> couple of comments for 'checkpatch.pl', this is just code motion.
>>
>> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
>> ---
>>   target/arm/debug_helper.c | 241 +++++++++++++++++++++++++++++++++
>>   target/arm/internals.h    |  50 +++++++
> 
> Moving out of kvm64.c seems fine to me but I wonder if debug_helper.c is
> the best location. debug_helpers is currently very focused on just
> handling the TCG emulation case where as we are doing this tracking just
> for the VMM cases or KVM and now HVF.
> 
> We are (slowly) trying to clean up the code in target/arm so we can
> support builds like --disable-tcg and to do that we want to avoid too
> much ifdef hackery in the individual compilation units.


I was planning to move hypervisor-specific code to 
target/arm/$hypervisor/, but here Francesco wants to re-use the same code
between 2 hypervisors... Maybe move it to target/arm/hyp_gdbstub.c
and let meson add it conditionally?

>>   target/arm/kvm64.c        | 276 --------------------------------------
>>   3 files changed, 291 insertions(+), 276 deletions(-)
> <snip>
> 
