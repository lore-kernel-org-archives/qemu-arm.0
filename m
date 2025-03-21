Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp407422njc;
        Fri, 21 Mar 2025 08:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzcuzORRw+uRmAmoJDXRXKvBSDY/j+Yv+Le7aLCz/YrfsgDWB2IzhFtJVRXJlhtodSxnpD7ERN0X3pYQ==@linaro.org
X-Received: by 2002:a17:903:985:b0:224:283f:a9ef with SMTP id d9443c01a7336-22780c52331mr58420385ad.6.1742571765874;
        Fri, 21 Mar 2025 08:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742571765; cv=none;
        d=google.com; s=arc-20240605;
        b=lEeiDz/y4cscjOAAu3ep7khIGtJ7wn1q3rCxCJzV/P7FDJ/qLtass6tf5lwXuolKhM
         21AmFBhPcHEPD2kuCLO4Ap364aJFAAC1nJERDp/J4cL8x0Upe/b5CwJQ1nnUenmRV9r1
         2FJNpc0QDeDnbL0zqaRaD9q2EieDZMacbBPhbWIu6gqP9hNz7sTHowJR0sKKhCu2IhRr
         Jglee6XqbQIzeESXK2ENH7ylAJba+1sLIbzRcsx0Zc9SU+g8ja+8IS88D+bw0oyVuY6D
         gY1O9OkhVBVZ2fR8ve57uZyBMteN7mm9gz5vpBYXX+vInU/MycoTqsCZMS8WP6NL2Ln4
         tWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yPv0x3Z1/HPbUhKDoJiJ7eKUBEGCPwgiGSQ1X1h313g=;
        fh=VcPeLf7eep4cq1A/7eFsxMwGzabIBYTb94qCvfPXxmk=;
        b=lCGjVwEwqkZLXnpCkmb6QQcDMKFcQBJWwFku71MafZQtqhoBnO7jAD3ejlt4SqBGtX
         dk0NqzoZlANlpVy6U7X79D7ON9EVjPH81utLCj16T8PR42Tz2zXAcT06/Ym42Be+F2RY
         TUm1fgb4reJ+KFYEVEOXZttBLcoXIkwDL+8epOBMUVQea3Buo0SEzpAutpeXpu3pgvy3
         qL4ccQn/SIG+M9t9ufQ4/xivRmgBfYDsBq1VNt89Da0FgJ8P+OlUZgQgwZgrdauiHBYq
         YSmMnnxNiy5lEZBywL2BPyJq6HCw4ieCBnU26ttsAudLlrl2rava+SqRi+yeYV4uFwjL
         0qsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQ9EhQWG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f2a8dbsor15951895ad.9.2025.03.21.08.42.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 08:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQ9EhQWG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742571765; x=1743176565; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPv0x3Z1/HPbUhKDoJiJ7eKUBEGCPwgiGSQ1X1h313g=;
        b=VQ9EhQWGBTQtDZIsXVm7VEMHcdZtnoJygCRUH+RuF/YzEHCx4YTMZ0l3B5IDOrsT7T
         GUAbcI7LD1srh2U35KypbjVIcsp1jQViOAjBP5FQPem2PDvbEn203bKYSLWF0HhRu0Q+
         uAHHQ/TBW6Gdiazmntr7ug36tHvaSFhRLvQUwUPSnevlBVrKTkT+F5PyVr8tmkLYoyVg
         lYYZpVovDqQ7SeUjhB8105IIPnip4FiHI1/s6kI2vRs2IwIYjeIUshDCImuiwmxmroK0
         5f0zsgY7/0jTrUsSxcM5FFbUYofwPnQbzxAJ90D5j7U36HoBmCZAknSpbiye6b8JwrUi
         MBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742571765; x=1743176565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yPv0x3Z1/HPbUhKDoJiJ7eKUBEGCPwgiGSQ1X1h313g=;
        b=GopBIxI0nI8aYRrnm/7RRQbfFpmNJtr/CelRhtYsPsFJtjPtKMMP1kU4XRX+gb9Pks
         HmAIYy8HIJRqpY3YZ1SsYl9hRBXVXRvQsnZWs/44RuPgpm+tZayDvhSnBVaXkgEHPt+7
         Ov3XDnNSQ/RA3qXHE5Y/iMUiJOvyAExiEybMk9fN8ZYAbY6IKoQyPgx247/3CjE81gMl
         b6A/r8qi0+G2qLMIoU57yyF+KQMBP8EnZiV0EOPGOjEN4pgMgcyuCqA5OUbDbNx/sH0W
         6OsuFtp0U7qZtkzIrN/xJskMBqSoO5vpozJa5hMu8EI6ItzVE20qbU+PLBDYF3WT/VmT
         4KHg==
X-Forwarded-Encrypted: i=1; AJvYcCV1rmBi03BwqMfIq65sNqhbBCH4nlb6AwrBE5f4FHqwRmmVtWBWIPky4LFce2+Y/8gEv0rPiVryredzSQ==@linaro.org
X-Gm-Message-State: AOJu0Yz5Shc7Mv1gm4v4pZqd0wNLOltZKaEPiVFfkPXCb2bG9DMzHrXw
	totVRtm+LpuukIDZ5s+xoic1iTkoGigV44KxcyZUQCARx2ATRiOWOIjK+bZAMM7mayKq5Y4MVc1
	6qTg=
X-Gm-Gg: ASbGncuqScKE2nPexpY+QMCSDRfZlUVGEw09xnfFUpWZWOIX26KrnjYUYd0W7nXw+Cu
	OE1k+bYDRvYVxm5y5v7c4jAkkj85MjTVJPo5wrtrtRgRU12dHBFMe5nRDyQeey3Er2LPzGZQUI0
	nMOJeGdo1va/L2jX66C539wPwtDdt8My5xknbeFN9jtLL88BlnTf6nlfbeyXkIx85MQchLn3kBp
	JqBh8oehnSvHZYl3S9TsQrSHHJQUVc0Fmuhm+LZiNO+iqrW1qwK9RAv6yCU6WsXTaBrPQpwlWr7
	5hKfcOmbyFCVSTG4S1SYY9rZsEmDrcZr/UuXGpmp9ilbSzTPEXL9O2OflnmweN6f8nDMuZBmIQt
	xqu92bgw1vMPsk14awhE=
X-Google-Smtp-Source: AGHT+IEJWPCbapPvGinlQxgYSSIe5Y2Y267EQ5fu6sUpIbsI0Qm2IeL2lKtJmthiaWExNJRDxAa+bw==
X-Received: by 2002:a17:903:2350:b0:21f:74ec:1ff0 with SMTP id d9443c01a7336-22780e14e77mr61853175ad.32.1742571765209;
        Fri, 21 Mar 2025 08:42:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf63610asm6221455a91.44.2025.03.21.08.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 08:42:44 -0700 (PDT)
Message-ID: <dfd1d8d2-9d08-49aa-8f74-50394e20378f@linaro.org>
Date: Fri, 21 Mar 2025 08:42:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/30] include/exec/cpu-all: move compile time check
 for CPUArchState to cpu-target.c
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-5-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: I/ZllUtoSxBJ

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 4 ----
>   cpu-target.c           | 4 ++++
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
