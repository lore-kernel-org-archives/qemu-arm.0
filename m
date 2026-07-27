Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B63C531D0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 15:59:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woNjn-0004Yx-F2; Mon, 27 Jul 2026 11:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woNji-0004YX-Rf
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 11:59:26 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woNjh-0006Vt-5Z
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 11:59:26 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-66896892b6cso3242608d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 08:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785167964; cv=none;
 d=google.com; s=arc-20260327;
 b=H3v5XWShxTqq8zQMG9bDR+Rg/uMvhzjo1umEVmP/5F2064gIkV8JNwkN+khU69D9uX
 C5YGMu70IdVvY33acZjbbzqtppPcLIEszTpuvHIRQTbVQVHE0Uj3qes1nL54jMkwo75L
 dE0E312mRj+Oo7vteU2ZgNRAuq3E8FCHisvdfrlp4+o1+afxYrpJtcr7VMPWjJgY282W
 gpXAxqyrvjgAqDnjX+yaskGMFOp7UkTVi6L8D048WnRyfCxcEefqWaLIVJhKtb6XD/VT
 yb4idpDf4DuvUJkwE9+6kVCuM+B88CcVCXx7da10X0tEmQ2JlY7tbe1WFWlGXaBW5OPB
 Fndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=LzCA0dcBWw9zMpBSkkCLQ5WnVwl27Gu831ToutkkOXc=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=bBosKmg1h4LRS4O9D9drpkY1Bnwd7YVUV0g1RvVWjNC4+pTpeI1QoaA+u6th0WHtoa
 Fmvfd9Wuclr+xlS6B2MvrEtQpjEMlOlS463eVvYLYM2yPOhJ7aT1n6fV5Mk4q6DL1b1O
 pQm+eF5zl0925Y6Rg3829wZnAbIm2wxxQu9njmkXqs2zUk9z4k0vv/SEg8Er2unMsTeh
 AJaMtvUYzPrH3RlCX+nqI2JzjYJfkKfF7zrx4wriNGBA2h3mQ2FLhL2uzGSICqGn2UdH
 /kFdo2FfdDVJ9AOJTNsI4VQB6kJueIWZf7+eBVLy8VOa2AvoicC6CifyqTKpt0fcSReB
 LLdA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785167964; x=1785772764; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LzCA0dcBWw9zMpBSkkCLQ5WnVwl27Gu831ToutkkOXc=;
 b=R/9Dnue3xrj30dNVAxd0uVKHbDQBCY99W/Fjn1z32o3+YqclJ9iblt9Y5IvNvUnwz/
 CStJTqceblWg2BWiUAkZhGVp/9JqQxCus/0VvdJ0rR+HLO4bxWfKzNpm9zluHMQfk9S8
 6XRMob4uqKMJltHwAJRF+lRcyQbUjU7hNkRp1jSc8jvmT1bCe8x3zMIQDibEg+TIQuBX
 oTPZEn0vtcyG2esuFV7CaK1TYnFNX2376uTHSmnfKWQKj14GeDOy1ZcIUDD0WwJcaMrX
 hnXRmCVKDqTkImKc8Zu9tumM7qJDgrWJWBScfjd1yJ/PY1YffYFy+26et2/PZkrEJTwk
 aYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785167964; x=1785772764;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LzCA0dcBWw9zMpBSkkCLQ5WnVwl27Gu831ToutkkOXc=;
 b=UFHkpB7xiWRw8n1drKX3/xOIJK+daXIfdVxeZyBlGdq2ctOJVQVE7RonEFBgxjxf7r
 9D2pRdQMtkBq7xw9jXTMqHdfHJ6zThxkOHLixtIdcIOIi+whTley6ybdVp2Jt3gJsnsu
 jKz7mJDZE1wajmWG+Ru+J16GuVYsewNoRsrun+uBIDthBlRo5a85uw++FDSuwX5Hg2aw
 OdEKZBUhRV0ltCzyfW+aONdKaoH2g9E5UzpRAET8wpBCvppKBaf2QrrVaQNWE818IyPw
 vQMcUNy/4wb1+Lpnryvl90QzqMKovSHvbnFpBEqvy1sG/etztBrIZ3O4muC6cyZCc+vI
 VsQA==
X-Gm-Message-State: AOJu0YxZpYx5cj9IYNPVmRRfF/Mt3yaCqccxVTHYXmExAoOu+skZbiSP
 Cas3MkFjLVoh0rtUFg++B/kSBXNy6fvvL/YynI4ECs9rRRdVRDhW0E1Iq83QN3ew2EXgLkTJCam
 PWXfk+7NGmevJJ5U4/G7VySQUpTfawbX3wNROSPJXoN/lnYXObzHI
X-Gm-Gg: AR+sD12znuHWMt8y3YTs7e1o+xQUZpzVakn93GhaY7LETLQBogBQwX3Lqme+cvAN850
 ei4sRI8vLYau80YoIWLYD/qwIjqc+aDlFBu17tUNzh0X9p3elZ1DrKT8C6AzWAJkRtridNv89+7
 MH84l9jVfEgFDeFc/v/SR+MstWvybkFJ0BOmphqJtkXnFrqE+Sc3BBZi8jRihJyAbibonPd5bH2
 7RN9DwWBa4ncbaVt6XyAoX6poQ5Pe9Ub7c689ojnl+6c/jNiUPLt036Z1pMULb6Fea7EFJtFO8b
 Ty4H2JSSJ01+TRKkUsC4VWTW4ctGaOn8gIPg8slleGa2vA==
X-Received: by 2002:a53:d045:0:10b0:668:311a:d444 with SMTP id
 956f58d0204a3-668c7c31410mr2054205d50.106.1785167963650; Mon, 27 Jul 2026
 08:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260706173324.804340-1-peter.maydell@linaro.org>
 <CAFEAcA-C4t+=KYiX5sk_Fj528u2MkB4AE74gC1yrWTzAxmTYew@mail.gmail.com>
In-Reply-To: <CAFEAcA-C4t+=KYiX5sk_Fj528u2MkB4AE74gC1yrWTzAxmTYew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 16:59:11 +0100
X-Gm-Features: AUfX_mw6ZDsX8z5Uy4FWAFW2YWnUqtzXC94srrSFLgVBsAoAvrNiIX6wwTpZdwc
Message-ID: <CAFEAcA8rFv3B5r8ZjwD080NO9mpc640QLsy0_bugkADKYBPz8g@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/display/exynos4210_find: Clamp windows to screen
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

ping^2?

-- PMM

On Mon, 20 Jul 2026 at 09:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping for code review, please?
>
> thanks
> -- PMM
>
> On Mon, 6 Jul 2026 at 18:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > The exynos4210_fimd device has a setup where the guest can program
> > both the overall size of the LCD screen and also the corners of
> > "windows" that define where the guest memory should appear on that
> > screen. The current code assumes that the guest is sensible and
> > puts the corners of windows inside the overall screen. If it doesn't
> > then we will try to copy data to an address that is outside the
> > interfal framebuffer memory that we allocate to be the size of the
> > screen.
> >
> > This patchset clamps the window coordinates to be within the screen
> > size. Patches 1 and 2 are simple refactorings to make the third
> > patch easier to read.
> >
> > This fixes https://gitlab.com/qemu-project/qemu/-/work_items/3795
> >
> > thanks
> > -- PMM
> >
> > Peter Maydell (3):
> >   hw/display/exynos4210_fimd: Factor out finding screen width/height
> >   hw/display/exynos4210_fimd: Pass width to draw_line functions
> >   hw/display/exynos4210_fimd: Clamp windows to screen size
> >
> >  hw/display/exynos4210_fimd.c | 54 ++++++++++++++++++++++++++----------
> >  1 file changed, 39 insertions(+), 15 deletions(-)

