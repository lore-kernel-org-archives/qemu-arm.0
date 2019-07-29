Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3232906wrv;
        Mon, 29 Jul 2019 07:44:14 -0700 (PDT)
X-Received: by 2002:aca:dd04:: with SMTP id u4mr53255415oig.152.1564411454710;
        Mon, 29 Jul 2019 07:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564411454; cv=none;
        d=google.com; s=arc-20160816;
        b=rscVGKcjaXMs5oPgNE/Kotd72XROgCBppJa2FjQm2ujT1rUL5JDHhRbfiBcajzDz01
         Pkt2RN1xGeKfGwXVId4FIH76RBctIoWNHHuRrnFtmUKaRnryt+8u++lEAaIUCBDE4xCP
         CdmVHeHSVWmiVuHv9pT+7ipiZ7VYVRhm5mFHwrfQfvJ795uEJ8yq1j5EqaVDXD7BjDbg
         oWo9Oe1Kv82es+pH5MyAUfuLiPkSrYMrlLbJcagfyo7acoezFFaRxE6bNa7iT3aL5cwo
         e4+yqP6kN1VWIiR5qdVJHzCHs/S9bqK/e1RYpTLr6vMtdbdVwOT+wZ/dJP9edO87+2HO
         5MQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mTou6HtwuM+AgGnMhdLUP2Fz/qAdbFfW2Ju6OqoHdhU=;
        b=O/7GUIzVBrKhfRWJLTwDA/UvevRq/rmfQURZ2yXJdb7rO3SDojMm6QMiYBpIHwGMtu
         kdl5fF6We+AscBGvSXL2bFoPhdCwfhxBPdnmz73xZs6l12/Yuer63g+UCtG6Z9/+phHC
         X4f79IOuR3+5ybjonTMLEsofBA58jgvBzlM7p2ztK4VQ7oQmfmLFuSKhKbIFXwmG/nT0
         KEqoGoEWQNLFQTPMjBBn2vzECvuPCxmI/TkNJ3IduiKZXNA6jTVbp+ML1MVH+lHcpVYk
         8g7w66N+SflV53St+qYnkKID8yEbTbeJBDJFvj7MbV7pqePdpYrq3bCADzlvBzR0NHIA
         Ds7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvDxtZNp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y5sor32438080otg.10.2019.07.29.07.44.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 07:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvDxtZNp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mTou6HtwuM+AgGnMhdLUP2Fz/qAdbFfW2Ju6OqoHdhU=;
        b=CvDxtZNp1yV6suWBasV+vzxVXRJT2rRRzasN0HS3MzCPrXmpPe3K1qDZSQPPosDk62
         tz8SG20Y8niZkHiyKDyIseHr8WuC8XL4PmbVcPU/8rpxkowkzjHVzF1+P1X1nUf+IkDf
         ErxAiv1yQewUbFlKdwS0YheigzNzgHCHNEBJOPyfM3zhqrr75V69tN8Y9Lhp1v30j9Fw
         OdtfJ1ruEB5rmyG+aicFGAaqkpkQypUaf3CdbvoO5sktwQ91OnQbbt5augyOGraRhfS+
         W2uMGayD3Linb1kDYq+66fPTF4vOQXdzx63mz17ETTgfCsug09wvHu0G1kMNB9kbkBSw
         zonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mTou6HtwuM+AgGnMhdLUP2Fz/qAdbFfW2Ju6OqoHdhU=;
        b=YkYKo/DJBvodiItqimuQCuLqzCOVqy8sJZx38daIW2fS4kPyFyUD4ZAS7IWRSbeNJW
         vcrIn8PuuknyHPNYHop3JNp0YOvgFt+v04eg2tlHhvpMAtCFe4isCqEX0ia7tH2pbGpU
         yokEjPoxQfl/ead9lzZid4edj00V92HmX/9kv83BGeZLWZUxv0+6eqkl4iMrmFmnL0WS
         LcQnyCQy1cYcIlax4Qz4uS1iPv+mZBz/ftVY6c6gG0GjYbfujJ7iQfOWjCZvqil2nSA4
         7GA71rA0QpMymk8JW2U6WNInANNVGwqTuwgUf32WQdun13pG/F9JrkIdwl0MBpxDd3Ax
         KhVA==
X-Gm-Message-State: APjAAAX0x2kTLS6MQnLu80LrizpULUSmqSyI5CDTJrhCiLdxAe/HP79i
	Co5Vr8hdr60NV62SbFcSRTh3dR31VmLNmLPFnkYHsKAtN5E=
X-Google-Smtp-Source: APXvYqx2wZR85wknbtBk+Oz/cFruIITlRPztJwbZy7sDx7j2RQfD5cJH19rhs5XqkhRYAvtBolWH96EQuwzc2sYRlzs=
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr27123423otr.232.1564411454250;
 Mon, 29 Jul 2019 07:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-13-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 15:44:03 +0100
Message-ID: <CAFEAcA_F5PrZPJ6ocxCvPQZ8zMgWZyjXsgtDfftheXL2=WqBpw@mail.gmail.com>
Subject: Re: [PATCH 12/67] target/arm: Introduce gen_illegal_op
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 7m5Da5q8bktD

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Unify the code sequence for generating an illegal opcode exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c |  3 +--
>  target/arm/translate.c         | 21 +++++++++++----------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(This feels like it should go earlier in the patchset, before the
introduction of the decode skeletons ?)

thanks
-- PMM
