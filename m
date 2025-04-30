Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1154383njm;
        Wed, 30 Apr 2025 11:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXohFnwELgf1l2c4d7/eCWxWATo8JhGPdiFV5eBpab+0nI1/XL+dwnbQ2N0LnmMTs+Oum0HrqIpfQXmvA==@linaro.org
X-Received: by 2002:a17:902:ce10:b0:22d:e57a:27b9 with SMTP id d9443c01a7336-22df34ebcd8mr75295325ad.22.1746038220275;
        Wed, 30 Apr 2025 11:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746038220; cv=none;
        d=google.com; s=arc-20240605;
        b=a19suhMuiMrJxQ3rCQC+r97NpFam4XF87FgJ2Hj9WzZtS8LaiWy7MrRT5cGh8g8I5o
         vO8ONcEJsSXRa92Ovg9q8czGksCxjFaLivWF3EXd0UQCoL41nBVZrOophmJIm3q5ZDFR
         wJ1xLCnT1TUvRbWtYVRIsDS4DQIteM9jSjlmfU0dj8oXHjuEubNcOOnG72aujGfU3AMo
         H9t3LKBp6+ii7DGKuGkZwUB0f8ieaBh/e0sn/Cvi+2lz0pqSu08OACmzyoT2AdQoS36P
         v9TyMSe6Leyh5KhN3zb7bbx634ah4EZ9OetiVMZ3YvD3q4r6A+dVI7fCn2Au6U8DaEU/
         Tf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qI0Qr3sJ8BWLNtDXHSs21GX1niptxc6s+/cv7MszLEM=;
        fh=zyNGP3f/BqFDbt7+SQHBEcjuECdIFAItu9UoXGJBzdc=;
        b=SSj0aOYoJ66n5wFqkXk01wjmQ3YkmOt61lDbiKSlbi/DNf1hQqD95t8IeuaFHc/Xla
         Ctknz+fggHVcezSAmqdWXrLRaDhCKCaHaKRKx0nHlh1W8iSFazs+mj3+FvjUjNqaA13e
         VPqA80tFZPWCtSTIxBltaLP6gn2p9LikD/3qsOvYdEQwo/lEGf7H+M5goiF1572Aa9SU
         sIM9/rtABvtIBDz/bQAo1ZvoyijkvtEi0WKu2i9XOriVECxtBp2d4D8VHr/fyml98dNB
         +GIPzLx0EvmFOAbzn0fpmwO5JDv/nAnM0Dt5dgaJxfn9J0cnVnHgzLVGQ3mWd+hG/2zS
         nIIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JZps2dsc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4ddebbfsor98489095ad.6.2025.04.30.11.37.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JZps2dsc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038220; x=1746643020; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qI0Qr3sJ8BWLNtDXHSs21GX1niptxc6s+/cv7MszLEM=;
        b=JZps2dscdGy0sLzd9yfo29W6wtOwubBjlJJhd306hC66md3YGMmVFCOTPTaiccn6rU
         dinTpuER8711oiGYOwbLazEubOisbErMXWwTNqDywgNIle3ZnZEcZkccYQix8kSgPplo
         xWTkBWQ6wBNNV06CwuBvEzp8FYkTU8vuo+jXVpJYU8/NaZeZPEjw24LEKFpH9dF7C4oR
         j2AEjQvOZtfJWDRPmhN7H6g5E1N6s+pZBypOsaqTWKL+e0nxmKhdXwzG1/Mn3fdfC3pJ
         ke9GzyyhwyzRJ5GcHIRc8b+9xRn/HQvrYjuM+j52C4gP5+HU+NXAfmnkb8t7EAQovyus
         qK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038220; x=1746643020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qI0Qr3sJ8BWLNtDXHSs21GX1niptxc6s+/cv7MszLEM=;
        b=nq9+lQrYNn1uU666r86HGkskwkEuqa48chF+IIrSrOY7GODeAtOmVJTLATHRjMQDEh
         HW5AqgQgO+DShQPROXOnOj4CmjyjjUcsoANa6IqtMe6nMdrIWjP5harKyLMrQvC6hjkv
         XzhLsj2WcXbhIMMmnebZl7NE72SNKThkQB8g+Eu96VDJ/kN+p+VHedsC7juoR5KOifSi
         oyly1wDS4AbekRFA9FSzzhUjNfEUqYtCUR3JgUz8RvnFE9JKOrlmetulKW+PQPXqEMjW
         qd7VU/0d3zZTaIqzR2iQM2WBC+6g7vgYBUYajwJ4/6cybYKBdDeilAPC68pF+idij1VO
         /J7g==
X-Forwarded-Encrypted: i=1; AJvYcCWePnJGSZzW6xjipjzKfz4CqLElMAH8rCR6ptTC6bn7ZsQ51wrOtlPgQQLw8JyQ8TqbUGF+VQbG9Jntuw==@linaro.org
X-Gm-Message-State: AOJu0Yxw5gmevzw0mIY4PRDoQmX4mOFCeKDNWcSqtgI/oSAY/HUQgCRs
	6VNPrsl1AaVbBSn7gKghvHoZXUQNCWREJsbI2xXLVlv0c7JyTFG0vrrcE6G9SsiAXQ==
X-Gm-Gg: ASbGncu0a3GLrRB3taH5Pg3NjMUC7h8659ZcldrpgocugbQVnnQtH0XZdsh7NbqEArA
	zG+TYxLn31ynhqWCzCh8kyO82orBMwBmMrqymyeyEWMWhTCxKkPJhZianVWmCbqFZB6T2k44+I4
	6rRe0b2QLXpf1gbog8wPKCsk5hJZA8lbztbrrioQ+VA8WnqzYUdrU/F3nh7kfFh+tu+aYQY6njQ
	vTcBpqxItPiWYMeklqc2yLiMaOIEN0KztG46hJUG7rssz0WXS756VQGLhQhnAjVl64nt6hmFXUL
	VozZ9LGjhzNg3Pj3sRpYdl41lYjP4EoUakV5LGV6e/0HZVBNL8HqI2TRvWBKbyC4r3lGlwpSpuc
	9uPTRfk4=
X-Google-Smtp-Source: AGHT+IGYbEHufWt5jICpxhqSqovtwuspnzbcMjk29p/zyq7TxbJGOo+t2blgF/vfmRVoKNrbNlUnDQ==
X-Received: by 2002:a17:902:cec5:b0:215:acb3:3786 with SMTP id d9443c01a7336-22df34d5d89mr65461035ad.19.1746038219834;
        Wed, 30 Apr 2025 11:36:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db510272csm125428715ad.177.2025.04.30.11.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:36:59 -0700 (PDT)
Message-ID: <01400e4b-dbe3-4ea0-ab7c-3acc726d52ab@linaro.org>
Date: Wed, 30 Apr 2025 11:36:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] meson: add common libs for target and
 target_system
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-4-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7WDHRh0xd+fX

On 4/30/25 07:58, Pierrick Bouvier wrote:
> Following what we did for hw/, we need target specific common libraries
> for target. We need 2 different libraries:
> - code common to a base architecture
> - system code common to a base architecture
> 
> For user code, it can stay compiled per target for now.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   meson.build | 78 +++++++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 61 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
