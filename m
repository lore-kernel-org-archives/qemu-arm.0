Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2200990njb;
        Mon, 7 Oct 2024 14:21:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3it4tgS52dLloMGGoTKHO6NIhl9jJH6AxVD8zmOcJFePF5GHY5aE013QK/LHj7grgiZPLTnoOBFkdLA==@linaro.org
X-Google-Smtp-Source: AGHT+IF287mrazQpd9X8JyUDDZdcQFjH7RPZo2Ro8E4qQKC0z34RlUwlejdJgAZo2W0+iLI9V2VG
X-Received: by 2002:a05:600c:4ec7:b0:42c:b9dd:93ee with SMTP id 5b1f17b1804b1-42f85af8d63mr115268135e9.34.1728336114249;
        Mon, 07 Oct 2024 14:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336114; cv=none;
        d=google.com; s=arc-20240605;
        b=Osb3AWhPNFlOxglUeqkFCQjUA/DcT52Zt+AAFoGCb9lqM+k7+PERUCgWZCXT45nVeF
         RMwwnOWJVXg1KN9TFSdsAG18Hq/cweINLfWZIBeBhZ9EuQy2u3rKOHfDHonKYlRBaI6W
         MyGex71mkb4PQpe/FvNcc/nlv3vcFdJtgWSqyCiGwknZuT95uPK0JnoZJqN8s/lBWajW
         ird3IFDZhXTBXxR4cLwbfDCZnDv2UotwPKMSwJr0kNT4X59pcmsx5xQyo6VxdfNqx/QA
         P2YKZo3uGa+FJpJAkT+6+KnVkIDlOhvCquuBqphW2HKhQnjRi1B8kpQyIg61jRRnLRw7
         3q+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Zb51eK1HZpsRTx4SDwRI+Br4VZKKuygt6kB2EI7yznA=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=GXX9/cV2SpfZZ2HCaxar6uBqUJQ/XTeEoP2MQwPwtdZcYDeJtmydQleqilWVz+RgVo
         v3INo/b+kuOOzuUgDMFdI45vMoLeZJ5iXTNTqcWT7haVemfxN0d0XjPdXeGuLVI9RXUO
         834eMONpqk9pfCvr7PgG7StE/l1UADsNBn6Do3SHxVWo3Vq+k/Ie2LU0kB2WRpJVVRBc
         T9JEvP2Lh79p7intoZ0UR3GA7igC8vWZtPceFiTVHJplqwnYGr8lISvDqiJ8xgWg0SrZ
         Ao7Kj3Aq6srz3N9RAMOtBxva2W/7wVWntVX7wuOX4ZeKPqgT2xsJ/9fU+KXV0o0Vz3A+
         INyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=rGBqX1gu;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1691119dsi2778910f8f.172.2024.10.07.14.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=rGBqX1gu;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336113; x=1728940913; i=deller@gmx.de;
	bh=Zb51eK1HZpsRTx4SDwRI+Br4VZKKuygt6kB2EI7yznA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rGBqX1gunmSUTt2zRy6SG2j+HmTXZu/nxbqww2l9UprgnsYb17QOovAjtFzraeVZ
	 UNbpBzekHg2kVXxZ2vARBmmYvXJ02mhLznoTP2NbLxlAHz+8iEHG7WgwxSbN3CUBs
	 YkYeO357x97XjN2OHfxE+/cReiPRsaAV7pTInxvLdOo+tJTk0hr52wKzzKpfESDEQ
	 zuw/s47qzjTKds3e/x3qhYFCrMhIPgDAvdOw13fL2MlxoejmGqp8wQySudEJdo7Rc
	 4BCjRw7TeEe1yw4TCSwRHxVPMI/a3KcKCSM/u1copKRqcesa/1iy7qylzw6Nupljb
	 qPmdxX+0RsqkHDnLvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5G9t-1twneW2c9l-014igU; Mon, 07
 Oct 2024 23:21:53 +0200
Message-ID: <2a3c1e79-8d05-49c3-b40b-a6892767ff0f@gmx.de>
Date: Mon, 7 Oct 2024 23:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] target/arm: Pass MemOp to get_phys_addr_gpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-16-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c4i/lIZwh2DCMpbfcbsGImE/2StYf0sBzAWoSZ8UjROdOJOP5xV
 jcy9ISEWZJ3qeNwRCw3bD60U/oIHHPxwO5nuRqz2j1tOL9Pia+fxw1OZJ35N0wx06COB+36
 I2PDBzv/kZQAr2DOd+cjn8ZJ5fiepOSA7Jpcb9BzsA94t3/kHeNpBSZ6f1FKjTcFwkve3BG
 yKbB+3+F7h0UNf88AkzYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UA8CiERnig0=;0P9JJy9oXVUSxGHwjBCPMgMaRRN
 tko4a/ski+e3+iLu0F07YZNWAa83NWzhW6qOHQW+y0oOcNY8/5xya62ymuC9r0uBP/hMAlyUl
 MFcYpAEnDVAbIYsarX1eacPbvUuYdFZlwoSFX/2YY7ge9TnsnKxEUx1pTd8fodwUl4XrphHnY
 mjWBB0o7X/uufuW2iSDu0KgBvDFsSwmSfAJIZ7fG1qHrt6D/rTfpsppecuLX77hCmzsU4ZyFB
 loJytn9hh5+MtiT1bIF0eGt3IR7VkyG61QgWQSXReoRiaDmXQ/ienqgkHiXSvLjlZE/Njoeqh
 ozw78/0Ai1nEu/yPCGrrfa8Jembsx1rgNIA7cQmnFj7kld3NcNHMo8EVk+CZCkVyoPyp394Qd
 L7Wiowm+J5Bh+ckzFIGXRuIIUvtKA7H1kOyI9WiT74FEgEe3sEdJNyn41FI/EIZQMlzgZ99Wz
 4LPgURKcX0GF7H0/DGvcqTDjjQFiaLiQ5ccb0e0fo+2E5z4/7OIeBmKh/blL35WFY/TjoZpRs
 ZJ62WfDi5kn83Q2h7eEOxoM0Ctf6TUOqE4JcVaZPvP0W4g58B3d7iLzYnns5BKc2wEfj6nus8
 qB6iYuSfD1+WlHN7ztR937olIlisIhttcbQyeDesoMwBs9RKK/qCU+UUfaQdFr0OXUCKWBumP
 VzyajO1jAREDIqoLw36+LLE7zaknqY2+UrLHmLJXSSEPalCcnH1b3K8GRHnYRp/0/UbCrv5wO
 B+u6O7k/AMkeSQh8xqm729C50mvlJ/M/i7w9zcnonyCFhrjWwMCUzC/ORJkh2XG9z8eudwKFk
 hJezcTbdKuK5rC/2Sw7Nz7Rw==
X-TUID: 1oFBLvFHkPDc

On 10/5/24 22:05, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/arm/ptw.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
