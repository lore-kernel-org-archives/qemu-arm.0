Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3439353lfm;
        Tue, 1 Jun 2021 02:14:41 -0700 (PDT)
X-Received: by 2002:a17:906:da1a:: with SMTP id fi26mr21431880ejb.499.1622538880913;
        Tue, 01 Jun 2021 02:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622538880; cv=none;
        d=google.com; s=arc-20160816;
        b=FbLzxTQvijsq1lq6esf9AWySwN6nwzGy7wneDy+OU+RQmz059GNHuRvRbQ7P/3VtBY
         CSo+MTQXCNksfXVL+8w0mUXrtq5g24ZVZoea+h5XmDbNPottulX6jYNXcUMTPn9O2sDw
         9SCRD+0ze/Ti71edDDTy1nQacd/nMRTAsM0KHBdqf0Bwb8s0bGEDbNppYkwuu+k7w0VT
         HAZeM1JZKczdkmZ9iLe/xOoEy+wyfRmvqsw7sdW2Di3JSefXCAUW+BeKwbBKUVtl234i
         P2UvdK+whVgPeHIq/iuPCIESPfdeMwJs69/6b5N9Pp0pVqYG63FHM5JtVVIWIIppnvMd
         Ay9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmpkarM9OseZRg+smRPLoGKw/mKPXHD0YJmZEPjqdvo=;
        b=rlXUGtsK6Oycm718vDktotLJyrvgOho72bcH04AQlpVCDHlChAfP+Me3TzY5s6hhwR
         ikFmH4qUp7seETq1Ffq7N/RHkgPm9X9+HXEm4TzsRy9QTS3wL+/O6nhPuiuvbcCr+xJn
         WgcRDIfgmvmPVK1WNp2tXa1C3BXz7MWUfP81VmyBihDG9QebHD7t4Zemld+nNXm7+YEb
         1SqooOGOkPd/+4egMrO76wcWCVrDSj2+NW+bZJe7pQH2RONJAh1PBhfS9M7QmDjJbyK0
         YrL2WlH7mCPLh1cRTu8OiLYLLnpYZPsxP7lsiOjSGviqE7wN+Azw+gfZiJXo92a1zoof
         ykPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OrVw0QEX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hg5sor481370ejc.60.2021.06.01.02.14.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jun 2021 02:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OrVw0QEX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jmpkarM9OseZRg+smRPLoGKw/mKPXHD0YJmZEPjqdvo=;
        b=OrVw0QEXkDiyIOPyZxLxGCmZjygjUnMA4A1QovxGHhcUTrRP66VAq6gyj5urLc3vR9
         Ad6FcFIHvSy//+UbKXPNkTqJQmcoWtbw1zduiyQFFD1+CQuJaJT0M+RjB71k2rZ3fXqj
         NYnfiuLu8SCbX5dgIYr1aTLuz8llOIXsmYSHyDBOVYZ8s+HIQt9dUr0rAx5J7456yL8Z
         CbioeJUrcwQ1ufkD+7CbkrJJNU7+vYRf2loB1WQAarb7EBahv4qNRbPWbrNz39Gpwxln
         vBZO5w2o5jgdjzkdhvZSmbTnw+dKcsHJuqU1M+4t1ufIhQ2dQq+930NyVaGweXn8Jkqc
         2vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jmpkarM9OseZRg+smRPLoGKw/mKPXHD0YJmZEPjqdvo=;
        b=W9nx3BWIIZwcnBJGrbpxDx9MNjZDNw9gFdepKXl3QcduIRoOERyTtbSOahHdBqmcAG
         GuQJfn/g2AIFjlV4b7OWSvulce1U5RjubMIeWscWmdbeT//b1TouJeUaJcrrtkVL6Q+M
         mYd+Zsj8igUx4Hy5mFJt1Wo894rrczX+1dsyA1JaCIBuVIrH+rs3ab7KOoXEM6f5eWnB
         q4DVlv3A98tpEtsqZNANgb9aY5DnVvTZwDFkTUUbeTHwaGPhfZqnIkssT0BF8ZWnLqDA
         i78g3W3D1yTKUG3maJrrKo5n1V77NIO44qaKYkOIvp+o5Dp+RIBEc1xuZKiqtEUZLyZU
         r0Kw==
X-Gm-Message-State: AOAM531LacW3HT6fpCDKXxRHamuQFYkw2QURBsdt+Fba32x+rWfkXQXb
	H8Gto2mDnCGPwsqRNab+kmY/lyya7GmEvyAagIlggWWSsx2v6Q==
X-Google-Smtp-Source: ABdhPJz6wUDA3DI4CTOLiVzbLSewD3gFQ74SNhBRQmBCKWXTybTC+43J3erpwUF4RROkfcp/iM33XrdZFqoOVdetGB0=
X-Received: by 2002:a17:906:a458:: with SMTP id cb24mr6193447ejb.482.1622538880716;
 Tue, 01 Jun 2021 02:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090715.22330-1-alex.bennee@linaro.org>
In-Reply-To: <20210601090715.22330-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jun 2021 10:14:10 +0100
Message-ID: <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew <astrauss11@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 1sZFOUfn+d1i

On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The previous numbers were a guess at best. While we could extract the
> information from a loaded ELF file via -kernel we could still get
> tripped up by self decompressing or relocating code. Besides sane
> library code has access to the same symbols in run time to make a
> determination of the location of the heap.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Andrew <astrauss11@gmail.com>
> ---
>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

This seems like a pretty good candidate for breaking existing
working binaries. How much testing against different varieties of
guest-code-using-semihosting have you done ?

thanks
-- PMM
