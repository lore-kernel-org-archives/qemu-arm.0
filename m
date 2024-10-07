Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2202574njb;
        Mon, 7 Oct 2024 14:26:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdAOtFKsF1rXNUKRO4UQX/MpNSkayEOzoLymsN53n30EoP3WYbKkcUqv/VQIUa77yZ80UhedUxv+FCAw==@linaro.org
X-Google-Smtp-Source: AGHT+IHA+XdJRfq5pl+o1PelLgYGHdIJQu/FtIXYuwbIskFlvGsAj9mUBGSjtC9wN2D5QZqW+/3Z
X-Received: by 2002:a05:6402:518c:b0:5c8:8381:c308 with SMTP id 4fb4d7f45d1cf-5c8d2d00fd2mr11707144a12.5.1728336385982;
        Mon, 07 Oct 2024 14:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336385; cv=none;
        d=google.com; s=arc-20240605;
        b=lcxpAR7WVR6hkt3H9SnDadzOgN/sYF522gu8Jw92DYAFO4DADAMRLsW0Q+1FgS9Gf6
         kEkAJFnCfdu8JujqfFOZXvNuqwFuZTdTa/im9aGZbODzFmIRVwoKOAVNYvHLtR74uccx
         v/OQlXMYZ36opM+HFamUsFrPlhVG2JsT2pW6YuVTmHUAyvoHDUjehu3kTgK27wZTb2Ve
         o8O+lFpf26WOtOHiqZ2+idJikOhAYGV3ywyhaOg+/6bkUCWuK7PKde5OuWjw1NIX1Gx1
         lzbGKyENcq3b3PamfjE/2Th3u/XzgzktpL9WsSTJcczZIfwPhIvYs9jshhu/MYpRQvDn
         wBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9xmTQ3MTHaGYfKNMFGOwKAEB7OrnQPo8rEImMyiimE0=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=etpJroDasZbgMsXvSyZdqhdwmrg7B9z7vTViWcd4rzabzzt/5AeDI2vC809y6p75l6
         uWICiM2xl1VZWwYgX5yUDOxuEWOpuxjcCPZ9z7g8sZTZZZq7CgN8/UldwmSn+7qIPjYq
         WTIZlubJz8+wHeWuktcbuz4YXeBj5mAInjHDu2uwfIREyEH9EPG3OEmCdmMM0IIleyad
         x24iYsrEiNcfnlj12H0uBIoCPV0CAtbUEb8k2aOGR0gf7bxIK7YjqPwdRU/W42bCkj7J
         oZdz79D6mcgCA9SECJ3ly530mNASLHcbNGMj4GAcuqyh/3jQMS9xPsVjyWjbKneZ9+jk
         /NPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=Rvmp78J7;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.20])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c8e05f02fcsi4653484a12.385.2024.10.07.14.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:26:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) client-ip=212.227.17.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=Rvmp78J7;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336385; x=1728941185; i=deller@gmx.de;
	bh=9xmTQ3MTHaGYfKNMFGOwKAEB7OrnQPo8rEImMyiimE0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Rvmp78J7xgXjBHartScHLsrJ2xoXYbH3t5dilflpsQPfeOMFvmpBwepVbc2Zxzj8
	 FDANatcFIsLUjvA2NENVR+2HFvLoEMJPdUVPo3r0oPeMMF7Au/wEr86kl2xn6Or6G
	 VR+k7x6eFwLZjc6/vJ7yKtyCCVrxr0To/SrUBD0paYUvh2khiwElAel28QObAOxfy
	 2OsA2D/zlHKKMogFYjVlli9ASO2JN9cH3672FNOunitG4CURXML/0CuG0Ih9imrRE
	 YKu8ku7dPNbVMZ6+lV/VuUR1Rr8166P5mcv93MQURVUKavikRszQuaUYzlRysX+QZ
	 NCvFteHZC3f0iZuT7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9g4-1tCFfZ154u-00D5Um; Mon, 07
 Oct 2024 23:26:25 +0200
Message-ID: <71ea154d-e4aa-4d6c-9dfb-d5d89f90205c@gmx.de>
Date: Mon, 7 Oct 2024 23:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/21] target/arm: Add arm_cpu_tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-21-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JAJ0OjAMb9ZDbCeq+sgTWHRGALHE12S63zBxJ37RKEmacI1b2z4
 ts1U4xdufUFvO0EOYGTmeOn8ogQOCirbXS38pnTDMe3UFw0dz7RvG+TD8k+94IM8WiqYjX4
 Y0x3U62oTahPq7rWxM8/aTD6woe1FvXJOa5Zrb/iDIWhZvGIq1qz1roGv+1r68MaHqt5km7
 vNfWerUktVYGdvLpMDvpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4DGfTGgMgws=;kADFpI8nnwRfK0gIDXE6ebrR8fY
 JSxkpTN/flu0+WUF7WQLZsfWjfcj4Ok1rcP3BzcF5jp3E1N7UFsetJ5bDhxbW6jlrHT4aR4yB
 i+zZ/PQU5+BKUfuGqdMqDyGDWfyKtM1LkF+EQ/95QNiDCvGXUbu/u2Z9A3oGNWHbwU26SxqKV
 jlcELhySE9Y38LTOvqhKdf9AqpPnNHJ59+8HJ8k+N8HR+CWePDPePiIG0+onjcJ2Iu2evP/p7
 N7qXPiqepv9z+bBmfO/OEK5a79y+mjsYyIgsK7ruJS6/BoZVQA9r8ih0bdWHQhpsiGTNCZHAx
 /7e0kl3rJPlXjzzXq4e7GBI5xkOXahXbg51+TLAyjqmz1/tGNySQoODB51MYah1XRWQkl0ZJA
 BgTspoYg6CtCr4xNHduisdbd0uYeWUHwMN3YrHJhTtkXT1L7WoC1Obo6QLgNLce9q77h9Hipv
 D4iWptWm1sZ/Pa3ApDrGvO/6w5/7di2JxbtxZzu/MV0PbMR34p4jC3ZqKU3iIyiqCAG6sj6Dd
 f0eyN0oBYt1uCpeO87mkSJjPqnWe7EscxZxIGD2GYgZGNLDkOOTWdOgWCGMEkud59Gd4Lo9Gx
 Jyqtnsx2uoQFmlA3jSGbwHhnEfxlCC4VBEM8Nfmrp5Zdn+k3aE44PTHfUsEv7ShIzOnI4h7bK
 1DdrwqOeqfQYrtv6PjxA6xPPUAbGz1FqFhywzc/yc3XISRtAHq5lgzJktbS74BQ4LQcwW8WdT
 nPnRQSCuo4a8/HHdCXe6DGn09SpK+fRhXuUkdXezAxSMjyhKsOtMm17kj4ccjVQYJj0oRQzSb
 RG8J/BVGWqDieCOfB0cWQe1Q==
X-TUID: i3gbMhxHKTZJ

On 10/5/24 22:05, Richard Henderson wrote:
> Fill in the tlb_fill_align hook.  So far this is the same
> as tlb_fill_align_first, except that we can pass memop to
> get_phys_addr as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   target/arm/internals.h      |  3 +++
>   target/arm/cpu.c            |  2 +-
>   target/arm/tcg/cpu-v7m.c    |  2 +-
>   target/arm/tcg/tlb_helper.c | 27 +++++++++++++++++++++++----
>   4 files changed, 28 insertions(+), 6 deletions(-)
