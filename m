Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2728669lfq;
        Tue, 1 Mar 2022 08:08:27 -0800 (PST)
X-Received: by 2002:a81:4524:0:b0:2db:3b9b:e3ea with SMTP id s36-20020a814524000000b002db3b9be3eamr15928644ywa.263.1646150906891;
        Tue, 01 Mar 2022 08:08:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646150906; cv=none;
        d=google.com; s=arc-20160816;
        b=PJL9noQyn+SwE7BniG1+XODdarxSa66yB0W/WGeqcyonqTIvHmeoxPaPWq5k8V2KfP
         envq7rSNz9dduJeQQKEi3LSlalIWcHV/+jpqvOxYe8BjR/aKI6WtHygt5tySErIdRMMQ
         nlsgeMduTmK3Sni5DGAMJ9FI95oREUNORs8nikYmziL+YTm3cdXNArgQ+b062CpNSHEx
         SxQygj/qBGqVAohdG/uMvE9NVRq3n3Sk/0NI+HWfWJcS7c02mBh+U2x6R6jsxohWnUuZ
         ILQZJVK9NF0iX2FBEaWIk2NUVroMp1c4l/jFdBBqiegyKPDqWYsP4kNGIHOTYttKGhsj
         LC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XBlSZMHPrBz8nzQJopY9dlxE7HXyvMAdlZ77hEr7jzc=;
        b=aVjcqe4krfdlKpk/p+VDNZnb8eZ/6R8UtGmtMKUfGHBaRmTmPaMhPaUlkQlcxhyE3Y
         PysBN9JmblaJfmoquzP1W3YBMyUMLUgIoCXwUCd2m2zeE8pqpzbZ9nkNVrxUEaTkMfKp
         L77W9sRtIht7eiXnb6QABtQzSfLMUOVGVz2OI8qwgtuJ9rSiSe93ysEzL0oJDw/UgtTW
         hoIR2oXx0N9Zj/SEBVjVmDpLNgj7P/WcBDNUW5Z8/JkaCZAc2xhCFOrRQoLP5ZRiGBY8
         kswoTo79s1fIIACaONkEo8L8JheaPijCdc8Rgmb/3EsWiB5hjpz6+jsBel8Fbzi1c76j
         1qrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lVSut1NZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bg30-20020a05690c031e00b002d82aab98b0sor3028539ywb.68.2022.03.01.08.08.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 08:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lVSut1NZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XBlSZMHPrBz8nzQJopY9dlxE7HXyvMAdlZ77hEr7jzc=;
        b=lVSut1NZ1QZ9f+A2RdeLvEWRCcUd4Hfi9eDJVgKAuT8uiLTprIa4s/7mEdhiiVsu92
         a6QcIw0J3nohsvSrr+hxIjgT8U+USAPbhy6lRIPWMapCg12ofwk8N+0Fua4/j/siLile
         koRsPP7/7iLmrNzKo6b+67bsHEawD6ECoW98Hfno5Vzb73xda2m1H99/tHvrFT5BWK+O
         vK7RBTmX+XITSYqpXHKMctJWx/FXToQrBs2cVwJhxd6UTmG2Ix+VxR7fymmoVLpY449k
         VmE2OZjmIwB8d/pXiMI/Ym+isnh7UpGhMtPuHPC+IJUWfjXuWbAP01uwwxedk22z110p
         uSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBlSZMHPrBz8nzQJopY9dlxE7HXyvMAdlZ77hEr7jzc=;
        b=soJ0bwDg0xr7ESJsL1jpjpr9KywWQZ1RBHCmWiIaS+qova9hPvq8sZ40PPCGT+ILOt
         McyqKQcj/XA8nG/mqm2VQe2bKi+cNilqlzQO6BoIA1w/FnbcGi2Kwqz9NhZknT+acQI9
         p43qSCM0S8yXfnzKCew8QQEDlyMXJ6h1dFtdvuGTST128cSLlWfk6M0iIbiEdQHJKTF4
         Km3jUEgXr3GSXhWpQ619TTWyNunkbLxBRIhSBHsWswUtbcmI+VFCS9VEXGcvwyMuOVs7
         TZwsLMZjiL+o9i0OBDjCpUFRDrRm1i2S78Wz9yK+MmNa0avCB/d1r9qi0dtLyi1GZZwd
         25sw==
X-Gm-Message-State: AOAM532VsCe0saSTLjCLFjnrW+6oarWGHekZFRzXM1Me8C8hTkU2gkNH
	6LRer2GMMEK9O9nD1dumN2EiG9pWCaFz2IJHpVMWBSw6K7ysZQ==
X-Google-Smtp-Source: ABdhPJy3NWL5T7RqBHlfGnSs91lyvALTsP2ALs2FQ2lptasRHVsTI/KH1hlXFzqae6Uo6uBpcmqi26MdW0hVkmmxOSk=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr1952169ywl.455.1646150906563; Tue, 01
 Mar 2022 08:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20220223223137.114264-1-richard.henderson@linaro.org>
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 16:08:15 +0000
Message-ID: <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: OfxWQRMTd7+z

On Wed, 23 Feb 2022 at 22:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   * Update emulation.rst.
>   * Split out separate update to ID_AA64MMFR0.
>   * Hack for avocado.
>
> If the avocado hack isn't acceptable, perhaps just drop the
> last two patches for now?

I think that given that there are Linux kernels out there
that won't boot if LPA2 is enabled, we should probably have
a -cpu command line option to disable it. Otherwise we might
get a bunch of "why did my kernel stop booting" bug reports.

thanks
-- PMM
