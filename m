Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F69D37E39
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Jan 2026 14:24:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vg1mw-0002kg-KM; Wed, 14 Jan 2026 09:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vg1mp-0002is-Bv
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 09:23:52 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vg1ml-0005Cf-7M
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 09:23:51 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b8768225837so85208466b.2
 for <qemu-arm@nongnu.org>; Wed, 14 Jan 2026 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768400615; x=1769005415; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbshZUlh6bNqnGJI2nOp6oyrnH+oovwl42ojwydYowE=;
 b=wPqQK+ydBkiWhWv/PAM7RMrDS3avmcngDIhxxql2dtAGdO/aIVHqby/+8aqfjFkFF8
 FdxnIdZz7N0bqRaIrfrAv0hZFfCHzxJJReUxLXPR6S1bHZwErBqCiYF3jAPPh7Om7iJZ
 E1lv7D4F9AYUe/0BIV1BXdBMs9zC/rGt9Hh/5I1VWBh7yYungdI1VaN9d+hPukTqedcs
 uhlmFMbOAkYTcsj5MIToqKZVCl7Jt2z1P5HZC2VjS4sCJZudGEU0YXgyrtkFOTv1//xG
 o45o4GOV5kIft6WopIdAoO42MpijvC0JGxRJ0CBT812aRWI9rL90uGsLeZDgRSFBtGy7
 KhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768400615; x=1769005415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EbshZUlh6bNqnGJI2nOp6oyrnH+oovwl42ojwydYowE=;
 b=g/c9xC84N9bBpxYcVUnCCP0LCYMAjItop2DwES/ZbqZB8g5/PA/7akzMy7nAq1aDNc
 WZZpSpsV/5fNtsqAKxoJRUUkOcMKHKxapEn/wJvFoXpuG39iEvcp7eBJLVWf4kDhUvVu
 szL6EKSCBChAJ910sHsj5RiacROP7mjCZFFr/I/bD43MXFbHJF0LUgxMYojlSGJkEPwp
 nBxOFFj75Udcrl+D5qJjNAOmkraCChjvj9+3C0FIfVvpHTUvDpEAFp41n3G3S4ArCmai
 csoqmfJpdbhmYETEqEgAq7RuDfYWD3wPjkP7OgFCKXN4BbdF/uGddpCdp2l9Sz7ORFLO
 tChw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIMCexp3KYLMLO0QFAExjZYWzNR2Qu6oHDQ/s/r1MxdMhKgc7j83dBEqhMVC7sA/wAaLBzQhCGDA==@nongnu.org
X-Gm-Message-State: AOJu0YxnKV1xcOkuCUqDzDDp1SY3+3vsOQQ6lcEGCO63+kughW2YKrSO
 PsskwS7FKZRhxIEhieMfQMavh7x4fsVSBqPi//2yT/dU4VRQAFuZNcbFxai/3xDEWhSs+ktJqMd
 2Zmi+mk0gKL5y4YfRKuH078011X9F3ljceIK2DbRDhA==
X-Gm-Gg: AY/fxX75+Ihq0C60AJjKTlkNJLPY+KtYDaEwbQrAgE5UvsdOMvqRv5ghyStWFAmPkCx
 zz+FFORVrJBJSWWYAekMZiGAxHQgs9WRDUPXyrDPVBzFhkHJI2Th6eehpUgoa8CZPEYNlaCcZa2
 9jWU73KCK6YiVDqk6ewcrzEZfM14mEfpNs7C8PlR8izGaMIU2ZcQf+HJajvxcBlQSXo0aOs4RW9
 ITqgYwR8O6ZeL996tqwF/oJwgt9rhvJBYxCy9vO4F9BpKzOlLqtjz2lw7xkjlmLhwCtWG0FiCRL
 mfeiBSEXLkiuzhKRZQFJgV6239PGC58vdIsR
X-Received: by 2002:a17:907:3d8f:b0:b87:2f29:2062 with SMTP id
 a640c23a62f3a-b876775c1f6mr167101166b.19.1768400615044; Wed, 14 Jan 2026
 06:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20260114-sme2-hvf-v1-0-ce9599596736@linaro.org>
 <20260114-sme2-hvf-v1-1-ce9599596736@linaro.org>
 <6edbbdd7-8992-420e-9aee-7596afbcf00d@csgraf.de>
 <CAAjaMXZehMtdZC+7obmRZgfE+T2Dn64GTY2MqncPq9grKGcSsw@mail.gmail.com>
 <27f2e668-c324-4f3a-a485-06fb43bded7b@csgraf.de>
In-Reply-To: <27f2e668-c324-4f3a-a485-06fb43bded7b@csgraf.de>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 14 Jan 2026 16:23:09 +0200
X-Gm-Features: AZwV_Qhm_sNG-HYI2_ruf7e_CGI1QXoUl8ZGStNA4oY7g_en3wNBLnFaVP1wt5E
Message-ID: <CAAjaMXazErTRbteJMy_sbp+Hv6kt4NaLxGL5Vuyjy27eyMgK8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] hvf/arm: handle FEAT_SME2 migration
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x635.google.com
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

On Wed, Jan 14, 2026 at 4:14=E2=80=AFPM Alexander Graf <agraf@csgraf.de> wr=
ote:
>
>
> On 14.01.26 12:51, Manos Pitsidianakis wrote:
> > On Wed, Jan 14, 2026 at 1:19=E2=80=AFPM Alexander Graf <agraf@csgraf.de=
> wrote:
> >> Hi Manos!
> >>
> >> On 14.01.26 09:35, Manos Pitsidianakis wrote:
> >>> SME2 support adds the following state for HVF guests:
> >>>
> >>> - Vector registers Z0, ... , Z31 (introduced by FEAT_SVE but HVF does
> >>>     not support it)
> >>> - Predicate registers P0, .., P15 (also FEAT_SVE)
> >>> - ZA register
> >>> - ZT0 register
> >>> - PSTATE.{SM,ZA} bits (SVCR pseudo-register)
> >>> - SMPRI_EL1 which handles the PE's priority in the SMCU
> >>> - TPIDR2_EL0 the thread local ID register for SME
> >>>
> >>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> >>
> >> Thanks a lot for the patches. I don't have an M4/M5 handy (yet), so I
> >> can't test the code works correctly. But it sounds like you did that, =
so
> >> I have no concerns on functionality.
> > Yes, I tested it on Linaro's M4 machine. Adding a functional test
> > using Arm's benchmark is possible, but I couldn't be bothered to
> > create vm image assets just for this :)
> >
> > Note: testing migration is tricky because the CPU has to be in SME
> > mode for the Z/P registers to have meaningful values, so you need to
> > savevm while SME instructions are executed to get a useful migration
> > state. I modified Arm's benchmark to compare the SME matrix
> > calculations against the non-SME calculation to ensure they are the
> > same and I savevm/loadvm a bunch of times while it ran with added
> > printfs in the get/put methods to print whether SME was active or not.
> >
> >> However, I have concerns on a few maintainability aspects. You #ifdef
> >> out a lot of code conditionally on the target macOS version. Any of th=
at
> >> code that is in ifdef may or may not end up getting compiled in CI or
> >> other test builds, which means you are missing out on a lot of
> >> compilation test coverage. As a general rule of thumb, please reduce
> >> #ifdef to the bare minimum.
> > I agree completely, the problem is two-fold here: the HVF exposes APIs
> > with API_AVAILABLE(...) (clang's availability attribute) and also with
> > plain ifdefs (__MAC_OS_X_VERSION_MAX_ALLOWED >=3D 150200), and
> > specifically the HV_SME_FOO_REG variants, which cannot be protected
> > with the availability attribute. )
> >
> > So every time an SME type such as hv_vcpu_sme_state_t is used, it has
> > to be guarded :/ __builtin_available(...) check is not sufficient
> > because it will not compile due to undefined types.
> >
> >
> >> One thing I like to do (when possible) is to use the ifdef to define a
> >> global const variable or an inline function. That way the compiler's
> >> dead code analysis will eliminate the non-active aspects of your code,
> >> but all previous compiler phases still run which means you get syntax
> >> checks.
> >>
> >> How much of the code down here really does require #ifdefs? And if it'=
s
> >> a lot, maybe we just bump the minimum required macOS version instead.
> >>
> > The missing type definitions and missing function declarations will
> > still raise compiler errors unfortunately. We could add those missing
> > type definitions as stubs if they are not defined so that it compiles,
> > but I chose to ifdef instead. What would you prefer?
>
>
> How about you create a separate #include'd header that provides stubs
> and defines the same way the original headers would? You can #ifdef your
> way inside there all you want. And then you write the generic code with
> the base assumption that all definitions are available.
>
> Alex

I will do that, and add a comment to remind us to remove the
duplication once we raise the minimum macos version. Will send a V2.

Thanks!


--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

