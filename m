Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp294424njb;
        Tue, 26 Nov 2024 11:00:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXo7CLEXBWmJti478aunXR6E+0hQuCGVOal9UrUdtt1c2AhJ615UQdG+RyVMJIgd2P5Yl7Gwx4dya6ohQ==@linaro.org
X-Received: by 2002:a17:902:ec8e:b0:212:f7d:9284 with SMTP id d9443c01a7336-21500f56237mr5220295ad.8.1732647632388;
        Tue, 26 Nov 2024 11:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732647632; cv=none;
        d=google.com; s=arc-20240605;
        b=L3DJoHtbv1DRvEjH9F2YFBTaDJE331lxPpzKxk53NMY6kWYb2rstaahHueVUtifwQ1
         opuan4Bw6YlFSZMZ6cRjdnMme8KbPaTNyQ6mNXxIJMgi5ZPoU1oDEUiPfMVDFyK3/vDQ
         xvYylXjx1+QDAmMoApypLPy5mKUmydBP78ocqgoQBgBMyqo9d7ldDsUQ7yREqbPUoK44
         LeVzX+0HJDBoPLG4u0xfHPtZY6WY4FWpzsxip/cw0jhFavdPq4G9dFjZ1mrrt9OLDprM
         6U5ZelhttfiubXQXKAfyyhwFRT9i6SRkUMh0Fq1uGjTvsy+ee3tPOVJj8rtzkKWoWyI1
         AXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=X2+dndJ0t3VSQhAZJRnWUFG6Waw3jVTx3nmo8KHY8G4=;
        fh=Slzol4zMrLrbBE/J9ea7tHvPGDvEycxPd/uRj3I8Y34=;
        b=JWDBBxpp7UZa8PURvzEyAmw2zRgELy71zhr8M6W4NSQErr32DG3v3Ijj3FyD+JzvkZ
         KCIu/DcEmtgMbeMAhovB5ClIZQJeZrco/dU5XknBCQSOVkCQglna/pxFmBDk6e4QD7mm
         s8Ny5Lu62s4eZl2g2shWnZ+YLZpeXU3arunD0HJM13dDnP9hO+vajNkZijFbXNYLO+UF
         nrYuUaYNpHkMknDJAGKSWCztRyw6XBeFUgUkxBygexkEIVkRAB6s3eUJveUm6bUD+NNA
         SQ94V1H88kh+PQ+rOwRsa7GmBESkB3ztAnXy1KroRxmZ/zSz3hYRq0igwV+IHFiyGTXF
         GWnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=anz0Wusq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129f276527sor58120345ad.8.2024.11.26.11.00.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Nov 2024 11:00:31 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=anz0Wusq;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732647631; x=1733252431; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2+dndJ0t3VSQhAZJRnWUFG6Waw3jVTx3nmo8KHY8G4=;
        b=anz0WusqUThzFB8S84NnzcmDJK5OlPggbeBZDaympPiL1eYfvTt3xTtusOqDTLqj9y
         ZiMTLU/apGXJNJdsD6DGZQtiAUC4giRwwy6kK5qSRV2YJoFtaN5nijYBHWisIK8JntSj
         f1qykcTaKTtFcGzElCK8voLTV0yqISf7SxcCQ5vv8Cg4QIZb2NvercWGsCVQ8lr18o5o
         3oSKfSzWfumMFA/1ZYRVjS1RfrufuPO46tfBmv1/aKGmTpo7tAiK1O743X4QJIHqzC/v
         gsT+9jC9ELDNmj/iEaXN4TUUTR6+5VwHH3bcm5ItDNekEzd0JhNO8lkxTdvy2HUiArKW
         d1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732647631; x=1733252431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2+dndJ0t3VSQhAZJRnWUFG6Waw3jVTx3nmo8KHY8G4=;
        b=UtHU2dAQ8ONZCDM1PJxckKZmHF0+Gk/AfgWv/8w+nN72vf+Z9bQEFJQVlZJSZBI002
         uP7bzQfN0/hYhgfhR875LQAdleSHy/VDVlE7li1+Y661rG5nNfTjxcVtpO0NoIrsUBpk
         9qwwWO9C757D/FnNehUZLNSBFUfaQ+hoF8mNllZULP87ffseW1W+Vo211BO5N4bxKuNh
         fm9zLpU7ZYkB3fqIkoQKxRQXQIjcexppaYse8d15nOw7HOP3hby2zHpGawJS1U5OLTDP
         MMqRTFHns0QXf2dBWrI2tYuJEiXRS/3rlR3H6ZcyXMjbhsbejpawQtO0b2Ona0NjBN+0
         PJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCULuo1W76uu5l2/T2amy28eEqe2AV7k6SjMNgrp0i6KzGqQUGu9LGylUXncQqCemtUim9NnHqGKM9DAWw==@linaro.org
X-Gm-Message-State: AOJu0YxpOU+vLWw7kraDxMutDeyaGIamolfgnQDZahPxebKbfttSxoRH
	XesVQLeRGiHdbFJ5mrXyAxMN/QUqP2vNoR28EfwbWyPO7h8OmzE6c3b/crxC4TBEhg==
X-Gm-Gg: ASbGncte7/ruGB93HjvRFqP1djrolVtdh8xR2PexVjY1Ix3vB0DnMhgAI1pgcyeoXGZ
	IvyiqJNUc9oLOtvESK154ja+ooqFpv0v4CcheLiQIjunlbl5RxvASj32FnSiaL/K92RksbOINqf
	1iUa7bYmadvLVYM0Z7Ns4KoaPZuYkrrMNhqHN/akFqRuwxzxySLQDmE9+nw4Gy2gyFx1T77qMre
	qxmbNLDG7IyFABclMZtPhQaojHUQgNrETTF8QuxpTQXI4+PjKl35rg+U84fWjPoY7XiimE4fEb7
	xPUuoZxtN8lVqOsrYdsIMQ==
X-Google-Smtp-Source: AGHT+IEy/9Z2dNSS2e1vxHCFDpvC+hzGUsVHx5n1dcg5rnZ8rxRNyXlFQ2AOzoD6oxxUQqlb7XKgjw==
X-Received: by 2002:a17:902:d2c9:b0:20c:d71d:69c5 with SMTP id d9443c01a7336-21500f410bfmr5353595ad.4.1732647630869;
        Tue, 26 Nov 2024 11:00:30 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc22a4asm88178695ad.261.2024.11.26.11.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 11:00:30 -0800 (PST)
Message-ID: <c18bc538-2036-49ad-b629-ae40486934cc@linaro.org>
Date: Tue, 26 Nov 2024 11:00:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] docs/system/arm/orangepi: update links
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
 <20241122225049.1617774-9-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241122225049.1617774-9-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NZgYJxlqscGi

On 11/22/24 14:50, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   docs/system/arm/orangepi.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
> index 9afa54213b0..db87e81fec4 100644
> --- a/docs/system/arm/orangepi.rst
> +++ b/docs/system/arm/orangepi.rst
> @@ -119,7 +119,7 @@ Orange Pi PC images
>   Note that the mainline kernel does not have a root filesystem. You may provide it
>   with an official Orange Pi PC image from the official website:
>   
> -  http://www.orangepi.org/downloadresources/
> +  http://www.orangepi.org/html/serviceAndSupport/index.html
>   
>   Another possibility is to run an Armbian image for Orange Pi PC which
>   can be downloaded from:
> @@ -213,7 +213,7 @@ including the Orange Pi PC. NetBSD 9.0 is known to work best for the Orange Pi P
>   board and provides a fully working system with serial console, networking and storage.
>   For the Orange Pi PC machine, get the 'evbarm-earmv7hf' based image from:
>   
> -  https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
> +  https://archive.netbsd.org/pub/NetBSD-archive/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
>   
>   The image requires manually installing U-Boot in the image. Build U-Boot with
>   the orangepi_pc_defconfig configuration as described in the previous section.

Regarding our conversation on IRC with Peter, is seems that google 
reference www.orangepi.org only through http, and not https.
As the host is currently down, I'm not sure if https really works or 
not. So maybe it's better to stick with http for now.
