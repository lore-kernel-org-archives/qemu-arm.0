Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp489620njb;
        Fri, 14 Mar 2025 03:19:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/zFCIj60OsmPhAUs2dcfyEizT9mRGRMXvS1Ca85wtdfDbTmhdlhBwGWi41dqOusg2IU2ImjoHm9QFAA==@linaro.org
X-Google-Smtp-Source: AGHT+IGAE+9jRWJl5t7L1/g4sy97WeLOh4TFSZnFy6T5fRa26Kg9vZWzC79OdnMYYcMnO0lSxrGC
X-Received: by 2002:a05:6214:23cd:b0:6e6:6505:ceb2 with SMTP id 6a1803df08f44-6eaeaada292mr29681976d6.36.1741947583986;
        Fri, 14 Mar 2025 03:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741947583; cv=none;
        d=google.com; s=arc-20240605;
        b=ToqHxazyHQfjKDq5XFdO99Q5eX2qpimfDyJGsB0n9JIbs3FZVii2ZxFT+J+f6fe3NB
         75FMGfBPlX6FnHp64xNeDdCHHez7OHjSIkamXk9/4rCMnLsXj96rbDugaL4SodvXGam5
         ntrewnVct9MrHMWSKpFBSyF62Mwcj53fDv0WnkFo/4lXtkViPYLQZZ31B/aOPEuPLDcM
         vKr12w1S7KPpcPfOmXqEUF8ikqIBvuQih4ddTQgobOy85azEWj1kzcVbOpvAtEdd8vab
         Syyv0St+RPl9nCmIydycl/qD0b6dZL/Ug6B+1cHKRkQFcBTTEfj/xw5xiItrUu4QnYFw
         u1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8oeHu4lKIPm5zC2Kyv6pmRs6LHDCYHqEo1QuDik7tj0=;
        fh=A+s60Hg0HSkuscWTCN4VIXgkp3NVobMm+1KLnySGuUc=;
        b=APorjrdEZRzwKsFikIv2spltw+B1RzfcxZRvq4H0lXwaIxgM1giK88XAAQ9o3AAr89
         JaN8hzMEqSuJX+Wg1ypvdr6osgkEBxm7fMfQAfWCQZob+qY2YcPLVKx+RyMsq4zXGINk
         gC1dhMm0SR8hH62aBOWutCXoF4dd9tmjI6w2XboGvOeVzhL85weu5M2tsQroza/ZPWCj
         YXcQja6o5YZtu+cuCh63P+KaAYDDl8f/ZBtpd3CgNzrdSERMWREVCPaoJljosZVVkqHt
         +ZIU4r3WtIlLbj8EIFZBlrqyEZqYEYQz1idtTwo+OYe2VeDW1/dVVMk+BH8/LEn6AQdX
         6bWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyArlN3Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade1db372si38957586d6.11.2025.03.14.03.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Mar 2025 03:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyArlN3Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tt28S-0000lh-77; Fri, 14 Mar 2025 06:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tt28P-0000kN-IC
 for qemu-devel@nongnu.org; Fri, 14 Mar 2025 06:19:21 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tt28N-0003m9-Dv
 for qemu-devel@nongnu.org; Fri, 14 Mar 2025 06:19:21 -0400
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e637edaa652so1584892276.1
 for <qemu-devel@nongnu.org>; Fri, 14 Mar 2025 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741947556; x=1742552356; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8oeHu4lKIPm5zC2Kyv6pmRs6LHDCYHqEo1QuDik7tj0=;
 b=dyArlN3QSqYh7qb0hhdMR7Q6izpJunhseajSzw3r3aZhkJgZCkdOyeSuVP4cemJ/Sp
 G3gFUSI0eLKr4U9hyuy8JhjhT3x/0CKhi4PqLnVIHqVxnfUpaxmOI6LHBi53gQfzIkH4
 gBuPLW430aaun0sFF5tJCppSaDNc/Dg0VtibYhSgChCnQdb26KtmxVxX7NeEeLcKXt5p
 HAiKTzRHkh/M/AvmkL+eW9dXoclSeyPIJb5mhORWXVpZqiVqns3vZ1aDzJCF4zrppoQ2
 WwrVFsLnOrGb/tzMYRVfKL0LdzKrK46t/1FaVlXGP7S6NCKxD7zC+wxVnTsV0dBQFGG7
 JSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741947556; x=1742552356;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8oeHu4lKIPm5zC2Kyv6pmRs6LHDCYHqEo1QuDik7tj0=;
 b=u0L5PqHJdXI+LMKgroecLqM+bm8OPAllayh/0YZem4fftO+dsx8i4XwCLUnZa++RFg
 5jcBYrNSTnu5IfeW+vipWW2iA6t3qWuXbBCIxC5bU2kNuaV4V6n1OwSatyeBFx20Nuw/
 sQ+7MXf2yRFcwQGVXuiAMfNQw7ydeW8nyP15/C5gotHQfS5hC48XCkw8qmsr29PG2glE
 ITZmagf//STSeHUAn7ollhpEhmOBAploypw0tHnzjsoki8qqsD4010Y8oCrYy188DIb+
 ycSakm6kSMczCGmakfJZNBIMXtyVfFHx1Qx3NE7x9x9Ktros3YSEGjGncUMArFBOw6ZH
 anJA==
X-Gm-Message-State: AOJu0YxXIbDYJwUt30MMjUXqvXPhRTP+jw7wU9LELs8donPzOm6hUHsF
 VrfcVRDk5Co1rUGr6LjHmjb+dgAleg27TR4TxZ8Np04iaQbf4YvyhAcv1hjiGb8+D72d694HGNq
 3sai6Ao8LOGvBtt8cGBKeOYc2SuQHfW0Akl/MZg==
X-Gm-Gg: ASbGncvNaHf+gEj1L0CGJKTrA7Gj0lCh8Kp1mpL5Qjv8XRBTSmkwHWp9RqExh6qchC9
 3tDOeAMWNrc019EaqyyN3emFc4c/zLAFTuFiyXpssifWveIRZsrru/Rj5VYPvWgHUPpi1BKzvs1
 orKTS9USNh1dxgKwfI4XG1SJ+Thng=
X-Received: by 2002:a05:6902:118f:b0:e61:10fc:a9be with SMTP id
 3f1490d57ef6-e63f6517e13mr2109576276.23.1741947556590; Fri, 14 Mar 2025
 03:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250313-clr-v1-1-2cc49df40fe9@daynix.com>
 <CAFEAcA9pu_Y8Ki6TFznViO1UCqqSgHgn2ZKQjbcoKVob3qF5dg@mail.gmail.com>
 <6959f6ef-c142-49e0-b742-a99da1a26b61@daynix.com>
In-Reply-To: <6959f6ef-c142-49e0-b742-a99da1a26b61@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Mar 2025 10:19:05 +0000
X-Gm-Features: AQ5f1JqlrIBx6YwXnrGStBCx7C2IZ1_EPJw_7SNYfMH74QpQaM6T8YRUiBQqTKI
Message-ID: <CAFEAcA8E5G-Q-RKXfN20o2bZjyTHiqEzJ3EZnrW90whS1QV4uw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Define raw write for PMU CLR registers
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +gVSDnwIDgHx

On Fri, 14 Mar 2025 at 08:15, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> On 2025/03/14 3:34, Peter Maydell wrote:
> > On Thu, 13 Mar 2025 at 07:16, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >>
> >> PMCNTENCLR_EL0 and PMINTENCLR_EL1 clears written bits so we need an
> >> alternative raw write functions, which will be used to copy KVM kernel
> >> coprocessor state into userspace.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> ---
> >>   target/arm/helper.c | 6 ++++--
> >>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >> index f0ead22937bf..30883cd3a989 100644
> >> --- a/target/arm/helper.c
> >> +++ b/target/arm/helper.c
> >> @@ -1907,7 +1907,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
> >>         .fgt = FGT_PMCNTEN,
> >>         .type = ARM_CP_ALIAS | ARM_CP_IO,
> >>         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
> >> -      .writefn = pmcntenclr_write },
> >> +      .writefn = pmcntenclr_write,
> >> +      .raw_writefn = raw_write },
> >>       { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
> >>         .access = PL0_RW, .type = ARM_CP_IO,
> >>         .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
> >> @@ -2033,7 +2034,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
> >>         .fgt = FGT_PMINTEN,
> >>         .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
> >>         .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
> >> -      .writefn = pmintenclr_write },
> >> +      .writefn = pmintenclr_write,
> >> +      .raw_writefn = raw_write },
> >>       { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
> >>         .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
> >>         .access = PL1_R,
> >
> > Hmm, looking more closely at this, I think this second one should
> > not need a raw_writefn, because it's marked as ARM_CP_NO_RAW
> > (meaning nothing should try to do a raw write to it).
>
> Good catch; I didn't notice ARM_CP_NO_RAW.
>
> >
> > And the first one is marked ARM_CP_ALIAS, so I'm not
> > sure why we would be using it in KVM register sync:
> > add_cpreg_to_list() skips ARM_CP_ALIAS (and ARM_CP_NO_RAW)
> > registers when we construct the cpreg_tuples[] array that
> > defines which sysregs we sync to and from KVM.
>
> The register list is initialized with kvm_arm_init_cpreg_list() for KVM,
> which ignores those flags.
>
> target/arm/cpregs.h explicitly says: "registers marked ARM_CP_ALIAS will
> not be migrated but may have their state set by syncing of register
> state from KVM."
>
> ARM_CP_NO_RAW is still respected for KVM by write_cpustate_to_list() and
> write_list_to_cpustate().
>
> >
> > (We should arguably be consistent about our usage of the
> > NO_RAW flag between the pmintenclr and pmcntenclr registers.)
>
> I sent v2 to drop the flag. target/arm/cpregs.h suggests ARM_CP_NO_RAW
> is not a flag for these registers:
>  > Flag: Register has no underlying state and does not support raw access
>  > for state saving/loading; it will not be used for either migration or
>  > KVM state synchronization. Typically this is for "registers" which are
>  > actually used as instructions for cache maintenance and so on.
>
> These registers have underlying states and can support raw access.

No, the CLR registers don't have their own underlying state.
The underlying state is handled by the SET registers. NO_RAW
for the CLR registers is correct, because:
 * we don't want to migrate the state twice; the SET register
   of a CLR/SET pair will handle it
 * we don't want to try to write the state to KVM via the CLR
   register

-- PMM
