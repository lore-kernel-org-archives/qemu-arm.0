Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3953EC531F9
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 10:40:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wofDl-0007De-Ef; Tue, 28 Jul 2026 06:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofDk-0007BF-Ez
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 06:39:36 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofDi-0007sJ-6w
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 06:39:36 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-66771ded50aso4808715d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 03:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785235173; cv=none;
 d=google.com; s=arc-20260327;
 b=cU8r7YLO7NRSf70SEj/Ixt+W5csUs4ANDEXhGscxJmBADHVERZzOCn8kmzZ41Mt3x/
 qypVrHrn1QXci/NfuqE7wuPNgcCXy9IfbSzJ+Cjw7RK1+FkjL+L7O2doBOe20vJtxbjn
 hpuv5zG5eVOVg7dYK/H7kpmoXJRep28+8zqadBPPBDlQUEjFAHUQOiYrqX7pFvMpm0ex
 8luWmrBqzCyr2BpL5nBBRWVo8E+wB24knD60sGEHkxIgFY+RHP2ehjFO+D/C9VVnGpSH
 /BswB0frIAqONQatFEKO/lpddavisPpulJoCRELGIUb1h3D+ThsCVorFqrbvpOUJ1oQC
 R8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cHjcYC/KMaXgYVOEQmUvus/3EYXd8abzz0f+0gpH9Kk=;
 fh=+y0aDIhlPNOPiXj7kGmrajbaE263LvhVn+a9aMATYpY=;
 b=pPxig4jWLywrosi9Cp8YQlgFUtBi/m+RGi89l1SXCbtMg0sEkbr7cPj1FzHQN7Id8s
 +kO0z6zZQDsXOKWbmDLvTs2GH7tyygAg4oldreqC1XvKM0ccQE0cIK3ybczQVkQjsDlV
 KsyZqDL2rglYB4OdDdn/ua2uyzmXrTEg5KapT2K4ZhJWOBY+K1BezQ61+E41mD66pdgD
 9YOplCXVM23AERVGGnEDWiNd4WTTagv3HEhOb9yBrqot/KzfQ2KgINW5m3G/p3bFJku6
 Hl+j4wewPs/B3mlYZ8bGyDWgfgQJ6tQ0vd5ZU2uPfBIsUhRaHK3h8JG5PZPKNUizzX1i
 F4wg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785235173; x=1785839973; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cHjcYC/KMaXgYVOEQmUvus/3EYXd8abzz0f+0gpH9Kk=;
 b=lypNCsIWmrOKhLJxI+uTv9SwB34SLmMIhQCqnKYMDiE6zNHz/LtgmJKuIbYNOog98I
 JK1KVcBZ6FTjFRVITjG1xaoCSB6fIB0rFijg+i6dyeMWwBTwoK6N7sJWPEVhRZFZ/C8G
 DCVt5Snb5r4cJIUgpbpfyyw0Qt98Kpar4yXdov0nJHcJ5uPMvQOcm7+oRM53A8Ws7Usp
 KuXIzeTGH0YvUQDkPYgKO9RoXG4v4lGmG9AuOxCYgG+0RqSKoTftehnhuPlqeIKkY0PK
 HfBhc1eu/i1u1miLgq3aS4zHtLSBI1MeXRGGfWtsv4nF9669nsyNF9r70uDPAUpc4HwV
 3JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785235173; x=1785839973;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cHjcYC/KMaXgYVOEQmUvus/3EYXd8abzz0f+0gpH9Kk=;
 b=gcHRtyoo/5vlUqC46w0DUmwvu3vZ0G3nEhtufT5PMAPmxOWt6/yfelUvq+sg+mQuXB
 N2izKn1o7ElOrSfYzSVsvnCrJatSL0jCtwJA59g/j35FNCy5DQ5JvXyVTN+9YrwcMloD
 utSXm/OW+2qiINm5PKVQcAZkC4IUeUs4ISfPeFsx838ZhZigB4jbhnkKgC4peRVk6PYK
 wBZ816MkaC8YTFzidCBfnMKLTRNG7EnpMTnXmuUCboCLp1TyhZfsaCXNn9W2YUP1/kBa
 g/9fGXAtRV0L+RtupJNUM42E6R/bCdhJy6qImFplYxgP64pbs9HH/ZCkmzO1qW80Kpgs
 PsdA==
X-Gm-Message-State: AOJu0YwNdOglETUZjNv9GO94euNd7Is6NumHKv/ZTcAlmZMuzx5+l+Xk
 dTeTRG6ooke3lC8D5BmSuZbsuJQlH+dB15/hLRWmahJGzeBBpWTltDyRMWHvghaQVJBcZQPmKqi
 Cw5i7QWrVyTkwPKSKMJ4pNT+75ep7tBpPaofzPlH1+w==
X-Gm-Gg: AR+sD111p2jYNhue3WOqWIuMCUJcxzMyci71x7JaVUwWQGMMksTrhq9WCyzuyJ9i380
 kkWCB6/aAx7ljgS2iQV3ptDIpR/J2G8eiG0nnup/as8jUXLBAvxSs+hLnRvpu+JFN806WEqEceG
 65RpQnDz3Zv8Kd5glbT4ZioQHfkZIOj36HHHcSTuL5CubB92GUBjCXSF4oNrAcS1AEpj4OGY8Vh
 sWhhv06sDbM7Hl2BT3dCLGpwFcbebIVFD4zWNroEqsM8PraO6xObjLL8ta9cXyMsIhjCgYF3fwF
 hoB70dn2nVsjMwRShOSoBiKRWzBPwyXa+0msCXzYrzwVnQ==
X-Received: by 2002:a53:c742:0:b0:667:bd13:2f63 with SMTP id
 956f58d0204a3-669057fe562mr495189d50.59.1785235172649; Tue, 28 Jul 2026
 03:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260706173324.804340-1-peter.maydell@linaro.org>
 <CAJ+F1C+TO_-ktDqJnbeXuaCdAsomQMTvWZ8aAFndn=JPF1+2sw@mail.gmail.com>
In-Reply-To: <CAJ+F1C+TO_-ktDqJnbeXuaCdAsomQMTvWZ8aAFndn=JPF1+2sw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 11:39:21 +0100
X-Gm-Features: AUfX_myDmz51gbMcofEJm5InBMjAOqEF5SuOnjW3GQVWoLXjHuRazBs2K-6MfwQ
Message-ID: <CAFEAcA8krc1OoZOxfhjcBVW-pY8MVX1e0gQGa=YGRVAtOLU_GA@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/display/exynos4210_find: Clamp windows to screen
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Tue, 28 Jul 2026 at 11:08, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> On Mon, Jul 6, 2026 at 9:33=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org> wrote:
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
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Thanks for the review; I've applied this series to target-arm.next.

-- PMM

