Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp32808lfo;
        Tue, 2 Feb 2021 03:30:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlhoxiVa9xo8kGAk4yqEsInlR/jm4WVrTdeIu3ePqZ5BULP/loUTfqPcTl37OYqlr0nluO
X-Received: by 2002:a25:414d:: with SMTP id o74mr16273652yba.471.1612265409370;
        Tue, 02 Feb 2021 03:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612265409; cv=none;
        d=google.com; s=arc-20160816;
        b=p7g9OKmdlqqLfhvg0bA2S0PRTac17ZY4WJ0UVzLB6+OzQoSARz92WssRTWNuJNwOqs
         3e78O1ezJUrw5ueMIICdxkyDdb3A3w+8wP/hrga0jCr1Lfwigw6cJmcmPkR0Sj7bRrdq
         OYO3xiV/6fL7LHSsI9xTsv1HlqvPx0bmyYtamYG3/qiL5h5WUE3IsFPUeIEQfXTk930+
         kKykCh6z2uaDuy9OgffD3/o8+dtGBZz5YEsxznV6jQghfa3eKUOLFogcApp7ZmhmtGkl
         4bshnlcdRodNmPfaKeLDVuLo26RJisDxU1DzbRLR7gjhrhCVS1t7+66CShlik2uiewrO
         aPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zALBmpnGgo0d/DDiUZKTAM0QqzlB5QbytAECdBFd0RQ=;
        b=y5/dkUQFXvLlXQRxIqzSsfhSQ7B8+ig5XiRupkzAAMusShQVkXLPK4T+f07RyoaARr
         OGga0d8b9CYW50tTgzICLiJD54O/jNRh/c78JL02ET3vSj1vz/9zbWX5pCrCTxvvE+se
         oXJlKrhx2FOFsGBxDJk8osQxZpdsS8u1UkGXDqbcd50gsUPh10iWlavtrNAFwHx52XOQ
         gNiSGBb2SZcJDYI13/j2C4wJm0rA66lwzCGeonWeKBcNHp9SQW3X+/zpY0In0e0sZDUu
         7k8LYFmzbz7lz2+aZj146TjJm0hr4kjx1eUPBzeawZuw/oqfrTjzEHDAf90NCPoYzQBb
         1uJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tyeD8txQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si23209586ybh.74.2021.02.02.03.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 03:30:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tyeD8txQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6tsm-0006Qd-Py
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 06:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tsP-0006Bz-PM
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 06:29:45 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tsN-0006hL-0t
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 06:29:45 -0500
Received: by mail-ed1-x534.google.com with SMTP id c2so22444357edr.11
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 03:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zALBmpnGgo0d/DDiUZKTAM0QqzlB5QbytAECdBFd0RQ=;
 b=tyeD8txQZtiDMk6lY0q9mMzIHAMQP0GTH41WWyItVXIkzjPmlKG26ZYrCWLjkRSJS+
 WBf3eg8hSKdEEJ0FAbPT5xTmhnyCpN18lhPjs9wpojzCroitW43rX3d6Ag3qlyPPTdHV
 BhpiUW1N+zZ3anEyU7EtqG2oy16/NJ1B3BGnzf5XXprtjCeC9JT5/dV7R8aBlMX8Qt4P
 vJ0XShlZrhF9X7G6q88bUTpiLJemDyKOKvrbMKMR5Cn0rRBVpZyS52Z7hNxhrXQBXf5j
 pYR0H9O/UhCIj8xMt1FNyEb6aq5CTQDG9cjCtbhXS6naBJbLGvXi7PaGCiaYAF7arZh/
 Sy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zALBmpnGgo0d/DDiUZKTAM0QqzlB5QbytAECdBFd0RQ=;
 b=B9KzE3Ks5Or/G7IELM2Pj1U3wTuRs/YhDO1gf8b2TioBg9V/MhU53uubuB+aSoOy8h
 /++wjgzYMJahwzM8Qp++z9/v308aaciJef0WpGxG28d48W/gM5EFaL7QO+phtPuuf8L7
 K2YHUtYlTlXY0Z5ibvehHRy1yc1LRylbw+Se3dPlPfdHoj95xiXwiYE+5DbCivi2JHVH
 BuwF1gSBMolE8bkw5FBdeomQJO+fAY2kEbvd0QEDEZUUmLXh7pUhK0VqEzYGsai8IEGs
 sbWSEga1Jgggffs9B4fAy7WMy/MMB29tTW3wUvDVu9liuAywP9qkiDUoXqS2CwniR/zg
 Zv4Q==
X-Gm-Message-State: AOAM5323grdJYIRhDRETTw5IPo8MXjqyG/MNZLSYIRV6Tlym1ztB8c21
 oJV/HPIKo6nDSh+811gLksfd9aHa3hLSevNCYNTPmA==
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr15242663edc.146.1612265381036; 
 Tue, 02 Feb 2021 03:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
 <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
In-Reply-To: <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:29:29 +0000
Message-ID: <CAFEAcA9Wi+jSPEZa2Thft1Q899VW0YyHB8Cb+U86m+WbB-Ns=w@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FTAaq4fV3JbS

On Thu, 28 Jan 2021 at 14:31, Mike Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
>
> Fixes an issue in migration where the reset value of SCR and the value
> produced by scr_write via the writefn for SCR_EL3 mismatch.
>
> Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d2ead3fcbd..e3c4fe76cb 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5785,7 +5785,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>      { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
> -      .resetvalue = 0, .writefn = scr_write },
> +      .resetvalue = 0, .writefn = scr_write, .raw_writefn = raw_write },
>      { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> --

I think the problem here is not the lack of a raw_writefn,
but that we're not handling the RES1 bits [5:4] in SCR_EL3 correctly.
Specifically:

 * if the CPU is AArch64-only then the resetvalue for SCR_EL3 should
   not be 0, but 0x30 (but if the CPU has AArch32 at all then it should
   still be 0)
 * scr_write() should not be saying "force the FW and AW bits to 1 if
   written as an AArch64 register". It can, but is not obliged to,
   do this if the CPU is AArch64-only; it must not if the CPU has
   AArch32, even if the register is being accessed via its AArch64 form.

This is because RES1 has some complicated semantics for bits like
this which are "RES1 only in some architectural contexts" (this is all
defined in the Glossary entry in the v8A Arm ARM), which basically
means that if AArch32 is supported then the bit has to be reads-as-written
from the AArch64 side.

thanks
-- PMM
