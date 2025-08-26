Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3E1CA0EFA
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 09:22:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqpsC-0003DN-7k; Tue, 26 Aug 2025 05:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uqpsA-0003CC-1k
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 05:21:46 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uqps5-0006Ol-9t
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 05:21:45 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-72019872530so19413687b3.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756200096; x=1756804896; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cVT8EqQo4oW+kPc8LnM88Q3GyD1e+KQKjlAxfsHzn0Y=;
 b=yQ/lQiDkozIiNL/jKUsuLEqcUr0O+QnvZRxays+pSygnSDSihCWJeUc2ucDPYHeqAC
 8kN5hu/Kgik73bkHKsOfDZ18BkGJXwXXzblwaLzbmJqv8yrLh87GDjalavk8UhYNAm74
 GV75xNtuhcINE/XJ+U2XNF0GYOEBnRqqNxRnqQAUH0uZXhd6vYec/QCevZltejDvpQA3
 XB49/7brsC2tLyTIhoqP4OY9i9lwCzWzdmFGuEWgepX8Sotth0AFBOng9RHYe5sfeZc4
 VomMQOsjyyM5Oec0HzhqeGZwtfI6qa17gZGk1bqUt1fAd3chs33WQuPun395L9USJmSi
 Ysgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756200096; x=1756804896;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cVT8EqQo4oW+kPc8LnM88Q3GyD1e+KQKjlAxfsHzn0Y=;
 b=gS4xocVwUmxHu1mCiv/AqLLrFxBq2PmBQDfHOE6A66K34kAtd88CnG0FoNadV3yTuN
 BByB8x+gSmG+ldNiWSGAgrS/SxedSgDFHhxhtuhVXrA8blxOQls1ASJXBrreknox3Ut/
 XTIXnhqk9Zo8uxC3Y9E0MaLxJZ4TOWiosQBuRN8ZRh1h2v0R7O8rgLsQJU5vqLURz0Jb
 nGzArFETAZld0H1pbVZcDRBgN7xoa1eR94yiNVYY18bNFALb3I47Mb7YDe/N+ACgjb+4
 5dCKZTvUf/EgrRJaU6JdXDB9Dc7HiksaNkIIzj2Y6dKCumqox8Gpce88VB7vSOWoWF66
 nA1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuPchhbk83ZNuNszQPbt4htA0U6Vtsry8v6/wjm0WYa1/BIctsh6UYn0mDsk/78gzLBUFLYyKWMQ==@nongnu.org
X-Gm-Message-State: AOJu0YzhjxiUdSyCmDT4//F5rIy28GQTHjDBOuYnbuW02AX68RTiBdyq
 wfI/Fx/IM+JZc//xK5i2KnNI/t+mLGvCQtRTmxcve7hl795KLVKS0Mm0T6+nXmhwRVdZJFILjQO
 J0YZn4dPt92v+p0+MVZMKiDE5OfLzyZwZ9LnwT6oL+pcOkZzsUiin
X-Gm-Gg: ASbGncsoXLTI5aBxee0BcBP05CZaV9pQKSPwdi3O9Fk3jNFmF6IqxBQ4bclSv2fulhs
 b22XH2JE2WB3YaR38eD7kl+MMDbIR3Ws62mS4PnwQCsOk0+ENC5W786eq+DPoLITsV3EstpBW+C
 qKuleY4QDj8lRWfRJIyYOzhrDyOttcaJf9v8/nviGvELDkDwtCAj+mQt2KRsL9lPzVnGHjJO5e8
 GSpG8dIb0dT+pbDNys=
X-Google-Smtp-Source: AGHT+IGdJWD0WCczBe3htWp1bnyINaxl97XJ4ggXdwjchtKDu2qxn0hdjKqlPRfjVb4z7W4skgk2WGnKHLSv3uDs2Fk=
X-Received: by 2002:a05:690c:4d88:b0:70c:c013:f26 with SMTP id
 00721157ae682-71fdc401aa8mr164838487b3.33.1756200096481; Tue, 26 Aug 2025
 02:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250629204851.1778-1-shentey@gmail.com>
 <20250629204851.1778-3-shentey@gmail.com>
 <CAFEAcA-HaQwySM1j7Cy_R1z0fM1D9ykiBiMKLYNVYF+Tm_mrPA@mail.gmail.com>
 <78B2535C-38D8-4612-8958-49AC28482A8D@gmail.com>
 <CAFEAcA9b+1xx+Esnt80Ny1gWBOsh-QYYxuP6PwiPk-B20xv0Dw@mail.gmail.com>
 <3DA254A8-76AC-4214-8C65-D3B3FFF55FF9@gmail.com>
In-Reply-To: <3DA254A8-76AC-4214-8C65-D3B3FFF55FF9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Aug 2025 10:21:25 +0100
X-Gm-Features: Ac12FXzkdbz8sSFdHkKIw5XmLVSnuk_qul-gsCB_G4ZzkqTuDewcIWi7cASaKvg
Message-ID: <CAFEAcA-0843-YZMDqTDhiJgF223UrAcb8cQL5-ns12o8VHaT_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/imx8mp-evk: Add KVM support
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 8 Jul 2025 at 17:36, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 30. Juni 2025 21:03:06 UTC schrieb Peter Maydell <peter.maydell@linaro.org>:
> >On Mon, 30 Jun 2025 at 21:22, Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >>
> >>
> >> Am 30. Juni 2025 09:09:31 UTC schrieb Peter Maydell <peter.maydell@linaro.org>:
> >> >On Sun, 29 Jun 2025 at 21:49, Bernhard Beschow <shentey@gmail.com> wrote:
> >> >>
> >> >> Allows the imx8mp-evk machine to be run with KVM acceleration as a guest.
> >> >>
> >> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> >> ---
> >> >>  docs/system/arm/imx8mp-evk.rst |  7 +++++++
> >> >>  hw/arm/fsl-imx8mp.c            | 33 ++++++++++++++++++++++++++++-----
> >> >>  hw/arm/imx8mp-evk.c            | 11 +++++++++++
> >> >>  hw/arm/Kconfig                 |  3 ++-
> >> >>  hw/arm/meson.build             |  2 +-
> >> >>  5 files changed, 49 insertions(+), 7 deletions(-)
> >> >
> >> >This puts a lot of IMX device models onto our security boundary,
> >> >which makes me a bit nervous -- that's a lot of code which
> >> >wasn't really written or reviewed carefully to ensure it
> >> >can't be exploited by a malicious guest.
> >>
> >> Hi Peter,
> >>
> >> Does KVM increase the attack surface compared to TCG?
> >
> >Yes, because our security policy says that TCG is not considered
> >a security boundary, whereas KVM is:
> >
> >https://qemu-project.gitlab.io/qemu/system/security.html
> >
> >(It would move from "non-virtualization use case" to
> >"virtualization use case".)
>
> Thanks, that document nails my question.
>
> If KVM requires the imx devices to be inside the security boundary, what needs to be done to lift them there?

Code audit, fuzzing, commitments to maintenance. Basically
I would strongly prefer not to.

-- PMM

