Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2200823njb;
        Mon, 7 Oct 2024 14:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTBkiZulmqcVZCSSjS42FrbYFG+h6ukfduJl/054kZQULWGZJDLNzvbEC8B33uUwZDm75wKP+msyhW4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFk//VM1Z3xgnGl11JpT334ZHi5fFV8eQAEmfIzJOyGVTsJKsuMfvw3r+rV0xqGA5o1P9Jq
X-Received: by 2002:a17:907:e93:b0:a99:3ebf:9371 with SMTP id a640c23a62f3a-a993ebf94bcmr731042166b.59.1728336087464;
        Mon, 07 Oct 2024 14:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336087; cv=none;
        d=google.com; s=arc-20240605;
        b=XB/NF/TakTaCKfhEa2PccHRBN8DfMYTaQgmqR2BMgTEacJ8Sb+ibNAO8dpFWUBeWZV
         k4Pyag8ckXTXYYxBYZDJS4gG/ox6myPOi8cls1JCN/uuf+OUv9mQwSXfsUaNCVVLqxNF
         C4kc5YMXT3vtr5V00RHeduXR8XTF1d0q5uruVU9HIuH+JhERBAPSSUIITyXY05l6XPHG
         6S9x/NS/FxBVh+M9PwcAa8hXQg2dyCpG3sGr3NwnlV25Nvrrf0uA7CBbW71kKzQPaVIX
         pu3DOjQ34bZ5BpMskfwhg6uLhwDA8vXPeWEBK7TuDcGi0KLseXTUt/0QWwJbDXKEGIZr
         3zag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6/rXHoZMVY9hCkHDdpsEtPRb7jXmWLWdejrPw3BPQCw=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=El020bN1+QV5loHvE/v6Vg0dYfqdsyv6Nb0dZbHecgDrV2AtYgoro+I4tzzQqWMzLi
         7WRrolaDuH4wzqkQ4SGtSe4tWngGxqoX5I5ACOCXpLBPqbnki4BVwEJu2dP51yaiMsK5
         B/Si7RNPJ+Nl6YfsffIm1G5kFa8zPAdPJzD61LWwXHUgZsErME61I8dHZ8wltWLvpA6W
         FfqOpoWHtSjCJzsvUkUI3gsO6SAk/hkMkXnkeZ2poABUYw8OKVmazd9qg0DZABJAWPKt
         mxd7mmhrZcA7TQv/2PAYNbGb/vWguFgMUlkwTpSBCqTfskcrBFExi9R1WqcUj887Phag
         6NFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=KySTSSy2;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by mx.google.com with ESMTPS id a640c23a62f3a-a9942516fd9si367466066b.490.2024.10.07.14.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=KySTSSy2;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336086; x=1728940886; i=deller@gmx.de;
	bh=6/rXHoZMVY9hCkHDdpsEtPRb7jXmWLWdejrPw3BPQCw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KySTSSy2vV25Sr7JXmKaFJuX5v08qY4H/zfxCxZWxP3Kf3OgX7ApXLn6Sg0mK9Qw
	 vvBuSBmzwhOSrYgLsMWSYiOGVue+y/bqDC4KZvA43ae4U1Jb8kIlzz5zSvJgxyb9O
	 ehOMrh4or/fFyPHQBAQDWiCNUDks0LaHEtpbAI0HtnbXNDue+wuVo6zqFLLjGMXKl
	 hN1pC3GSe45tx57x2O0xQLMOYzUIBYuPaC3ri6pH1S66QmhlMrMm9nvCVf56r3egT
	 xPJ8MyUPIXgRHO+sAxedQpsl1gXIzVPHHlWX1wghgtpXvdmCO/25D5tXfHRyyrgUU
	 vz7w4K7Teg9elAycWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1sz2AE36fU-007VFg; Mon, 07
 Oct 2024 23:21:26 +0200
Message-ID: <b78cd701-a75b-4176-a9ba-ef59e2be32b5@gmx.de>
Date: Mon, 7 Oct 2024 23:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] target/arm: Pass MemOp to
 get_phys_addr_with_space_nogpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-15-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:41tPpD+q4T22Q0aSpuyI2Pbiimtrn6nAlYBrkD0dep1V1j9zh0k
 I4FJbfwzL3mXmn34WJ4jfOLbXxxYebfZAu6Slg8vdnuZGrhp4iMLsZkm010Wxr4doedUVB1
 SzkHphVs1j5Jsm+KyCVqnkUi4e4FhPXQl3yntve7JrqLRD+8figi7pKnphLezrKADro/fwr
 HvLtoCQH28MSq9UDUbaIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9PTyEaYVP/Y=;gcKIG7JWJ5Eprbu0UwFP8pHIiwe
 WdUDXSegds0mnX7qPKkS4EB8eYelGHwhwmDVvbvoHOrP8obt5fPBCAHo9m3hlUJTukQvKSFhb
 1AUUpGY3eBGfdgdP/ZHOu0OVcnpEaAvQBofARejWY6Bm6lzcE+30PFE58w3xcojpOnNEBLpg+
 H/XSHUjj/gQQumEalGni3uWVnWXOwMJdsWaNwaFPKrOX3tFf/0xKZHhpmROlFhL3GdgmdUvWO
 oOcYIst32bFi/G3FHLvbpYePlOcUYLrjpW1+9w8szeKOiw1hCaJjfa+RVgYvMaw29CghQHy4g
 VEBFULlnk9yZHPFFITCLUVH5MA0vglks0TrOww5pYe0EJQlcEIVmvbhJMNgOeNBJElb7hLCsL
 W1p7Bs03mmkj99bL2sV4ZFLxyFjSCvqRGHUWzvQTvLafGev6po431Kor6YK4L/8/WJG7ZgUSd
 LHclMLFE0ds9HTLihCAiZDKzb8uEqwcFMMRgxmdKRuLSqEMCTqNOWKdhwpUQHf9rHn4L9Yp3O
 zySipP1Zn0dar7sytisJExqvv0XY1ri5umF6LsY9ny4M9RRzcV5BOZqK65QoOts7Fbi0sA3AB
 m43qUlLzkhDw6XeUogSIKuZL1Z8K698kCvKKyrJmBjazHAe0I8K+ZWrfZD1etUoGM2AbaxoQF
 VjChmx4EqEh9NPtoi5Dnz5KdL9zEvIQ6QK9AGcKW+EXC6qUHHLLMeW86OGaAXaeBpanf0jmpb
 jjr3PvDYe3i3/uRR97FPhS6wG7CYjzUZeJLu5CikkG8j/CHqhNmpV03qoRtFtMXdZ6mahMW+u
 wUiyP318RWGO1hvA0Iz2ov7g==
X-TUID: 4ieZuRC5q8ad

On 10/5/24 22:05, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/arm/internals.h | 3 ++-
>   target/arm/helper.c    | 4 ++--
>   target/arm/ptw.c       | 2 +-
>   3 files changed, 5 insertions(+), 4 deletions(-)
