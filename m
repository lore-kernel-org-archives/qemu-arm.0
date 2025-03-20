Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp744258njc;
        Wed, 19 Mar 2025 23:55:41 -0700 (PDT)
X-Received: by 2002:a5d:598f:0:b0:390:fb37:1ca with SMTP id ffacd0b85a97d-39973b04a9amr6335857f8f.53.1742453741211;
        Wed, 19 Mar 2025 23:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742453741; cv=none;
        d=google.com; s=arc-20240605;
        b=hnjPqrqAso/r4Gxu66oj7Dx2tvw5+1JV4DGwTKR9mR4UlysuaKpkb6Xl6hiQ+iPLc6
         CmLRCfCC4rsmRddNCKDCmTxEY2t/IjM8KDT0eytkFQAE5upmxpxKhjHfsuj3EEEgFl4u
         y2+E7mOY3YGDFMkGt4knj8d8D48py0p8emUnlTQlECIYPxiqzh4YNJQGhKs41qRNmjnS
         KQkT5/rZ4/xq2d7AVYcuxxwcJ2T25tCkM+0T87YsFGrbCKh4jjbpqMKTY0w/UpFsMfWi
         8yMIgxT9kH2ueIvY6ny0456hSWgFnldd/4fah9zY8Yzj0sj6O7XJzM8PsBZYvWmTwFl3
         qdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=daPdedih6TBtuRJGD6J/YbjyQOU5bA7H/LL1UCXxGFk=;
        fh=VTjyscoH3jg4EEBGXGBCijT0Cth03TkL5RpTsM1FyIc=;
        b=HoHi7ZVKYdepSzgsF+tgn7AB9p++62FKsuiZ734TQiKeWH3sCxBZTV2fcUS4ivLTVU
         WdqWQvuWzVpqX03PzJ26q22HQO2yooArdf5K51JgjeWeCFRFRLDcbgETAcraP6zW0vfs
         mXF2h7zaZdAXz0uIuHFXeW7SnXDkVX7yysXGnzzApOYzQCOEisrXdTuiOXdWdHfb4g8P
         AJPZRTi5LUctsUyqzKn80+EScFuAdZCpsxuQdrh8Oy6QIQn1K7UVibJS0C19rDYBCWSx
         qPNN9rY+KJ2vQKiJYvcWKzg+jK/hzjtETdrQmHe4/XjsnH4bb3wxeeKeQqUT/ad7/JOD
         BZUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqSQ0vop;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3997aa41af5sor161776f8f.6.2025.03.19.23.55.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 23:55:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqSQ0vop;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742453740; x=1743058540; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=daPdedih6TBtuRJGD6J/YbjyQOU5bA7H/LL1UCXxGFk=;
        b=FqSQ0vopZemykbvQ6JorY9HnAGrV0omxdaL3lf77qxK4M2tcumrT028BtI3fRFM59V
         iPvph/7YU33NpgZSj7eUBdHU2ksSAKlHB/btWcgyIqAsdGRJAB4tbq2Z6tbLm0WNSjgB
         /SzXdg4i2xxyJ2mi3Eqm8DC23gXVWkSZlwH9OX7uzBdgA2DvkBT9tDdFIV6zkmUavXXU
         xWdyoEVQKo+TKb0UESKi0aySgfUOUNfk5ayvW9OIfvMhkEQC9lvTSyBJ6ESsLgj1FWXc
         XXo6e4bobbLQwx4Zr2nxPxRYNnAGMM2iVEpCcyPtw00bypkAKvb0s/N5/dKbAck+pNqt
         49ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742453740; x=1743058540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=daPdedih6TBtuRJGD6J/YbjyQOU5bA7H/LL1UCXxGFk=;
        b=JqluqGQlHw1JDlaftz7fq3JaHdy1bxFA+EOK1iQLaPpuHc9+UjrobZjnkZIxgGVEZb
         ldPeSLUlV70snlCPLnBig1d8xW5zCnF1bbacmpUIJl/4nrn2gtWXqAS7vtciHhY9/UxH
         HtebHrzJXqpyvjo8sgGYudxONKYBI2wIHWJsXcyg3WvTSapTPZHTlE5NANrYjBc8zJoB
         6TjOvl+oacXPATqfMjcbe+KdmtImIOawAtIJ8GvIwT1iCg0s0Gc+M1KAdhxBEGt8pnQJ
         kr78Yi5h3+pvibQmJLRF9+ij8jKwiZorOuCSz09S70gGEO91XMwLfsibexEbF5OtHaEi
         fWng==
X-Gm-Message-State: AOJu0YyQVOlFWvJTSE0w8whllRNT7Q998K4NlKXiWk2ceDWDi0z2uNrY
	OzrIdKm/eBYemVDsuW6+pC7Y6FS+y+1fnJN6ckmdvcmpdommOnNDoafrpdz/hY1rTcZttRbC7o1
	6Oz8=
X-Gm-Gg: ASbGncsZe8cpED7yJWfRla7wvSryNAN5uNSmbG7CMV4rjNKGleAUbarZm955/DV+XSS
	hDt7GN11kd3qnbKQrra3OT7G7ft1rF15F5mKvNvAHq2xIaXJWOE2m+sc68SfpRdpLAIH8PIy2XU
	V+46M5eviAReXxqzxTK1GVKWfoCrgKDrxz3DijJzW5W6PZvmC7CLLPYnhjx8PWYWD1ly4bCpNVe
	P2k6LyA5VJRSMMDTpywXUYwAyXliP9LdMLI7o45YZQbFCwqoplTpQOawz+r5ZuOfwyRAykiIABM
	CED+fgPcAL+nll5W5f3Yr2requXvq0Na1HytQi7pn6louV1ylVK4g6QrUpeV0alqrA5wEkHZntn
	ddLIBs+76p/Qf
X-Google-Smtp-Source: AGHT+IFSg0Ekfq8E1br+jOiFHSZpUF+Q+mclaFtVZfSQAnDpgTjuNK1Z1h1nWiZtmlU+/VLAxO9iJQ==
X-Received: by 2002:adf:a41a:0:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-399739c96acmr3525089f8f.29.1742453740327;
        Wed, 19 Mar 2025 23:55:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3978ef9a23bsm18697793f8f.15.2025.03.19.23.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 23:55:39 -0700 (PDT)
Message-ID: <575d70d4-a9e4-438e-97c3-1ff40d6ca5a3@linaro.org>
Date: Thu, 20 Mar 2025 07:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] target/ppc: make ppc_maybe_bswap_register static
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-7-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250319182255.3096731-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +vGQ+Ohq4v5k

On 19/3/25 19:22, Alex Bennée wrote:
> It's not used outside of the gdbstub code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/ppc/cpu.h     | 1 -
>   target/ppc/gdbstub.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
