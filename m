Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8954ECAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 14:11:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1mgM-0002Ds-V6; Thu, 25 Sep 2025 10:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1mgI-0002Bk-2l
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 10:10:47 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1mg9-00063n-DR
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 10:10:45 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-6353ff1a78dso511289d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758809432; x=1759414232; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GNCCOulXFWBeqJ1DFKP0YVB2uQ25Uimld+yTpJ41gA4=;
 b=igEPel/29dwEVTWqvEXrCxAgP4pUbVQzJ+cCt5DrbQenP0idORJMVy71JDCxV01KHI
 tQ/2c6gMsW6nRxlD24PkrHlnqs16X6ibLilJHR8jymXWEo5REqFsye9re17OoHFgaYLp
 kQVe0hlyZd0coItkaD+G2sROah6FltdXJim6GaWtV1qxSaBJ1+VQrB+GpC7jX0VZqCAb
 eDBwyAs2rOlSqtFr6REsLJmwcWyJ9kEsS34eo2TN9MAj5yb5O4qCWyG76ZPydUeKvCDK
 WVjhXkNGkbPjbHR67qZkDhDbzm3saWQ/3xV6FuH4Eheb53zA2XfGtPEvpkvfEWyl0The
 jiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758809432; x=1759414232;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GNCCOulXFWBeqJ1DFKP0YVB2uQ25Uimld+yTpJ41gA4=;
 b=dbs8QSHnNKWZaLcsS+9flWyPWG1JnG95VBx+E0qu9jN07mruf/ilnLpK0CgHQxC7eL
 UVmSWe9q8uAkGi8MPEPBTSjHtD+/4qeMqI/OjI83xfiXJzTX6qaVuLQOJdVgUfrNWCrO
 21+OoMdXgdebaAKUlHwNIq03OtCqo1Y8/y0ApTV2xzNqGgtPTA0DLrjYq8KAwn7dLGM2
 8EUx1k8/D5Flk22AR5Nktkvc1e30Ep0Y4dxJJ4u3dVciBX4WwhQXRRPg1M1X7pQqLnjv
 euZIGCEcz+l7IuoqZxpw4moNmFr7hFbUnhp3G7lthlmlFBdxfOI8+MUmPDcz/VtDXeOp
 WeIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP952Iu+5W60GKCFOXhBlsn5tIywPkDDVhmacHpIlK6JKtF8knMAlRs3dLHjeuYT9veN/hnvTmHw==@nongnu.org
X-Gm-Message-State: AOJu0Yzo8ufpvZAw4nwdZwbda2TZpfTw+lVYD58+qS0CZ/E0VY/aN9od
 ftF0h201Ew+AX/TQMMzimyEaPnRVT5+A+GrBiHfcoYQzlSFhOfjd4QkF8ZEhhGehVsJLFKL4nBb
 DUUR37bMgy7S4QVUNoOMl99Vjt+GQXdgiSN03UXR/hg==
X-Gm-Gg: ASbGnct8/fdq12/ItFKs/wevTtDghWlNRbP9iN0/vjPoRhQx7TsI4c/RPmmSplAVhyY
 qurFz5yaaDcv3F39+WIelJSNjJC69p1PDC988kUuAicacWxY1D7KJa7vIEtPwp7kQTcgFwJQbOQ
 roa8Gb6KV81etKHPyMmr+O8KtRlX/+blBr5HDFJP3nj4ktKbzMw+VlkVi+frU47lgql3NEWiWRY
 +NRT7EE
X-Google-Smtp-Source: AGHT+IEdzWCZzw7y6R5WWPbBJoqJb947idyItJq30+1hQKKLYf+y6MhNht8W7lQFoSrBjHnS6JY7jTxfNkZuawFpOqU=
X-Received: by 2002:a05:6902:4202:b0:ea5:b99f:e910 with SMTP id
 3f1490d57ef6-eb37fc0deeemr3226147276.23.1758809431892; Thu, 25 Sep 2025
 07:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-34-richard.henderson@linaro.org>
 <CAFEAcA8iTS6gpHwchagCFTOwjU=KKOJrmp+d7m4oMR2_xRfvkQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8iTS6gpHwchagCFTOwjU=KKOJrmp+d7m4oMR2_xRfvkQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 15:10:20 +0100
X-Gm-Features: AS18NWAfOEUUmmVdW5aJzZ4Gl5zreQeWjYicctzs9nzhKHdYLzp0QG-OadjYtkw
Message-ID: <CAFEAcA-RToeeQr9x1yhJJhf1UuxYX1hVopatoUkimeQ11iAMGQ@mail.gmail.com>
Subject: Re: [PATCH v2 33/36] target/arm: Redirect VHE FOO_EL1 -> FOO_EL2
 during translation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 25 Sept 2025 at 14:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 16 Sept 2025 at 15:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/cpregs.h            |  6 ++++
> >  target/arm/gdbstub.c           |  5 ++++
> >  target/arm/helper.c            | 53 +---------------------------------
> >  target/arm/tcg/translate-a64.c |  9 ++++++
> >  4 files changed, 21 insertions(+), 52 deletions(-)
>
> > -/* Test if system register redirection is to occur in the current state.  */
> > -static bool redirect_for_e2h(CPUARMState *env)
> > -{
> > -    return arm_current_el(env) == 2 && (arm_hcr_el2_eff(env) & HCR_E2H);
> > -}
>
> > diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> > index c0fa2137b6..3ef24fb0c3 100644
> > --- a/target/arm/tcg/translate-a64.c
> > +++ b/target/arm/tcg/translate-a64.c
> > @@ -2573,6 +2573,15 @@ static void handle_sys(DisasContext *s, bool isread,
> >          }
> >      }
> >
> > +    if (ri->vhe_redir_to_el2 && s->current_el == 2 && s->e2h) {
> > +        /*
> > +         * This one of the FOO_EL1 registers which redirect to FOO_EL2
> > +         * from EL2 when HCR_EL2.E2H is set.
> > +         */
> > +        key = ri->vhe_redir_to_el2;
> > +        ri = redirect_cpreg(s, key, isread);
> > +    }
>
> I was looking through the details for this one, and noticed that
> R_PHHPL says the redirects from FOO_EL12 to FOO_EL1 apply
> when "the PE is executing at EL2 or EL3", so I think our
> check on "EL == 2" isn't actually correct.

No, I'm wrong here -- R_PHHPL is for the registers handled in
patch 34. This codepath is for E2H redirects as listed in
R_JGGMV, and those do only happen at EL2, not at EL3.

-- PMM

