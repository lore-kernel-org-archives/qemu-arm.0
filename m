Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp445291njc;
        Fri, 21 Mar 2025 09:38:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKifQb0c/4Jm1TsbD/irsy2Q+kK1KXOlxyxsjR7f3raow5V6fXCZ3k3TOMtj8Uu+68wf8fu0d9d8naQQ==@linaro.org
X-Received: by 2002:a05:6a00:ab0d:b0:736:a77d:5412 with SMTP id d2e1a72fcca58-73905999e48mr6122695b3a.12.1742575119843;
        Fri, 21 Mar 2025 09:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742575119; cv=none;
        d=google.com; s=arc-20240605;
        b=TlKMuGdYhcBrc/4lG5JoUdxOP+wicLshrcyxHnpEAc8MJ7kUH0MOez43UKWiswYGvz
         iqsiRBDL3GWGi/QwRbSAM2ssuNLG1LK0AggrFaPvFQpN/CKgKZDuuBJjY7Qh88krLSHr
         ChKUGZnH6P5/1Jr6jHJrPtifeVJyUWoh7PjFSfpSTfRus3ZiBfxEbVO21nNbVSUe/Xdo
         BCo0ab/r7ixageLOMRm1Z7u0cmbS0JeVBOPa7N0JicDi5dEvjIJIFJLY2jHMkAp1Wvp8
         dW1agU7tnSMYqzZfCUB83pB0qhTGPAT5YrNUAiAjXHClGAvHZ9jqOrm94QzymWfit8of
         R0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wd8JQPF6330iFbrfqEOHPqzvf3WyiSqrdPORWZKD/hg=;
        fh=joQuK34mWjtXCvtujYY0IwB5BVH5PcunJ2jOyqYzD4w=;
        b=De+1+UrgH/rqExTExrqmVdD1Qc5XJnKS9aHS8qdqt+MwOy3PvE7O+r6ngXFs/KkYd4
         jdmL9aMarCtIa0L1SZHsvBQcLcmXmQG5Hsk6I38O7ACZuGc5OFBvL4MrCM76BZBLTXAg
         HLCeIRV93qY7/IeShz4SDCMoeWfum5vKsfbUy985ps6fnH2VAFPAIykuM2yJ3xU7iltk
         DflpPbUvO+AHfj5Lh7HpH7ZLmtptgYR2Z7QjcrvuTmR6rNCkPNceWjiGj7T1Wlylw8Oz
         gQUykcxqJy2yEqRuC++mUp4j6gZ9Zve/2LZ/Fbhwyofj+wm3VMTLznNvS0YCkVrVN6dM
         flIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rVL+zXu8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2926ac0sor1932810a12.5.2025.03.21.09.38.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 09:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rVL+zXu8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575119; x=1743179919; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wd8JQPF6330iFbrfqEOHPqzvf3WyiSqrdPORWZKD/hg=;
        b=rVL+zXu8Mi6Rxu6I5ikgCnL8H5+WTEtLDGW3Onznk/2ZEPkEZiapqCmKfGLVKPy8m3
         S+dB3v/RCFZv3jLBCK4Y8UvBrQ/1byZMhriknC0H36e6WlZnKyCHjRTKalD8KtzCDd7Y
         zDJBapcJ5+ihnrZdtIUVz62BMj/z3yrDNf+XpSZDLwIHi1atTsNC8uqARc4KZ1mkVFFv
         YdP+ephB/kwT6UhVqaW6o3bOonEN+bfY4UdVXRlyZdh3Nw2VWq2MXwa8NC6Tczkl2K2w
         SfBO//LJSYXSeKJXNCdqxHUnZDNdWzQHKCujXh40FkxPPgWGPxE1QaLNxx4dk/MAauIM
         EDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575119; x=1743179919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wd8JQPF6330iFbrfqEOHPqzvf3WyiSqrdPORWZKD/hg=;
        b=kQe1BWVOG8OSgAFigb7+kVG+zonVYOsKAPBUa2+6wSeidUkrrlMTwN4aX/VBoWIsbA
         bUYdW60b7xm8mfJZG0xWjN8dRtjlcOGTlWEx3PNdHCn2JCauXz1q6jBdazIzgYrRxVND
         UyYLStDO+g8hSRj+RWh5BOIlGK+9YhYp+WHQQS3YSOctD9sQDCK5DYglVm+nqvFTu2Jx
         68N+h5zdfFdvrTFkdendFX93i08X7IfXJpwMPHoPYVSVKw4VNOukFVN77krCOI+IAFsn
         caTMSIz1XsciPgWF9xSrznkOMSsMdBa74pG2vqAmgWUCh5vUHeNIC50FVDB67vR5lxKI
         susg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+/MSup8bp+nXWwGGBMS/zCy6Qq64+t2pk1rV6C9LEWzH1xrlQDsSMNjutlFcDcEjURZa90sVpjh/aw==@linaro.org
X-Gm-Message-State: AOJu0YxsMZCLRoi+mRXGtUgpRlt/7oq2cEdC8WQMmpQX9Z0zPeOHv/uo
	2yWSvbtxDgC90FRpUIJHmeNV0fAZ4PvIhlh658fuyg+p0EoC9W+VKutosNBqFF8MMg==
X-Gm-Gg: ASbGncv3ZQPJFGlTgaALZnCH4mGS5LLyRQuKQ+xTH1ukyZzByX81NV9ACBHGd4YPVrI
	iHqwhpJ8+5U/T+h+0eP0dj0yAtBaBaVUD1/TG7PNI5WR2FoD1fZ18kMlD46ft4YuN49VnRoAe9Q
	oDjgKdqhF9iIWI/BkcnUSBX2fSad3C703oiTkMpXSz5op20Bd+CI3tD7E/P4iJG6SFt7I+7GDRJ
	9iuixwzCd6EXHgYaGN00hh3xeHR6b0UMunkUX2TpJKZZ2yS9PHhineplB+ZNyWnOxLB2U0GmskR
	+6K9CjqwLDbQCWkas/0f43p0NrfP0T+OYQ8NGHZ8GDggc0r8QKo+pKId5He0FYK6IObURyh3URO
	baXd3Fs+p
X-Google-Smtp-Source: AGHT+IHBrfgKc4BXXVrreTwTXf7JYTWMk7AmN3VgpTI8o/PnAwoC0SnVFSBL0TAxFoQV6CIXyEl68g==
X-Received: by 2002:a17:90b:3886:b0:2ee:74a1:fba2 with SMTP id 98e67ed59e1d1-3030fea9334mr5800623a91.20.1742575119381;
        Fri, 21 Mar 2025 09:38:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf635fc2sm6300112a91.46.2025.03.21.09.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:38:39 -0700 (PDT)
Message-ID: <8eb1b40e-3d24-4b2d-9cd2-d5928d488e08@linaro.org>
Date: Fri, 21 Mar 2025 09:38:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/30] exec/cpu-all: remove exec/cpu-defs include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-10-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: rTwnN9ePk1TG

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
