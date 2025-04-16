Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3206803njc;
        Wed, 16 Apr 2025 02:23:13 -0700 (PDT)
X-Received: by 2002:a05:6000:42c8:b0:39e:e75b:5cd with SMTP id ffacd0b85a97d-39ee75b094amr189200f8f.3.1744795392772;
        Wed, 16 Apr 2025 02:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744795392; cv=none;
        d=google.com; s=arc-20240605;
        b=es6fcP0y3CsW/3ZRG8TsIikgv3rUVPPeWYv2LFyX5Me7D1LGVqpHCYEbd2A0UeIVTM
         rzavTN/yMOAKVy6kZsWRAnx/KGmABZJKJFqOaqKEb9hJTY823sox35g7AayOXXImn96h
         r3QC40ImnFWHb1tHA1L9Zpz2Q9UCE3FB+y7FJUCTkfHbs/6oPMjlDJSmQxLIWOGpPdHQ
         eWpfJE+rcZWKprIO3t0uC2F6fYZXYWkwKOkEo5b5sYPbo6ov4IVPcduZYRqN3bavIhok
         amzurirMzFhxeKTkqwAqTFasSLTHjqIa+59rHyLRmUgmqgRHszBlC3iuxT4AVrKpmHWJ
         l3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XoImJa+fjliBajtT+2WRyNvLKOrfk0bxtRwFuQd95Yg=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=VgUYmq5vDs/DHwmPBBiNcDFywnndgkBJ7bTRjyBBs0JS9ls+T5O94P57CmZq9f5tsy
         k6dD/pMsxa2vCgATK6UiDTgHKim4RS0KFutoXYdEQ+DOuJ9cZ7ZII2mGkwdhHxzknUWp
         ObfErRm/WW0TIUn2pFAwCgNd4diYtRlk1kl6o21OC+WOEycMDM989JIzaMaLULuEkXPL
         tUtxkMOKhAXh90r5NtG35esYr5QmyuZPwrULMeYUOLzc6NpLRCZCKbhRccRJmnW6QCX+
         o30dF/y6ZKO54uBbIfuAJPqjjEolzh5F5MaRaq/jihhOWbpBqk0Qz9m3jKxIp4BbE5eb
         bitQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h1Cc85QK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39d909d5cffsor4716051f8f.0.2025.04.16.02.23.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h1Cc85QK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744795392; x=1745400192; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XoImJa+fjliBajtT+2WRyNvLKOrfk0bxtRwFuQd95Yg=;
        b=h1Cc85QKIaDb/naIGGDNZdw759Y6jMrIYmZ09cZHLYAT/k03OEsTizHAWrlm6L9EiD
         JH43Twk7WjQ+SjvuJVsjn5D6ce/ORQy2Ev/e9rctUTsnCCOJiAEPsDLSeQ0zGlPk0Der
         4hkD6NHnGkpByaUWLlIzlgTggKJIGdA4bUFuHuSSq73VQQecsHhvPpJbhSUSYW6RQOhq
         AZbwj4YwI3/UbIGC3gRWMET2pogqK4hkzlqvs3O6TiupvSw92GWumd95Ocaz10n1Osvq
         3SjZtEsl2akKCtAkG5Oqnf33tt/Ix2LTlXy34NLzF12gyejNoBBlHGatpD1RnhE/Nqzf
         6VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795392; x=1745400192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XoImJa+fjliBajtT+2WRyNvLKOrfk0bxtRwFuQd95Yg=;
        b=tqGhNNhGZDpJ4Ge2+6YgnuiqZBKGXJaEplb20hMPJTknHtMIvmPS7RiVEGE1G9o1EN
         1zdutw5EJEjpEmxM0BnhZ2Wr85fv7Fih7H31gykAx4reibHRF4ZO+N5mTpPmFUe1p4/B
         pnEESJudffu6le87cWqC+Xou/or4GfBdZS7Az4q22sF9agvXfzhlOuKS2QZ/Izi3r072
         qH6d05enZRD5jKH2Xk/KyfzAnPhCjqE3PTHe4Ne9jQa8LyMU2/NDalEuVjLMX0XkcxCx
         nFv/P1N7ddOzMp6wdwcYA9aAew5n4KJFPA+nln0PmL70cjGe0XqDD8Bkc1f36BrDr+NG
         Lgug==
X-Gm-Message-State: AOJu0YwBjCO8+++oE+XA/ROeQRyAq9Nvl3Ga3R9y5m7Vafqe0VNUkHoU
	WSALDD2WuR7P90UknqMVOC8DOL+5RGnLSljmUKwOmkyFwgiu/8p9bQ7LlxfuAi6qkg==
X-Gm-Gg: ASbGncseMpLD7bwYKVvgetT11rHdz/DLUs1/34bif4J3xgob6noqyyUttM98jbtZvW9
	1zG+FT/sFY2DZGpJjCuBPEtOyOos0Wqown9z+Vx2W5KRaAqOgbkCPYeua2O0Bs8LMiqghAsD9jv
	YRPvEQ4v01rYWdZc9ij6AeAePtmOvSl2ClaH7yN5Ul3gSS9MLz3l2OrpkjmTsHhm8LmqlZ406jf
	132apvI1e7NinSu0Sqlf7hBCmil7u497CAT5gG/0nP/GAdNGrucULSrjO1IEsQLXYe6m4OKuhqO
	gr9HxBiyI8VQVScZC/dG+Fsb8OoAv86gpWxmOo9Ged53eD5m6NvkEy5QZXP/7G6BElgUK3mdwBq
	geWwAkhWpWrulRg==
X-Google-Smtp-Source: AGHT+IGa7RGQyM2l9Tq/ih49pAHM7+HApoQxnN2Cd45RmYTPDotEOrhSfrtvQ6JTX++TzJDKj63q1g==
X-Received: by 2002:a05:6000:2584:b0:39e:cbd2:986b with SMTP id ffacd0b85a97d-39ee5b10eddmr912645f8f.7.1744795392174;
        Wed, 16 Apr 2025 02:23:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm16736471f8f.17.2025.04.16.02.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:23:11 -0700 (PDT)
Message-ID: <91dc0def-2e17-40c0-a66a-c5992f10eb3e@linaro.org>
Date: Wed, 16 Apr 2025 11:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] gitlab: Enable CI for wasm build
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <16055d17cadcb5f4c23203218cb8fc3fa81d1754.1744787186.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <16055d17cadcb5f4c23203218cb8fc3fa81d1754.1744787186.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /sUOimRhataX

On 16/4/25 10:14, Kohei Tokunaga wrote:
> Add GitLab CI job that builds QEMU using emscripten. The build runs in the
> added Dockerfile that contains dependencies (glib, libffi, pixman, zlib)
> compiled by emscripten.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   .gitlab-ci.d/buildtest-template.yml           |  27 ++++
>   .gitlab-ci.d/buildtest.yml                    |   9 ++
>   .gitlab-ci.d/container-cross.yml              |   5 +
>   .../dockerfiles/emsdk-wasm32-cross.docker     | 145 ++++++++++++++++++
>   4 files changed, 186 insertions(+)
>   create mode 100644 tests/docker/dockerfiles/emsdk-wasm32-cross.docker

Probably nitpicking, I'd add the Dockerfile first, then the GitLab job
in another patch.
