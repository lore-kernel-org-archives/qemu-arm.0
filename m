Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp605008lfg;
        Fri, 14 May 2021 09:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7wAYwUh1/OA5sjrv0LeNkXXSjQBoyOnOvba59SFW2Q3XyvmyAcw7CL1VwgQDzixfTiz5v
X-Received: by 2002:a6b:b28f:: with SMTP id b137mr34690800iof.194.1621011197578;
        Fri, 14 May 2021 09:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621011197; cv=none;
        d=google.com; s=arc-20160816;
        b=ynoDk1W/XWkHKtLpUwyxC5g/tx+x2dZ1JRdEQl9wHnhEZjOF/NYe7+drngJyowmFZi
         GheX8ds8o/rXyvWHTueGDUej7uOXj3SvglGf3xgRz78zElupadRoOCNfiGTAmIlRks8N
         Y1mhbddRyEOwH3jXQnv1ZlVFYiTNFc6brWxxSN73YQC5uUyBj6cF1YXBcLYgIui66d8F
         C3MQ/92WEytdeljMY0+Tv0mELAYwcovcXEmCps+4TLnUCxT+tzhlLzs7ChDksDsdah9U
         dapj5tEjejcfos8MDdONTIr4TwNJEgtBfimgwNaw2q1TH5lLpFeRRSIWg7XUd+eoLGli
         Da6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gXR9v9YzHwcopV9q9OZmec3AydXQAi8HgzmK/QJbosQ=;
        b=CgEhpYKQjkfAg9RcqqIjfI1U2dPFiedKoQ/LAu96Sw2+muQut+lgVuweJhlZpWJ6fw
         VqcWGtpX1zou3PEW49jWez417pkFCkb1iKT4HW3d4s8Vlic08WQmTC4/ty0UFhJ8b45x
         4zFAf+0GL7VQk14fp7Z0MpCc1Rp1R2ZEO2wgjPjF0xukYffaSFPkeVzH8+ZaRjs2Wgko
         P/xKrSXZF4a9Y7R0JHowTymF/b0FFHRVmjrDnGw2Yxm34ZL6nsgBZFrhNHYywSYYcQMy
         h/We3QHEbhEIktOBGKVZEsn4uDv7MNYIGu4LYZLIHwILfL/US793EPAoAS8XUkrp408h
         Te1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EfF6R44A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23si7280731ioj.71.2021.05.14.09.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 May 2021 09:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EfF6R44A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhb3s-0001tP-Sy
	for alex.bennee@linaro.org; Fri, 14 May 2021 12:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhanC-000572-A3
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:36:02 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhanA-0002Pa-LQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:36:01 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t3so2896008edc.7
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gXR9v9YzHwcopV9q9OZmec3AydXQAi8HgzmK/QJbosQ=;
 b=EfF6R44AVT7Wa6CwF2Icpd2Cr0N/heuCjTOnUYfhvEr3Zn4pHZAtkJlCxHP85zZJte
 tCrACkMdOS+C2gdPw1TunXEuNXrhMeIvHPsz+Xyje2MvUHNZB7HqdT0H0/Yzc+cVgdgy
 NS3auTeFNtG/ilgdbGpuuyt0VhLdksayFzxq4v+7vp1pKo00lxZlonNtXaC/G5E/5qzV
 iS71l8eM6hghxUoteZPSA2oR3JKPep6mat7kmVRsPcece8QnJmup6zZqpSwBdfIkBdIs
 C3YzZIIe9DwhQtoIkZ/A/rR3+KXJJqNTWtiCK9aq2QF0tBWqL+dWx1Tj/Mqjz7e7M4FR
 pjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gXR9v9YzHwcopV9q9OZmec3AydXQAi8HgzmK/QJbosQ=;
 b=jtBAnOGdXeXgEQaeZRdUYy4p8h5tYZkkH6VupV28NqwJSFdo+5009uD23iGtBTbolF
 u46FQHH0jwa3HX5rl1Jl7DOH9a/YTE1O7D0xv+ba4iOomSABNn0EQiEqICRk6bDK/ND6
 3tGVihf4R5MGz+QEMK5wF6TzEGAyw5SOSVeFdBThVFwQ3W1lNGVNPPWhwxxp1vWgcnP3
 ONINNdX6LFSOfQshvMfvzgalvXu8WJdwkmuMFWiwpcsuh/3dwoaqrbC2lnMS7O+br0Fo
 82vE4RYvLmHSRHx4FUhWsWEvToja/zI8H2MUJaE1zKwkchJnii36iBH+ufJY7h8PXSYM
 aJAQ==
X-Gm-Message-State: AOAM533cEVYHhvn0KpG0X78/WmWD99nGnhab/zJBVc9mBMU336bNBA6b
 +mja6CYuLr8beOibYXh3UNDZSSd3DDNPWRKDMTMDFg==
X-Received: by 2002:a50:ab06:: with SMTP id s6mr48322939edc.100.1621010159186; 
 Fri, 14 May 2021 09:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-49-richard.henderson@linaro.org>
 <CAFEAcA_KVJSmphodL=szHvguTpDnCU3BET1+Kn873uoX82zE_A@mail.gmail.com>
 <6df073b6-f65a-d9f7-1942-178875c2699f@linaro.org>
In-Reply-To: <6df073b6-f65a-d9f7-1942-178875c2699f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 May 2021 17:35:46 +0100
Message-ID: <CAFEAcA_2tLutA0uQjsc_Z+fWfFaAuZE9GdFc1-8L+dAkVdPXkA@mail.gmail.com>
Subject: Re: [PATCH v6 48/82] target/arm: Pass separate addend to {U,
 S}DOT helpers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5x9Rl/IXjuK3

On Fri, 14 May 2021 at 17:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/13/21 5:47 AM, Peter Maydell wrote:
> > On Fri, 30 Apr 2021 at 21:57, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> For SVE, we potentially have a 4th argument coming from the
> >> movprfx instruction.  Currently we do not optimize movprfx,
> >> so the problem is not visible.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >> v4: Fix double addition (zhiwei).
> >> ---
> >>   target/arm/helper.h         |  20 +++---
> >>   target/arm/sve.decode       |   7 ++-
> >>   target/arm/translate-a64.c  |  15 ++++-
> >>   target/arm/translate-neon.c |  10 +--
> >>   target/arm/translate-sve.c  |  13 ++--
> >>   target/arm/vec_helper.c     | 120 ++++++++++++++++++++----------------
> >>   6 files changed, 109 insertions(+), 76 deletions(-)
> >
> >> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> >> index a3d80ecad0..f88e572132 100644
> >> --- a/target/arm/vec_helper.c
> >> +++ b/target/arm/vec_helper.c
> >> @@ -375,71 +375,76 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
> >>    * All elements are treated equally, no matter where they are.
> >>    */
> >>
> >> -void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
> >> +void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
> >>   {
> >>       intptr_t i, opr_sz = simd_oprsz(desc);
> >> -    uint32_t *d = vd;
> >> +    int32_t *d = vd, *a = va;
> >
> > Why the type change ?
>
> Oh, just because this is logically producing a signed result.  Given that we
> use -fwrapv, there is no functional change.

Seems reasonable, but can you put that in a separate patch if you want
to do it, please?

thanks
-- PMM
