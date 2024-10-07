Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2200632njb;
        Mon, 7 Oct 2024 14:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ31Ec1AbS7W2IZXSqNZhdXC/bbpqE2ePJ+OBLyWnrYdG34DVloixQHotnsX511BDDpq1BO7u1qKlW4A==@linaro.org
X-Google-Smtp-Source: AGHT+IFWg82S+xOfokovgjgD4y3zUfjrednTnLjBNaE52UA7SyWXLC/asv0M7YFbvNO+JQ4mqaRc
X-Received: by 2002:a17:907:7b82:b0:a99:3318:e7c3 with SMTP id a640c23a62f3a-a993318ec1cmr997087066b.43.1728336052661;
        Mon, 07 Oct 2024 14:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336052; cv=none;
        d=google.com; s=arc-20240605;
        b=Ke13Fr9myOYZukyv1K031CZQP9WXpSHC5tDKNn9qGiivWdlXFKkxJOKaZwpo9VbLEL
         mS2mS1Io0tRPqf0GYe/CFqjXRbz2CY+zmDz23167Qh0ftje7GIj0FIMqkEh1OiNLxbGN
         bgURC5h6Bgnjfrebi2W4tYzx2T6cZMPG88Uifi7unRjfWfk0l3ZyWlX8QiyvY4WDff3M
         CgLaxaNhS2XCbMScNx1TpJrfgxhoYb+4zOMci7X+rHyeVRyhdVdz7t27wjJEyhRxyhht
         Y2cMu3+bzRE3vRk4YIR9tUxFH2x/O3wQry5+B4gt5tpQifQO0tJndaCNWiIvmjOl1OHI
         Nc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=mpYWNGgYZJ7ZaAXbQ1ANOYIQG1fDEEXDTpaLybT4prA=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=Gf9EBgqjlj0Lr2ejCDz6kfuYDLydrUDY1GR/xHJiWd9pSJr+/2wja/RMUqCCkeB4qd
         swVyka7PmotyvZU6EgGe91tBeV+JjlXRgy04kU8XorgMzdBsH7WSXVYd09+vNtEBQMyB
         M+32TvAItCYpgUmYPOsFSx1ON2wvEbxWb7p/mRy1xw6CC+C8jN4GNrzoJjrIzQYv3K/+
         ej2+Yau/iwpqv2r89xAPNeyBMFvzO2MZveyA7cvPqKD4MXlxj6DZRyjkj2Rhu7HbgxRv
         SiHQjcXEDRPmvbRFEuEPP54UeemJFoYMRpipHIuFaxgg6VHxejEnIqCaSpJQIdEKDD7f
         5X8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=ABBJK6dx;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id a640c23a62f3a-a9944879b5csi364156466b.714.2024.10.07.14.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=ABBJK6dx;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336052; x=1728940852; i=deller@gmx.de;
	bh=mpYWNGgYZJ7ZaAXbQ1ANOYIQG1fDEEXDTpaLybT4prA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ABBJK6dxowzgL6sumx0BNCLrPljC+4HkfYlkIBvlrELvGQjJxitz6CV4U0TaQFHg
	 yXMRKLNN1zbCUBVlkqLf1rAUMzVtEGOUEFW8b8QSQAURK2Z9IW7T57vLzG2PG62RB
	 TociYUs15cARBVZIHALISzr+kOD8cTWcivhYMmHPl9/nRJYOSwcPWIEu5TxU+h4na
	 IajDy74sptPst/0YuFBIVUDkxCol6eFVXucWwp/3rBcUAlFFSB+JRShok3ZxDfCYh
	 SOGYvkmpYzeTRJ+BBJ5i7eErxCWlBh1xMSHbDgeHR7VijEclUinUtakNu8da849vw
	 RI18rvceyI9m77kTZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1tGq9m40E9-00Ol86; Mon, 07
 Oct 2024 23:20:52 +0200
Message-ID: <eafe88ea-585b-4770-a538-93d192fa64c8@gmx.de>
Date: Mon, 7 Oct 2024 23:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-14-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kZFzDC6V/IjQj7aFwqPEdkpM1xoLLpNdMqLnkFQs2dA4APpnBBd
 89QIcMGDpLYCpjWFtNx5JjoS485CWjY9WA3jtitzx3/dfRokDoL9kl0Gw8RV4rq+bwlMHO3
 gcHrax58edAskOIAZ8w1htU2ob4dxn/JsJk8KEILOgCR76R/qRcbx+KWYeBi//NxrxAcLdr
 DE6z0BAbX2Rpr952G7bIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5eTQe7G+nUY=;wmYtcm8/52tzcG/9dJGzWfgsDvK
 YCXb1/SPBMVLy/Kk9x4OOJ0RmJc+Ba/qgjUgalwF3EcpW3ORxXXGz+sPRqmKYomXzS/EqZNTs
 7fdi/p8wA7ckj+7dXQdlsMjFr6Pp/Gw+iKOe/PVaJZKwIH5FpdM3eV5ePxQnrBEz7IL+s3dsC
 34waHB2gXgQz797RwFyKisC6dtBbeKlDYOSReDRSRP30Z1mug01rDxyRniMlYAJq+9G69hr1v
 LBpXdNd9mHwN56iduLjrr3YR31Y/vxZ1oXP5NIPXLfbksfhkNNUneQ5bAotKoK0uR2rxB3vdS
 TCzmMZwKh3DqnxbYXBxj3CPY1d8I3rjSZRwH6AJCYJQXihMQNsnobAXIYGNjyyhgXBboA12uu
 80GNxaufLGLNCIdvQMMT4RcUySsMC1fTi2wIp5QRdYC52Lh1XTlA5pPkfwlSX1tuYbpB0YJvB
 BcJw1cWj3A+YwALnoJ+7ta4zRP3OAtupfCU64pK9nrm7NF7FTebKszmcsQ7ywO7QZotpLnc+z
 4/KN+I3FJSilvhyetN3PuBhVNLyL4yvZb6viUQGlxsdqzBt22wy0mIYkVs8sS2hVw5YOtnc2W
 4aTIAbIvqY+IuNX05LI2BMbbTW00tsJA+NUxMCStWB6WoFDN7gANGWbkzBy36bFlaWYILB2bn
 QYmAFWK1GIVdHrQ8xR1ELq++BDeSdhY6SDWxSP6eNMJSiKHzauJ2gtbsl9GFuPZZu4uWjgp7g
 32uLnrSj+T1ryjCPH4NJ4YG1U0Ayhya3p9zMCL9/u7qQJpqSonwIozlQgcYP1P3L/0pueQ41H
 3hZFkTcZ+5gVJDo4VxZleb8A==
X-TUID: ipZMFadmm8Ey

On 10/5/24 22:05, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/arm/internals.h      | 3 ++-
>   target/arm/ptw.c            | 2 +-
>   target/arm/tcg/m_helper.c   | 8 ++++----
>   target/arm/tcg/tlb_helper.c | 2 +-
>   4 files changed, 8 insertions(+), 7 deletions(-)
