Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3254672njb;
        Tue, 18 Mar 2025 15:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+q6ADY0KHf8pXgLixBmp+8xjl2omG2Qv9rQ6Zt/su/vFaN3Tl3HAthrEtCzsbHcObguOnYTek80LFBA==@linaro.org
X-Received: by 2002:a17:903:40c5:b0:223:fb3a:8631 with SMTP id d9443c01a7336-22649938949mr6700745ad.24.1742337844523;
        Tue, 18 Mar 2025 15:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742337844; cv=none;
        d=google.com; s=arc-20240605;
        b=N+DO3S2m2kiRUVn0faBtB5VKE2zL4Eoae3QHLKsYOz+kor2XeIhfLQ/gwyHjELDIv/
         8WvAFqwatLhzeHEuZOpXAH0mEegcvaX8nepRk1ShofDqfjbaixSdi0c8u1OEV6wX2ewZ
         qtW6q2AbvNbnxp79ZAP4VaO5eaziT+vhbm32+U79hKcmFJQQ22OnloBt4zDRIdIqPs+o
         E2yv/8z4gCknh0af8dwa6hYXWQODCYTdiONcWWzbeVRTjDgTQSTvFHOYMZlwJzNMU8Yh
         00Q+GfJ38dK29X54a6FxSkw/QUW/9DF5mmjHcZq7ylH1Ckuutl+WkhBUEqsy9hTHW+Ub
         fOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yOVNEjfmFvFaGr73ny22aVzhc1cEgsoNeJFbAEdgGWE=;
        fh=gsuEMZzbBnInFPIwTGp9J//lVLkeC95FPddj6Iu3+IE=;
        b=O5hXMcCECjAa9DPBmea+WJbRk+5wfdIs8GFQV7vnr9J1PnrNtbOamAaf4a1c46+pYA
         nkwjMFVTiPPueElZ/VOq/4aPDIHT1aHTjJSJ88CYVCO6i69aD9hfG2a1aTyEaHvFTskq
         B65KRCCTD11JMmF18Ajfg4B2kL19RFKlm8TlFeVxU6D58wxkcSH/O0SMyMTGGBnkzVPh
         XP3KFxjNkVUhuD+nHSSa69AeTmkFackjb9OvD4Iqd8Ew29TN9G2tU+6XgAdaQIY6XjKQ
         adxwTiibd5+bMdzNOnjNsUoDmnvZT0SC892d3Eaagg5tPHXva+BKJw63/lRcG3cOWvJ9
         RWSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HumjQ9RP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-225c9921f90sor77071085ad.14.2025.03.18.15.44.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HumjQ9RP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742337844; x=1742942644; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOVNEjfmFvFaGr73ny22aVzhc1cEgsoNeJFbAEdgGWE=;
        b=HumjQ9RPG4XrCHlsm/wmktF5GDOU37ZOrBVTsJRP9pX2fqWUfuCsKnS0dk33hxkOwc
         syS6Cp5fVl7DihIgXm4c05GL8xCZZvMpI86qJGpCbBBgPtZzN+RdrvApQbNviY9Wybyb
         L878BZIx3ZarTDC5K+ZULtYrwN8Od7gIZk88LvEe4JVGXm/shJr6SsScKM6g12A/1+59
         pudDer74lNpOpqmIbBCaM7KUoU0wJ6OOCLZIvsW2kRmdhWToj7MpGzdel+M0L5n0iA3R
         aYtEzDI+1VjM72VlVwMjQug/yu6z/4H/y1SU2Kn/TzfR9LLbBt/Neo71ZU0pVz4wiR8u
         63YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742337844; x=1742942644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOVNEjfmFvFaGr73ny22aVzhc1cEgsoNeJFbAEdgGWE=;
        b=wrSLQ4H+r4E9D1AJsN22lQil6Chr6Yzo4zuqvWzrdfz9WzCfP+b82skXpq+79Oqn3a
         NP2DuVfSEhVx9wh50hkjTz/w6/Fsh03ccrxeZ4ZdE88Kd86uo13GVY1NYXIsPA4OkUk8
         SN8VDyF6le8pPmO9WMUq1MIdLbtjqBEWdcSFoeUpB7eIc1hN+swVzdyMnZUiKDKrBVNR
         ND5vZmvjWesFV4faEa+JJ0Uu4RM3kSbCNGjikzgP3XG/LsjZIwBtF5+Eh8H485A7E2ZC
         WOPWI9De7TzdQ6ciCYTOBqwjymtLVKUILld90sRQYEsk23bPfMyjwgV4hTmjeawuII7y
         BaiA==
X-Forwarded-Encrypted: i=1; AJvYcCWTpB0G2gaJF2+wROYpU2Z/FkW559tl4Tv/GClsN0XSkA+yrfM1cbUyQxmbZu+h0AdV4MI5K+8I/czeiQ==@linaro.org
X-Gm-Message-State: AOJu0Yy7rl2t7//AaHLAePTx63JSi7qomMstpWNtcb9hrA4oUE4BFFSR
	08Dti+XfQRmiYAsuVsnHMz9fYV974oUEyANILHdBOmkMYJN3AgQWwK9ozQwu0UVNuQ==
X-Gm-Gg: ASbGnct20VbLpklsEEggsHrC6sxP6WwxgKaT8TAe5y2CQ3CKcNH0yWMWX7ARXJjavT7
	KMd8hZQyJMJ5rs75bZqGZDtwxVbO0ENT5/EiZ8dSTvkvqelZNpJGD10zP47SKwWftI457gRw4mz
	TOS8x9FIX73WMMfu42coq1dbZxXIFUVj3+mpBufpVzRfC5uKZrOFvQtPhwIsEhhe0twhI6oxojY
	kgfyUT2XaSGcQgbkKtS0CXYMhLkvgqL81IdGw0mXsBWvdmV4dIKY5CqYMScva62ulHKSTOI/qFo
	4eSz5cOweVDI5nXiC2Dfc9qlAacOcLU1vqlKccLRhdL/bRdPVz+eJD+w0EUomecdaI9PC78BRVt
	ZxFI59BfJ
X-Google-Smtp-Source: AGHT+IFyxI6FD/xN+KIxUzJPTwzCWqBluNiU/Pz5vcaoPz3M5Hxd1qYrSVE4IjPJNZKkULxY2fHDBA==
X-Received: by 2002:a17:90b:2dd2:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-301be1e72dcmr768418a91.24.1742337844092;
        Tue, 18 Mar 2025 15:44:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61b525sm37172a91.35.2025.03.18.15.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:44:03 -0700 (PDT)
Message-ID: <e8881e57-abfb-46e7-bf2f-e9cad988d547@linaro.org>
Date: Tue, 18 Mar 2025 15:44:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] target/arm/cpu: define ARM_MAX_VQ once for aarch32
 and aarch64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-10-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250318045125.759259-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1MY1gK0rn0ZI

On 3/17/25 21:51, Pierrick Bouvier wrote:
> This will affect zregs field for aarch32.
> This field is used for MVE and SVE implementations. MVE implementation
> is clipping index value to 0 or 1 for zregs[*].d[],
> so we should not touch the rest of data in this case anyway.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
