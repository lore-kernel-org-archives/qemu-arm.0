Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C26CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:32:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtaj-0000Ut-3u; Fri, 15 May 2026 10:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtaV-0000Kd-Jp
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:32:30 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtaT-0003OY-Di
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:32:26 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-65c0bda7f15so12025521d50.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855544; cv=none;
 d=google.com; s=arc-20240605;
 b=cVSANWZMBd2EF12pOot5E2/5jUpCxnURdyz2CYNZ6dgaU7JxuqF5GykjvZe0yc5hsC
 QsfFq0aSCJJFgwyss+zkIda0G/ADYHtbsVp7GGUlATpc1TX1vbp4AW7K+MrZWTJ+Ouiv
 pn0Ofiy5vQabxYXKpcLko/DQpnKk9DOCzZbcc6wxnbJxEOaeyOY6bHLd8yb/EWvBbwc1
 Lm6a+9Hag3em1lQK7+xXu/SZSW8/XVzAYvQwXzbta0boLaQrQEzVoZbymsQPGHXlGO8p
 qT8zCAfIiNYZxjinHzUNrLoomuqJZvF5MytfPydRxyBtqyEFnqLstwALvm2ERyhSRo8h
 FjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RXyTgHqhRoa+CNH+pq00BtG27itTU8GXgWjNABR3CHQ=;
 fh=TfkJASJQZEi1u82yrjG4XvOEeKalzEvweFsBg5QB0FQ=;
 b=XLONCKu/aD6tBNp2ViVfheFQfXf87yocM33QT7iWKVNKS0J+nI85z5TjDvxEbNazLp
 Mxo5hTgVwwuOege1Nk/Vmr+5zk9Bpd1iAkHkUylzQeoxmevsJUEpfjR+uOTcR0Aa0Wx1
 HFCCnz4ZdpzPyvMoGzfzw9nE1oVaHv8+j7dJEa+W6Z6cLLbTSGay6bfeuPJz6lBD2e2h
 LIjYnTZg+63oC+Kix04UKFb1A4LYV5FoXmeBnPf+tRl0STul0bqFAjlReo9CBfmXoRas
 q+tVzWMKsBSXX0w6fV3CtEOBl4kRloriG4F7rAGfKWoC7OdAEBUvY1JUkYc8JOP1DWlJ
 nMQw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855544; x=1779460344; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXyTgHqhRoa+CNH+pq00BtG27itTU8GXgWjNABR3CHQ=;
 b=EKbsRQLS4C9CjXQ05KvzN8On+Fl/OhDGOivUmzWnRiFyarvzZCpauzXKoj03ZnvYwT
 9OyLROgp1/YVKg68rN+KLJH6TdkM6K7nTan/q14aCxDslkMhT0Nhy1rmnJG68Qtesy7J
 6u6SyUl+7gJ+GNSyz0IxUctGpyAiai2KkDdTaWqaAOPbj2FDua8a/UacpdHRY7CQJrCj
 M8TJrr8SztL/pV1d44yUiWfpjbo6/sIENPck11Bxh+MFxFQHKKPr0vaCE4CKdeDFzgva
 m9sCQ3SJvueSsrrZ/FfCIurOLOImcNcg2M4D9kmRcz8gQwV/jtebdNOceO52+QhEDr6U
 gL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855544; x=1779460344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RXyTgHqhRoa+CNH+pq00BtG27itTU8GXgWjNABR3CHQ=;
 b=DQ+xwoOx+GRcoMs5UTusr5aAqPVCMrOMXKFJa5lXxyqR8M2tO581Jl3cISpKWvjMy5
 v2hMMYb6+gx5hIOmVleb9pmIgpTybdM6BkXJ7rxMBR2tehpmRUj/y2dzLSsT5ehL/3pQ
 jCispD3QbV0BkMA6aO9gxONO/xdgG9AJEOzCM6pmf9J/2fvZjKx/3QeeHCSnACvBT3Ji
 s9n9sr/TVbm4VroVQNIU6XZ6gdoiP+5uA8uS7Jkmsm/nlc3Gd0uM+Kl5E9E7isQAq6UC
 f9mO5BZKSR87TVVU6Vj4ywTWLXW7wTk5zdHebcqfZpvBSCQWHjKTEvFUGMF3Kcarw9Df
 uTOg==
X-Gm-Message-State: AOJu0YwH+n2A9Jm8h0bC2SSYczGLx0xIVroZ6HYwm99MxWHTrnAbHL8w
 jso3AnW/8MErIwirJM+WifOe/qvMpwiopVX8Zxt/Jpm+HP4BTU2Wtg0hgr3/q8aa1AcmFBi/eJS
 JEBG4FG89f+1rvo2rNXd30oF0DHUYrVQDHBg9hPSbzmVQqJybp822
X-Gm-Gg: Acq92OFHCj77JADIBMfdt4HqidmdhVO8biaM3VfGkaXJtkhHpRm3Rw867v8bufQDWRD
 NlA5SEWs+sIglfUOXK2Oe90/tRM5UkgsCzDws7mTa8Hm86sqL+svSUY9DnD8ilP2CK/aUWfjOeG
 ecI0NYh2R9PDrnXvXUZ6sQTxnwMeeFGF0vPS7AXPMxGiVo5+aTZzF1Cgha90EtKdbfsM1b6XjYl
 0lrYtI8PeLimNqy5yLnuHWbQXs3S9gQfV5M0GGIQ7CRTTY8GJMtmH1NCE1qHDSmHJcbNFhcRdHc
 MpuNwrtz0gOwxXc90wg+scpRGQZAF/Iw/GqxqMCl63pPZut34tLYCE4revBjDAfvlkKUOsB74bA
 zZQ==
X-Received: by 2002:a05:690e:1556:20b0:64e:f106:60e5 with SMTP id
 956f58d0204a3-65e2289734cmr3569042d50.52.1778855543766; Fri, 15 May 2026
 07:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260515131245.366240-1-peter.maydell@linaro.org>
 <ecc4b7e9-aa28-4951-82e0-5eaa6e98e642@linaro.org>
In-Reply-To: <ecc4b7e9-aa28-4951-82e0-5eaa6e98e642@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 15:32:11 +0100
X-Gm-Features: AVHnY4Ieo5RV698XXK8sus5pmlCc5Zyq2a0eY_FqNHBtFpSRS0enllMpY7ryhmo
Message-ID: <CAFEAcA_y9y+XTtUH9R437Ju1U=QNr4fzHVS1c0f8q3GSvdZDxQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Set debug in attrs in translate_for_debug()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Fri, 15 May 2026 at 15:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 15/5/26 15:12, Peter Maydell wrote:
> > The translate_for_debug method is supposed to return attributes
> > that include the debug flag being set. We forgot this when
> > implementing the method for Arm.
> >
> > Fixes: abefca8e7f957 ("target/arm: Implement translate_for_debug")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/ptw.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> > index 8706dd59dd..0693d2867e 100644
> > --- a/target/arm/ptw.c
> > +++ b/target/arm/ptw.c
> > @@ -3961,6 +3961,7 @@ static bool arm_cpu_get_phys_addr(CPUARMState *en=
v, vaddr addr,
> >           /* translation succeeded */
> >           result->physaddr =3D res.f.phys_addr;
> >           result->attrs =3D res.f.attrs;
> > +        result->attrs.debug =3D 1;
>
> I missed that because thought we'd set it on success in
> cpu_translate_for_debug(), but we only do it for the fallback
> case. Shouldn't it be safer to set it there instead?

Mmm. The idea of the method was "the implementation
should set the attributes entirely, not set them partially
and then have them adjusted by the wrapper function"; also
it's a bit confusing if the semantics of the wrapper function
aren't the same as the semantics of the method proper. On the
other hand, it is a bit of an easy mistake to make, so the
API as it stands is a bit bug-prone.

> Otherwise I'd expect the bit set in arm_cpu_translate_for_debug().
> not in arm_cpu_get_phys_addr(). WDYT?

I went for arm_cpu_get_phys_addr() because it's this
function that sets ".in_debug =3D true" in the S1Translate
struct it uses, so it matches that it also sets the
attributes to match that.

The arm_cpu_get_phys_addr() function is a bit misnamed
by this point -- it would probably be clearer to name it
translate_for_debug_for_mmuidx() or something similar,
since it's just a helper function that has the same API
as translate_for_debug() but takes the mmuidx to use.

-- PMM

