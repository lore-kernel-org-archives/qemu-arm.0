Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2673542njj;
        Mon, 5 May 2025 12:33:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVVKySKklqrrFu+wnt4HjCN2VG5YDgULUtB/3a5qjrBK8LO2eQnxJXaGLiNdpMXU5hGYlc5IpPxsh1Rw==@linaro.org
X-Received: by 2002:a17:902:e5ca:b0:21f:53a5:19e0 with SMTP id d9443c01a7336-22e327f74c6mr9231825ad.12.1746473623608;
        Mon, 05 May 2025 12:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746473623; cv=none;
        d=google.com; s=arc-20240605;
        b=UeBm+ZFJCT823xouoepHbjgtZ/QPcJVme5roYNcuJhHsSof9ywEvXrdDgTiu4nRk9w
         fHbbDWvL/tpx/UzNus7xULcAOJIXR1eC3IEK1M492RPk4W9KMvrHcB4zlgE8KxJ/ougF
         oyr3kE2RcPWhH+UMvmDwLQLcKco+ubUOVZKut/2lIfBrG66T659GZFnH1Maq51Ir4xID
         2OCBnkGUD8wRVenT14zW4vSj535vdvPA8T6xeM5ROMhirtNn62L9xp4Cxxl4QuVgY0BF
         y72oN/3HQ/yg5HenN/z7OtkCFFEnSgy+ZAkfbY6QtGuwlOQyKMDgWQFrOGAwrfdJa6H3
         bohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vWUJ5/LQMFceJ7l1Ffi4cUdM3ed9wHY8/6UU56HqvrM=;
        fh=PSa+/gKi7nHnqIoR9QKEUfX3aRX2c+kt1whaImzeib8=;
        b=FBq3eZrQmqbLzKLUW/2/otSQNg3+Rd6BpZoz8+OB36W9lfATLB+81k7bS/IQ7ihP8S
         XlmUmu9cZczYbYQaLN78iclxmlLYsr4xqnR+ni4LjSLXWrw5BEwWYXOuGu9ArR9kJzk7
         5j64BYySKETN4McyjlD+a4OgHgR4qwSlIQq7vn9VXVE5Sg86Vwh/FCBBh2NBTOZdt4e4
         I6e83eYV3ypQHLV2yma5h5azZk7QxgiNT42XloORhmf07RrFWGmNBjVFnlZLrlsZtw78
         Bo2mOvAlSdSF98OTpvqMdLVOSKtOU7pc1LSotIKU4LzlyrfN+qUBH3Q170S3N/Teks3y
         z9yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0FWt6hA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb6c100sor45779715ad.5.2025.05.05.12.33.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 12:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0FWt6hA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746473623; x=1747078423; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vWUJ5/LQMFceJ7l1Ffi4cUdM3ed9wHY8/6UU56HqvrM=;
        b=o0FWt6hAKc+B0eyS8HznbQOri4k53Rmxz4Za+5i+qHrVXdrG9b9sIl2gdfTedH8fwP
         b6CsinFt7ApnEzlhExxP2RozG2+Q0dgk6zpxpEn20LSCyGkcVAyZEL2ur2j3OLVT9Ypj
         MgZhPFT3HwhW3OIP/+eahZo9Mo6RmIedAxGez+Pyckw3Yz1rjecKnWfHomLdMwP+QR9H
         G/fVPZ5Vq78Qcg/TEdwaKH64Aat8CYr+pEvEI0TGbjrBntFnNH7jE5oTjIqMmJuqOx+I
         nwKoMxzL3L74giJzBnI1Uzdw7OeTY4J4IFUSNj7M6xG7fJPRoNUo3XsWrSRzGLfpQkq6
         /yjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746473623; x=1747078423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWUJ5/LQMFceJ7l1Ffi4cUdM3ed9wHY8/6UU56HqvrM=;
        b=sETzSMpJdfd4tFw5QeMzixyawsF5GAZOEB7LK8sGWbX/ZLFOqHXHSXWawso+ZGxALY
         hDUOmlThvD/mSI0ka5Wb++sgDY6iH3R1KOUKEib2fkxKiXtILdHiRVHH0U70NpiDRoRS
         RItHsEH+k7HGE5YE9D+X2/lc77quLw1KFCiMLzbCzZ8dachfQKzxcdjZZEtMRGX1QuDt
         Hhf6Bexy9XcyzKdwYTZe+ocglntJ51cVot+HxMkEcOdHLPrx6eJW6JrLZgPZhrKGfBJa
         uD77lUMGAj2loMu/mNrnwVE404CWguwf9Z9mVhleZYbtIYs0nMR8BjS2927boDNt/PDW
         p52g==
X-Forwarded-Encrypted: i=1; AJvYcCWqQNzDzlNCQ/mOJOi7DNpbFNkJ1epDIcKUOu7f1ZpwXFIt0mf+J/BzKEsbZu2yW5ow21WCH89vvOSBvQ==@linaro.org
X-Gm-Message-State: AOJu0YzqRZktTUyTs3rCxRpIzogalxO2UoNTjiIXZpGdFtdAnq/zsekK
	CTSvU/K8ziou1vWw5tDsKdPxvwaILZoF+ZUJQmM9YQTva0qZQH38E/YL311YNAocmJKO/lS4XV7
	AU/hrGg==
X-Gm-Gg: ASbGnctzfxz08VHnuGZ2pwvD6zbnshGNyiVHzU3wLBdsJcHoUnw7NO19Kj6ewdhfDy5
	rIPLvlun2w+45khr9neHklmLtmIltk/db19rLIFYdW1/ppIdwrF/z78iufSSnzDVE3QBArB0DF2
	j/yy6Sy7HwS8RutsZSIbIdlbgn7jjaP+dFnxgcjcP7ikQPdZXMBOMf86dAFaUsMiv2xpCWCMcxr
	58qpA8YaPYHZDq+WUPbqM/oTD432Ffsj5+kY98bBmloqVHXipvh6Ui3ZorLy8ZFVykumsK1cYWz
	sxHClFafdrFI5sQhNHFabGIoDPuKJrSx7KfOWXCL7VEwA9tNVv2DNg==
X-Google-Smtp-Source: AGHT+IEX9V83EnaL/ZcwpR1eBzmw998FIZZRQI9U8y2GSW1Kc/OQM9yPvI/71pp5QWhFctyPBRWNWg==
X-Received: by 2002:a17:902:ecc4:b0:220:fe36:650c with SMTP id d9443c01a7336-22e328077efmr10171025ad.23.1746473623187;
        Mon, 05 May 2025 12:33:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151ebd08sm58947705ad.104.2025.05.05.12.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:33:42 -0700 (PDT)
Message-ID: <85513f8e-232c-4d66-ad03-15c4f697dbae@linaro.org>
Date: Mon, 5 May 2025 12:33:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 47/48] target/arm/tcg/arith_helper: compile file twice
 (system, user)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-48-pierrick.bouvier@linaro.org>
 <e8eee40f-3785-4816-b96a-af022b3031b1@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <e8eee40f-3785-4816-b96a-af022b3031b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: x6nsVAwecIgM

On 5/5/25 11:54 AM, Richard Henderson wrote:
> On 5/4/25 18:52, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/tcg/arith_helper.c | 4 +++-
>>    target/arm/tcg/meson.build    | 3 ++-
>>    2 files changed, 5 insertions(+), 2 deletions(-)
> 
> This one doesn't use CPUARMState, so we can probably drop the cpu.h include, and thus
> always build once.
>

Done.

> r~
