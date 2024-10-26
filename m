Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp252206njf;
        Fri, 25 Oct 2024 21:31:31 -0700 (PDT)
X-Received: by 2002:a17:903:41c4:b0:20c:6b11:deef with SMTP id d9443c01a7336-210c6c3692dmr19833605ad.48.1729917091565;
        Fri, 25 Oct 2024 21:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917091; cv=none;
        d=google.com; s=arc-20240605;
        b=i3fU37XVX0EqJOA2VlSkqJ3v9GWfq1iAAoJF69bum/3O0B1KjZ2YwtEDqPpzpf5jRG
         gZGpnpFAxgfmySbXL/mODusRKQ77dj8M/Om0SAVAnRTREGMwzoLSy/VvqgdELAGocmp5
         b+WAXO56KaPDc//diOWIvOu3bXMmibWTNZyaAUEqP2tElW9k9j1YqONWzFFHjA5PXni1
         H8c7+NMYYYARByNHgfAQYn5gJjVc+iWvp62r/1I83hHFqaAhlreXeGMHugGV80SnwfWx
         ZhNq5MpDukxpJrupIBcWhN2iWBdDucq4YEP6d1l304/hoyiWsh6pZVVaM50EnixIpj5+
         f4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vQFUT+9eznvkrzicjIRNa391H8s4Bx97SjBzilVyW4Y=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=g8KakFk9XskbPvVSU+in8tMHy1NEz0r4FrS1zwePl+cP4DJgCPeqsvjHRAw6alN0xp
         vo0TJxxXmv+Qone6YyXvPim8sEXi8aRSyaP6+xQhFcfxpByFRC2J+wU9ZwvGx9rtCtUn
         o/k6KT+1uYRzpGxMBsG9I2UnyMw7lhopokKx19nVMfYjj56ECOs/hXLRy+QzAXaSkFHI
         vol0jofHCrs3swOgWmt3/ZSDlv8C3wSERytEAE3S1q3VSPoE1RDjFEKeuyrY1rqodGeD
         +XDihpumZIfvxEukhiLNYlExzplhzjVnxhM+doXO/hqskyT2OQOqXSY4l3sXxKbePZid
         wM4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBebr9Lv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bbec7ea8sor17567565ad.2.2024.10.25.21.31.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:31:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBebr9Lv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917091; x=1730521891; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQFUT+9eznvkrzicjIRNa391H8s4Bx97SjBzilVyW4Y=;
        b=rBebr9LvHhECf+YYVn8f6tHWyfVBgz2V3wH6zTBtr/NlGrfhyQh3LeuNDbuiSToy/a
         Evyp+9usPcswXrjeVIHs4hdHK0MHY43uxgRRg6iGnatDRcpJKmJEYwMrWy1xkWpzvfCO
         SAnVstM9IOyeD2YaNN6AiCa8qm+8+Et64bT16s65ogC1oxWwes3RStdQ4aFprEATX49J
         iBxhBu7141mjXBKtPl4FbzmNyKB/xNqMsa3OgBTqUqHX0z1zzi9PA71OarBI0sJJQUbF
         WhZ1oUUEiWzIxxeE9FXqXHQ5fqpsFpFnlOlwhTPOahm8v2yEq8UqQ6fSttA5J+Hpbpjj
         MDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917091; x=1730521891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQFUT+9eznvkrzicjIRNa391H8s4Bx97SjBzilVyW4Y=;
        b=oREBPMnyHYx1COsTF2iaarMsLv+BFfvnAc5gXhqSEW3G5upVyAwyFfcfS12o2uwM+7
         lBPXnD6U2MAse52isVtr5zNVZZyDeVFS8xesPfYXeHMTBxTe5q5gdV4Y46mPtadMIadb
         Z2cRQeB1DdAHNuSyWA1G4he7rgAMusAYEmM/CIBT2aH4RtpVqukfkKIiInfjgJuctI5t
         Bvvk4pgD3RpF4ZfV6njylmIMyTFoYKZxwKqMBVzlulH+p3T432lQeJh8SbpHtP14De7Q
         cY9+LxcJFQhxO0WNPv0zfn+A2DfIzGVr2wj4M9d1qO6zAal+vuJ1qB4fvh4XDaoyCvXk
         4DEA==
X-Gm-Message-State: AOJu0YwLvY0/LObsnW6I8abYJQUSIxov/61QlzLDe0TtyrGqX9SCbSwk
	8jE69W3YYh6dmzYm0bNw6Crg3NxyMgZLnNaY702+S0BKlUIZzcFgjIcaOfU0gUGjRQ==
X-Google-Smtp-Source: AGHT+IFU0RXYnF5Od9msysEhanVG6XdYlrsv5dJzVCaPoDM1turQHQTLSuLEVSYTQtJwfnH4xmOwug==
X-Received: by 2002:a17:902:db0f:b0:20c:cf39:fe3c with SMTP id d9443c01a7336-210c6c34824mr21072615ad.41.1729917090995;
        Fri, 25 Oct 2024 21:31:30 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc01791bsm17195155ad.145.2024.10.25.21.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:31:30 -0700 (PDT)
Message-ID: <43863d19-30ea-4f68-a353-4cba12532ba1@linaro.org>
Date: Sat, 26 Oct 2024 01:31:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] softfloat: Remove fallback rule from pickNaN()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-22-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Vedicq/LLcwK

On 25/10/24 11:12, Peter Maydell wrote:
> Now that all targets have been converted to explicitly set a NaN
> propagation rule, we can remove the set of target ifdefs (which now
> list every target) and clean up the references to fallback behaviour
> for float_2nan_prop_none.
> 
> The "default" case in the switch will catch any remaining places
> where status->float_2nan_prop_rule was not set by the target.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/fpu/softfloat-types.h  | 10 +++-------
>   fpu/softfloat-specialize.c.inc | 23 +++--------------------
>   2 files changed, 6 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
