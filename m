Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1837979njb;
        Mon, 10 Feb 2025 02:27:36 -0800 (PST)
X-Received: by 2002:a05:690c:7106:b0:6f7:acc3:63dc with SMTP id 00721157ae682-6f9b2a0d784mr102065187b3.36.1739183256313;
        Mon, 10 Feb 2025 02:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739183256; cv=none;
        d=google.com; s=arc-20240605;
        b=bYRIPLUboCzZlg9m1uXEK733BlKR3kSxy3GLzmPNN9fBZ59nU+SOQfKgGMQDs7mKhr
         VDAceK9fMSDEc3k0GFgLNLMbgTrUZpqDlMxgZ3ykGnF1NQQF74AOYkpMb3qMpdLiyiEc
         XZfM85aKN1SoZpgpP72cmmwwPYjKbIPT3TOQXCeWrK91hxSXtQwgBJZoTI0VLf9HhTa0
         yKrwQTf+gdCkxIMVgWqLH2gWe+dBrdNEeMTpBsHC5SV8PlTJa7kgwtWScUIiZeQcT7BG
         ZUAN6DEosKUANL/hHYw7toURCbfOsqKQuQ1QUQGSm/H27NGZrbCfSfgs4XA0he1xoe62
         7vfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8Lw06BOrYsNQ4AYM+lwVkVkT2+9W/2UtsjCWofhmopk=;
        fh=64MdXyPhQ1JcGAAf+7ZYY99+utuXNwtbg/S6DAZq4tI=;
        b=PcZihu0FxoRKlx05LHou8U81y5aT1o74t6O3mqTIAoTcmcCQFXt9wNRJhd/U2t36xK
         M7b0bidzyH1RYORZqZH//XN0Sdlq/gzjhSOA9d9b/MbcIqSZ869xEd7Rib6I5kQVfsbr
         Nak7dmicjGQgWCys9zjvlX0Xim7iqDqVFsWSLuF24qjJYzXTvwfOwdbSsb85G2jJ/Q1F
         NPmPmQJRm0T6g63qPeKq4Gh0qeDAhMlC3LiRGxtPOJe6290xeqqRHSWjswCWE1E/NwP3
         P7sFpacoh8EM4vMxqxIKKLJOq1I3fXyYNYQAMssx5dVZdz+Yqzzp1r5OCwJyqpAZJJw5
         U1wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oa1/0cGu";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb0673f6bbsor1415897b3.10.2025.02.10.02.27.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 02:27:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oa1/0cGu";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739183256; x=1739788056; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Lw06BOrYsNQ4AYM+lwVkVkT2+9W/2UtsjCWofhmopk=;
        b=oa1/0cGu1icN8yxjPdGY75QwIIqxLPBRJn9Ek3spozzTgWXw9XtL56QGBV2PHnxkx3
         Ai3tm483zwkLkhy9LefbCVvh+jSaURnPQi0qoEvV2Dm8MiToxVy+tXP6+SNQlpvtrzJy
         wYkht+4ZarGvN+ZDgZ/qFONHAMlUepDd+xhmXbYE8LQ4+LLJ4Zzs5phhb8E9Pfqb8YvA
         uhKsSmS8ZjQoC8WvqLojDm5sFeC5zNbLYO5U7yde4J1up24B/pxcuHWYaT/RTyKXprSc
         1J5UMBDuAMsmYH7mr/AHal7jR+cinpqDchyzkKiGsyZjG5MxziGSLgcpxJXvraYgWg4r
         VJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183256; x=1739788056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Lw06BOrYsNQ4AYM+lwVkVkT2+9W/2UtsjCWofhmopk=;
        b=DTi03Etb8ax9H/ipnG6rthUmREBcu1olQcOcVTg+MTxUEK51lQAOt+LLovh6MatveW
         IyHNTWS0h78n3bBfp2xFa85VPvT5LSgUxX/3C6a0PNsWExLXy+PIJPor9Ecx3jzmul7B
         Jp0L3R8zvjrbiVQYKhfCfHY3ZthP4BbFftxBKd92TCsEQb5JUDrwylKJ+ZnJqHWN+Btx
         6Dxo1Aq9WjIoNnd2M+K1xRgvGB1nX4usWFne/OFy4MIu1tEnVks8rUrvIAF94aR0KcEL
         s/KdFcYkzj4xJo5oVgz+iwu/yajZl+f+jrYhlAzhWDQtcmCc/egwMFOsSvPLvH150+EH
         W+Gg==
X-Gm-Message-State: AOJu0Yz9a9ljT7qGkU7D/MNQu9wOfeKiC0hsYzK5Ci5R3pfsLM0frD06
	RZ65xdDXhK1q6tKaOu74ZCPHTo0OPZVHlTkTzOSDuJ7nQ4js/pmaIdjRCg4Wm8YbXSRxrC6QY2X
	bhDgBphp87hSgpLIE8/MP84WId+2mUTPVJRBcClWW
X-Gm-Gg: ASbGncvtGF4PA5uA6tgz1Dj0gnUf5OZ4xNA5fNFoJXsUxDyRmCyn8D3mdncHdriR8sD
	5EefgPCvhgi89sooO7vwPeNM98aCroP1TeRu6fYDOz720cICmU5yn7T/lFgc53q7dBRddE5AnhQ
	==
X-Google-Smtp-Source: AGHT+IF+artVKxhqv46vV7sWzB7uOCL7Hx6x0PeGwPVt6FAOxTwT5zoev8H+x/5cWKexKZxrj7C6xVALcqGyHv5E/AA=
X-Received: by 2002:a05:6902:1586:b0:e39:85e3:1069 with SMTP id
 3f1490d57ef6-e5b4628c5ffmr11112327276.47.1739183255777; Mon, 10 Feb 2025
 02:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20250130182309.717346-1-peter.maydell@linaro.org>
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2025 10:27:24 +0000
X-Gm-Features: AWEUYZlm3rU8fdHUwBPlkvkks2uJDnMpswY0qMxJXIWvubDGFwHv6Go_NBfm2ic
Message-ID: <CAFEAcA_+9tVJaV4EpdfYvBx=bBL1KFzdGAD28TAvjct0x28KcQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] target/arm: Clean up some corner cases of sysreg traps
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: U61vHnY5Y4Gt

Ping for review on patches 2, 3, 9, 10, 12, 14, please?

thanks
-- PMM

On Thu, 30 Jan 2025 at 18:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> While reviewing Alex's recent secure timer patchset, I noticed a
> bug where it was using CP_ACCESS_TRAP when CP_ACCESS_TRAP_UNCATEGORIZED
> was wanted, and that we were making the same mistake elsewhere in
> our existing code. This series started out as an attempt to fix
> that and also rearrange the API so that it's harder to introduce
> other instances of this bug in future. In the process I noticed
> a different bug, where we weren't handling traps to AArch32
> Monitor mode correctly, so the series fixes those as well.
>
> The first four patches are fixes for the places where we were
> using CP_ACCESS_TRAP when we wanted CP_ACCESS_TRAP_UNCATEGORIZED.
> These are all situations where an attempt to access a sysreg
> should UNDEF and we were incorrectly reporting it with a
> syndrome value for a system register access trap. I've cc'd
> these to stable as they are technically bugs, but really the impact
> s very limited because I can't see a reason why any code except
> test code would deliberately attempt a sysreg access that they
> knew would take an exception and then look at the syndrome
> value for it.
>
> Patches 5, 6 and 7 together fix bugs in our handling of sysreg
> traps that should go to AArch32 Monitor mode:
>  * we were incorrectly triggering an UNDEF exception for these
>    rather than a Monitor Trap, so the exception would go to
>    the wrong vector table and the wrong CPU mode
>  * in most cases we weren't trapping accesses from EL3
>    non-Monitor modes to Monitor mode
> This affects only:
>  * trapping of ERRIDR via SCR.TERR
>  * trapping of the debug channel registers via SDCR.TDCC
>  * trapping of GICv3 registers via SCR.IRQ and SCR.FIQ
> because most "trap sysreg access to EL3" situations are either for
> AArch64 only registers or for trap bits that are AArch64 only.
>
> Patch 8 is a trivial one removing an unnecessary clause in
> an if() condition in the GIC cpuif access functions.
>
> Patches 9-13 are the API change that tries to make the bug harder to
> write: we add CP_ACCESS_TRAP_EL1 for "trap a sysreg access direct to
> EL1". After all the bugfixes in the first half of the series, the
> remaining uses of CP_ACCESS_TRAP are all in contexts where we know the
> current EL is 0, so we can directly replace them with
> CP_ACCESS_TRAP_EL1, and remove CP_ACCESS_TRAP entirely. We also rename
> CP_ACCESS_TRAP_UNCATEGORIZED to CP_ACCESS_UNDEFINED, to be a clearer
> parallel with the pseudocode's use of "UNDEFINED" in this situation.
> The resulting
> API is that an accessfn can only return:
>  CP_ACCESS_OK for a success
>  CP_ACCESS_UNDEFINED for an UNDEF
>  CP_ACCESS_TRAP_EL{1,2,3} for a sysreg trap direct to an EL
> and everything else is invalid. UNCATEGORIZED traps never go to a
> specified target EL, and sysreg-traps always go to a specified target
> EL, matching the pseudocode which either uses "UNDEFINED" or some kind
> of SystemAccessTrap(ELx, ...).
>
> Patch 14 fixes some issues with the WFI/WFX trap code, some of
> which are like the above sysreg access check bugs (not using
> Monitor Trap, not honouring traps in EL3 not-Monitor-mode),
> plus one which I noticed while working on the code (it doesn't
> use arm_sctlr() so will look at the wrong SCTLR when in EL2&0).
>
> I've cc'd the relevant patches to stable, but I don't think
> it's very likely that anybody ever ran into these bugs, because
> they're all cases of "we did the wrong thing if code at an EL
> below EL3 tried to do something it shouldn't". I don't think that
> EL3 code generally uses the trap bits for trap-and-emulate
> of functionality, only to prevent the lower ELs messing with
> state it should not, and everything here with the exception of
> SCR.IRQ and SCR.FIQ is pretty obscure anyway.
>
> (Tested somewhat lightly, because I don't have any test images
> that test AArch32 EL3 really.)
>
> thanks
> -- PMM
>
> Peter Maydell (14):
>   target/arm: Report correct syndrome for UNDEFINED CNTPS_*_EL1 from EL2
>     and NS EL1
>   target/arm: Report correct syndrome for UNDEFINED AT ops with wrong
>     NSE,NS
>   target/arm: Report correct syndrome for UNDEFINED S1E2 AT ops at EL3
>   target/arm: Report correct syndrome for UNDEFINED LOR sysregs when
>     NS=0
>   target/arm: Make CP_ACCESS_TRAPs to AArch32 EL3 be Monitor traps
>   hw/intc/arm_gicv3_cpuif: Don't downgrade monitor traps for AArch32 EL3
>   target/arm: Honour SDCR.TDCC and SCR.TERR in AArch32 EL3 non-Monitor
>     modes
>   hw/intc/arm_gicv3_cpuif(): Remove redundant tests of is_a64()
>   target/arm: Support CP_ACCESS_TRAP_EL1 as a CPAccessResult
>   target/arm: Use CP_ACCESS_TRAP_EL1 for traps that are always to EL1
>   target/arm: Use TRAP_UNCATEGORIZED for XScale CPAR traps
>   target/arm: Remove CP_ACCESS_TRAP handling
>   target/arm: Rename CP_ACCESS_TRAP_UNCATEGORIZED to CP_ACCESS_UNDEFINED
>   target/arm: Correct errors in WFI/WFE trapping
>
>  target/arm/cpregs.h        | 15 +++++---
>  target/arm/cpu.h           |  6 +++
>  hw/intc/arm_gicv3_cpuif.c  | 15 ++------
>  target/arm/debug_helper.c  |  5 ++-
>  target/arm/helper.c        | 75 ++++++++++++++++++++++----------------
>  target/arm/tcg/op_helper.c | 71 ++++++++++++++++++++++--------------
>  6 files changed, 107 insertions(+), 80 deletions(-)
>
> --
