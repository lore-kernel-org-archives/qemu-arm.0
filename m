Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2656179eja;
        Mon, 4 Mar 2024 07:23:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKJ0anphDH0B57UfBKMOO869KGqguWizODmr7DKm/ETDpsOcF6sDtXaKN+sGByPK2YrSX0iZeswu7QYn2b8t77ts+crWOk
X-Google-Smtp-Source: AGHT+IFCk0zaasJ3J1ZMkAZqtiYpgPNKt648SYbXQ+HVggbwz+S25JHlVs5dr0fXGZfgxUC6w5/R
X-Received: by 2002:a05:620a:55b4:b0:788:2a7c:2b3f with SMTP id vr20-20020a05620a55b400b007882a7c2b3fmr2227619qkn.32.1709565814079;
        Mon, 04 Mar 2024 07:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709565814; cv=none;
        d=google.com; s=arc-20160816;
        b=NXxi29t+DgZnLwEFNJ2Oxe9KQO0cNtFQSfn1rzO56qGtnHoiSFNpnhJwgtX5Sr6UXB
         C/kS3lApTmDm9CFj0QA+zA9BIa/m9O6TmdzMzxThCaAL2mEeN+KnFmkfr6SNsQyNk1I2
         2GBuJ6RiD2tnR8h+p+tk70rqT5PPBwqZD5Rh+37qHhSvLsngSr1l2dnZC7oKuiBDwcZR
         4myWiiCSvLAocWLlOhfcS+jQPzKH2B+kKzDW+I6QB0dl//8sCS3Rau+ZlBFmXUSchdNB
         J5P1RvTaJOsf5sg0feTb03BCANL8b1DMn1x5KEs15OWqKayr0nZnSFBAYRMv8btBgxpS
         DVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4HZHvEdtH+UdBRknZvK/Hc/ufCRPd00a/h/qBUE648c=;
        fh=DCVeIbzpk6J5rO0NPTFTAR7nQPn4mTzXVrjEOU9pZqs=;
        b=EV44g+t112pcxgyFWxi7PYuWD5S1q5p20osPUilqgTXQreC5EZpJsi35hbDamQ6O1V
         cneftHps9zluoJXmybLqnhgPdpNIabbEGeWDowLlHlOSfng1UlbrYzJWrx091xs1urQc
         BUoPTuLncUYxs3chYHmp+8gv1b7YkhTGyszRYVpDsyV+QR/ioFvxS8e636p71Q5LKh5t
         4/uoOMTfHQr/Q90JJDESy9Xs46rLltmT7LcYEAClWNFj3fiw9wj/S3RPk2vOCV+a0OSk
         cCXA6er3D6NdheAYrWyojmdHQ+isQNR8JDTZ+NdbGLR5bqikf12IslJUs8hAnrrnmi5U
         GYeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDsGPMTk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea5-20020a05620a488500b007882e843281si1202648qkb.244.2024.03.04.07.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 07:23:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDsGPMTk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhA9l-0003cH-7f; Mon, 04 Mar 2024 10:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhA9j-0003bZ-1Q
 for qemu-devel@nongnu.org; Mon, 04 Mar 2024 10:23:07 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhA9h-0005sf-4a
 for qemu-devel@nongnu.org; Mon, 04 Mar 2024 10:23:06 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso7024062a12.0
 for <qemu-devel@nongnu.org>; Mon, 04 Mar 2024 07:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709565781; x=1710170581; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4HZHvEdtH+UdBRknZvK/Hc/ufCRPd00a/h/qBUE648c=;
 b=XDsGPMTkXhxe1mFx4qGVOnZQlV8lLrmX5LA5wgAGvoPswZX2cLnI33uHeyhB/Gz1GP
 qVQp95m3fL5RTJ5/hQbpVZtTkz/ugbFONC9NJp+OjwA1FYaMd7dXGe+8MTEVAS0hXwE0
 O/KQZFO008qXPXyBuwehElb4Z4sDY0ybmiu8s4nwv+jpbpTOYsd7vTi/f0IcOXoNVQha
 PFKtKVbBm18S1BJgUO2EBPtcjeS3a+5LP0ID1kRnDOX5v6pQfa5tzWB7PK9xwLHY1SMr
 yJ/Jt80ASXPeZZM0ojrami+g2XQ0mYU0Rylc/vV37n+WUo0gzWD9UVfzu1csnEQ9/oSQ
 ZE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709565781; x=1710170581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HZHvEdtH+UdBRknZvK/Hc/ufCRPd00a/h/qBUE648c=;
 b=SFRurcQJGX46KSg0eiQvDWdVHfnT41iHxy+yeSgz63Ibrx29619yV66E683PkFypn/
 xvEBLZTpg/U7Hh5gzhpzbmsEJzdaluD2oNizz5zSpMpfZDp/5cA/URNLO6pRrIN4gBNV
 KUSwIdhYRalFzb0D/XRedn36TxMT+i48CjwlcAaWZ3zy5alaVbw1wTtjeQB6vhXyyYd0
 eIeHDj42o1bPPMB4tIffBDX/Z31oukwImOZxVOPAjcV/O3/2vO56QNTGqMmKdh9IBhTv
 6/SYpCpDZFj0RfBRLkw4PVt47JPvwsBfMCb1Nl76IRuJar5D1eDxLJhwPsjyz0zPYRmh
 fj2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrkJSYz/tqOJYhiQsPCjdwaePNrm/uEatwoZGuaxZu/At7/Y5XXhCCVb013htsyBjVkFrg1CvnQLMTf1BsaArXUcsX3FU=
X-Gm-Message-State: AOJu0Yyj0vyabAYXBagTEICeSaN06OF1XRPwdCEkWtNCZtuU3+wEZtmz
 1khutfZs3efYX+R9scOY/dR2n6S7EmRyCuOtoMP4tx+NMeyegrcc65kdsWUHhPOREsoI3L//OuB
 ExKWc2GLTSqwcDkd7fYyQ+N2N/oPeC9/mcqpXIyCYT7r/Cg0D
X-Received: by 2002:a50:c90d:0:b0:565:e610:c358 with SMTP id
 o13-20020a50c90d000000b00565e610c358mr6111001edh.38.1709565781099; Mon, 04
 Mar 2024 07:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-3-thuth@redhat.com>
 <CAFEAcA-yL8BAdtkF2xaWJOeFPUWRoBbuvPSEeorwjyei3oFjDQ@mail.gmail.com>
 <d0ed3f33-b641-4e46-bfaa-f21fbcecbeb8@redhat.com>
In-Reply-To: <d0ed3f33-b641-4e46-bfaa-f21fbcecbeb8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2024 15:22:50 +0000
Message-ID: <CAFEAcA-ye_3AqCkNS1acJ7GPzLEf=WCmjN3WXe9eRWB1x3y=7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm/tcg/m_helper.c: Include the full
 helpers only with CONFIG_ARM_V7M
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: /6aZRottKHA8

On Thu, 1 Feb 2024 at 19:12, Thomas Huth <thuth@redhat.com> wrote:
>
> On 01/02/2024 15.19, Peter Maydell wrote:
> > On Mon, 29 Jan 2024 at 08:18, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> If CONFIG_ARM_V7M is not set, we don't want to include the full-fledged
> >> helper functions that require additional functions for linking. The
> >> reduced set of the linux-user functions works fine as stubs in this
> >> case, so change the #ifdef statement accordingly.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>   target/arm/tcg/m_helper.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> >> index d1f1e02acc..a5a6e96fc3 100644
> >> --- a/target/arm/tcg/m_helper.c
> >> +++ b/target/arm/tcg/m_helper.c
> >> @@ -22,6 +22,7 @@
> >>   #endif
> >>   #if !defined(CONFIG_USER_ONLY)
> >>   #include "hw/intc/armv7m_nvic.h"
> >> +#include CONFIG_DEVICES
> >>   #endif
> >>
> >>   static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
> >> @@ -69,7 +70,7 @@ uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
> >>       return value;
> >>   }
> >>
> >> -#ifdef CONFIG_USER_ONLY
> >> +#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_ARM_V7M)
> >
> > This looks a bit odd. If we don't have CONFIG_ARM_V7M
> > why are we compiling this file at all?
>
> We'll get failures during linking otherwise. target/arm/helper.h still
> defines code that requires the v7m_* helper functions:
>
> /usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o:
> qemu/target/arm/helper.h:76: undefined reference to `helper_v7m_vlldm'
> /usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o:
> qemu/target/arm/helper.h:75: undefined reference to `helper_v7m_vlstm'
> /usr/bin/ld: libqemu-arm-softmmu.fa.p/target_arm_tcg_translate.c.o:
> qemu/target/arm/helper.h:73: undefined reference to
> `helper_v7m_preserve_fp_state'
>
> etc.

OK, but what we want in that case is either (a) avoid referring
to the functions if we're not building for V7M (as you say,
may be awkward) or else (b) stub versions of the functions that
abort() if called. We don't really want the linux-user versions
of the functions.

Does having an m-helper_stub.c which we build if not CONFIG_ARM_V7M
and having m_helper.c only built with CONFIG_ARM_V7M look
feasible?

thanks
-- PMM
