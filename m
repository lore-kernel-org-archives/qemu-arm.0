Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3638666lfg;
        Wed, 26 Feb 2020 14:49:37 -0800 (PST)
X-Received: by 2002:a17:90a:b318:: with SMTP id d24mr1544540pjr.142.1582757377334;
        Wed, 26 Feb 2020 14:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582757377; cv=none;
        d=google.com; s=arc-20160816;
        b=P9axqzoztBsn1ma5HHzJGM89G9Ry/Z/pbdg8oLCWYzi3XJ9rDp6uTmftlnrBGyWY5Y
         GNEJcVDdid9r0BsF484Av7wJ6pQ8G0JomMCIS01ZjUJ5Ka95bfQQh26P9ZkmiNYNxZ2l
         fR5a4L4wLMeoc7MSJfnB4txbK5U1sIwsjMGvKft1CTGVxqTMclHCEfxanEHzj+tyxaKW
         MZLCjzBJ9S0/GJjd/ILb3DgJqkkMoKzaGWxsruNXeavXhE0IZyTq4GEsN1HkzwWulGWh
         toyDWOB+darPKYyDfm4NmPOsEcnbzRomYZeFxHNcrdnYypoKx5p8HxrASuxOdtwhJ2xF
         iFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=lddS2VlumpXeIp7BEym90o4BZfJeiaqlF4g1shtDhd4=;
        b=g5olgToFamV2Ml7gFF4fx5P39JY5RizSx8fcU3Y59YBIHAY0HgoNnNY1RwgySY1A+P
         skgNFn/FnowtOCtB78pklUpAcO9zPJbt34cob86O/kANcWG+a/O+lPAkgkNThwQeg1CT
         n9A9QfmMTaS9JC0iy3tV1F8Cw5VE9Kmj3tt2H0/VQOtHa0Of8FDdcX2pSUoY1/wx4zZ0
         OkgBplDY4m251t6+7m84h/uAda5YtyaImX7taILnuGS+rSrO8sOW0PURZB8VVL9h8YJO
         4SAV/JjEiprY2Ngr8Hv/2cR4UoZ4n18PjESRT/gTcixsNA6vwZJjn5I14bs8G1Efj4sl
         cP1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BzxxtR6l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j12sor1132560pgk.68.2020.02.26.14.49.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 14:49:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BzxxtR6l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lddS2VlumpXeIp7BEym90o4BZfJeiaqlF4g1shtDhd4=;
        b=BzxxtR6lBtU0rxgUmDoIOyhez1+GDm/WOtTrkjIOwXf5ZgaGRCxNy/08AhBRDmUBmz
         huQI/uQRUJ54/iEtCYot6ijxPrZGiNYtw9Fd7zep7kCa2xZ5K7PcoSEEyTWLcNDIGeP0
         vvH3XbUctHsm4U3KalU/nwXq9DzqL74Obq21lA0EdHAf/jtt3Y5oUa8kPZnLST8M7w+H
         tzJPAs2e3oYPTSXnN1xPnO6cynnd6/Y65jMknYWgQ/arlLdyOES/yvhfmu1c6M52CGpq
         XhgXj0R0wYNQhiNA9uI/+YhdKOaNkh9FIHKOa9LifXENdj0ujJ00H8wA44aCscYn8V3g
         rcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lddS2VlumpXeIp7BEym90o4BZfJeiaqlF4g1shtDhd4=;
        b=iWI58IQoNVF5ILllVyWb8HeDqEE6iYHKnYBmc1B4MY9LQLKQIf4rerdeWBfNepcyeV
         QLw4sI2UziQfnVEMGeD0huzBmrkZE099xzcHTbMpAgzuACY6CErhcRPUNvy6Z+6gn5/l
         GGDD+gyYVte6CG7K8LpbYLQIP8Hdu0P7fVsF3fiLdpj43H+MSoye9lKdG4nbUpCYxZQY
         5o7B4HmVAfN3b0D5Ey1KzEoGQQ6oc/JsGWGBOi4wLycpN7nDm/fl3xTMzSpexNpQ2ACX
         wJIqn1JqH4R+Gk0jYclNkdJ7MmT3kKKaihiAwGhs2OS3y/HAW8SqNiqqmmRjf0QBxnat
         f0rQ==
X-Gm-Message-State: APjAAAWmLHr9lNBqz251DbMi8KAa9UdJCHminqTRnv0YESlMWL/ZTqnF
	uzu5yXvzT8gdZUFzP6a8Hd0MJm7s
X-Google-Smtp-Source: APXvYqxRMvdw9toXsMeeX6Fel4mkiOUUFcPK5SbJTC7/vR92EcDWXymf+9mbDJVBbvwCVnn7AvbfKQ==
X-Received: by 2002:a63:2e42:: with SMTP id u63mr1014320pgu.137.1582757376627;
        Wed, 26 Feb 2020 14:49:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id z27sm4379589pfj.107.2020.02.26.14.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 14:49:35 -0800 (PST)
Subject: Re: [PATCH v1 1/4] accel/tcg: use units.h for defining code gen
 buffer sizes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2260450-93c6-5e49-b335-699cb2a43677@linaro.org>
Date: Wed, 26 Feb 2020 14:49:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8+tIyH5iZrrn

On 2/26/20 10:10 AM, Alex Bennée wrote:
> It's easier to read.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
