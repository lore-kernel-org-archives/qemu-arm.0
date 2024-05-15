Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp523595ejl;
        Wed, 15 May 2024 02:48:40 -0700 (PDT)
X-Received: by 2002:adf:e492:0:b0:34d:8d55:739a with SMTP id ffacd0b85a97d-3504a96ab52mr14639717f8f.57.1715766520063;
        Wed, 15 May 2024 02:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715766520; cv=none;
        d=google.com; s=arc-20160816;
        b=W3GRJNDB3UPfNuVrf8Gb2QPJCntCxbo3y4haHbBQyYQfK5Q88o3jichGdBiyZYWdT4
         ysflwX7Ll2zDJBNk112LgcPkh2lQfzW85bMz5NJq31Vb0vfQPLbWqd2XsAhocO1NyJpI
         JswfOJfuHZL+qgvuIRmQOoUS4AzLKz+oJYwSQyUhtKYr8kkJaBeeqOzcmx93ym982G9n
         4iSTB3LBcR+pHSg6a3vaBp4b8JCJ9CcHJM+2uc38vMtIJqumwFRaVgdHg6dHkQHNKfmt
         Lbz2jkHxECtyJwE5bt1yBgrcr8v04B7qdEU52qj1ZuldRuUirEgStuD8gFwdSF/5WbUv
         //Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bwDmf06pcSMv31kgM5n8pjeZgLxFisSiDJ6rGX6CzQo=;
        fh=Cs/fbuvFiMkLdTGG5mnddmq74k2WmtJg3cMNRFm0Bsg=;
        b=DJU7AUocaB5w9hnBTiZ/bwA/HmwZtE83udd3f6xYAcW5/TrCcXVu8QxJuq4vJpnfwa
         tmKiwmJvtfmQZ36IKAx6wZSX7dYBUuvwmq8457PPCpZ5bcNmuAABpQWvKtq5Uq9SYckE
         Ii8L93XSEd55LNdYDseWlquIr5SHa4v3CTJ98Rlz0FX4so19ftb5wVmTro/o3t4BYwzh
         EXOqFoEAPXWiM463NbYKe1Z7g8nEEnKlm2shGGjB2VYwoSzDcmXOfwk18Ct1nwSJk1Yg
         3fynIHZzi/M6X1FhXZ2/otNvQbojTsqo/wYtcY+B+g+CQ/hMWeSbuSj1W0sG4nduEaSW
         OpYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V9I1//KC";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3502baad166sor3440656f8f.5.2024.05.15.02.48.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 May 2024 02:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V9I1//KC";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715766519; x=1716371319; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bwDmf06pcSMv31kgM5n8pjeZgLxFisSiDJ6rGX6CzQo=;
        b=V9I1//KCSH5A7mWsazkWB5rJJqDV7Ka4XgWRH4bmO+4JH/W8KTHaviy8WhQlsq34Y0
         SeZKTAiiP7PImzI7TxRDo7NMqdyFN4KUqth1DUClhszwwckLpTaJ9Dx5PRiyWrUU0+Ls
         LrJn2T2MHWv8oIJhcNLEa/i7Zi6sLh+MXHljmOwbpf7IHhB9MT1yos1M0N2DkPzP7w3a
         Dg5Mhcdx7HxszF+Rt+z6dnAvxxKWaySPeB4fyBePUjS590s6jcxXvRrmzjP/ml9lFTRy
         ai84KaHCUqpezSj5Z22kyQsG9l+GpoTm7g9/3sYNHchUwBVwf/TW6oCZwAiFQdykXgmm
         NkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766519; x=1716371319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bwDmf06pcSMv31kgM5n8pjeZgLxFisSiDJ6rGX6CzQo=;
        b=f+3Clij08Eym/EEnEucvgiYRF1Go2bCru34DCQQIXfkokLpVf4dKKN9V+zxwvArHcL
         Z8D7CyKXcSfU5CvBRQJTFIEAgXpGNdMaqMFus6kZ1yT2S3F4/iKViDBmu2XaDSPxEtKp
         lMVcTRa9hPJrxgxSBz/o4d3iAkkBxZjoYUOMEUoe0M5Lk9aTjusbYPzYHGKtMGVeVMgY
         2Xqz655ZbuHVx3qrfsS0r8sF7LiyDKaOs9VOiqjObCbQkNxWB40Zl4xUP8tl6Uf1gs2t
         p7DN4BRGfcvf0gnB3pEs6alG1CsDV498qmt5YgtpdpPAJOAFab09icJVWuTZa1ksaCUU
         Vq5A==
X-Gm-Message-State: AOJu0Yybchau2OIGcdnYQ9Wt37YUZe9FogCwhjbzmohs+g6Tdpz8FYMq
	xxyoWYfMlxbAC9tEyqRc4Uj/cEUiPYHm3SxOHgvKC9YgP0mQjdcowDv4SWSWqi8Uy882JtUJQJL
	M09U=
X-Google-Smtp-Source: AGHT+IHUFiRL2zN9WIajlZRibYWfE+iDbmrGCNyaJ8tAJxvMeXjlh6cpqSxFreT20ELYQG+1tMHy+A==
X-Received: by 2002:a5d:6952:0:b0:34d:b40e:e65d with SMTP id ffacd0b85a97d-3504a739495mr14907190f8f.42.1715766519081;
        Wed, 15 May 2024 02:48:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.91.1.102] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbff7sm15966916f8f.101.2024.05.15.02.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 02:48:38 -0700 (PDT)
Message-ID: <e7b9ebdd-cdc4-4d5f-b7f7-2c6e6073e0ff@linaro.org>
Date: Wed, 15 May 2024 11:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] plugins: add new inline op STORE_U64
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
 <20240514174253.694591-6-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240514174253.694591-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bPd0BCU1PxJT

On 14/5/24 19:42, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> This new operation can store an immediate u64 value to a given
> scoreboard.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-Id: <20240502211522.346467-4-pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/plugin.h      |  1 +
>   include/qemu/qemu-plugin.h |  4 ++--
>   accel/tcg/plugin-gen.c     | 13 +++++++++++++
>   plugins/core.c             |  6 ++++++
>   4 files changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
