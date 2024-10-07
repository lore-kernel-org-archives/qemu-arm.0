Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2200226njb;
        Mon, 7 Oct 2024 14:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMdK+ck1evx3BBPHF1+HtXrWxnQH36PoWh0vnObfoMBKHrC05H/UvLN6r6yXHhWkohvp6cC1UHeV3rGA==@linaro.org
X-Google-Smtp-Source: AGHT+IGPN37lF+SsCtaGSYG3GKZ067WeIoKvNj28IeIjApp6Dmo0PtDld+/yZcMiGkjyf5APezCD
X-Received: by 2002:a05:6512:3989:b0:535:6925:7a82 with SMTP id 2adb3069b0e04-539ab9cf274mr9320608e87.41.1728335989056;
        Mon, 07 Oct 2024 14:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335989; cv=none;
        d=google.com; s=arc-20240605;
        b=gDu9e9EmXy5LmyywrkOJVT6GufRFeTkjeUXJXQ5KV7bnSejgr10x4PtYECbo0IyhyX
         8PmhHHF+Z0VQjoZzbdT5enm3RlfzJpmcMvmRJegkvR4HpXolAYtTsOwfU+Xwb3jCvFjn
         T/I+HZ7P67QHTZohF5WNXxiSHzkdw3dlRrPZwEY0lJSPpL34pNGZy9IQQ3mBf1n+0Wg9
         MW2S+KORNuIamrMuR0Zu0Ai5TD22tuP6d1BfsXJSzKI666lmFPPBctPUwAtKC01abHpe
         8/HyDtjNXalvLRfrp3I+XNwhLaIx/Jkk9Eekx68UU83EYEPwTmBbArEnk8eZHywZG69W
         G1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=LWO2T/Pb8/YNscpa9TTq1B/pI/psKixxkneHfn/6zxU=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=iJdhYbIHlkpKmYl7ZR/ZPkQ5HXWp1+F+m7vQShGOjbGgONGRA6wg/dIG21z29Ek7B9
         HGhwV8XWK9gRSfLzze/toiqPUGYMzrTTxCDOtusgX/to1VCLu7A+pjYNPY/I01zz2dmW
         JkUCBpWgTsAuIO4pZgEdfWm21144NiYMTuwfZiQNNX8aVfVjQQlhKBiWkCfc+nu+keBT
         V/6LgG8iWR002oXDkJeUcApJLspBZiJXiuh2LAxkSxOGxISiFlD7AO/kcAwYRryLTGGY
         MrPvTzbl2E0oAO4VygVwjJ/lkEtF1x7hNRT7p3yVWhA2LaraU2JdBk5PWYDsCIT8FS70
         m97g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=Y76qgj6h;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by mx.google.com with ESMTPS id a640c23a62f3a-a99577d6760si195454066b.971.2024.10.07.14.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=Y76qgj6h;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335988; x=1728940788; i=deller@gmx.de;
	bh=LWO2T/Pb8/YNscpa9TTq1B/pI/psKixxkneHfn/6zxU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y76qgj6h/LJAJVAMEQ/yaY2tdtD8Z0X50fOC8foqBB3PSuqn5G5bboX+ff4+hg2z
	 is4vJerjfn+dhenDoeKkqCatkOOTtSt7WE9n8eIzEHlN38VzqGRO20/NeaV5Dy3Me
	 PD3XdBr974o+Tl9an6g/XSIYmOeoCFSL8p83GdluSJtDPofSZTZCCWL58QuE1cNkP
	 xBu8q2ag1+85oKoKPA+BY1etOhPCYyvZMlgMI+BBut+uyGHyrZ7W85c/FreXRXpZW
	 uwg8s4vukyrP4aS0RM2WkZt24FFbkp5ls4WAeuoBjn2qFy3G6Edk6UfH/pViq3/iR
	 ZmEKWcmc/BD8314MbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsUp-1tD4t11buZ-00B7v7; Mon, 07
 Oct 2024 23:19:48 +0200
Message-ID: <2878d217-0471-4834-92e2-59dd1ffaddd1@gmx.de>
Date: Mon, 7 Oct 2024 23:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/21] target/hppa: Add hppa_cpu_tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-13-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3arFgz8tyZpMG+f/IJy02SmN8P/6cnxgbXYTVLQf5W38tEyTjpF
 0wDpi4EjD25KKzKXQHzniyIbgt8yeYTN2tnUYD2vf13bxtMHG33vueMUJy/DB70Ddak7lEA
 mLFtcBUH8n7C9u2cxXOqj1gNH6olMCxXGDqYQZD6NeDdH5PNjtJWrJSK70Nt8HIB2j7e3IR
 aGKysCGeJLSVxr/lblTow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EDk+wYjsWKM=;oPuZbntgOLU6ULHuC4WqDY/QNLQ
 NyEBopRsETAyiqDU0KJPbecL2HaS9HG4pXm4S6QP2JODaiJy3t5y9DovQ1rq4+WMZJ6ybexeU
 +dXEUT1hmMoeDI/byaNYTBRsPeOx3EoGnhCZzj056UM7ZIl1iLW2NMIxAPZwFj7YumdCdQHNZ
 vp+nIvzaCEuI9LTZbt9+ye5cixghmh+LLlFtGxUWwREU8yO+frTguY+ULHTFXQurYG6xTQ7cE
 Vnn1x0hvFvKZdQy33HWhkqncFtbZtKRmaV6ZYYhRFcVX6Mn1l777mZ2HpjGHG+mIYFbdHybp+
 44/iHeVF1l2JIQkM+0ShsWselSKlK+WSirlE+Kw65smwyfPaWTAnQ9INcI6nZOTGEaz/TD0JZ
 3FyhPi6BrjcIDr3uvCZv9UrTjbk2jBw00wBZDEdzzIO9Io2Hf1nbCEsmu4s0wj2tT1Q9TbJmR
 hsMLA9KrzUdPaQFfcWu/ZfmSPz7kdpjAQAfBnk1p7nFKF5o0zDc3BhHjaHp6d9U9Qp0rcUjO9
 a8tWY2qDj3avg5abXPLZF2lvNsGsMnmODAsjfw2syQSodeQoLdIu0DCeAeKLRFaprGWA3TpDs
 j886oEYSB0IVudh3I36YnmSJnnJ2neahlHB7tgDyL4/tKLaxMIY/fn/XWhBG8aGi3SjJ7iiEW
 Bqc28sIa41uqrHJXYwjVIVt6rm9G+G8q+cZbzeVz63235++ipvk0HWgYj8r9tc7IC7LpZaM6p
 dCHGov0QKXOF08q5KSLHbfWAIA6vlzWD8L0Lve+B/EuqsKunZYCbiqZw18iBUmgyCM0sL0b7P
 wNleQ+JBpt2rvk+KrZSqeyvQ==
X-TUID: hS1/WXeDTEFZ

On 10/5/24 22:05, Richard Henderson wrote:
> Fill in the tlb_fill_align hook, so that we can recognize
> alignment exceptions in the correct priority order.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/hppa/cpu.h        |  3 +++
>   target/hppa/cpu.c        |  2 +-
>   target/hppa/mem_helper.c | 16 ++++++++++++----
>   3 files changed, 16 insertions(+), 5 deletions(-)
