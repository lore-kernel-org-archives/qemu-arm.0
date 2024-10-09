Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1131559njl;
        Wed, 9 Oct 2024 14:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKsYXuJqShelqAOKYELU1YD+PFaIk5MnGCNmgH43UWYbx2mTtXupziqs9HH4ea9e9sZ9rdZyzr3OtEzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEYyp47MQq4GmKEVLjzUD9+Vzu6J5hXjmHuEGIUBABJOZzexEeg5bvf/itHZzPVE42XMX/E
X-Received: by 2002:a05:6402:26d0:b0:5c6:3ebf:5c10 with SMTP id 4fb4d7f45d1cf-5c9335538dfmr1024287a12.10.1728509380683;
        Wed, 09 Oct 2024 14:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728509380; cv=none;
        d=google.com; s=arc-20240605;
        b=djQsuMQlL22d0s2u+wIvWaEAKDv1mNoA0lO925J4E3Xg4ybv7LDb5/ZZf8bB0QOJS6
         NusKAG4tx5sT1o4GHvZg2SKtf0cjqh8XKBYMmXziV1gd1sLX3pS7ouFjYbVEpOxP/NaL
         9QExWWlF0vTaSoEEb+f8gkrEa+99dk0jqbZFXU2PjjVSAyS51Zu2pWqpPOhkiT+9719e
         RXhPkEyR/w0wDmHhKNugnBK7BT0vGGz5A/FoihVYwQG/VEeKElzqkMudv7q7+FqyPXG9
         g8jJ+YWmrYTGespsKV8D78dwLFq8HRTuKn1bABtZEXWxGidRzJXb5H5xXVdMdIHjjES9
         rVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Cktov7IgpjoLwvQgMG36+aq60qnsQb9DIXdfD6cis7M=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=IPlUU27m4KHPsVRokVxbwxuB3HJNsMeo1co4T3f2hypLLsg61i1ZvV2R2J5BN3C4Kk
         Xw9qp9z/b5IK8IPhTqdMRfwNapelL4es+MUQYJsyv4VrmTtq+2jeTcxEcCYXQOuqFsts
         I16r0qpTUh5MgMrDsUvHJtriKW4C5Qh+ivYENNK3SHwPUYWKLXYAXWtGcP75BSsHztlZ
         7c1qRvYn5AizTYwdtOG22cXQReNKedjKae3yD1WXGkVib/nCeowcn6i7BQamya0NHi49
         JPexO4Eo09UNinmzUTt7QXnGJXj1dkrI/32vKSml4LDrwYDyu3zX9K9GuQAyzjZ+8djH
         ArHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=uaCPkVVj;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c91b0f7a46si2109427a12.579.2024.10.09.14.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=uaCPkVVj;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728509377; x=1729114177; i=deller@gmx.de;
	bh=Cktov7IgpjoLwvQgMG36+aq60qnsQb9DIXdfD6cis7M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uaCPkVVjKUqAFu0S2y0lgbP7mezjrk7WatUBeRRS5PZLRPI+3CLNBAHnmd/8ALTO
	 o6X0wO0V83LlEGG8ETHg+bW6d4cRfJgq57GZCx+RbBAXloOsyZODjIpKOTiKkiqtP
	 H0kjaMSapm/W2QBfxOIfDZIKm5eYk2lgOf6z1WAn9eCMhdsAPhBZUAErzzPxI2N83
	 DZj83iiPjR5lnqC4/zYH9kEJRUSF1DQzRZbmhgpmUGNXIpBk/uDI14iw2diuGzzy+
	 PRV5Kwmt57+S6NeS9/wMI3XiCGKIiXLgZNwD3l1KCQS0FmIRI/MhKuMWM++vHwxIC
	 9OrQl4+/lHqXcQo6QA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1twLot0xSo-014RWq; Wed, 09
 Oct 2024 23:29:37 +0200
Message-ID: <703527ad-6594-455f-95a5-bb50e95b4f1a@gmx.de>
Date: Wed, 9 Oct 2024 23:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] accel/tcg: Use the alignment test in
 tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-7-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241009000453.315652-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Os1oFUYwRxSEqQHoe4APk+cVwrfkdQHvCr24H/OfUXb5AlEfvea
 Im3Z6XEZHZcZ3x6hXyQNmWHUfODCIjiToXr7/aJ6Ui5BlvtDexBha9/+hsJAIW5SREPxE57
 QU0Rlt9bbgZcQ2x1qmAEcRQ4ToSOCngh65KTlzKpKnB+scTYzbkrnsAZX7qw6fkC3IOiYRk
 HQBeJBhyRJ69bDpXlEYyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cU4ODWKw8sc=;ua+X+RenXvdgtik7I1AQJfq4bA9
 j5PEInPPL9lUDR9fcaF8Ni/YyKwnS+RkTt5/kBQL1ZLABL51bwbzwm8izJ/MVZegdwdN5oIOb
 Ixroak+jNK/7ksJTewe/CTI9YjtaiA52KTI9n2DHBDPy1f+MgGgPgoW/Erzfx6MEquA4Gcq77
 PxYL7gUv6a77lCeh/AZGg+j0DUbI9fETTHuj2dGg4GOb1o0ymrCWvJOi5XNnIfvnUOyDDyqaw
 BVNg0eBGGi7oKLFoFWrh5jUMSW9ChQ6+tOPLnDmT4R3E0Pd8AzsRVAHNqHhqctdoyPvBuG0Rh
 bBjFvXxChnoj4FNPtXAKwydqB0gBBC3FKNAQupMVQ2EUc4w9ey7XSsSDXU9KFx1jzZJUNADJU
 ihrL6XKrNIID4YT9V1AFHcpUOqq78zWIjMIS9GKyG7FP+SzRB8yANmnh7a/K8ImKxzc6ebqIn
 OTXvYXC2yA34yA8EkSMsXjgxs7GTt/r/qSsMwWLkmHBUDaG8r1tjVei91RlO+c3DzMu4mfJyh
 m8v+Jyny4BIppxGJ9z0cBBvrU/ETYk+mAMWgyTktbIgNJ9kgdvazlGZu2wPtahDwEap5y6L+/
 8ArthFdEuGR5U1lVVuwTWtsfvcAI7dR0UkLR1SFomfMVHP4hRU32Qj7t2c+AAqM13KMMi8Kv2
 hLXJn7v00L/mGxZNDWMMEcttTdeiNREuJ0s+YvIXa3hFY6H2IwplNJgajxX39y8tBYPPsEfsM
 ej5duaxKDPrJ2RyM4Xkes4CkXuh3gf5ldd07VyeWjkWICn3YaXBP3eVVi8XBc6RRWMp2uvUlL
 5vG13LHOQWtrhf8mctBmCFDA==
X-TUID: jQyz5cf/vAMc

On 10/9/24 02:04, Richard Henderson wrote:
> When we have a tlb miss, defer the alignment check to
> the new tlb_fill_align hook.  Move the existing alignment
> check so that we only perform it with a tlb hit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Helge Deller <deller@gmx.de>
