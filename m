Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp266775njj;
        Thu, 1 May 2025 08:07:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnRycUXPbQobZjQUSwX6DL61NMt6iVgB2hGxxyA+exLdiPDbHZAmpltRfKgCwKxUHs7V3q/dnsSUzO3g==@linaro.org
X-Received: by 2002:a17:903:3c25:b0:224:192a:9154 with SMTP id d9443c01a7336-22e0842fec0mr42316935ad.26.1746112022562;
        Thu, 01 May 2025 08:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112022; cv=none;
        d=google.com; s=arc-20240605;
        b=Tcck72yVo+uh/llwU4V9tSR8QvSzuM+McVrDUvHfNuk35YvqBo1cQJHitUBaLGb2er
         S3ZGogRBGRNiIKuub0IA0WuYffrwCFgIqeD9AvWeKeWBnNZrpWyb7dnHBBmuxe7XZNaX
         QLS+7bPcdIk7UJy3nohvt0DQJrnhR3i62qxwkEs/nO3oXmjdfSJmSrMTNdr6Iw00azqH
         ZDH1stYTBV62Jwf0F6nPwGpnvGCdo9fU5ilf4jWedKs2LfUPcuJCh7q1WXqht2f0o9Q9
         fdqBDGBJt/K7snSlJ0GmeRZBtWTrjx5uSctvnkYkxQFQGkBWu5iwSJGiSmsdnGMpUfEA
         PRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EcM9dPq3o3V6LdIXkIrMSQgYINVmv6Fp7cayUpv4944=;
        fh=krgfx15uFBIbRBjj9oq8zQE2fvQDL+rdedPGLXpoCtc=;
        b=N40sgIJEzQBYxZi15Xen/czdsCz1hc1Hk+tOX0LyKEPK/j6t7rN5HnqfEU/fjNbJPW
         BqImZEZCSU91mmm5Kgy1pmD5dRt75EvVnS0LjvZejEzFAxYnrTJRdSG40dzYIZK+ya1U
         GHbZwKG4+09KCTLDxTQLpO5mOZtaHWxCWL+CFLvChQkBQOthk57O+43MWzatLiVFmW3M
         wkaoH28Rzvr8F5Eomuk6OJZWaw2Xt9aBoO/PMUt0H6Gsm0RkNoFBv9ce51Pv0bgRqI02
         wdjoxCOZnujyVMy73MnN+oHR5zN8lr9byFvFGLGoglLwSZrhyYg9n33kfxhLIsVPSBUU
         J3jQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a90uFbTY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be8ba6fsor8142155ad.15.2025.05.01.08.07.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a90uFbTY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112022; x=1746716822; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcM9dPq3o3V6LdIXkIrMSQgYINVmv6Fp7cayUpv4944=;
        b=a90uFbTY4DUjkaS4YDbzeXEWhir+q/7jtFKvpy5v+s8mNYov6smUiFXKJijLybHdep
         5o2PVgh6MoiMCx3AVB09bQfaBAaC0oGV2Dgvo0vHuYkPcteiDOAZsxg0QHEO9aSoSpGI
         kd7HRuDdlD1hW9KL2HzQKSh4JfvE7o70sfoxt0vRNxo6Tb9A4A061xh9XOFpJzI3aA7i
         ZsgSyGLf0ipQiVHcXX7kDL97C2SvlN5lJS1UE/8jr3gROxYNr8M0GleU2i+tvST8bQOo
         X+EpBCcVc/Q28RvFluePt1m3DthGMJhup05e9oewodyTah4PtDf5iJaWhprwQ+G3ynLC
         6i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112022; x=1746716822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcM9dPq3o3V6LdIXkIrMSQgYINVmv6Fp7cayUpv4944=;
        b=cqwA7GYJjChqwHY2WBFz6x55A5R3CLhgioFUapX3NvnoKj2ZoMEuR3vr481AVJ9kzB
         xqLzD2nXsIWjDyFuAr6YN11/EfkhdqusgCRT7IJqH5t2HgjUmk7bzGXL0xC315fAqQ0D
         EF+0P2g75X6UtjypJmIOK+JK8znGpS/MtTtqdfF3a7NAl26iGDkwlndpq1AYwHQ+z5rY
         3HRxzOmuWB2swr1jOCsfXnsz3be5YUzg2UE4R/b513dFJVW++X8oh1nJDilr/YRWJhcT
         +oG5q9FN8f2oHpcVnA28PqnQ5qIabbWQqYQACEr8cobyKkXLju+stGD7blsOk6uXjL6d
         BYMw==
X-Forwarded-Encrypted: i=1; AJvYcCWyqhNJ1g32/TxW0Lzr8cwgqABjDnhN9NfNToYR5AidAxYg5TOVntW/072q3WCtQ+HdEqcIsrN2VHkXhw==@linaro.org
X-Gm-Message-State: AOJu0Ywj86G5SnIoXQpo8NduVjR9tsfSogtQdon7ko0vSHwkpdUaBkn+
	PY8CuNGXnDBR4aGiHLMdK8xl2gbVJ7TMUYmZqTudXQB1HGIVFuAZ8Q4NX0pZooeaiw==
X-Gm-Gg: ASbGncsiLka2C2FI24Fyxs729nAB1Xln1MWrCF1om7hhapTKi+bQI5hgsMQsHl25iM+
	y41jIj50+xL6CFPoneSeLCjm9MDfudfge4w14VVrOUvTJA3P0VR8xhO/wHVVuDCwh0l44/QZuF9
	jqyHzS/NtKcqSOwlhe9/xQH2C1zZJLQAyeDu4PY8ABsvGYJYJykgHTK6HxUCQJKGd/QIxrrBHwq
	dfoxk99b92nCd/nVz/95y2EuI2hcwmZgAwfAcz2e4zhljqJV544GfOls86uFxdSmBe0p42Lty/1
	XCCoubR2CKOKYvE5ThU1klFFjQAl4ccaoXfLDZcucIaP3RRGARwsHgCV1UZvB4KRnb5VD6HNEb/
	jycvUuYE=
X-Google-Smtp-Source: AGHT+IGfItdxKMWWB0HXsdQlHgzmrixhckbDJw1c4W1R8FB34LVv12qDqlJ5sWBZkHPXgPbYrkQiYQ==
X-Received: by 2002:a17:90b:2707:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-30a41e6dcc0mr5736176a91.18.1746112022161;
        Thu, 01 May 2025 08:07:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480ea0dsm3690678a91.37.2025.05.01.08.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:07:01 -0700 (PDT)
Message-ID: <f631cd09-2b84-4327-8ef4-39aca5c8a599@linaro.org>
Date: Thu, 1 May 2025 08:07:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/33] target/arm/debug_helper: only include common
 helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-17-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-17-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: u9sXT1pD3ASe

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Avoid pulling helper.h which contains TARGET_AARCH64.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/debug_helper.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index 473ee2af38e..357bc2141ae 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -12,10 +12,12 @@
>   #include "cpu-features.h"
>   #include "cpregs.h"
>   #include "exec/exec-all.h"
> -#include "exec/helper-proto.h"
>   #include "exec/watchpoint.h"
>   #include "system/tcg.h"
>   
> +#define HELPER_H "tcg/helper.h"
> +#include "exec/helper-proto.h.inc"
> +
>   #ifdef CONFIG_TCG
>   /* Return the Exception Level targeted by debug exceptions. */
>   static int arm_debug_target_el(CPUARMState *env)

Oh, I see.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
