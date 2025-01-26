Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2093958njk;
        Sun, 26 Jan 2025 13:21:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVturKWNGtJgl/1vr+QvSSVLPS1ebbkYwVx4/yP2L/5OWMmzrhZmVmlznq/hjTe7EcBGAf399bXHRxkYA==@linaro.org
X-Received: by 2002:a17:902:ea08:b0:21d:3bd7:afe8 with SMTP id d9443c01a7336-21d3bd7b2acmr381879275ad.49.1737926492349;
        Sun, 26 Jan 2025 13:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737926492; cv=none;
        d=google.com; s=arc-20240605;
        b=QYd4eiEqG6lQotO8Nj3wFqpcqP/Yo89duNSrwNSoYW0O7G5YFzwM+E6aWDRdBEckdU
         lXx+eZHaObq99y6UnRbNGKmsQB4Fsn3A8NTUt9UI60Y92pEWvklnj8wwbdWatx59MByP
         8u5L+aPfkSF4SVHANRXVvtk+Z4frwnqDus9fotf3KJCemy13uWLaTx+UC9l70uIAAOLZ
         n1SdZ+cNJvzMQAjADuAybckBiroObph5DkJ4QVjd+4YwFOfhIidwyLobIMq0nkwM0oS8
         nNBUgPlY4+3ruCCA3DJN1vjq5gYlHyaQ6KsQmRVcMGkcOTss2Hes11MSF5ReIgd5QjLz
         c8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QYxKemM/xZvwRVD9aoAgaA6gwfgdoNiv4c107IIPZT4=;
        fh=KMxr4QBSNXM761mIJRzItrEAaYHtQwTR9z9HPZdc8Cs=;
        b=fius7nM1S1tMiHZcXte9wRba6Jh3OmPHrP7hQB/mMt6vtO4vaHSxMkgjPza7dYwocM
         ZOQgV7+KGCwQ19kbww+bK9fX0wZoSeC3kGUKysYR3GOuAruuIsc32GG6w2twCLeNkGlz
         LnEd269YIxrb41HNEy7YA4HrsvC/fqGxe1KY8/0zzPrkrkybBgwXuyDLkm+dGRTugJiU
         bmIPTgMd1IGw5dkFwKjr36pPZuPGVVg+SCDKkpcaJiCYogbHccxpw9lnH5jOriyK9nSf
         aiq9r0idvotyk++QCrSK9b5YJd9sa5jpowoTgOXV+mClYW/hPxERqAvl/sLRWdT384li
         zSRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=idXGQrdZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da411d205sor36702065ad.11.2025.01.26.13.21.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 13:21:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=idXGQrdZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926492; x=1738531292; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYxKemM/xZvwRVD9aoAgaA6gwfgdoNiv4c107IIPZT4=;
        b=idXGQrdZzOU3YE4JL9FBI96ojyBJbqd4REeWAlFDkzR/C8npAnpCxJjBXtjw1PLy3L
         K9EZn9RD0fGkEbiBv61yW53NBkAmys7KB8vZZT6l5/jtZPMXhb2dbZkjjdNGSJh2R+Gw
         LfTWZwwEvNsrpbNR3t/atH5JZB53DmQSmtcxWITBl99IfbYI8Ry6R22Mo/MA+GMfnn0f
         9vrou7lnKteeQnYblPhls+d60QmVp2oZyC1y5xfZYGSblwN8MnD1Sn0bUsxnmu6foBGp
         nxgV8S33nsaL36B8Ajrv7e7FXYKBY7p6bqaAL35kia6ZS+ZT4nryChjWfHgsslTzOK7m
         90Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926492; x=1738531292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYxKemM/xZvwRVD9aoAgaA6gwfgdoNiv4c107IIPZT4=;
        b=EVIb9iilqyIqIWsF0uXUGB2RL0byS0KifLv/e++gOOqxwu3bkp7GQUyL6LVR5lJAO2
         EIFcDoFGWNlqclxko47bb+6gmCogg9uL3XCDZkxght2ax+BRP7YacnCZFcTBlThogwld
         hc2iLxcnoRdrXOyPHfsojqpCexWQwC3x+l5gUgRkVeSpZJPxPh/xzNqKrRfI6GB6UzcP
         kOGpRJsdhIuRW98brph6q/JQPVbL0tqlAdDKXDPVk982ME5N0On9xHJ5BvEem0K0TLE7
         F4KguAFGAmcsxI4QWgB1WvH4zzMPigWWkYJJ20HAbgU7ByQsQT53Bjh8aLcUw3eYFHJh
         3CWw==
X-Forwarded-Encrypted: i=1; AJvYcCXQmRc7VEknxa7G0Ix1TOVl30cPJt6AHq/9ovCI+TW7cpn3jHx16/h3Mo70RuX9ZLHUfn+cxkHePSK7kA==@linaro.org
X-Gm-Message-State: AOJu0YyM5Hy8XKUU2XBnLOoEozBjHSpAl4CM+L3JIPiHLm4ZRAOSjcQE
	/Iqre8cOr9ebWUsr3QpDwZbsjKEW0Leydvk2PR/WXYXIfXYSfyy+qCdm1ey90KiblA==
X-Gm-Gg: ASbGncsalilJPpJmBX871gYMXyMkUw5tVVmlInhBT9TE3uryyeoUiKXFVRHkV1Cf9UF
	Qt3/DZYII0mAmIH54coh/wZK7hL8CxQ+68JVE4nft5ar3nqkXsGuN54YcNWOmHzdRtvFzkQdbYr
	o9zeBANl6zw9kQ+QZY0A+UcanUWblffPTRY2VNf+mETRuOdwvjLhh3JxP8hVPew8pXH0Q73T7ji
	Cu6/B35D6GJB6I//P5QuuWChXCpdKYguAu8rOFXtakZqemY8T5WbSKQk3HgivIiqqwaNIKvkLFo
	tN59BE35RYfTtrELBieqd6F6dMpMi7r1vvTMfpO21ZwBwws=
X-Google-Smtp-Source: AGHT+IEK/IDwjYTfcGC9vytnhg57Unum7j14HBhQ+TRt9SQk9fY2DLtXa4M3MfHh3b7yHzuy9lAQFA==
X-Received: by 2002:a17:902:c951:b0:216:5268:9aab with SMTP id d9443c01a7336-21c355e832amr552530105ad.46.1737926491907;
        Sun, 26 Jan 2025 13:21:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141e2dsm50143635ad.124.2025.01.26.13.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 13:21:31 -0800 (PST)
Message-ID: <6fcaa7b1-ba43-4a3f-a560-5d05a57cdc7c@linaro.org>
Date: Sun, 26 Jan 2025 13:21:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] cpus: Have cpu_exec_initfn() per user / system
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
 <20250123234415.59850-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zK7WFHGvDha8

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Slighly simplify cpu-target.c again by extracting cpu_exec_initfn()
> to cpu-{system,user}.c, adding an empty stub for user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Good enough for now...
> ---
>   cpu-target.c         | 9 ---------
>   hw/core/cpu-system.c | 7 +++++++
>   hw/core/cpu-user.c   | 5 +++++
>   3 files changed, 12 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
