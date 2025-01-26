Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2092655njk;
        Sun, 26 Jan 2025 13:16:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxhzTbyRqKVUHUruWDZtbLPLh9c3agV/aHYC7QeocqY9hsNrH5VmJAyDpwrEUIMxFwORNXP9qKcCIHuA==@linaro.org
X-Received: by 2002:a17:903:234f:b0:215:7446:2151 with SMTP id d9443c01a7336-21c352d6ca4mr571718845ad.4.1737926219269;
        Sun, 26 Jan 2025 13:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737926219; cv=none;
        d=google.com; s=arc-20240605;
        b=YBstsapCbhDhtf8b1JGT7f957vcDnOjEVd2wPR5xtoCz9rTqU2BqV5xqnh8LScAW61
         7a/hStsKQBydE+MxrnkCRmT1l0/bTdz/303JdITx9FVMfBV+FlvoziFy1ll/XPC2Mavm
         9ZSRl58MxMlNjY7QFUZbn0tt60Z6hgnKWSwPBTVvdovi5QzfoCRqEMM2V6MFSjRw1KKA
         72RCGzFJ7NoDIGXctj8sqBThxEYUzrbT738dZUpMFnhoqrc2a27r5JTnVYYkNQsYUHoB
         McQvZGtjCAJAUSPw0c7WhwB7Uc4BMjr+wC5n/g0M3A80lmL1gdY5OGqb4VFBqS/932lf
         KZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kMRLOGE6yrO6E+licLk956mV4oo4UqHJMRzU5NR3n4c=;
        fh=EGvufTP8KiG0mPj1wm0lIw8RAi0r4RBPcMgdI81i04c=;
        b=ccW3zANwkIUBNFM+9pyPOEODG9t8ZDE5LTgxoM61t6iTYLfhd4ntfqJwqI5dgUKcGU
         OkaPK9xdAnZlIpTfzEb+x0iIJMtPVmumwjGg6A7VjdmZKqDQIjhne0dK0vinTl3Jr/Bd
         v2QYdbAj8ibTGGLLte3XnPon7rVObUf04XyCLS8B/EOTGh1Z1o18Y9F2jMDi+2ZWZPqr
         UEmY1dK7Y9hdu1HdToOVbNIq30iMgwYnCi2/8uPNQjV54sM2NaFHm+u5gxnsjqW0ISa+
         3Jh8zVL0AX5mjnlYnh44n3lVYEdu/2+PshsgfxDIOw6Iiso1fy9SjV0Kidbyb/FHE3NQ
         BCSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VGRZ/57S";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-ac495d5545dsor2995489a12.8.2025.01.26.13.16.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 13:16:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VGRZ/57S";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926219; x=1738531019; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMRLOGE6yrO6E+licLk956mV4oo4UqHJMRzU5NR3n4c=;
        b=VGRZ/57StjIq9sjpObPv05w62dkxGWHhqoT2P9b3yM+TT2lWd+D7TZUYP3q2RXjDMB
         iDkwKYXpsuhxPqHv0OnB6Uzoycvm/rnWd6iueHdoHUsYa4oaPmMK+IQsYv3YqkmdTCdG
         Bb55Hmetc3eTi/27MQUtoTAeVNSnXaWDhx2ZEAd1yX70PdjPd6SIRj4+MZ2ncA9jMsaP
         LENVYJOZSnbtuQ1bh5JSWzUf92IsxzO2ZNGzwFppKZIuT/1gQ8HqOh7wir6cArQKxgOd
         zFiHeqUlYtRYgiLbL0pt48svwe4Aobhte+46pUpE1ehKEUZCIb+RMGY2wwdYcNApLOjG
         97Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926219; x=1738531019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMRLOGE6yrO6E+licLk956mV4oo4UqHJMRzU5NR3n4c=;
        b=DCftTNkmtFrunQ+L52Zrc3x+HLC7v2R5Z56j1CCXFV3rNRyMy9b1b6CC5YMuXfxlwE
         OMQjv7sOG5nwfg787KsJ7J6aw9XrmF0CZJsnILhF7RcyDzA4wyiq21PVKv8dRw5wxs9m
         xmayoqmwDi8Ak4F9SBpJeaiqwTK+s1SXYFGcKgqwMdw2U5B1vnte2iCL7b80uMyAvUG+
         EdmMlJ6g9dqgdVmSSnNBtA5ek8Y1tajyBl7bnz+d9E8eV5u9s0XEc2Eu3WG9G4fDjVPx
         gPDDhqHjf4Ute27vyK73jM3eXUNjjwqj+kaOXTlKxb4TFYQkKTQPRMV5IYtBZOAvuCAd
         hN0g==
X-Forwarded-Encrypted: i=1; AJvYcCWL4h91HZPYEsrecbc8gIkugl2CJOYv2yhxE2rWrlBMYur6zrL1z8GnzpMbhlDgQXoInizWFsabRQCBrQ==@linaro.org
X-Gm-Message-State: AOJu0YxJN9btw3r7h4ohV8G5ybZVozxCI9E6tR86hidWF1YKO9LNHlMh
	v+ys7MCONlPE/vnQHnwxA6tHl13UWYgbaZegdLX47spH4Ott/VK+rv7iaw14o5HWcw==
X-Gm-Gg: ASbGnctcXsZPBMN90meu5xlCi+MOfe9KIaecyvWQ3i7v2/LyCAuzlhrkhMFJqNE8Sxa
	aX+oFVGGpglOhT6WX17CpQkiPU8qwKv+J52hGtd0aSo5cdngdtBaKPao4ulacA/JUhChHA72M+p
	VOPXy7Ye2ErKcRD8SqtRe8rW0kF8WEkMwE/5VXgXCmB1oGMGG9kueuH3+G8StHJTBRRWgAOhh8b
	5ZuvUib7eHto1syknSViPApMRnvLI0P9IUDgcSImmBwFMIq+LDn+hiEYcIZ0n/+EC0vSK2NcUVd
	cRnZ2ewN4XWItEEBB0q2ruwr55zLKqqPeadFkXMz/10Y3/8=
X-Google-Smtp-Source: AGHT+IFBHji7Q02DuNHRJzVlNXhJjAx8HDsMis8mrPSUngwfhLK6I5AlZnoO5BvEYdWLX8kF5J4JkA==
X-Received: by 2002:a17:90b:2243:b0:2ee:e961:303d with SMTP id 98e67ed59e1d1-2f782d9ee8emr55346160a91.35.1737926218792;
        Sun, 26 Jan 2025 13:16:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa75bafsm5669849a91.31.2025.01.26.13.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 13:16:57 -0800 (PST)
Message-ID: <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
Date: Sun, 26 Jan 2025 13:16:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-17-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Bujbbcx5BRug

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
> ("Use a dedicated function to request exit from execution
> loop"), tlb_flush() and tb_flush() are related to TCG
> accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c | 33 +++++++++++++++++++--------------
>   1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/cpu-target.c b/cpu-target.c
> index a2999e7c3c0..c05ef1ff096 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -45,22 +45,27 @@
>   #ifndef CONFIG_USER_ONLY
>   static int cpu_common_post_load(void *opaque, int version_id)
>   {
> -    CPUState *cpu = opaque;
> +#ifdef CONFIG_TCG
> +    if (tcg_enabled()) {

Why do you need both ifdef and tcg_enabled()?  I would have thought just tcg_enabled().

Are there declarations that are (unnecessarily?) protected?


r~
