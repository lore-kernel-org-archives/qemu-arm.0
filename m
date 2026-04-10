Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BC9F44842
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 11:56:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBAT4-0002rc-MX; Fri, 10 Apr 2026 07:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAT3-0002r7-GC
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 07:56:09 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAT1-0000NO-RH
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 07:56:09 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64edf260b49so2973386d50.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 04:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775822167; cv=none;
 d=google.com; s=arc-20240605;
 b=UG26scQ5HmuZXIcTNr0bgTv3y7rUBpPpxjFZRVlSJB87yMKkROwHBi5dN5Big/nzl5
 N2yGGTcXfplvltj6DjiwHzTVz7M6eXAvN4J5vSdW8Au5OhMLVD6fwwJArD0haoFcEr8R
 X6+UHHz+ID2875iiPfU7wIt8Iq868Vm/tJEkY7ODMdVdquqZExh4ZSAScbX3wkCdna+J
 7bsR/9ql79Y5vq2D8/TWmZCQsUWUikKHDDZP8jWmM9xQmSTVtaZ8enML1YaEMVz4t/FY
 wnHFc5tO8XI/dYeFFfNJmpZPKPGDJHYtrAcYP0TtwD+yz/d+I5eJB+WgneqDI91qeaWH
 ppuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NdWMmMWUhhEGrUOqELcQVtZVpKdSCUAiC9k4sIWwu1U=;
 fh=KyzyvvOv2cqazcGgfuEna7cwespwFu1Z1/lMnLkQBw8=;
 b=bAddKV+mJPPbHOj4/9gyqIARLpH5gkPLAsV0ie2cDiMhYW74ZsUaCAMBpPx1Eqikho
 QXDBW+xlWKtcPFJIcrxjnhHEm+j2wry5+8Y08OfGd7ogFPPHGcey2WrZ6KcbWpG1WJOd
 HeDPPPoJJdxGN2eMRk0ZjYX7fwqbcu6iQj48wEnU+tmusxXX4hFthOD5Vo46peNdgvag
 1+tA8DwCDOfUpPZ22jrLkuztt228xkli4WACKhh+pPA90lXpso4429My+qcs1WHQwwdO
 S40RusxGTdau7ZgotptyceoXEivjIyl0/Nh3DlCdVSDXiy+PK0HiOhBpe600ex3DC+D8
 lNPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775822167; x=1776426967; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NdWMmMWUhhEGrUOqELcQVtZVpKdSCUAiC9k4sIWwu1U=;
 b=iEiEDJ1l/dtcrCFGmjGZWCDN5sk32EwMFgokDDUlpzDDTE48ed/HJdrpQ1d8tGzLvT
 aOdwSCr3fG3HxB6zX0sUgTV8RUo+azIYr0nxMqhnL28MG3o2W05AU1yUyuBLlCxhEqIe
 OL9EvOCicUA/KUtt05MPIhxe0LYTKpOxGf+edXgSKNDjFGextAXrb/NZeByFZjztnUrI
 WE9aIxlGwJQiwsBZAs6ydSw013pLT32T+WdEu8e1WyeDcQRfa/1mUR0oir1lufV8HNwM
 aml9Tc6XUqZLed8tJVhTaJyDuEyxtnSeAiSew2ve1Erj640zx2liobLm8XWXLPRTI0gs
 Z19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775822167; x=1776426967;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NdWMmMWUhhEGrUOqELcQVtZVpKdSCUAiC9k4sIWwu1U=;
 b=DdpQ68j0tm1xvCoah+A/+EtJP207DQutKqu/bQw9tPxD8YblLM7BXLaUXhzuRCqzrI
 JT4KtZZ76UvTs8sBIyeRfhAqiVFttaPYD9nonLn7wkm4d4A6z1xl48kocGGyE/CgJWej
 7LV3FFBHekre5gq/+UaecR/loqpqCflHXzpgJlrgC1xtaLZ2R3g2pAud3G4jSCmpT8xF
 SytJq6mbncjGfGY+vQJ86e6fz5fRp4DQzKst2vvOJCRVJuIXnXLxLlO+EJrt9b7Xo46E
 +alkoZSvk/CQpfYp4olOQGiCrjBHPF2dot1/VZnZO1O+m+bXvDzmTdz2mdqMxqvP9m+3
 7Jzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi3B5qKdvLb+nDgC14GMsX1btJWEyIcC47B8Me4MUPCeCWPU8+aoRyYVWcYn70m0KKGO2fnba1Fg==@nongnu.org
X-Gm-Message-State: AOJu0Yw2+r+0i49kvdMlQYOWfN//hjFbPecoJN5pPlClgNXPdqmB1h/w
 DxwHrBWGwu5h6z1wi1yeeJscYeQWZ5GPq7PRBlosJ6K2RPim/RpF1b47NOIgy5vR6ht1Lm1/GGQ
 D00xN6unIO+LLscn1NvD6Wls3mBDrzEPB6e+MJ5lyOg==
X-Gm-Gg: AeBDiesfKGT0Y/QTRpKA1Hbu2ba9jYLDpsI1iHRMFxsgTzGU9t6zr40Ch7xtco6AER8
 VfnPNFiSUIh54NjecYMj3jYriqB/jP35Ww48CK6EnT+jVD00uf8IP3djAB2hnDzMn4pqqCOjaum
 co+EitRUm8c6sVoSnG1IM8HDe1Gf0K+9GuSQtv30ynxHktv1o0g6HF/0Q9nzyj+vjAY+UpIClCQ
 QWvJTsmp05hIi15dd0PGVMzdjyQwHTyLTE08sQtmrnjg92LOY2js/7S45xLHX1lC1xvPoW6B9LU
 363z7yOJ6T0zyJPBKiTIWMz7PfNaLX1cjX92ISRZtznfCaghhgSDzc2w0l4tiLZlXguUhAlz62G
 VUw==
X-Received: by 2002:a05:690e:43c6:b0:650:1cbb:50a8 with SMTP id
 956f58d0204a3-6518721b5demr4182585d50.26.1775822166656; Fri, 10 Apr 2026
 04:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260306150302.203112-1-eric.auger@redhat.com>
 <20260306150302.203112-3-eric.auger@redhat.com>
In-Reply-To: <20260306150302.203112-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 12:55:54 +0100
X-Gm-Features: AQROBzBNIVO6Wda42HxiLDzM4XQTy-kVpgBVZ-_bCNRZVmYIAfz1zuXD3wRTgg4
Message-ID: <CAFEAcA9=y-Vtu-hPSRpYtdO7ZoP96PUroMB6XLbCHKjMHitHrA@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] target/arm/machine: Take account cpreg mig
 tolerances in case of mismatch
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 6 Mar 2026 at 15:03, Eric Auger <eric.auger@redhat.com> wrote:
>
> If there is a mismatch between the cpreg indexes found on both ends,
> check whether a tolerance was registered for the given kvmidx. If any,
> silence warning/errors.
>
> Create dedicated helper functions that print the name of the culprit reg
> and analyze whether a tolerance is set. According set the level of traces
> and analyze whether the migration must eventually fail.

This patch isn't creating any new functions -- is this a bit of
commit message that is left over from a previous revision and
needs rewording?

>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/machine.c    | 21 +++++++++++++++------
>  target/arm/trace-events |  2 ++
>  2 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 476dad00ee7..fa236431a8b 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -1065,25 +1065,34 @@ static void handle_cpreg_missing_in_incoming_stream(ARMCPU *cpu, uint64_t kvmidx
>  {
>      g_autofree gchar *name = print_register_name(kvmidx);
>
> +    if (arm_cpu_match_cpreg_mig_tolerance(cpu, kvmidx,
> +                                          0, 0, ToleranceNotOnBothEnds)) {
> +        trace_tolerate_cpreg_missing_in_incoming_stream(name);
> +        return;
> +    }
>      warn_report("%s: %s "
>                  "expected by the destination but not in the incoming stream: "
>                   "skip it", __func__, name);
>  }
>
>  /*
> - * Handle the situation where @kvmidx is in the incoming stream
> - * but not on destination. This currently fails the migration but
> - * we plan to accomodate some exceptions, hence the boolean returned value.
> + * Handle the situation where @kvmidx is in the incoming
> + * stream but not on destination. This fails the migration if
> + * no cpreg mig tolerance is matched for this @kvmidx
> + * Return true if the migration shall eventually fail

"should"

>   */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

