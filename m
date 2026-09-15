Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE0BC88E53
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 09:27:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6PRZ-00029M-1m; Tue, 15 Sep 2026 05:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6PRU-00028T-7G
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 05:27:08 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6PRS-0000dw-5y
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 05:27:07 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 00721157ae682-85d43f9b119so565577b3.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 02:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789464423; cv=none;
 d=google.com; s=arc-20260327;
 b=awo96QBgb/Mro10O0QdjkHpKDjVnem3BZFFzGmxG77Rm53qWNTnbQA3nK1gFZvPqYn
 nLsSihVw8yZrTJtzt8k6jG0bIdBS22ShYp95f1sSQNHZUcrE4lHxmDVyrF3tOO9TiQsK
 I9375Bvddxz8d/43tLMjaUhoMAzc8xApqQMtysqPwp2VjE3Z+hR4CSDPiN26Pa/VOPAO
 guQbzIOaotdm6QKWxR9rB+aA421UimI6X5q96cmtTtq1H2RTmgP/pH3sTs11vPFqeLaV
 NLsSMJln9AHEpEXyYKyb5DifyHNJIoCxxVmemsXWrr6m4ToaIfeKpfb0c7Juk0LUaHnA
 wLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=kJWLKjp4GOGXCfPOZ+gsvRnKFTOaquGm/0+TVK09fuo=;
 fh=j/yJ/kbXNwW7QSvRxfPXoziZrqlhreJxQHXNq7D8Pvk=;
 b=n45DAOhnxZa6vY3xOmXAIONXlbKjfGMirhyJKeCWirc19W60IMjlJcJdnIOWATBY4d
 Y+6CDrXm+v7QGTRIo6gUuo5c8KOpVg9CfArFUb+AQuO9TM7hNe9EqgSS3sk//R+AxCsj
 zh3txfigD/jTzB7IW0zu0FuCeNQ6Fauwo90N60Q4ACiUZsnol+l77QrY8l0e4GwdNFX4
 1Bv1mTa0bKzQq4xRNDfSTtkkhKsyARcw3FUhYmL9AIStkpISxjsjGOw8OyA/eCOJ1F53
 H6/YNApBKof/hsvCSkV310cwKZCrr8Z2Zw1owZM8hP1cszyn/7OAuX2S0hIupqF5kZqm
 IuAw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789464423; x=1790069223; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=kJWLKjp4GOGXCfPOZ+gsvRnKFTOaquGm/0+TVK09fuo=;
 b=ccUzhfoKc5/nhRFZ27FiYF7ZECpRc9R3/mE00p4EuYot6Rn8LxUxM0RTxsC1mu3lav
 B4q4EVE3fKrO55suJaO/xA4fwYZVhY0k4jfMMTi9Y5yifRJfRUGGGLO4lcD2zNtxzdM7
 2Qpe5QiyNp+g7+Ymvwsu6ei0urXe4Tw+Pr9pwvBOCOlZVFDWh1b1gmXutZs++/Y5cZ42
 SPqhGe8eovbKq9KRyL7wT9qZhHrc+d0ySkKJgoUot0OBN2Ese7bMrOVuqA+pIk0EGNF8
 fB+OpVV6tu73T+slzvM8j4Drgj39FR8CHSdGRN6Ljk69s9eGEaS6lNTyvEx4zqYTIvyw
 dSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789464423; x=1790069223;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kJWLKjp4GOGXCfPOZ+gsvRnKFTOaquGm/0+TVK09fuo=;
 b=XWsKRXd+Y0lk7gy8Qsj8ELXchn96afLWo1w9Qrvpn51MtvXAxtUjoNC3lCRrr44pMf
 JEztmpUIyBtb8nTOaNWHJ9cLSdVJyQBG/Yh2NM6L/Bwom6c6YZkiw3yNq6f8wod2tN4h
 yoGhJwaGtpJSVOdfvrYW3mUi1oTK69zvMgUOhGVjKIjCA97TB3c47C5R/xOYIcGxKKr5
 DB1wd7mnHeUEYmKcQzCfAWUbK3E+iq3WXMdqLTaZSxvHBdLM3DrXB+Nb+7umnq7a+9C3
 X33Ya9Df+fi9G7V4p6ugjFdMpses2R8PZifi0gBBvY0LI0dCr7q4eJ0mzJL4eQtEn1iq
 2tvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzxS+xB+gtEEfjK5GxyTvccPH/59kVC55kIQZ+v81M7pjUOmlMX25KTLxnNrADbfnrJNd3utGjcNA==@nongnu.org
X-Gm-Message-State: AFuF++kQM6mVp7vgu0EZvjifVyKEzlt1eOYobZFFjZwGFoP4DUaJNbFx
 1pb3+X/LXUNoV/hMOGu9zLeSSl+OS/R3/WfFtkWtsu90v66bV3iQVV30YBb3loeHoFI97iIwsVz
 gK4Q+rAq//XXxDmk3Gwo2idyqH/RJaAqzwW6RHSNRsw==
X-Gm-Gg: AYBFou0X5Zwb5sAeT5xhVhULB7wLoO8A/cfcM1qO6TsRi5MfQHYv8jryuE3gqyYSTHj
 hU54O620C7sN5BAdKDaiVbshnweeC8/6Pf7yRSJqO8SLutGFcgguiSuoq77GwFRbk7DmO27ED8P
 xmVt3XukjrTJt6U0TAU1Nc8ArbUmNSSg4wDdt/2EYwApk+dLqAHmzohMPt58UwK8D+wtV24pmjm
 hs6heFlH9U6MY+qEhnWAleT4G/PtasqSlPwoaCfi3PCn7hHEOu6PnJ5YEeQ1HSmMWqh25XxRO1j
 TC3i4ljYGp+PAmx56e5gI4+XL2urd1Tvf26QNAHV7eSP0tRKKR1RqCSyPWyanu7lNEovyb51Xmc
 +iLouqZ7EUrutm9XcVBAEq2FLkjhhXtT+9bhGX/0=
X-Received: by 2002:a05:690e:4007:b0:671:2d01:48e3 with SMTP id
 956f58d0204a3-6715cae4336mr73774d50.29.1789464423154; Tue, 15 Sep 2026
 02:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260806173123.333423-1-richard.henderson@linaro.org>
 <20260806173123.333423-4-richard.henderson@linaro.org>
 <CAFEAcA-NoW=39G_m21zQO6CzH5UU3MnsKuFNjkjX-55gzXqD2g@mail.gmail.com>
 <a930c1b6-dd93-46ad-9e61-eafda9dcaac9@linaro.org>
 <CAFEAcA_-UwXB9svLsFwJRfe37+CkwkRHnNVoWDScTEL=L4uOpw@mail.gmail.com>
 <72dd2ada-3b4d-4563-860a-86bf6c6a8a90@linaro.org>
 <CAFEAcA_7eYjtgXVidEMsG9ztZf1Zy8A4Qip_baSGxdNRQQKj6g@mail.gmail.com>
 <15c1d593-588a-4ab3-b438-a499cb719e7c@linaro.org>
In-Reply-To: <15c1d593-588a-4ab3-b438-a499cb719e7c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 10:26:50 +0100
X-Gm-Features: AcwNN1XhtbqxObq_Uf9i_Om4OQJn4NbS3djSJbfPlZr0wSbqJOOKR7TDFVcFP6U
Message-ID: <CAFEAcA_mFoYgWu4e9d0OpLqudy6Oi+C6vPTG44o8o1AUKSCd5g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/arm: Implement HCR_EL2.TID3 trap on
 undefined TID3 registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 14 Sept 2026 at 19:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/14/26 08:21, Peter Maydell wrote:
> > On Mon, 14 Sept 2026 at 19:12, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 9/14/26 07:51, Peter Maydell wrote:
> >>> On Mon, 14 Sept 2026 at 18:21, Richard Henderson
> >>> <richard.henderson@linaro.org> wrote:
> >>>>
> >>>> On 9/13/26 23:16, Peter Maydell wrote:
> >>>>> On Thu, 6 Aug 2026 at 18:32, Richard Henderson
> >>>>> <richard.henderson@linaro.org> wrote:
> >>>>>>
> >>>>>> It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
> >>>>>> within the range which are not explicitly listed.  Previously we chose
> >>>>>> not to honor the TID3 bit.
> >>>>>>
> >>>>>> However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
> >>>>>> on these registers, so we might as well honor HCR_EL2.TID3 too.
> >>>>>
> >>>>> I thought we agreed not to change the behaviour here? Is this
> >>>>> just a "forgot to update commit message" thing?
> >>>> Oh, yes.  Because I did update the code to test for v8 in translate.c.
> >>>
> >>> So what does this patch do? Is it just a no-behaviour-change
> >>> refactor so we have a place to add the SCR_EL3.TID3 check
> >>> in the following patch ?
> >> It does what it says on the tin -- it honors HCR_EL2.TID3 for undefined
> >> registers.  We currently only do this via access_tid3 for defined registers.
> >
> > But there aren't any genuinely UNDEFINED encodings in the TID3
> > space, are there? The ID register space has to RES0, not UNDEF,
> > for reserved encodings, and so we have cpreg structs for
> > all the reserved encodings in the ID space.
> Since we don't do this for all arm_cpreg_encoding_in_idspace(), I
> assumed that we didn't do it for all arm_cpreg_encoding_in_tid3() either.
>
> Either that, or we have existing dead code testing
> arm_cpreg_encoding_in_idspace()?

Looking more closely at the Arm ARM (DDI0487M.c section D23.3.1)
I wasn't quite right in vaguely referring to "the ID register
space". The whole Feature ID space covers:
  op0 == 3, op1 == {0,1,3}, CRn == 0, CRm == {0-7}, op2 == {0-7}
The "unallocated encodings RES0 from EL1 and above" and "TID3 traps
apply" space is only a subset of that, where op1 == 0 and CRm == {2-7}.
For the rest of ID space, unallocated encodings UNDEF (or trap
as "sysreg trap" if FEAT_IDST is present), and TID3 traps don't apply.

So we need arm_cpreg_encoding_in_idspace() for the areas
where unallocated encodings UNDEF; we also need it for
the "access from EL0" case, which fails the cpreg .access
check. But we shouldn't need to jump through the same hoops
for TID3 traps, because they should only apply to the smaller
part of the space where we have complete cpreg struct coverage
and the .access trap doesn't forbid EL1-and-up accesses.

I think the upshot of that is that we can just add the
SCR_EL3.TID3 check to where we currently check HCR_EL2.TID3.

thanks
-- PMM

