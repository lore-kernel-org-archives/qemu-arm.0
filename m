Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2197784njb;
        Mon, 7 Oct 2024 14:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXbPkFTWuqxlQI6tknrwNVKuVhwK3dKS9b5ae/RD+4UOU9GglhVb7Oi8/7B+0RZcmuvHL2BJYhvAfToQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFqlhv4EcUTIrq4AKyWHSNVzcN2NIAYF3kP0NspeswoLzvBqvvs1/8zU0ZRgO0GvRyuLo56
X-Received: by 2002:adf:fac9:0:b0:374:c481:3f7 with SMTP id ffacd0b85a97d-37d0e6d8604mr7553498f8f.6.1728335621351;
        Mon, 07 Oct 2024 14:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335621; cv=none;
        d=google.com; s=arc-20240605;
        b=F7M/U/OJl+SyN2bKmaC2pH+prjJ/pvGDznIcayttnJtJ7VMy37Qs1KhE81EHL6sWG5
         mehMlf9y5WXVTCtyOjn54SdnfjSvH7g7gFcSMC3NG4Cmgtj5tyKBslwrbJGM6n1W6ou9
         zHabIIsQoPDFxlioWPWVgEJn4jSLAGnuwm9CfMFlFOwofCADaL+aFkPA1xuWO8eTO+G+
         K5vUVnWekqLJagaf79OIbx3FfpsgE6EAYW2AUSTLoOgOn+lCVM5CToNKNe9HoUkiQuLm
         OGZPDn5pkB+6F+V11OWsp3UhhsD9rGcuODQlozREZ53aW6WnDfoCWE8Mwb2hh46qj4Ig
         yEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Pz5aP8rM2IkjmDqGJVSZO6hFnDGmCcDZPRR0Xl8N/Lg=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=gtRec43y5NNCI+pAC5FIFga5zchcAdrx8S1mBpjR9iHPkl0vsQQCSX2aLNdLH1Sc4/
         V1HhGJ9Egwhnj2aMEK1O+i7L+GFKoAvpJyrAx2b5kygVIGZ3LXbi4dbfUjuf/qjr/ODY
         Ah3ciRK2aXPwFuVpGPeBp8KBuWg1osQgrhzuhmub4QGvp7sLiKxlab+5O+tNoJ64ZsQS
         Lmkzc08f5bYokMNzRwbQPNNmRITIKK0rTWU08drcC7EYjNSLTS3Hc34BPIqyl8ZTTFOq
         cz/c/cd0hXQ2QsVp1AQr4j5ydNJU+pMJK4PsJEsoGgF0V4FEjnucAzIxVdBTXjWINP8u
         L23A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=AHtyEj5z;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1697730bsi2791942f8f.609.2024.10.07.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=AHtyEj5z;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335620; x=1728940420; i=deller@gmx.de;
	bh=Pz5aP8rM2IkjmDqGJVSZO6hFnDGmCcDZPRR0Xl8N/Lg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AHtyEj5znbElMcpcboPDdC/Aucx1e95B5esfZ9BT7HY8OFNpqzkC1S4tT8n0IUtf
	 EJjIzc3RRNXMg+MlxfSP/6D5r8UzdmDdEouQ/nTWxlReEjgUbnQy8vMHDpbk8LbFC
	 AF1K7elP4x0COQZqBy53PgN9fcghMiQNx9nFV5AgxBpYzjjzgbADS7XTMAR20NNL4
	 aRavC5j2A2sV8rlOBLt2udwW8Jw5ZFXLHTX9THUhy4kVqHQFkNN7j87lTcYWxiwmo
	 BKjNteszchQF2BqoYzZehba2eqEyjuw+FHR8FEye5OrEsmlNcq5klAu1T5L0x6dYP
	 6Oupa1WWDDFiq61qnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf0U-1tgdXC2afq-00mfrJ; Mon, 07
 Oct 2024 23:13:40 +0200
Message-ID: <6df44ac0-72cd-4623-a810-66f8d781ed0c@gmx.de>
Date: Mon, 7 Oct 2024 23:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] accel/tcg: Use the tlb_fill_align hook
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-8-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w34hSYqPDYn4tdrjdLnz7tfaS71dn/GNVaP/T6ox3AQ4CsFkyiv
 wfRQCdLSjJn4c5bQJpQax9y3Hg33fkxXQ+8gxIkXVteNRxzFm2w9dcJIOY3juF2OsWPuEGT
 MKOZzFjuRpWuxBL2PlFQ+pH3LbS2I7mPgVzSZvkQuYSS6BmvKfHJC90iT7FHGbByEx80n+M
 RR9o3Im1aSG94TkU0KYyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hpXcjcPchdE=;yx8cwG4AtgnbjShREQbolJnZ/Qq
 SotXILWpAHNi1EmjHoVs3+wIfOTRErswxv2CWvu7GSULt1Z0y4w2cqy2aFkZgY86Zrep+mOUn
 u4y2uuhdPjpZAvxeDVdeE7a5VQ3oE5eo5AuZClYYhHPrJRVxStUY02Y0vAj/rcd7qRutXBN6v
 e4PO+B/hwCFbuhm98U5L8jocApqsqhJwFbCvCwZErZU2dKvVIo1Uh+AklO5tBK1tQNa3gn+5Y
 hcHnDjxxkuam+7Ek1YFZ8oNHBLZEZHuTRgdcUNiW0fPLyoNWlD5m34rv1XTx5aJdtq62LfvHh
 VkFt4rvAtnle7tMM8m4euOfNDcWV68yck6wvf0wZgBj+kw1EEkfyxi45q6K4TL+tIrggXrt/o
 FdEeGB+89fXOS5X79hsH2mIAyk7AHSNcbFAs3ApDygsVrwU5p3B4hTnqBcKO61p67dfu75qiZ
 +ptECvKVMGwVJF9f78rlyQwlQ8+xcW0KZVsjMyYuE/GZzeYW69nmy3pAwf6eZsFY8/zLxjQGQ
 8JNCQ28ncKIFcDD03xLtZUf3vqP6JYmj5/ELI69i8b8pGBPZmW9CxPrRS5MD7h9DHBChWxigW
 Psv8dV4ozG5L3RWwX3ABJMV/LhdZ36dypzsFQwZioA+bJmL4qaHCUAg9F+cS5KPCdS31vRGAr
 4newGJIa1+rSK9Ufe8uJIouM2OM7C4hyrFkGrW9AVjooKY700gGf8fMxlHICe8XSNA13kBGWF
 2qDUrBygxvsQ2jS378VlLna/wffRPzoMLwxCRlJj6IUf9dZN5QD8lSzEy7SQIjsU8ZXCWaPLI
 j+w2K6ZpojY7Cp+JDtyY0dfg==
X-TUID: DZKOcikcH0nP

On 10/5/24 22:05, Richard Henderson wrote:
> When we have a tlb miss, defer the alignment check to
> the new tlb_fill_align hook.  Move the existing alignment
> check so that we only perform it with a tlb hit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   accel/tcg/cputlb.c | 89 +++++++++++++++++++++++++---------------------
>   1 file changed, 49 insertions(+), 40 deletions(-)
