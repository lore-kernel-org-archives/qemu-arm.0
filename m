Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DEBCA1005
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 10:59:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utOiy-0006sP-C8; Tue, 02 Sep 2025 06:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1utOiv-0006rZ-W1
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:58:50 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1utOis-0004Co-TV
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 06:58:49 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-71d603a269cso42764647b3.1
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 03:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756810725; x=1757415525; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yV+CNQks4sz0u20+BiRRmlFqbbFxD0ap07clOuus2Ko=;
 b=ph+OmknRK+frgXf73vmer7WNofAkn8vXCO9y5Mre8lF+/QuQmcBgAPaUgjiBeyAx+v
 J4ZCgM1O0+RCfQOnRlvAoKnRuv4H/FSrZM2ZJqLe8QM+QAL+UWo8Q+zX6YnLveJCwud9
 C/v4kdwEyrB4PwW/Q477tE/ne3b9VOXMd6/FTSFmUOd8ScALtM+Jil+oF3tt1khJSSPy
 BaHJ1zXnh3nJ3lpyWIwvYKlFfcbBdE6bw38UczLS6yOqg38bx3pDRNpgH+QfYFEZwGHL
 TNza3fUNihweQ/sf1L5420fNAIFakbxtZeeJ+EVaQtqBSWGgsj8jDV56aQQO0NncW2O3
 JMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756810725; x=1757415525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yV+CNQks4sz0u20+BiRRmlFqbbFxD0ap07clOuus2Ko=;
 b=CD6qJqOqSqa1ylgmdLj8YCUmgFOfD5mmrl2wSSMtWJdaZHNnlZa0mp2ZX8nmzOYPbN
 bEzbza54A6idn7EuG5LYkvSsXlKGX7M8Uhu3FQdq74OPpJSaMH4pIPBsakfrRdteo21U
 XjSiOz7A7LaUYbltedscRj09Op7Kp+xgDdGZPRi/kqzebJNLaK9axH2umLJLelW52wWX
 cdfFPm5oAJ5e7OrR/Q5BlvgKTQag8Kw5Ltw3H5I1NthjDhE20m5dugKP0bwwk5nw90OB
 vWWvBxCiMsIHNN3hUdGcv+Ux1SFrRFDafv1LT3Q+5N8bDwJhuKx/VfjUWjWOoG0BsGHO
 EPfQ==
X-Gm-Message-State: AOJu0YwZESxvVmAxG8WM71dx0dyj48Uqv9j06GfsLgY3QlZjqbexTHqs
 HsRZTZbkdjdfasblVGsV5Kv2lSSQeX1sR933ITO+xC6XEz6fOzrqd4r90FgEDOddDOw5PttY6G9
 EO78or0cdHb8zltNVtx6aZ7LAFd+EHwteTr5IajL1YQMvtbhmOjWk
X-Gm-Gg: ASbGncsxSPZG3hV34KP3qHpBLb4n0DRZRjHqlLU3e3NABz1Ded4DktmgOM+xfoDgUlw
 NrZJ7YVTNT4uA928UQJd+qB5ZFPU/R1IueQGhBehDuV4pANP1IXIjq9zwMr8v8AoOTCQ2pq6Xf2
 /+GYjvB3feJzgmnOOOncrzWtX+dxjEMV1bmaDGlTpaxD9rlxRgL5E6NL5LCfi+jNT+Z71BCtZk7
 sTkXrpYFZ6Y+0GmljE=
X-Google-Smtp-Source: AGHT+IHA+Dfb4t8Rrkvv/8mnq+BNdIBrMbbHs2KvpQtXQLdr87wRwhzji9132Me30mr76kT22cF3DL96g105zS42HxQ=
X-Received: by 2002:a05:690c:7105:b0:721:318f:85ba with SMTP id
 00721157ae682-72276361f59mr105065627b3.17.1756810725149; Tue, 02 Sep 2025
 03:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250828162700.3308812-1-peter.maydell@linaro.org>
 <8e759fdd-5ed4-4e2b-9769-c6b072f52ed1@linaro.org>
In-Reply-To: <8e759fdd-5ed4-4e2b-9769-c6b072f52ed1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Sep 2025 11:58:32 +0100
X-Gm-Features: Ac12FXzZ-3GgUycMvzRU8W_0jA9YjPaSqAoNS8lErMqUCxueZ8vrFPVSz4mwUH0
Message-ID: <CAFEAcA-Z9=gV-Ayu_9gD29H9+F3HZvLrtPxUxMv_c=0Y69yLTg@mail.gmail.com>
Subject: Re: [PATCH] system: drop the -old-param option
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Tue, 2 Sept 2025 at 11:54, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 28/8/25 18:27, Peter Maydell wrote:
> > We deprecated the command line option -old-param for the 10.0
> > release, which allows us to drop it in 10.2.  This option was used to
> > boot Arm targets with a very old boot protocol using the
> > 'param_struct' ABI.  We only ever needed this on a handful of board
> > types which have all now been removed from QEMU.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   docs/about/deprecated.rst       | 13 ------
> >   docs/about/removed-features.rst | 12 +++++
> >   include/system/system.h         |  1 -
> >   hw/arm/boot.c                   | 81 +-------------------------------=
-
> >   system/globals.c                |  1 -
> >   system/vl.c                     |  4 --
> >   qemu-options.hx                 |  7 ---
> >   7 files changed, 13 insertions(+), 106 deletions(-)
>
> FYI this patch doesn't apply anymore.

I think I wrote it on top of
https://patchwork.ozlabs.org/project/qemu-devel/patch/20250828162012.330764=
7-1-peter.maydell@linaro.org/
("linux-user: Drop deprecated -p option") -- the conflict
is only in the deprecated-features.rst docs. I'll fix this
up when I apply it to target-arm.next if the linux-user
patch hasn't hit upstream first.

-- PMM

