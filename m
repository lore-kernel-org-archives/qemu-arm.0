Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2201377njb;
        Mon, 7 Oct 2024 14:22:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX75sMsi+Ngmh2+iGu8FVDU9MQH006HNQvwDouK7P0uTnYsledlD7dgniIe6Z+clxXqDJrS6n/NLbntpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEsIIcBA/Nw8y46R6f2+pd00tDnNXCYU2Nv9cJc8C9qti9KN6vb4Yh5tGc0dPWgKj61Ml62
X-Received: by 2002:a5d:65c9:0:b0:374:c407:4e07 with SMTP id ffacd0b85a97d-37d0e7d43abmr7022974f8f.46.1728336177044;
        Mon, 07 Oct 2024 14:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336177; cv=none;
        d=google.com; s=arc-20240605;
        b=E4LMfyPw+K+jThEO0ip1Wd8jQIAA2+8eI2wiKGKUQemr7l9FRqTYOKp9HurTWfzcI4
         j+bKvGfi6+Ial/3KbZxNXijo9MkT7Iow8kUX5Qak6jRIigsfDMumTUcWob2hFezze+BO
         3UWk+M4sPb5+t8MsnUTFQUCriDfpbOo/zowOrL119jRzMVHvaqdZUcHsNmuO873yr5N5
         wCziiMqYRyLWFW874+W2tYC3KGysrs+lumYWaM487LZuiMUQY2YzjZPPLUD13GrirRjv
         uA+0kUVH5U/FB/5CSpGZ5G0ETqR28KspCt50V+bipQ12P4b+awrWBByFG5wXA0OKcqzP
         An6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/fK4wLQLQ82E6z6QrtVviBF3/QWhReaRFa6jXt/qI0c=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=RaV3WuRMtxlXCqLLH0dvM4Y5WmoSop9Jwj56i61k4Hb3U4DsqmhBcb9KA6IHfqEvV7
         ugF1I7hpoqyxN3FrjLlBVWTED6zGm2w4KtuoehcvyTekLl2tj6MjAEW519xeRr73HL+c
         roVrDifOGznjsuKvxAKjSxXSl9Hn5UQwgjBssWZCVrMqEnmy+Q2XNAV4KG5nF7tERewi
         BVM4CiFc27EYT1r7ErGhLT0AIyZuB7/NJzrsTYnIBHAymSOdd9DZdGge7bj0YlPF8Qqk
         NZ9HyHgl91QztCcQqi1oo5UdfjVJ6lH0bv74n74I3gt9hrRfjlvgSWPZnkUQC37Ej/2H
         jiJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=kQKcWWVk;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1691156asi2648361f8f.82.2024.10.07.14.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=kQKcWWVk;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336176; x=1728940976; i=deller@gmx.de;
	bh=/fK4wLQLQ82E6z6QrtVviBF3/QWhReaRFa6jXt/qI0c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kQKcWWVk8Nui2+rt2obPZTn3kPOuAtMni32VCx0uvH/qahd2iBshvcAUeXfChp0L
	 O6iR8kpnh0rfA5SpnDexMNndW6YwOeAc6PYXTvD7+R8P22Zq9fzFFyTlYM98B530/
	 VdvzCpq3LxmBHSPORvVkTDcAwT5SkbN8BSbByp9k3ERHultN+VuTx+ZOsgsxQaYPX
	 Zompvp+LXTH+GyAsPyz+4Dg/TZESpEPXyFn/ReVXghYNlxoV17DghaTz/nHLp+Brc
	 nTNhSU4AOzCZieRDbL9YruwpGbloEerPOFQGV90Eg254sVK9aWlvhWXzKvH0aE6Pv
	 8vgf4Qev62AAV/2QUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFzx-1t5vvx1kIP-00F03n; Mon, 07
 Oct 2024 23:22:56 +0200
Message-ID: <30c45891-e213-40b8-9426-8043609f8f8b@gmx.de>
Date: Mon, 7 Oct 2024 23:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] target/arm: Pass MemOp through
 get_phys_addr_twostage
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-18-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IH/3al47xVSBvucgerrxqKvlAAft/aMmsmS7jJnTLwzyMJdk9Ij
 Udvq6s623HYOPmNWuK7wWP9bnmIF7sdVAXERYEa5YDHgkleTFFob8Td0ShxwWnMAslC5rbZ
 HenK6A5bJoWIqRsn5CwoYPZFNMOhjCzI2EckAb8MWiP7NSoZjnLVWYv5r/Sz5rjhR108abm
 kEiCdB2GrziS79XfFlwyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J5sIsE9dXY8=;4Uub9dJsqbYM9GCzaxZQ0Vfcc2l
 n4euVU6eKsoUf1fe/IBrRKSavq2/ecGRjK7xiLSYC9uW08NDeyqomyAqXBCFBLl2TSnEiNhVQ
 hQ/WZHfAz987HK1UPCN6Ft6WYtjVMQcCD6cOhXk/HuUgIn3Ssn1Fz5LgEGnCCSMwsnMUaBMh2
 dh9f+hKnrmyhojPiZjexM77PWBSG5nejt1Jq6l97tTIGIReh30xKCxuou2Z+0nV1I3CcW46fh
 ybX+iIVzNqpKYvs1Sb0ptgf2DWKo/SyRxs5xT+LRHEkBpYPc059sSxROCvQXJEMIF35L6EvJU
 CfqgxugxMkMLcBrSE9lL75E7NwfH76g9zcrf0AMeTli3qD7HxUsqtoYAwBJdlos/qsu5+jRCp
 kkam92SWLK4iAZwEIAMKV1BXG9MTafAeHsjzMtXyKvTHb5/BviuoJhmeNd4lCdgG75mQrJPA6
 nHTwY3GyYq+VMeCSr0j8ZtYrsLqztbTdLC6q6ezB8k1fEWfUKw965E6YEFXt7t89dP48BbBC1
 OqU3WhFUCFMK/T5+vgOOXlDArB6WmoeiqmKmQaY4GDk7tJJ0q9my6HksLzoS+4Ipb6w8szsYb
 xdyXNDqox5rXaPi6rkWkQM0r51YxsPbNa2icDpsic1xEA/3Dpx/Bd/0S+sApKKC7BAMCVEGl0
 9aYq0XAe36Ss58XiuHVVTe3N/T7d/G6wVLyyGXx/a1X8uUvIjDy8YgAsKDQaF9PoClr0ZQwfk
 Iv8fyAkHP9xUn2Sc8c8iDt3BMPbeqRCBdTLKCRcbi+51W52yIefjItmHYsTN8tm/T68/zmDaU
 FToVyybMKePHPCSIKypNk7CA==
X-TUID: Kd7vcZYYeueW

On 10/5/24 22:05, Richard Henderson wrote:
> Pass memop through get_phys_addr_twostage with its
> recursion with get_phys_addr_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/arm/ptw.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
