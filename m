Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4851839wrt;
        Tue, 2 Oct 2018 02:55:18 -0700 (PDT)
X-Received: by 2002:aca:6103:: with SMTP id v3-v6mr2340874oib.262.1538474118715;
        Tue, 02 Oct 2018 02:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538474118; cv=none;
        d=google.com; s=arc-20160816;
        b=QdYXeWWCt7wPGxwdS/wHxNhSeUtrRTqpWko6WrtPvIb2JsANUT+tbXA8lwrhuj9aQO
         i0pvIBqXTvVKlQ5nsvRCyQLcBny5Oxk1YeWFHS2h8xsexUnW/mnF1WdOBpC7h95fQlVU
         7mdSIoLasj5f/fJrLCls9RB4r5TSc4t0YGZEKQ/QcNMA034BUZVIjLR7l6KF/G13Xh/h
         tOwI1YVz58ZcjMayyxMAavIVQ6HHmHKQ4CMZLN9if7YhG3pH8gOsvsX0FZxSSaO+M3pj
         bSg5NlStohpvfOVKuJvIpyojW6JUIAQ96jS5woCcZjvwZiooThxWFoAkQiYq8XRBP7y6
         HTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=xl8JMEjK7avW0XEGPz0Bxn+WAdTlwFXn6bvQwTTBUSM=;
        b=wzeWjhSx9mXJQYvdCmGFEpZjtRA40HVGDFICJ4UHBr+V/R0A5N+xqXThp/LIwQWHL+
         7kfmv+UDL+O76mLAXIvtZfQBLHmPYaHbdFF8lTEzYDePl8qpGIMjH+8lzLymZNLhDKcL
         U2csZE4Lcq/9MyhJ2Lr9pXeY6tQlD+djATXSzXnOj6OKQ2C2wBpLqHg5JeM4EdN5njRz
         puMV7JFG0mFAF21x/TuuS4JKIZFUFlEKHlfdYXN/KkPHQPnYfgvNWrUr1SA3uAfwlCRG
         cV/kOasEzMWh5pNBJHB7pqCXz62e5NfjRr8w104kYWm+aJydRA8LOtxUHxgW+Ayc4N6/
         a1Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZJLNoLo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l5-v6sor7866016oig.93.2018.10.02.02.55.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Oct 2018 02:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZJLNoLo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xl8JMEjK7avW0XEGPz0Bxn+WAdTlwFXn6bvQwTTBUSM=;
        b=YZJLNoLog9O6w9Y0EnWP+HbdZVpLLlbz7HEpW5ZzSPYLE6Ir6NHA5pTT8k9+Q4mEJ/
         EunLKvqhpUBID7/M1CjhLotQPZa2Nz40JvDEw0YT0O/fA6gciJOqNDJAizPEKYuoLdJ8
         zaQnhzmWscT0KzlRZvj837gJeRl0KdDlNAD4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xl8JMEjK7avW0XEGPz0Bxn+WAdTlwFXn6bvQwTTBUSM=;
        b=ryMPNA+UVx+H719XLIJutKoBcZs2ToniDwpx+UW0ZNHdApQSO4ah3gg5MRxa5Ym6L8
         gtCMA51CRmGUHTVBt20ROXKDaEBOHudb915PufJyww3ssaXUnay/1j234GYoSf9B1rYK
         mABuUDvINWhj6qq7pJVwkTsL52DCdR7AkAxqG9wyDdtV794zmtgq1SUzSJYo1/k+3lDK
         Rt0Q9BsaGtzNlEBGOwps2HvVmdeyrfJStbS0f6iB/C11bHw4kqAtntmmzquJ1sN8mPzY
         5QPOFM20WaO+yakq3IllgEPdoNQHMzPhDN5duXBsVXxbpqB1XYek5qer1MJVhHI5MRIZ
         v7Xw==
X-Gm-Message-State: ABuFfoiKaYIxXYsdCHegJt/FsxABZDCgr4gZPLliilLizFSK9xrXTAqv
	eX9L+vioVVqTjWBT26QK2tGQjrOhzR8LknVIInHYyRfRO5VRdQ==
X-Google-Smtp-Source: ACcGV60pbbL8rqmcFM8SgbnDTqLrxbEDDPPjTvVhoDR3MvIdFyzDpGN8FuVyk774YyySHOJJWFSS/PeIdbCH3ypkT9s=
X-Received: by 2002:aca:4f42:: with SMTP id d63-v6mr4455134oib.255.1538474118179;
 Tue, 02 Oct 2018 02:55:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 02:54:57 -0700 (PDT)
In-Reply-To: <20180926112048.17778-2-alex.bennee@linaro.org>
References: <20180926112048.17778-1-alex.bennee@linaro.org> <20180926112048.17778-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 10:54:57 +0100
Message-ID: <CAFEAcA9CDX02Mmt-i+2Ct=at_iS8pjcbSN+ZPhj+BYUC1xXrUQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] target/arm64: properly handle DBGVR RESS bits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Omair Javaid <omair.javaid@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: k9yNEPXne9X/

On 26 September 2018 at 12:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> This only fails with some (broken) versions of gdb but we should
> treat the top bits of DBGBVR as RESS. As the hardware may have IMPDEF
> approaches to writes to this register we apply the sign extension when
> checking breakpoints.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/kvm64.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index e0b8246283..80ad07ed0c 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -356,13 +356,23 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
>      return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
>  }
>
> +/*
> + * We shouldn't rely on gdb correctly setting the top bits of DBGBVR
> + * and the HW lists the top bits a RESS - sign-extending the top bit
> + * of the VA address. As it is IMPDEF if the write is either a sign
> + * extension or kept as is we might fix it up before we compare with
> + * the correctly reported and sign extended address.
> + */
> +
>  static bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
>  {
>      int i;
>
>      for (i =3D 0; i < cur_hw_bps; i++) {
>          HWBreakpoint *bp =3D get_hw_bp(i);
> -        if (bp->bvr =3D=3D pc) {
> +        target_ulong bvr =3D bp->bvr;
> +        bvr |=3D extract64(bvr, 52, 1) ? MAKE_64BIT_MASK(53, 11) : 0;
> +        if (bvr =3D=3D pc) {
>              return true;
>          }
>      }

Shouldn't we be sanitizing the addresses we get from gdb
before we put them into the hardware watchpoint registers,
rather than doing the sign extension when we read the registers?

thanks
-- PMM
