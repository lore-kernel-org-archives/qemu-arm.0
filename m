Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp510303lfy;
        Wed, 5 Aug 2020 04:08:25 -0700 (PDT)
X-Received: by 2002:a05:6808:601:: with SMTP id y1mr2284468oih.22.1596625705352;
        Wed, 05 Aug 2020 04:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596625705; cv=none;
        d=google.com; s=arc-20160816;
        b=KKIBT9/FyMYywzOJM+LTMgedQ0EGe+aab47hhzoXpvaBi9prIhVfxwFE4tcBtfTfxU
         J4wqIV+tP8xkr6AD9SHFr6fhX0v9gb+zhkTS67UQjghAjp9NqLQMQhb5GKiRJzab2A/o
         CBHtXshRzxYLnmL4O7JSTJk1UiPiEvKvXSLKXDiNTaXPhcA1/EQ2CNmaOBQxg7ikfuiY
         RvaF7F/FFK+aAae+Zkof5QXtiVAc78sgRCFqmsJcRl56xJ2g8RJ2aQWG/x3elsiHwXQg
         FM6DYPf+ChjPB9zqekcuEiJOAmxViqRIjVC1ywp8hbbVuqhKECLynQKF2L4tXphWytFR
         MV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fdqcbqsroOwFE/Yn+1gY9ep3zpwD15rjnexm9pr7LyU=;
        b=SYZy2NSo+8XpIXUfdd73soBpEp21Lo1F12U0794QpM4dIRuOWF39pZJBvh+B6LxBza
         tAlnLLk18GVXfG7wB2rmDzXFHV7n2pydy9qHJqXhaGd8v/C+JnVnfqZC0YxpAv3KppKV
         M9gzhiBdbF5h/rWeWsHCgI3/FQVlw7nL+BEjQV3cBgY/P4m6UCs3zWNLxO8d3Rus2Prb
         wC0QnkO2i9J4nHn/uEULGFRaOxmH28woUuLeYLTOImwJbbQSmJX0dgwmXsT55sAVNNmw
         tkNNsnRPM+E8en6yByyRe55YYe7SA8KEMneeUuopUcw8C0mNAtNWgdI/ro9QyigCOgi0
         MPUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tDNbLKEk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d1sor944373otp.138.2020.08.05.04.08.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Aug 2020 04:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tDNbLKEk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=fdqcbqsroOwFE/Yn+1gY9ep3zpwD15rjnexm9pr7LyU=;
        b=tDNbLKEkpw1ssT5W0WT1D1jlKrYoL3CON+qynShSues1yllf3Voz2Dix9pkLw9MSVU
         OeqDFAJUeNU4VWW0V4hT4PIgmB7bu0I3jzuMX57OXDdm24tgBj8PZepCPYx1VKdEU7fV
         XXbKpxuC6Y0++3MtzDBHZAInpK9LIXIx9j1xRZ6fhnCa8PQ64V+0omtSFqZ/1Kgg4tjx
         e1cPo4YhVfUhg9V/os+TlO+dlrLftEtZlEh32sgLTnDuuuncJt0GlrUaxyeazjbNWA8d
         kz1SmzEj9DidZE4KkcHrpliyTltUT3/2UP1PXRhbefjFlyjjoUdFOkgfLIKyh0bRYSQI
         t2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fdqcbqsroOwFE/Yn+1gY9ep3zpwD15rjnexm9pr7LyU=;
        b=OzK2Ue6mzzl+zRCzFUXmXyUfjGPD9YUNCJWRDV5RuGlOViJeENlfDxoREKWqw4iVBO
         HlWjRsyiPrjENYrutldaJM1nPAZlCB3Hlp5PbWp+Zn1uXh+ahjg4C8O9+jBBxUS6Mz8x
         BH3zD/nxzSP+uDeeYzaA1sBZBMnz4gLj+Pvp4B7kWGTvu+SaRv0lSBGSk7a/Pvxq3Nzn
         Em5ijPmdRO2a+Bz/pSP/CYmN6GbxSQrXf/ja0Hc6PQ22uWOxLM+/BUFa3N10tq5XKYln
         sF4m0/aIjYMarOVuoPnusPemiQDDfj7p9poRhBfbXfdGuWJRs9a5mizvOHdssjbgjxm4
         VWkw==
X-Gm-Message-State: AOAM532/C/OSgXJrjLHG5uwAVxeGAOwklFmsIBecWyAl0iE/guYXxM9e
	PE8vo8pz+EBPjx6TPHK5QM5y2t0xHyEOfro3thYbehfu
X-Google-Smtp-Source: ABdhPJyjwUJBWbl2cIfhFA33M1IOycsgbh2ZI5pB4gLKZDkiMpVmHG8GoyD41lpcCDQ6dnWMMxPJufAle31edh3DJvg=
X-Received: by 2002:a9d:3b61:: with SMTP id z88mr2215512otb.135.1596625704946;
 Wed, 05 Aug 2020 04:08:24 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Aug 2020 12:08:13 +0100
Message-ID: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
Subject: v8.1M cpu emulation and target-arm feature-identification strategy
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: /cUvFiZ90Clq

Mostly recently we've been aiming for QEMU emulation code in
target/arm to use ID register fields to determine whether a
feature is present or not (the isar_feature_* functions) rather
than the old style of defining ARM_FEATURE_* flags. This seems to
be working out well for A-profile. However, for v8.1M there are
a small handful of minor behaviour differences which don't have an
associated ID register field, but which are instead in the spec
and pseudocode just called out as "if this is a v8.1M CPU".
(The major v8.1M new features do have ID register fields.)

I can think of two ways to handle this:
 (1) define an ARM_FEATURE_V81M flag
 (2) define an isar_feature_aa32_v81m() function which under the
     hood is actually testing for a specific feature which happens
     to be known to be always present in v8.1M, like low-overhead-branches
     (ie ID_ISAR0.CmpBranch >=3)

Any preferences ?

thanks
-- PMM
