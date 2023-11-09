Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp817528ejq;
        Thu, 9 Nov 2023 15:17:24 -0800 (PST)
X-Received: by 2002:a05:6214:c47:b0:66f:bcc5:cf71 with SMTP id r7-20020a0562140c4700b0066fbcc5cf71mr6803234qvj.6.1699571843762;
        Thu, 09 Nov 2023 15:17:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699571843; cv=none;
        d=google.com; s=arc-20160816;
        b=MXQhozQOZF95V6gCGTeIceZg7ooVx1yZ7qrduUDj6ZJjCbtol2f9CzYmQ0M+6s+tUM
         n04+F1eHjh2Ow5y1SAVsyKhcfFiDb35vzJ7s2B8pog8BgfJV2umL5/IL56peETgtNIwz
         yIeBhG/ZwIprFS7UAoNJQ0kYv84zJAe/HvMxn14g4kh30BHfIUVfNsShtCea705asro+
         /pGBev+15yYzSZG3K5NbkcZfeoy3VSHJhEht0MhzSJE3MWOwd7VvTQjxt2NcDXuTQW2X
         9UUJjfyAVvYvbucCt5rEA5Owib3Np5M198EHv3gDYkjE+DkgRNw88j+zBeyvx0RG0VgK
         J+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x/zvy6M0WjzpIt4ulLJW5qm9XjQDmYpFtH6bXpIfrfU=;
        fh=KO9qp5vrO5C0p/B59ld7N/zoBnjvX6Ov7ZoNHWPT2Jw=;
        b=fB7oGhIW/Ly2hKrBJ1/Ld9vbsyyMsufR/rxwlDj3vC0vel17E86o4Z1aq0Lh1qLIut
         T3YFwb+8XEgfzq4zpNtMhpCLsvecgIrptOAYuS8TG02U5XGxqSh2N00TpRVyDL8kQ34L
         Mq1jb40QjmFgKFrYQcsTT9KJbKsE/1dnqwO6jyxyTw2YRUxynbxnw2UEqY87e5cBXkyn
         yFt5PfJBfB3GrogFw8fV8+Y+MCJsGtzCiTPENt+KU2ivKmAi6cXu+LDvwA+rZ2M13WGk
         fsDXHjmLx7/GShSszM2Ek6RCKdfRZsNvpV/7Xv+RNWsTKW1jJwdYFsqabQVz+d0GwZ3N
         jz5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FoHriooW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v7-20020ad448c7000000b0066da1c5f03csor2351665qvx.4.2023.11.09.15.17.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 15:17:23 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FoHriooW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699571843; x=1700176643; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/zvy6M0WjzpIt4ulLJW5qm9XjQDmYpFtH6bXpIfrfU=;
        b=FoHriooWJoDeyVI/QkBQr8gsAjOrFopfMlexxIzjKpw0N+YSrHx0YMDu+GnIQpeEvJ
         0CNTAUt4j5whR0w6F7aaXUxGXW3cueDViiSuxY0eXycyZxJuEG6QSXu86mQZDdmn42uR
         5FSd8zKauIt2uSquQSu+GCuyKa5vGO+N6biCmQ9uNV55YzH0JmGUzp7UUWMWpFTX53j5
         rvnMPICUbhdPdUIF5NB1J0uU9olVDi+rCX7mOv8R9EvVJQibN2N+RpTSOs6GEpMApXx7
         tY1N1hSu9ZXdsargpB6/iHpYOU4Geuo0s15FR82bbg1+o15aXeOgr2uLLXT0A/6WkfuR
         Tv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699571843; x=1700176643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/zvy6M0WjzpIt4ulLJW5qm9XjQDmYpFtH6bXpIfrfU=;
        b=GZErgzXBB8ixPo5032PQn6qDZ+g2lIhtOz+k33EmyHeBnqWmlAIpmhsAVvUMvxvNmf
         KHrawifB+Xgdsb2cJMDfiLJ57jJbcecQ25mzfZD2pg0KML5vYaNFhl7T3Hr6HJJRxiPL
         RL4NWMuQuo5V8ZCravQtQrUMtNagJK9+pE1CGNTyP1Bn0e3QW8zmDQ+syDcPEiXRmTLj
         4N1uBChJtxM7hrvTKswsiOiXO0YocchuMQ1oVJ8j+N7inbpiNdQYwNaAKQOCW/0sBlUM
         Vxg1Xcm2iT/XcS7K1Tt7653YTKVPP9Ye8Pu8Bj6v0lP4Tbpshk53Pe/V+JF3Ykv+aoIY
         ffDQ==
X-Gm-Message-State: AOJu0YwtAgWCXiLFAZKEDhULTt3qeQpJvx7Og6Mc/1PukXMNc0OBH7/J
	pzeYarkXEgBBslNjf99B2duTyVFr
X-Google-Smtp-Source: AGHT+IHgmW17V9aPFKhVe1o6zEMnv2hLFCHua3PwIFEeeQIPtE3qdHbAvt56PpgSs+IwXoW5aJUBsA==
X-Received: by 2002:a05:6214:20c5:b0:674:b63c:a67d with SMTP id 5-20020a05621420c500b00674b63ca67dmr8386524qve.58.1699571843306;
        Thu, 09 Nov 2023 15:17:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb91:1ee6:29b:6626:64c4:1b48:c565? ([2607:fb91:1ee6:29b:6626:64c4:1b48:c565])
        by smtp.gmail.com with ESMTPSA id v2-20020a05620a122200b00767e2668536sm279431qkj.17.2023.11.09.15.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 15:17:22 -0800 (PST)
Message-ID: <e499f176-d882-4727-8caf-268d72e06606@linaro.org>
Date: Thu, 9 Nov 2023 15:17:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 04/10] hw/char/pl011: Extract
 pl011_write_txdata() from pl011_write()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231109192814.95977-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3JTQ3iFX9N/R

On 11/9/23 11:28, Philippe Mathieu-Daudé wrote:
> When implementing FIFO, this code will become more complex.
> Start by factoring it out to a new pl011_write_txdata() function.
> No functional change intended.

...
> @@ -262,19 +273,13 @@ static void pl011_write(void *opaque, hwaddr offset,
>                           uint64_t value, unsigned size)
>   {
>       PL011State *s = (PL011State *)opaque;
> -    unsigned char ch;
>   
>       trace_pl011_write(offset, value, pl011_regname(offset));
>   
>       switch (offset >> 2) {
>       case 0: /* UARTDR */
> -        /* ??? Check if transmitter is enabled.  */
> -        ch = value;
> -        /* XXX this blocks entire thread. Rewrite to use
> -         * qemu_chr_fe_write and background I/O callbacks */
> -        qemu_chr_fe_write_all(&s->chr, &ch, 1);
> -        s->int_level |= INT_TX;
> -        pl011_update(s);
> +        s->readbuff = value;

Why the write to readbuff?


r~
