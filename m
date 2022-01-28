Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp67691lfk;
        Thu, 27 Jan 2022 19:17:25 -0800 (PST)
X-Received: by 2002:a17:90a:3e4a:: with SMTP id t10mr17466436pjm.70.1643339844862;
        Thu, 27 Jan 2022 19:17:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339844; cv=none;
        d=google.com; s=arc-20160816;
        b=F/EQKnpoEYKeUzbv4u31uqdqv8qSDJTsa6hcashEqC/Uf5ij8RgA7kNEh1zDzlrUzp
         OaZcc1XqyrWlQ6kPNne/s12ZoUk7XJkqp79xgvOd36DuATaKFEDZSMamp6JE68enJdwL
         m3ycHIBDe4hZpHsBClnSrAi7dcE574hxUCcEQ9hfWEggWsslL9QUuMNZr0eAT4lTyGe5
         GWTr9gzyv32uGFeK3Ldxw7zOOvMoWPrv04qj7Ewzni84xvTdvq6lRcNE2O3Hh/TnWg+d
         VTGhh+okPkgDhw2CfugHTc12ikFuTzUlRMCLg2yrsc1NzTDoel/ig5Mbl0kJOQZQU9xR
         4TSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GQy7nEyfk1EiUxqWXk67kWEIW4HJHuQ1lTiL+uP1GrQ=;
        b=Gvk2dq7U7cWkbVwLmcEkItAS9KfCYwsVQ7NpCpx2ZnD5MpPdLkjCiYBQLWoK8wSuxo
         o1Zpti4NSNsrL8gg/cN315RMJFEo7RkqpjxjS8q2gyA4ZklCXR5GEDvD30gU4cgwKeHy
         Gr9fpM5yPw+KWuybYwkSiskcOi2SHZKQyQmRRoGFuAWwgnU4M5a6ABkEz9gp47M5jAOo
         rZJg0LgpxIMyCI3GNWAq0vj+mKcTcqfo7TccMeCkP+SDZuIDoVfpYQiGw/z44gR3IHkT
         lwEqkEjSNE1jNCbHXX06IaG41xcv+2M/a116A8fZ4FSTMDVPpx1+izrBft+ScLOFjxIV
         h3qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=orYpJiLz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3sor1916152plx.106.2022.01.27.19.17.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:17:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=orYpJiLz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GQy7nEyfk1EiUxqWXk67kWEIW4HJHuQ1lTiL+uP1GrQ=;
        b=orYpJiLzalft/BzOhQLoMrRahn85u96U/C7ewkCeJDXykz6D2Z7nnaHQUH6+pW9S+q
         r5Nk830h7P6MHw2BcISQ+xymJBBwAUbTPzp5mDF5o7kC3ZOMkjWkhmjpkYmXuix++Fvv
         tdjAkRgGD9XMH6ueNJc1ucvUvRaowjayxEHQ+VBbWQ45qxk3YJPWBGefICHlO9AjAyuy
         CDq5bjiL1LSdzbaxVVFCm7sbsjIEfqddOsFNzE/WCFv8yw03lhceyPyrKiKQJw+N0bwV
         cXnS3C1X1V8ag/A2exsrVUTM0j7L+jGeSTGZFITsoraeTHRwVZHwETymKU2BTpvD2H0A
         j0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GQy7nEyfk1EiUxqWXk67kWEIW4HJHuQ1lTiL+uP1GrQ=;
        b=5Il3U6XA5FvgU291/UZsfRWL0yUNkvza/iu7nzwNRWUqUR8rLdEDfgeO6zTacMXH40
         HLjQzWQeuf2bDMT5+1rygJS6rAN14jND258Icb/URZHt8QUIh6ha3r6C3FByvHiEzfZP
         AfSxOW4jN/+kRiov9YrW5Hpw7pkg6mnCscHDS1B35rlELVSkagbdmGQRbE2XBPPivCs4
         4liW1lWVEJQXGrfNkBsrNiRooTqtY6+ZFQ8tEcLdaNFHlTcgPkzT3/2H2NACpM73q5kl
         AjODp+ZnbhFPZfNQXK7OlfR3UKOlTZROAu30U/KY0R2V69E2QMqRry05tWTnShPlDEtq
         SVOQ==
X-Gm-Message-State: AOAM53271HkgNaxYvjtbcdh+yo6r/nSUHhnY9Xwt1C8ndeynziDRWtWv
	Sr+bNzMKoV8uevl11WgPnmH7HpUF
X-Google-Smtp-Source: ABdhPJyOVpzFAPsW204UdjuFj04/KmS8BoFGFlDpBblNg6Mqgc2xqbGS9rt56B+JJdTAOVVrGq5DmQ==
X-Received: by 2002:a17:902:6b02:: with SMTP id o2mr6162912plk.56.1643339844389;
        Thu, 27 Jan 2022 19:17:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id ml14sm645248pjb.10.2022.01.27.19.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:17:24 -0800 (PST)
Message-ID: <0142b4db-58af-0303-9ae6-89b8d16857c0@linaro.org>
Date: Fri, 28 Jan 2022 14:17:19 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/14] hw/intc/arm_gicv3_redist: Remove unnecessary zero
 checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: TnCWdkmX15xs

On 1/23/22 05:24, Peter Maydell wrote:
> The ITS-related parts of the redistributor code make some checks for
> whether registers like GICR_PROPBASER and GICR_PENDBASER are zero.
> There is no requirement in the specification for treating zeroes in
> these address registers specially -- they contain guest physical
> addresses and it is entirely valid (if unusual) for the guest to
> choose to put the tables they address at guest physical address zero.
> We use these values only to calculate guest addresses, and attempts
> by the guest to use a bad address will be handled by the
> address_space_* functions which we use to do the loads and stores.
> 
> Remove the unnecessary checks.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
