Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04AECD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 16:06:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWcTv-0003xE-L3; Mon, 08 Jun 2026 12:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcTo-0003wR-7l
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:05:37 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcTl-0006cQ-Fa
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:05:35 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-bec354815b9so446508866b.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 09:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780934730; cv=none;
 d=google.com; s=arc-20240605;
 b=HY+uxvBgcv+xQX36dHb18oh8zzVVFmtqYvHAdsi2KXwudjy1oBPht44x8QKy+8xeMv
 +dMLC93Q5JP54mRaRdYVijL6fVvio+7gjhzQ93SMCIY655iiCfjNupGJ5HaWyBCuJsgK
 hx0eSOuLt9ZF+MDD47VEjpmZDVgD2n94VSENph3Y2F+dEpZHrqwHWRBURUM6+lq3TSif
 7uYbf2OwpnvAUZ+K0eOEmtBSWRkuplGdl78o9HRN7/4N/KX/nrxv9vlXh6Xyneqbj1RU
 r72C/CISp96GQrQrAGrElrU/DubGOgkPoeBMUMBAHpLd2go1vgu0zI/ktjaT4JlXe4kR
 tIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BRgT605k8dfAx+YdtLK8ADrnknINr0SKeKiA4MiO6GQ=;
 fh=QgnlJNfnMDEfQD5yXvhNmcFDykJ5g5yvIvgJfqxgqRM=;
 b=EejZUnbdDJJdhaK8hPRhjCu+cLy5GpVe4zTIAa+wY9eQaICDmRVWv6LFO7xATCIRXU
 KJGpKzItiwDRy5SLeVJnx+jA6dd+hH0Cw6fCiuH37vHgxJMfAboGWlhROCd6hlzI1jd5
 /9ZbIlBwKnLv75U1xTrBAv75XYILK7+BL2y71RiHGqOOvXIeXgL0mViQ+qtJ4mOGB7fK
 K6IhQYvZaXfje6K2sEimJRXkNfmfMJmNYRgv5wjPV3d/Ug5bPynNdZBYnX/RUqsyBS2X
 /2NLbx4A52pTNuXaYRUkPNlHxEY0sq8PbMbcQo6SJkCJZOdNDq4IgOwp/Pkld7ou7whx
 dWnA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780934730; x=1781539530; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BRgT605k8dfAx+YdtLK8ADrnknINr0SKeKiA4MiO6GQ=;
 b=FQuipSsobjwTdcygJ4bBVRwW+4vnOhhK1XN6s5QR4TKZhvSePKfbHys07yqkaR6KAa
 PoEtkgCuNbhpeQ1oMxDaUCIgSUS21zOkc0IJzO8I2PJa9uF7giewU+FCKLyjoFZCZE/H
 goiRwBKbTKVwEUG8hXAajf0bofiUt0Ch9mLPoQVWiNGpx0j5jnOx50Vc3z/Q+g1ROPIa
 gGhw1qPoI1wV5cH4B+zf/hcp9umfKiucl350st7QhUUnSQLcGo0R3UVZ5q9QquzWUj9w
 TfT+oUg2uQM0xkT7qKfokw2QVB84xYKLeOr8repbU0/F/QrYFeh5ER7BvKHZa5NOpInu
 CMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780934730; x=1781539530;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BRgT605k8dfAx+YdtLK8ADrnknINr0SKeKiA4MiO6GQ=;
 b=DDAo5lLxtsdk/oRO1sNOMF6cf2wYcKwbSylPP9YZidi1x96msgBSwgJ/OuEE24Qf5e
 KNZ4riH5L/AWEG7rq3ycEJiErtKBQSJv9k7KNGt2uAXQUtzXQSmgOn/OuTYg12zBVP1a
 Rd0u+owcVo03nRk9+B2aH9WxZGN0TuhecoJet4dqLT0Q+3gXLg43yKWW06GochfvDcnB
 BINgWHPnYqgMqsAKOwkNe9wMd9iksntefr8GVkE8ou+aAX17m0cfVrpEBkAfnOd+WErX
 KPWmacB46qRgyyBNmj2eC9//GIhgjob9brxNk87uSVr3Nbuw83mOPOrtkjiDVg64i0yF
 VtwA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/aO+vYXwekD3iIGXtpwGUxc3uYep63LW0xTrNInkK64nDcu5MZULFmFOSDKIoRQuC4L1hQBWi1UQ==@nongnu.org
X-Gm-Message-State: AOJu0YyD96po9rpeU+jsFdKAcREQvBpta5021LNdCTSJZ7U/ZYqNdzGQ
 FQ8/Zf58g9e/E+HkqdA7DgoH6T3yK5fEfhubs6ixFLmrIky9+Tiy4ki08ETYLPfm8zOsSmzzFFc
 UFFextncKuDUkmT884s8Ge1OSPEaVbF/7pE2NFY/wmQ==
X-Gm-Gg: Acq92OHleSq3IIFgD+QHeWKHiYuuHbocwhkqrwWGJTFE5c2xelo1ek5otr/ygkd73M5
 ytB3NMdX9mYf0dKK17RxerpJN5fwMcYmugFrtHqefgauKSH7K5cC9J/kVKtwFwgVX6iEpGXId4K
 d3H/iOJuh6PPw/x+iZvg4w8yuBfrbdq564ZDQFRwRdChX50IcUOpYa1gbUsDh6MRcYhI/+EDJMQ
 dXaDdHNJYdFY4hOpb//Wv6K9i4HJtrtgZJBpqYv3hG+9b3UmgZL9Pq3JQY+XmAZz2C29ZLJSk3G
 5nedmI2CyTf/CuQiyb3mOyEQP9k/2pZNoJabSUay5mzhokM3ZO2rQ6AcfrFQ8wYPlcDNKWB8Y4T
 VPw==
X-Received: by 2002:a17:907:a49:b0:bed:19af:f8aa with SMTP id
 a640c23a62f3a-bf37057a9a2mr798173666b.13.1780934729535; Mon, 08 Jun 2026
 09:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260529114723.42040-1-peter.maydell@linaro.org>
 <20260529114723.42040-18-peter.maydell@linaro.org>
 <745e66c7-2a9b-4185-bae7-77e10623332b@linux.dev>
 <20260607182221.4357-1-wrigjl@proton.me>
 <CAFEAcA-xEaA2LM=17Q1pKOF6L=rHhaDimXeSmLe=BtDqeaBeFA@mail.gmail.com>
 <aibmIdorcTobj2yo@Jasons-MacBook-Pro.local>
In-Reply-To: <aibmIdorcTobj2yo@Jasons-MacBook-Pro.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 17:05:14 +0100
X-Gm-Features: AVVi8CcssVn5ksc4UvVhWrtATM1q7vJrWv_84FJTdcJC5zLEdrISwTvHqaiwFWU
Message-ID: <CAFEAcA85HahxFXoDVW_xBZEtG2SUd_3PseYLrpUXE6P_Hb_5mA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: manually sync ID_AA64ISAR0_EL1 on vCPU
 init
To: "Jason L. Wright'" <wrigjl@proton.me>
Cc: agraf@csgraf.de, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 zenghui.yu@linux.dev, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Mon, 8 Jun 2026 at 16:56, Jason L. Wright' <wrigjl@proton.me> wrote:
>
> On Mon, Jun 08, 2026 at 02:07:03PM +0100, Peter Maydell wrote:
> > On Sun, 7 Jun 2026 at 19:22, Jason Wright <wrigjl@proton.me> wrote:
> > >
> > > Commit 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> > > gave ID_AA64ISAR0_EL1 a readfn so the RNDR field can reflect SCR_EL3.TRNDR
> > > at read time, and marked the cpreg ARM_CP_NO_RAW in the system-emulation
> > > path.  HVF then trips its hvf_arch_init_vcpu() assertion that no ID
> > > register in hvf_sreg_list[] is NO_RAW, aborting on boot on Apple Silicon:
> > >
> > >   Assertion failed: (!(ri->type & ARM_CP_NO_RAW)),
> > >   function hvf_arch_init_vcpu, file hvf.c, line 1442.
> > >
> > > Reproduce with:
> > >
> > >   qemu-system-aarch64 -M virt,accel=hvf -cpu host \
> > >                       -nographic -display none -bios /dev/null
> > >
> > > Mirror the existing treatment of ID_AA64PFR0_EL1: move
> > > HV_SYS_REG_ID_AA64ISAR0_EL1 into the SYNC_NO_RAW_REGS block in
> > > sysreg.c.inc so the assert loop skips it, and push QEMU's view of the
> > > register to the vCPU at init time.  HVF does not expose EL3, so
> > > SCR_EL3.TRNDR is never set and the readfn is functionally static there.
> > >
> > > Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> > > Fixes: 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> > > Signed-off-by: Jason Wright <wrigjl@proton.me>
> > > ---
> > >  target/arm/hvf/hvf.c        | 4 ++++
> > >  target/arm/hvf/sysreg.c.inc | 2 +-
> > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > > index d88cbe7c82..afa1120c8a 100644
> > > --- a/target/arm/hvf/hvf.c
> > > +++ b/target/arm/hvf/hvf.c
> > > @@ -1485,6 +1485,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> > >      ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
> > >      assert_hvf_ok(ret);
> > >
> > > +    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64ISAR0_EL1,
> > > +                              GET_IDREG(&arm_cpu->isar, ID_AA64ISAR0));
> > > +    assert_hvf_ok(ret);
> > > +
> >
> > For ID_AA64PFR0_EL1, we do "read the value from hvf, update it,
> > write it back", and we do not either read or write the isar.idregs[]
> > entry for it.
> >
> > For ID_AA64MMFR0_EL1, we read the hvf value into the isar.idregs[]
> > array entry, update it there, and write it back to hvf.
> >
> > For ID_AA64ISAR0_EL1, we write whatever is in the isar.idregs[]
> > array entry into hvf.
> >
> > Why do we do three different things for these three registers ?
> >
> I think it's each call doing the minimum work required for that
> register.
>
> MIDR_EL1 / MPIDR_EL1 are QEMU-defined identity values; HVF has
> nothing useful to contribute, so we just write.

These don't have isar.idregs[] entries either, so it makes sense
that they're not quite the same.

> ID_AA64PFR0_EL1 needs HVF's value as the base (host feature set)
> and then ORs in the GIC sysreg-iface bit, which depends on
> env->gicv3state runtime overlay, hence the get/modify/set.

But why do we not update isar.idregs[] to match ?

> ID_AA64MMFR0_EL1 also needs HVF's value as the base, and the
> modification (clamping PARANGE to the configured IPA size)
> consults isar.idregs[], so we read into idregs[] before clamping
> and then write back.

But why does the modification consult isar.idregs[] rather than
taking a value that it's passed in as an argument ?

> ID_AA64ISAR0_EL1 in this patch has no runtime overlay on the HVF
> path: SCR_EL3.TRNDR is permanently 0 since HVF does not expose
> EL3, so the readfn is a constant equal to
> isar.idregs[ID_AA64ISAR0_EL1_IDX], which was already seeded from
> the host during realize.

But if the values in isar.idregs[] are seeded from HVF during
realize, why do we not trust the isar.idregs[] value when we're
handling ID_AA64PFR0_EL1?

> The three methods track different requirements, so I matched
> the closest existing pattern for ID_AA64ISAR0_EL1 and left
> the others alone.

It seems to me that you've added a third thing that's different
from either of the ways that we handle existing ID registers
with an isar.idregs[] field.

I think we need to figure out:

(1) can we trust that the isar.idregs[] values at this point
are the ones that hvf uses? If so we don't need to re-read
the hvf values. If we can't trust them we should consistently
read the hvf values.

(2) do we need to update the isar.idregs[] values when we
modify the values to write back to hvf? If so, we should
do it consistently for all these regs. If not, we should
not update any of them.

Currently ID_AA64PFR0_EL1 neither trusts isar.idregs[] nor
updates it; ID_AA64MMFR0_EL1 does not trust isar.idregs[]
but does update it; and ID_AA64ISAR0_EL1 trusts isar.idregs[]
and has no need to update it.

thanks
-- PMM

