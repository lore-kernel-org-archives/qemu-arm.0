Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp706843wrv;
        Thu, 11 Jul 2019 06:02:42 -0700 (PDT)
X-Received: by 2002:a9d:5c0d:: with SMTP id o13mr90116otk.310.1562850162898;
        Thu, 11 Jul 2019 06:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562850162; cv=none;
        d=google.com; s=arc-20160816;
        b=P40wTKmzB/Zslc2mgKDKekD37S40Bd9lQ622UBeiThGSDrkfZB436T9x0zwHNHQULH
         XftQeMpBJJQMbsmKlF7+vuTc3hBpY39V/C+w+0XBxSYs/dCwfw/PEyNKK3rpZfh4bEsw
         P4/oAc11aNS3pWnsARbXkbe+gWdJJ3k2UJRO1ArmxjBM4huXbGn1Ax4mJxC407rS7SUP
         3MeTlBvmGUPih5cEcGLi3nY/qq/izjDUecHc29nOsOOOtFbYXxO0wMT6R/ymYrOpJoGE
         iWt8nTzWIsmTziuwXXqSJya7wFbjKYCuFeGQvCuMyfjFEiAihOcr0zEXBLmGD0ervYPl
         AtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TELAib9fm3I39Fgu/vUwqt23pIiBDwdo7bpmfDjeHYo=;
        b=OPlCoqNtKiuYn/28PvIsulS9t86dwLpZSy1/YV15prE0pNmLqaJfHp8U+Nt/ejIgG/
         /sTu9/ZFvXYKK4sacffEbHf+WX0HgaBcHSuWovNmSwUXvPFLpSow9ZZuNv0iWMvh/FYs
         qGaL+9GQq6EeMTNnA/PVsqX72o+5Riy1ADRfbKbp9Ow4vqjztC6xLUALqk5ueM9I8qBf
         DJMWaDe34dpbJdBJqCiXuyORje9qal6t0TYiQhgGN+kMuBex0RpHBRBHC+XJclWGn/iP
         RYjuaI52i6T5dSEvsIBpnNPDHAY79w6t3QBUPDkqfTf7HjN0cim+evxjSJnTOo9I6wSW
         bUHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/RBiikC";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v2sor2891044otj.83.2019.07.11.06.02.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 06:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/RBiikC";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TELAib9fm3I39Fgu/vUwqt23pIiBDwdo7bpmfDjeHYo=;
        b=n/RBiikCONDX//wZrkpTdxjZOTxiEbEfhWJdbbr6rRwbUp2qcRcTAPuKL7/mh8yAE1
         6UK9HrwyhBKJTIYNU8RUAj4BTf2mjBa0xEXJaHUfeRysiYrxG/sZg1qvj5rv8r69Gp+U
         2BEVT+KYu3bxkbZLK4J4VXziO+vsrkl2Cn4li01xyTSQXQ9e2nVFiZHYPU3taRN6rWqa
         ZCtV1QY0vgt4VAHu66Q/O4/Fq6gX/TZ4Khai5ecqI8SWgjGvzbePuG5UvuaRzYrpwUcA
         jKwZHcIlVmPL8pgTJ+CBHbQ2Q6loYAarErbR8nTqZMnwRfOVMRMF4Ik7ube/aO/kJYET
         2Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TELAib9fm3I39Fgu/vUwqt23pIiBDwdo7bpmfDjeHYo=;
        b=RKlbto7augbbPV9+qc4zqELAx1DTpsX9QZUwy2KAXY7VC7Z9qr8sVdzVC4mLSl0UL1
         6qbix8DSrVMZP3n8FmeUIzMQNKvNlee+gmhiSVmEElH0v52C6xHBEbKZ8hf1Z5smZkBd
         CfQV5v3cxPJ6h2MT/IKPfNzg9v02u4MKneim/rvYbRBf1lgkbrVIYnRAFVOj2OTm061G
         eUMoafVvUJB+NhOhq+tH3mIO+0fJIwLuLOSUPlF3xvfAGykS8O23aN6n9/87BWLars+z
         UcE0jf0IDpgr3RJAHrSitdRBunoNcN7wafo64yHBg6ysn0JcpLN7lUcl6yVX6wSBjRVq
         tpRw==
X-Gm-Message-State: APjAAAV7qC3Di9WZtHei8BbX4XL+yTOukTKUaaO386iuHh+19yJj9lmQ
	UOEZybgYkQt1n29fOiPC/xvzr0iN7mAgeZ3BnsM9vr3gw6ov+Q==
X-Google-Smtp-Source: APXvYqweQJIrxUF4zMH0Lgdy9vyg9JITX68zRrHxTpt+kGR++9YdltJjl03//x/W7F/VzZvpIAc90q8oB7PCUXOgJnY=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3371190oti.91.1562850162217;
 Thu, 11 Jul 2019 06:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190711121231.3601-1-peter.maydell@linaro.org> <87d0igendr.fsf@zen.linaroharston>
In-Reply-To: <87d0igendr.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 14:02:31 +0100
Message-ID: <CAFEAcA8KsVmsP6oAXC9n=jbO+NDvHusWPnGhMCo+25Q7_nCcpw@mail.gmail.com>
Subject: Re: [PATCH for-4.1] target/arm: Set VFP-related MVFR0 fields for
 arm926 and arm1026
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Christophe Lyon <christophe.lyon@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3OhnAqCbUvZf

On Thu, 11 Jul 2019 at 14:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The ARMv5 architecture didn't specify detailed per-feature ID
> > registers. Now that we're using the MVFR0 register fields to
> > gate the existence of VFP instructions, we need to set up
> > the correct values in the cpu->isar structure so that we still
> > provide an FPU to the guest.
> >
> > This fixes a regression in the arm926 and arm1026 CPUs, which
> > are the only ones that both have VFP and are ARMv5 or earlier.
> > This regression was introduced by the VFP refactoring, and more
> > specifically by commits 1120827fa182f0e76 and 266bd25c485597c,
> > which accidentally disabled VFP short-vector support and
> > double-precision support on these CPUs.
> >
> > Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Fixes: 1120827fa182f0e
> > Fixes: 266bd25c485597c
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1836192
> > ---
> > I've followed the existing approach we used for ISAR1 here
> > of just filling in the fields we care about, rather than trying
> > to set the entire register value.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Do you think we have caught them all now? If we end up removing the
> other ARM_FEATURE_foo flags in favour of isar tests we shall have to be
> careful not to re-introduce these sort of bugs.

I checked that these were the only two extra ID-reg checks we
added as part of the VFP conversion, at any rate (ignoring
the checks for features the ARMv5 cores don't have).

thanks
-- PMM
