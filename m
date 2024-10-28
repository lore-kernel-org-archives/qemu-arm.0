Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36811njj;
        Mon, 28 Oct 2024 23:11:10 -0700 (PDT)
X-Received: by 2002:a05:600c:5487:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-431b56364e0mr5661205e9.17.1730182270301;
        Mon, 28 Oct 2024 23:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182270; cv=none;
        d=google.com; s=arc-20240605;
        b=HCrx/w/UG1ij+xqUivQJWCQUqB/n8zPhebwjEcmQAXN96IUdNdhD6zAfWm1C8uSnZD
         85zyI9HojHgjox6Iyqc9Q3SH+HQN41gxRyj8vIoicNdybUwOHXzpaU3bys8ISZR0Andn
         22fbVFHdgRQRuCzCk2yCHC2ByTXLG4Sb91RTwPW2XT5RF1zLO+wn/2Nb468TKGPUkxc8
         iWOC3FZVIzjqACIujoIHCi/sBOGniaZeheYqIeLeWVQXxibrVQsoo8huv8viPJPnNn+/
         5fIANuVtSqaLMOAFnMHqFsNkze9j7Ch7VPNH7+79VtGSnUqf02azD9QbxeIrAZ8AnVq6
         ktjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ni+wtJb/H/ha3fv3BexxavA0siKsZDnpq8q6IPWdmn8=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=RD/HuF/tQl/+mHAPPWCfMjPfgsmMMBLcyDY4UEYRQvWp1vS7pYde1bMXSOCdDTuVpy
         ei13TO8GpGcEdao8nOlSB4swHphvQhGRbIH9nWwrrhuaEHyE9cz+tCr9W90bcRPgK/4w
         U48igpCKkIu15YbW991KT/9EynbhaBk/zuzbdgdMoZe+KFGP97E702EnKsLHnJ/PxgQz
         m2T9VGwrjLccZdt/7OFriDhxpHezb6E98VmMh+9l1yXsFf5uRXFCP43HOz2fH0GBNv72
         mYuyXRw8zyVDdhCZqSIi/b2NRMS08IHiGCPeSFGxPWOW1osJUbUQrfh2x5b5eK6ghE7i
         d62A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AJquy/ZA";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4318b5606e3sor27877715e9.1.2024.10.28.23.11.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AJquy/ZA";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182270; x=1730787070; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ni+wtJb/H/ha3fv3BexxavA0siKsZDnpq8q6IPWdmn8=;
        b=AJquy/ZA7Mfz9jjjfMPEJEa6xkPY4lQS8wVVh6GXJxCBjLexDyV/gF7iXlzb3WXbGo
         HOhjM7gLnxReYaocA7obFsNdGduStfdUPPYWEwiVS7yaCfj67h2dGZ9JMiwV6w+nlQnu
         SfJuo28MRKJMyBE+6dddLWm//RERYt1IMi4qm9TFXUv02bz2zaG4IU+iUHGt2363FswS
         6C4sepwLbMmmexqiFD5mVz1fP3qcS3Z6ZcHrp+7tX2tIy3UvtKjECwXDdLzvlIm5qaOV
         rKm6T35q3zVNIAurU5Q0h2HqDWJDYd2Exv9aICNFd5JmPLXgOL1yMGLS81boqqJheLrh
         C4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182270; x=1730787070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ni+wtJb/H/ha3fv3BexxavA0siKsZDnpq8q6IPWdmn8=;
        b=EqNbjy/vdoxVVQRZPZCXQFfyg0bKSkwRlqWuom+nsgo7uybmUXiT/Y00HQQsZgwjKm
         SM6rD3P3Yt+LX/0TX3PfWCjB841DDg68xqLjGKWQ91joTTHxbdC9f/ash+LXrhQZd/j0
         GrdKLMzUe3tROKJZpBU5J+71DJVW9YJDBTvLL6mQkgiUMwt+NywPYk1Oerv9FOkcVMjM
         4/OZC14G4o/KdJCyKej/IOXPMJk8qtac5TA2YNtKUWObuL6oxBd+/UByCrlb8gbPWLE8
         jRxf3Lvjk89LBicpqSyaTEGoCoyoCZCzYkMy7rI5msy+qg4cRLB4XW4uLYl4m6LfqmFC
         XakQ==
X-Gm-Message-State: AOJu0YyQNRMMBnin2w2D2dKcmQ4gwDnCJfyztkKvuW17Xd4NTWHlRR45
	DFmeoqZ+DUQzOoHUnA6fXchHAFnRGzx/1vfxVhHaq+DBXoWva3ezPwxmKRqgIJGUAA==
X-Google-Smtp-Source: AGHT+IHy3gv6qkp+GoU12B7cOXA6z9p6DAaV9/nIpMy+V9ilkfPupaZfPHPppNX2SDlialh2lnsIAg==
X-Received: by 2002:a05:600c:1f84:b0:42c:b697:a62c with SMTP id 5b1f17b1804b1-431b55e5defmr6282595e9.5.1730182269762;
        Mon, 28 Oct 2024 23:11:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b45aa058sm12150405e9.1.2024.10.28.23.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:11:09 -0700 (PDT)
Message-ID: <470da50b-3f49-438f-98fe-d07df8cbfd52@linaro.org>
Date: Mon, 28 Oct 2024 12:25:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/21] target/microblaze: Move setting of float rounding
 mode to reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
 <20241025141254.2141506-18-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Qz75cFLdvsZX

On 10/25/24 15:12, Peter Maydell wrote:
> Although the floating point rounding mode for Microblaze is always
> nearest-even, we cannot set it just once in the CPU initfn.  This is
> because env->fp_status is in the part of the CPU state struct that is
> zeroed on reset.
> 
> Move the call to set_float_rounding_mode() into the reset fn.
> 
> (This had no guest-visible effects because it happens that the
> float_round_nearest_even enum value is 0, so when the struct was
> zeroed it didn't corrupt the setting.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/microblaze/cpu.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
