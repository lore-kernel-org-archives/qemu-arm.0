Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2947796wrp;
        Fri, 20 Sep 2019 15:09:44 -0700 (PDT)
X-Received: by 2002:a17:90a:65c9:: with SMTP id i9mr6948262pjs.54.1569017384066;
        Fri, 20 Sep 2019 15:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569017384; cv=none;
        d=google.com; s=arc-20160816;
        b=RFKq6cJyhP/vTLVuMepSFDumLfhxF2dUUAtUYeNplkpjtB68DXxkrE0DvktaDfr7AS
         Sr3k6FZLy9tMJ4wro8WenL6AhicwX2gvPMeUUC5+qBniluqbTSxWkY38qSO4oMH+DuYO
         I18f0cFAMoLFimbD4almd64P9rLtc0+TKf4XCkH4Gm8lPSI0SHwygG7mWS8UEGXfhiQR
         5L0Iqm19xjFfO/f7Y2Nu37Z61ZvBXeKQAjMeyeZ3qd/OCmfvu0s9InxgDVJ1d25qKLpw
         aZD/lVmt5xXcyuHwTEmZEuQ/pZz6sF8BSmi/0YnYxoSKoefHD75b+4xxpMHJBwQFX8GJ
         VurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Xq6CjTsGZJR9XwIXAsothWRRID2FfNd4/CnJWbG8XTM=;
        b=rXaHL4sSMYPJvyk3aidtoLpfTLZoNO9yTVgcvIzliZ0PPU4We0AR0qtMx7Irwt6IpK
         LBUMW1XQLhrxQABA2FR5BMBazkOG6J2lAW34vHqayzC7DSjytl5iCS10H4CsVu0lPuT9
         ERD/u2i8+yrZB8eDa3yA8bC4Eo7c22M6kIXAFV0cd3mBOKUZX2WSKRQBrKXEcb9dr5fy
         2jGRD98WRi2l9KvauXBkxxPOBFAvuMIGq+ZHkagOloX4jSVmcFiFrCm3klJdTWJk3N4V
         lHoOPFGqowN/70njo9CzVXfHsDG5EbQKfx094nYvJFvOq66fusLw8n/2Ks/tihiuPv4g
         eAFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wydt88o8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m25sor3079862pgb.83.2019.09.20.15.09.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Sep 2019 15:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wydt88o8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xq6CjTsGZJR9XwIXAsothWRRID2FfNd4/CnJWbG8XTM=;
        b=Wydt88o8wqr9s6XOMuXl1rGL6qL6HGEF3+opEmxczu8NZuMzPKPMiuquy8fXQWY0qg
         l7vuSspLHTPzhoaG5YNumwuE05CGagRwls+ttmxKmAkueKos6K+453WZmFJcU//b8Wse
         TS9rOZ6BXnPuEJAL8OMtnjHWpbB36SGP50YiSmhFvd16o+nSjgBOY1Q5PXBPKrSqk9na
         7HZpkOZonKR6AgLaUcn/WNn1Zyu234WBCuWyBOWhHRzNe/6TXrbApp58WSxmMk1UTxdO
         UtY8EPEN/32fft32iiov2H5qFVX8sbJvomxzZJSt7lfuDmUPxpKHKd2Nw5kSzdL3+aJH
         spjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xq6CjTsGZJR9XwIXAsothWRRID2FfNd4/CnJWbG8XTM=;
        b=VK8JPNAJCsOla2cjB0OdyoIjQ/esbCUxb6E7O24E+EmPbjhFacATixMbIskmhleH/c
         SJHDR6/LLb87ZKhzyotMtbHEvaQsEDYAMpux74qWYwx2HpxHObdI79xA0lkRkr3odzzp
         0jKDsJ0/mD98m/m2m8RvR3+WJ15iollOQoaQCH3XAjVmoty3VCRK2v6lS4SfRNvnkqzt
         dbz2uU0x36K9SsGqQynd8AAuMf8uedkwnUcaR1nqrrHWc2oymtkxQ2g+SRbSS7fHYzIs
         WdxLwnypnEQM8P1TJhB5bn6/59rkxUK9CgUkJ3QdMTqA17beddWBZBxrKMoYlA6Rzd3b
         y0Ow==
X-Gm-Message-State: APjAAAX/IPylE7c5+A8FzryNoniwJW74jsdNIcWuHuis9NWkAKTGhaGM
	HSZJ1r6481QhuGlSQ/f1BWI2o0GL
X-Google-Smtp-Source: APXvYqz5JelNdtvqL+XIhk1bmq9WBlrlX2ISeidqgXyz7O6rOYDUVY/H+U2T513vCCkNd/0abesKTg==
X-Received: by 2002:a63:5b23:: with SMTP id p35mr17082669pgb.366.1569017383421;
        Fri, 20 Sep 2019 15:09:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id v44sm3832336pgn.17.2019.09.20.15.09.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 15:09:42 -0700 (PDT)
Subject: Re: [PATCH v2 10/16] tests/tcg: add generic version of float_convs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-11-alex.bennee@linaro.org>
 <c6cd971c-e84c-c5c9-b313-2e454e02a1da@linaro.org> <87impnz568.fsf@linaro.org>
 <87h857z32j.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0b0c45c7-4b9b-0d03-01aa-25a689a8f914@linaro.org>
Date: Fri, 20 Sep 2019 15:09:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87h857z32j.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: m8Hw67+2V2Ik

On 9/20/19 3:15 AM, Alex Bennée wrote:
> I can't figure out what is meant to be going on with CONVERT_BITS. It
> seems to be implying there is a direct relationship between status flags
> and the exception disable bits. But that is confusing because integer
> overflow (IOV) and float overflow (OVF) are different flags bit I assume
> both suppressed by Overflow Disable (OVFD).

I had failed to notice that the kernel routine plays with INV and not IOV for
the emulation of CVTTQ, so it's the SWCR_TRAP_ENABLE_INV bit that controls
whether CVTTQ/S raises a signal.

Will fix.

> Why are we doing this magic 32 bit shuffling anyway? Is it purely to
> save 32 bits of a mostly empty lower half of the FPCR register?

Yes.  Which is not a great answer, but it was done years ago and there's little
point in changing it back now.


r~
