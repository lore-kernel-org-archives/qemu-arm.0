Received: by 10.223.150.237 with SMTP id u100csp2446546wrb;
        Mon, 13 Nov 2017 05:26:29 -0800 (PST)
X-Received: by 10.28.9.197 with SMTP id 188mr4781912wmj.20.1510579589606;
        Mon, 13 Nov 2017 05:26:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510579589; cv=none;
        d=google.com; s=arc-20160816;
        b=Bl5hmdxJKYqBHAa9NIo5JnX2u5GhY8WQQM/sncfIDLnAJQfUyjvU77RBCZvIT7uF/F
         H5KO+noI8b12FhaXGD+ukH0rhxiMvT266LSxEW9DSvCmLKbDXIqOYdo5Fo7Xa02rclEO
         bnqAqUKsgqubvq1Nze7cxaHpCYjzQhNsDUClw9vBHzJ+puZU3ukjEYPaft2shGgWArhb
         vB2+7Joo5iG5szGq/WaTgBcSvu9we/Y07PnFelH5Fcouh4dmHl72Sk4IfjqplH4GbbKN
         Ec/BuEzmmO23uPvJaIzpF6+nWpc7MSbrqBQbxr0z5qSwJdYf7MmOGgMxebaAtDqQyLlz
         akug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FhrnYC1UMO6L+LXNAz6Hnax8Nyko+TuZxHauuhtMWkk=;
        b=MP+oh59FJVGgAqXrSNDmXAzLBbsdWl3es68p2BJerxywLaTUmrCZPJ/nh1u1amjmm0
         V7y662aHdP/P+zNtjTuQHEqEJbiPA4iuXpRTrTZv68lq8Xk9e7f+eckUPHMVV0dV//ru
         sur7ODE7VhyEtj2UGzzmgHSeNPmPP42Zn40zjhGro4SUSF1i493XbBgldphXJY6uox4D
         lG9uzzglZdH8d0jeu56FdgyHHCFF+BptPhWTuh4F9EzhOgX1AkYUj2lHiBMc5lPTAj92
         XbUFp98Vizvsf7j5c/aRxtNfEW4sMJlXM6OE9a0n/Ckowg91ZJFGECTWFLfuXjTOr6J3
         pBZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=emZ27elY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d195sor1688662wmd.10.2017.11.13.05.26.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2017 05:26:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=emZ27elY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FhrnYC1UMO6L+LXNAz6Hnax8Nyko+TuZxHauuhtMWkk=;
        b=emZ27elYXTjHt8Un9YZo9Ouw6Z4tZzW7iLTFBuUW9LVq0y9fyTk+aUpl6BmtW9XBVU
         +dat0wr75kooAybeIo2nARTfR46vJk1yaU70Htfjjcv5rEp83XYZhsJqUrWbOXdD6TKY
         TQ+sRVA9ljgzG+3twGIA942WPI5NCji6/YpLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FhrnYC1UMO6L+LXNAz6Hnax8Nyko+TuZxHauuhtMWkk=;
        b=rPtg0IxEleRchllinbfbmRRbs/apu7+n3pr+/5yJDho8+AmSZQ612g+mm94Yaj7e79
         /v2NXAVgIAiwE3bFMF9bqDICx6lhOoKZ7RymwuvGk2jbvs+gTgzd/8Zyz3Nj8o/MNDJu
         VbGuJFZ3t4iRL8RFg8kX0ifQpxYJnjd9BAfTW0yzeWlgKLZMI25aLfayLWDXsIIlY3P9
         Vx8reUtvlNnUUYt2CT5IgymNFmxaKXAWXY4FNsFF3QoLaDSh5g0MO34Fu/PInxPgwpSa
         7Fbsd4+EyzIkg/R6PDjoE5JQaev71P96NviMkSFsdbQCGSvrc4HIPqmQeB7Y2CV2fGOd
         sSKw==
X-Gm-Message-State: AJaThX67WThjqzYCoZtYudvz6OFX63RPDFM0JMV3XJBOsDotmw1KbQsO
	Epsn1oN/GJN1Ie/TiBFpBLHHyb7qggNIKbW5gYxBhCiUwzs=
X-Google-Smtp-Source: AGs4zMagGfBWsIxYa+Nw6ygPdtMCuEC4cPu3SasGli/TdPR6HryUH8yo8ggjDBTbBAZ346NVH1BJlzlGCtNfh4BMaAo=
X-Received: by 10.28.14.195 with SMTP id 186mr6266106wmo.56.1510579588997;
 Mon, 13 Nov 2017 05:26:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 13 Nov 2017 05:26:08 -0800 (PST)
In-Reply-To: <20171108153245.20740-2-alex.bennee@linaro.org>
References: <20171108153245.20740-1-alex.bennee@linaro.org> <20171108153245.20740-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 13:26:08 +0000
Message-ID: <CAFEAcA8OHOQ_8cG=fXyoqr6f9FiEyBx6zeRu=04cyojpEZVWcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] accel/tcg/translate-all: expand cpu_restore_state
 addr check
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rdWCqM387ZVs

On 8 November 2017 at 15:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> We are still seeing signals during translation time when we walk over
> a page protection boundary. This expands the check to ensure the host
> PC is inside the code generation buffer. The original suggestion was
> to check versus tcg_ctx.code_gen_ptr but as we now segment the
> translation buffer we have to settle for just a general check for
> being inside.
>
> I've also fixed up the declaration to make it clear it can deal with
> invalid addresses. A later patch will fix up the call sites.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>

Thanks; this fixes my test case. Patch 2 is just cleanup and looks
like it needs rework, so I'm taking patch 1 into target-arm
to put into master for rc1.

thanks
-- PMM
