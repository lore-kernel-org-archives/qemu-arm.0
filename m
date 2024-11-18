Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp2054722dll;
        Mon, 18 Nov 2024 10:12:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAbP6A3x81ESGr0ZLSJcktSbSUHpzl+A9g24qzFTZ7wrBYwYehmlxabSLvOf+hxPb7EcTR3Sd5ricoKA==@linaro.org
X-Received: by 2002:a17:902:d482:b0:20c:7eaf:8945 with SMTP id d9443c01a7336-211d0d8fff5mr183687985ad.28.1731953528075;
        Mon, 18 Nov 2024 10:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731953528; cv=none;
        d=google.com; s=arc-20240605;
        b=MO8bisIj5Jk8oaNbxK9U44aN24CbHaVqTbeE4St4KM/bYSZBTt3V1ejDWDBigUzLCX
         ikXDs7jmsLVaJnKAyR21yt2t10Y3qGd0tOPTeN7F6z5vLAd6r9ylqbwlGyND9zbA4rJu
         /3pn9ylfSlAPKp/0+rXAMHB6IefuR7clp6T7ljnJ/IK9Swpm22SctkOmX9La3zTOrKay
         hO+mZlvm6gGIoB18C7mQY6i+MpKse4M3cX1lt6qSBd/3TRG1XN7ddBVhNY/esTokQnwd
         VeBD9E+w3cTGXj9c3J+5itmBTEeq1YhTePGcPAXg+s2o5/+qGw8XlUSKvt4posNBWwnP
         /pzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oEe4aKYCCqICkCpHHVQQhZO5iDc/lYj0mFzN2UGt0QU=;
        fh=bN4JjLjEcBecITZY/YvagL82upwhz04uOfc0g3vRKNY=;
        b=e99vKB4XDT8Oi8EEXZoiJnBcTvQsLNYw/JPigu2mTpTmxvc17x6fzZNfQ0ddT7CPdb
         KdgVr6cMy4X/NcAyq8BTJh4rfI5aIK/cHsqMv+8mRSfgx0CKMhMV5xguP8DZxWQLfVmk
         KSn6dEBZvtXRQIC/OhvgRH/J7kBzGdG2CksObL9TsJeob0a1xDjvQfIbGdzBt+GGYPA7
         /xpMl7PpyXgHVDwFA4LBFqVFKHuq5VLpA6l27sFYleDRWsx4q3bJ6QmaavFPinsElYEZ
         lWEsI6DiBdUay/0ca79TzlPMKmTm8WcIOQ02fqiYwiyR8uDm1pQcDB/+yiNwaG9z5E3y
         7Wkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mK56D6gb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2124d054691sor339195ad.16.2024.11.18.10.12.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 10:12:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mK56D6gb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731953527; x=1732558327; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEe4aKYCCqICkCpHHVQQhZO5iDc/lYj0mFzN2UGt0QU=;
        b=mK56D6gbzQRnzgyxVbFQ6BuyLKLTGOOpWGdbENtiloOa5q0xtm6Adt1Ubvg3OrT2QY
         w27JU2P88rwUbGr4986cMe6LzASuJ7SbmIvYf1SmQwrPgSRqeZU9t9cRQuC97D7+t16S
         d7y8RxpYEeahZm3MRQ7cDDSd/QIGHhFTqXocShdezSZxymMmW0ciAQ3E0yIYYzuZziPs
         XKiFcLaRifMSlZVIFvKbKXr4s7B79aN5yJxF8nwWz4O9j83NSEuxv9WHxAAXXuAkcllG
         UCHW9BPW805SGV+XWztpp8jDcRTjVJsuQXpk+XfW5a9LJ8+VwWFujWTc6wvpNV36FjWk
         t9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731953527; x=1732558327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEe4aKYCCqICkCpHHVQQhZO5iDc/lYj0mFzN2UGt0QU=;
        b=pZax6J+zvW7b0wFQLBQ69OHH8jnH0FTk61jDMY/JV+bmlrZ6y7ntZCH/zDOsnaWs48
         4ncVWIgz4i5A5Emy3A3xej04N5oZ0Jh31A6xV6uLyGizyeXkAat4pV03OiT6zl/4oWTM
         qi92fw9YXfBFcLTtoFNSknNgk4YpBJaOWxszondKjUbI9QD4gYVtMs02tlgcxnm+MCQm
         C/6CmfJsaYJ+GflFyT681xml/k9FsrK24b2lD2I8415yoo+3z9zG5m+AxsTmqQclzBGx
         fhAqzdqFxHtsJZESHufCS4aW2K+Pa6sT4RRDZQeLnGnfK74rMVlRvi3szzz6rMUr1HCl
         7FjA==
X-Forwarded-Encrypted: i=1; AJvYcCWqeWemc0F3tuh34dUF67Jnu9+7l5SCAM6P+NdK4mMF6i8oZ48EcOhx7KMeWKFvnsilHLQP4w4F9hKdnA==@linaro.org
X-Gm-Message-State: AOJu0Yzw0BG/5lxIPqfm/U/Nkf6DTnFEjlZa7u63psCJMkKsZU5r60xY
	tTKqg4DVGI98c+EPgpq3c+cw6LMMa7y82g+SORqYNWVK1lldeh/MTmLpy2Ut5ksSEA==
X-Google-Smtp-Source: AGHT+IHSJ2CzbkLZQ6mYUghdw6lw24R6B+3Ki9pAyw/aND8qpkQStUGSMwd/hokjCVVg/gmp+4IYNA==
X-Received: by 2002:a17:902:f60e:b0:212:4582:37fa with SMTP id d9443c01a7336-21245823ca3mr21334845ad.53.1731953527615;
        Mon, 18 Nov 2024 10:12:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.139.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72477200e52sm6751269b3a.180.2024.11.18.10.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 10:12:07 -0800 (PST)
Message-ID: <54fa63c5-e20a-4fc6-9b71-d918dadc26df@linaro.org>
Date: Mon, 18 Nov 2024 10:12:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust/pl011: Fix DeviceID reads
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-rust@nongnu.org,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20241117161039.3758840-1-manos.pitsidianakis@linaro.org>
 <875xoku5vd.fsf@draig.linaro.org>
 <CABgObfaVs-3aXKXtQRLDbzCL56gbimWZoMchYi5G+QGu8r0AxA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfaVs-3aXKXtQRLDbzCL56gbimWZoMchYi5G+QGu8r0AxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lXPRgNFhZjEA

On 11/18/24 04:40, Paolo Bonzini wrote:
> More reviews are welcome; in general, we should define a convention
> for Rust functions and constants (is it okay to rename constants in
> the Rust bindings if their C name is ugly? should functions keep or
> lose the "qemu_*" prefixes?).

If the C name is ugly, feel free to fix that too.  :-)


r~
