Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp404932njb;
        Tue, 13 May 2025 03:03:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU6rAzYE8iChPLZ07pI8PsFodHSiPM2ZF7TTpRb1jm9lnRWB4srU1mspgFxtld4JleIA+MWOZyi4tdWA==@linaro.org
X-Received: by 2002:a05:6000:2088:b0:390:d6b0:b89 with SMTP id ffacd0b85a97d-3a1f64ab604mr12650289f8f.50.1747130612615;
        Tue, 13 May 2025 03:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130612; cv=none;
        d=google.com; s=arc-20240605;
        b=KbHA82DnnJhpc1K0Jzq5GxnhEZmLgyVPTF6xwN/WIEylzZPDOqlFq1XwALOFzcJC5k
         P9evMl6nre8cvG7VRaEbNLXmKaX/EeCcKusPM3BNgp/NMK1tyrdt0mTuaGoZ9sI9o8NB
         W76PEJ1Z7GdEqOl6FKcLTIv0zT7wOnJKiI7/dDUzG564ayslPKm5tYnCv1iDt6NsUDvE
         pK4WrTGNcYIUC8vz/XPhRLZgwjOc6x5M461FCfuy+Os+4tXB/QER1a28l9KXjOYDH+p0
         Cs5UazfPXpVL5VWZtpnwmA1tja8rLiZlkCgl+w6i5GJ33dWAI4jNdJXX4ful4Emsfst8
         Sfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L/LxQMLiirTAwzHHf55PiXQBKZGHg6X4mycHe1m+VHw=;
        fh=XL5O6kmqfX/43Owcec2MDa/WvzOwdJOuOfCF4KcXvaw=;
        b=NGun2HWpjWiZ9aOtiATZ3lBYF3KqA8h6h/b5yD+5LZRimH6+ptUsD6pki7WIeYhwfj
         1FaMwS3ydB4vEe9Ch9pJ1G4WwCgsfSnf/pj8SC0fYgNPzWIFDYYRy1SbvQdKt1h05K3R
         ZSkneVLsI0dLgqypGRz2h2v1WkjsrmADTw7Bjotxq4ZuJmJu2IUJ6mqyHg29twZcvpMA
         BMuLStliuOlJF63hgBhW9L1QiCui8Z9Nr5W8hVCrErCcH0c27PTv0er8gfTSTr3eZiRK
         ibQo3gg4Jih2cjgRB3UCKcq9vUHbJPqFiqQcCCgCZFhUOSZ4Ud/0hnwoZ8syH6/j+V8K
         /1KQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZ+glafZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f5aa59e0sor3754251f8f.8.2025.05.13.03.03.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZ+glafZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130612; x=1747735412; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/LxQMLiirTAwzHHf55PiXQBKZGHg6X4mycHe1m+VHw=;
        b=eZ+glafZbdCObmTOULM86ssTl+mYdP642RfsncJYQdNbvBZTTum805+dHbfBaxhSc2
         OGXy2CPNJWpAdlzlYqSmoHH7DZsr5woKVo/SPVFrv2eC+mm18YBpwn2zG7fml7ei8xss
         wFjsK8AX5LriGFVJFin7VM7rQ8rhum6o37Royc8gtGH2PzPgHbJ/bP6Ov2hB42/N7kQd
         99S5/8o6NfKxHw9GPRdRPNnCneMPKKquMTyaplJvygidqt8Z6acaL6nAkUZvWoUwHKEp
         P3Weps9twKvDKd6yRbY+QPOkNE/poCklKtXL/WGa4JFXG+3ZaCWkbgmrMCzPJqfmFKsd
         tKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130612; x=1747735412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/LxQMLiirTAwzHHf55PiXQBKZGHg6X4mycHe1m+VHw=;
        b=dJl4hKLXPsI1lJo7yQ4SPdIhh72EbkHwW92m3PPooGe7vYGlywqDz9GsctEI63TPrA
         2lBx1sv7LRDoxv1g3RkghjiL7u44dqE6/qbH3Gas7jir99KfTKDxqLf0aMoz43YYGNqy
         4qIaTTmTdEg4CyRD+E1zSwC4hTvrnMF4JDwZeTeYSAo2icySeNB49iRYVv8k1Tk3gkGn
         esgd0ILK6HHcp1F5+VBtG6opzER5NUebuUGvI4O/Vuyugb2ikGO93IRLoq/oZ53XsTWO
         TcWMdAMDQDcHbPrC7RBkH+86BitNlsmn4wcNyVk4e9/andUkFtaHOdCO+n1WUOMSyGZZ
         zk7g==
X-Forwarded-Encrypted: i=1; AJvYcCWRJ/dRNuIxomjppWm0QtQUtROYdMgcSK8JbAnFpWrwKtqL9nPGo8I0zjXaCjQEiRUZAuIVe/LtQLeqPw==@linaro.org
X-Gm-Message-State: AOJu0Yyy4uyGWs0oFouubDoHJeZy9q+0X8YfU395s8LwQZayCER69Wbo
	l3WdKpbZtZFMydVh+klqwI6jYvh5RoIxjGw8xkbOZIJ8LJZ3mykML0V/0GzwH/6VUg==
X-Gm-Gg: ASbGncsjwxVky176mhxvs/dZMbg5UXJLnAOKKvOTQBAW9qRWO3RAQWRAgkXkV+/cF0X
	gdprYoHpwsNPWvNy4CGtGyTjRLo4LVRswjyhchdU2I3soWMSbLYSgcKndihgHTOAZLhPxovqotS
	qdOyco0s4tRIBj9kkyoGYAWuq82W15PTXiHVH0paGdkYPbEFbxLmRE2qhu3flBwKBkqjK42gttC
	zXvVF02w0VTpoS98XjIQ0DtLrny84+OFpKTYw4aZ9Bs/x6SIBtjicEeCfWkmxEtpvQ9AUYvbKf0
	XcDMQg2hjz3yGvIGZVfrL4l8DVqBIN2i4Zonak4k6lCeYlm5k0Gg0SEtSk4e6paVsyoG06L3MyE
	qoDvOPOBIwwDLW+THvZjf2bkuNkRc
X-Google-Smtp-Source: AGHT+IHeMZpbCe6AjNqaTchvt3/JWTGthyYrXrKkltYuFRy8/cgx7qSRFjSrBA5eKOd4J++UmxSKMQ==
X-Received: by 2002:a05:6000:430d:b0:3a0:ac96:bd41 with SMTP id ffacd0b85a97d-3a1f643c6a4mr13835068f8f.27.1747130612050;
        Tue, 13 May 2025 03:03:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4d0dbsm15336725f8f.88.2025.05.13.03.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:03:31 -0700 (PDT)
Message-ID: <f18e1932-12e7-4a31-ae82-f6c4c11a0d9e@linaro.org>
Date: Tue, 13 May 2025 11:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/48] tcg: add vaddr type for helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-13-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Lct8S2NkXU8W

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Defined as an alias of i32/i64 depending on host pointer size.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/tcg/tcg-op-common.h    |  1 +
>   include/tcg/tcg.h              | 14 ++++++++++++++
>   include/exec/helper-head.h.inc | 11 +++++++++++
>   tcg/tcg.c                      |  5 +++++
>   4 files changed, 31 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
