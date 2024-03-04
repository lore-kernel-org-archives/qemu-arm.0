Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2660231eja;
        Mon, 4 Mar 2024 07:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrN4laNKwRBnbfi89zlh1XKEgTHNsrTnFaAjmBhM0w0FFhtNzEWMPNh4ys17Dugwncfq3Lf2r2SZVD9urxtKuPoJKV52yA
X-Google-Smtp-Source: AGHT+IFR+7FaW/LxRB2bLff0/FsADkbJFpOccsDESgp5SAgrULq2IR/qK2NyvCyVX4mKtMIiU2sE
X-Received: by 2002:a05:6358:6383:b0:17b:f051:85b2 with SMTP id k3-20020a056358638300b0017bf05185b2mr10173396rwh.1.1709566238577;
        Mon, 04 Mar 2024 07:30:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709566238; cv=none;
        d=google.com; s=arc-20160816;
        b=xSbX/UGYPc5fBG2ql6cRFJ5CIZyo5RjRUMsziF4nrRocEnGyE2KOVjdILKXg9DYSOD
         SFGs6rWR1USWGYq93c3NtOLD4riyUpRw4/JBsGsg0DH24XsLuKib2kZZq9Ip1rfiPlT6
         i4AKBYCcQo+9dEyo6+6sgOx2eeTA08jL0eVuYVBGUyO0JnRERI98rM87RzCmrih+Aq1K
         I2vxlo85kPXb88h80oLk8LxLhs3qCUPSrm/00m2QpTbrd4q+n0zh1AI5pfrZV37UKXjt
         oSOrZsTW5l/GH9z6pqvO1Ato34pIANvYrtKtyX93O37+JinACnPtd14iQCu2Jc/f1F6+
         uNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bUQi6N/kuOOhafaAWC4knsx7U8vzqRZX+Tfl/GN3R5g=;
        fh=m68iKLQMbOOvdvu/jhq5FEvVniikuLUUkQoCJiBwJ7E=;
        b=icPB4Q3XtutcUWob1I70YsTP/JwwFck5AHsEEgYsffamJoTF8+tCgtm0+mTb9yKKh7
         42qG6QpMFelK2Ae9mLLYyJmJDQBmzvQ3TilEy/ixz2x3Z8g/ruQAnxgC5Rjt0R5vSOKu
         bpfWujBKY85YaFLoQbyJWOSz/oO3gOy585yvMbBDGlYOgdjxe/RS5sU7a0nB8hToPypC
         ykCfxuDoz+2Ww+iSW3xKc28rmdhm8kfDXXMq9x2egI3wY6QPHCfJrxRKm/FhfdGCmaot
         dsFvBrYE1A4WYqCzjkDtIoXX+jzqia8ZgvEWK45Gx9W2X5lqaJnWngDEBLSB1QAu4SOB
         7IUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=byo8G9ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020ad45dcc000000b0068ffe94f96csi9929210qvh.603.2024.03.04.07.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 07:30:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=byo8G9ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhAGp-0005Ox-Pc; Mon, 04 Mar 2024 10:30:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhAGT-0005J4-8w
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 10:30:06 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhAGR-0006hD-B2
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 10:30:04 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-565a2c4cc1aso6497398a12.2
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 07:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709566200; x=1710171000; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bUQi6N/kuOOhafaAWC4knsx7U8vzqRZX+Tfl/GN3R5g=;
 b=byo8G9cevaudXJZTNC8doe1Yi4h1/29L9tNf7rR/xbPePIcqM55B48kPSwFzKYOFHD
 lJRmGKckHBR3imMuXY9RjzlpUjGC5C2P1g7Kcfy0SAImIFgYurSEvY//xvR41qNkhyzY
 GIr84wbLVMR9dFd6tyQyHGxjCx2fK7Zs1dPCcdnhaclrT79g4uCayqX9oLT/sj4/FeDZ
 NNpIHIjPcY7ESw3vBGOS4u/FkGxcU7E3aK6ZjG0S7+4htkVScOgNNZUBALADDjlRZn4P
 gAsUN1DSNtutsKFJikv0Nuatd0M0lJDUcuqziPu3UVn0VVyspwAdvcJUlxw9HNI8GAHc
 Ywjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566200; x=1710171000;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bUQi6N/kuOOhafaAWC4knsx7U8vzqRZX+Tfl/GN3R5g=;
 b=fxNiGIURxJjXncRP/5DCzCAyFgAETJ3jLGSEYXnXRx8jFG+Cs8s5EJPSrIP0oYMVBZ
 SuyILalyLaCikFdtIITHza8IeKOkS+5adrGNHZAbmi2LblIc9xOPHrW+16wwTu7NkqvW
 Ct7VrAAuftkWlitpBddwj6Bm+fbCG8ynp8NtBR2u/tlncO/8E3f2wfFsxYaFG7Tc/TYn
 6+cPd8LNl8vjzElOYq6hCNvJt6HdV48miSz7ZLU7lHvErlBTG5Ak69cz8xwBvZkO4xN/
 Pxb+2LAtiEhuFZKYwLobEuubG5+fCo4VIEnzlcL5oHhA9KhEbV5v+JuT3mVcZQgxWzsA
 3RzQ==
X-Gm-Message-State: AOJu0Yxem4Zdy9ikGYgx6UfdlVHmqs74XQwADaWupvJBOpAt9labb3cQ
 MgxX2pI1qGUrT7M1k+2L9zs+imzCAl3678buWoxePR9qrlhcmMGus9gUiAEhfF8IxKnPwqdgsf0
 Z9xkSbBxNi9unf/jQXIFnRLRPGKlyhMpYk1AUyQ==
X-Received: by 2002:aa7:d714:0:b0:567:48b9:e9e6 with SMTP id
 t20-20020aa7d714000000b0056748b9e9e6mr2059512edq.42.1709566200277; Mon, 04
 Mar 2024 07:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-2-thuth@redhat.com>
 <CAFEAcA_mf-iGD_P3DB=dw4n=qpFyNODtAz1jFKUdjFkM1eWVuQ@mail.gmail.com>
 <5553d942-5da1-4930-b404-2b71a6fd37ca@redhat.com>
In-Reply-To: <5553d942-5da1-4930-b404-2b71a6fd37ca@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2024 15:29:48 +0000
Message-ID: <CAFEAcA_rkjMXtHQGviky_vZMxE2JJBg6p-EyzGd2Rk90wR=2Zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/arm: Move v7m-related code from cpu32.c
 into a separate file
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Ymi4XBRKbRc8

On Thu, 1 Feb 2024 at 18:52, Thomas Huth <thuth@redhat.com> wrote:
>
> On 01/02/2024 15.17, Peter Maydell wrote:
> > On Mon, 29 Jan 2024 at 08:18, Thomas Huth <thuth@redhat.com> wrote:
> >> diff --git a/target/arm/meson.build b/target/arm/meson.build
> >> index 46b5a21eb3..2e10464dbb 100644
> >> --- a/target/arm/meson.build
> >> +++ b/target/arm/meson.build
> >> @@ -26,6 +26,8 @@ arm_system_ss.add(files(
> >>     'ptw.c',
> >>   ))
> >>
> >> +arm_user_ss = ss.source_set()
> >> +
> >>   subdir('hvf')
> >>
> >>   if 'CONFIG_TCG' in config_all_accel
> >> @@ -36,3 +38,4 @@ endif
> >>
> >>   target_arch += {'arm': arm_ss}
> >>   target_system_arch += {'arm': arm_system_ss}
> >> +target_user_arch += {'arm': arm_user_ss}
> >> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> >> index 6fca38f2cc..3b1a9f0fc5 100644
> >> --- a/target/arm/tcg/meson.build
> >> +++ b/target/arm/tcg/meson.build
> >> @@ -55,3 +55,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
> >>   arm_system_ss.add(files(
> >>     'psci.c',
> >>   ))
> >> +
> >> +arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
> >> +arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
> >
> > Why do we need to add this new arm_user_ss() sourceset,
> > when we didn't need it for the A/R profile CPUs?
>
> cpu32.c gets added to the arm_ss source set which is linked into all
> possible arm-related binaries (qemu-system-aarch64, qemu-system-arm,
> qemu-aarch64 and qemu-arm).
>
> The goal of this rework is to have the v7m code only linked into the
> binaries that need it, i.e. qemu-system-arm/aarch64 if CONFIG_ARM_V7M is
> set, or the 32-bit qemu-arm linux-user binary.
>
> > What goes wrong if we add it to arm_ss() the way we do cpu32.c?
>
> The problem is that CONFIG_ARM_V7M is not set for the linux-user builds, so
> the code does not get included in the "qemu-arm" binary anymore.
> Now, the obvious answer to that statement is of course: Let's add
> CONFIG_ARM_V7M to configs/targets/arm-linux-user.mak, too! ... but I tried
> that already, and it also does not work, since then we'll suddenly try to
> include the hw/intc/armv7m_nvic.c stuff into the qemu-arm binary, which of
> course also does not work. It might be possible to rework that by moving
> armv7m_nvic.c from specific_ss to system_ss, but looks like that will
> require a *lot* of other reworks (e.g. arm_feature() is not available for
> common code). Another solution might be to move armv7m_nvic.c into the
> hw/arm/ directory and add it there to arm_ss instead ... it's then a little
> bit weird that this is the only interrupt controller there, but at least the
> changes would be quite trivial. What do you think?

The NVIC is in some sense part of the CPU, but I think I'd rather
not move it. (You'll also find that setting CONFIG_ARM_V7M pulls
in code in hw/misc (RAS handling) and hw/timer (systick timer), so
it's not just hw/intc code that's affected here.)

I guess this is kind of happening because we have one symbol
CONFIG_ARM_V7M and we're using it both for "we want the v7M
system components like the NVIC and timer" and for "we want
the v7M core CPU support". So maybe another approach here would
be to have CONFIG_ARM_V7M and CONFIG_ARM_V7M_CPU or something,
where linux-user selects just the latter. But unless you think
that approach would work out more cleanly, I'm OK with how this
patch does things.

(Sorry for not getting back to this series for so long.)

thanks
-- PMM
