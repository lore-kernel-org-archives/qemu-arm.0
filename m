Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2797290wru;
        Mon, 1 Jul 2019 08:56:00 -0700 (PDT)
X-Received: by 2002:aca:af0d:: with SMTP id y13mr7218690oie.171.1561996560832;
        Mon, 01 Jul 2019 08:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561996560; cv=none;
        d=google.com; s=arc-20160816;
        b=E/hnajyZcQhcRCSX8Cp3cd8T4DyBuA2UOH9z248zupVleU5OFatpZ51zat3TD7F92f
         TutWRiPeh1XN0mqLWofSZUveCSxxuK2jxfYddfWoB9i6KKgZAmrHAvUkqCsIuQhoIzjm
         6cdQOhIweS454X2Z2GrA9+1lAo/KnWzVq+oWO+zhOOkh5SrmXmaci5Jskj1vjNZDJVsj
         luwOlGSlLIsPSAsXSElDLoUjpyXp/FLqRMRi2pOVCVBYJnvCqzm6NixfdP1X9iaudh1C
         M7FZSxe1jt9WI5fvrsdgNO4Ynxxs/011JK2IKJ9LHPKv0vbSPEKmAwJPbeMXui0/EwSV
         HGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7dDgztrAvYNsHPfOeD93UlTDOaXp/xJd2TN5nfAXZLg=;
        b=0rQup9rQojASXq9vL26l0HpJ86tvx3v7Kmi3xr2vdL0gUm9lyZg9JCPYlrGuTxSWOi
         eQuueNeb2jKfaGE7VFq9VWxlm64lg64xgbVpbSq9qiGOauMgqYinNHXAnFpWv8J2bqcv
         0hkNwa57bWUGUZMYvlrdZ8Eef+2MsNSO5GRkuAgWgGWDcO8oMJcO1GqhbYQ8UHs3X5/N
         sHVwX1B5qbz+DdTrn7e4vFxL8nQtkUG7OUvKus0T9ocAAvEM7SkoWtyNNhccNdwSZE/W
         lJtrTLnpJX4Se11zrmgghfqjfu9RQuDHpgiQqyPQFbLUssU+ncT4/fCnqtaM9JAnJ8Tj
         69xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BrBX4mrC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s5sor6123505otq.28.2019.07.01.08.56.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2019 08:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BrBX4mrC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7dDgztrAvYNsHPfOeD93UlTDOaXp/xJd2TN5nfAXZLg=;
        b=BrBX4mrCEjd+UlHh+Q9RPIslZ16z6nTQqByUM73TIPmE5bFJEvhwimggh9W9dwJt1F
         2bcvfFiGAcd5bWR0q3gDQGxzJOFe9dl+pKB1I1Rbx8i2szuwB8c7GOuX1V6lq38KJM5A
         mYfXUhRDdLIS2jsKWXpS2NP1Rb1GTLUqOVwb3JsUSNk6ISE4nvYmO58OPXi2wSM6udaR
         /M0CrMEDP8wTauyCPiPJTEdxKgiu8GYsZny+jfvgimp7BMq2y0Gmn9+RBZ670Zt+XPo6
         5pxntywGCsI8xZyy87JrsJqPvGczcQ/Bu3KCtNzXv1LLjUKBlZXU4K546YYt5gmuNFGf
         gsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7dDgztrAvYNsHPfOeD93UlTDOaXp/xJd2TN5nfAXZLg=;
        b=H6xrX7HhBgdw1cRMER7/S+y3c0CQa61OKIJaIMVHhReCdfdWzllXJAmVarSP+YUBvO
         e7tjpKBC2zfLTetvJ0OTxPC8BY7bN8Kdk7DiyHqE3ESw3E3mrzv3BNYgodWe9Q8UhUws
         5O602Cp2d2p0doGv2BQYX7q3Kplne3pQnQy4Tj7dxDawnLc4SclAXFMh+CVJJM0mxS7C
         tZkW27c2tSniqr+OiU3kKnINdMDC6BC6Ln2hwokDBDCK7ajGqniqhRHX2Hz14+s+mnla
         uYBAsc0ZiLrGWT8HNfmIcVi2ltFy/aepbVARulDHSqtuGJO1KSJqWg8p7C2cV9QIYzQ3
         v0gA==
X-Gm-Message-State: APjAAAU93fkINuDFThawwz/cXPy/xXmnwr3/IjRa/kocbwXMD/liiK/d
	yS08cGJ1aa+aNjOR784awrZSGyveZQwaCg4usygI+GNJ
X-Google-Smtp-Source: APXvYqzfwzdeRTZa92yCBVDkc8e51nZ/eqTYeosQaHoZlkKT/TscfOMz4KK6VN8dFigtSKnJ/rha5WZr34GQ9kbzjSY=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr20864974oti.91.1561996560441;
 Mon, 01 Jul 2019 08:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190701132516.26392-1-philmd@redhat.com> <CAFEAcA93x6zkbHe1hdg0c8cbo9ErSByP+g6UvwZefxn-6346zg@mail.gmail.com>
 <6222de8e-5b4e-db05-a453-ae4920c2002a@redhat.com>
In-Reply-To: <6222de8e-5b4e-db05-a453-ae4920c2002a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 16:55:49 +0100
Message-ID: <CAFEAcA9p24JkGJoETp3tOR-DyZMi8wJ5U9iqU7=wRPNc7+_=Hg@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] Support disabling TCG on ARM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Yang Zhong <yang.zhong@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Rob Bradford <robert.bradford@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OkAITVQZbASI

On Mon, 1 Jul 2019 at 16:45, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 7/1/19 5:41 PM, Peter Maydell wrote:
> > I have applied to target-arm.next:
> >  1-12
> >  14-17
> >  19-21
> >
> > I had comments about 13 and 18. 22 has a conflict when I try to apply i=
t:
> > I think this is just accidental because the functions it's moving are
> > next to changes in patch 13 so there's a minor textual conflict, so it
> > would be fine with a fixed-up version of patch 13.
> > 23-27 are still RFC status so I think best left for the next release.
>
> Thanks a LOT!

I've pushed my current target-arm queue to
https://git.linaro.org/people/peter.maydell/qemu-arm.git target-arm.next
if you want to try to rebase the remainders of the series on that.

thanks
-- PMM
