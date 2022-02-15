Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp618792lfl;
        Tue, 15 Feb 2022 14:06:32 -0800 (PST)
X-Received: by 2002:a5d:49c5:0:b0:1e0:8842:aebe with SMTP id t5-20020a5d49c5000000b001e08842aebemr6130wrs.337.1644962792274;
        Tue, 15 Feb 2022 14:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644962792; cv=none;
        d=google.com; s=arc-20160816;
        b=dz8WPNcAvLskaKkJGHKadKX79dXrPF1WXnkQsnKKel5SBUIttNm4LEc+klezSMxCiy
         Smte/29jbuk/7rB+wzSeIh3vKBBtDcAMX05utyAreEMCNNiFsnuMg+2Hl+swypqU9/23
         8c3KlMYQH1aqE9cVP7QY9vsWiJ4Or2hDmn24J30Fx3mU74vg6aPCixcciz2TD3P1V7vC
         c5Z4pU7t7Jfk0CRBFgD/ZfhHkxFkM6IkenHAh5nA1bJW7srXcP7XqMCflZL4iMzJBVEZ
         RoNhVq6tV77l1v57tVPRhcLkKYlW1CNRXjJSZ5WLuRnoiDKUH/Z7K2GPpcKroZW7lc3J
         Q1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uWJuQd3u5jYBPObb+LwdIwwHZ0kfCM4Q0ZXoLm2w4EA=;
        b=nkKXRVhAr15KsMeWPcWd2r6bHQx3rsZsX70GSAKsLME4iKQUVH3cD/hR5lDTZNzPgy
         XHKFfR5cQ+VqIwkYcKaJf6DNudL86mILNUp57KWRoi4OgAuHyeqE67+rh1Lx8ZmvQGr/
         BozGjHkydA70p94GZlGEhPtbDpJaIBiE3MaO2OY5gWotDQdYUf4lXz92CADlTqyPiV10
         GSfxdACk9oFixDJjxciaFNI61ZWqdpynjDZqN4NoH9gN61ZKns8SBesaOAFlmDOUPjeN
         OlZDCLL4f30kgdnTxP9gqjk6mhKsWMLC1H5xQaaKLIS/liQmUR7XGhJclWDHiipE+clk
         nfrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sB1RfWYA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l37sor5369746wms.18.2022.02.15.14.06.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 14:06:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sB1RfWYA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uWJuQd3u5jYBPObb+LwdIwwHZ0kfCM4Q0ZXoLm2w4EA=;
        b=sB1RfWYAXYNKWwPJ4cjdS/s2ExUKnVxURS+huSKvm8AoixapMZqu1ffIPr8EZfYr4H
         ZrEDZAXChDwhRlh8TAzdRlBhDyYWOUwS8gdsJ4DvW+Ro/v5D485uzXReE6BJ8ivBI53H
         68QTHkb0Z30TcPPR52Qbf2UKIaMze1e4zCb6P5gXfZYdPEYHXm6bD6DMCNSlPt9HOUaB
         lZhSygubT1h9L2uXlIttJQ3lwHsD2UKum7FCrqPmNeiKLdmDyb5YhcrUaKdNyJF8m7TJ
         8STx/80ZrCunbRhrbsCnstlmbx1niwNF0Fu4sSK8iuFe2sPVS1FexKjVZdfZuRNs/Min
         2pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uWJuQd3u5jYBPObb+LwdIwwHZ0kfCM4Q0ZXoLm2w4EA=;
        b=zhATim9yXh66R0/JQMRtdXzU4TwbB/Ji06MpVR3dhEs3cWGKIcvopxGn/Z6QTmDJfr
         31bXn4WdtdcpmoaRTOtqpRL7QSuLFNNsiszrDzhnv6LjqEGELOwa+foDfABnjg6WES2A
         1nHFx/KQNMNRFJIIOIlGZMu6EyleNh3gbtVxAgLYLIdAUftnmUXuND6+TNS2yIy5kwOY
         AqjUxfSLmUckkKi2d7E80BqyrlZ32nW/30BVgDfkP0aaRfeZ1b1pmSP+faa5smLP9/wZ
         79/s7WDgFNFDj5lKWGEjaJNK6HTUpTcd+yDWRbM6B5BMNWi8r6oRTmjIS0BPG0XYlBAD
         aNRQ==
X-Gm-Message-State: AOAM530moieiJ1jzrtV0oZXQ+cDx+mWWHD9OLhCgWXKJFZmLKhBumRNr
	74WW8USUsLZciY7HJQFrgUNOI5fzepO2m1mtERlyl4wg
X-Google-Smtp-Source: ABdhPJxpeSXrPrHXz65iwfq46zelyyLGGI5akUL+4TQXOLjN92Q1D0w/v7/LEcVJF01udTi3hZaSSYRzyK1j3tY4o1c=
X-Received: by 2002:a05:600c:4f14:b0:353:32b7:b47 with SMTP id
 l20-20020a05600c4f1400b0035332b70b47mr4955913wmq.126.1644962791921; Tue, 15
 Feb 2022 14:06:31 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-11-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:06:20 +0000
Message-ID: <CAFEAcA8=ZkMy7YNMricVtBA-U8tTnBKbgH0Et2MjvBSKDPtHEA@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] target/arm: Implement FEAT_LPA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: B83nSyvMxNNE

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature widens physical addresses (and intermediate physical
> addresses for 2-stage translation) from 48 to 52 bits, when using
> 64k pages.  The only thing left at this point is to handle the
> extra bits in the TTBR and in the table descriptors.
>
> Note that PAR_EL1 and HPFAR_EL2 are nominally extended, but we don't
> mask out the high bits when writing to those registers, so no changes
> are required there.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h |  2 +-
>  target/arm/cpu64.c     |  2 +-
>  target/arm/helper.c    | 19 ++++++++++++++++---
>  3 files changed, 18 insertions(+), 5 deletions(-)

Need to update docs/system/arm/emulation.rst

-- PMM
