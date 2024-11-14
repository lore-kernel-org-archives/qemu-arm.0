Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp498584njc;
        Thu, 14 Nov 2024 11:21:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW0eFlq16ygn8mSYgODC/DSAKNPjUvSYk+d6BMBBdR2iiqGBS0Mxe9W+9TRXmNlpJ74fp3wBG4+ZY59pQ==@linaro.org
X-Received: by 2002:a17:90b:4d86:b0:2e2:aef9:8f60 with SMTP id 98e67ed59e1d1-2ea15204107mr133061a91.0.1731612114510;
        Thu, 14 Nov 2024 11:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731612114; cv=none;
        d=google.com; s=arc-20240605;
        b=KAl47B2gymQ9EFitvpEiCU7ePG90owQpOROq7VWrkWwSWv4U1EjUg/w8Ziu7jaL925
         i3Dx9V7jO+EY4EWH1GAd5EkMRM7qagiRv5brYnNlKlKdCkuAl3uO9V5TnA/6mYxfWrv5
         xTCrMcYyUBzUfYS0F4iZZS4AfZJjqov6EYUVf09BOAH/eIg3tTsfQ43m/aQ5OgTBqNLf
         m8JiuIdAYNdB1ybmW2hemWgqAjdnx5R1GXLZyVCsUqLhFp5JdiSyO4P7+1TvyHLH83qA
         XXa5dUZJm3SXX2Qf+l1QFg00PELltE3SBSXAcSaS2SaXfxXLNkQdTKMlqqWZ5TPpeS+F
         zyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Vd8hIq/RC9Fcj+DKQsNCH4i0R6za3XbmScuQL0ivEbU=;
        fh=p6ywWIEpdhLkzvAjwRGNB3vOgdCkRmECZaVGYByMlo0=;
        b=B1W1jXSEQLXFhj+Kix4mi28RVUIrTt5fSTsJ4Qwko3GVc5fS774ufMxkTp15+VtvCM
         NjX5zHR/BmU89UXRKDxXxmT+9THbvqPh2P0N4xjdmV9h62LwV2D0FjF/a+94K6Ol4zAK
         aGFYFB1H5NCajJJEPxfCVx6xmhLzeowITmaq0WSxqJ5VR+EEbAx7kqAlAhp2I5QjLdt0
         WcxAuWndP9VlmGPHDQMKBPIVoWmdCxCZvEQQl6EOpBSmWbAgVQttLTYx8Ef8jUm121o9
         0Xkl1X8D8HfitCYi0Jc0fqNdxZHTxffkJm+vsQFcasUQsCG7sbVyVuwqvvTGCwBBhudy
         Gwnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k0fGyi4P;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2ea07e5624fsor1414145a91.2.2024.11.14.11.21.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:21:54 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k0fGyi4P;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731612114; x=1732216914; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vd8hIq/RC9Fcj+DKQsNCH4i0R6za3XbmScuQL0ivEbU=;
        b=k0fGyi4PUyEbn3cMFhQZsAPnY57R+846STxBEsRPtlDGp+WHRP8YEkWnio/0ngC17z
         WlmTSR42JZaHm8JgsEbUfTiDekDfWygcJ363vWHsp/joxtPOpcKOnwoGargz7RK4dR+2
         P8elKUpI1ectxW6A+5SG138PwpVcIfn6N5uffXq/DMGbD2j1At6uTMgyH/WFhcP157zz
         wCeZr1pEolp16Y2mCsK6O82rnpmIuW89VWGeFK10D7i61CVBMtCScwWJ6pb6eN1FcdAG
         iKZJ7xGuI6OzYSwv9Couv38D2jJoM8oEzbw3JzEAGwvqvK/hM5VKvXnN+t/rhrfjKsu1
         iHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731612114; x=1732216914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd8hIq/RC9Fcj+DKQsNCH4i0R6za3XbmScuQL0ivEbU=;
        b=knstjFOsV5/Tbe2ErPla6daXtfhmYsIEZ4GuVMllOl489mDG8aTkrQwUPQ5gOGUs32
         AVdcygqsH4IncLSGaADybbEmYk5Ctt0tWV+EstJn+1EbvxdQirhZlEUPHecXxx8LTSx7
         uaaYJHJaP0CWvegD0hX7da/9T1/8b195jwJOu6428htFvnZhyXjB8Kw3XBQ/jTDJK2wg
         4HoB4a7KoJzGjK5wAHRJAd8micJz8u7gTvH6LU+J1e3BIX3g2FQMezsmccTu8hwvvN8Z
         2xA4+7vS13GPprMLH6eZIyvdLZ5SSji7u6N3eFKWvAcF7I92YZrlDMfitqx8lBrVrgyz
         kWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFz1QBNecGp4gSj2eC4goxYZBLSwvnw14h8zd/BlKhw//LfN3CQmPrB3gNipi3WfBevtZy+KqEZvtHoA==@linaro.org
X-Gm-Message-State: AOJu0YztPDEd8Kvyot7dgp1usdGLsJyTDqWyOKopR6Btw8XH+LkTNeNw
	yBjwhT6gmFL8QPRmBsO0dTdV8+CGsWwhUUkpX3ySvM/xv7kkwmFdaJ7auRY/7rCfSg==
X-Google-Smtp-Source: AGHT+IFJ+RWYdtAvTk6DWTgYt8JsX+ILyyi6ae5MuLqLFerqQjwV6Lk89jtOoUIs1bPrDWo0Bf2htw==
X-Received: by 2002:a17:90a:e188:b0:2cf:fe5d:ea12 with SMTP id 98e67ed59e1d1-2ea155a254cmr35944a91.24.1731612114054;
        Thu, 14 Nov 2024 11:21:54 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c2d72esm14227475ad.9.2024.11.14.11.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:21:53 -0800 (PST)
Message-ID: <d6a52090-a8d3-4cb6-881f-071a5668f1d3@linaro.org>
Date: Thu, 14 Nov 2024 11:21:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] exec: Declare tlb_init/destroy() in 'exec/cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-15-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BaRihERF/VDQ

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cputlb.h   | 28 +++++++++++++++++++++++-----
>   include/exec/exec-all.h | 17 -----------------
>   accel/tcg/cpu-exec.c    |  1 +
>   3 files changed, 24 insertions(+), 22 deletions(-)

This is only within accel/tcg/.  Better to move to accel/tcg/internal-common.h.


r~
