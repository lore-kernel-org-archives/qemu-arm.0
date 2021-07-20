Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp4657573lfc;
        Tue, 20 Jul 2021 03:15:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh1Slt5lNcPvJThACJBtf1xD7hHbyotBTPuA06/bAjxsMS49BPVhTfdXZIrHmXitEjXQEl
X-Received: by 2002:a25:c0d4:: with SMTP id c203mr39490729ybf.55.1626776100973;
        Tue, 20 Jul 2021 03:15:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626776100; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/OHijFH4gjWBe0GL0FhionA23jdqAVYfLUdwDYIjyDGLwTAHhgEaVP8U0BOYj2Kdy
         w/oS+3oRN+CEjEKkB6eoyhvQExU2WphdbDzLll+cYLy/xko/R95abDbIwlFn1GS1Wcvo
         /7oe8/nHpQ0V2Ebh6ACqEN2kNCB8b64HyiQr5h/lOtXb4bs6IffPDkanpW2WgtTb5iD0
         chlZlqcrYBqEQTy+T7pxyfdrfPouYnyX2gRkvb61+Go+H6jwliDcajo3DFEGGRp5SSau
         lx44r5Qo+SM8nz3UaLuMyKSxnLo+Ro2rpKvWi1dcsvr0wFEO6UKhXYCUG6p2QfLGLj/A
         EwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mW686d8CzXXo6vR09hsa2ZRksOH50HGdZbESPDq1rzc=;
        b=mYh4wi9utky64nSblhAekGW37cliNulRxLGycVJ3gAyMmGApIHokQjkiVpSd0bGzCt
         ikFr7p9QefZg/e7DkxvLUZDSWtxnkRc+Np7eAFE7VqZf+a1Z6k6MuJZL7FGCtXRtUkM7
         JfWGezBg1RrPyF1TUlQnp1RWzS/wf8L6UBzAJwbMh470Uxy7vsjmz5pmymGSbSMwuVks
         F64iZkhxNqC8MarnV3552EHorC/CGvT2mABcP6NpyTy639wRf/aGns5+hwar8+xCdzLX
         GgW59hVrZMmTj1vyzLRcgzJDzaet/j7o7+DRbFgTxUZs7lzx4Jto0glI5SWWN/8CCXBp
         tZUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMrlUyPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e136si20671274ybb.496.2021.07.20.03.15.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jul 2021 03:15:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMrlUyPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5mmC-0003Tc-9R
	for alex.bennee@linaro.org; Tue, 20 Jul 2021 06:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5mlv-0003TL-He
 for qemu-arm@nongnu.org; Tue, 20 Jul 2021 06:14:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5mlr-0003wn-Np
 for qemu-arm@nongnu.org; Tue, 20 Jul 2021 06:14:42 -0400
Received: by mail-ej1-x629.google.com with SMTP id ga14so33532250ejc.6
 for <qemu-arm@nongnu.org>; Tue, 20 Jul 2021 03:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mW686d8CzXXo6vR09hsa2ZRksOH50HGdZbESPDq1rzc=;
 b=NMrlUyPQq8UyBom/mvDJylsNMPgF9LqA5UaKnumhN4ZfdQyZU5LmfjbU1v6DdG1l5B
 G4HBc3DbkucVdh+nZhNecwYX8j1ZYEtwPVrq5ZjSPkHoiBpp1dTPwzecUQaQcRCjlEwX
 gcW3m4bIEpXE9lI9qLFFZBFeSwna2lPR6/E+xORUQI7Gr1qBSGRRrNHJn8oHi4OKS55i
 O/q5wLIgv0Fly0x2ZGPrP+/KiIEwNOAqS088vFh0esRux7pWKTsExo+KHAY2ZrqSIjAe
 tFcZA03afv16TrCb6LZaAhHe5c5qvlXJzvMubK+rOrZQ52AKm1ilmFOY/nSucpr5DBsB
 EsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mW686d8CzXXo6vR09hsa2ZRksOH50HGdZbESPDq1rzc=;
 b=LBcDWSbupQni8JWjwWTWWEs+Qt9Xf9zHIC89QBEG67ibniIIvI8DIIH8L7lx5OKO49
 PEGI9s8n4D7ci/jdO6cnoxLeRXbL6yc5Tdr8yjwTJ0cgTK0oK9oeCBInfcbI2i76nCG+
 1ne3SILh1iNTEDzjTiewlGl6yQP+RNPb9NJT3SMx0JM21mS90sFmT7aygSBpalgOVMUw
 ARpet8Jeya86ElAqKaii9AsYLWyClCaWpOh563ozwHeuk8ZQIyQjMUC2eB6sCgyWuitS
 YDvIpFaOcI1tvNvgkRX7NWTB7XC5L54x9i4SKc71NSfCIJ7dpa0fpknQW7bTJHFGuo9m
 LHRQ==
X-Gm-Message-State: AOAM533FfxkwKq4QXkygEmTGlVw9T/iBIQ54Ed1qqCizDKEBIkkg3Pb+
 FFF1ugOWveoR1lkTHU/xtI2ZToIhF48QSH9SHoV+aw==
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr31325754ejb.382.1626776076769; 
 Tue, 20 Jul 2021 03:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-18-peter.maydell@linaro.org>
 <e3f557f7-c65d-428e-a0b5-68d1ffc01df4@linaro.org>
 <CAFEAcA-o=rC1Zm6JyFECZ_uXndbRurrZdYVWTn9aq=dHXsWJSw@mail.gmail.com>
 <6e31e5da-b4c8-4555-7a70-7d9b4a6e55b1@linaro.org>
In-Reply-To: <6e31e5da-b4c8-4555-7a70-7d9b4a6e55b1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 11:13:55 +0100
Message-ID: <CAFEAcA_o3dkXrMTMOsuxcC5RYTTi+8yOQcqTWrBQqPZU=WN7kg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 17/34] target/arm: Implement MVE VMLAS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Pd4kN71J0Ys

On Sat, 17 Jul 2021 at 21:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/17/21 3:06 AM, Peter Maydell wrote:
> > On Fri, 16 Jul 2021 at 23:12, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 7/13/21 6:37 AM, Peter Maydell wrote:
> >>> Implement the MVE VMLAS insn, which multiplies a vector by a vector
> >>> and adds a scalar.
> >>>
> >>> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> >>> ---
> >>>    target/arm/helper-mve.h    |  8 ++++++++
> >>>    target/arm/mve.decode      |  3 +++
> >>>    target/arm/mve_helper.c    | 31 +++++++++++++++++++++++++++++++
> >>>    target/arm/translate-mve.c |  2 ++
> >>>    4 files changed, 44 insertions(+)
> >> ...
> >>
> >>> +/* Vector by vector plus scalar */
> >>> +#define DO_VMLAS(D, N, M) ((N) * (D) + (M))
> >>> +
> >>> +DO_2OP_ACC_SCALAR_S(vmlass, DO_VMLAS)
> >>> +DO_2OP_ACC_SCALAR_U(vmlasu, DO_VMLAS)
> >>
> >> This is confusing.  The ARM says
> >>
> >> # Operations that do not perform
> >> # widening are always unsigned (encoded with U=1),
> >
> > I have noticed that that text often appears for insns where it doesn't
> > really apply. I mostly ignore the text in favour of looking at
> > the pseudocode for working out what is supposed to be done.

NB that in the latest version of the v8M Arm ARM (B.p) the
"operations that do not perform widening..." text has been removed.

> Yes, but in this case there's nothing about the pseudocode that suggests that sign matters
> at all.  Neither the multiply nor the addition are widening.  So is there really a signed
> VMLAS instruction?

There really is a U bit, but it doesn't affect the result :-)
I will remove the unnecessary extra set of helpers (similarly
for VMLA vector-by-scalar-plus-vector)...

thanks
-- PMM
