Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1542641lfc;
        Mon, 9 Mar 2020 13:12:54 -0700 (PDT)
X-Received: by 2002:a9d:6c0b:: with SMTP id f11mr8035676otq.182.1583784774221;
        Mon, 09 Mar 2020 13:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583784774; cv=none;
        d=google.com; s=arc-20160816;
        b=BdcuqxoDqFAHIFmmZ6c/M9wquu3IPD1t5k6/UTnhuUX/o29wK4o094Sp5RxqWLd+WF
         7fWoSqT1XkgTF0eiAbO8PQY0PvadfxuYu1/WT9OG1X4NZetOEH+QJZxHu8YKtM48waHN
         QUbX9wnQvrw0Mo9FfHEYeyt0FQcf+S85Wj+qY/y8h0uvb7VB+YdL7XQOFa8WuGUP3fee
         NVE4VmjxdTZkD2hkIXrTbvA40ULbaW4cg732NWvAVU2HXf5hXVD3SQXvIfEVcHpBzUHK
         Lty7G6G9LcUD2To8oP1N/eCnGylKRALYDxUXheput00c/P2WWJOhYJClbd5FXY/JmkZa
         META==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MukV8bwpsqSAxofwaBDyokC/kqbpn0QCRqVHMM8OanM=;
        b=uhnT/iYqBFDy4z5mz3qOWkZEr+MRKIsTlnHuyMcsUN1ouYsmiyzjuWycd3U1caAdHQ
         CWx6D3HUswDOnz831PvZLTqvR37axwmIveRwE+IGqceCInzuL81+0T5IPFol70fVpTHg
         hf45ZnPEq4o1JxpUpXNLywGzO4x1XX+MvYte5ohw9nhkdeZiNsFGNSyjY3YxbApamX/x
         9CD70lAzI7hRL6eC+YOHiLprmDfvi48pNApdIbRAdPgeWFUMVzvEboJB09jaiReW5Jh7
         y/Ux6ABCxF8EZolRfzOo2765KaRrUQ7CqzSz5kndUNQj6uLwGXjrR91mF2Zrs3LGMIgV
         tkfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RJHvbec9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y21sor5339359oie.77.2020.03.09.13.12.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Mar 2020 13:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RJHvbec9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MukV8bwpsqSAxofwaBDyokC/kqbpn0QCRqVHMM8OanM=;
        b=RJHvbec9aEPIcGfdJiuJWKGbGiuTJYLyKOp+6XcLnr9TnRtVGySR/wVDgzE0tUNo4K
         5qziLvHwejDYnKqKt7HGKd/Po8SXg9kXJX5f2NGI3u2bNbPByoIX3RlpZ/H6f0P2YxTR
         ZxTQviwTOsQVwGgMj/L/8z/F6hAJPQpJEfYJ2Tt3l4TyIbfF1XhZ/dvyg6zm9xQqEykj
         UO+pIrKvYwF37ykfvahzoJ42megsIoqHqJ2K/zWzIiD9sm8y3we/Dmofv8OTSkgzj9yi
         EniswR8HQ5uK+yoH/EhPUazeYAl5cTPScKLjsNGUyVhg6pg3BsFT7AV0w4fARRylEE7k
         dN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MukV8bwpsqSAxofwaBDyokC/kqbpn0QCRqVHMM8OanM=;
        b=uNYSH7G5eWsHwfk/ZvLHe3AlHsAqkC7cEgf3DeQjK79gXUOzsOQJ9l396a/p/Yz7RK
         IeyxQGgAygvV7fWvgkKQ/7IR0z98ni9cULubqF++k3O/MVWxmuQgvlFvHMeFhqw+NJDS
         YW4A5NIn0cx15O0s/ZjkpEwTdtqdYHxd9K4Mg/w/Ok1vprRmhulDBwESCbpBIWEubsGR
         IjbwS243FLJ5rU0f6oTvMqkQKZQ8vGXxoArA0zV0jujXSZLvgHxvsWPYGoyMdq0xloWX
         y26JVQHRV9oPcbJXX4WyJu6YKSYi2d3Co13YHSKd0YeOOnVyD42Z/fHbhMk+qQclBYP7
         Wklg==
X-Gm-Message-State: ANhLgQ202JY/w54Q2ofM0qQUJe9HPR6nnbb2Nod2bbVEFrQ1NRmx++kj
	aEN1Yb/4kvjMeWCmiOBaHsfuC2zLta9i6F10P4NJro5s
X-Google-Smtp-Source: ADFU+vvNgAkU3h+0JOs2DFa43m4Vv+kmI2VGjdkBX/NG/BCZp2MZ//pLrHK3lafRdqx93U68AJ6afaS30zqCpnWllnY=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr730285oiy.170.1583784773544;
 Mon, 09 Mar 2020 13:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
 <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com>
 <CAPan3Wo2Nf_d4AxsV5=sfOxv66rmQNfN==rpMn9=FtM5cZG9rw@mail.gmail.com>
 <CAFEAcA-2-tz7F1vmbggpLnc1SSX+_W5pij-w8Vgjx+vqr-LRUA@mail.gmail.com> <CAPan3Wr-oS-QRxmCDPXLRBG81yqjnp56B2WNuxtBMOxr2b9D6A@mail.gmail.com>
In-Reply-To: <CAPan3Wr-oS-QRxmCDPXLRBG81yqjnp56B2WNuxtBMOxr2b9D6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 20:12:41 +0000
Message-ID: <CAFEAcA_rY1hXNbzsj6EJvKzODX_EWdTOK1Gfxi2Jbv+UsYxRtQ@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 07d6UKjJrYwC

On Mon, 9 Mar 2020 at 20:05, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
> Ah now I see what is going on here. So the new rst files are ment to automatically generate
> documentation in various formats using the Python sphinx tool, correct?

Yep. Assuming you have Sphinx installed, "make" should build the
documentation as well as the executables (ie you don't need
specifically 'make html').

> I played around a bit with running 'make html' and using the include directive you suggested in
> the target-arm.rst file like:
>
>   .. include:: orangepi.rst

I'm currently writing a patchset which splits the existing
target-arm.rst into a bunch of per-board files in
docs/system/arm/. If that patchset goes in before you
roll the next verison of the series then it should
just be a matter of putting orangepi.rst in the
docs/system/arm/ directory and adding a line to the
table-of-contents in docs/system/target-arm.rst.
If you're ready to send out the next version before that,
then leave it with the include:: directive and we can
fix it up to the new structure later.

thanks
-- PMM
