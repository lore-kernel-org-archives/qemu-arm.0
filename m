Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3545336lfb;
        Mon, 9 Nov 2020 03:40:55 -0800 (PST)
X-Received: by 2002:a17:906:4c57:: with SMTP id d23mr14405132ejw.321.1604922055266;
        Mon, 09 Nov 2020 03:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604922055; cv=none;
        d=google.com; s=arc-20160816;
        b=m1SMEoXvh1cTeuqiZYxJ4FaMdRZI7nOzMl/rCEXgK0Kp9FT9vSH2DE95ZpciPsiais
         0fdEAVsYyFysPxLLz+YP44e1WD3Cqo6p/j7YuRuUgZEAV1wdxkPG+o3Ms1u02JeeC2E7
         r9kQQ+EG5URLdOAARSgBSWzf1YaMGNVe9ipwR2yAVHm4M5NkiLn94/tersUOsveHH7Ff
         lHv/emrvQTjfcw1ctDms23yEbINCz/c0lfVDaMhDye9OaVsdZV/hv8VZ/13xRY3pPCje
         MM75S5HHS7dAqSC3ke70evPRPVD7U5C/dEBuyIvhdH1DSpThN1hzJhv35zGEqld8KfPu
         6Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XG0SOwja1RDaaocnQZLSCPPfozCHS44al741rtl/Fn8=;
        b=afsemAN0hVpet5G1Zt6D27N+b805ebaNey2X3wvw4pDU1cs+NxCVagfuJ9uMU5Mwix
         t+UpdKi//CL1XP59Pm3sUrneL2Tx262Tf7qiloF+cepvOfL6Z1ZvF2NsK79gMVpxuWdL
         krZWO8OlBWEX1M2bWaQpZIUv3+T3gc7OHNArenYmul/o2kqM10JoueQgEbh13pOlA0It
         ihAoMu3MvKj/CfO3lPLVF/di3uNG/c3wJff0GMgPBkTxw/biiqD2OzwFembcoLSCiLMO
         Fou3VHMqLOD6eZeyA/dlRZCPTEvrQC9NAY8nuosRiUtvkTMcPakDzD6ZPvSC1TJyVlu6
         Bb0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDqds2a2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q10sor7830210edc.27.2020.11.09.03.40.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Nov 2020 03:40:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDqds2a2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XG0SOwja1RDaaocnQZLSCPPfozCHS44al741rtl/Fn8=;
        b=CDqds2a2LK2KOwyQHsJh7ZCSW9VhGA8uKOhoX8pZDE2KIY4ka8NF3QgcTzOihknmn+
         eJpvbE00u3foE3GKKDyRevGz7Cvemqd8ENXXKNOnT79h9z2z1ORPyFqT/jW8Tav8u01c
         Akb9RVOkTNESiC/wXCKPyMluy/XCstgt4lBHtg4ayMcJ/hGDiAe3Rd9y1AxgOXpYypt2
         3wiQJl+EnsIAOV16LvFUOaVAjDCB5BMtdXfbrYGwVCTHInnl1zqswHy/HWkL6Jo23FQh
         685dHmMKGTCl4SSDYIlzU7PuKy48J9qv8l9N90qWefuJG0jdkn1YcyxtlVSrvoVIYBm4
         wzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XG0SOwja1RDaaocnQZLSCPPfozCHS44al741rtl/Fn8=;
        b=M9sdto3kPPhXQh8Ez6Fn0EOqAMN38NxBCS+Bvp0M8D/37ApCTUORwkOPRVk2jU3/9+
         7RivEJzTYC44PmHjOfA0MEuEK9wkgCToK9N1jbVaS2GF2Qgm06ZElkM1o//A8bXFd1Ll
         Yj1R0zTtCtymY1/WBH7JJX7oiKL3AUhofa03yM2Oo227xhWbdAwY0MMNNjOnG7QTSPKV
         qcuyT5E9H8z2WlWYcEJb93o43QVK/fz7QHHTzuBprNT/9zkX6WOd9mpLLFjoW12KK4ZQ
         Kv7fKt1dy+VIfGLCEfEzP3kWDPqSH9XZbdS/3+0+krVEHKdfHUawdnVCWJMFQd7QbQaQ
         9Quw==
X-Gm-Message-State: AOAM530AFsq2Q/V3l5ZGJtFxtGtXmyt8oT2xFfqIskiEr6CEDUKK46lG
	KJOjvQbaP2+kBYz24lJK73TEowueAf99FSEWmJgRE9Vp/7HfNQ==
X-Google-Smtp-Source: ABdhPJy8Rb8vKQu9Wyj80VFgP/qukM8sBMCugZ0siTTz+1DJ+h8S7CdLxUXWopNB7jYBFAZUW9wY8+HHDze/59rTll8=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr13729883edt.204.1604922054795;
 Mon, 09 Nov 2020 03:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20201104165254.24822-1-alex.bennee@linaro.org>
In-Reply-To: <20201104165254.24822-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 11:40:43 +0000
Message-ID: <CAFEAcA9oWroNyZMzesaMSoAPXZRiR17oFWcENfZSorXTTG6ULw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: add some notes on the sbsa-ref machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Graeme Gregory <graeme@nuviainc.com>, 
	Leif Lindholm <leif@nuviainc.com>, Shashi Mallela <shashi.mallela@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Uvz9n1L6x9zs

On Wed, 4 Nov 2020 at 16:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> We should at least document what this machine is about.
>
> Reviewed-by: Graeme Gregory <graeme@nuviainc.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---



Applied to target-arm.next, thanks.

-- PMM
