Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80203C8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 17:33:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYpie-0002vQ-Bw; Mon, 07 Jul 2025 13:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYphG-00005X-I8
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:32:06 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYphD-0006qs-J2
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:32:05 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e812c817de0so2586024276.0
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 10:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751909521; x=1752514321; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nB/tJ15N7zc8mpltoi9bJZrFAK9KnZlQOhslWTWg9Uk=;
 b=ECPJ0LXQXt8J/8FTmkeGPiD/zq8KxgU9QpP/HWw08GOGTr2ByZjjvFbNNGlsLkbclt
 jby2y/5e0OdR+lVUgfGv0XVgP7UO+hnCA4Pb3u75DXzvhYApQtJMPMD1rlXyAN0UB3wM
 Fe6zCH8zgOk+UcweVPHc1Eh0mIr2rgmBPtRMz+gJpQxPT1kluLH8r6kMBnWtOH6+e1nt
 0zo1PoWF2OFXCgRZRNFWSU3vn6/frbGeWCpJD3zukmfdIqxL8sUVhvLdsMh9oW2X/bau
 /UpIAHHuaNN2lHkUjOuzBoCtJnyfjQ2AG0qJw4RSqT3+TpFl95iMLkDPIbKk7QJJJX3r
 lZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751909521; x=1752514321;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nB/tJ15N7zc8mpltoi9bJZrFAK9KnZlQOhslWTWg9Uk=;
 b=BtC/PA/77Hiwh4pOkrO/DId1PtQVZbvRjpM4mGlJ3yPFeSNS3y3qNRbHtH8pYv8FGl
 UVLN4oopC8GbejzYDJq9Ww0VHcdSmTcZegiOdi4Db5IcMh2Z1qY6u2hS2ElwbwYZcOsV
 laYErxY1tAKtSfJmvxycC5z568MS/uO7mKGqJRYr1wtqaub/zZjJ0O0Rghuyaz8Cqqc3
 NkOxi77fg/uWeQo4Y2Tos1l77AJNOuOVet3kO1sKfE455PzFLyxOvjYuOjyf34bKj8UO
 yVaAPLH9Govi5CUSCL6YFjfT1X+BEP/mCBSBT6PaP4fNVNVtI6ZnuWenp5icLk/awmmm
 KkBw==
X-Gm-Message-State: AOJu0YxoHZ4wCCskmHFcoEVwJBjNevdQAmyIf2YGwAJb/25U7KVd4fW4
 jdGF9W8Ue/ZDXKQUQrwdDO2kxvDdqEUuLhuNdAkLrbLFC+1zcFN/T0pnpl0MIoNtXivS29aZYoB
 tCAsLQJZiR896C9hx3jXxbv+3Gg7G5esyM3zrrtl3Qg==
X-Gm-Gg: ASbGncsT3YtRgbdCDVZTQGFY2HKNecMbUrFscZbg9NPpFDLbsEnBxc30pBQ8C6AtUY/
 AROm8JI+wDgeHdVKFitL6hOK/zgUKBAL8bNf4SDAjOvEjehSRk9BSmupBoYb5qTnsPyTxYOtHtI
 eY/Rw8pKQOBWovrLWL8vMKgcAVf6W+QIBNim7s03uyQML/Bv71zPG7/HQ=
X-Google-Smtp-Source: AGHT+IG8+AC9zvpny8CcRsZf0fE0lwOweHViRCvo87jjTs5pbbVVHIaWM9ttkZbXjN4ODf5wpsOdZbJN08aX34Y65bw=
X-Received: by 2002:a05:690c:9c0e:b0:713:ff70:8588 with SMTP id
 00721157ae682-7166b83a15bmr170534347b3.36.1751909521318; Mon, 07 Jul 2025
 10:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250707161018.585469-1-peter.maydell@linaro.org>
 <20250707161018.585469-3-peter.maydell@linaro.org>
 <d87b733a-c8d3-4038-9159-60806d5a6186@redhat.com>
In-Reply-To: <d87b733a-c8d3-4038-9159-60806d5a6186@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jul 2025 18:31:49 +0100
X-Gm-Features: Ac12FXzx405YWjMW9ZjEOlcnKW5m3zP0bVrXp-PYgvTBmk9Zd8lni3Sn3Mpg_B0
Message-ID: <CAFEAcA_bmwstEo514jTunu6YsE78QikOCm+ZxJ0B6ZH=n_GbXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc/arm_gicv3_kvm: Migrate GICD_TYPER2
To: eric.auger@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Mon, 7 Jul 2025 at 18:25, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 7/7/25 6:10 PM, Peter Maydell wrote:
> > The GICD_TYPER2 register is new for GICv4.1.  As an ID register, we
> > migrate it so that on the destination the kernel can check that the
> > destination supports the same configuration that the source system
> > had.  This avoids confusing behaviour if the user tries to migrate a
> > VM from a GICv3 system to a GICv4.1 system or vice-versa.  (In
> > practice the inability to migrate between different CPU types
> > probably already prevented this.)
> >
> > Note that older kernels pre-dating GICv4.1 support in the KVM GIC
> > will just ignore whatever userspace writes to GICD_TYPER2, so
> > migration where the destination is one of those kernels won't have
> > this safety-check.
> >
> > (The reporting of a mismatch will be a bit clunky, because this
> > file currently uses error_abort for all failures to write the
> > data to the kernel. Ideally we would fix this by making them
> > propagate the failure information back up to the post_load hook
> > return value, to cause a migration failure.)


> > diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> > index 3be3bf6c28d..0302beb0c07 100644
> > --- a/hw/intc/arm_gicv3_kvm.c
> > +++ b/hw/intc/arm_gicv3_kvm.c
> > @@ -332,6 +332,9 @@ static void kvm_arm_gicv3_put(GICv3State *s)
> >      kvm_gicr_access(s, GICR_TYPER + 4, 0, &regh, false);
> >      redist_typer = ((uint64_t)regh << 32) | regl;
> >
> > +    reg = s->gicd_typer2;
> > +    kvm_gicd_access(s, GICD_TYPER2, &reg, true);
> > +
> I don't know if there is any rationale about the access order. I see
> most of the dist reg accesses are done below in the function after rdist
> ones, although the GICD_CTLR is also here. If there is a rationale a
> comment may be useful to avoid another dev to do something wrong. I
> remember that for the ITS for instance some speicifc ordering needed to
> be enforced.

I think in general we have tried to put in comments to note where
the ordering matters. (Though I do suspect the GICD_CTLR
write may be early because we need to write the enable bit
before doing anything else -- if that's true, we failed
to document it.)

In this case I just put this one at the top because "bail out
early if the config is wrong" seemed better than doing it late.
But it doesn't matter and it's probably more sensible to do
it with the other GICD registers. A comment that we only
write this ID register to validate the config would also help.

> While at it you can also fix the missing bracket at
>  /* Distributor state (shared between all CPUs */

Sure.

thanks
-- PMM

