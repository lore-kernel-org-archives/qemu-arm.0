Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3726596ejd;
        Sun, 21 Apr 2024 10:00:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoRIf+KmbGC2f7/GIhsNW1Zo0p0NHa+cFlwlh+VXcS491i0msA3XMx1JnqNThmPXQUvBEqEQj/XZX07QqfjiW533E75HaK
X-Received: by 2002:a17:902:f552:b0:1e2:a61e:47fa with SMTP id h18-20020a170902f55200b001e2a61e47famr12461582plf.15.1713718855971;
        Sun, 21 Apr 2024 10:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713718855; cv=none;
        d=google.com; s=arc-20160816;
        b=psGXhWWFhmqPCd8L9Y0FlLRDEQnhS45EhSROMkN9+byEPsn3rBD+1dEJQFasUMQjA4
         LzXknR7t+v5XaSgGH+HjbgWaA04Onc9xUa5gZbv2WUvQ+mPL/2U5lJxs0JJUXOfIZHfL
         ZQQWLhFQE9//qRJWaVmkS1WhhN2xeLNHkSIdrJZKoeQgThtmpK6Dafi0PUm44L3Mnq4l
         LHx3BfPOkd573LabYVxHLFskY+ctIFpOVDQa+xFlUARBh9CczmslTL8YG/XJHEQK8QIU
         N7E8Gx/eHQMZsdGgo4F9qjEZY3d7Vf/zG4BNwH+Pqosbz0l2t1LIh0YOr9Lfv0o3GNM2
         dB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1S3Et/eayL3ikkvtUEAH89f0BM+clQwSc1NOjwOLPvc=;
        fh=cYdGGjHBSHmmkBla1vICWDLO+CthKQ3NPD9JYY1XoJE=;
        b=ZO6HqM6yx4PnVhHGFiNv7/MJ02mEhHsJ14DK1/jJ6wyl8QtpBtv0qDTfJjCdzbJltu
         DIY65gVcBIQD/gty2XbKDnpQeMvI1fVOMbuo37eWpNOdJQ2OR1deIa/CLqSce0CT3Vrx
         0X8TMbR1nBkPozOrfVxpjqciYYfkMjQY8XIiVksZLYK7dcH1mGR34fNFJ4Kqjnpf/vYe
         ysnpW3BOwSu3VyOJbr+moHQJEVh9QhIbnIJ05Z0qia9gBZdo060JJC6f5wUKCUEBAULI
         2V5qPXXt/z39ItyA9yCbG/wKR76ufXOZFOUz2L/wmKc6oG6k7tyuipM8UJsO1tZD0sfR
         U/ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lk3mlBAR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h14-20020a170902680e00b001debbbadc41sor6001575plk.9.2024.04.21.10.00.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 10:00:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lk3mlBAR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713718854; x=1714323654; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1S3Et/eayL3ikkvtUEAH89f0BM+clQwSc1NOjwOLPvc=;
        b=lk3mlBAR614+XmtNoPB1QtL4dxxIlDm5WpNAaYkCS2EJkldVEpSZXyQ4+smf+tqpgN
         DTJbtkoNqiWp+v7176SUhYMhu62SNRQXmTwmpiVeGyjTBiyUaeKA4jN/FeZarD01xv2p
         HW9KmlTHxa/Xxnw4HmdOESGuAG+Jeb4KRu5YALd/kYMsitSz5g0KITDMtdEAKPr4p3gt
         8RhXyS6i4Atojk3N99gUn6ujsnBdHAsFaN/mM05/RhwsRocYpBtrr5iBlw9urN1xTlu6
         akV5r16Yo9ygsE2V6RWNLxh8UnWny4a5vqkYzxk5xForCjcN4FcwuO16nG67i7bfbRy2
         nV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713718854; x=1714323654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1S3Et/eayL3ikkvtUEAH89f0BM+clQwSc1NOjwOLPvc=;
        b=MGqgdd+f4qld4UTNXJzc7h5Oa/7Tjt6HFubpycjN06QbH5/1/sUApODNus3CVHK0PK
         BR/8VnBsTunrwqJYOe9FYIgRP3QxfPlcoym+rwi/6U7xxGMX24hKZR5Ob86L9S/COU/G
         wrMxSQEUXvdtDnbjYY7sMNklD5W6uSP1CMcJz7oMeNAWRvG3cngyG2JJ+5GR7rhl/syE
         L+UH8/MZIaz/RZJeaG3nOR+iyeu+uMk+K0NSsLfUxPo0BN0vfMYWqZ+SzvdpUVfzu7x9
         KWABkgqQ/uhVT1dIjYVxEzaygieMS0JMkLyFin6YRT3PVbH8R4BC5kRnCyQM22xkS2NS
         E4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWA8rgKTy9dgryrP86QlSAzQ1Ftb5s0YV2bpSlT5gdI4gy4jmojxHP7pKN/MgoFUEvKKzkMxGWfeGmykgDS18K0MdZfn620
X-Gm-Message-State: AOJu0YzkdWEYzxaStEmoKnrmks3jclbKO6sFghaJs5Tg/0YVUIfX/Iep
	Zhb8HKRqU2kk0I1gdhgILZXSP0RJf2MrARqLvikZ1mG409D44ujJbmIQ1siL+Wh12A==
X-Google-Smtp-Source: AGHT+IHVhJdAebzZ8pdu3WHMOFSAAIMANoEkZ9vTWfKiATcUc3jo3DYqIlIMEeymUxTDG3FMj4gNCg==
X-Received: by 2002:a17:903:64d:b0:1e3:c186:8db3 with SMTP id kh13-20020a170903064d00b001e3c1868db3mr11968484plb.15.1713718853623;
        Sun, 21 Apr 2024 10:00:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id r3-20020a170902be0300b001e27462b988sm6528222pls.61.2024.04.21.10.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 10:00:53 -0700 (PDT)
Message-ID: <5f752ab8-c9cb-4357-9f42-c0c76702a9d9@linaro.org>
Date: Sun, 21 Apr 2024 10:00:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] exec: Remove 'disas/disas.h' from 'exec/log.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Michael Rolnik <mrolnik@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-24-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-24-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iACUZCLSG6hB

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> "exec/log.h" doesn't require "disas/disas.h". Remove it,
> including it in the sources when required.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/log.h               | 1 -
>   target/avr/translate.c           | 1 +
>   target/hexagon/translate.c       | 1 +
>   target/loongarch/tcg/translate.c | 1 +
>   target/rx/translate.c            | 1 +
>   tcg/tcg.c                        | 1 +
>   6 files changed, 5 insertions(+), 1 deletion(-)

Most of these additions are obviated by
https://patchew.org/QEMU/20240405102459.462551-1-richard.henderson@linaro.org/


r~
