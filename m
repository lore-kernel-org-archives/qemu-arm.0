Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2190751njb;
        Mon, 7 Oct 2024 13:58:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaiKpgsd74N0ZQse25PNywyI2nV/bQVtw2vjIFdfiKhV8Cc/cgh3i4UugRP2ZbJzA5p3wyi5SM71gZ2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFrskf3f5GnKN/us0sYRT7n3rddNX9MYh80jw05Fsk2mqemtP7fGy6lskhZsQ4uvEBQLUnW
X-Received: by 2002:a7b:c351:0:b0:42f:310f:de9 with SMTP id 5b1f17b1804b1-42f85f1429dmr82410895e9.15.1728334726842;
        Mon, 07 Oct 2024 13:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728334726; cv=none;
        d=google.com; s=arc-20240605;
        b=VxCWGlhn4/cry4l0aYAQh7E4as1IP4t7msZwoa5UiP9N1na/LibWGjom10wMZfvwOR
         Ght/WDeBwvLZbhtwhYyalnPG7Rpxmn0NE0ODduyoft2OMLCg/watfd5FeHOekgEyFoas
         gB5OeHprcKKOooGc7a5eS/Gy6GhEY0KNWqVhqW4Y9BBjQv1vgC7UPqVVvJZ8rnoTv5Xf
         qf24dxtA5xfApSMqUzkPVAAfFrz7QoImIgYI6uw3Eze3L1Sochpc9Ef7FiQbIk/JseXS
         JKrvYo8ji+l/w8ZC6sS1Vlxmhka0NpL4HlOXlXzXWPRgqivFKtqG9Uekt284+oL5c1Df
         qreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=GAlosL+TJZgdrXiaGQlTc+iVwvN76V4OIg09yn92x8Y=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=GV/eRk9TmSyCIAIBCm920gU8ojD04r3LOexbmQubC+6Ux9tlBFYKWOcoF9AiPAXX/n
         Um1ceAXDge3dEnyhaitPoONBd/hZKmAktvhE8MLvaWdJ4TOfRIwoO1mci10FI8GPOws3
         JghI/j2GqHbb3lfXerOXLcTXx8caS10kVdw5HKP7uFqcQt9ya6Sdiee7jh79YYYumJZr
         czAXna/P3zFNMBYF+EdyRhktefik69DVxpPDem5JQQT52PS9TZmc8bmx5oAjqgKcVhxw
         OZeRr/wpjnQr24q3MMgKHNhOmUYu+JkcdSRHY5qSgi9ZOFFL64HJIXaiTQVfZxBD+UnI
         yDRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=fb0oyfjr;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42f86b5250asi39989685e9.209.2024.10.07.13.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 13:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=fb0oyfjr;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728334725; x=1728939525; i=deller@gmx.de;
	bh=GAlosL+TJZgdrXiaGQlTc+iVwvN76V4OIg09yn92x8Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fb0oyfjr/SmnrrbefP12a0rmMJTI/XILeZspDRcMCYwOq7QK/mBG9a+SxImM4V9v
	 FDlmyn3tepyPI9OaFpMZtVTNHr2WpXAGIPTPPhvYT0ePqR7oJxvqTGA17lrErpbkt
	 4gkNAYu8SSRtpFVFMbCDfH112N9lhLr89++8VgJ69wW6+p7llxh8d2PNrv0Kcvabb
	 eE81K/9uGBCxD/hHJUMxp/g/30D2mfsUKPPmYj75c25WTqxBIz/qTYbcRh9GHTKFz
	 xFBSvAweGztGFnBBGS6B1HVYZqLd7xWh//sgCj/S5LjPP3cPnzD+JgW/akftv5+Uu
	 3c1iX7BYRuh7qjCuqQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5vc-1tJrYD1Mrg-00JY4m; Mon, 07
 Oct 2024 22:58:45 +0200
Message-ID: <90c11001-d395-480b-931c-f61c399562d9@gmx.de>
Date: Mon, 7 Oct 2024 22:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/21] accel/tcg: Assert noreturn from write-only page
 for atomics
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-2-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mvgWx4FlFZRRT4DudOSzVM0Q2kNOMrbekljjhnk+yUCLvmz2mOt
 6g29UnZFQQfRJZyPhbgtbdbctOMxANHvUs5nJ2cyZkNYaq3TfqxpJbMb/lge4NFFAI3566h
 nANFg1OINY6Dzpud/f788ZcmC0pg4pumuxhGkwqQIdbyI/4CokD8h2BpfIEQa6XpqWUIWsJ
 CQbvPDIFmnKuc67doybVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wUmcV8HOFF0=;jx3xsDnzCqnEXKep66YVugo+4h5
 HxVFGV2X7oF3r8j5gHXGndFzFejH7vTvfuCqV9msNXl/z1VJZuEWXAFvs/KHenMvssPFfoy+5
 MzEeBGDCumR0DQiV0ktSX85y7gRgjwpfroeGsDD6blLrJ7kYjjfi4m08c1voBUAh91VKFC2ny
 LsoV1xaNoVvQoh86MpIIMAE5VS8IiDkxLd1uCzXpkTYOCW6jTIYb/4G9NpHDvKPcXDPLoO7hx
 wPy8OZCzUcTOFrdcCAS4qaJgMZ7M1ketk6+US8sLKwdhvCqfLV8Of7OHozx0P8OULEPN2P+k6
 X8ZnM/6R1eCgh/89tFY/aLU8itY//NLcnlb8hYkh5ZvBKJU5EnjfHdhhHIPJN3qLqeGMjoYK/
 fIAtq0kmvvAMUkYQ0RIt0HFENNQjo6iMyhlv8oRjqdjqp58sm14E5HNpZc2Ocy0fUP9zCTFUH
 IRQK60TCRwJhl/NPRAqP2SqhxW+iPWtbD8uib3E6MLpa+akcjLd0Bfrm+u6Q6JB1SDHPMVvy3
 2zHLCprPrC5xhdiHzh0DyVO55y8tAc7RiL+6xl3XGFVY18PXI01iFPj/HGM19iiZbHG2mq26b
 4wd4mAbi6EqRbrndfO97HXzJpaRXn5BzbaPvbdrZhQPLVlZf+By5LWuKigJ+zgtiD7GKeC3sT
 Kg+extPKU1jXPPu6CGEdTnEsrUEBrH18ScPNGkVfDaW3nHAsIaGxwRE0tnfA+ERNeMqY++dXs
 uPseZxTs266OMZAadfmjz8dZNlEyb1TQfssLJKgCymRi6GV5OEkM7J8CRarJrjV5ixFLWV9jt
 AdQldML8bto4pN2gck4uZauw==
X-TUID: /rRG56Jhefrh

On 10/5/24 22:05, Richard Henderson wrote:
> There should be no "just in case"; the page is already
> in the tlb, and known to be not readable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   accel/tcg/cputlb.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 117b516739..fd6459b695 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1852,10 +1852,9 @@ static void *atomic_mmu_lookup(CPUState *cpu, vad=
dr addr, MemOpIdx oi,
>           /*
>            * Since we don't support reads and writes to different
>            * addresses, and we do have the proper page loaded for
> -         * write, this shouldn't ever return.  But just in case,
> -         * handle via stop-the-world.
> +         * write, this shouldn't ever return.
>            */
> -        goto stop_the_world;
> +        g_assert_not_reached();
>       }
>       /* Collect tlb flags for read. */
>       tlb_addr |=3D tlbe->addr_read;
