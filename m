Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp3499302lfj;
        Wed, 19 Jan 2022 02:16:03 -0800 (PST)
X-Received: by 2002:a5d:6c64:: with SMTP id r4mr21984669wrz.251.1642587363763;
        Wed, 19 Jan 2022 02:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642587363; cv=none;
        d=google.com; s=arc-20160816;
        b=OunAv3SnaSV6P7dzKvA4wyAbyQ1jVSj9iRloY1SI0hMPTtRSg9WhUolwhxIBfay3wk
         1PuiG8p7RQuskV43fGpunpybc/Dp7/GPZVl9iZUVrCdajm5vGIIqyhVyARlRrBZP6cks
         wlg4HY0W4SBSjgMWV3ZeAED7Hc31LcBX4iqItk4owNmm9+cDb/YbnO+A53DdULN/jE8T
         ypLeFtlDEsl13ycdel3DtB8SkLJKqYd0ypfBvgUNh/fNbepkGOAcDXGS3jRP+7t7c7IH
         TtXj/5lLRr0DZXqNO+Kn+7DpeYB6b2XWXK/HtBac/geYoDt0AT85AKKF8tIAWnPHMp/U
         pNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rCo1diIBMHHhgOV+1Krb/M6NeuRyFQxuYoeTGCvpasM=;
        b=C+9tA2VxD6+CY5Q8cuTzc+JojgB0erPUbka6CVwIYVAHDrMuXL15h/VL3juAWqCbYO
         PraECfLuMwNVW1HtPxM3XtlABO725xkMtXU6Zqfi8Q/ytrqjEuqpS3WFHmacnSbQ02xZ
         J/3wyDXcEcJGxpH68+8m5IBKUME33IYWGgMLDOh178yhmtaW6Rwyim50Yp1ALNsR3KtU
         WifONJC/FhsbfMWAlepH73MGFh80OmgPrhFZmGGats/xp7RpD87ycJHYlb4/PcqnObWM
         QgBw2YYfBd3JBdrrPE3SfQ218GZQ/xp6rHyhOKVKeelDDfJKXK+/8SAgS15lp/UGEYAO
         Yscg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AFFeLSLF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6sor7982148wrx.68.2022.01.19.02.16.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Jan 2022 02:16:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AFFeLSLF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rCo1diIBMHHhgOV+1Krb/M6NeuRyFQxuYoeTGCvpasM=;
        b=AFFeLSLFF7BK9SwOxCvS2dL09pPVaxo5tpLOAwa4VPsiVbyQdCcp5D+9t2RrRHDQsm
         S53LZPWvbo6YRn1NY0iNGkKJET2NshSRpm9H956nTPzQw5FwaA3awt++eaFhITVhiWCM
         ZPx/i+S29llR42CXgyInThnj42IQOxmy/73Jij/mSMEL3HnNQ340BU3jNegXzNo0tyMr
         OqYXa4l4S3lrqAr1Pwg/OnAyu/P1CChHHaMItA27GMoSms0e7Le8AFjfWYmcTeq712Pz
         ozlGZaRDQEprAbxRbG7KbjTDnlMBuEy/lgOeuME0X8d2WInRR3LrXYGkujs7pDaooHy9
         gZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCo1diIBMHHhgOV+1Krb/M6NeuRyFQxuYoeTGCvpasM=;
        b=SJ3963tFhJNVQpvsQ/Ln2lUujXjPLVmI9/7ACJMVg4KxQsPGHsTpiwgeSV75IZS0YF
         tGWVqkp6Q+kD1urSsxSCDz5DKhz5BfEMXhN/DCNR/tBOmVhCg3gX55JCPjVvzrh3IAdh
         vkgYLxPPOMbBoCbBGtXkDX+7RCPi3A3GrZwfd9qG70jB3aikeik4Qu6e6k2CZk6kZX7F
         SmWUsQF/cbHH6PCA7XdYvV7qAIkAyHQKQwUdb+19OPZRGdxjsemUNtLsEQ2E8GXfkKNE
         omib0HEH5q6Jawu/GDd12SPLe7gR5gFFCm40BqhmKP35HQkOgxXnvxYjyn+hetsS3KF/
         t0Fw==
X-Gm-Message-State: AOAM533us0KMFcQSAPfRe5nninSkZSEWSZJkVZ2ioL4otoMiRnnFYmI1
	H8h+yy01LlCiPJOPsZTyJyctFCtmS7zK4FlCwlLR5bA8
X-Google-Smtp-Source: ABdhPJwkmWBxRrbd6STFnW2Cex7iY8DYjEK1EprIfGb8VFaYeIGR41rbHcPWIVUkiArhAkC7LIlw6Vwu9jXbvmbH5fw=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr29132585wrv.521.1642587363418;
 Wed, 19 Jan 2022 02:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <87pmop7xfw.fsf@linaro.org> <CAFEAcA-ncYCtpH2aCjd4GWuN9SLcxGMQUOutBWyNHByD6_gG0w@mail.gmail.com>
 <20220118232935.50ae1b25@slackpad.fritz.box>
In-Reply-To: <20220118232935.50ae1b25@slackpad.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jan 2022 10:15:52 +0000
Message-ID: <CAFEAcA_BdvbTDp8sJyB32EicB=mNxndgKe7GyNZqE9ER5Ow+wg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org, Shashi Mallela <shashi.mallela@linaro.org>, 
	Andrew Jones <drjones@redhat.com>, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lQer3802+2yx

On Tue, 18 Jan 2022 at 23:30, Andre Przywara <andre.przywara@arm.com> wrote:
> Looking at k-u-t's arm/gic.c and QEMU's hw/intc/arm_gic.c I see two
> problems here: QEMU implements word accesses as four successive calls to
> gic_dist_readb() - which is probably fine if that helps code design,
> but it won't allow it to actually spot access size issues. I just
> remember that we spent some brain cells and CPP macros on getting the
> access size right in KVM - hence those tests in kvm-unit-tests.

Thanks for looking at this. I should have read the code rather
than dashing off a reply last thing in the evening based just
on the test case output! I think I was confusing how our GICv3
emulation handles register accesses (with separate functions for
byte/halfword/word/quad accesses) with the GICv2 emulation
(which as you say calls down into the byte emulation code
wherever it can).

> But more importantly it looks like GICD_IIDR is actually not
> implemented: There is a dubious "if (offset < 0x08) return 0;" line,
> but IIDR (offset 0x8) would actually fall through, and hit the bad_reg
> label, which would return 0 (and cause the message, if enabled).

Mmm. I actually have a patch in target-arm.next from Petr Pavlu
which implements GICC_IIDR, but we do indeed not implement the
distributor equivalent.

> If that helps: from a GIC MMIO perspective 8-bit accesses are actually
> the exception rather than the norm (ARM IHI 0048B.b 4.1.4 GIC register
> access).

Yes. We got this right in the GICv3 emulation design, where almost
all the logic is in the 32-bit accessor functions and the 8/16-bit
functions deal only with the very few registers that have to
permit non-word accesses. The GICv2 code is a lot older (and to
be fair to it, started out as 11MPcore interrupt controller
emulation, and I bet the docs of that were not very specific about
what registers could or could not be accessed byte at a time).
Unless we want to rewrite all that logic in the GICv2 emulation
(which I at least do not :-)) I think we'll have to live with
the warnings about bad-offsets reporting for each byte rather
than just once for the word access.

-- PMM
