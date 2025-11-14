Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D62CDE018
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 13:22:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJtkc-0003Di-Rw; Fri, 14 Nov 2025 08:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJtjW-0001Cf-Fv
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 08:21:00 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJtjU-0002vx-Tp
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 08:20:58 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-63fca769163so1816496d50.2
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 05:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763126455; x=1763731255; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SrNpysS5iPmrz38YudoYz05NZLKPiHOdqavnyuAT4ic=;
 b=xCnlT6yhRAx4OTcYb1qrfcMQoFII/wlvw0VC8a8sDXPZdqRTSYsolLKVt82pPnSR1B
 aCieLAvNGlToaUG6uzC0n1FNCGlZn7NIgoDKmZWg7YIsFCjMbCePK13mXeP6Zg1vkirj
 eTXOk0LzOinDpxJKi+NmMI6Hu5iIGWSPCKOgTtnn68WR24O9YDfxpd7GyA3iFaTvfvZ6
 MnkD5jMPCQ1bIlqMF58ECGt/Ezd6CbwkEKnzwfNTmyVZlP91OmIkzzAHkx64R0jDKC1S
 F6+rkUw9ytahfHzUZTuH3EDfbmyU4mTS7F6JoO538bEgPs0dszsoLlqH0kBdbAyXyrBH
 gktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763126455; x=1763731255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SrNpysS5iPmrz38YudoYz05NZLKPiHOdqavnyuAT4ic=;
 b=pRUvt05nYpdedNsWpPINNpv6kApTrk4i3hYt73M+Vutq7daAwUa7Hw8ibu0VGguqoU
 jkoUNuCD3NKQrbcvydHQymTlDBMDn0Y8MrZB95/IoIBWa823gmrhjk0iekFqUjrNI6z2
 hTdejZXLAUEAYUQJvKlqhIEFi07KsK3xv6/sSJAjXJsHPUoSHIydtMNfZFniuT80mJGd
 VrJ0Eg2HrLRQUPgV7EVDv2TesJAXcnfvvoxZ02Ff7q/GkSIg4eK84reTpdxra5m9wyYH
 +es+7L/h7HWFyfHBGpI4nvdG4Z0Lz6qwXQHIeDyYSzKqB4ngn3FIyXal35eNNSvhszYw
 2Xhw==
X-Gm-Message-State: AOJu0YyoOibNhQA8shhb4H8RIbt/I3BIQ1jqcQ+EYeXNbQBChdcdcRRd
 d5AcoSzBDLgoh1fn4BH6rCLwKMNC9CfBMljv7669DyWQzo1x1cRsqvCnEDQ75uXMv0dr7SGCod/
 VX9MpabyTBHy1hQjsT2vrbTaPeKRM8fhrFPruq9hrlA==
X-Gm-Gg: ASbGncu5Hh9Iwmu6e2NPSDH/FI5i9xADQiiQOOLuFJLAnRdsVyP3inFArb6A0k9qo4R
 ObwAFKlDrDh7OMF+fkmrv8JHf4r/ZkCmHDOBJKVjPjpy258pnhiJVKga+L9WsJ2mCj/I7d65pOT
 xn8bKvAwCnB+QnPT5vGzQgNoUjDTJfR+WJ0OgfjEf3XI5u0FCpVfcSOA2yoT3l4uylaCn9mcQwu
 tjihit2wA6wbIkOFWEdczPWc9Yud7dUojR2PniRLheJUVKagkhqJibgcFW1qFQe77Tv31nyeOpu
 hhgQCOc=
X-Google-Smtp-Source: AGHT+IEZvp7ogq2k4+3cAXrGsKtv/kY6iQ1vRk/qU0LrH1sOi1uFs5rxj2Lpe2EmBb3mxQ8Oftpcp89PCGit6NslwcA=
X-Received: by 2002:a05:690e:240c:b0:63f:ba88:e8f9 with SMTP id
 956f58d0204a3-641e75e62f4mr1986404d50.41.1763126455421; Fri, 14 Nov 2025
 05:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20251107154116.1396769-1-peter.maydell@linaro.org>
 <e3530b1c-6f5f-48d0-ab5e-da94e59c275a@linaro.org>
In-Reply-To: <e3530b1c-6f5f-48d0-ab5e-da94e59c275a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Nov 2025 13:20:44 +0000
X-Gm-Features: AWmQ_blUBXMjCT9mOgBIwS7Rfmq0QQ_KIoHgIVAoP3qC70c3rAK0Z4xi_II4upw
Message-ID: <CAFEAcA-CfPPBORHu4mZUzK=A9Y8cJJ3H508PYykGz3ggPYTxvQ@mail.gmail.com>
Subject: Re: [PATCH] hw/audio/lm4549: Don't try to open a zero-frequency audio
 voice
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
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

On Sun, 9 Nov 2025 at 10:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 7/11/25 16:41, Peter Maydell wrote:
> > If the guest incorrectly programs the lm4549 audio chip with a zero
> > frequency, we will pass this to AUD_open_out(), which will complain:
> >
> >     A bug was just triggered in AUD_open_out
> >     Save all your work and restart without audio
> >     I am sorry
> >     Context:
> >     audio: frequency=3D0 nchannels=3D2 fmt=3DS16 endianness=3Dlittle
> >
> > The datasheet doesn't say what we should do here, only that the valid
> > range for the freqency is 8000 to 48000 Hz; we choose to log the
> > guest error and ignore an attempt to change the DAC rate to something
> > outside the valid range.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/410
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > This bug has been around for so long and is a weird edge case whose
> > only effect is to print a debug message, so it doesn't really seem
> > worth cc'ing stable on.
> > ---
> >   hw/audio/lm4549.c | 17 ++++++++++++++++-
> >   1 file changed, 16 insertions(+), 1 deletion(-)
>
> With s/8000/4000/ in description:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Applied to target-arm.next with that commit message fix, thanks.

-- PMM

