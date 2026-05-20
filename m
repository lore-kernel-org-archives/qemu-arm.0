Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E64DCD4F54
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 11:49:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPfQV-0002HD-5k; Wed, 20 May 2026 07:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPfQC-00029A-Do
 for qemu-arm@nongnu.org; Wed, 20 May 2026 07:49:10 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPfQA-0000Mz-4V
 for qemu-arm@nongnu.org; Wed, 20 May 2026 07:49:07 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-82fbf5d4dc2so3301193b3a.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 04:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779277745; cv=none;
 d=google.com; s=arc-20240605;
 b=E0aiUhXhYtZLWdOYZR+KJGxm8NqRPGd/Epvfh+EaCne3a4uMOCYe9giIQaoQBjtxPR
 VorYnimCsyeWNTnBuaKDUeVtLmIOHdGSOhAaxabeHhitqdlTUIP7/qF51/KQi4SpgY1x
 nZUnp6lA3QB4noC+qNTQHYCyjBGZFWb8rtCVksrxQNzQahslm6EoRi/FUtceDMiWzQe/
 6Wvq8L0ZoLZ0ONVcjKC1qmvkGmF71dxyo2JxYz2qzIkATLhYBl8JGOFG+jzTxzAiQnPL
 6XCHFrUa3AIVYHaQ31jcpGIWczfyr2cjAsy+CPioUxQQfAltdY+JSn9nRq/FiHtciz/8
 Zr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cgQLGJS2bx0nRDlaTWldFNCGHt1mi7S2SfWqqbh07cI=;
 fh=jgiq1Wn/pS+wW8nKsKjJhlf6KqiNY4DPB/CnKIjljLM=;
 b=Z1s92ttQoCRpxW9AtWGfF2tXoZXytWvrkqCJT38atB10QsAmNdXXQuToSy1qmciiFy
 IUHzdJGWUOiInB2Y+8MnymymyfPPQTO+ygLGoInpribLvbLYepKPT4FaCsTmKrBsv2DB
 TstXsMrAQb3kbXWFvsWv9qYL+d2XeO447U5Iuf5PMX+psWjrZY6koBETuORiWsCXbjCy
 UZFnvEBBONpFZKnpeu/93NB/ZBkI+x6vqxkmyuU+c9WHnmITZzqAeJAw3amc2ydKrDbz
 JjBStUyKtH+Bb/1DGxm9x3DIcQAhF9St1oGK23VRDvtJ/TabMKIyKMMP8wnF9pY6ND3N
 CrmQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779277744; x=1779882544; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cgQLGJS2bx0nRDlaTWldFNCGHt1mi7S2SfWqqbh07cI=;
 b=iJI75QO5cJcQj48Ub949Juj023uZEXz1TupFQMlW2+iBFPupePWl3MEoym6ZXTUQ8P
 xSjtI1IrxNdc0Oqti0cxGYEekHFV0XJpLh3dwvcor9+T3LaNwi63vOhuYLXy+Ol5FdBO
 yECutDjIqQGf3DKnFLu8Y1SIO7auU5Iz6Ib4hfGctWUt4fVcWjQo9t1RciHgipv+fwZ2
 cqnpCzR1O3mcIAj+g8T0gtNLfxrkWiDvMDr5rvO1VjXiYQYyZy9YccCaZMhO0VPygUds
 B9ZGnIwSA8NhCDOcgnN23BKMxznB22LSMz5VKQzbf2ZsTX6J7RvJJ7P2PHNcCoD35Q5k
 YXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779277744; x=1779882544;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgQLGJS2bx0nRDlaTWldFNCGHt1mi7S2SfWqqbh07cI=;
 b=NJ3L1OqNptszn6cH03iYI86dlpnuxvGk4fIZr5xFlBh4LfXUxLEXh7EwOIYDthVmJq
 2CpHI8ISFkbgJ6k/uIvCYCVv3hknj5ZJSCvfDH9oLokmPS3cZhZYdHe2TrAgcbMiooEy
 +wL/EJXPAmxfiH48hE25KQS9lz+kDJjxESTblTCRaJ1I6zp7DA/knT51iMfkX06nKuub
 BnUapbrEqdHD3/Fc3zF5OokTFDUR5saey2l15gVRW/EwI64PIwDWKYm6N8WQLZ4oqEPL
 uR89knbJcXyBedQLlIFaG2RQN1gKvCdBF15q+ButPFV2qRzV8B9tqrdiLddTyb0NFjO9
 I1EA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/EjcqzJ6Bj+kuq4+PXhVmdUvcmy//cU369WLiBtstUoHVM0zo9kPDHBqRaEsotIo+IHXBex4dWbA==@nongnu.org
X-Gm-Message-State: AOJu0YxIOwRKTFia+QPrw5S51GU8Ybic4Z+FpMGt4ZGj7H8mwwQX0ruo
 CJBGg56Ba1V55UczfGyB+qBZKm71/aW3mTL6j/7LA/IQnJdoTdBBsw9oH8wrqYc+WWlFay4emQZ
 WWFFzfZGj+DmCq0e8BWIhWsLjsq4A96n1YlW6O4EYdiZJPmU0bJcU
X-Gm-Gg: Acq92OE/TDEaOYt4mMAWv/FWdxzh/cYdAM0eXKjXhtlUhvpF+BoZBKK38J0oUyrcdEw
 p7NrFCK2OiuwFG1M8Wi2MYACtwQYg10rHIPW3SWLI/DcOR9WRBoKXzHUAyrqWJyB1peonZ6T15s
 2NCrFO8AWsGgTX8ldZtitfrWTGISUN+Or9F1FtDweNXh2JniC3MORYyihiSMIB+qFFmmLUYZJjp
 9lk7DeT/0BUrXR9SlunFRAZmR9GidkSjobbIuhsVTvME4tCZmhDZTNUVWEi0WJ5OPcR0+sczXh2
 ryIPwQE+BZI8ZZyaeFMj0F/eY6mW1+nQ97GKpSHGDtZKzUlMTxX3Nno1AxVmInBUp80=
X-Received: by 2002:a05:690e:2501:10b0:654:28b9:e50 with SMTP id
 956f58d0204a3-65e227f64f0mr18793325d50.40.1779270580592; Wed, 20 May 2026
 02:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-46-richard.henderson@linaro.org>
 <CAFEAcA_4wU+wndbAqjnObpvnLit11OVDZvTZ1RWy_q0cNfH7uA@mail.gmail.com>
 <90811f89-79a0-4e34-b6a8-d349353620f0@linaro.org>
In-Reply-To: <90811f89-79a0-4e34-b6a8-d349353620f0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 May 2026 10:49:27 +0100
X-Gm-Features: AVHnY4K4eDIayRiNmqGf9vHMCbHzDTi64krvFk6dz5Y5kxjDxEJ4Xzt59IRbbfo
Message-ID: <CAFEAcA8777gA7i_Mywr25QfNVJVFLTDdLMk2en=QPsD8v9NyVg@mail.gmail.com>
Subject: Re: [PATCH v5 45/63] target/arm: Implement FMLALB, FMLALT for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 19 May 2026 at 22:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/19/26 06:41, Peter Maydell wrote:
> > Also, I realized that this squashing mechanic means we can't do
> > the handling of invalid input formats the way we do at the moment.
> > The float_raise() operations done by fp8_invalid_input() will
> > get squashed for multiplies. I think the fp8_invalid_output() part
> > is still OK because we only use it in the FP8 convert operations.
> >
> > We could perhaps have fp8_mul_start() explicitly check for fmt1
> > or fmt2 being fp8_invalid_input -- it has access to the real
> > fp_status so can raise Invalid and InvalidSNaN there.
>
> Here's the thing:
>
> FP8Unpack doesn't raise an exception itself, just sets fptype = FPType_SNaN.
>
> For FP8ConvertFP, we then explicitly raise invalid and return default nan.
>
> For FP8DotAddFP, we notice nans within a loop, setting any_nan; after the loop, if any_nan
> is set, we return default nan but do not raise invalid.
>
> So I guess we don't need to do anything special during fp8_mul_start.

Yes, you're right. I read the FPMR.F8D text about raising
Invalid and assumed it applied also to F8S1 and F8S2, but it
doesn't -- invalid format for source merely means "it's an SNaN",
and doesn't explicitly raise Invalid at all.

Also, it looks like "treat as SNaN" and "return 0xff, raise Invalid" are
both merely "implementation is permitted to" choices (that the
pseudocode takes) added to the usual set of CONSTRAINED
UNPREDICTABLE appending options for setting fields to reserved
values. So we don't need to be super picky about what we do.

> One thing I could do that might be slightly clearer is
>
> static FloatParts64 fp8_invalid_input(uint8_t x, float_status *s)
> {
>      /*
>       * Invalid input format is treated as snan, then one of the uses
>       * will convert to default nan and raise invalid.
>       */
>      return (FloatParts64){ .cls = float_class_snan };
> }
>
> What do you think?

That's probably clearer. I guess.

Maybe have the comment:

/*
 * Invalid input format: we could take one of the usual set of
 * CONSTRAINED UNPREDICTABLE options for use of a reserved value,
 * but choose to take the additional option provided by the
 * FPMR register specification, of treating the input as if
 * it were an SNaN.
 */

and similarly for output but
 "...of setting the result to 0xff and signaling Invalid Operation".

?

thanks
-- PMM

