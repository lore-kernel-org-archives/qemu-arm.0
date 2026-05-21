Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7222ECD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 15:34:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ5Pv-0004ye-Do; Thu, 21 May 2026 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5Pt-0004nW-KA
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:34:33 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5Ps-0001cR-0S
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:34:33 -0400
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-90d1f03238bso687774885a.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 08:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779377670; cv=none;
 d=google.com; s=arc-20240605;
 b=TDHXsNIQ3ssAUsr6AVE3aeW06ELRzmlORr/UIabU8gKcpiDGEytA/F3xuRCUwmqkrB
 TWbdHUrQk/fhNDRlSj+KraRyDtihCOrl7lrnMBhlGok3MzQai1msl88JmF40qQE3d0eu
 p82cHFYxojJwY1Z+liucVAgica3OszfNHyFSg8037Bm+RuT6GSPj33uDVl0iYqbkKln4
 FRGJa7iVliW8QwFQ0hnLSylaTBQKsD8/GbJPUuTyx5Tm/hcKh5B+OGoA0V6LVA+mHLdV
 KsQPDfEotkdfbMJCvcRWOxDZWciBGFblpFwZS414eb8pwo8lQgek4/JhRCw/ijTYL/Dr
 QJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=peDINXBxcKWQYjVspnPJmH/goNDZV4Xd6bFqDbTEs+c=;
 fh=1gFsNVOkCaFtF0s4XFuQFGkH67ymas30vbUqz+gqXv4=;
 b=gRi0c7qxkTCpn7sDJfyhLoYS3dgVDS7ey5QShkdhIsmXVMR8UQ+ImndwgBNdLyx1bj
 biG/yRiNZaWG4zOrZb2XbSjtrgpEV1UIproFrpxUoDiBSteIIgNyuhZ+kJR1tMbsBePa
 3+fiBiLaPhp8dSw1hg74Aj3rtcugmoBOPtxwArqpxdQJ3Lu4rt8+tPkkSha0tE4CTpkc
 looM5WGPhV9rhvwuskrajP9Uk89tkkgKUdzce1RVLhhbjvkBZ1TyRge02i6W+TtpG1uX
 lp49W0fycerTZwJOR4c1F+oUtgmW8aHiYoaDQd8oE0AoJUBWu2t98M3nS1Cxq14MNRKN
 1WSw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779377670; x=1779982470; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=peDINXBxcKWQYjVspnPJmH/goNDZV4Xd6bFqDbTEs+c=;
 b=NYUkJ28m2cc2neHa5UhET7LWfBwrKChvVmGTRitqYVhkBbB18brfbn+SgDXOZiv1+l
 yerDQPzfrTrazb+tVmwq6Gw+GraCZnVtJ/OBGrnf1WqWdVzVr0WSCc9+TyUu7Fg1QaSq
 r8NFEpQG3UTjcYs13O/xLNydFdV7HpSDIODkfhgaliIdI6hmTdpGEwqnZQYN39kYiqhi
 455VJMT6lJqcT6G/16cChYnRtnL6g2/M3ACpyozeBmIBRepf3ecd0U8OAjp3gKkVOWj+
 47p4tjFmUBVN7QGYw/ucvBa+Z8bUIB46Wi9xe9g2AOxqwAfwvYsK1VNIpgeq9wn401I4
 khXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779377670; x=1779982470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=peDINXBxcKWQYjVspnPJmH/goNDZV4Xd6bFqDbTEs+c=;
 b=qGwk7YRj23o0nfFwK4IE8zp14kRlXU089cN38LqdPkFvc1BZJrFSyD8CCaRjgjyoMo
 ZwoFjBv4TnuBqP4LVaqSzd8ZS7KMhUHPgyT1+NiNwH5uoFFOhh1qK6D9fZJvALpJHLYS
 lgh/vM9Nbqy3z2zvk5ZUZlOTltFtHOxl3ZQ1mMM6IHNVjOyiydaHxF/U8jzxGhrD26Qy
 4l8T+yVXi2XCYP0baWVOc1AtL4mxYZS6/kDfWQjVYq5xmJYi7UShTH2QZg11FnHi3bhI
 JtvsTjLmQPijv/7tgWDGTtjdhJiook1CqSSF5qVvpBTAFaK9fFMUXHP0af2YEb30TJGG
 NvKw==
X-Gm-Message-State: AOJu0Yyd7nfQjq0nY0Bpx0MaDx9ush0a2FzJwiFVeeEtJlMz65pmiDn8
 5UwHP3bcvmBFsVoa6ngAPJJeZlWU1mCqjMtTQUdKSXmKcRjgiZcQxjzjeRpBbTOf+oibpSo17lE
 hjim9vzYqJze5qTa71CWxh0JIdde899cpr7aiZd4r0SYopL9q9khDk6E=
X-Gm-Gg: Acq92OGl/I35hLzg19qlZm7f+Mw9QGpdLw2ZgVly/vXU1kbZmGMlHVwyT1pls7ZUqq3
 N5GUoSJK15CfXbRkW8VmSz+qhVCLLzK3Sq/fipd17WtHpfpW2WWC1Z3h4/aTg4LyDsdSBgY7bvL
 4uBa4eqXkwtrIxuCKkF6yzFcZyuuZTe8us5wBoAHKF3V00dnVR/6VMF0pdN9PJ27tobfnpDpLSG
 izaBxFYSOgj4/wrM7uplceAsnzESHDlBS6aMWTV1U075ohJtpqIb2jnKFj7MZ7q1Zt6r7L/0v2h
 hs+vERq7V5/q+Z+xjnrsW3pTrrDRefnMjVJ4B9UcGwHnsi2qBhiP332/HDkaHLepKrA=
X-Received: by 2002:a05:690e:4106:b0:65e:28f3:4a51 with SMTP id
 956f58d0204a3-65eacf4c084mr2450181d50.24.1779376891622; Thu, 21 May 2026
 08:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260521122913.1565011-1-peter.maydell@linaro.org>
 <20260521122913.1565011-3-peter.maydell@linaro.org>
 <87mrxsolqb.fsf@draig.linaro.org>
In-Reply-To: <87mrxsolqb.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 16:21:19 +0100
X-Gm-Features: AVHnY4Ii6rVxvA1qROzVPUpXFSIwUzts1U0lx8wgf2cfqvUYsOFufjyE9IZvlhs
Message-ID: <CAFEAcA9JuUY-en-_ZOnO3bjtgqG-MHp2ESGskdm-D0+fqFng_Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm: Use FPST_A64_F16 for SVE FCVTLT_hs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=peter.maydell@linaro.org; helo=mail-qk1-x730.google.com
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

On Thu, 21 May 2026 at 15:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The SVE FCVTLT_hs operation produces a halfprec result, so we should
> > use the FPST_A64_F16 fpstatus for it.
>
> Maybe I'm reading the Arm ARM wrong (I can't find FCVTLT_hs but I can
> see FCVTLT in the SVE encodings). But these are all widening operations
> so I can see halfprec to single, not the other way around.

Yes, I got the commit message wrong here; this is half to single,
and we need to use the A64_F16 fpstatus for conversions from
halfprec, not conversions to it. The e07b48995aaa commit message
does a better job of explaining this than I did this time around.

The _hs is how the QEMU decode file splits the half to single
and the single to double encodings, which are the same insn
mnememonic in the architecture.

Improved commit message:

=3D=3D=3Dbegin=3D=3D=3D
We should be using the F16-specific float_status for conversions from
half-precision, because halfprec inputs never set Input Denormal.
If we use the FPST_A64 fpstatus then we will incorrectly set
FPCR.IDC for input-denormals when FPCR.AH=3D1.

In commit e07b48995aaa we updated most of the halfprec-to-other
conversion insns to use FPST_A64_F16 as part of implementing FEAT_AHP.
However we missed the SVE FCVTLT instruction, which has a
halfprec-to-single encoding.

Correct the FPST we use for the hs variant of FCVTLT.

[cc, fixes, &c]
=3D=3D=3Dendit=3D=3D=3D


thanks
-- PMM

