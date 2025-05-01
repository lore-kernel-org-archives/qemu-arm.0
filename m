Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp262948njj;
        Thu, 1 May 2025 08:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIecv9rjQzzmt5nUr7AVPX+MdgEcUYPKK0ZedqhSUzNUHhRVR/65VyBKXo7mEXzPrK5s66rM8wc25j2Q==@linaro.org
X-Received: by 2002:a05:6a21:b8a:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-20ba8789707mr6506787637.32.1746111780430;
        Thu, 01 May 2025 08:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746111780; cv=none;
        d=google.com; s=arc-20240605;
        b=SodShX48uMJKl2jHDq4ugyt54fug1JUn9QaqZqBSt93lJ8uYEuhGK/DXvUx4bfNE0M
         L80jgycifAPhtM4WhnMjKuIS3Bh0uXtztHrVwuyxDdjB6xivXOsFJ/FwWTbzzBE49UDq
         kTSXup6m0gVUdytWQKIn9JLBfE8/kwXLHZDN2FHDF60lBhZsJfQi8zDWiOWn/XeHPXL0
         mHkfgoHKqjXYJ80MLlB//hNrD4vOxz2LCeanjCPr5NcMotuwFAjpQsWV04psyuClwDG4
         QsjK17sM8xLvYjVM7+zxS2tnawbAyT5O5rZtrcmXurfQ6efDWWbJW5lODlAJ+15rkPDU
         t89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wkq/VdLFYJfyJvgcdgfMRsRb6Gxm8UUMs/yuzG02xU4=;
        fh=y70W4KxqAoLIJSAjEg55mOZyDsmNdqkgZra6bUofRNs=;
        b=i0KcskOu5/vimtAPYMrBXc6xPnDOee5eHuJXzLfXpa5b8WclVEMh1aDCQFxXV6zFtO
         2zlLTe7rNeXAsN7OXO546yKjZpFLVfE/7Gxt+vtfIrWndvjks3ixro8LOtI0rzc0cmbl
         f9J9wuT1wk+/Nzft4ouEsKeDh1dTi5j3cNOneEhLrBVgvVtWHuv3Ab5GqbyUO84s2OmZ
         B9Heugof+/R42N+8c0CF4N1IjpJKUeO11b4E1G2r3Po+MZ0SjOJIK49YCuPdaHDho1Dm
         ynJFbT+LnALE4z/wB3VOrXd4D+RuFFLCNhK1AE8lATlCkSvoVoDqihkY3oMCLlm/fM4F
         M6JA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrMgdVT5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef17ccdsor599546b3a.4.2025.05.01.08.03.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:03:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrMgdVT5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111780; x=1746716580; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkq/VdLFYJfyJvgcdgfMRsRb6Gxm8UUMs/yuzG02xU4=;
        b=FrMgdVT5hemZffXkpmvnpDXc+xxvlwCvTCgQR1drj1PyCH0SSPIdS75btFWWKLMjQC
         tguBUsNsrvgjVcedPqdjLy/vqYlrixJQLHyAcKhiJO1/w1/PAnvcvjrJqZJ9lOkqyFKp
         xjIexNVvTprqEXgUbqxAGSDOBbTPAw8D96XdIxQFoUi8Cjl0bFNwc3NAsCo+MIBS/R+d
         AptJYmJjR673cr6gyWkMB315xoKEYVsBz8A+/skpwo+SQklY1SbmJpPM0HyCRr0s6Ntq
         6RmbceZ92rrDgYgcf/Tlj3UY9t3FO+lYaW3Shyj/RgzhHAClV2zk6CGjljEW7cnfPYry
         U5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111780; x=1746716580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkq/VdLFYJfyJvgcdgfMRsRb6Gxm8UUMs/yuzG02xU4=;
        b=rwcS6Pb4Lzguf+4dKYW4eSL36wLWZ/dgqUJgGAJnnjBoNwD8PStJvITYvMTO/Jypec
         dlASQYsSZQ6cSd/hl1+/sfnVjWaF+LTVa6GkBu0sTVzv24xUBt/ldFEyJawby7f/Z38X
         A8hRv83CQ/FQSSoPNO1qsPK5HDQGQuOEoAJYvPPV03TpR/H5J3gxhNkeF/31rW0j+r3n
         VS5FdNv6gHF7CX9WHmFxYMotvHy4evEeT9WcOM9doADdWKYDkpEgPIimxGpdOhd2jhVi
         DOnVbyHWJEQevQQZTlawwO3zXrolS6SFRpeIDchP5+A5oL4mZDp/lFX00/dP7nBjKSva
         vDlA==
X-Forwarded-Encrypted: i=1; AJvYcCUkXmE9D1WBeuFGLDDyTbXY6LApznQ5r6dtmZKej7hjbxfyrPKnvp6lFEt8v5wiK9R+X86Ne6Ky0gnS7A==@linaro.org
X-Gm-Message-State: AOJu0Yy6x2jhEFvzSeLxFWKawoDwl/Av+wHgfPT6lQDSAT7Fk1LlIhJw
	+ENCLb+F4PhbN9ddg8c6/mQNPqTS9dQ3auWPK1n8Yl849o7WbNNND/6s9sN17JhOCA==
X-Gm-Gg: ASbGncs+IDD09SXPUS5RoAoV8oMleOv0TZX4Sv3Ejj4pQlR/c3ye8BFCTVtqp4nTIpC
	AX7iq76+weD5GsKpRsBcxObbrMsk/EqLrR+Gv47MdHjx0xo1kRONMCFU5SoIEV7fEtrtfXaeEjY
	wWZN0939dPJuv1um294/RqupxV+yHdY37HyWpIBAMnsWt/ijuBbOhTKKnJv4Lj+yDM3+8gGpzOI
	MiIf8BZyVXc1R3XbX+70w5KpMOQojEXB5B9UevIC3YW4JT/rLDqPHMByO1D0GUiwBP2GDi4boVL
	B+/skWy4S3xFthsgTwwDY6IiIiKWABQ3H6okC1wMrBh8xEg8R/JO7Piqn2XQyfg9W+mCmY+YXXa
	hgMi0Wgc=
X-Google-Smtp-Source: AGHT+IFpQDWzZkr7SDEpQqkD/ISUrJM6vDV/PLa2LIk+1brnq5oSIluMSLUP33z0eD1oTrBqKei8Ew==
X-Received: by 2002:a05:6a00:1311:b0:740:3830:4119 with SMTP id d2e1a72fcca58-7404790521fmr4868652b3a.18.1746111779927;
        Thu, 01 May 2025 08:02:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404eeb1935sm938020b3a.18.2025.05.01.08.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:02:59 -0700 (PDT)
Message-ID: <8fdaed14-d2a1-4939-9b9b-5cf388e20ea8@linaro.org>
Date: Thu, 1 May 2025 08:02:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/33] target/arm/helper: use i64 for
 exception_pc_alignment
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-14-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-14-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: QJVOwJDSj89v

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.h            | 2 +-
>   target/arm/tcg/tlb_helper.c    | 2 +-
>   target/arm/tcg/translate-a64.c | 2 +-
>   target/arm/tcg/translate.c     | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
