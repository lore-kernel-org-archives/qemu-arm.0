Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1611688lfq;
        Thu, 10 Sep 2020 12:54:40 -0700 (PDT)
X-Received: by 2002:aa7:cd5a:: with SMTP id v26mr10692399edw.38.1599767680108;
        Thu, 10 Sep 2020 12:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599767680; cv=none;
        d=google.com; s=arc-20160816;
        b=sMiCKdL8GzUMvwLRyAYucrC0F8rN6MIdVazJw4MfS6H06Er+1Bm/zC6ptpRRMgFef7
         WnUcIsRRWl3kT1IXJdhDaOh4Pk5Q2febWJqrhPDXkqn1helVtUYKzrPbdUQRDRoEm2Rj
         w0TMXgyCNiaXhZp2ApsSxXYKiiG1yhokfjqgU8uwKH/sGG4O0JHSNSe02ehSzIa6moNE
         8Jn+89Unf7edeHGFrH9qn+WnuTqRcXbQsj9rOs2jo1Z46rcO7jRqew5/N6MvFu7SbFac
         IzuZ48bFtlOyKfypBDJmB9BJ8aeqWAvvIDQ5ydDdnZ6O+v099IUh/bns83J77P5ytj1G
         baOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8GiZi7KPaoENc8uTEJdS0X5H5hTi8PEOnZj99Qy+VAk=;
        b=Q5naiQvOloyNQfnf0mFLEbzxU2D1aRXafczIZuV6bNnmR/Zxx7qe5Rc6XZYWfLROvW
         L+GAzlXdVoJ+d7WYbrjZDjj9Yum6idl5QUnLandZ19/d2o+mINUg189XUEzSUdTrYf5H
         Nqzm4Mdc4TcoXASqss0ai7GThUCMBODMMPd9tDjvu/6dnSZsUcpytQm7g8+BRaohF2hp
         7GDclI7geCcKV8byILcgj6krzJ+ymRdh6PCcRcMzqwcru1b+dBZ+L3b+j2AQYcIBJpD9
         CWcRw14QjFhgnYgSKkDIPsAIDBizpMxXiYRka/ycnbqgLM3lpc2g0NDQjEpaWwEzVrbo
         JfDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EE8FIGKw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w11sor4843481ejy.32.2020.09.10.12.54.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Sep 2020 12:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EE8FIGKw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8GiZi7KPaoENc8uTEJdS0X5H5hTi8PEOnZj99Qy+VAk=;
        b=EE8FIGKwjBsolRvTG1HhqgmNB7T1mZr+s7ZO/kqiIPQeHtI+8HyFAM30nMptDTzyrH
         M7ZZW6M/7dRVEmAMx/o6YSmR7ApVlOxMEgRzSO8wEk56ba4mc/G+KmUusb2qIKgvMOR9
         wJ4463yZRKM4rocWpmONNisiDJpxRt7pjLjcbrNcleZB8hgQ8MhHfUiZExt/s4Kc/X4p
         pGKQFxNUBtkWQ4xrr7GWbgZaETmbY3T5sKNFSE+M65WkApyZq/Q4qTXzygREncQRJGut
         pEnYdAtApzq8EN3POVPE55Z9dUrcR+DU5j2QHQP+VB4daRmwx6hP1lxPIv9yU054Dq83
         jKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8GiZi7KPaoENc8uTEJdS0X5H5hTi8PEOnZj99Qy+VAk=;
        b=VsRYXE48aF2AoAFC3bUN/uMzwJoNgkdsyvsY3lw11QT55RanjcaGacY4K/IfNU/HAV
         MVc+C6igFf00iRbuNe079hoo0SXmH4ZsczKEJYCNm7woYP72r/7prbMVgAh19WLQXEp5
         AWOdtRWHkOviNDdQ6Q8WbsGHcM8JpVr/3+0+7oTpHexqNO4Y6/PVpH2BaWWFfl7zp1bo
         rWyE/Lzijcjq2xhNeGtq2HxgtH+0vlsN2OBc5zFSDoHHLO+v1YRCU8XpGOXvRYPIBupX
         kPCO5f73a+dOwSK24qmPoUenAYd4MnzJ484LFtuILxJNOFQ5spyYSfTAx3gUm+o9TgCo
         NFIw==
X-Gm-Message-State: AOAM531JGW14gnmYuXIbT0WB0ylSST/w4/ZMsKGpyQGi1vEVDpTFusdV
	p60zvNrz0E205DCTcHY0XTAfZIWuoW4/Iep+6khFU9/C
X-Google-Smtp-Source: ABdhPJyWYBFOYCNlVlFv2b6WZvHdEdVcC2mqCCExUW7I1qGmRwDDSanKo7Nf9mLl26L6m/mVBWqY1fbENS67y4mKiFE=
X-Received: by 2002:a17:906:1f42:: with SMTP id d2mr10340341ejk.407.1599767679795;
 Thu, 10 Sep 2020 12:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200901162046.32670-1-peter.maydell@linaro.org>
In-Reply-To: <20200901162046.32670-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Sep 2020 20:54:28 +0100
Message-ID: <CAFEAcA8iTN73rjPT9gB4E8g8s6AxQoYLKUwrV+ZoE4PNdJ3t9w@mail.gmail.com>
Subject: Re: [RISU PATCH 0/2] arm.risu: two minor fixes
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: RaRw7YRXJQ17

Ping for review? Mostly I'm interested in whether either
Richard or Alex knows what's up with the discrepancy between
the VLDR/VSTR patterns in current risu and the generated
aarch32 binaries/traces that have been floating around...

thanks
-- PMM

On Tue, 1 Sep 2020 at 17:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> These are a couple of minor fixes to arm.risu patterns.
> (They're a prereq at least textually to the fp16 arm.risu
> change, and I should have sent them out with that but I forgot
> I had them in my patchstack.)
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   arm.risu: Correct VLDR/VSTR U=0 patterns
>   arm.risu: Fix typo in VCVT_B_TT pattern name
>
>  arm.risu | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
