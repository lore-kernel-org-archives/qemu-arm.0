Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2894176ejx;
        Sun, 4 Dec 2022 09:37:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6/zgt4UkJWPM44mg2BX/C81+DL12V+HWrH9IBnw5dfkONIv3dvEqKPPLJhe/nkJATefJuZ
X-Received: by 2002:a05:622a:249:b0:39c:b5a2:5eb2 with SMTP id c9-20020a05622a024900b0039cb5a25eb2mr74124605qtx.39.1670175434654;
        Sun, 04 Dec 2022 09:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670175434; cv=none;
        d=google.com; s=arc-20160816;
        b=qUeIn90iuZJ7zXuz0QT3b2lKyCMMD2xVf7DiO3nm9ZXIwcalbuM7t2CTuNSO0rFMMT
         fYxfVSJvgsgjn3YLaHhCGhD06Qj8v3kMwvxnjXIk3lCQKX5U03fEt/YOA1hyoDbMI8t7
         SvFRi9k+qKtlloHXNXntZ2Nzyhg3V1kACAFIGNg5h6qRLC0kmbiXKdjf85tPVDLTdbWG
         Gg8WzllK6+4iRZ7lR7EjxBc4As4FKjHm0yQ9Z57V/vhSmwuFNx67KnjiHe6/3DuCns99
         M0fAM9Hx9M8Ykhalpq0wwaJ8PEa+zuPICnuuu41+Ko8F/3TkWFwFiCV8vxZZ4mzPcuLk
         J/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qEAwh3rL6f8Cnhv0QF3VvcQHhWy6OUJslmZcquSoLe0=;
        b=o0MbwAVXHYlLC64FQ5UYfJ/h6v5o7y+NgdFRbvqOSrTdkv4Uujx9ZfecSUddQeXcpX
         H0nk5dt69TEsHkGOO/YQN1TOC+3pzUx2+QqMGbuVVXXyKQBLKgbaCTM5ICiOtwFEalZY
         cWZBtuOpkfsZa5FJ7Q59L4/s7Dvg07B/N02+UOxh1c5P3m6OnNm1xJWcN+VTYvEUVZzg
         Skdj7Npm+SezVjv8a7WLi2NfXImLLn54LXLvMTo/ryKWXqQkTyxT6CM5KbG+crU8csQw
         sIw7UCpbQq40QKcRl0aQIBujH9rJe6bVZMUKEnVSrWkKoruzJfcMJuwn8cCQthl5R1IG
         FpOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l72AjKZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05622a180600b0039dd5cc5fe3si1260412qtc.571.2022.12.04.09.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Dec 2022 09:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l72AjKZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p1sv5-0000lW-16; Sun, 04 Dec 2022 12:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p1sv3-0000l4-Ff
 for qemu-arm@nongnu.org; Sun, 04 Dec 2022 12:36:49 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p1sv1-0008EP-Pl
 for qemu-arm@nongnu.org; Sun, 04 Dec 2022 12:36:49 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so9365833pjo.3
 for <qemu-arm@nongnu.org>; Sun, 04 Dec 2022 09:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qEAwh3rL6f8Cnhv0QF3VvcQHhWy6OUJslmZcquSoLe0=;
 b=l72AjKZhNG06/vtoCjG3OkUFzuJ/sTclKpzQ0W10DNFtl1Nqvz/n8YlUjmK/BPSgqh
 e2RpJQ2/uCR3diibOBDGeZzQHYMOSH5WayaraOPzpVdJK2RKjnnFmq6lIZE7816vHfYk
 EHi9I/KH4Q0oa3k51Tagj9sCK9dRU8JN2TzNF+kQgXhM28/Be2cplWeToLRyXXEqXF7Z
 ponaemonJDwDPDeAzTLyhHt28pqgiIHIIGiGhcG12ILJdybPQKWJIpM4cY3IbCm4UEp0
 CFNhAH8L3dvjopBs5D4wWx8pZ3q0YL0pIkUbPVRJbiQH7LzI6p3QPg+J4oiIoM4/6D+x
 ZZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qEAwh3rL6f8Cnhv0QF3VvcQHhWy6OUJslmZcquSoLe0=;
 b=fWWExBa4x3UEwTPg9PiTytUNcoEYvc8c9FY4odXPtIAXRDOuLUQkZLXVvhEeNRSkeI
 4IvInmODyK24XDh2/cyTaFUzcnu6GSxKJF8eCzRLI+3RRJ26U7xOenwMVsoqSy0TAuND
 IQVzmjLvnpnQvn5fIJt8tuUoycB5eiZwGlPPn1ViH3P7iFt+UpgdLUtg4utKKXXiLDzg
 bWAH92jOeT0pFhkEl9Fjrj/2WIGFK0ZDgk7ApI3nm3sFo+6Pil8cYAS2RJ+vn/F5IbyL
 55t3+aY1m4ARBJC+x8Rp92o3Ajpy3Ak9ISvHOabJ2nVM9iqpzhQ8Z62tU+2nM2yezlV6
 8yrQ==
X-Gm-Message-State: ANoB5pkHt1GrFML0PUUVsb8AnpN7waa/1dKtRH8hWcvL0Ulb7XuDlYGU
 kMIui4h6XTjbSwQsMOQXIEJIiHpw/d4dGnDJM9DS3Q==
X-Received: by 2002:a17:90b:33c8:b0:219:94b2:2004 with SMTP id
 lk8-20020a17090b33c800b0021994b22004mr11124321pjb.215.1670175405756; Sun, 04
 Dec 2022 09:36:45 -0800 (PST)
MIME-Version: 1.0
References: <20221130111559.52150-1-thuth@redhat.com>
 <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
 <95226bbe-9658-660c-12bb-dbf82b28dbd5@redhat.com>
In-Reply-To: <95226bbe-9658-660c-12bb-dbf82b28dbd5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Dec 2022 17:36:34 +0000
Message-ID: <CAFEAcA9wrz5byHoq=1KeCcZW9yF44Zg2-SHi54pV=EFvYeu3rA@mail.gmail.com>
Subject: Re: [PATCH for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pTQfiOt+0U0y

On Fri, 2 Dec 2022 at 12:25, Thomas Huth <thuth@redhat.com> wrote:
>
> On 01/12/2022 12.55, Peter Maydell wrote:
> > On Wed, 30 Nov 2022 at 11:16, Thomas Huth <thuth@redhat.com> wrote:
> >>   #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
> >>   #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
> >>   #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
> >
> > kvm-consts.h is where QEMU_PSCI_RET_SUCCESS etc are defined.
> > So while the #include isn't strictly needed for compilation to work
> > because arm-powerctl.h only creates the #define and doesn't use it,
> > it does mean that any source file that uses the QEMU_ARM_POWERCTL_*
> > now needs to include kvm-consts.h somehow itself. (Usually this is
> > going to happen implicitly via target/arm/cpu.h, I think.)
> >
> > I guess this is worth living with for the benefit of not
> > compiling things twice. It could probably be untangled a little
> > by e.g. moving the PSCI constants into their own header rather
> > than defining them in kvm-consts.h, but I'm not sure if it's
> > worth the effort right now.
>
> Hmm, do we really need these QEMU_ARM_POWERCTL* redefinitions?
> They seem hardly to be used outside of the arm-powerctl.[ch]
> files:
>
> $ grep -r  QEMU_ARM_POWERCTL * | grep -v target/arm/arm-powerctl
> hw/misc/allwinner-cpucfg.c:    if (ret != QEMU_ARM_POWERCTL_RET_SUCCESS) {
> target/arm/hvf/hvf.c:    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
> target/arm/psci.c:    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
>
> ... so maybe we could rather change those spots to use the QEMU_PSCI_*
> constants instead? ... or since they basically only check for success,
> we could maybe use "if (ret) ..." and "assert(!ret)" there?

I see you've found a neat way to avoid this problem, but for the
record, the reason the two sets of constant names are different
is because these are two separate levels of API. The PSCI values
are required to be those values by the PSCI specification. The
ARM_POWERCTL values are just part of a within-QEMU API that is
used both by our PSCI implementation and also by some non-PSCI
power-control devices, so conceptually it shouldn't use PSCI
constants at all. However we assume in our PSCI implementation
that we can just pass through an Arm powerctl return code as a
PSCI return code to the guest, and so we want at compile time to
know that in fact we picked the same numbers for each. In theory
you could separate them the two sets of constant definitions and
then compile-time-assert in the PSCI implementation code that they
have the same values, or you could really separate them out and
then have the PSCI implementation code (that's the two cases in
target/arm) do a runtime conversion between an ARM_POWERCTL return
value and the appropriate PSCI return value.

The current setup exists partly because we started with only
a PSCI implementation, and then abstracted out the "start/stop
a CPU" functionality into its own within-QEMU API so other
power-control devices could use it.

-- PMM
