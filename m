Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3177309wrv;
        Mon, 29 Jul 2019 06:49:10 -0700 (PDT)
X-Received: by 2002:a9d:51cf:: with SMTP id d15mr15529220oth.206.1564408149982;
        Mon, 29 Jul 2019 06:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564408149; cv=none;
        d=google.com; s=arc-20160816;
        b=P9tBlmeW/JIRNcmZoTMfjgWwbonrPvIfraFm6h4ev2OzfYKF28cetV6OKUJhjCHSmw
         Tt3TVVDvdaD/6bTm3L3DTQ5+PRcb+nFsBkmKwfCyPOis+Djt+ghn6zqTpgKq84QwGRIv
         ovolIgWJ/kmgPvEwbkMrdM31AzqeACCH0FqHsl4P2ByLLERiJg5hhz26eFangYaW08Mf
         FAaRakifbAYL/+U9CF0LAuX/WTmqwDoJVZLjA7z2+VnuDlvjLGEzjnZaKa3Ep09QEqAq
         xkir+NKcMcY3lc3SgPV7JVasHkeE7jZK7Y6gOBgcmYYagNOKydnA9tpCK+LDa5T99DGg
         cgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=48qXEGD/D1bvNSdgzHiTnynOO+tKF9PunRPUFt7elKk=;
        b=bZPHnPRGHCVUywCfXXXpHM3dbTx8nnGVrnJFtoc5mCbAp1VIUoJF5pPrDrnrHGdGJO
         anU7iUt5O+zEYJsilih82xH9ZrY8IBBWi4UTA9AzNwwXilApffG7n+a6jnUzPR3rGGTD
         RQ6wz6Axsa+6scYUUeDP5wtJCdG/eJoiCUTyoC5TZAicBehj1fMM+Bi5qm4Zl9NX5122
         C58v2Vzc54p77HweE4Q0xbZ54tLJRO08EEooFBhO2WfHwC/Ky+pG2nE+dyw+zxlPMwLf
         +dFSmKnVxqU0OZCvBvI1zv5qBNItxaqwYyvKVjUyhD1oFolT2gRJnG52nhMexFqhw6ZC
         FuEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f3rwDjF2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q129sor26803424oia.74.2019.07.29.06.49.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 06:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f3rwDjF2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=48qXEGD/D1bvNSdgzHiTnynOO+tKF9PunRPUFt7elKk=;
        b=f3rwDjF2u9ZJ8Jp97/Xzr/2NgNpBQTNUYuEuvmM7vnrtz2LR0e3Yku7QG84o059MhI
         G7ZQV+jxjk013lqWsxyD2WfK97z9ASHwezG7TxDwB59mHnSbI7tS09gC9hH4Tnf5fxZo
         3jIrrniFB9d2Wc9IFsM7VYpSeH9xbKpePIxViDYjOrmdwTjBRsrOfeJ1kUwqO6AQjxsG
         KENB8cGlbVycUYOeFoY+vQuSsGAUKoPlKQFS541oSAQe5oIygtLS2xnMjK4ElAyyOiIZ
         KJJopnI4K7z5NseuS/0iAB2PD7vtMla3T1/3C/eQKc/gDRZjO6Oxh/PER1VB2UEdNNut
         YW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=48qXEGD/D1bvNSdgzHiTnynOO+tKF9PunRPUFt7elKk=;
        b=iC9ulbcIb91JImBWLFYS2kWUaIWkdYM5GlSbZzAvXQ8PCf85RzwlzcjHUi7QObmiIG
         20aZYForTfnOPRoLAEvyun90aBr6m+2Xe4Nc6iGtc1ISkLB0R42cXn/fEWl9SNSzQTde
         k+TNb+nYRjNkcKhmaHYDOVPfC63OotOf2CTVfL7UPMzBy0rQBQ57Znjf7RmtCJC7aW8J
         Tc2JC9tmCXpCKiV6CqzlJ6M+sUkAbxq6/kcJ/p5TESUuSPVAh8FfoPCHCU3oCmWvS063
         xLsMFSFilQHsahg2jSpzpvFBp7pD09fUIhnvPixUnyCNJUU8xQb1t7r0z0sysf3lksam
         BPnw==
X-Gm-Message-State: APjAAAVaW0LcmUSokI+kH+QYruLwpL/paq7xdasys9ugtQV7rNHt8i/N
	29aMqZn7cvmHeHKYMYGf82FLfI13qWo1Wo7cHxuntdlpOJ4=
X-Google-Smtp-Source: APXvYqzR6J9Ygqve4oYBD1IVBAsF6hds66FM+iw4eFuBPVRAY5MGdzu1LbFdE0tXARXDjIlCYcf/YEED6iPI7RqF/JU=
X-Received: by 2002:a05:6808:d4:: with SMTP id t20mr34735519oic.170.1564408149544;
 Mon, 29 Jul 2019 06:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-3-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 14:48:58 +0100
Message-ID: <CAFEAcA-1PzQSLE3jtan9_k9690tf9VLjfE+WWoL1xoKhiD9ASw@mail.gmail.com>
Subject: Re: [PATCH 02/67] target/arm: Remove offset argument to gen_exception_insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: RXp6B3yx5CLK

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The address of the current insn is still available in s->base.pc_next.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c |  6 +++---
>  target/arm/translate.c         | 32 ++++++++++++++++----------------
>  2 files changed, 19 insertions(+), 19 deletions(-)

This works because all our uses of gen_exception_insn() are
for generating an exception at the PC of the current insn;
things like SVC/SMC/HVC which want to generate an exception
where the PC is that of the following insn are already handled
via a different function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
