Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1832101ejy;
        Tue, 20 Sep 2022 07:43:01 -0700 (PDT)
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id wu10-20020a170906eeca00b007306880c397mr17118797ejb.593.1663684981635;
        Tue, 20 Sep 2022 07:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663684981; cv=none;
        d=google.com; s=arc-20160816;
        b=ErzX2tuzxYptlFFxvC+yMxBDflD4e7gW9KPkODcaHygq6/tjBCcnrfiO5TvwamnzY/
         cWGBBdcwP0Bds8RglSU5hjAyOc6i55Se1sSYgrrfuoc4iuZ3AN+gebXAGqr7pT8Vf7oM
         z2DbaYDE9SnxPBACow4FA17ni3OfNJmZLzZ3QxG/vrQ/IPRJCsKJ1QviiUCPX+Gkb5ok
         +McuE3R6AnyTCyERO3ci2slu3hkeAmpB5iigMfhj/Rq95HNcEQe3+HXDZVxUq2aUotrY
         DzP22J4gFR/O5istaTfDiDDxTT6AfyGGIE+jbQsIls5nTqqV/GHmRDXJmvYeNbVAvbqs
         jxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ngt79zf5xbmNIbScywJt3+l5xJho6+RqjbbqkB16kZ4=;
        b=X39TaqQddIGRVkrHODziUzwNwc9RAjvKezncuOakQWAQgNopuXrcKT/c6MUS7KA0/c
         18mW2Ucc4T+L1NP+jcgYUsQazB2BL5ASHu2Q04f6eW0IVJmdpi/zBQ65bhJ6XQAah0ZA
         3xw+kPWdCiQyy9py2WhZTNxeLbVcg1tXHIeJUb2N16qwSZKvYPfdBZDPCYCupgzejYK0
         XRLYLd3xoX34wLLNRdXp1JDdWV0vKjvAzO8qoGISL1oVBm9KXBlUNKn3XDfutcsY09af
         go5mOkFMoC5Jjko8oWy9gO1Rd4C5yf/RvTiqIXGLgwBe2iRKrCK28Mb/a75vXqsPy6BJ
         2E6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYtj2Lfm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m26-20020a50999a000000b0045467008de7sor178575edb.31.2022.09.20.07.43.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lYtj2Lfm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Ngt79zf5xbmNIbScywJt3+l5xJho6+RqjbbqkB16kZ4=;
        b=lYtj2Lfm2+cLphMf+3PNPCmKlD1zEnuqKkFgbd9QZLFVLDuuPirYH1qTwvi4MZn1nJ
         3FMPI4M+FXFfRlxbKNxLyUYinle6ZSlBtRaNSxlQ9eoa8qDkkYCtp0KCqbo6kJiLNo3s
         DZmnIAuM5E/lziqhN/O/mj2abG2/T1T/r/abDV81fgwni1T3Fkkunv5b8o1XzyDB5vCF
         qKD7zds+MAFbj4FYP8sRBGWgvtr3PqTdAvuL9DBnuS37SpHJEQayiY5Fs09SSb8REzAs
         khDuggp4HMTMK9KXoW1bpqOYz56H2DepXa1zzHuA+1xzIT0zcPx4WbavakFWxDiwPdCB
         L3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ngt79zf5xbmNIbScywJt3+l5xJho6+RqjbbqkB16kZ4=;
        b=1c7k8nWeBkmEyUM2DdYUhyyERrVohDVmbI4WoxkpSJ2ak+oyZonVGZiu8i3SWQaFeh
         r3ezAyELAf/98jDKEmD04BnNVFRF0xj0osyAgdPs5rfC4p66UgO6JrZide6mnc7uYUNX
         v8Rft+B6+FJY9Qk9aL8KE7NrXQ66GxdU9k9sxoiJIQT29DTbPchsXoJc5IcAgGzu8rTh
         Hd/X7cYk9sbnxTJyU+NBehGGHbLBADS9n4SclzRqFxMFHuFoldKyHCegVy9ZwPsrpkSL
         Fo3QzOEpaFzVywvHvg/J9b+4EetI9dNTkb/KXNz+qioBbVQCwAOeoG9vvMxO2pzVKRtF
         ItbQ==
X-Gm-Message-State: ACrzQf1x+efSzn5B2pVI6SjapHcG4xYVA+RiVjnHPwP6QuQxMU6mCW0J
	UJL7dpFCDbZT5yLedXGZuqyMar+EIZQxpHbbSsS5QuL04oqxXg==
X-Google-Smtp-Source: AMsMyM7q12pKv82CtpbPE1v5fG7j15281KBbAhNdoK7NsVQupkepQgd2A7855ZknyEfGCrB87LchbEK6FxzFUN1zMG0=
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr20113573edq.140.1663684981480; Tue, 20
 Sep 2022 07:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-12-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:42:49 +0100
Message-ID: <CAFEAcA9oJyDmN2KR2d4MSOZG_1WCaziYWJX6LhXXuV=dEGB1pA@mail.gmail.com>
Subject: Re: [PATCH v2 11/66] target/arm: Add is_secure parameter to v8m_security_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: tAHEItuZJeuH

On Mon, 22 Aug 2022 at 16:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from v8m_security_lookup,
> passing the new parameter to the lookup instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
