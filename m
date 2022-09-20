Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1833631ejy;
        Tue, 20 Sep 2022 07:45:34 -0700 (PDT)
X-Received: by 2002:a17:907:5c5:b0:77d:ea1:44c with SMTP id wg5-20020a17090705c500b0077d0ea1044cmr17529530ejb.305.1663685133946;
        Tue, 20 Sep 2022 07:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663685133; cv=none;
        d=google.com; s=arc-20160816;
        b=Dd4YbS5FiG6yq3X3uGTdP7ITdFE62szWtnWHz93eCHIYgAxSaC2c5SL+peKyV+ES4F
         40lDOCTiyqyBRVmtFw/+v5JY1sf06bUW31pvDqRtALiNs3NrphjpuRd8f3vOOwsVi8B2
         gLTzFE+aEZyJFlnmUcsjFqBcg/O9njuqG+y9Ns2eWEefW+0Y9ylDR6Gu/M0wbBTI1MHN
         rB4u229ElRWg3sqUG8qDDPuu3CHCesBQdxwOGkT/t1IIEdxUlEJMxl++gjhtpCxMuTSa
         81o9G/HD1gFfP9UfPu8H8nHJZgdML9aZ4paEoDj1NKj3h6ffWvrI1weLb8CGGmxPCc3b
         kQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f52s2jYyqe8EPPhbdNSwlwC6T2E3o40jSd9G667UvxE=;
        b=XcRxOloJ5NwuGbfN8p9k6I7c29dmIZEgqrcvfPJHxdwlvoeSfG3ZwIECcbu/lncJ7W
         uSTVrA4LNaV9gABZC4Ty9NJiu/nufC3ZTh3c9JRekULEcp3bG2yJmz5x4qSrVhT6e+2X
         tULvZ4/vrydkaFDPh+BLvF5DHyEt8VqwWRapm/HOJp0kF+afTQ0QpzDxXvruyeT67BM4
         XCdHUYuFTmlehZsM+f8GXvv2Zl+RRS92EIrLZ4pi9PZoi0ZjlTl4UnKxh7eHHiuycrwR
         wLe8cbqRDBN6HyDSrUWG36KW8vxA9IoNzTYyH+PM8ITIjabPSoqoinuACo8RUmFhWAUw
         1cOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCAjQPP6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lc10-20020a170906f90a00b0074709de97e2sor838451ejb.95.2022.09.20.07.45.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCAjQPP6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=f52s2jYyqe8EPPhbdNSwlwC6T2E3o40jSd9G667UvxE=;
        b=vCAjQPP6XC19dI8UV/eIQK/j41uEzIc24EzBDBUHYurRN7qUx03MICCxZNtW/np/lk
         nf2225SQLydb6I2Mr22hh1CAL5dyc8FjUOfRc/WBrAplO/okl2jgzv6k0iKdR1NPzDgj
         csPQ1X2z7S5nUjY68aXsyQKDZwXvjvaRIOb0z8MJjxXcxBrojUxrcpuRasT01+i002C1
         IPhOmVWC5bIoLa4GZCzB0k012Pe1y6Z9Bk3Y3iyH4T6X1h4wxUmM3XmBWLRfpcmhN4tA
         kpMppspNPGMzrqLhrFBa/YPVPlRnxwt0hnGiCO1Rj3nG+Clj69Tqmj9GeZlAxesh9jwE
         UhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=f52s2jYyqe8EPPhbdNSwlwC6T2E3o40jSd9G667UvxE=;
        b=kPd18vJBY4lr+Xn0dKZuF5m7h/X1HvCS5LK104R/4wuQeqwkD1bK5dP4I76M/ygvYC
         kMfDMQcbh/6JMhtl8cXrq9h+nmsOGGiJ1c97AfAgD5MVawBe5Nj5tE1SbFWrEu4GSrhx
         RFVfhNAiw85pAQdZR6sdnQ5K9k9T/7x4cq8cmI36TBC+iPB6Z01vcJaBqjzOTm1DHJDS
         l0WjBm8YWEl5nRlW7WYyrSraZZkKCShvFExwRJWmhr+whrUT49aLIaWTuUtNkupj3h0s
         RvPO4Zb+X5zzfug/XWYW97CO9cMqQOYV7Da8trz3mGaZTNeNkYFBNJKgbb+cVWMJE0cE
         0GtQ==
X-Gm-Message-State: ACrzQf3QmGP6GSDmByz8ywxQebwlEQ/rFgLO+Plh6Lw+kratJH9jFGRc
	lCYamqSFpjzftFfeobtwQtYO0JznweZq0JqLcleXme8A
X-Google-Smtp-Source: AMsMyM7h9srkWN+QVyQTCCtQQ2iYXBuSVslNkDaxN5RIv0MR1bJfXvVs8Y7nrwm8CJImrWnENM6qmeU1JVVRwzCPONc=
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr17757820ejc.659.1663685133755; Tue, 20
 Sep 2022 07:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-15-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:45:21 +0100
Message-ID: <CAFEAcA-PgR_dX_2310wLnV1=r+KA9cRHjq5kboVFhRn-jmyqdA@mail.gmail.com>
Subject: Re: [PATCH v2 14/66] target/arm: Add is_secure parameter to get_phys_addr_v6
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: V8yUW975eZMl

On Mon, 22 Aug 2022 at 16:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_v6,
> passing the new parameter to the lookup instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
