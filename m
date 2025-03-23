Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1561113njc;
        Sun, 23 Mar 2025 12:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQwJ9AYb4OpeXXDcZFQUzINhRQv9OHrhW9mnDPdfSfkK9DWk+cM8tA94IKjs65Mr2Bdr2Y/moqPhMUyA==@linaro.org
X-Received: by 2002:a05:6a21:6b04:b0:1fd:f8dc:833e with SMTP id adf61e73a8af0-1fe4300f7e7mr19893653637.30.1742758902904;
        Sun, 23 Mar 2025 12:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742758902; cv=none;
        d=google.com; s=arc-20240605;
        b=KhvLR2qucmIRksHYvK7et5zf2h5rx7/0skZ2plzafeld0aIydEapCrDFK8MT5GiqQu
         GT2+ZdV3rxYHDyF6zGrov0Y/XSssnoNGR7akqI5YXunh+aNzjioGFbKzywXDM/XStS3I
         u/KBFnyle2lssXH5gYPGsAbWLK66oZYmEyfy5CdHahsEWVNpdeFNTCmnCsDMSq+e1YJs
         uMsky4ZJeyoda0sxLvJn1JgMBzogNgbXoNr8xFMsegpAizWGM3RltTJl7EVD0rxDPZeb
         nwXuPurYza0NS2v7jyBdS9MjK54UpBmuZlXK94/BONQa1Md8kPAK1LsMrJPyeSF8cnvI
         wmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xpN0WCyhT2dzm8EtIPPU3W+5pesccd3U8/8x7J8QQvM=;
        fh=hbIvewzXXlEqWyre3INgoCDIzfkSGUSKAXOxvg7m6/Q=;
        b=hPD+Pw6RORjZ1JEy12wf+SvS0pDoNCkrQvB/O7X60Xo5qwYJEU74PApuCWRrHSPkDF
         BsxTe6reMZN1R9BdGMac7h3I42XA/JsIc/dbMXBHTDe2EMYVOmTa0Wo4r5250WusNU6O
         B5hQHCuW30hLUeHPLQCHa1OhgrBhFVLtrI+CEZ2iopDPIMKQiMKL7XWE93sikaiNIh8Q
         mSlrYymZUU3RbaKOJMb36PboTdmOrATjJjqA/SXWn3QSNkDbjjmXokJPb4Id+2gq4O+C
         slH5IXPWzdukihFXnQUboq/4k2dTorwkffDt7I595Q7i5407rnZbn4pUd42FdIjK6P8f
         MlbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkdgY7tW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7390601f07fsor2851742b3a.8.2025.03.23.12.41.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkdgY7tW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742758902; x=1743363702; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpN0WCyhT2dzm8EtIPPU3W+5pesccd3U8/8x7J8QQvM=;
        b=NkdgY7tWW/C28QjBymrCfxJfYAa8uFYcSTSMCCjRCoGe001JYiiZ88FrtFK5J7EoGP
         vtcgMamZOIXnRb/VRjOPFUIfWJOvJQDfPCITIIWPxsMxVtj6sKwsCmPZbH1PnTR319I7
         Itu5sLWOqmeRXFX91YOIMMnHYua+mx67xqbWTOrFB0TmDIRODfS2g9KOJnku4oN0O8Dc
         U9m7U+zKOeshBUacrp2jjgiNc2uPciCF3XDLb7Veh9Jb/xLoERUy3MPO99id9XV26HpW
         mUMTkihBjNpFqqW1UwcxgJEqOvyC6vCABocehXbHUe15AtQrCajcYwfvkqsuQxsdauWU
         ncmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742758902; x=1743363702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpN0WCyhT2dzm8EtIPPU3W+5pesccd3U8/8x7J8QQvM=;
        b=Mi20L1WofX2K/FjqLBIFmBAtOuccZ5xf3SsG7Sc67QiOHMTLsMzlWRpUtt00gxumdL
         Mw5teC6nGQWL5MnuLMwAcLUBSah03FprzIEaPuR+uH1GKMWPRN43Dk+tUWMBk34kKLQZ
         x9GufeUi99eFjzeVRv0ITom5F85Bmci4y1z41LmdT9iGyb6n3RvulLzwwYvwjjbmsBtA
         wQzehhGPA8E4vgOpZX8+ybnlaF8aaxJdAft0n/aNpja+x7jsTcyE3akg98t6+sPgU+k4
         n4HvY41yPy1gThGrfwgBtWI1YPfViKlkt4fAT7+Zo68qYdEXBBXRJxPTZpyY+xjCO1NK
         7Blg==
X-Forwarded-Encrypted: i=1; AJvYcCUXtrfjPm2g1cOolFRH00DaSDwLsoPNqzuJgEC0/BpHbObI6M90+997nMrXEOmKjx3L27YNfqY/SaMSAw==@linaro.org
X-Gm-Message-State: AOJu0YzZrHew3ADjYTmZnEQF6In5uJfGYYtfvYXzudT2vl69bepPjBWN
	PRmPb69hYg3aR+NdwL/T9zKCTygpl+nSg5TmBOmICo4rouxTBQ2ehQG97phAZ38c4Q==
X-Gm-Gg: ASbGncs7hRICzyhUr5ceImgTur4wT+3ncTWYUej4vkctwdP4NySa74siar/Lyj2e2C7
	qW1DK8rZP9A8oAYzEdYzC4hjK8VLOOjGncjyBUAvkGAtD6upxyRy1HYHDyf3DnpdRKhAaPReuQl
	QQbWFyH9KXfFcDx93GEY3Ogpd4BOubwKjFOOMHyObSP2z2Vs7mJfPOpaqd+xNfJ5eCXDcYnqFAL
	cg2tpKv6BomDG8EzAHwGUNbCRRRXUAUBSdlc4q9R6AI+MGJKvzPkoQSOOp7zQcwIcg/lK0Wzv05
	UHGnoVLI69VuqjYiYXGg0RPxRIaPCG4WIy/ywd7WUC4DB+fq3z8jbES+LlZpw8uvBAy74sLps/X
	t6S1EcFB38//lv96RqpU=
X-Google-Smtp-Source: AGHT+IFY6xZFysTRRyg3Adf8BTt4qkGs3hqtaQVJR7D6e7OzhF14bhxSgWzf3Sve0/kB4k/0W3qKAQ==
X-Received: by 2002:a05:6a20:1582:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-1fe43312759mr17078782637.36.1742758902333;
        Sun, 23 Mar 2025 12:41:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a25dfcsm5561281a12.58.2025.03.23.12.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:41:41 -0700 (PDT)
Message-ID: <23626b2e-fd77-4def-b73c-27da0fba7eaa@linaro.org>
Date: Sun, 23 Mar 2025 12:41:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/30] target/arm/cpu: remove inline stubs for aarch32
 emulation
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-24-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-24-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: SZ2i4Q+sZjz3

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Directly condition associated calls in target/arm/helper.c for now.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h    | 8 --------
>   target/arm/helper.c | 6 ++++++
>   2 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
