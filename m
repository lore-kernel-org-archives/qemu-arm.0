Received: by 10.28.71.27 with SMTP id u27csp5111576wma;
        Tue, 27 Feb 2018 10:12:18 -0800 (PST)
X-Received: by 10.202.64.69 with SMTP id n66mr9268836oia.225.1519755138299;
        Tue, 27 Feb 2018 10:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519755138; cv=none;
        d=google.com; s=arc-20160816;
        b=TDsdpCofiNXPVChAbnmCNXQ+AHZwYsP0dQeondiGS84oMD9NphpJbfwDZjXaNAua3y
         H7Exp5l9BsaWkpXRnULLTiY3U+qPqt1r1fs3m/z0snO/AsxDIXk+pW8ATGt1AUgfOiIT
         RgthTj25gBKiTAwS4Lq1lCuSDUhic3kMlu5nLzVc/FLmcnpwA9QlhvwDADjEZcMt1m0T
         Pjqb7RFfO21dVpWQapWclxTzosLy77CWI6PWp+pqZiIlQ8s7j5owKqC3vfUNaWGUsVxw
         bOYVe0MhumHBjzHy2AkjGH3I0ktMQzN17gPR0bi+Nm1UtUpKkQSvJfVFOgJ6WoRCSs2X
         gSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ggUptUzpg5ZoO5Ge8m78b8jccJHKyU2vFEmbmK+YIhI=;
        b=F657cc5RRcMN7fEDEpXSVau2Lt1I/irtZs0cp5GvDBBm/FeQU63UjgVGLTNt4FiOfY
         0DlA1iYu68XnpJuSrMmw1Vf5PXsKqhSbIdzaZdaocGUEaYy2SOM1jg6+AV4Id2eJhnx6
         eBCaN6y1yoPxkT2kJg8HgtKfiYg2nlwKz7KHD23Om2NQsK8d33GplDPH0GY0XVCBud9P
         WC5FGD94MNFrULY23OjPu/jWOkI2Xdb0PQUuqWvp5kY1rpl1fUJ8lQNJHZ5bv50qhhy0
         tJAJEwCQt6yanwjvCQtbzxE6rM/ImJsxwgWE4TdVY6xF4ccO1Vmr95Fpsokq1JgtpHiG
         H4kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NS2PQsds;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y23sor2870315otj.306.2018.02.27.10.12.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Feb 2018 10:12:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NS2PQsds;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ggUptUzpg5ZoO5Ge8m78b8jccJHKyU2vFEmbmK+YIhI=;
        b=NS2PQsdsMFzmFM6gJcR+j5lGTKzhS5E4i8CZeS+7mUk2v95UTbTHJGIXKQz2S7a3ir
         VjGWlQ4Wt3vCU5sbdvftYFnN6KChPYY3Ilyb0aZ/YgTfgMRkAkmCy2qL46IsHGdDHXgz
         KK72+bPCfBxv+6Dnz3kO7lrsICKv4kk7NIOi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ggUptUzpg5ZoO5Ge8m78b8jccJHKyU2vFEmbmK+YIhI=;
        b=SqpcuMRdt8nLrbTrOZ2C3+k4KJt3y4qgobKPuQNzNCOAhK7iYrqh45akOlwZdCRnOm
         rBC6h+UCoJaLXT7omXSn/YwcT1JcHM/aXi+yTBUUIARTkVeck5ZSS/oKUC/xEghv2jWD
         WVdi/8u3zMNEHsGSS2GxhgrCPIygFxDZi2/T7UAU7MoWEl81QkIIurq7B/cxViSfQRW4
         0s+3CdyHZwuV63oxF24LgmpafqhELuAt0DwbGC0pPjyqsdt2w5JEKSHDL/LHGvAk0W6r
         AYjzfGXWVhX+shqeNZ6YoG4d+SM7FLTR6h8e4SMzps3l6AJvCRPz+x/2lS90jXA7Noyl
         TBxA==
X-Gm-Message-State: APf1xPAQXMZm/Ts/tqYG6RxxsN5N2Ub8AtC0vmoQVGOws25f9MRJCUHK
	y7hzpuOlnGfczywhgW7EkHcM3Gs4Fs44yDhQXNg8+8h9GXU=
X-Google-Smtp-Source: AH8x225Dnpn3la5kObGdE296R5oF8XaQzuuYsgZzXd8rwrCu+8WyrLBuicop0xgv8yIkCNQtPeZ+YjWreQs1zFFPQEU=
X-Received: by 10.157.7.227 with SMTP id 90mr10357280oto.126.1519755137841;
 Tue, 27 Feb 2018 10:12:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 10:11:57 -0800 (PST)
In-Reply-To: <20180227143852.11175-1-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 18:11:57 +0000
Message-ID: <CAFEAcA8LEG=bzXrj3etTdf_q3-AcMVfCCqSGQ2OkXUPGBHkMBQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v4 00/31] Add ARMv8.2 half-precision functions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: e7bMQ7kzKC7l

On 27 February 2018 at 14:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> A few minor fixes and a chunk of Richard's r-b tags. Now all that is
> left is:
>
>   patch 0014/arm translate a64 add FP16 FMULX MLS FMLA to simd.patch need=
s review
>
> Otherwise see comments bellow --- for other changes
>

Thanks -- applied to target-arm.next. Some caveats:

(1) we can fix the nit RTH noted about FMULX later

(2) I notice that there's no patch here that adds the linux-user/elfload.c
code to set a hwcap for the guest program to indicate FP16 presence.
Presumably there is such a hwcap?

(3) Is this complete fp16 support or are there still more pieces to come?
I'm assuming it's all done...

(4) I've split the "add new ARM_V8_FP16 feature bit to the enum"
and "enable the feature on the 'any' CPU" parts of patch 2, so
we can do the latter at the end. If there is still missing parts
to fp16 then we can drop the enable-feature half of that
for the moment.

thanks
-- PMM
