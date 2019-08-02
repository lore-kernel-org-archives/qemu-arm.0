Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1042711wrv;
        Fri, 2 Aug 2019 09:38:41 -0700 (PDT)
X-Received: by 2002:a9d:61c7:: with SMTP id h7mr29528642otk.357.1564763921307;
        Fri, 02 Aug 2019 09:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564763921; cv=none;
        d=google.com; s=arc-20160816;
        b=W7kS91nzvbN48SqwMWbcizYxTaEoillICFTO5AHfor32kscSkDctuqOujd/rRWdpli
         BLSGnUD/dGEDTzqowK5/KKHcrHfXyxLnbRqi4WMLj+BTia3HB0OuAAHXJ8P/wDhhkewP
         c7rosEXcfqgXAlrN/YLsb0pMntj1lqkFeLr33EGa97qbZ9YQ/ivyPUVA3qcHoDfOcSRa
         C9nGZXSlOiZ3UZ1OQMf3GInAqEMSQaneVdfqHyLllMJ3BEKDKi9e5PyJG63VV4coUo07
         gmjolbEzYQbz6X9iff95S5ptQ+lwu8yIp6XiIO2prWoMF9+pDAmQ4xS0a8JkMFhuIjwh
         t8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xFI2+7XPTOv3b7japO9eQFMtUcdolV/Yk2OxnwsKfZk=;
        b=tjQeaDyy3+89t50BEiaL42d+iZDojnxpZljz5kgUPlhBw4k0UFbavmI4C7/VinCfGE
         hDc2WFUetzUM7bRcCYlsDxIfBDTNVOkPnuTGoXDn37kz03RpDifZKs63UAlpAGrBOo+g
         7aWLIalfGfFXr0+yjAK7T0vsR+eb+qGd4+DMfDb52UN1y/FPccM8dkx25Wl+BO8LP2k5
         f2XcZxUz5P1R7vtXo++kfKcP0jfvo6CWX/qVDUB0twSWieSUnazbp2ToJz/lA2dIo4y5
         dmDXIwQhWAp0h9uTCRdzbZ2sEog1lVra0lB3EdczxlAn/0yx/H61L6znEYl4F71aZb0p
         iKRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k1e5doCM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u19sor37650293otq.144.2019.08.02.09.38.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Aug 2019 09:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k1e5doCM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFI2+7XPTOv3b7japO9eQFMtUcdolV/Yk2OxnwsKfZk=;
        b=k1e5doCMkVCCaFON4eNc9BukwQMWmq00YRXBVHoQl7u3Eo0CeK7lv9ZKCXV1lbyWKN
         JtrB044h1FD3AdBxGmyyWlY1O5UQLv44oHPv1qR2pGZ7IzcBoShSgKnXnKLvuQcPJKXX
         uJVzqfr5SDRkFB7FjAeWo+QNXF+G23LRJk+OHeGuKHVJ30LC6vEv+7kOd4tGDjnA9IV7
         NtxC6rBQkDr2nA+b9BVrxlW9PBb66q4oANKz17Cud6nW3MpM2p/pW6FQxiClWP24QK/N
         Q+YOZq+ee4d8fTebwhMfGbkUpBhLvBTPFrd8i8qfw+tUYCUAAD2W496Wl9zlgBNBLTyQ
         xXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFI2+7XPTOv3b7japO9eQFMtUcdolV/Yk2OxnwsKfZk=;
        b=Ab6OqKhxn7sWHByzEaYIDcGBZHYBVLbFVm/9CWuZu8aAPJW9sBd/LmAg8ATN2uTANv
         sn9G4nwmFTLzd+OA+0k9uED5hBiAEUrIxLv82QHW4n1fqGAOaOndIc5zmtIMS1t8LOye
         eIdf1sF0cjvkBTaZbq6x43xacqA5tA/EdG1cSa8BUZRL5ckAzLVGYvrnbxN90ym6JHFh
         z3Op2qH1ZKECrnE91vv7KguYg9zHSbRPVqsLyuGWyTvNNC5GkQW4W6wkGuRPYJOFjD6q
         b2jFkb4dU9knY56hxHswclvYZeXQN3Pbo7cpCuhIuKHmdjsKqxs+ixgpmoPVavtUgkxY
         5XMA==
X-Gm-Message-State: APjAAAVdJFqzlMCeLQpxOBmNWAAwxcAo8ujpBYZ0lpoNjaFNQEWiV3lA
	vltCArNawOQIvOpT02wtZRRIGNGWaymJ4BYoxec1zMN2
X-Google-Smtp-Source: APXvYqwGrBgdTE4EDZg8pEKWRd0mwZy5xLCn9LpS+go97X1sgzBsJB9faApnTbQTYDpmeXOmlNurDiDkREaojyLcDCc=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr43437299oti.91.1564763920712;
 Fri, 02 Aug 2019 09:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190801105742.20036-1-peter.maydell@linaro.org>
 <af347b17-b524-1075-d462-2b0e6eef41a5@greensocs.com> <CAFEAcA87XdDJH5TO-AiDfSqudmwzuY0yoa0H60objxXp3Bh9LA@mail.gmail.com>
 <569b96b1-e11a-59c5-4f67-1da2d592b8fc@greensocs.com>
In-Reply-To: <569b96b1-e11a-59c5-4f67-1da2d592b8fc@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Aug 2019 17:38:30 +0100
Message-ID: <CAFEAcA_K3v_XXHh-eTpdrb39cVGu9Co95TaLQG+zAU1qa8MXKw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Avoid bogus NSACR traps
 on M-profile without Security Extension
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ATxvCkXTy0wE

On Fri, 2 Aug 2019 at 08:51, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
> On 8/1/19 4:38 PM, Peter Maydell wrote:
> > On Thu, 1 Aug 2019 at 15:20, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >>
> >>
> >> On 8/1/19 12:57 PM, Peter Maydell wrote:
> >>> In Arm v8.0 M-profile CPUs without the Security Extension and also in
> >>> v7M CPUs, there is no NSACR register. However, the code we have to handle
> >>> the FPU does not always check whether the ARM_FEATURE_M_SECURITY bit
> >>> is set before testing whether env->v7m.nsacr permits access to the
> >>> FPU. This means that for a CPU with an FPU but without the Security
> >>> Extension we would always take a bogus fault when trying to stack
> >>> the FPU registers on an exception entry.
> >>>
> >>> We could fix this by adding extra feature bit checks for all uses,
> >>> but it is simpler to just make the internal value of nsacr 0x3ff
> >>
> >> s/0x3ff/0xcff/ I think, given you put 0xcff after and in the code
> >
> > Yes, 0xcff is correct and the commit message is wrong. (Bits 8 and 9
> > of the NSACR are RES0 in all situations.)
> >
>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Thanks; since we need an rc4 anyway I have pushed this to master,
with the commit message typo fixed.

-- PMM
