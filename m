Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp324722ejo;
        Mon, 11 Dec 2023 08:32:12 -0800 (PST)
X-Received: by 2002:a05:600c:6988:b0:40b:2a08:c45e with SMTP id fp8-20020a05600c698800b0040b2a08c45emr2279366wmb.3.1702312332584;
        Mon, 11 Dec 2023 08:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702312332; cv=none;
        d=google.com; s=arc-20160816;
        b=OTaW1PwcqE8QZDZLm4TjwI3X3H2evbgwxwKlxwtyqd49UCpWEJ/bmPZrVLNPhzkxKO
         u5WCdhpfspE7vriDq336qpwyXKdCgrRu7zjUbhEUmitqS8XM+ONEopse+tbMBwUPJm4a
         wBxQQHeoiLAAu09u4l4FAD6Gdg5mklwUT4m1mTLGdp6B6FfN1IPFSmCgnpj5Pp0J+Zrw
         0fwMaKFjFTWhBdyO3FDHerY7X9108It6uaSYa5YDfgylO6K+sd7UMdiq6d3GEqd2cY1t
         Ncc8DcYhQk8msZsOVFBLJhS919SkdScECIiOvJYGcWVQ7JaNsPIY6d7Pi/3w1Vvka8rz
         ac7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZC/Ru++AKfDAVSthl0Gn/YW8p3YyY3iWJ4FjPBiS+m4=;
        fh=LIN1c+usLVQtekpuVQpiJib5J9IPes9pLLH99qh6RZ8=;
        b=u2CDt1d//mhgi9Y2oz2SqyEWP1/3E5qZ8wfO1q20VlUGRZ8DQuGOW6caamXQC0FH3+
         1yTn2FqCAOtaEy2IcikRRB0WtZeLAT2YjGZ/OfS3m/k9/MgW2J3rglacCDx2gVBbhYnv
         3GCmOZbl7SwOlFLcNwtwSWX8tDlBo6iWQp0rn241bmSVusP2V4It6v/O47cQDaRRB3j9
         CO3gZZVucyZagfjazOdJnQpRsRZqWy/eCuvGUzH4ULTk+/gIU1uAXLyi8Cpkmgr9ybgp
         wouBcQo1GhiZTcEEzRlQXQUuenNiBscuZYAeh9nQHzfyQh/5VPvl/EwRdAzoVZIWZooG
         IQ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ss4suwtC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l22-20020a05600c1d1600b0040b552e2556sor2214934wms.3.2023.12.11.08.32.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 08:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ss4suwtC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702312332; x=1702917132; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZC/Ru++AKfDAVSthl0Gn/YW8p3YyY3iWJ4FjPBiS+m4=;
        b=ss4suwtCldzOULsrENcZxgdpr879PhVd+Mh2wlo2lcSnBrvDD99c9rt+7IkVGVbS+j
         ZY/9h1FpyoJxPLiUmZC7JuRXjqQhoL7AJao+9lGIz43iAr8T7aCndYZWZqxX6dlL0d4P
         XbETlc6+Af9fZJGXKmAupqS04eg1ooSSX5gJ5E2FrYKM/CcV+7f6YKcHyG1dGLbiQXZd
         +ZzsCYFktMfAcJ99PmvPS75PIP9hAFb+dTyOmPNL7MthGr3ny9l22RtiN4EjU3jX5E1R
         MoTI7cSTjjNLWA+IFxA8GKayaBluYJx43B6LkHDVvQ84LVwuw515kf/RBKSIeD/IUy9+
         +QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312332; x=1702917132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC/Ru++AKfDAVSthl0Gn/YW8p3YyY3iWJ4FjPBiS+m4=;
        b=o0F1RCJGzDpIrCArxr72FkzWkEOKTyunCvOOdx+9TJp7QM9W7ETvJbzVyDf7/Y26Q2
         f67huptpjttAwqkdPOaf0OpPyQWT5IbXMfWuJoPycSGNZkADN5XI15m95ZgU7DpRsrq6
         L4hS68nSOndGV3uK5lzBmH4oUsTF5UsBc87MhVF4Tcck1WczKKNGhpNT2+aobL2qihoM
         sfMoBGS9ea8t9EC4A7fVEpHPGheSC7LkIAWr2kChKXpeLKkUP3lcjox3Gm6Dz2GkDl78
         f2ZjeLayMnu4Aaem9fOJbrJZEOyBMKxS3NjxmBNYYp0/uGNL6KmMyQNJ8j/jPdgKDRU/
         2MUg==
X-Gm-Message-State: AOJu0Yy3liBhndlmCXl9ajzfAWTqV6wud1owm8GQLjtYg61FVcPn4w9Z
	LitwerNSVabA1h3kRY6jGHFA0KNU
X-Google-Smtp-Source: AGHT+IHEkecFyJiUoNupMT3GCGJUuJeN3CABNN+TbWlp8hRrybeIODmqtc3ZAp/SDvGTaHa2punOvQ==
X-Received: by 2002:a05:600c:2a41:b0:40b:5e56:7b6a with SMTP id x1-20020a05600c2a4100b0040b5e567b6amr2163621wme.179.1702312332190;
        Mon, 11 Dec 2023 08:32:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cor91-h02-176-184-30-150.dsl.sta.abo.bbox.fr. [176.184.30.150])
        by smtp.gmail.com with ESMTPSA id he10-20020a05600c540a00b0040b3829eb50sm13346844wmb.20.2023.12.11.08.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:32:11 -0800 (PST)
Message-ID: <20efca0c-982c-4962-8e0c-ea4959557a5e@linaro.org>
Date: Mon, 11 Dec 2023 17:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] tests/avocado/kvm_xen_guest.py: cope with asset RW
 requirements
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-7-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231208190911.102879-7-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: KGgzjGtTi8tL

On 8/12/23 20:09, Cleber Rosa wrote:
> Some of these tests actually require the root filesystem image,
> obtained through Avocado's asset feature and kept in a common cache
> location, to be writable.
> 
> This makes a distinction between the tests that actually have this
> requirement and those who don't.  The goal is to be as safe as
> possible, avoiding causing cache misses (because the assets get
> modified and thus need to be dowloaded again) while avoid copying the
> root filesystem backing file whenever possible.

Having cache assets modified is a design issue. We should assume
the cache directory as read-only.

> This also allow these tests to be run in parallel with newer Avocado
> versions.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/kvm_xen_guest.py | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)
