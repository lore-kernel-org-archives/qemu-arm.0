Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp401878njb;
        Tue, 13 May 2025 02:58:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXelebdOT83jiPiuoOU2tkuQr7ENkvHiO8DaoEOWnlT78y8z4lZnaavJlhuABDJ7ZwJLwS7aCFnYLX0Ag==@linaro.org
X-Received: by 2002:adf:fad1:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-3a1f645eb8amr11450999f8f.34.1747130283243;
        Tue, 13 May 2025 02:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130283; cv=none;
        d=google.com; s=arc-20240605;
        b=atvVQhkb4skdWW335qU6xZaj5mViDzZjn4i+/Xstbyo9a7tVD2YUIZqn5Fc8icjg5y
         2lvUG5juHQpMD2cGMKy1fUl+c19BTsZwzWQlFo13IegZnxY8eMHDGMhZZ/akEz7CDLyz
         9vMio9IBy886kEyL8ibZ3+tUSx87xOyM/g3VebEQsCO+I7Af7SZYHbOToOLy4iEW2y45
         eRf/6tQBvWwasL6dTKqUOpT7ics6wYF0r+pbWONiFu3oBZcecwkifN32oRd8+eZn35sD
         w5NBOVn6W9a9gGRgY0+4zsxJ7ZYb8fvQtbx/fjlqz2vW3fIZf/JIsu/YgmF65YrWf8Qp
         4VHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=u+orejYg5iGx2gkb2gtAC+NwOz7ulxd/j87UKY2QmtE=;
        fh=NUXZleLVHzgIozysCSf4RNQIGzMvh4nwEVbuYdSbo6w=;
        b=YxnRPXvZiOeW6JwIgRWMz7GDtg1nOEUpPCy/g4eW4X+d5Yyp3zXvQ6A0cNnf5g811W
         VzS1WtYa3GGYhrVlEYdapg0efFTPye+yFfLCNHI1B36+LUwMUkhEWULo0Wdp7FvzXP0Q
         6p8xCdNN24V2Homow75X0zsj7BTyneayLZa9p2JaWUqV4ztgvbldhBT/x4XZnHTPD8Bz
         B7L2GsgH6XTrw/+A2QaSKTU9U1MlPhRAY/AWz7jkoUjX2p6QXfyyV9iDoQcbqg7/30ON
         lrsciXp1g1MHjsyXA9Q6LHLAHU6lgcj6+m+XsTsCAJICVbmwtVNYhLOQOYlB4Vw5kIlX
         LACg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=roEt62Vt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f5adf6b2sor4438865f8f.6.2025.05.13.02.58.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 02:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=roEt62Vt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130283; x=1747735083; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+orejYg5iGx2gkb2gtAC+NwOz7ulxd/j87UKY2QmtE=;
        b=roEt62VtJp5pwIt7/YeeTu23TS/XCrStY+b3JL9JlqoaEFhLQtCtdyP4XjHaVV8D8b
         FzpObEuYH10KwYMEaWPxkreYXoCr28aV3F3HfIusKR9iSxnG5PxxDUrN4EneUe+Sy3uu
         8SQANVnMjxpRDFGN8y71GQiqSe8B/KlzlGVegmHIwmwhHOOvbZ8srbT+ca8z2DaJliNi
         Gd5YMC8nipG33+oK7twAYa90JWWt207AITPqBmZsiUGUguNPqsiR3I9MbXXZEnvRyjkS
         1xHLRI2bYVSfXUhDQ9g//eSQ5vBwbbMof3xztI0la0GJdJqUppMul0FvtHaQ5ZDgGSOX
         xX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130283; x=1747735083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+orejYg5iGx2gkb2gtAC+NwOz7ulxd/j87UKY2QmtE=;
        b=jO0mhjKXesL24zdvVTGBIc9ZynYgn6zqliNkMW/G24H7l7urcvTTFBQzBFqVGdwJss
         +DRtHqphN0UGWJveezPiDpr0OfMiANN1K9WIIZZT6XFe5XepWd0TTZyjCBI8+7kxTC+o
         2q2ggw0QgTtsISBSi6wIdIrBYWX8VlODBDmp6ATnv/jT+hMvLHP5wE/er0NCcwD9o8A9
         q3wEz7d4Ou42Me9Cba/J/kmszI8lajRcQkU3BiCjajLRjEtsmD+/F1g5UVqfdIJ4cz4j
         097dsz6r8xdhKPi2QyCREbPtSyf8qoxI45yTgljT1ptYg6TSWnWo6F/OHrPPNrFkkgJz
         9Q4g==
X-Forwarded-Encrypted: i=1; AJvYcCW5VjdBKTqTua83FNBvlHYpIPU0pozQRqrEzk3q6L/OVf0l0TXwl+DtB7Apd3A95xJw7keZG0YKlWolwQ==@linaro.org
X-Gm-Message-State: AOJu0YwLt/aUy4v02uL0kkzkTZxtbPRHB5EkycNYHspH+dz2TkH6aq6V
	xVQiPfuEpAXKeAIyTUQ1s/tkhIUIrLKbxAd17l7MMzpOdXPeElxObuGmSnhGrmX/2A==
X-Gm-Gg: ASbGnctZ+sdK0DhTIoEamcqE9KEUkJ2chqNjT815/xKS9ws/uj5hAVZKKhFEkVVskBj
	SCFdhXmA99pUpiWqS+kYPWm88pZ5ETlqaSPlvA16eAHeuFbUiEOtvnMMEubJv+eSba8s+YgQ+0V
	HE1iK+rA/7pgFhy+6OdlskDaJQvnMWmMHLH/sSF6di0pK6ja4ILTOtEjySh5GAkxfv0xM+uVa8I
	KaT4r3tslPIHIKyHaRu1Zdz8zF2ZmET9F6OH4EyyK/BUkmSbYVXu3rVbtEmv9cW0XdVORgmzxeY
	O2dVVbCpi46Szh98IFbTEYHMgrn1WHn9DGCUxuqw8qW00+g1zlJ0IZ18AFMiXilYPcHLdJuHtjH
	6PQEb8TO1Cz6/faknPUZ+VoU=
X-Google-Smtp-Source: AGHT+IFH2OlvRcGl4N9FjP9kuGhmZ9IA5VlsAJQgKag/eumhT+Cs9hNppG5RoEwO0fq6PUrIk86v4Q==
X-Received: by 2002:a05:6000:22c4:b0:3a1:fb7c:278f with SMTP id ffacd0b85a97d-3a1fb7c29b0mr9435718f8f.22.1747130282699;
        Tue, 13 May 2025 02:58:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca31sm15710232f8f.65.2025.05.13.02.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:58:02 -0700 (PDT)
Message-ID: <a7c1d6b0-8e62-4bcf-8b0b-35311d4f7802@linaro.org>
Date: Tue, 13 May 2025 10:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/48] include/system/hvf: missing vaddr include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-3-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 584GK1Al49ug

On 12/5/25 20:04, Pierrick Bouvier wrote:
> On MacOS x86_64:
> In file included from ../target/i386/hvf/x86_task.c:13:
> /Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
>      vaddr pc;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
>      vaddr saved_insn;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>                   ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/system/hvf.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/system/hvf.h b/include/system/hvf.h
> index 7b45a2e1988..a9a502f0c8f 100644
> --- a/include/system/hvf.h
> +++ b/include/system/hvf.h
> @@ -17,6 +17,7 @@
>   #include "qemu/queue.h"
>   #include "exec/vaddr.h"

               ^^^^^^^^^^^^

Since commit 0af34b1dacc this patch isn't needed anymore.

(no need to respin as it can simply be skipped).

>   #include "qom/object.h"
> +#include "exec/vaddr.h"
>   
>   #ifdef COMPILING_PER_TARGET
>   # ifdef CONFIG_HVF
