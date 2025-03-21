Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp495727njc;
        Fri, 21 Mar 2025 11:02:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtB+NZNRr2xX0agrJG5xXGbV9pmr48zdXTKX1vwEZdl5RVigqZHmNKFodQopMfDDnQw71HlVwgciOjEg==@linaro.org
X-Received: by 2002:a05:6a00:1409:b0:737:e73:f64b with SMTP id d2e1a72fcca58-7390593b7ffmr5999317b3a.1.1742580139920;
        Fri, 21 Mar 2025 11:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742580139; cv=none;
        d=google.com; s=arc-20240605;
        b=ByrWK9o0qEONBJwUeauDVgHLVRXpd4NAQtpv4YrcwW+Sz3WufaUtFqjrxiczge3FAC
         h4ArfUDZ46f0u/mJ6c8Xw8tuc44EzQcNPaQa+iPuDMt6nZlzPnuz5541eXFENBuhsruI
         Pjtfz9EIKvuYUBcgncfrBhJvjW34MTqkR0qpljG0Ffbh1K7AOv3UnyiglV4ZoTjyqCM+
         PEuDd6jlHug3EBUeY8oJnmSE6y9hhapdefP0buyPhLDqZnYRjAWzdQUSQ/3VqOZ6FvpD
         o+RecN6sZNgk+4lBwDVh8+zKXQTFOxHbvbV4geGlrcbfPguT0jQNKircE8hNaQg/hVk+
         c6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=A9wfgTNVwbh5MviuCEEjiqNP7cX1EHVYoRPAjNSeYzY=;
        fh=zDLIJCSTYmOtkNk3tyWKTvc+5X3m7zkIxd4/asQVg2Y=;
        b=Oh79+mJcfAIRIKSA3t/YdYYgrwSPkGtnH8167NXmfs19Xrx1JqlyELEoXL9U7LDQiy
         7YJua+ocBt4f+DRcdY9igmQ3czkpc5mCYDHNuLZxf7P4zODlHYXKMMXrTdiBzotki9Kt
         QXV/PIYjGiZJMAMt2UczXE2XudBp/RxyDBxnCHBOdJPqp/mZvV/4Pmj/RpWESp7/7GLW
         1T7kSQSG2hzyQfshiC6SSg33TH8cQX2VpFkwV98ZB0PnURpbC9FoEVE05BlW6plPnrxk
         Qh9Ri8dDvhQoQiG1w2L+DMEZVqXDthGZnCLeuXog7L8sHsf8Ro8cs909pZRzm7Yliig0
         49yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zjqdD171;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905f9fea2sor2401149b3a.3.2025.03.21.11.02.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 11:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zjqdD171;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742580139; x=1743184939; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9wfgTNVwbh5MviuCEEjiqNP7cX1EHVYoRPAjNSeYzY=;
        b=zjqdD171ixnVJjCWqvXwVAADSJR5YpBd/ZRx2YKHokSgT068EtYeiE135oHeM1WxNm
         uqWmrhdBJ8BdP/1uvWEJb+mefI4GMATkl0zw2UerZdFhkP/+0t+sSo3AXI6lGikl59De
         n3vHWKEAn+KvS143ljFv9HO50zBjOm24lRzlFCqz5E2aJZ99SMU4e3HXgYNVloqC281c
         xvuZqKx1ztYIaG4TWtzcc38OtwHT+XXRjHTSCDsGSWxTEJ419Zq0PLgwACnWBFCCm5mb
         5xSBDhP09irmNNrxiFXNwgFfeOJQP5EQoVZ+K1h1H1MCZVbdVe0IcvcwkDPdMuW3dC7j
         nr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580139; x=1743184939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9wfgTNVwbh5MviuCEEjiqNP7cX1EHVYoRPAjNSeYzY=;
        b=EOYzyJyFW6JtMnG/Pv0GKGncKggJLIEXPeWJeUA0gMwJG9OtCQDdG5/t2vxdCNi+u2
         EmYCFvMVVnxG+lsnKc1RSQr06Ifio0hsn54SQzXyt4ypp2KV6ZZWi5rwUB3wri9kRJ9C
         guoett/BiMMsrkRv9yVteXsdCKOl/HXWTlIMS6/aKTaskEALbmkDGtGE3cT4kiJap0Gr
         8BNF4Ch2QBCjmKFiHSv9SSVOgm5q1rVjUcQ4yRNqsOPG69DFLFh/v9509vK/wAyiu5ts
         rLJjU+0KaioGpPmKYuhJnWTA49lPlH+AvSATJpwSIMkfJ/cqrLTsLwPUT6R7bcBQmLBt
         bDzg==
X-Forwarded-Encrypted: i=1; AJvYcCVkPXJWJO/LnzjuT/gcmIejgI+gYDTmFUdIxRcPwSQRZHl40et9bgt7Ozgw0vEeEx+vMr2BX8PHjpfuNg==@linaro.org
X-Gm-Message-State: AOJu0YwgnIQytysp3xAnFiyErx1IYdSzirmq6OohoNqn/+McUlusw5tB
	Ug8Zeem7rYjQXsYOjZzSbZvcmBn9nwTOJN7rXRZBt7+ZsgpDHjUY9Xb9HJzxtCNj+w==
X-Gm-Gg: ASbGncsKWlfiG5HfRgYmoc1NLNumJNza+IAN2zBNPtFxatAxUp7Luwx4POWkqjUGNIL
	aOgHxlpoXshH+sW4ottpamNwmJ/hEZyDMYRNsJQw8q8gp7JOG0iXoy9+szTioMWXqWq4tSKayFk
	N/KpnfDg2fisOEIOebzGT6utBNt2AsW3ElN9c6QNl968UI0pdFS/LZYhYLMYez62SjxAr1YYBJ4
	jdTU2XtZ+8Ax/EscBnTqyLbtjWB0Yt/wWLTv1UiLEDNckM6KT3CzouGOsCdxQrdIt6PUa/bw9su
	ibTru4j8EF9gyM0wrfULe1m8geXKjRI5sAE0RhqOxRz/PqRfll7nLJ7yafOURFyJd7NAhjtd9T9
	mMFJLuhNO
X-Google-Smtp-Source: AGHT+IHbW47WrFwn8bPtk5JBZarkAnDdE580JK1jViCoJJP9Ixi4V6AItwt378nhBF0j1KTuI5MAIw==
X-Received: by 2002:a05:6a21:e545:b0:1fa:9819:b064 with SMTP id adf61e73a8af0-1fe42f2cd03mr7722012637.18.1742580139449;
        Fri, 21 Mar 2025 11:02:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a292b1ffsm2070387a12.61.2025.03.21.11.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:02:19 -0700 (PDT)
Message-ID: <a5104aeb-6b4e-4634-9d46-9dab4e09595f@linaro.org>
Date: Fri, 21 Mar 2025 11:02:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/30] accel/tcg: fix missing includes for
 TARGET_HAS_PRECISE_SMC
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-14-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-14-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: N9tDsA4ichIP

On 3/20/25 15:29, Pierrick Bouvier wrote:
> We prepare to remove cpu.h from cpu-all.h, which will transitively
> remove it from accel/tcg/tb-internal.h, and thus from most of tcg
> compilation units.
> 
> Note: this was caught by a test regression for s390x-softmmu.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/poison.h | 1 +
>   accel/tcg/tb-maint.c  | 1 +
>   accel/tcg/user-exec.c | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
