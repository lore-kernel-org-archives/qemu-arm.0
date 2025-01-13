Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp1925689dlj;
        Mon, 13 Jan 2025 11:32:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVShEn3GwWDpwk2AqVzTi/xmCZOzmS2nmI2oVuzbWuGIGQ0W5gtDoJ9qMVLwltJG6qTTczB0vuaorAUw==@linaro.org
X-Received: by 2002:a05:6a00:6f0b:b0:71e:13ac:d835 with SMTP id d2e1a72fcca58-72d21f7aef9mr27794220b3a.11.1736796763247;
        Mon, 13 Jan 2025 11:32:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736796763; cv=none;
        d=google.com; s=arc-20240605;
        b=VcmAH8nI7ARkhoqqNk73nhF4RtBh3sN3T0raTc9vvg4VriH8fKZFgQa8yWYYc3u0wD
         pGqXtqgyD1k9lgEZ5xh9wueHZmRWjnUhLUGwxcTI67tU5vnp5Xx1aA9PIYgukawngVnM
         F9aGVY6miQqNjWsa8EuNLlP4kmbqXzhY6M4+Eg7+fGWCuKuaoFkZHAToKOu2VXTWVqJ6
         YW2W+R6c2qzIV88wFtnSZctuHXta5ZpP8cH1OhiKqxD+1UNMGjnuP9hj8U24JEIAzHP2
         WbSjtf2xxccVz4JBTb6/cRDm3B9ch+u8lqq5vhyCRn4rNTv7fa3z3cim6NtOOtinjER5
         oFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4ov2bSdALrFYAy5nxZDetn7TmiPVPRW0fJBPLm96grY=;
        fh=LHJtrtYPAUanPsFPD7zX1navPdoqyf5+euvhbwdHAvE=;
        b=hs5uaah/YYGfNNW3Z3M8iGpmA/mlx/m5x/IMagq810fYURbOCndDyHA0yIse/xcuuf
         xGND7y+wtCBMkWKRLLtbQottmNFyFXIVCCoMj231mdum0ZElWGE3Gbqomh3/HCBWFYwS
         PnnIEzA8O2HuovyoFV6kIGyMLcPs7unlf0NmYyQOnQn6acBNFqR1lyBm4qobQn2zPIX2
         wXqlkqqoswZMfTvMRvzSwyLrPO9T6urT1k6V3PYpBrB8wso4L0IhqOw2H2Z+USuG3goq
         2r0IPv5gTYlmfzMpTqJ292Y+JqX36qKOD1RNihtC/aOZK1mP7F8YhsC15yQ39J7z6HHI
         srZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utm96r3s;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72d34056170sor7707903b3a.8.2025.01.13.11.32.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Jan 2025 11:32:43 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utm96r3s;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736796763; x=1737401563; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ov2bSdALrFYAy5nxZDetn7TmiPVPRW0fJBPLm96grY=;
        b=utm96r3sfLnJ/qhtBm0ZlvQkFZpKxLIA0nEtFFQbeSUx5/ybIAsGJYVCLMvHAPdM5H
         x/tK9fDKM84nmcK0DaYmG4l2x2lMKP8Ah9gcdR6+nd/Sjdhakc7I8wyF+Tl/IOkYsNdE
         6ih5HOrRyjr18FpDP23Dy3LyityyFJdjsSvK/Nqanks2561G51gSoNHfvMFkeNkDYnCp
         3i/cFFhD9djPCsnXX7VhzpAf4v4Pt1bDEHoz8Xd0lvUz3jNwFE7QHHY0CwXOEwZoxcPz
         4xDynAewuYlvNnQ4xN8JnF3oa65URNBdFZUtfDsUeRK7xynyX/AY2bSUdifwKU0ua5mn
         Ym/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796763; x=1737401563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ov2bSdALrFYAy5nxZDetn7TmiPVPRW0fJBPLm96grY=;
        b=uCmvx+8cmkQXYH0N4ZG3ZZmrnELWgtChIGGRHFpRqlFhRVlBVraZeGB6dGtVL+iP9h
         tkJMSqOxcoU9O3+jbM4IIZU83pRuXbxYSv+2cMPgnnYzvElKaSYt4y1skoWsDGxx1vXK
         gAjzGy7JVN65Cl9mNIJTFXl2Yb+EKTnrRv1hoo1/h84skCipDs6tTG6GdPF44ayhgeka
         cJxbLZvah3xv4CmQSsTeqaDHwijonGEtbCg8tLVK4UQ0c5NfcIsciMkW0zQZ3qo3YcQg
         mdLitrQGkK6sfxTPm7x0TsteBKoNal9K0CUk+ZZmsSY+/myufXuz1VDDi5mReGGv7e/j
         wU8g==
X-Forwarded-Encrypted: i=1; AJvYcCVUyYcRDUIrzDSpon2ACTbUIR/S2SNadQrqg/Q6M0IwdIfUaUIzDtB6jZGMh7U30G54JrGPFMZJaycSbA==@linaro.org
X-Gm-Message-State: AOJu0YwoPrmYohYEAI9+vLMJYYR+JG4XzYnDFGpRAgpjyLlS1vqkiJA7
	DID0kTTE2dAyKdKcD25AVfkOZy7WqIR6jy0ZrC41qne+3r/WTzrN6kr645mYOILIRw==
X-Gm-Gg: ASbGncsFPVNoL0SGSvmzxtjL44QJ2Wgi4oM8a7NDSqx1yHDHPXVNENNirDKb+qIU3y7
	ABarNPdxtpuEkPgg1Et8ZESVSzgAe/dPYXqqFSxvkkLIzaXJaabxPu13qsR78iKGn0DiHZVs81s
	wRXXOmBJhu9SUxA7WuXAASt0/UCpuJ9SCLFfMRk2xuG47lKgMp9uTi+mEQT2MOQjGUzW5yyZD+K
	fib/bk7QWwE83csOplDVbQSpWzT5XtVTwRhWC6yn4oXNPzZKHlyUOw6gJ/LlC6yNHdDMA==
X-Google-Smtp-Source: AGHT+IG5Ooa8+sFqnGL19qgItzPGcWtXg/xU1EiKGw0gnV9YAEnpnFwst3vaichpcL+77B10z04k9A==
X-Received: by 2002:a05:6a21:9182:b0:1e1:bdae:e04d with SMTP id adf61e73a8af0-1e88d0e0c0cmr37167945637.36.1736796762722;
        Mon, 13 Jan 2025 11:32:42 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a318e056063sm6182257a12.31.2025.01.13.11.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:32:42 -0800 (PST)
Message-ID: <359e6921-fe3d-4f53-8ba9-5cf2b7ab6a6d@linaro.org>
Date: Mon, 13 Jan 2025 11:32:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Change default pointer authentication algorithm on
 aarch64 to impdef
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, alex.bennee@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_ChARwKyvRXsEk1U3q1T2528753Eu7LgDSsDbF1s5tNQ@mail.gmail.com>
 <CAFEAcA_SHz2a0ZU=3e9AmZyJ_qn3e7nNhNm-hR9MdiTRjOyqWg@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA_SHz2a0ZU=3e9AmZyJ_qn3e7nNhNm-hR9MdiTRjOyqWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4LkVwHBFo+Lp

On 1/13/25 04:34, Peter Maydell wrote:
> On Fri, 10 Jan 2025 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>>>
>>> qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
>>> spent up to 50% of the emulation time running it (when using TCG).
>>>
>>> Switching to pauth-impdef=on is often given as a solution to speed up execution.
>>> Thus we talked about making it the new default.
>>>
>>> The first patch introduce a new property (pauth-qarma5) to allow to select
>>> current default algorithm.
>>> The second one change the default.
>>> The third one updates documentation.
>>>
>>> v2:
>>> - ensure we don't break migration compatibility, by using a specific backward
>>>    compatible property.
>>> - added some documentation about migration for arm virt machine model.
>>
>> Other than a minor change to the 3rd docs patch which I'll note there:
>> applied to target-arm.next, thanks.
> 
> I just noticed that this series breaks 'make check-tcg', because
> the pauth-3 test is explicitly checking the output of the
> pointer-auth operation. I'm going to add in this patch, which
> goes between patches 1 and 2 of this series:
> 
> Author: Peter Maydell <peter.maydell@linaro.org>
> Date:   Mon Jan 13 11:42:57 2025 +0000
> 
>      tests/tcg/aarch64: force qarma5 for pauth-3 test
> 
>      The pauth-3 test explicitly tests that a computation of the
>      pointer-authentication produces the expected result.  This means that
>      it must be run with the QARMA5 algorithm.
> 
>      Explicitly set the pauth algorithm when running this test, so that it
>      doesn't break when we change the default algorithm the 'max' CPU
>      uses.
> 
>      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target
> b/tests/tcg/aarch64/Makefile.softmmu-target
> index d08d9b01ded..9c52475b7ae 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -91,6 +91,9 @@ EXTRA_RUNS+=run-memory-replay
> 
>   ifneq ($(CROSS_CC_HAS_ARMV8_3),)
>   pauth-3: CFLAGS += $(CROSS_CC_HAS_ARMV8_3)
> +# This test explicitly checks the output of the pauth operation so we
> +# must force the use of the QARMA5 algorithm for it.
> +run-pauth-3: QEMU_BASE_MACHINE=-M virt -cpu max,pauth-qarma5=on -display none
>   else
>   pauth-3:
>          $(call skip-test, "BUILD of $@", "missing compiler support")
> 
> 
> thanks
> -- PMM

Thanks Peter.

I'm a bit surprised because I ran all tests , and didn't find any failure.

I use container 'debian-all-test-cross' and ran 'make check-tcg'. Is the 
container missing something that doesn't trigger this test?
