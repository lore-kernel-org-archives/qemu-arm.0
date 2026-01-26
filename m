Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3209BC88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 08:35:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkI3t-0007d9-1u; Mon, 26 Jan 2026 03:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vkI3j-0007UP-FF
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 03:34:58 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vkI3e-00052F-4d
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 03:34:53 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6581af9c94aso8347086a12.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 00:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769416480; cv=none;
 d=google.com; s=arc-20240605;
 b=LN1SWT+iX7twoN0GZ8T4NOA8gHjEZa65zdjpa+7ltTEXOuJTewIB6lKKXOAhWG5ZVb
 Nvykmi9DdtVCxndFyPwTpagHhDAPNzsxC9AOwipPt7aCTXQRb1S4fKxHsn0wWIz0LimS
 KastYU7g4/iHc92lFp15dXTYYCCsHb9Kmjq0DX5j1WoZWLIJh6OPNpv1/YVLbN/7R9b2
 WxvSIKOK5trJtRbSgWLZ0z6sXKhj/SiUqQ8NvS1gSxfDi50Zvk25/hRsOMp/M2MWq+9E
 60g1s2Nj5qrnEaVLpe3tOlY4T+TnsYsmYO01tgZkd+9RKwttTCsssTTpdIOoowlmrcsw
 n4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4WaAUg615YDe5MZ5SihLXAqXTIq1unnYqTXdXS19mdk=;
 fh=2ixHDT0J9FYC6TXpy5p6CibVEittEjzso0vsWUMouzU=;
 b=jd2XmdLztCx6wCffYiSUbuwlhNUO7TIMu64ogHX+Fnw9nvWloyfGN7wyoMg7HY7kxm
 X9PH42GQ/pVR17+6D/JUEVXDRTYtpgdYmFssmLzfEc20gRIWaKp6x1ZTVvdNqb1bsSuo
 0J2or//0YYbLuC4DtIN6MzwXMcP/Vqg1K6hxd8MtMSXp4InLvQ6AgvXgg+rXroPfhiDH
 AyQ/ClNMTKy4KIyN0VA1L6aD5FPCpM2O7t0m2LzDj0d4WdidYM3K0Ga1ftSu9hk8pc3N
 IJE2eArs1Q1M/JSlEyPodO1lOL9qFyWezXV4Swjn6yL5FLHUZxg9CfX36UYuKHPMOthH
 EKHQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769416480; x=1770021280; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WaAUg615YDe5MZ5SihLXAqXTIq1unnYqTXdXS19mdk=;
 b=oFavd+5jRVvavEd7N0gniyPNGRpKBKMUV27Z8d4UOhEHhzG6XMTJ0jLeJD8jE1FFHP
 DfeB7e4SbD7fUO8sE0dI8StI92IEl/uBCcsz5bcWdTfirjuEQhukmS5p12IbVgXSxuOa
 3kugrpRkW/9In+Sbb4psyueEOiibz6KxmqcKh6BBRch8wpxRcEQYoQkyn7cdeoQPTaU3
 TGSMS8OxeRxA2Yj0Kx+Z5OxfyFighI+zcd9WX6nho1rzt7b5Aud9vhRFq3Ttgwg329Gs
 dbJB0xMO4zXTPWvskUQ+TCG5jxtlPrjkqJu+PVX64VF7aIFoI9AiL6PMiz8JwNj2D3dk
 YuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769416480; x=1770021280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4WaAUg615YDe5MZ5SihLXAqXTIq1unnYqTXdXS19mdk=;
 b=xCiCVVaONnobaZii9jemCjatizFj/IyVdDwD5ZdYbcpPFj98x+a1/uDJXllWzxbaUa
 lp09R3hYDcMFm4lUpwp9/ttTsuy/Wk25xGWY8vpOU6+o5EkEu14z67y5pyuPzHiOCnJd
 brajE11D0xfIiuXM/KLAFXLfRRXCF8RSZif3bJuvQ9RMNiBrxxMpNZeOQPVfJSuh0/W/
 hEmqa40sgxgh70GirxIHEg/o7GioAPMM9gqopBMZ8q5jOGyx7J/zj/L9kwHtW6jJaGcq
 uz/PTUn8Nhnc77whf/BlxbN/plhoCCZPwBLREP/HW1eExS7LQeg/6dvzthfBLe6OvFhh
 vt8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq71rFkYhekjkh8+B6vo1rZIL49JM2/sS0qcQvJfnMMk0mRBiu34j1iUkZ6uNrYnp5d2PEtDG8kQ==@nongnu.org
X-Gm-Message-State: AOJu0YxFRzzIo5puxycbc3/MCtn1ldZVEKFplV+HBwJ8CIuSS2cFmYtE
 7NrpXgoAX6R6lCjjzhooIpQFmp8lNwUWLWXAxVjxZC3pAaoWVSG/hWqTWeDk1dDrZaL2lDknl1g
 2r0vU5rHgHd9hHs0cc5hstUBoyEVqvGSxdYSU9wMMhA==
X-Gm-Gg: AZuq6aLKKlwMW0Zc4FJGmHssZY/FA1ig9OSF353n6cxrGu2vBFMC9+2Y9g/G0K1bQII
 uW84mSHLM4IMbz2DG3HEw0PgoGgwWc+VMYxYNTATHzUb/yWbnwJKAmBnXQ9gsztm5pDEitiVSR2
 0/7U/uNqw6aVqK9rVpCKtHDZOm2oopc8xRar1UGf6LbPeHhV80td02qqFgGQ5JKem5lZ6RA3nEM
 ZeaAwX5K8xB8f1TA9UTydp4W52DyRgoL0IylOMzFgViio4vvumq/wCIQvxGYTbRAULJjzbqa+yL
 GBa+QqqyZZugrf+PIDSTKaBh6qEBZrvRjmlf
X-Received: by 2002:a17:907:980a:b0:b87:5c45:b884 with SMTP id
 a640c23a62f3a-b8d2e6eba39mr297062766b.31.1769416480168; Mon, 26 Jan 2026
 00:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org>
 <20260115-sme2-hvf-v2-2-2eca481bd7ee@linaro.org>
 <2c3bb870-0321-4799-b7ca-65b2772ddf2c@linaro.org>
 <CAAjaMXabRsOX0OVXN202ev3A1sKqMmbDoeY6n7Z-EhmZWmL9Cg@mail.gmail.com>
 <CAFEAcA9oZ=rhUbw8WK5nUPAvs0TEPCJB8t8ReeViv=0b=_x-sQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9oZ=rhUbw8WK5nUPAvs0TEPCJB8t8ReeViv=0b=_x-sQ@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 26 Jan 2026 10:34:14 +0200
X-Gm-Features: AZwV_QgQZ5V7YA0BUIYlHACKT8EhtDWS5L0oqZZKBabFd03g63P7FXLHRChLp7Q
Message-ID: <CAAjaMXZLG2aBtStRhyvmdENj1Z+Mx05BmDgyYUoYrc_ZnHwyVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hvf/arm: expose FEAT_SME2 to guest if available
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x532.google.com
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

On Thu, Jan 22, 2026 at 6:52=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 20 Jan 2026 at 10:02, Manos Pitsidianakis
> <manos.pitsidianakis@linaro.org> wrote:
> >
> > On Tue, Jan 20, 2026 at 11:50=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org> wrote:
> > >
> > > On 15/1/26 12:20, Manos Pitsidianakis wrote:
> > > > Starting from M4 cores and MacOS 15.2 SDK, HVF can virtualise FEAT_=
SME2.
> > > >
> > > > Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> > > > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > > > ---
> > > >   target/arm/cpu.c     |  4 +++-
> > > >   target/arm/cpu64.c   | 13 ++++++++++++-
> > > >   target/arm/hvf/hvf.c | 25 +++++++++++++------------
> > > >   3 files changed, 28 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > > > index caf7980b1fc5244c5c2f130e79ba869456c20c88..7f4ebfdf61217db6075=
495119c1b642bc2abf295 100644
> > > > --- a/target/arm/cpu.c
> > > > +++ b/target/arm/cpu.c
> > > > @@ -1577,7 +1577,9 @@ void arm_cpu_finalize_features(ARMCPU *cpu, E=
rror **errp)
> > > >            * assumes it, so if the user asked for sve=3Doff then tu=
rn off SME also.
> > > >            * (KVM doesn't currently support SME at all.)
> > > >            */
> > > > -        if (cpu_isar_feature(aa64_sme, cpu) && !cpu_isar_feature(a=
a64_sve, cpu)) {
> > > > +        if (!hvf_enabled()
> > >
> > > In my experience "if(!accel)" is bug prone, maybe change to explicit =
"if
> > > (tcg_enabled() || kvm_enabled()"?
> >
> > Shouldn't we list all accelerators instead of just tcg/kvm then?
>
> This "turn off SME if no SVE" check is principally trying to
> avoid users hitting a bug / missing feature in TCG where
> it will assert on startup when the guest tries to write to
> SMCR_EL1 (see the backtrace in f7767ca3017's commit message),
> because we accidentally coded in assumptions that any guest
> with SME also has SVE. We turned it off for all accelerators
> because (a) at the time there weren't any others which had
> SME support and (b) we didn't do the investigation to figure
> out if any of those bogus assumptions were in code that's
> not TCG-specific. (In our defence, it was just prior to
> a QEMU release :-))
>
> To the extent that those accidental assumptions are in code
> that you can hit with HVF, we need to fix them before we
> can enable SME-no-SVE in HVF. To the extent that they're TCG
> specific, the only accelerator we really need to turn
> this off for is TCG. As the comment notes, right now
> KVM doesn't support SME so it's impossible to get here
> with SME in the feature registers.
>
> If the core code is OK for hvf to enable SME-no-SVE,
> then it should also be OK for any other accelerator
> except TCG.
>
> I don't think hvf can get to the smcr_write() function
> which is the specific failure we saw with TCG, but
> I think that it ought to be possible to end up calling
> sve_vqm1_for_el() if you use the gdbstub with hvf
> accel, get the guest into streaming SME mode (PSTATE.SM
> set), and then read the "svg" register that gdb uses to
> expose the vector granule.
>
> If giving the SME registers a good workout with the
> gdbstub interface all seems to work fine, then I think
> we can adjust this condition to be "if tcg_enabled && ...".

gdb had a disastrous workout, because it turns out it also assumes SME
must have SVE:


  (gdb) target remote localhost:1234
  Remote debugging using localhost:1234
  ../../gdb/aarch64-tdep.c:3068: internal-error:
aarch64_pseudo_register_type: bad register number 160
  A problem internal to GDB has been detected,
  further debugging may prove unreliable.
  Fatal signal: Abort trap: 6

"register number 160" corresponds to pseudoregister regnum
AARCH64_SVE_V0_REGNUM. Looking at gdb/aarch64-tdep.c, it seems they
are only supported by checking against `tdep->has_sve ()` [0]

Peter: So what do we do on the QEMU side? Merge it and wait till
upstream gdb fixes it to check for bugs?

[0]: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dgdb/aarc=
h64-tdep.c;h=3Df1bdce453db27dffeb42f10fcd44a408f706afb2;hb=3DHEAD#l3116



--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

