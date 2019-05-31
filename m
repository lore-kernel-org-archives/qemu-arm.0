Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp907496pjq;
        Fri, 31 May 2019 10:04:42 -0700 (PDT)
X-Received: by 2002:a9d:6047:: with SMTP id v7mr2489865otj.96.1559322282187;
        Fri, 31 May 2019 10:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559322282; cv=none;
        d=google.com; s=arc-20160816;
        b=yufhiaaHX4Lbhd0Yo12XpaRgWzc2RMm7IimzE0301/xtujM8YMpvpMqXOCj+5npwWB
         ACFHO3Fj7uV4tOrDzlLb8QU2WDCK7KxPLRpcTxAzBdDr68Mt3rUZw38pWYmzuNSAPHsn
         H9CRYbCVmg8j7q2vw4ylEIepfRI7eKI1VO1rMFS7nR7x+5KerseCWAZCN3GAMQB9QYRo
         OHm6JhadbJpiI8ER0+I5lq7/mIQGNg8JuMi+yt/DIgPChKze594qDNeCoN3SqINGI4i6
         lAJwpoeWVdcvQXaBoarkgTmxgtKjmxNXnbfEhBRbVvnIaqauwkDWPXswQ0zaMlCDv7TE
         5/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7fQjKjvMizxEUH+ZmLWmHokn2Oviwij2SRB/vhvQN/s=;
        b=n3SevZacVOhq+9eOihVR20U/sN7rVcZ4fYyaPCaT0xFqPfmx+eXlAKfMvikQRjttpz
         BfP/t5mZv0jTuIcvofN7/+7s0h68OutVOq6HYc3fW3cY9zhiLCUeWs9n7us0JP90zoEr
         LECd9EAJMIlLK1oIeBOSkbNumpU1KZNwnJYFrSvJB/PjaFFussJ6hs6q5sASy4NRfOOP
         kFQUJqrFNDWYxLhzkhF1QtEN07OfNlR+okcsr8kRExBXSTivTSDdzlCPsUoGKE3G7dA9
         jKQQ45OiT6xIpdHc7iP620R/awe8JCj7OQ+4/F9E6BoIyU1M0puaqQbwjKPHVQfgCzQK
         bCAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NW3DvrDD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e14sor3352665oti.87.2019.05.31.10.04.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 May 2019 10:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NW3DvrDD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7fQjKjvMizxEUH+ZmLWmHokn2Oviwij2SRB/vhvQN/s=;
        b=NW3DvrDD9ptKFwR7osjK1zByZU1LbYTlrcX4ARTtvm/qg9tDXKqGQHLJloFyczyx/+
         538PPalK2XcoTDx929BA6jJiOHrMT4xWrejpT2VTlmkSJQnX4vXVbcQ6DgixglLRAvDh
         YF+O3yz6OVUPMgYq5poP33yHeFkeTbFSt6CVNT3rk7dCYRuxwpJjW7Igw9C3yFTivcSL
         dBWeBjcV4y1nNJPfCFHPUbR/sCmLvtLpPlwwTwmubey0NzfLSUUuGykbPxz9SV/KwyPx
         AvHjbRx8jUcZKmWisWiU4+IiAsuTN+FDOQgrtNP9DgGulfrsxJgNCju7GnxZJdvH7mNV
         80uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7fQjKjvMizxEUH+ZmLWmHokn2Oviwij2SRB/vhvQN/s=;
        b=YRg4Gu6Ciuoxm9boD5Y+RZuEHltv6bIXqnFxrDeKSOBg1aq480rtM2lISpXckNutB2
         2NrC9IfSTjWk2Di+3Jppz/BwekdySPxidQvRe0V+hbzlR7uOvgKhnPU+w1lgf2ZadnfY
         hpWsNkR4r/Hxe2rkPsgG+UTQSRhjKqh/ymfus2LBVExk2RXa/runmuWi/baXI5+e9NeN
         AWplGwdzyoHx212aAixH0T2Te7VKX3Qaue3laA3Gwl44a9EetW/abjwt93Nkz5vL3Yrn
         wKVA0+v+fQmdXwrFdbRof/x1qX3uBlNDl7feaBbYTdDd6xtITwVbRxPT58W0wVAkhfH6
         kIuA==
X-Gm-Message-State: APjAAAWkVGD/9msqCCYJN93G7q1cWk0ZDWkTKV2l/CLbGCbEDNBSmbIf
	/bYySMOnBe7QH97W7/qemp4gtN4m9sZfD991pq0LobGy
X-Google-Smtp-Source: APXvYqz+eieM/Aiez3X/SAhpyNPCiRqcRRsbo+/FHP9dUHyU2LDOMfQAwx8zaPzm8vlE3qGmka1oDsJIpprBlz3AoJo=
X-Received: by 2002:a9d:193:: with SMTP id e19mr2663060ote.135.1559322281450;
 Fri, 31 May 2019 10:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190531154735.20809-1-philmd@redhat.com> <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
 <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com> <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com>
In-Reply-To: <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2019 18:04:30 +0100
Message-ID: <CAFEAcA_KKH62rK2pbR8dWXOCJWe1X8wif5whc+y0_e-hTpmoRQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
To: Miroslav Rezanina <mrezanin@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo <arikalo@wavecomp.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 33Na1mDPio0S

On Fri, 31 May 2019 at 17:54, Miroslav Rezanina <mrezanin@redhat.com> wrote:
> What about CONFIG_ARM_VIRT - can we use it to introduce dependency on
> CONFIG_SEMIHOSTING or is there valid scenario of qemu build with CONFIG_ARM_VIRT
> enabled and CONFIG_SEMIHOSTING disabled?

Semihosting is a feature that works on all Arm CPUs
regardless of which machine model you're using (or whether
you're using softmmu or linux-user), so I think
the machine's Kconfig fragment is the wrong place to try
to pull it in.

thanks
-- PMM
