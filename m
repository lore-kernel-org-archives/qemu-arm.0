Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9EECCF9E9
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 14:03:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6m4-0007ha-0s; Wed, 29 Oct 2025 10:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vE6m2-0007d5-S3
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 10:03:38 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vE6lr-0005eS-PT
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 10:03:37 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-78356c816fdso76743297b3.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761746602; x=1762351402; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XVHZosOZKLQLDSBB4WfEH29Doy7BO183QYOo/TOLziU=;
 b=gWjwKqgLPLzZ4A4Kz4rNMZNvH6b8ph6LvV4IY7F0TnpSBV5rI/HISxtb47gPSr5gyi
 hfbJo6IPkCFibCQUpaPXXygljPIGPG3tLR9ntcRP38W08j85SBf7++/Wg4V793aJ9gLh
 1WrLqHF0XD/HJzsNBljV/JBIT17lzHIDs/Job5OJRX4C38FOl6vyXlq8Mjy2iubHIC69
 4ZDKgESuM/OasliXTsK+FS+faXqxFsWWbTNCO4tu1K8tYBOn19NqjkaJJfihW3IZOZ4E
 QUt0bioDTnqtOjFNgo0W87BdS7vMpPMQi0T09I2k3Nnpzts+VIJ0uceFVjhD6kpS1sps
 NguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761746602; x=1762351402;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XVHZosOZKLQLDSBB4WfEH29Doy7BO183QYOo/TOLziU=;
 b=GgZvx8vVBWKSqoMTuX2weQsDo+2F74croQhU1OeaGBJ0hqDrWxZV/LbXjDlKfQB9tF
 40SYAOA3XB/58PgXWGsnNOh+U04kCMely2t4zZGgvCUTTmJUXKQXMuwGzZdWM7F9y7La
 My2lje4lkOpBJVVTZOlpxddfKKGXAkE7c36AjXSxlgmz5gQN5nYhOiMwl5LwzerYW9fw
 fMCmZvAg1QuiIKjTDWqkgCD/fEPTvODC+7LgPsAuOWFijmgOmzkuaGXHxxd9WD6CzgjT
 4uxTpHIZQj+ICyqFzK8CgqtafJJ/Kq5I+xyXx1uv2/ZOZxDu1iHWDWrQN1U73uaFu9yr
 bq+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3FF/vLf4XmhDWshmzVG6vNniWKcsIplruMQvHpkiArlCm4cQukYX33LYoZzXHbZtgycye76nNDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyb/Rd5OGRGSG7dJl4kvYMxj4vUT2LZDLno2MKXTv0ObN8TACBV
 Ia7qNZA/rbYqLu6AtSyZa52MFtlCppDxQ3MaTgiz2653UvUejHB9mi/7TewURdiDX95NQKiPlK1
 Z3qd8Z4FNbTIiKf2h4/9MLX5SyRV+M12EBiHOWPSwBQ==
X-Gm-Gg: ASbGncuSoT/nYoITfB3GGpa8lMWU+JsfvPPLDdzJqimsBGHPKwdFFwe+dU3XcIht/vm
 bVpzZHBzjoUdfFYAGjtF9OT7Yu3fSZzCfQKFBpVOcKmj6T3L6y6HuJO1zISO1MgC/sQuHLJrzTt
 qY54WJRAJPqXBphrXHUDWQxP4u3mHzIxcZezpxWEHz/qv9ucIKO+Evy3hb1fSTHpkoeR6e9cIBc
 0NJkCP35mJOfpbBuP+gHkxExLPNiwTe6gM9tKQtIJ9qpZ7cgaDgSrFHbROuac9+jgS7l24y
X-Google-Smtp-Source: AGHT+IHCBn0qMuKL9T2pmP6ijud2waWsD4x/i1/J3VVt0+RwSTfweEmL+e5eiOPh47PTgzFp2gozoC2QmjA5Ka+pw48=
X-Received: by 2002:a05:690e:748:b0:63c:f5a7:401 with SMTP id
 956f58d0204a3-63f76defd87mr1999386d50.69.1761746601622; Wed, 29 Oct 2025
 07:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-25-richard.henderson@linaro.org>
 <CAFEAcA83Tgv5CV+EjMDemEb5FQkfAj0en7dq1g4JkxHZ1kKOdQ@mail.gmail.com>
 <3cdafcc5-dc91-4612-b53b-8b6ad92de7b2@linaro.org>
In-Reply-To: <3cdafcc5-dc91-4612-b53b-8b6ad92de7b2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Oct 2025 14:03:08 +0000
X-Gm-Features: AWmQ_bkbdc526swJFCPWOz3iQfiOLz8-lnTCZf_5aVV1P3e70AWvfkCr6K22T3s
Message-ID: <CAFEAcA9QXnxySyD7-DGqVN3pUHafJjgFuk3f86aRBu3nL_MoBg@mail.gmail.com>
Subject: Re: [PATCH v2 24/37] target/arm: Use flush_if_asid_change in
 vmsa_ttbr_write
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Wed, 29 Oct 2025 at 13:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/20/25 16:08, Peter Maydell wrote:
> > On Tue, 14 Oct 2025 at 21:17, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Only flush the subset of tlbs that are affected by the ttbr
> >> register to which we are writing.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/helper.c | 19 ++++++++++++++-----
> >>   1 file changed, 14 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >> index c6d290ce7c..2b55e219c2 100644
> >> --- a/target/arm/helper.c
> >> +++ b/target/arm/helper.c
> >> @@ -2943,11 +2943,20 @@ static void flush_if_asid_change(CPUARMState *env, const ARMCPRegInfo *ri,
> >>   static void vmsa_ttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >>                               uint64_t value)
> >>   {
> >> -    /* If the ASID changes (with a 64-bit write), we must flush the TLB.  */
> >> -    if (cpreg_field_type(ri) == MO_64 &&
> >> -        extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
> >> -        ARMCPU *cpu = env_archcpu(env);
> >> -        tlb_flush(CPU(cpu));
> >> +    /*
> >> +     * If the ASID changes (with a 64-bit write), we must flush the TLB.
> >> +     * The non-secure ttbr registers affect the EL1 regime;
> >> +     * the secure ttbr registers affect the AA32 EL3 regime.
> >> +     */
> >> +    if (cpreg_field_type(ri) == MO_64) {
> >> +        flush_if_asid_change(env, ri, value,
> >> +                             ri->secure & ARM_CP_SECSTATE_S
> >> +                             ? (ARMMMUIdxBit_E30_0 |
> >> +                                ARMMMUIdxBit_E30_3_PAN |
> >> +                                ARMMMUIdxBit_E3)
> >> +                             : (ARMMMUIdxBit_E10_1 |
> >> +                                ARMMMUIdxBit_E10_1_PAN |
> >> +                                ARMMMUIdxBit_E10_0));
> >>       }
> >
> > What's the value of ri->secure here for the case where EL3 is
> > AArch64 and we're in Secure EL1 at AArch32 ?
>
> Um.. the state of the cpu doesn't apply.
> ri->secure is true only for TTBR[01]_S.
>
> I'm not sure what the question is?

If you get into this function because of a TTBR write
executed at Secure EL1 AArch32 (where EL3 is AArch64),
what is ri->secure ? That is, do we correctly flush for the
EL1 mmuidx, or is ri->secure true and we wrongly flush EL3 ?
(For EL3 == AArch32 a TTBR write in a Secure PL should
flush for the EL3 mmuidx values.)

-- PMM

