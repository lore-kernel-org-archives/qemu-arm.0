Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2581148njj;
        Mon, 5 May 2025 09:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzYIxNQbi4vJgpVtFc7MjV2jNn5CD7FEskM7AJ+PDcInSOL03w6/tXn7BwxdIn2rzd+cmae6l19/Ojnw==@linaro.org
X-Received: by 2002:a17:903:283:b0:216:6901:d588 with SMTP id d9443c01a7336-22e328fd380mr2168905ad.15.1746464351911;
        Mon, 05 May 2025 09:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746464351; cv=none;
        d=google.com; s=arc-20240605;
        b=MT5tw18ZlPE4S+LbzqEtdz9B8f1ck8a7c50S6NX6G7TzOq41vDQ4A9THTE218KQWo3
         TZnSvYngyoQruVKN/Iqsr96xbjA6qqvXohkKuKhnhAUlGnH2b1+B/R8xJ67zqFFW8OtP
         ddUEPhYkDK1E7lzwNE/y2o6PsN/31J0s9qAyndCLY9e0FEvIa4SNUebEtMiGLVpVJNqc
         kYNaMGvXBs3gx0pydu9MmiUU21D3mFCPWgKNncFEA8/hSGx4CiS/9TG+ls7sBv7KQn22
         D9/9/UJy9LCNCw3Xwth5J7yHJFJpZlFLETlIieBYlNscWHWmGccV7GsavlGZKqrugS2b
         A55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=U9OTFqGp8mCWvlRmY2T5kbkW+mv+S6TaxK3o9YJyPUs=;
        fh=OmEeoUiTO4q6ggoSsJhp7EYU8AHduYAVXZDI42oxKoo=;
        b=Y6nLn/I2MkXQS/OgxjKiqAMO0k3HgMuqZZfAqPvAJ8JGRnZneof7t2Dnc6c4/xoRfL
         ftvmE/ywqQtBivoURqXIxvSguGRl7ycbmwq6gZyTt5yuD7VWkYgg1HHQ2u8fpCTIOdIA
         wgI7ZFmnC6OVSzRC/HerLU60W0wDCwjc1WFLS4CUtQvP3eQ+n9e+HxKzJNc9ej53R74V
         xTCEPL6jpy78xiI5lH6jm8XfeVBG/q3EXjMp9xIHqPoS/xHhNN5xkkOgBWy8MMWePnNh
         QzbalKFMaflzRdJunm4zsRf3C5rS0Bzrc1m4y5DqhNqB7yNMcOh3b4fXf7Y5CjwsOKqB
         pLAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z3PPGKUn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a475e1f21sor5408397a91.4.2025.05.05.09.59.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 09:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z3PPGKUn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746464351; x=1747069151; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9OTFqGp8mCWvlRmY2T5kbkW+mv+S6TaxK3o9YJyPUs=;
        b=z3PPGKUn73qn2X92P7JR5Von5KQZABck0t99YIeqSEX4vlRaNsC3PkMcL7J09zeeGH
         XBonE54I+aY8uReKCKJ7ckjRREMWEy6fi6G+7aHFtT3Nm66pAeVrHuFS7VT3/E/5cbQZ
         A39um/8xVkWuclYcVTh5+4ioCWwnnyjbIO7irwtMvKcRcjVPLPXmekQIz27R0xhC79WV
         RlfWvkU/83xyZLvttVPXbaMfqER3o3FE78M1j+jS9UlYroqOxTPNmGQO36jijUZmt48L
         /mvHqPUsCnk+YMzLOITHQPc8i/0jzPLakHobNgybGCILGG5+i/DSYylNVSNVU+0EImpe
         /gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746464351; x=1747069151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9OTFqGp8mCWvlRmY2T5kbkW+mv+S6TaxK3o9YJyPUs=;
        b=e6T3GDES6E37gDbng2SF6M7+nAVlJ6sDBXNoHErAUj+eVOeIhi4bD6zI6Bt401/Lzy
         sn+I0FU/oBgMQyTpYqq6D5i0FJuoHJ8MJtACPGj0J/gLpHiDzmBj4IRO4BWN6r7tiUhL
         3O4Ou6BiADGPzbPJcRsKMPTiHORZHk3wrs51ESNcgbQJ/Jp8shD5bEJM7NMGcYeqRsJM
         QHvtR8Is6Q6e4LE0eC8NZoK2qbjdiA4kMExCqMnCYjiuwQixgMu+kg4Rf2VxQ3ptjpYW
         pb/1BDrQOjdfbT/+3irBvyjW12PeSVqesPTCnC09zBmDYymaC6Tz6mJCoRxhZdSPEtQ/
         nSxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLgqelMNicC0M0FNrOLJk8wVnzT9Yo5tXFgBngHSemh9pB/tYBeVW/ms9we80cdnZYa0NgFqkzkukb3w==@linaro.org
X-Gm-Message-State: AOJu0YxVei7wSOLdM88zgmCwc+3YyZi9ng/snOTYwEGPrk/3WzSFudoj
	GaLUXatqfSPD1jDBGiwBjRoiQt7XTThesFv5OMdX7sTBKS4J9ipgHB60W9ZBj53KUw==
X-Gm-Gg: ASbGncvG1d2d9ZF5Jp2yWoJnlG8gVjVn6VB3ugN9i8a2U13wDuS8HleXDBIh4DwOyZG
	GvzlLBzEMekcmInBWdINlLsWn8JHZnC/8kcslHjHvjY1BVikLq0+Dr2+8E/x4ZiFjTeoLvKShLN
	KCS+ng9eIgS4UWS4zw4NtB4hUnDRw4/R8Az7natYKjT5wThknADb1yUh+3lxtqENcrtrtd/3D+L
	SAG+q0+Hly3jZCNglXYpgGbeB4LL9LB6yy2RegY/kzDXaRfbxAxWIFwkrZoLXypMVWlkWiewwyN
	iwXll/tii0bj8Pks1rGaVIio7yic9fwZXCRu01MWKDb9VBXfB+PslfFBeMpSdES4PK2qTAbp2Gm
	u4QoudrA=
X-Google-Smtp-Source: AGHT+IGV4mvjBxjuUac2hqTkiakJrNcMLiL/yCT2vwZCoMaGvyR+N0l58cjWbCbjip6vwNGvfemS6A==
X-Received: by 2002:a17:90b:520a:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-30a7c0cb75bmr202365a91.24.1746464351450;
        Mon, 05 May 2025 09:59:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34748935sm11971734a91.13.2025.05.05.09.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 09:59:11 -0700 (PDT)
Message-ID: <857f0b9f-e58b-48a1-87af-49c3c52b379a@linaro.org>
Date: Mon, 5 May 2025 09:59:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/48] meson: apply target config for picking files
 from libsystem and libuser
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-5-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /yfwxGe23ws6

On 5/4/25 18:51, Pierrick Bouvier wrote:
> semihosting code needs to be included only if CONFIG_SEMIHOSTING is set.
> However, this is a target configuration, so we need to apply it to the
> libsystem libuser source sets.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   meson.build | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I'm not quite sure how this is supposed to work.  It appears this compiles everything in 
libsystem_ss, and then later selects whether the individual objects should be included in 
the link.  This is fine for internal CONFIG like SEMIHOSTING, but won't be fine for a 
CONFIG that implies external dependencies like VNC.

I guess we can think about externals later, if it becomes an issue.


r~
