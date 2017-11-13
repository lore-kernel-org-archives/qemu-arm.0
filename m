Received: by 10.223.150.237 with SMTP id u100csp2643193wrb;
        Mon, 13 Nov 2017 08:42:41 -0800 (PST)
X-Received: by 10.223.132.101 with SMTP id 92mr7503766wrf.85.1510591361477;
        Mon, 13 Nov 2017 08:42:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510591361; cv=none;
        d=google.com; s=arc-20160816;
        b=T1HRFQ6fFKH490zuHnPjz4AnYVGrjJ/Fmtr7x1QALAN2wxTRrwmYCJ8C/bZJJrILYb
         2rQhyrlOS8MIf0luTeX+ZetYLfRnIdIdNGYoQw2Rq8pEtuHeyZb9m8QIZKwXm+WVEABG
         /2XhZEABn+3U9yi8RJu90G0+5REBic5mnZHP/BrDWt5pGA39anYYtiUntnMueb7psF+P
         Rxj6i9vE0Jc+IEtTN5fbjhUlLSIXxv14cXlt6TZKFKIU1do3a8hvrfobw0/eF4bRvNB0
         XdIu/jvk4heAO+bq35huQ/pNDvwcROxMnOUx/mfgiGzSocsLXa0xPcv1S2yWROSINlcj
         AUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=U4zVyYE7imONliBbeVyKx9E5oZxiBLcRVNZoao232tQ=;
        b=uqcn4g8vo2I3AL4NkgCGLLeivIf2ti8o4jjjRbytIQQk1rQuNxN53V2UHFrY51ss4m
         6QULeoQr3y/d4UghYDCNFyKsqscO1rKTVRlTpy09q7eqSaJmOcrSFw472l1rkPJll1hk
         Z4+DSnHTX4ChW/S3Ze+v9IfzVpcae+CSgf9dqKbZLt/96iUMUOqFKGUws2/8yoi8SMvu
         RVTfeXGj5uCv+cTHn1z2dKPid/y4i5SRF5zAUTupODATcKJ0n8d/QVBliGyzjoFLnhzc
         JabSfeXkYOOM48yHB+ClRA8K48dzYz254Qd1a00U1sBlmiBMmSYq3FlNI9m5e95k6vmI
         tBlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IOzcz4YS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q18sor6100389wre.11.2017.11.13.08.42.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2017 08:42:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IOzcz4YS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U4zVyYE7imONliBbeVyKx9E5oZxiBLcRVNZoao232tQ=;
        b=IOzcz4YSzHJCWVzRcwP24l9CWdA48kXCd/a5CAu/vr46YN7VtE/eWTjtGfQ/bJUvrp
         zHSjBzgM87BwC3VndA5GlLtIDr+eDxIjTnY7rMSdKpxg9VOy7Fpy/FJywbyoSIWi6bpm
         8yaR/zC/pCSQD7THoARj8I+fis98ihbzrOYBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U4zVyYE7imONliBbeVyKx9E5oZxiBLcRVNZoao232tQ=;
        b=XXoWzqBntCNGfOB7ylqZN/vj3/9OiEk6aG1SuemXhQVV4Vk6quGH2ebRZp3asMrxVA
         bwwJmVtZVedwHcSo4c8uqhNowAiGliIyJIYvLtWbRPhaDFQaQNYqigIC8yqBcowWh6QC
         0swVpgAiY+MXEcbUMAO9g2FjxEvnzc4yL8aWD7Vevhtbjab1XRFcWgUueuxPiYD5/Xeq
         vl4JnIIrvH1qr12QaTBGlHdwqoiFUGcumCckrJzMeJjwP0NE43zg6V0j2u+h5CZGZOA2
         YA2Wo0Nb5F0tZr+MtsDEb6mnc/EgiyQstCe5aMSLeTSR5ROxMI53p8SUQ2cGMoGYFRrB
         1IJw==
X-Gm-Message-State: AJaThX7n23+4QcAcJ47QI2IMZY44JGdTewvlJk/cw9Yy1YJIdVsGBJ4o
	ATcUBw4QQM4bVqW9kE5vF1h2ghCHXMUUtkNK+AOAtAE8PtM=
X-Google-Smtp-Source: AGs4zMbtdFSMS4KXJQh/EXay5lA8oZ3blMdfRs1GNvFk0sZkoOLFOQPVWV6Cant7AASaGXiPhoP+j0Vgos5b9D5KQMQ=
X-Received: by 10.223.143.54 with SMTP id p51mr7344363wrb.138.1510591360926;
 Mon, 13 Nov 2017 08:42:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 13 Nov 2017 08:42:20 -0800 (PST)
In-Reply-To: <87wp2u9m5k.fsf@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
 <20171004184325.24157-4-richard.henderson@linaro.org> <87wp2u9m5k.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 16:42:20 +0000
Message-ID: <CAFEAcA-YAtS1FwTsgyEef2vWjLyDBmjypUVvdA6vA5kd7ZA8UQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v1 03/12] target/arm: Decode aa64
 armv8.1 scalar three same extra
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Dx8yUKQ5lxO6

On 13 November 2017 at 16:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Hmm are these really NEON or should they be advsimd_qrdm....?

NEON is the same thing as Advanced SIMD, as far as I know,
in the same way that TrustZone and the Security Extensions are
the same thing.

thanks
-- PMM
