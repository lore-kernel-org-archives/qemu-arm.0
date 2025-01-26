Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2093197njk;
        Sun, 26 Jan 2025 13:18:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZWOC1u77KCYlhm/PsTs7aiM59kntrsPr4Cmj5DqChiOzghdm7+z29NLau+vMitFRwi6Z9rioTPUS8sg==@linaro.org
X-Received: by 2002:a17:902:cec9:b0:216:5e6b:e23 with SMTP id d9443c01a7336-21c355644d3mr480047225ad.30.1737926337231;
        Sun, 26 Jan 2025 13:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737926337; cv=none;
        d=google.com; s=arc-20240605;
        b=VPgKhaURlC3qrRX8T693pR4qNRTWM3zA5jSt4d+enF1LjJoLTgEIjOau9dJM4PiLFf
         xLHTWKb9IpttkQRkkiJxb+Ga+o3ZwjIQj+IPH3+c5nhMHAYgPZ2NyXIzqobEqIGZczrp
         9CX7Y4ehcNCcsNFTgoO7GCELY65hqKsICSsgU9t4Dg8daU8FhnI77Vmc4ndlNksA8t4/
         w/R9KMIIt+oGOQvLzg4s/YfSHrQwGRX3cVHo6jke6Puvw2SWCH5bl/+tbOc1pNqZPvcL
         N1iR+w/k7hwwVwu/j+M+9PYyxAILwljYz5AJwaKbac8OT5EBSa0PMFz32e2N5m+6LDIF
         XgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=X+G0ryUleEoZxvXmUvLzmbIUvRMHYbb2l6B2uT5mTT0=;
        fh=gVj4h2G4AHy46xTowu/mCYfYVrvLyvUmjEeIk3S8HJ4=;
        b=SgYpM9bcA+Or4ojp1z0pFM2C9RpwzBIGbMBS7n+2r44rAl2ZS6MmTT3ypg9idlKeZ0
         RSIuHr18F4HN7J1HxCKn604DwtQLzmWXzMgS8ET6hmMzhqCoBvVjSsB3AXlw2M8BdT2l
         H0UO0TOJ2LQ0G1fDqWfANmsfPe/tv7NTOK3lGQV2q6LukYP30f5f3YW+3Z0N0oa9G25v
         cwu4hssg88EchqCrhg0eYvRWaJwGYR+vMzaoQf3Yv5pSy8HCQ4wXgHE40jsOJjlL60dP
         Ks+9J7ktp8TziDaGMpkrZtLo2R0YVRQBQsWthzWdalZosUhocjy5kDqlHU/ScOWfqfZT
         88NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynZrV5nI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da3d9e3a5sor33777535ad.2.2025.01.26.13.18.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 13:18:57 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynZrV5nI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926337; x=1738531137; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+G0ryUleEoZxvXmUvLzmbIUvRMHYbb2l6B2uT5mTT0=;
        b=ynZrV5nInhk6sLLdAbJHaO9PB9l8mccrpv6X5+TKrJNkuk2xSS6EblKcP9jE4bCNPz
         xhNNzFRBddE2EQroKqZ9VSFhib1Nazklx+dCFrdTose41gL5QpPu7G4t9zljV8HUozqz
         mY5BxVV6mXmyFwYG4S3zdBm3vk5teb0x4qTzIyu9X6383ctBWEHgRPqFGWPN11rz1Tjm
         WyPDSUXBJho+qKvbTF6/UYEHWW2FQrkBug0lwdNn5e7pGD6t5ugQe3lz6j6ByWXUQQIe
         n/tpRLxKcn8rBhVkugnudGsHda1uoVHhwkSQU83XhUHixzQAcGTLRx7/JLYDtovtSad8
         dHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926337; x=1738531137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+G0ryUleEoZxvXmUvLzmbIUvRMHYbb2l6B2uT5mTT0=;
        b=nqSVL7XqKZyyhB18/Pp6JglwgSDuVkXnCOvvWu4St3rvQejTO9jpG8z1iUzkUHhcis
         ETWlYYzYdHvoFdnd4IsOQIgN1MrRYP/4c9O9NtgvX2OGkqCLDhhp0nc0sNyMu76FszcZ
         6RdIS4cIB2h3G0NtqWWbH7ol0R9xCeegmZz5/DxPcipuTJwTe9zNT6sFDS9VlErGYiTc
         b8+4cZpRW3BZsqbaQ+84xmv6awp7UFlcTVdaFoyLlBtgkJSp+vz5JgqVdHc9djWBpigF
         N7a6O+25QRhqVPL7cVT3LPvoNMwDwQUfk+M3SOosFkaxSdwFGj1CV7POtJs8/o4HAsia
         PCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzYak9HrZx9ARCv8tJodR2EjONHmyANPnrJ0H/8FAeZk1KiTMBXf0wb11ZgD7lKphKqYCjN7sZU0xGtg==@linaro.org
X-Gm-Message-State: AOJu0Yyb3PMKWnzE0rqOsf/C6iQDQKTHv7h98T0X2ZVBUp+X98EHp+W5
	/9a0Nia+AtvM3zJpRb82LIJcGCFb1ZtgeGN6Xn4+/+2/dJyL8iFUoddKkzJ8Gjrlxw==
X-Gm-Gg: ASbGncuZbmH7NU4pEyU9pvCO1umccq2j7rv2tKNT12c4dgfXZHA9e5TflpbtDOsxusa
	hNTBnVYzpBxn2fDrD+BU50JOq/ObKF6gMhdb63AopvB9bX4bE/Ofw8i2+GXnbgHjGxFjcsJ+BIz
	Xe+FSTw9+UMbLJu7+74deXD8YZO1G6ChJ4fFXyM4iOOXyg7asgeBNrrYSgAxhf/tZzV8GJr4sqR
	tGpatS6nYMznaPrDhmNwQKrbBGJ16jMpjm83220RJxqi9/t6ijWbVh7Psz6q8I8VWDFFB5QnS9Y
	zKu2NWLO2w5nSLH6SdXVNKd+q6KNJbpfNAAyYhBpWyssXP8w5K8KTkRCMg==
X-Google-Smtp-Source: AGHT+IFqQ9SrCqtaqHBxnEeUe9wIIgiFAi160abwNWKtJLcX5dR1YlfbX/KbmypQ71AFHncXjFvVWg==
X-Received: by 2002:a17:902:db0e:b0:215:522d:72d6 with SMTP id d9443c01a7336-21c355bae02mr611350715ad.38.1737926336707;
        Sun, 26 Jan 2025 13:18:56 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9db91sm50141815ad.48.2025.01.26.13.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 13:18:55 -0800 (PST)
Message-ID: <39ee3338-aa9b-4cdf-a06c-ab25341d3cd2@linaro.org>
Date: Sun, 26 Jan 2025 13:18:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] cpus: Have cpu_class_init_props() per user / system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-18-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +EYkHEK8PIzF

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Rather than maintaining a mix of system / user code for CPU
> class properties, move system properties to cpu-system.c
> and user ones to the new cpu-user.c unit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   cpu-target.c         | 58 --------------------------------------------
>   hw/core/cpu-system.c | 40 ++++++++++++++++++++++++++++++
>   hw/core/cpu-user.c   | 27 +++++++++++++++++++++
>   hw/core/meson.build  |  5 +++-
>   4 files changed, 71 insertions(+), 59 deletions(-)
>   create mode 100644 hw/core/cpu-user.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
