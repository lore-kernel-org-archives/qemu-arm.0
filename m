Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3772289ejc;
        Tue, 10 Jan 2023 23:10:17 -0800 (PST)
X-Received: by 2002:a5d:5082:0:b0:278:126d:60fe with SMTP id a2-20020a5d5082000000b00278126d60femr36628861wrt.10.1673421017109;
        Tue, 10 Jan 2023 23:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673421017; cv=none;
        d=google.com; s=arc-20160816;
        b=HUgk78OC5SUfK8dlJ5jOvqDZLMZZiDwGWSFTbOjEUb8uxVYsmgC+ljqvUB4JtaHZtA
         TTOWdkyoJw7lia1qeQFJCruI6Whkj77HmTbrH69j4PorZeqBTdCyiHViZ//r/nluqOpK
         vSkDnQwmu73ZYDAlnGdEr2i3hFtMFv8nL0A7wO3rv+2c1tPItATWJFS2Ls+ulTpW/N10
         WNzpS+n92SjWJDdQQ0hIM6rFO4w0ZKahNx7RmJyWwnJ4EaBRGUb5Kxw/w62WmCug0XfN
         N6qHql+YGU/3TXubkEGDJqLKRdCJSr5bnvDxdOmBtg9Dn0SLmqviCh9lWIhRswnsUmfs
         VLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
        b=cf+o9pTAoEzdlX4OkEmbQ2IJ49oyme3CmzqWXE5tVFhSNV/FV3lLPbpkiU84rGZqjC
         E5fbTylZurZZGghl4Ds6snu/ii7KMWPq0Z4YGGqg+r9YId9SITYHcFswoe9eNKTyjFjo
         a8YXBvIhXRVT+XWRni7QYI5w8BPHbSBVX8J3XKKH93OVDIvr1uyXrhKwuD771axjQDyi
         AOOgBuhLgknLe7tVDDzpfkCx533kzfNkcxTEeAWUY/1Rh3N+8bJ3zHpmhKuqVmR/SRWs
         5ZarU2KLjkdTOnXD8Z43kUnQ0vwbKBCNmsHJgm/7vUSZJGYbgUDGIZ4/hdojp8PBfrRQ
         o7Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QsnvU3Qj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t4-20020adfba44000000b002941f34b414sor5136049wrg.78.2023.01.10.23.10.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 23:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QsnvU3Qj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
        b=QsnvU3QjCsGrUrsWmZMal1dSye7ALlPTlWdR8roEyrDSpSTxK4uCYZRp8s0YPW7Pi+
         iNCH8BzYk3d67MKeCG1vRxV7zdeIFTl3dhKrDxswgfX1ppqfAPl/q5ksc0vXLhXpgmZ5
         gyZ14dlu5esz4Yna9dWY4Bupdu0Ra7GI6TtXdqPYjQetM3qHuHJPdCy9pMjWSYJ1aXu3
         RJEHUS+8Y+cJu+27SNrPJ853dDlN/4lYwMCZsHFppzlmfeFZ42cCme2GHrtMhJ1J6ZKL
         GrjNaiXAgexd1SaOpVMGq7zBPoqHafa7W63RaApTWq0/QMvDX4+KE5cgoHgXVFcvY9ko
         arRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
        b=3k6mWCv79g2uNcowq1Rg+37OY7QFBad9xqhXQdVR6nna2C2J4icRy9b5OMPxybv7uo
         BriQylecSQyCiwRgGeqb4qHa1hZUR9ZQ4u+Cpjq9IfaWWR4bGh1pWeFeJhs3hwu1GEgP
         R1/LNGCI1O1V7sG4BAFA9hrbGFPhDjg0Wwh/Qp1c6wJSVVBMHUWwwDpOI/4GzRHyC6dt
         f5eitHZ8i9Ef4T41zSgC3tA0N0P92XPgwoohI8/4Bh9uHfjKPS0FMmlE7Q5igNVRx3Vm
         tsiEdA62YmTVhA44NbM6nQ2kSE+5k9afC0L48y9aqytYH8T3ySR6AwQsdZvP7cxECiEa
         ilZg==
X-Gm-Message-State: AFqh2kovE+TlMQCK22MagOmj7K6tAbXd3iX+8z8EGatZg5/KyHl6Ixlm
	99gPtSNxRBBe7Cv2oZkAZTm+M/Wd
X-Google-Smtp-Source: AMrXdXsGPsc4OJU/t1NQdJK4GmcIPv1Y7o5mpehNbv/fNNrQ3c/gKOMp6+JozXH+1a+SCVhmx/wolA==
X-Received: by 2002:adf:f107:0:b0:284:5050:5e59 with SMTP id r7-20020adff107000000b0028450505e59mr33484997wro.29.1673421016818;
        Tue, 10 Jan 2023 23:10:16 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id c10-20020a056000104a00b002238ea5750csm15291197wrx.72.2023.01.10.23.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 23:10:16 -0800 (PST)
Message-ID: <92cd2724-6a14-deb1-923c-dad28de5e8c6@linaro.org>
Date: Wed, 11 Jan 2023 08:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, ale@rev.ng,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>
References: <20230110212947.34557-1-philmd@linaro.org>
 <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +4P1G8UezqVI

On 10/1/23 23:01, BALATON Zoltan wrote:
> On Tue, 10 Jan 2023, Philippe Mathieu-Daudé wrote:
>> The 'hwaddr' type is defined in "exec/hwaddr.h" as:
>>
>>    hwaddr is the type of a physical address
>>   (its size can be different from 'target_ulong').
>>
>> All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
>>
>> $ fgrep define include/exec/hwaddr.h
>> #define HWADDR_H
>> #define HWADDR_BITS 64
>> #define HWADDR_MAX UINT64_MAX
>> #define TARGET_FMT_plx "%016" PRIx64
>>         ^^^^^^
>> #define HWADDR_PRId PRId64
>> #define HWADDR_PRIi PRIi64
>> #define HWADDR_PRIo PRIo64
>> #define HWADDR_PRIu PRIu64
>> #define HWADDR_PRIx PRIx64
> 
> Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use 
> HWADDR_PRIx instead?

Too lazy to specify the 0-digit alignment format I presume?
