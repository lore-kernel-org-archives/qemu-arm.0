Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D412FFF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:04:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSBp-0002ka-Au; Mon, 27 Apr 2026 16:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHSAD-00026t-9u
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:02:44 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHSA7-0004Bg-QP
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:02:40 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-651b4d09141so14163043d50.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777320154; cv=none;
 d=google.com; s=arc-20240605;
 b=RYUBjzQtzVAQBygnpI33vfmik6TEFU5xDDx77ZFLMmfQ/zfk1DUMg4hsjiauaqg1i2
 vbAq5Cqdu0G+dnp/X7KxVNWqpbh1auCxMZ2pLMvoKERp+c5547bX8nv6ku2cmgcwORXS
 qYHJVBzeS9Jv54KSxTsLa/tSlNSqL0i58KqE9rU/FMWotrw9fIqIL/NppOJiJ5KVV/QF
 GB7BKHJur2dD8P8Xnm3X7bt6EvjA/rSAZQQfCxIQwQ43pVZmUEbVjMk3He86cWcyHW4r
 6gU5IAAufmEH8YXz/uvES6l1g/w3GMxVe+VczgV7EpNXWTAWUDB4WwGBN+Wy4/AT8ttZ
 L0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EKBtQ/dLFO51DyLLP19cb4OzrdwBTNELtwyyHCrLOnk=;
 fh=5N/Bs1QxV5E74raB14zT1ZpW14jBcpZzl2N9bGt8pX4=;
 b=c+ZNttvOy3I62L8KbQhBV6TCnM7Hn6iOBoRGOY4p7EceXqg48/PyaVzhCCa9w5losF
 R3geGigE8GSyoOX+K9dlT9z6b3HKJEapCdelddnwKFxgAzJP5FUP+jiGoj5jQBQKnCas
 vdaQzuuEp7jVuAiOQC4NLENhoFmis14pwWySqdS+g+AKSdYS/D4j+gNl6oMkTPuVswJY
 aaAhSojjIUMwbf36/DFfgfhFymiMTRYe26HgYtMWOa3vWdGodzWzhBzgU79t9d9NXez0
 xcL6y0qzJ7lmSSM5lRyE7Za3E3D6bdlQic/CnoMkF0sWPspXGlLCTAriT7lmml983AvQ
 gbkw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777320154; x=1777924954; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKBtQ/dLFO51DyLLP19cb4OzrdwBTNELtwyyHCrLOnk=;
 b=nGz7edE/F6jwnsRl32elAm7jx9qftqkpSDi2512neiwEHttCE5EM6k0ZQVlFKwH7XE
 8ZJ+pPh6x44pzbS7ekaXYdrcVl3JQ/1k7tQCby33bS6hzVB95IjadREinLKj3fe7lR0e
 AiIqcbs1+k+io3fPlf2yXr7BcN0g30GBV0vSYHdCjm47RyW97j9L06hz1baRzjvA1HcF
 6OX5CoDFqhOretlfX6H8bVNgz+XVD3FkH/VP/ON6J+G9YWdcVOxsBuSDHDMVe6IGqnNB
 B3rFc6mH/sIv/Gtf+xKp/mJMcfUKYCDGSNLE0yi/L7/Agy93EUayXvfH+HdQToCDovlB
 TBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777320154; x=1777924954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EKBtQ/dLFO51DyLLP19cb4OzrdwBTNELtwyyHCrLOnk=;
 b=jz98lsnK+r460aBgBMU7uOOCJPU8oWwJsSTxb38tLFKgYGGK4wadG0yWyS4Q2nta6T
 7Qg7sKA6Y5MRkrLeaLGO/Vb/3zXDkurwRdVPj0SnuV/F9+ONEtnAoTBimda3xihp3mhv
 5mc9cCiZOC6SxnwDpCJCZ3n6+F/lUGwBdjIaXF8x6x1MMSKBXZQyUK4SKXiBTf+hMa1g
 pUCZaI1AAhOpjbJbVYRpkVAtV9IDKenPB4MkssRXjrL5NEqm59phdwvA3CBotCi8o1jm
 4xnTWDFaAiq5la/G7/4kOHtNcC85gOjQZTHAZS7t3SUZK0vQSiTwdB5SWey3d2EyHAZ9
 EJvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+8oAnVwOI1UyrxlNtVP+p+LRI3N8hFE0MX/+VSybDJFp1iy13ECsWMaYu7k3J95TmhVrISFZDbCw==@nongnu.org
X-Gm-Message-State: AOJu0YycY0qr8b2nNtBCtsqr0OqIDao+h1Y25pRPRKCiC1wxASSpcOyg
 IoVFDjlO5bVFOHUdvk6cTY8N70N43uv+sKyyDso+x+Socd/vSZChngV4tvww2vCX0LdyzWDwMpc
 V68GlDmIN1BPheouRenXATgR2G94cxeEl3I6KMwng4g==
X-Gm-Gg: AeBDievvoccW3bSxxjL8jXHUNyAfp1mEAyBAo8We3yNy8eLAVEjjgg3UEWsQ2q3FKDr
 BzG++WzOeCEj7JXugGKQ3Gqr/Qre45S5BN3KmDWQ0/ZjOAdWBK2bhctJo3LzSg6DRutYZiPUnJ9
 2L6BIcgY56/4PyKVO5TFrDOs8LeXl0jZXjw6wMxpEo6xq9xPB1m7TnJPFGWCZeN32KS4Y0uSMAN
 +y4xNDJtYyyLS6IF/8R/4qOQzwHSsEu3iagkzUbvIKY5f3UALwjBbuJo4q871PYFPMx5Ga3fHjA
 YC+od074R8wHOvdmCfEIdggLw8oKx6+x5BxOglDNxy3z9r/zYbCY1+103yN4LK9Fk2dhHEXuRDJ
 l+54MHQTEcDNH
X-Received: by 2002:a05:690e:e8c:b0:64a:ce57:cac4 with SMTP id
 956f58d0204a3-65bee7f6ab0mr73313d50.24.1777320154125; Mon, 27 Apr 2026
 13:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260409220614.65558-1-lucaaamaral@gmail.com>
 <CAFEAcA-8BeBte6CxH._5F5Zsk3wvs0zJJW6+=8cNaroRTBegK-M5A@mail.gmail.com>
 <20260427184540.80415-1-lucaaamaral@gmail.com>
In-Reply-To: <20260427184540.80415-1-lucaaamaral@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 21:02:22 +0100
X-Gm-Features: AVHnY4Lb9mx6eC27k-lXV5h2U4iLlRGZ5z2s3Pq4pzUK3m14JNWgx1p8A7DzJUU
Message-ID: <CAFEAcA9yGmWq--JsyZpPnOQ74i=j7JeeO0Xf6be7wWxJGbXLdg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] target/arm: ISV=0 data abort emulation library
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Mon, 27 Apr 2026 at 19:45, Lucas Amaral <lucaaamaral@gmail.com> wrote:
>
> On 2026-04-27, Peter Maydell wrote:
> > looking at this I share Mohamed's question about how much of the
> > atomics/etc we really need. This is a thousand lines of code
> > handling instructions that in a lot of cases the guest really
> > ought not to be using on MMIO regions in the first place.
> >
> > If we have real examples of this being needed, that's one thing,
> > but I'm not very enthusiastic about implementing 'doesn't actually
> > have the atomic properties' instructions otherwise.
>
> Some empirical data first.  This series was motivated by an
> observed workload: the original Venus development capture (Ubuntu
> 24.04 ARM64 + vulkaninfo + vkmark) showed ~1.8M SIMD/FP load-pair
> (vLDP) ISV=3D0 faults plus a few thousand other ISV=3D0 hits on
> LDR/LDP/STP/STR variants =E2=80=94 guest-side accesses into virtio-gpu
> blob memory that the renderer had been forced to map via the
> subregion fallback (MAP_FIXED rejected as unaligned), trapping as
> MMIO with a syndrome that can't encode pair semantics.  Without
> this series, those 1.8M hits land on the assert(0) in HVF and the
> guest is dead.

Isn't the problem here that we're ending up in the MMIO
path at all? That seems to me to be what you need to fix:
taking 1.8M faults is a problem even if we can emulate them.

> Patches 4/6 and 5/6 (exclusives, atomics, CAS, PAC) were included
> for correctness against the ARM spec rather than to satisfy any
> observed traffic =E2=80=94 same capture had zero hits on LDXR/STXR/STXP/
> LDXP/LDADD/LDCLR/LDEOR/LDSET/LDSMAX/LDSMIN/LDUMAX/LDUMIN/SWP/CAS/
> CASP.  The intent was to cover every load/store class the spec
> permits with ISV=3D0, so that paths I haven't observed (different
> device, different driver, different guest OS) don't fall through
> to assert(0) either.
>
> I instrumented every trans_*() and the HVF data-abort dispatch,
> then re-ran the same workload on top of the MAP_FIXED alignment
> fix currently in flight:
>
>   https://patchew.org/QEMU/20260424000544.9617-1-lucaaamaral@gmail.com/
>
> Result: zero ISV=3D0 faults across the run (2.68M ISV=3D1 dispatches).
> The alignment fix resolves at source: blob now lands in mapped RAM,
> no MMIO trap, the ISV=3D0 path goes silent on this workload.

...so yes, that seems like the fix we want.

> So the question is what role this series plays going forward.  My
> intent was a defensive path covering the load/store classes that
> can legitimately fault with ISV=3D0 per the ARM spec, so QEMU degrades
> gracefully =E2=80=94 emulate when meaningful, inject a clean data abort w=
hen
> not =E2=80=94 instead of the current assert(0) the moment a guest happens=
 to
> touch MMIO with an instruction the syndrome can't describe.  The
> same wiring covers WHPX, which has the same syndrome limitation.

We also fail in this use case for KVM, and have done for years. It
doesn't generally seem to have been a problem particularly -- guests
don't do this sort of "needs hypervisor to emulate" access
typically, because it doesn't work under common hypervisors.

(Though for KVM we don't assert, we feed the guest an
external-abort: kvm-arm_handle_dabt_nisv().)

> I want to make sure I'm addressing the right concern before
> respinning.  Two readings of your and Mohamed's comments:
>
> (a) Scope: trim instruction classes with no observed use case.
>     Smaller series, less spec coverage at decode level.

This is mostly what I mean. If we don't need the emulation
functionality, don't implement it. We're not going to get
every load and store emulated anyway (for instance this patchset
doesn't cover SVE or SME loads and stores, which are a whole
huge class of memory accessing instructions).

I would like any memory access emulation to come with an
attached description of what the guest workload is that
is triggering the requirement for it, so we can check that
it makes sense to do so. (Mohamed mentions the Windows TPM
device, though I am still not sure what exactly is going on
there and whether emulating the access is the right approach
to it.)

thanks
-- PMM

