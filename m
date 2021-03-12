Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1095391lfg;
        Fri, 12 Mar 2021 02:36:06 -0800 (PST)
X-Received: by 2002:a05:6402:888:: with SMTP id e8mr13085049edy.51.1615545366907;
        Fri, 12 Mar 2021 02:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615545366; cv=none;
        d=google.com; s=arc-20160816;
        b=z2wkXmVGotysfGZUOst7HFUN48MKSQLkLA6TfxFSkF0qvP2DaZTfvTyfFlEqAdWwEf
         6eL+xTHTApKom7WWLLGiq8byG+9PHGlizlE9/gw4iUT35tgN1vhC4ku99eJShdBS5YCk
         oRrTtVbzjWysOXMTqBYoOm1jlCjWARNNNZDlRG/jk4vPlWmyenDlDc4r7NhL1zJEGRlG
         e4Cc6dwWraj/ckRqNDpM2T0NATfcpiXJwyktj2rij6JWDUze8xwxHYF88ljWQ820RVmm
         zzGluNT2nDbNZM2KW8hcSlCUgkfZPa04pSE1jAjBNoRLjEJp8uO8pQisF1hhJ+yxhsTx
         L4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QIlk9LvhQp53wile749dfAuASdvHoE4JnQgGoddGVB4=;
        b=Nnj8imGKMZDjFi8dJkjcri9d0QnTbRhCxGAY5uxg7oDvaBKhVUTndUGC2edX7AthVX
         MVezwxQuHJHPlsRuCyKBDgFHpdcpZntkquG111Wkh9auMCqmV/3bOu/T9ZtNLopT6fQ1
         aqeSYo15OHtCf9dVKJj/XQOqqjQeOHfxgeRB78RkVmiXkKaOHhGypCP4Pww5UC1owuZB
         PoETKa4poEoMJA010LmDfZ8EwyLEzarMYMC3/uv59S/5B2ObznRNGxmZJe39FaOf4bvo
         NHCmdTWmGaSCPFifDRYQwwiigie6t4Vq1xDa9EG0MEWdwAEyjwY+F8BHGlXIJ+UpvBWh
         uvFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mqcl9s7D;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l13sor3644178ejr.55.2021.03.12.02.36.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 12 Mar 2021 02:36:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mqcl9s7D;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QIlk9LvhQp53wile749dfAuASdvHoE4JnQgGoddGVB4=;
        b=Mqcl9s7Dgn8+/gDxpUKbBCgMIOZVwudNDLam7vNLMIdVEaMTCex7C8zyfhs9qgezxa
         Xhd5+pj3McheVojDJu5wEOHLD0rZpJbOqQktqY31/09aQbqDyXZx55N9sY+LQSRF8+/K
         7OXyVreZNM4SDchw4RbuqAd4sDSR49/kRsbANb+slk+biN5vKjNAtqfMzbo3+zh1OZNc
         XK/ovrhVZZtHEZQKQW4b1x5BWUYYfAmjPtoodk3L/O4ybUcjzeLIxA0hGDE96eWpAmAh
         JGM3f0k9QH3fBoUtVAb0UomiDDXZYzLb5esHTad+afD91yC/RVfABkT51Tse8htLXnS5
         dspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QIlk9LvhQp53wile749dfAuASdvHoE4JnQgGoddGVB4=;
        b=dZeG1ezs9a4UN1NRJh+7y/L9scHzJ/5QevR87P8XZPgLEa0t3Z+hEMRtt+L7zAfVUg
         liuh2V/EHhL2nn7l7e04JQcJfetQle6mHtriiPci7YwtZI7SaoN689dDSIEMqiZ+0jUt
         4ZFQfElXuiz2KTlP08vnUBh6Sob/fdNU3RMLlBgDPgIU7LgjbOEF1+VbZApGyvlk1lpx
         fNCqFcjXacu4wtHYu9rsU2UpotIX0faUlGhfBE5j1gxS8i14htivCWloBhbY0ucGezmh
         rytpuRfPrp5vQl0YpkLPe29hau7TLNkuoBsLCd57+gzBebPBVYGcaj06MdVh0vI+FRMc
         /ehg==
X-Gm-Message-State: AOAM5302d8S/wuqGu3ndFSIH8AUUisKxrp9kh/sfA4D5r1BxkXcIzp52
	h3/unkpemKSKNsZnQ3mGN8TZWonkR+lhRWdGhX0QUojaxO7gF+H5uY8=
X-Google-Smtp-Source: ABdhPJw4USVVOR0Ybr8IytlIxpvuZYKIy+f2+7nt008f5Bo+OuGCccA0jkBRcayal0C4WaLq5B4xVgMgwBTay4ShYq4=
X-Received: by 2002:a17:906:c301:: with SMTP id s1mr7624608ejz.382.1615545366716;
 Fri, 12 Mar 2021 02:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20210312102029.17017-1-alex.bennee@linaro.org> <20210312102029.17017-6-alex.bennee@linaro.org>
In-Reply-To: <20210312102029.17017-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 10:35:48 +0000
Message-ID: <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard <keithp@keithp.com>, 
	qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: LhH/AaFez6RS

On Fri, 12 Mar 2021 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Query the SYS_HEAPINFO semicall and do some basic verification of the
> information via libc calls.

Are we both testing system emulation and linux-user, or just one of the two=
?
(Not that I want to hold this up if we're only testing one, but coverage
of both, including M-profile, seems like it would be useful; cf also
https://bugs.launchpad.net/qemu/+bug/1918302 which is M-profile system-emul=
ation
SYS_HEAPINFO being broken in 5.2.)

thanks
-- PMM
