Received: by 10.25.44.15 with SMTP id s15csp3657939lfs;
        Mon, 10 Jul 2017 09:57:28 -0700 (PDT)
X-Received: by 10.28.105.28 with SMTP id e28mr8647993wmc.42.1499705848509;
        Mon, 10 Jul 2017 09:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499705848; cv=none;
        d=google.com; s=arc-20160816;
        b=jqm0bX/9i/+6g1/qDaiISMW+XN6xA7ywzBKf9r02Cwex1KDUUwIrxcnJLWYqWJBWC/
         VBpZTZoxMDsTSlfnI2gRw9wFZQ2WcHD3Gw60+UvwmESIdMCMH99dRndUOvrlsvpRtndi
         ukDN2hV2zuW8WMWiIgNJ2xOSujwYSd2/Bcv10lvI8vOfSYs/8Rov/+XwYDpiDh//9fis
         D53IsKTZVEOxlPKfT1N7+ZfYNetPcv9rz6zcNMJhFHiVFRzMVlCGeOc3LS9SbVXfWZxR
         thV63KwHMOjcAUtm0vuYTVPlCmK5P8+YwOrOIcLLQAD5z5Fw/OjBHUrprkY8ZzJAA4UO
         wMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2q5Y614PfJlkOQN/NUpWgQJ6SoceXObNDpf6lU7/q7g=;
        b=bqOkBEU9z4zXTrvekgFJRwtYL5c6wpu9xMZwsWTlkkPjDU/g2EP67b2WfL+iFh7Rqw
         lJY1iYT7RxwlAw/9XhJqMQqevOWYf+BjMLClud/L0QITjL6LKdKyWALFQ2WmIR1cIyNs
         LNt0xCUcUoLc33W+Cm7aPx4YNwhTcJq5737HhHsO8VSKpOn6abPfgWI/M8ocJ/IiQbcU
         luuMmqTwzwJVjV7gouDY9rx5gRHhh2J2EUc06JvkdLdadvOTKAlMxviuNjGy5I0ADSkl
         HO9/pcIJMgoJbrVMb0x0qkitY2CfQV2mAFcYvW1X2ETZ3HWmCReLW2DySRFv7suMBXnz
         g5CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=fK+xW6oA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22c.google.com (mail-wr0-x22c.google.com. [2a00:1450:400c:c0c::22c])
        by mx.google.com with ESMTPS id y19si1635270wmd.94.2017.07.10.09.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 09:57:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) client-ip=2a00:1450:400c:c0c::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=fK+xW6oA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22c.google.com with SMTP id k67so146115474wrc.2
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2017 09:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2q5Y614PfJlkOQN/NUpWgQJ6SoceXObNDpf6lU7/q7g=;
        b=fK+xW6oA7BFC7NG127/7CEa1/WNtooAvOx+TQvCbeZZg1fmsM3CeKSz1Ippqe0iFEW
         y+0EeHX8vbH+snTXVBJtWuFA3KOhJ1gSC4aSvnsYHYr8Mm4vlsJxcPZnVEdzPUwR0Foq
         2+ssVMrc8LSz7spMDsAMamacPpfiSQSg1Gw7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2q5Y614PfJlkOQN/NUpWgQJ6SoceXObNDpf6lU7/q7g=;
        b=TTlhzbGZfRIaDBzNqsVc86qsxY8wtsuCSxii658QfT2Lq9keUtEDDjC0+Q7uT51VMv
         8qv5NCsHg/ZS1SmBJxnfQPrFHO05jccMo+Wu4Phl8FS3AKa7+J6bI0xOaO6JL15klq2v
         s936+KjIwVsFFOtWLtJpv+teuGUWCUPF81Ifyldo8MEy+qbtlgXEN6HrD7tSBXM1AP9X
         u8QD61JBGgBta2XZOrHZrRL3H7XoA9M1UCBDsq4Wr/fXIn6pl6tGNdzljy9l6cHuq/sb
         2zQlEfj0CBqusJLQlEPU7G0FmorPKAdY2tIDvP5O1RJKxSudAQwIYDJMvTTcehjQFk39
         bCqg==
X-Gm-Message-State: AIVw113uEUFBtyHPCi39pril1WGI1eP7GGWo6+eVqwB1jQPTFBKcwY9Z
	fff2P8AGsoTIarFoDAqH7aODun6r9OpdPnHB8A==
X-Received: by 10.223.173.143 with SMTP id w15mr8587748wrc.113.1499705847952;
 Mon, 10 Jul 2017 09:57:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 10 Jul 2017 09:57:07 -0700 (PDT)
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 17:57:07 +0100
Message-ID: <CAFEAcA-HtfOXe-w74YOGD51-Cso9U5uXHm8==_3QpjxqY79X1Q@mail.gmail.com>
Subject: Re: [RISU PATCH 00/11] Misc fixes, documentation and patterns
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: S28kBeWe6Oif

On 4 July 2017 at 15:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Hi Peter,
>
> A bit of a mixed set of patches here for you to pick from as you
> will. The first 2 are additional tracing fixes including a fix for
> segfaulting when generating a trace.
>
> The next two are documentation patches as requested.
>
> Then two minor tweaks, one to risu.el and a indent failure of risugen.
>
> While I've been working through the half-precision stuff I've been
> finding the --pattern approach a bit inflexible as you basically end
> up eyeballing the risu file to build up the regexs. I've added a
> little syntactic suger to the risu file to enable grouping. This makes
> slicing a subset a lot easier, e.g.:
>
>   ./risugen --group AdvSIMDAcrossVector --not-pattern ".*_RES" aarch64.ri=
su
>
> You can specify multiple groups in the risu file as the matching is
> string based, e.g.:
>
>   @Integer,Logic,Immediate
>
> And then:
>
>   ./risugen --group Logic aarch64.risu foo.bin
>
> What do you think?
>
> Alex Benn=C3=A9e (11):
>   risu: make match status take tracing into account
>   reginfo.c: always return 1 on OP_TESTEND
>   README: document --static builds
>   README: document record/replay support
>   risu.el: derive from text-mode
>   risugen: fix bad indent

I've pushed these first six to risu master.

>   risugen: support @GroupName in risu files

I think this is OK, but can we document the change in
risu file syntax in the readme, please?

>   aarch64.risu: document naming conventions
>   aarch64.risu: remove duplicate AdvSIMD Scalar 3 same block
>   aarch64.risu: remove duplicate AdvSIMD scalar 2 reg misc block
>   aarch64.risu: update AdvancedSIMD across lanes

Some of these seem to be doing multiple things at once,
which in some cases makes them a bit confusing (eg the
first one says it's removing a duplicate block, but it's
also adding a group name.)

thanks
-- PMM
