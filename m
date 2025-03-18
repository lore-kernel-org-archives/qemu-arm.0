Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3253197njb;
        Tue, 18 Mar 2025 15:40:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuXd3eGwQpsx5D+6KoaDq8RVUDYvarzukIkRmdlC4dmDI6gElP9Dm4V194j5L6rEZFXFyaYgr+OiqlJQ==@linaro.org
X-Received: by 2002:a17:902:ce0f:b0:224:584:6f05 with SMTP id d9443c01a7336-22649c89560mr6594285ad.41.1742337622290;
        Tue, 18 Mar 2025 15:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742337622; cv=none;
        d=google.com; s=arc-20240605;
        b=ZLGM6kByOdYRHtwJOO81e4LZCf9XrVxbsJH+Yb0yeYbJZwwWOdg4ljBwKGoBl4gF6D
         LjvJan/h/t+kUNS2SNCcxB0kdhh5aSM7BMjDvzc5QzMST4CMEQpr1SIzqdhagGc4vanV
         1fE5a60nhNMbRplH1WusJyUJZwPUZtjr8GYmvx8i1U7lUJj8FpoA/0TA4ehYEljcNEVA
         pFM99YMH6NgzanD5sgANds9g1iZBtbjUZMZuDrAvTANONgF0BTBcgPZdGFiPCNfp14tv
         7gILcJv7SaWReaU6JnORCSiDthuijAHhgG+BS1rIhepNU+3Caf8eYTDcdm8a6romewXs
         GoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=S2UPpQLFKR1qr5/RvZ9zNkJfGHI2MCRLeltsmk729qU=;
        fh=aww2Rf2c8XVGKif7OrYTA7NPZogG7OUG541ik6FD5tU=;
        b=lj7vx/pMYDHU4S+AWwozjkXe+jknidBfqNbEfDzuLmDDSbn74Hzyc+wCQbuO39njjH
         mTSODP+zzqx+ArkiSgZae7Keo6d61fOUJ8HdDMlpBDdMQlA4xJl7zgIc1mHoapkacEhY
         CxyEXuXGTb0gXkQ26ZZPxNFsgNsD/56BA6K7f3LiMDAKIF677N41fJDg3LbrlZVn4STi
         yloFDvNamTXPp31En8UjPqqSy9DWffsohpB0XbG2PHnb6m6BClUsu0njWSXL2uz9seK4
         4JCD0MeMA7eVhuZbwk+zUraDWuhztVUCxfsRe99IFJ8YVrLPloa0aj1vnXCfsAgzFLlO
         QRXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U6RUUwQ9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737116c1d7asor8699787b3a.8.2025.03.18.15.40.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U6RUUwQ9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742337622; x=1742942422; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2UPpQLFKR1qr5/RvZ9zNkJfGHI2MCRLeltsmk729qU=;
        b=U6RUUwQ9uCf27Rm90cBVdN1nAwSE8j2BodsHF9bsn1Gj4wXNSiClB4kVbQWrupJHqa
         7ctTo/T+OaDGauDXUHJf4DZYc4kv3IW2utls65BlwXw7i9SVb2ybVTXdjcx7ajYwhJ3j
         v7fSpE7maFTaYSD5xWuLwcYXXjzsgFBOpSqwVN7alRudSdJC2RkXgYgJVO2cqdob7pMG
         u2NaWG7WhnTL8WsSN5l3Xdi0aalNriXPtCW6l98gjsqCq6DYL7ZLOqrobCyYbWZ86nLg
         z9ak6JwcxzlBNiiTCwzOsQ0Py+s3P/vMEP7OTVzjV8sBOTHXI3nRES/AYeDraZ1Elu5V
         3wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742337622; x=1742942422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2UPpQLFKR1qr5/RvZ9zNkJfGHI2MCRLeltsmk729qU=;
        b=kZHKoaaQHKRt7zSw3NfJdgXQaqWDtlAWk1mJ+rw/u05UvZaJZdpAMjaoQRpQhwTRUO
         SH/D3lBMA7ZNUS7s1wh7h958L5pC+Jf/hXq7lLiBBCGdBKdagaf905YP6BHR4qSvhPBB
         xbqVKndsJdtOjPgii7vcxAulR3BGnuoEPx/3Sdd9Yycoedy6FKYKKKdHOwasbv2B71V9
         bsiWEu02CH1bZWRFYYy/1kAj8BG7Yg/0C1dW9aatd1XI0C/fdipCveyu2L+9WUUFWBU4
         eVg0tVW+BRoEtnAAFoZ/btteB5r0l8CSQA9PqVSz1MKZsOlawSWnDwR1MIS8E9YdQcTb
         Nesw==
X-Forwarded-Encrypted: i=1; AJvYcCUPk1mpVEPnzrB0TezP7jsFmCAFNqxIcTX5SD/xZjFAZ4epc/U2z4lxofmru9ykvmWnpX4xKgbAQWqhkQ==@linaro.org
X-Gm-Message-State: AOJu0YygsbaW2LbXwF7guQL2w6BXKCWhQ0kKENOeqEvwKd3CWTdxeiex
	DFPnOX4dCSr10xVJC89tLmulA9SRM+C0Iny1Q1d9aB2Czg4znAUmEYzfFNXG/+iIGg==
X-Gm-Gg: ASbGncuDaM5k/0fkLNJLsUvFzOLvuextovrZcp1BHlLk0wOIhNjVXbN6KVZUWNst5UX
	WG7+A/E9UaEcBCz6FEYMbpjUwcN5Fm0lrzZGwotjvjYFgjq+BNCj7NmV3e9/pmJ6aLFbAxoRcdP
	3zpy65xqgnwXmt66VcbYGIZzJp8gscQJQ3zuBw20QO1b9JyHA9PUfikgc/6x28ckmhyhyu08gzX
	tApDqmM7Qntm4GnT/LUc57ZUtIDuTcT8qEl6TAs0rysBScopwseqE4zPxWa+dSNUQMsR3IA02JL
	S6hb+UweyizMIOcNqvU6nUIXg5cOUikHaAFYwU8ydiwOn7WYVPMt/oh73y5MkfUQHpORB5/WUbl
	67DMdQnFJOSA2VEDpHiQ=
X-Google-Smtp-Source: AGHT+IHhbx4zrSFVC9Erry5Z56X+U/eo+aBTKB3hU0AYmsuCxAbdXsclAmXZcf+supeAECu7ukRqHQ==
X-Received: by 2002:a05:6a00:80c:b0:736:ff65:3fd0 with SMTP id d2e1a72fcca58-7376d6ead4dmr711477b3a.16.1742337621894;
        Tue, 18 Mar 2025 15:40:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711529531sm10202523b3a.2.2025.03.18.15.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:40:21 -0700 (PDT)
Message-ID: <9556c183-c103-403c-b400-0942d42785d7@linaro.org>
Date: Tue, 18 Mar 2025 15:40:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] target/arm/cpu: flags2 is always uint64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-9-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250318045125.759259-9-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: rhAge5erhi7E

On 3/17/25 21:51, Pierrick Bouvier wrote:
> Do not rely on target dependent type, but use a fixed type instead.
> Since the original type is unsigned, it should be safe to extend its
> size without any side effect.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h        | 2 +-
>   target/arm/tcg/hflags.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

We can also remove the comment lower down about cs_base being
based on target_ulong, since that was changed some time ago:

exec/translation-block.h:    uint64_t cs_base;



r~
