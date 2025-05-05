Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2650231njj;
        Mon, 5 May 2025 11:49:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyvw4vP8mSG/h8T05dACLEKBQ04RUqNKWwIhibQDnOqCMoRWVzJXF6J/BVhmqmkfCG5F5e6l4XRMDYkg==@linaro.org
X-Received: by 2002:a17:903:1b6b:b0:221:7e36:b13e with SMTP id d9443c01a7336-22e1e8e702dmr144889545ad.12.1746470999099;
        Mon, 05 May 2025 11:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746470999; cv=none;
        d=google.com; s=arc-20240605;
        b=DHaezCTyTsYeMDINW0zSVBye8yFpHHOmQt46BEYbqZv6ERwPnQ5woEW/z/tcB/h+jT
         ONQjjKwpVqP1DF6eC++XsROdJUqwahTc1FYjRW3vhNL2WFFFq5uXfmPx4w2tNXSjMEtp
         FCVi95zPeVE3QxomVS0W1Or7qf6piUkrYMJlYVXA8dnLXMHVpLGzMS8iOjQSNqQF/D8R
         ZDkZX2O3gjfWgu0tp37+JysyYFwkeZ5sGIRnQ/cqXEGmles6XLGLnjWzzx+JXMXQBu+B
         /BNPn37F6jxmUB+rhxCNMwZdjmFkKst1pBMRbvQTizu6844RKKRAr3RetgXnsKr0o9X5
         fc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ta9jvo3AKEZuDVgunvRvdzr3ATvRL4CLel6LqcL2wrI=;
        fh=TP292HMZMrrPiOQUDjKYG8SnlDFy+fkOFejMh+lgRmw=;
        b=EQ5SkynSlmThultaTZHm9aAZ+29Ls76d1OVVtGEuCDObTu01JO03SHxJ1z4xcuF+08
         VudnAhtZFybYJP3+pf1bBoPy3X6XOErOnDD/HR/n7SmEkckJj1QZgGUA1fl8SgVMyNNv
         WixLCwvU4NJfJcFr1XpCDeoRWm/GaCU3nbWXcJQCBfmz/HaQP5maULza6Qwmu/bq23NK
         dgWfpO6IBk1zqV+qIgKDmqX2M3OoHNg1C5QggLBEGmMJaz6FpMYKj9o+iP7F6gs6tG2z
         MJWimVvPx4oD+2etAM+0cJtgN+7Nsibc3I8a8BLkW1KnysOhLPeGWI0ixrtPeFuTOBWv
         si9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xe/m8B2X";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb0bc86sor55258415ad.4.2025.05.05.11.49.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xe/m8B2X";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746470998; x=1747075798; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ta9jvo3AKEZuDVgunvRvdzr3ATvRL4CLel6LqcL2wrI=;
        b=xe/m8B2XfzTgO2kuO4YolG7Q42P1MJloCboJvyIlAm8mhh9/jGQXvtgp3jyYcBcM4/
         AJjZgyivV2qAy+453AAciPsZrHi8gEle/XwhYodAaSAmJpTg1UdCj7sIgNBReBrUepC9
         bt8a2fzTl89RZiBIqPLwcS60JAB5MdQZs/KsAyaYFHUTjTw11hbVavtZiLNk8DsbyfAg
         WAVMpAJUjr3XMJOaz4hTJ59Cynoc0Is6vI0rEFJpwKKKZ9MnDNPd4DNz8N0VLlsYcOtS
         I5M7GaWN5aoCzZYtj8qXwsGfslS74+H00YPxy7yiPJ8djiv05jdOkTowr5j7X1L3C1gw
         4MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470998; x=1747075798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta9jvo3AKEZuDVgunvRvdzr3ATvRL4CLel6LqcL2wrI=;
        b=imKaYC2H+12lUYTrzCRO+rHe5k2FIhDBL/GzprMQ/e5K+wzOqUV0d59sD63BadmVLG
         pwyoFPB1HXjZ9EhA+c5veTLuIRN4GiAddjrLXuix7fWNyjaqI+JGHb0deCzD1ztbasn8
         O9KqBZo+Y/bjmExYX9dwsd0Tjcp7IR6IyJsS72dQaAvGKUxqZXuN1SP31XhFvcerFLd+
         UGd54hYOvCz27tC7zgaUKtHpUNBjNtBp5Ftl6ycZorsv6sQ0chpFtDOrboGq4mcWdc6j
         MLs3E9UGYgX4Ykug2LU+w9/6ahKHW3x6eV7aNoESMN0nX6gv5K+RXXjca7gkPR3EaNuV
         qLyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtiq3iji8OBsh36yKxsVAtXS3Jp4y6AJ/4vYAbhctcOw6kWVlu6djQzZlj5g43E9rU+gRkHYw4IZS9vA==@linaro.org
X-Gm-Message-State: AOJu0YzMW+JeSlAjvr16tvvwYf/Q5cgHf70hmh/syITN0TC/bIRm0vhN
	WZbPwdsjfn3Qa6n9a5Lal42xeeUx21WMK5dHBBuoWMOh/tPm4iZ1QjV5mq+ZnpB8Cg==
X-Gm-Gg: ASbGnctCBcK4BBiIrLii8PW2RWOGc+Jb1rV1QRdCA83TEYgh4fW7k1KaFvsysXWZek8
	7WHMC+5djXBBdkeNdbT0yWIF9uPi1ptOFmunMPVHvEmYm1bQuH+eD5FRMprDpLOYgHlgyc41VGS
	OXd9QtWLVLOI3Zt/wVHmj7AJvHqHwvsIwBHDdMwlYFlJCMs5Zr6x36rpW+ogvkOvkDeFh/S/eZ0
	NJOun3CpxOvD15YnFCZsmVPfn6SXrtxg5BuDg4Hnvgt0Sa/7KO3a3OV6nhIPTZREpQgwp3ylXKG
	lF84pXwk0jnkckCGXEOfSfpmL3gcRKyU2HkO+Q2LEJ/jnt8e8Qd6rReWidydopd2wlzZCXRvjzr
	S05IoDW8=
X-Google-Smtp-Source: AGHT+IGwaWwoaIh0UAcV4KiVMS3oBhW2UNucgbSD7FkDN5CheSLqg7kcicpiYhK/ibBbWx3Qh9MTeA==
X-Received: by 2002:a17:902:f543:b0:224:2a6d:55ae with SMTP id d9443c01a7336-22e1eac1872mr152998795ad.48.1746470998678;
        Mon, 05 May 2025 11:49:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228bbesm58347355ad.164.2025.05.05.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:49:58 -0700 (PDT)
Message-ID: <b381f802-9eb9-40ee-a7de-f3b5c49abfff@linaro.org>
Date: Mon, 5 May 2025 11:49:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 46/48] target/arm/tcg/tlb-insns: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-47-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-47-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: mzbTw8o7CZcH

On 5/4/25 18:52, Pierrick Bouvier wrote:
> aarch64 specific code is guarded by cpu_isar_feature(aa64*), so it's
> safe to expose it.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/tlb-insns.c | 7 -------
>   target/arm/tcg/meson.build | 3 ++-
>   2 files changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

In an ideal world, this would only be included within the system build, since all tlb 
flushing insns are privileged.  However, it would appear helper.c needs more cleanup 
before that could happen.


r~
