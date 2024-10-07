Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2199618njb;
        Mon, 7 Oct 2024 14:18:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1D8sHJ6d+Vh79VmoaPwNFp1PYJ8kB3R7DWM8nk/hlM2dHJxCZycPbAHufy59ykKZwiHfPh/kV9JotNQ==@linaro.org
X-Received: by 2002:a17:902:e550:b0:20b:632d:27c0 with SMTP id d9443c01a7336-20bfe2944ddmr192609535ad.41.1728335894097;
        Mon, 07 Oct 2024 14:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335894; cv=none;
        d=google.com; s=arc-20240605;
        b=AUQLXgN3Noa3qXMqZ/GKiayI1/1npCCMQNGLrCT91Sjip0ZfkGb/pSJKTzj2e2Mk5j
         WpWe5rniAE5FDjZZMrAkoJueq84YYLsLrqB7pjN7bP6CGHqLY6qhRuFvW2m9uZDZbZtp
         wr0Yy7cXwXt0q5N1f3YKuL3bpTZ+bvqSAw6xueE81UAvcl9ESmjTKZL2xOUyS4fZb6TB
         7wK6S6+lLGdnTV5siQEgA8K9LOHImh6qoiEFd0mDwJ2RlX53KH0tt3Ep4Or8xsvlkXPx
         wZuInuqdjUVqM9tlQQrFuq0ISfKQZzAP1lNC225EJ7NAT793fz7CH2lN9Vv2GbxH0LFV
         n0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WUs1MzGBq8oTTzLkkmLgPiacHYjlN0lvec1dDM3ysJs=;
        fh=v+wkYXsczFFsLywUEwtOo4IKAV4aKbzMXF+Mr9+78iI=;
        b=EtmqkQOIhpH16/p2mWCRzA7/XvXKr+kKuj14uereHz6UmHBN4LlJlJct8N6SgOkdgI
         IeIwtxWz9JOaLFD8/YvJ83MyyGEFISilRDl3OYnOCNDzcHUJwviXHpWw3OXhR1BQTNuk
         szii2SYficcge9lH1ruW8QDJ+oaJOOMgDCJQqhG0mcKbdu/Z2duO+z07LmRURahNSCOC
         FFse2fBqXFYWsKk1wIGFqIhaBHq9MlwRMoEspKvUZH7Qm2PdqQlPgMkZEbv+3FlfGy32
         nuVLGBx98n1JVRPn2VCSk8zNtWsqDA1t+2jfQ+8WREezBr/Ki9khc+SK45e3KEHvI/yF
         zYDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VZqAeneb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138e1bddsor33367745ad.11.2024.10.07.14.18.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VZqAeneb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728335893; x=1728940693; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUs1MzGBq8oTTzLkkmLgPiacHYjlN0lvec1dDM3ysJs=;
        b=VZqAenebSuO6ob16P9J3eAsOy2J0lkLJV4hZyqBN55baWu9C8bEdwZuyaVzouPybmg
         LclVvYFXC1tXFiiAFjaOhJxoYNhDkxMKqwai5l0lGs7A71xldB2SX5WBLTr0lijwcj4C
         kK2dN7/uuoijty5pVcCDAU8fjqxGqj+414dMoV8JyY2CAGTczSZ4GpUcYG86EOV1Ki1V
         QG1XNY6kdc9JZdMkvECr0jIOA+nsohqGYgdIxG93M9F27yDy9yLDNOerMXI3muZ0bcfj
         vmryEkLxx3G3IvgWQPP6EUBHk4grWlsfL+WNjBcOub6RSU1spq6B+NrOnQOlVGgeKTSl
         BtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335893; x=1728940693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUs1MzGBq8oTTzLkkmLgPiacHYjlN0lvec1dDM3ysJs=;
        b=sDrkDceblzWGUTciU9o0X8RcPyM03O3YDDP6D/8v2QV5HqqBNDMFYBrM/cizpJD8GL
         CQEpysXSWKAloBel4mkSBlBm7V2PSrtWoKCPwGrqdUBka/g4FdXqTEHQT7VvDGQNBelC
         Ey6PlLyq3nZYugc2R6qfmxZCtmRrvE02bK4dAYmM6zZlVtCAnFmQCzm3Ke3rGXNQ5dSs
         QJTGw1MJDooYJizGdZZ0TY/do/A+3pBuSLJzQtweMI4nEmBymxhlhqd+8JYJKZFsrg8l
         21i4EobfJWhrt3c302i9suvwGJ/hxKkvwNJlIcE2qljYS4ZNOmWBSzL3wM3njA4tsGOw
         rD/g==
X-Forwarded-Encrypted: i=1; AJvYcCVTNZcYRgS1KX/aF8wsv1peI7mG0MnUxM8ZKVOeKqQkAekz6N7yB/Z7CAs8j7nSCmrivgOJ2/wpnRbutA==@linaro.org
X-Gm-Message-State: AOJu0YzDxOC6+NWjLHjE6NOjW4rmf931U9WrjaHhPJRWkpZjYbClqidA
	vJMcoV3WJA1cS954ixMxOmKNneCBE+3hrLBLf1Jf7uTstRiVsNE5PYbA5tHIqnRaUQ==
X-Google-Smtp-Source: AGHT+IHLjxdI73ZFA1uACTxTQR7LmFrpC2nLEP5ovsgcbR9VpKeVtrR3TIrUVb4iSlbnZFd2IgsyBQ==
X-Received: by 2002:a17:903:230f:b0:20b:bad4:5b6e with SMTP id d9443c01a7336-20bfe292621mr209530905ad.38.1728335893666;
        Mon, 07 Oct 2024 14:18:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1398ee06sm43758895ad.288.2024.10.07.14.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:18:13 -0700 (PDT)
Message-ID: <88485d15-b86a-430e-91e0-0225ddff5849@linaro.org>
Date: Mon, 7 Oct 2024 18:18:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] include/exec/memop: Rename get_alignment_bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TEw9D0jokulU

On 5/10/24 12:25, Richard Henderson wrote:
> Rename to use "memop_" prefix, like other functions
> that operate on MemOp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memop.h           | 4 ++--
>   accel/tcg/cputlb.c             | 4 ++--
>   accel/tcg/user-exec.c          | 4 ++--
>   target/arm/tcg/translate-a64.c | 4 ++--
>   target/xtensa/translate.c      | 2 +-
>   tcg/tcg-op-ldst.c              | 6 +++---
>   tcg/tcg.c                      | 2 +-
>   tcg/arm/tcg-target.c.inc       | 4 ++--
>   tcg/sparc64/tcg-target.c.inc   | 2 +-
>   9 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
