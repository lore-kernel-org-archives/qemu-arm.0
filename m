Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2198639njb;
        Mon, 7 Oct 2024 14:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNYrfLrz104eUFBFVtfq240SzPXeBEMiOJRoFXpvTZqp12schUK1hkqg1jTcA8ua6tnoggNiDYMQbmRw==@linaro.org
X-Google-Smtp-Source: AGHT+IGD8pMRn5GNOn3LN1K5sebYzXEs9uz3Q0R6f4dqXNKDRHToYS5YaD7LfZk8JkT17IJ8kY3m
X-Received: by 2002:a17:907:3f25:b0:a99:61f7:8413 with SMTP id a640c23a62f3a-a9961f78458mr148209466b.23.1728335741271;
        Mon, 07 Oct 2024 14:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335741; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCRZFsYLpjifqCTJaihEhGZ8wfLvSiEaQy4IvGqSEbIHHig/QfpwbvcVRmIryYNrTO
         R8237tmAYEwxm+TUmdnlL64S7+5rBAsKei6spfjCbitPxMbVnhHdURhao1PxNqTngWuq
         wxZ+LL49FoDMfBIQTIPQxFxWpGO7iuzdzlLQWkTY/lB92yjWWsznF9igT0Ul350oKN9E
         VPez1ECcYrOrZqSp+LYW9ztQDXr7EnduolemtjsK242w3HAyWRO3DNvAZ+4Sd6kZNUXq
         d19R2jNSbHRbbrttsu3XuouyqVH8aVrzPBHSAava61aRivTbZBFBHWFW8yFWGz/nTG9/
         esYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=N/IuYQ6OdLCzl3pWE8NPI5PGV7fJcLaN3Ul1Rcd6Qqw=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=NqEj1RmNy9r5OqiY91+/GPvt98smn+d6vMdKfHqqkD5uKabYjZMv9U7YTksRM39v7q
         lRfhiCEp9ipdjWt6US6WQbCTdQOU4rvOUzAoBgsVA93vkLkNLhOE4CGY0mXmAQj+9gxs
         Wr+aMQcELkMHAUHg61cj6Atbf4vYVWQ7lhqTB0w/n8BgttMROf0OzAyzrPu6JNs3kT+l
         5QzurdhopT+vnC3Yq9mU2woVGwm0PH4b011zMSCp+1gqfXUbQPq+IIArWt0wmISiABSH
         jvzErZ1rzO/9la2UIUIZZyl/ROrs01/G9juzPGF+9FAnm91nSXjFj9nYawXZXcx9+SdX
         TbUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=C6B73FGo;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.20])
        by mx.google.com with ESMTPS id a640c23a62f3a-a994a81e3afsi314434266b.250.2024.10.07.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) client-ip=212.227.17.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=C6B73FGo;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335740; x=1728940540; i=deller@gmx.de;
	bh=N/IuYQ6OdLCzl3pWE8NPI5PGV7fJcLaN3Ul1Rcd6Qqw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=C6B73FGoO8T6QLKBW53WlEwp5q0uSIrwHOWkFYFen/K3lcFu6Rfk/sQcACsnW5Mn
	 3R16wgUJWctQLvqpBQbbLpHKDVwsQUwSGk2jENK4NijxMSI5MxVrP5npVezi4xB+c
	 DGaTwVJZS2t11jKqon4xiR11rZY/TM/w6EftVIyyH4ammbugftx8BtdA/wxXEgreH
	 pxhXVFguHISH/l7m4i81D1iOsLVRE4fC4AZZk+z3fwpoZocFPD/AInexSWT5v+gwr
	 onzFP3luqMy8NsVId4YTPGEYELJmpqOkHnC3PXJwq5kjV6ct/07Wl1PHzy5zZQJjJ
	 bMuVBgJwvBc625Ke+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sn1-1u3wcV1V6N-012zOc; Mon, 07
 Oct 2024 23:15:40 +0200
Message-ID: <c4ab226b-b8f3-4a28-b4cf-d630acada5e3@gmx.de>
Date: Mon, 7 Oct 2024 23:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] target/hppa: Perform access rights before
 protection id check
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-10-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CSycCyFWk0lfJ/gjDV44mLQjyvDU/lgQ7u8UlMqt/5MIBW0yc11
 v60YvtOHCtMofCGpZweGh8BQElw1IseAA24q+mgbNIMJoBxnNnDgteInwM/tJcq8CAsOxrl
 e9I9s1sbosXSR5eN5M95N7rjQQcMmQ/zvsSXyU5La+h8fX8oCLqyb3xPOQa1eL9XU6/4O54
 8HjEBFu60Rlp/RHBKpZsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FABvcphQqcE=;LV/6mo2FmHezyMpq1NjZmlKK2jj
 Q9QKV7UGl6jKDJt/vDteqwF3KUKpxrquBBB3SD0etztNiG069KtvGXCyDo9/LXtzfgKDGkCu4
 OuC5VXB3qxW1dU+1t3nB4THRqIf7RTCNoAUApaNbVhgaoMS7pmuxcv4+5aNOn6da6sESZi7h0
 seOu+mlLetrLouHe5Zs7q30EdGy0y4CkvbgzgsVzCBUSgHXgl9QnKC10duMYqOE1vYMapXhlH
 6bNc7w5lLgCdqNo8OyAWgY5fZpd39psqxH3wYm+RGeAqy5sCKxlgoHTu34I3OKOz5c8nXT+17
 NmkQnq/m3bu3RcVbTnFFyIulXNgHi2l6OnnLyGj0277rOd/Rp5IrWyqD55BXcoMEA5WB2l/UO
 /UbNPo5L+mE88eCgM8fCWM7ZufFfhzcEkRzOeLcX1woLGpJXKc7ChWiiSFVFCApZYiW+bnLqF
 j1FhS0FkX2BvHoeFnrZw/e9Jh2sVHBGRamckyJFK8FooTCxbaQ6SYu04XfGx4PUBq6kq+v6tP
 ccgj+eELL5+yAn2Z/jAXQvHlcZqiu9+j4sIOTXOL5ijoYYp7Y65bc7GhnMvZQvHTPVyZY834n
 r4VZfubbG6++6ZfWt8TJlnvGaWWfAMTGNm3fuIdmc09VCE+61w+nrfSN9euPD+ZXgbonMCfle
 5ck6mpiGYYEUGbxZwGaFg0Gw+abJIlCYNi/dVkuRKRxyjFpPNlyozMWj9GAGeuC2RmlL2lxyb
 dFsBIvKL4LKgHroO8ws+CckGFcY4kLAYvhgWXhdQJTI8qFbppuJSgMIHrLsW7QYvGwPIO6pOC
 t8WLlSGSJ3ABj/pLue7sv57g==
X-TUID: A5PbpZn615fW

On 10/5/24 22:05, Richard Henderson wrote:
> In Chapter 5, Interruptions, the group 3 exceptions lists
> "Data memory access rights trap" in priority order ahead of
> "Data memory protection ID trap".
>
> Swap these checks in hppa_get_physical_address.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/hppa/mem_helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
