Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1821150ejy;
        Tue, 20 Sep 2022 07:24:41 -0700 (PDT)
X-Received: by 2002:a05:6402:538f:b0:444:c17b:1665 with SMTP id ew15-20020a056402538f00b00444c17b1665mr20471155edb.98.1663683881530;
        Tue, 20 Sep 2022 07:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663683881; cv=none;
        d=google.com; s=arc-20160816;
        b=eP554BSbhrXswSwyeK3K3EShJYnKZhPEbM8kaQIPZMBjCkFiRI3ISEa9nh89zHs6mO
         zhIcM7A7XIWz25w1k/B/BAf0h029hzrYU7/d0NFTwzBZHfDo/rct2w4oeZz5HQBVNuNH
         tUe1cbF4otWCXfQGC+R/4Lj43Sre5qjQvDKTID4aL/+NMgOzvP+0oaZ/4LC16FnZ6GZg
         bV9IjdClDMiLM28kauSpmwJr1Kip2x9/xujxmBB2xWmpImz01N75s59s7VwTGcsxd6AK
         oHapxuyPBxpLOsX/BBl1zqlbHYRvqR1oOsbwd+o7+bMzMUo/RuY/AXCF9+mJ90hvLAuA
         wEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iCnHwFqGnExLVGQI6yrPq1fDyAe4h9fY6ggPnk1yyC8=;
        b=0lDZAgjgMXfMbziYYgJQYtEqMGoluB7cXXBQkk8vdJKAfK6udYN9IUQQjn9jEe0tm7
         EIE9Bb29EtucwEY6t5onnXQ05WZ5t8AL5RnbXxi+pTsuc2h1N37bjCkm120f1xPHc8F0
         y3Fu4ZqaIYqfk8x1VjUF7NQ5ZrImaYkOoR1itPWWxDOfLfdAw1pu/rCEywoWPgq2ll0x
         48P8p62j1fRW17LKv8bKQoN0D54QoVMgBmDNrdWBSu7RAcivgk/9j9cm85Zk1s1/tkv6
         zeXgGIJIG0el9/jhtUbRm9Lr6/TaWRwZQnDyqr/rsP8lwQjVFQV1J92UuKUmYWw5vnkn
         RNyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FHvPMmUM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s30-20020a50ab1e000000b00453d10c5f22sor150578edc.29.2022.09.20.07.24.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FHvPMmUM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=iCnHwFqGnExLVGQI6yrPq1fDyAe4h9fY6ggPnk1yyC8=;
        b=FHvPMmUMJTkTw/FeExLLUNZVYSHVN5pHxe9BmvES+BEb4Nlk6Nfb3F+vvMK2xWnF3E
         5SB8PSxkdxJZDEQtUWht701b+9/M6XshWiEmNW2n2oTmQzDSlmCWxVyHLLOBFfEuOmAw
         CXrFnWiunwCw5jArxk/smWXmdobGdnqbCeQyF19lk0lSraIp8gZs4aNz00wbEN6uGZl0
         uteto3OmPEN3/6zQLOMqWBClqtos6nikYG7KgNqD9AuzqZkUydLoPfVez8RzhUafccaO
         d48120z2YBE7e1KX/7sBLnYG3PuHhv234Px13JRLPBagAVxM7/2N8KREcbhCJux2QE1y
         +MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=iCnHwFqGnExLVGQI6yrPq1fDyAe4h9fY6ggPnk1yyC8=;
        b=e8SecWrCoScGq3TKIW54wNI8EVYk5fD5v5rctrQvFNgFAIwXsnuLhfIC6dZna/l8ZT
         sF0XOXkyhBGSWkbjKzHzafzy0h4ouNr9W1YCkQJC5ywzXHct3gHQHIPEZ0TT4h8pJ5Cj
         +07yZSHTgqiN8Que3dmj8FpgHaahz1CjNhx/n8KxEDg81NeQGBPQTPLTLWjBUgJM1gah
         wGHKVH8dixt/xpC04xtGbYPIs7jLx14BfRkX1g9WG7iNpiA9/3izonsRZrp3wRwGA86g
         V85ePKVjyZYPD50nomuKBP1AyMppad5Ycc75+PbmFivV8CRLCPYZ/YrcoQ776D2fAT4w
         F/4Q==
X-Gm-Message-State: ACrzQf1nRFdSJnz8JEkl/ltuAk5PXk+u15udOoAHfsehtbriYmRD3mTo
	RDath7+I5fQG6pyl/Rv2FNSlREkPN5/+rrbC3DbMAfi6
X-Google-Smtp-Source: AMsMyM6ZgxJ3DLmHBwHC8lXBaPdXSfPKmD93Poct6Xp7uZcHK/kZWhNs4UmjiC2uPwu09z24DV1qSb8wdtnQ1/lXERw=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr20700813edw.53.1663683881306; Tue, 20
 Sep 2022 07:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-4-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:24:29 +0100
Message-ID: <CAFEAcA8kq-LCeBG25g3nhN9Sh3XnHniZLr39AqaNwoCcgwJKMw@mail.gmail.com>
Subject: Re: [PATCH v2 03/66] target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: TGmF7slvy9hl

On Mon, 22 Aug 2022 at 16:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 69 ++++++++++++++++++------------------------------
>  1 file changed, 26 insertions(+), 43 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
