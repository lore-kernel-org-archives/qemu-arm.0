Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp4575605wrb;
        Tue, 9 Jul 2019 23:58:55 -0700 (PDT)
X-Received: by 2002:aca:e046:: with SMTP id x67mr2381299oig.3.1562741935033;
        Tue, 09 Jul 2019 23:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562741935; cv=none;
        d=google.com; s=arc-20160816;
        b=SN9e4vQKTJwISBinRa8Gqx3JVccZ/6HuS3qFRBq8Yb7onZiMU/CzOECOB6G1WrUr1v
         e3RA6hTjFj6OEqfSCgKitx9qyLqe1GQc98Mnkl8lTDGNhdcP1jNKFvZWkJQp5XLsm2el
         yPIygVdxdI9ez8yegmYbEfYZpJxaewhwj4zUbiUwLHB1Xnz5CEtdxWdeVR0U0ZRs7vbh
         w/MZjESCzkniMyemC+mBzXKUfMAc8DbURQDxDrK6UDlh70AkFhtF43GpzSIbhagA3wx3
         bkryMaXpn26ArmNV3kfVA1gerqu0dI4RDD0EWB7ruTEwgAhjAZq6HoJNcR1LSyCniQlQ
         XzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=XFC/MHhgEfE1Nr1X5gKwGHcvslnu2HFr4KUXcEkFuLU=;
        b=pWZy+nhmAAswlGEoeGXL1Hr0fVqpb071xLV3QLXVEs/N68rJt/rhYnjyUvQ94bZXwU
         oUcAVqnuqL2Lgc0Pl3t6xIJhMgmf/XLD3fXmRHm/wzGlBK8vYc5THuJDgOAuGsRv08QD
         YIK+ZPHpSWb21AF8kQa0URdKJvjaqb8Jn/kCktu15TIKtqDU6sJpkkQ9YvAx7U77qzjd
         4nfKp7YDrqQQFCvPrul6QWOI0D+CYt7geZNHbKwb5N4NOQ8+lt12Yp6Sr+wYv3FkZlpo
         Xo7Yp2tUYEfX7Qu7kZbNEZvl6N89et/vJBJgzrSYTgmtqhE//zDfAIFVBp9xpXGp7dQd
         0tMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QqJkLn2p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u4sor559242oic.49.2019.07.09.23.58.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2019 23:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QqJkLn2p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XFC/MHhgEfE1Nr1X5gKwGHcvslnu2HFr4KUXcEkFuLU=;
        b=QqJkLn2penLobTO8LA6zYjoP4hvpb/K40qkWaKw+EfybH9ukfJ/tDJ1t9fC6IYlELi
         pk4uBFy7a7UWU433quQrvwkXrckU6QGaO/YRh5NOO0Vh6e7Lm9ENePq+yJYMZ32CfxpT
         WvdUXe2bPJN3GHA5kx20uD125/yucMjDr6GBiDyUfs3HcOPZdKdEkETph5YwPeXfhAt3
         yP894fa7ByRpdi9J0SD+xNHqNCiS/SYaPSIiZpbBjLCtpoECjfmJt0GgKyUjI0i0uP1P
         nsm9v86iVOIBrdimJa9p6o50cvZb+SLuGDfccpx9gHl2l1ckKRL78OnUQn/rY4iERcKK
         t0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XFC/MHhgEfE1Nr1X5gKwGHcvslnu2HFr4KUXcEkFuLU=;
        b=nS8IXV7G5BwC++cXKsf4htX6kCTvCQW1M9fq2f99WheX6FE7Y6qA+ab4gJQiHZPkms
         GtTlt1eqO/gfOS7UKlaAGG68vDaJpl9ryIFgelVLiC/kLcKH5WZ6gZJx1oJEkqV59VUW
         0NX03xC3qXI5iz7vdQiOd1BhG3rQrKcvhMY8++SkQV2r2bUzJYc4QlNhIULcjVAqbLku
         DxdLBDeB3wf10hRXFi37ZLfAOo/GmMqVUJkOKUZxtGmNBA8nDkhakquooqEH4fgSIzjV
         O717bLqAQpeFThZ0Jht4/fZW7jB0ujv8RvBk8w9s9J/iUxp8viClGr/38zfmdwIagjmA
         RSJg==
X-Gm-Message-State: APjAAAUU6ogGIrRfYvaTuoa1Ta44n35gTG9qz/9f7937S1Xc/2Xfxcnq
	ZWizdbRSttsD/bSFytyzNtWL6/bT
X-Google-Smtp-Source: APXvYqyiWlvXOn9WgM02ds8lR8EvTJyN55e/d9sXN8XZrp+GAUg5yX9LVJptk09Z85aIfligIKaO4g==
X-Received: by 2002:aca:5246:: with SMTP id g67mr2224940oib.116.1562741934515;
        Tue, 09 Jul 2019 23:58:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] ([172.56.7.82])
        by smtp.gmail.com with ESMTPSA id v22sm571659oth.19.2019.07.09.23.58.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 23:58:53 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 2/5] tests/tcg: fix up test-i386-fprem.ref
 generation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Jan Bobek <jan.bobek@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2af01c5-bb85-e6a5-cb02-f73e741e5324@linaro.org>
Date: Wed, 10 Jul 2019 08:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705160421.19015-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: zVwAXjjli6MW

On 7/5/19 6:04 PM, Alex Bennée wrote:
> We never shipped the reference data in the source tree because it was
> quite big (64M). As a result the only option is to generate it
> locally. Although we have a rule to generate the reference file we
> missed the dependency and location changes, probably because it is
> only run for SLOW test runs.
> 
> The test still fails with mostly incorrect flags and different than
> expected NaNs. I'll leave that for the x86 experts to look at.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Jan Bobek <jan.bobek@gmail.com>
> ---
>  tests/tcg/i386/Makefile.target | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

There's nothing here to guess that test-i386-fprem is in any way natively
runnable.  Otherwise you might just end up testing against the installed qemu.

On the other hand, at the moment this simply won't run at all, since the input
file is missing.  So I suppose this is good enough for SLOW.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
