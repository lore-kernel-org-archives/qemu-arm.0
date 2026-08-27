Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B778C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 10:33:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzXPu-0002Qm-7W; Thu, 27 Aug 2026 06:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzXPt-0002QA-1V
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:33:05 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzXPq-0005tq-9J
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 06:33:04 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-836c5b01e82so10878217b3.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 03:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787826781; cv=none;
 d=google.com; s=arc-20260327;
 b=l5DbxXKQd6B4deyNsfJSM0V3EhR+R/jqqNM6qeZfMdF42//E+ZIYRZ6FqOonWN1+6y
 lAQ+Y2s1oFm/uiaRXiccik3Yn+sOPoJtKvm5Ig3R7HAw/hmCvj2cBvyJ9PMYclbfHSUQ
 /3xxlw9OhCCYmqZUJjhCjaI7jhCqa89xxEYzyBDiDk8TdyM0xVoekxlzFwJL42XaKGXM
 /yFuK7jHQ9dwtfzklKoQXsE2v9cN3LCxcpfZUAj2f94Bhg0W6YL03RJBHYGiijSp6TB0
 PB5FkkctGhbKZetbbqyXUddrgcmsftU+YemqZBug3Uw+DvvSY477Gr1fc0JAkiH/YZh5
 0JxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tTrAo6VqK52hX+0Fm7vKdbUYFoLyoSHCxnIpGUABsYQ=;
 fh=5Lqr6aGjjvIzik0sKK2yiMQ/n2st0a0z+62xuS3kA1o=;
 b=dGdW7VivjdlpCecrVSee+M9usdLejpinp17I6+JMM7dVpg8hxtroZAOy5My78BVLhd
 Urd19jRXlyivfAWWYiKcGFxJYHYuc/vt5EMa99JrS5D5WlJldQ1u5U4WsFvfVlogJU/f
 gOsh8X3RI5AQD9dKA1xzUk1FndlmfPVpCPussB5QL/Gr7K5Fl3bJ43IKZzasQ/iIS9Cg
 3deF6j+zEmPwXb9nO2mWa1f6T8f56LE8lJG9p+M5etbJl8nUdBLzk1VRyqTkkixD5aT7
 HH+UUssSTgHCRLI5AWInn8VokCaX6k2BMpUOMVML3VelWB+4I1tDrRqQGlAyNILHNYdv
 b7XA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787826781; x=1788431581; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tTrAo6VqK52hX+0Fm7vKdbUYFoLyoSHCxnIpGUABsYQ=;
 b=bc6FV0pj5n0BoLSs05uc082wo3zvBaDenN1hD2punK4CPaLlbY9Zaa7WRtwpZ1t2kV
 ybDJP2vK2IwtrZULKitRwhF+cBAMgQYNQ0yrKi7mSkK5+ubhEGRvUUQ40TAxir3Gbjz4
 SIyqdpTlUad58z/0DrJSa0tERer9wWNClTJC7RJ0jRa4feH/ExotUoV85GThYZdlkFGJ
 4rCxll/NNO0+h+oTjrZzMpWiOIDmeMZOgkYf68m6Fa4Lrp/z0amgTY/9qpNZKC1cw9Ez
 KpUIEfuGyZ4SlBblUrFB9X2nHuHg3rphtVjxbbBe2HExjKsszJD4wOgwwQ3NCfbXEUsU
 sZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787826781; x=1788431581;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tTrAo6VqK52hX+0Fm7vKdbUYFoLyoSHCxnIpGUABsYQ=;
 b=QUfuO42T6YDpuM5lNu+z1Zffob1CrQCEcciedmsBpM9qKIPQz4avlDt56Bj6fY/0On
 lt/rb177kXKjaDhh2x+T5RojfcNtFU8JbHmBRKsKk3VKR718P9fquaVaHCSmP75Z9jsr
 adQf24U8v6qgdG2aWdsHUqK3hex7PF/u5e/IZT0Q22Fy5LJ73cQTwqBXgC9h6Q0lHl+R
 lqplTffXKY7HVKfb7WllYjKQ/R+79zYSyYOBDzN6exjH9p4tvDpZIaeMjP1QcWnivdH9
 XI299iXcICJRAw9DeeFE+CLrhrV+5yahvKHTltvGP77kePDhoiupfV57XACRF0wa8s7+
 caDw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4sOlp/SuB8Dr684a1pTqA+mAoLrBsna8nGOuzOZIg6K6IJgXDlZjY/AWZTw/K1u0p7JqTFurohg==@nongnu.org
X-Gm-Message-State: AFuF++kwVrE2SHunrbObT9kxXCPs3akxGz1tXNPh/ZpBLQKXVpg+wYFR
 wjOjW8vH8Blo3KCYc4ZKqgxQDfufJiBlbyjHtYGZ01oXTOC4rEK2joDqUZfXJXh1p47K51cKHaW
 Mh5fHcQM0VeOV2JTgZ/qqKsDXf3j6yvNcty1o8qQ7ug==
X-Gm-Gg: AR+sD13na72/zO6mtYQDuXlrGX+68L5Onj4GQEtW4y7quFxO6AGSMdhqa/pReQYi49+
 kIXUo/pFnMA8XY+emEs+3N/1cZ6rJrcKZypYTlTZuHVOFJfQF5Xm7ncEbw43wADnfwnOAGotPFp
 nVRZaOzMZzpwxUZlwxA0PPPEwqcI1ns2oOlZH2sFffDLqf8VTLxSxJX3xMlZn9UqFBj76oKG50/
 Fs7eFGltdT5KIH8AWp6rTZeSpNI0bP12A6vdQhNFaNBKp0eOhV0A+MtVQAswtOF3KmylqOaADwP
 z5kUzNZSLeqgyYkaEBNBAPk+KaDL5eeICG+4qgYKGbZ/aHM/ALcnbJyQhIi2Nf92UXQGPgQ1q/f
 AXf83/Q5Ik9rBreFpjkesgnUDarPA
X-Received: by 2002:a05:690c:5807:b0:820:b01:9d6 with SMTP id
 00721157ae682-8573d39f08dmr56575807b3.11.1787826780564; Thu, 27 Aug 2026
 03:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260825145350.3726466-1-alex.bennee@linaro.org>
In-Reply-To: <20260825145350.3726466-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 11:32:49 +0100
X-Gm-Features: AcwNN1Vv9ig7sfqpze66zeBrYrXp7PaqpjF54_T6hNMXZ7H-_qoGjHaQYrb2tsg
Message-ID: <CAFEAcA-fCT+A8aC7tqpwnXgK22vo_z77P4Yr0GLuNzv1ZWZh6g@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: re-order ARMFault_Domain check for v5/v6
 ptw
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 25 Aug 2026 at 15:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> In the Armv7 ARM (DDI0406C) any walk of the short descriptor
> table (TranslationTableWalkSD()) which has a second stage has the
> opportunity to fault with a translation fault in
> SecondStageTranslate() before a potential domain checking fault.
>
> Moving the check down and lightly re-factoring setting level =3D 2 we
> can more closely match the architectural behaviour.
>
> Reported-by: Karl Mehltretter (@kmehltretter)
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4233
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> I've only checked the get_phys_addr_v6 change against the Arm ARM but
> I've fairly confident the v5 one is the same. I've bundled everything
> together for review but this patch can't be merged as is because it
> does too much in one commit. Some open questions:
>
>   - should we properly factor out a boot_v6.S and share with other tests

I don't care, but would prefer the test case in its own commit
rather than in the same commit as the bugfix.

>   - could the ptw code better match the psuedocode (e.g. case l1desc<1:0>=
)
>   - which Arm ARM should be checked for get_phys_addr_v5

DDI0100E, which corresponds to the 2nd edition printed book version
(which covers v5TE). I happen to own a copy of that, which is what
I've used for the review of the v5 parts below.

> ---
>  target/arm/ptw.c                              |  31 ++--
>  tests/tcg/arm/system/test-domainfault.c       | 148 ++++++++++++++++++
>  tests/tcg/arm/Makefile.softmmu-target         |  23 ++-
>  tests/tcg/arm/system/test-domainfault-start.S |  62 ++++++++
>  tests/tcg/arm/system/test-domainfault.ld      |  17 ++
>  5 files changed, 264 insertions(+), 17 deletions(-)
>  create mode 100644 tests/tcg/arm/system/test-domainfault.c
>  create mode 100644 tests/tcg/arm/system/test-domainfault-start.S
>  create mode 100644 tests/tcg/arm/system/test-domainfault.ld
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index a29de0385f4..ddfbb79beb6 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1172,19 +1172,13 @@ static bool get_phys_addr_v5(CPUARMState *env, S1=
Translate *ptw,
>          fi->type =3D ARMFault_Translation;
>          goto do_fault;
>      }
> -    if (type !=3D 2) {
> -        level =3D 2;
> -    }
> -    if (domain_prot =3D=3D 0 || domain_prot =3D=3D 2) {
> -        fi->type =3D ARMFault_Domain;
> -        goto do_fault;
> -    }
>      if (type =3D=3D 2) {
>          /* 1Mb section.  */
>          phys_addr =3D (desc & 0xfff00000) | (address & 0x000fffff);
>          ap =3D (desc >> 10) & 3;
>          result->f.lg_page_size =3D 20; /* 1MB */
>      } else {
> +        level =3D 2;
>          /* Lookup l2 entry.  */
>          if (type =3D=3D 1) {
>              /* Coarse pagetable.  */
> @@ -1239,6 +1233,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1T=
ranslate *ptw,
>              g_assert_not_reached();
>          }
>      }
> +    if (domain_prot =3D=3D 0 || domain_prot =3D=3D 2) {
> +        fi->type =3D ARMFault_Domain;
> +        goto do_fault;
> +    }
>      result->f.prot =3D ap_to_rw_prot(env, ptw->in_mmu_idx, ap, domain_pr=
ot);
>      result->f.prot |=3D result->f.prot ? PAGE_EXEC : 0;
>      if (ptw->in_prot_check & ~result->f.prot) {

This matches Table 3-5 in the v5 Arm ARM (ARM DDI 0100E), which
lists the priority encoding of different MMU faults. Domain faults
are lower priority than Translation faults but higher priority
than Permission faults. It also matches the flowchart in Figure
3-9, which does the domain check only after loading the second
level descriptor.

> @@ -1254,6 +1252,7 @@ do_fault:
>      return false;
>  }
>
> +/* See TranslationTableWalkSD() in Armv7 ARM (DDI0406C) */

...but note that the domain and permission checks we do in this function
are handled in the pseudocode in its caller TranslateAddressV().

>  static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
>                               uint32_t address, MMUAccessType access_type=
,
>                               GetPhysAddrResult *result, ARMMMUFaultInfo =
*fi)
> @@ -1288,6 +1287,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Tr=
anslate *ptw,
>      if (fi->type !=3D ARMFault_None) {
>          goto do_fault;
>      }
> +    /* l1desc<1:0> */

I think personally I wouldn't bother with this comment.

>      type =3D (desc & 3);
>      if (type =3D=3D 0 || (type =3D=3D 3 && !cpu_isar_feature(aa32_pxn, c=
pu))) {
>          /* Section translation fault, or attempt to use the encoding
> @@ -1305,15 +1305,6 @@ static bool get_phys_addr_v6(CPUARMState *env, S1T=
ranslate *ptw,
>      } else {
>          dacr =3D env->cp15.dacr_s;
>      }
> -    if (type =3D=3D 1) {
> -        level =3D 2;
> -    }
> -    domain_prot =3D (dacr >> (domain * 2)) & 3;
> -    if (domain_prot =3D=3D 0 || domain_prot =3D=3D 2) {
> -        /* Section or Page domain fault */
> -        fi->type =3D ARMFault_Domain;
> -        goto do_fault;
> -    }
>      if (type !=3D 1) {
>          if (desc & (1 << 18)) {
>              /* Supersection.  */
> @@ -1331,6 +1322,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Tr=
anslate *ptw,
>          pxn =3D desc & 1;
>          ns =3D extract32(desc, 19, 1);
>      } else {
> +        level =3D 2;
>          if (cpu_isar_feature(aa32_pxn, cpu)) {
>              pxn =3D (desc >> 2) & 1;
>          }
> @@ -1373,6 +1365,13 @@ static bool get_phys_addr_v6(CPUARMState *env, S1T=
ranslate *ptw,
>           */
>          out_space =3D ARMSS_NonSecure;
>      }
> +    /* Extract from DACR indexed by domain */
> +    domain_prot =3D (dacr >> (domain * 2)) & 3;
> +    if (domain_prot =3D=3D 0 || domain_prot =3D=3D 2) {
> +        /* Section or Page domain fault */
> +        fi->type =3D ARMFault_Domain;
> +        goto do_fault;
> +    }
>      if (domain_prot =3D=3D 3) {
>          result->f.prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>      } else {

This one is trickier because v6 introduced the AccessFlag bit and
associated fault. If we're taking an AccessFlag fault that has to
be taken before the domain fault (the pseudocode does it inside
TranslationTableWalkSD()). So for us the place where we check
domain_prot needs to go somewhere after the AccessFlag fault check
but before the Permission fault check. At the moment you have it
before the AccessFlag check.

thanks
-- PMM

