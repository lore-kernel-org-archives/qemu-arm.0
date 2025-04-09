Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7627517njd;
        Wed, 9 Apr 2025 03:58:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc5:b0:43d:7588:6687 with SMTP id 5b1f17b1804b1-43f1eca808bmr20171035e9.12.1744196323664;
        Wed, 09 Apr 2025 03:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744196323; cv=none;
        d=google.com; s=arc-20240605;
        b=DKrk8f6PrRddCuDIGoQuLGh8UsA1Sa0HCfPRCjbNAN4l72+hRkC5HaWF5K18cb20Fd
         HBj67lnDw9FfmG8mmJmJ6w7ORPHQk5hLwvHkc/rja4ByqF1dOf3dg9eOhAKASVHnA4F8
         itj74li5TYvENg7Alsk91qvALb1t5iTnBkER0WLM/2b92wc8F5qogHWPqUL6lvizM5kW
         QbCcTroIHFdF2rGOZcVHCgV/91L5xOiuVpO/e9iW7YYnY60ryXKqKtgFqFbvqmx2r65G
         wtoynRfjP3At8kqAz5rNWY7WPw8CjkqTeK4E7Pg40CV1BD3w3Dey+aDqJZXbEyjotP6x
         0kmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CM6GJHUe2MWUm47NGTkKsNCuck/2ZwQKCfLGM9K8E9I=;
        fh=RDkVV6McDzl5AGSWeQEYfMLoxwMSy8uHCupVGoJ0Z7Y=;
        b=ZYXcnsrKjt3PQ+SFP2/Fn5JPABk6FgSiwRyxIXirxi+IjmsAFFnoU7Um9G+HMeScjA
         95kcS+52P+F8Rs2V1VBj75napclAufhamoaVsiHdWwWvewsV7gH87R+0p++lzng6iiqD
         pJkn3W/4x0PerJLq81HtpPMOLKc76GA3jPb+ftS9ZLQrfPAetmwLiDa+rpDuXIfMqYw4
         86XoiLN7xrrfXI8ZvFJXyY1BFic+r29Nzm4DMGARvK6crVIkJBp4Df5oF8XA0k+MM0vn
         D7Muvlh4EXOFpwVlPjfu7cF7UpqGnZpbNKTODKuM5cJXp5apews+qW/mWUSC0iz3ivgr
         Mdbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=neaktU3P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39d8936b706sor335093f8f.2.2025.04.09.03.58.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Apr 2025 03:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=neaktU3P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196323; x=1744801123; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CM6GJHUe2MWUm47NGTkKsNCuck/2ZwQKCfLGM9K8E9I=;
        b=neaktU3P1DcvMuzy3mWM/rqrX/9+ymumexY6xsA2ypqGRc5wkIADarSB2UEISWOy2P
         s/jbiVTupnYf+Pko7zYIUvFBMWecOkclEYrnkwDUCS5V0vVgR+PejIhWMwtDK/qA6Qpo
         gUrOiW3QyWVioNiY5dtOrZvePMD5SioEaktv5VexHaGAIU6hpeMgU64UJuWhnAhNVJN+
         6klkXhxqiWPGKjALuGOAICIIGcGeyBSIQxKa6k8S1zjAo/cnkBizrOdDKCU7pC9kIOpv
         muwrKwhdzL+Z8TYCSaE0SFiijz2nGOgfhPP4r9QqgLsxzIrt1in/iiPWkN0QEaBEcfky
         reQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196323; x=1744801123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CM6GJHUe2MWUm47NGTkKsNCuck/2ZwQKCfLGM9K8E9I=;
        b=tT4hvwSeGsK4RlDmE89dWA5ejrXtNBW2F7ABhxAp1uGg5C0mHKHAWiAt22QDQPfPyG
         iujnrB00PDQZHDkXg75UAu0GhrcwMv5vvTDXszhd871oHcpcgvMSI0CSlTkl6TK4Mb6/
         FY32wuIcYocj8bDHe8auBVJIVg27gKzGPJoudOeCQA5rHzujjpAbtlwqW3Sm+51oojUw
         3URXJZbheDx2OSe7NW+EhrZ/Eb0dyQOqUcpS6B0u9Libqcg3f7J1XIdPcF1UR9xptc9C
         BWh2xIHHwdkP5se49XETLpqyNxq5H9S83e65g6zD/LYfFMAGOe7SWXat5ul40dvk/uxr
         93Zw==
X-Gm-Message-State: AOJu0Yw43c4T/Yvat+r/l++4+iTB5v3/T71Csyj4OLX0sEIcl1Y2m9pB
	NBCjSaH1E6+/krZdvzi6ty/rvG/SwwoZPhEr9fjpSaRlkLhVPoqWak5HSzB6aShe8A==
X-Gm-Gg: ASbGncsVnFMELyiwnvsKnua9UytfnoPLoL0QPUUMvfi7GVr0WLtvI3X/Oe0F2UX+hAb
	F2baFn/p+Gj9MoJGC5LyVrs3TKwoUSH+Hhy9rzhMaIjbilzAKTlGFYhxeLaJCCvaK3CCU44U2Me
	m43CUq6n5Yi0JXO8BczJHvqNV7NRH++LuXCr3B+38o0FCoM2uwtlgCTgg6Xa1nP/bhZ8D6CyFIF
	iaTuuvtqKW/NVjfZQ5BmeD+YF3DBJUvHgTSjzi7ABFlg89QAtA3lK04ZMwg4wiqZC1DOt7TTkj4
	Eodx47+e5hj8LvkhMeLBxcjnAuQy46FrB6Pjuo4rBY83hKVg61ifIM66lBV7ix1Y0MMteB8xs5K
	/BDwDsZaYOH4=
X-Google-Smtp-Source: AGHT+IFFox61GKWj46seevPvRx2oEhJvCGdxwcCkrJrk9NKaEewyCfvcNP2h6dvtzHSMfbAtBRt4Pg==
X-Received: by 2002:a05:6000:381:b0:39a:c80b:828a with SMTP id ffacd0b85a97d-39d87acd580mr2307449f8f.33.1744196323107;
        Wed, 09 Apr 2025 03:58:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0d15sm1294700f8f.67.2025.04.09.03.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 03:58:42 -0700 (PDT)
Message-ID: <069ad872-5012-4f2a-8ba6-e2a22ce2bb49@linaro.org>
Date: Wed, 9 Apr 2025 12:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] tcg: Add a TCG backend for WebAssembly
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <24b5ff124d70043aff97dc30aa45f8a502676989.1744032780.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: gRCtjUYh0fZH

On 7/4/25 16:45, Kohei Tokunaga wrote:
> A TB consists of a wasmTBHeader followed by the data listed below. The
> wasmTBHeader contains pointers for each element:
> 
> - TCI code
> - Wasm code
> - Array of function indices imported into the Wasm instance
> - Counter tracking the number of TB executions
> - Pointer to the Wasm instance information
> 
> The Wasm backend (tcg/wasm32.c) and Wasm instances running on the same
> thread share information, such as CPUArchState, through a wasmContext
> structure. The Wasm backend defines tcg_qemu_tb_exec as a common entry point
> for TBs, similar to the TCI backend. tcg_qemu_tb_exec runs TBs on a forked
> TCI interpreter by default, while compiles and executes frequently executed
> TBs as Wasm.
> 
> The code generator (tcg/wasm32) receives TCG IR and generates both Wasm and
> TCI instructions. Since Wasm cannot directly jump to specific addresses,
> labels are implemented using Wasm control flow instructions. As shown in the
> pseudo-code below, a TB wraps instructions in a large loop, where codes are
> placed within if blocks separated by labels. Branching is handled by
> breaking from the current block and entering the target block.
> 
> loop
>    if
>      ... code after label1
>    end
>    if
>      ... code after label2
>    end
>    ...
> end
> 
> Additionally, the Wasm backend differs from other backends in several ways:
> 
> - goto_tb and goto_ptr return control to tcg_qemu_tb_exec which runs the
>    target TB
> - Helper function pointers are stored in an array in TB and imported into
>    the Wasm instance on execution
> - Wasm TBs lack prologue and epilogue. TBs are executed via tcg_qemu_tb_exec
> 
> Browsers cause out of memory error if too many Wasm instances are
> created. To prevent this, the Wasm backend tracks active instances using an
> array. When instantiating a new instance risks exceeding the limit, the
> backend removes older instances to avoid browser errors. These removed
> instances are re-instantiated when needed.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   include/accel/tcg/getpc.h        |    2 +-
>   include/tcg/helper-info.h        |    4 +-
>   include/tcg/tcg.h                |    2 +-
>   meson.build                      |    2 +
>   tcg/meson.build                  |    5 +
>   tcg/tcg.c                        |   26 +-
>   tcg/wasm32.c                     | 1260 +++++++++
>   tcg/wasm32.h                     |   39 +
>   tcg/wasm32/tcg-target-con-set.h  |   18 +
>   tcg/wasm32/tcg-target-con-str.h  |    8 +
>   tcg/wasm32/tcg-target-has.h      |  102 +
>   tcg/wasm32/tcg-target-mo.h       |   12 +
>   tcg/wasm32/tcg-target-opc.h.inc  |    4 +
>   tcg/wasm32/tcg-target-reg-bits.h |   12 +
>   tcg/wasm32/tcg-target.c.inc      | 4484 ++++++++++++++++++++++++++++++
>   tcg/wasm32/tcg-target.h          |   65 +
>   16 files changed, 6035 insertions(+), 10 deletions(-)

Eh TBH this is too much to review as a single patch.

Do you already have an idea how different the wasm64 implementation can
be?
