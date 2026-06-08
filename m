Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3313CD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 15:55:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWcJV-0007g1-AF; Mon, 08 Jun 2026 11:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcJ9-0007X2-N1
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 11:54:38 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcJ5-0002bh-EZ
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 11:54:35 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66077c46c5cso3852342d50.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 08:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780934070; cv=none;
 d=google.com; s=arc-20240605;
 b=M+jyZfZ1lAUs9DCHz2GslPk0r5rwbmQ99WFp3dvxB8wE3QijnUBOUj+T1N6Kpg6EAD
 IMAEqdsgmJxNqxch496pYpbL97gTUYjmR/sPdtbLXcFCcmbGTUFP//m563Q7sNPISnTj
 HLh6S2N+vNBP0sQ9fQFUNJSAC7kGOUlft9hPTddsBNAm8O+x4bZSt5hajNFL768BskQd
 t24426U9Pw2RM3ckjV/lmrEOHdGpoCkqAhRgQWhpNwCKVElkT01ptDC8KCkoEJ5dJ5gE
 CLcPIzW/F/l5UTNRARONtEeLv+gAOlc+msfSDSs+7TDcSwQzi4FVnBhImzFLzb4NvXDd
 WtoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=s2/D3mnSjO7qP/IJ61hhyERcAo/83C6MsnIZ0N9mtts=;
 fh=DfwTr/QA58wc9pXbZsaqOxCXQlk7bB+Mn+gpDSNv8L0=;
 b=FLE2c0Q4n1rloJd1Di8ORPRjohSnbzgD7JNgl3AZ5qtGX5iq33AgOlbjMJokp9n3w/
 s+Epx0t1ZxQNlm6zrDtK2/L4WGIWpvLJgc3OCdluhSf0QKoaZ7vpQv8MxqUsw4Yi3ig0
 lxF/crZNq45mjeT8Lg948woifHI7PoTDOkayTWvm02D9xI2A8OqBaCjlsW88nJA3Tnjs
 9k1D8VVJSRZCc5Bu67kAwP7TdP/H4yar6OvUaCpW1LVY8OhSHeHQh2qrx0zrlKv6pkyW
 9gOM2hTxEN3OkrLPXPN4WTDgnajIbU0rTv0hRtcBeXFu6deLe4xXSB83tmxJ/JMK3H44
 7yxg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780934070; x=1781538870; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s2/D3mnSjO7qP/IJ61hhyERcAo/83C6MsnIZ0N9mtts=;
 b=FH5sMhoUpCejmOdH7hOhBrKPyJUhwHrnjjJPjW2evfFhLW+NZxq15Ztw6eCmxzSfic
 Pah6OmdZmfXBIyoFfb7MRzCT5LduqP3nJnbRz+RjMROOJf8XO4IaL+uSOSmr5sDkkSZz
 hiX1lrQH105AQfAdBV3IXwa8qYuilFzp3JKsk1fRaz9Mn1mT5aCed7wXoJ2GFLzBvzoN
 7Bo+RfCOw72dd45ISLNRCuvOKg9ExHs1wyqzJqXEy1OH0QsHZ2aFMlpMKqrJhgBFlxkV
 4wOW1YjNuRvP8C6c0shJBJprjlrxNMI7bDEELwMd8x5zWcGxW0BNT6yrDDlrrsB3+HCq
 Ge5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780934070; x=1781538870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s2/D3mnSjO7qP/IJ61hhyERcAo/83C6MsnIZ0N9mtts=;
 b=UU+Wx7ZyEDxk2vNkjbm6OUMKeDA/jm6fggsH3jCfGChiIrwjwOyRFOw6oUsqjRMMaK
 810xfqqsSL2QcJcRGe1TgwbSzU5aG+s2IgeW6aHES+t7MU9qmpuqcLNuMtjj+8yBxeGz
 YYTBRdxJo5iA11SnXYJDedhMbKoCMiM8Tnc0vXIXbYT47lmDuWRQZ4OsRNpOqV+f8u3A
 FizMVzQaQyOh1/SjYanZDn7mlycGL0cvYYaHsL0sAuVW+O1G2WrEJW/m/sIOQn2GtP58
 hH5XXfnB1hCcYRT76GXVUHnCCmeXLeVGS+l+9jvbU5UHYJjNGrwvESRg1Q41PnxzRRdO
 P0sw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xdaGi+la2mYv+gzmEgLGQ/mDIsOTTytki8onnKq2TMjPSptOJTX583JZP2kQ0y/NJmvWr3nycJw==@nongnu.org
X-Gm-Message-State: AOJu0Yz2JT5JxkM9F1pMdjOxM+faKvKHHWfXTnjgAREMnW3+S3HqGdmb
 AHis07A/DwbwLa49HUGl64i5dc7IyxFV0RiSmjeMLUfwlioKxww0qAEWDzQoPbnvaR0TJ1mHDUT
 R14wXzU36l+whjFC9GRKrh1R58Oh5dFoEukh0NsPJq91HWW4c7L47
X-Gm-Gg: Acq92OGoMd7MQHOiGHXF24mDPoF7nIrRJr8c1JcBeMAQL7PbHRUkY/zcCNXzMFBrRb9
 o37eNXldvHXvYxNHH7MAfFo0hMsbkZsGbqzVi641iBH4hF4TyTLcGGkmthKlPf/VoNbYEMQjpBT
 nFJHQwNn+f7bHIrE02AnO70ZJF6gGDQpK/MzIB+ZMJfW1ubv2UvLB8ZXQfNG00Ezbzukfi0b3Ym
 ppncbJFk6Yn+br1ePK0Y8eLzfEDAt5OGuSBh0/ezy453yiKMnIF8k9bvE/au/7kBJkGGAkMJXte
 UMTZLVIOuq34jNh4EIjdImnq40aHpsDOYp6Wo4iHk9PQQozbWl1dZbK2pSN5KiLIuzpcEGLIDfO
 lGQ==
X-Received: by 2002:a05:690e:43ce:b0:660:9c4e:a453 with SMTP id
 956f58d0204a3-66106e12449mr9133744d50.16.1780934069939; Mon, 08 Jun 2026
 08:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260529082948.363931-1-alex.bennee@linaro.org>
 <CAFEAcA94+mh_pigFDi+tEPRJ416fSWfxsQ1Lj8Byemug9kBp6w@mail.gmail.com>
In-Reply-To: <CAFEAcA94+mh_pigFDi+tEPRJ416fSWfxsQ1Lj8Byemug9kBp6w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 16:54:17 +0100
X-Gm-Features: AVVi8Cfcobky8tPd6t0Cm9SbpBYctPY7IQ1CxUYmRia6Q_QAliEI2uVYwa0G1l0
Message-ID: <CAFEAcA_5uw3z9ePV83Ni1fsVj_m3340i7E2X-DO0=st-ZDqxEg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] target/arm: fully model WFxT instructions for
 A-profile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 8 Jun 2026 at 14:51, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Fri, 29 May 2026 at 09:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> > This series fully models the behaviour of WFxT instructions. We
> > already had support for WFE for M-profile but we left off A-profile as
> > it has more potential sources of wake-ups. The main one is the event
> > stream which includes events from significant bits of the timer
> > ticking over.
> >
> > The refactoring from the previous iterations of the patch have now
> > been merged.
> >
> > I've dropped trying to fully model the global monitor in favour of
> > taking advantage of the architectural flexibility to have an IMPDEF
> > event wake up for any reason. We treat the setting of exclusive_addr
> > as such a reason because it indicates the current vCPU is in a ldstx
> > exclusive region and we don't want the guest to deadlock. This does mea=
n
> > the system won't sleep on WFE enabled locks but people shouldn't be
> > relying on QEMU to model real world sleep patterns anyway given the
> > efficiency of emulation compared to real HW.
> >
> > I've written a test case using kvm-unit-tests:
> >
> >   Message-ID: <20260527111822.1563679-1-alex.bennee@linaro.org>
> >   Date: Wed, 27 May 2026 12:18:21 +0100
> >   Subject: [kvm-unit-tests PATCH v2] arm: add wfx test case
> >   From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.or=
g>
> >
> > All patches are now reviewed.
>
>
>
> Applied to target-arm.next, thanks.

This turns out to cause failures in "make check-functional": some
tests now time out. It looks like the patch that triggers this
is the "enable event stream on WFE instructions".

13/79 func-thorough+func-arm-thorough+thorough -
qemu:func-arm-aspeed_rainier               ERROR            36.17s
exit status 1
74/79 func-thorough+func-arm-thorough+thorough -
qemu:func-arm-smdkc210                     TIMEOUT          90.01s
killed by signal 15 SIGTERM
75/79 func-thorough+func-arm-thorough+thorough - qemu:func-arm-raspi2
                     TIMEOUT         120.01s   killed by signal 15
SIGTERM
76/79 func-thorough+func-arm-thorough+thorough -
qemu:func-arm-quanta_gsj                   TIMEOUT         240.01s
killed by signal 15 SIGTERM
77/79 func-thorough+func-arm-thorough+thorough - qemu:func-arm-bpim2u
                     TIMEOUT         500.01s   killed by signal 15
SIGTERM
78/79 func-thorough+func-arm-thorough+thorough -
qemu:func-arm-orangepi                     TIMEOUT         540.01s
killed by signal 15 SIGTERM
79/79 func-thorough+func-aarch64-thorough+thorough -
qemu:func-aarch64-sbsaref_freebsd      TIMEOUT         720.02s
killed by signal 15 SIGTERM


I've kept the first 4 patches, but dropped patches 5-8.
I also noticed a problem with patch 5 which I've commented on.

thanks
-- PMM

