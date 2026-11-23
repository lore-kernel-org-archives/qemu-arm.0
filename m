Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD7C606A337
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gWHJFI2b
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVUEn-0002Bx-6p; Mon, 23 Nov 2026 08:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVUEl-00028L-Ij
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 08:37:39 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVUEj-0001Lm-QA
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 08:37:39 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6798eb0d190so2647620d50.3
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 05:37:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795441056; cv=none;
 d=google.com; s=arc-20260327;
 b=gDte/73edgxWJYh0zb3B7VwQcLJIJ4aw2OaiZHzKlSb+ud0eESjfxdhqlAIqM7EaCx
 b+tKjpLkAQ29ExCLf+huAGnrwQE1BcURho0qwcfKuae1VnhdjW7PAF4ODju0RWHreNyR
 LqJQPMadZNAIPIYxwpwLjCeEq6xf7lTS5KvJn4UmYu78SRRkZlZ3EpuA1OkOPqPSudTx
 t2n4P7miMFAF/u94FY+YkHzHEXPkZpHBPn1fsnj9jw+FL3jr0tkKONiu8iQSOZ+LtAvq
 DXk947YxIHfVF0BkgcWqcmM0WYURcFGtNTGPR1dPlVv3GXYjMZbUUwIjpzdgIS4fCk4G
 fKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4KR7T+DaZA9hkDETt2lUk/f5nZKGhFOgN8UqDfQ1AZI=;
 fh=rxJIwGYG9sbD/n9jGGt7/IOyCmqV1vA8MmhVRGSQ2kI=;
 b=DWFEAHDFRxLVlkF/wwFtaHJcPcbzNjmFNWHo3X66SoMecKHMhpC+JWwdb3ERYwITJj
 KcTHCwudX8il+tcK2ZEHuECNUGJvJNPJAvg9dnjRJik8MKzBEFHStGV+LtYUq6bemeUk
 14wOjLgyk4rtFgjhdiUGXaEr1jfImYRm9+G/5e17UzbupieWVuSosxvdOWcHPdJDNCO9
 F8wCtHeO/h8YOKMlNGAhkyd2EEtIOG/MCjtzDXf9ume5nCab/XeqYMptM6pzUDFn+DQw
 nRIgm2IwI87UgCNIsSgmCNBCHDyDM8pI2INxDY9QnXXD0VKza7iZyup0XMm9Ra9NCjHx
 Vleg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795441056; x=1796045856; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4KR7T+DaZA9hkDETt2lUk/f5nZKGhFOgN8UqDfQ1AZI=;
 b=gWHJFI2bVYmavAjfIuJWHCveez+7DTSWARUr7JnL7o1vivjsBBZbeuq6vhoyDKEhx2
 5HnSVwxaVbo3Mw0teVU+saJPJprLk8/Nf971F+EDYsN6TVn0p1c6Bx0G+QH4KkO2oE8G
 bBLQeutlSs0kQ1rTcP191gHvMtBODxreo2xWy3eGRHNsTCHVgCWviyI6QT06dGWarjTs
 6nSvHbIMegHyQD4o/NZoTuOjgFybMJEOthyP+V8wvUzdUgPd9WteX/fsP51ApRJ7cbfu
 fQxyyMHpdMNxBXfwkWFFEpRPtXBebUyeou4/lrs6ESeBVbqo8AVit1rV4+l+yI0qQyrG
 jIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795441056; x=1796045856;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4KR7T+DaZA9hkDETt2lUk/f5nZKGhFOgN8UqDfQ1AZI=;
 b=XL0skIJQQXfqDHK4swcGA6N51p27UCqOtVtfLi8xzb+aMYRm1mXZU9G57W0d6U8BLE
 ocKdkDl+ocefIAsWd/wA/Qr6NPVyIt8hfpfHTLFrEk7hXyf3WASEi//R9xn0vGB2oTti
 7BBEck4MqLBCfEjUNtYfV4VdXmJrYSj/u8drZXkQBaS/z02MK6OEqo84JItZHojY06ax
 5aBfRHxeAFcY83HTbh/JjvTcRd/ak5DjYA+0Qnzt3NBQAMkVgTRvfB1cBiRyMrFmkK3r
 umjVT/OvnvlVoWoyevyICnVmJFcOFioUGixmUqF4ZcA74+CYUC7xwTJUXEMMPbnEC98j
 sZLA==
X-Gm-Message-State: APuU4Z975sMLNVn3edzqB5dBB65BinvmzRHrF/gAqkrLJjtLcOs5jnzB
 Yj+z7Jg8sGjRwk5z6EFF0wju3ZeH7/XPPOW5QrJmSDAgXpKzW5BVjtvt6G2Dbsru0nNFZbO6H+R
 ku/WKton4fLczKf21YdVMvoYy6glZx594FxZ+6V+VVA==
X-Gm-Gg: AZFdTZd2BElHDqd2oMpfYU2/o5xc+KZ7lVmsuizAHsIWwDsuTN04gZ/fxaRXRBlFXVl
 QamDfKUgjMTKmIrDCZ/FL6k0czM97kkor1V7eheBn0b2Wg0Joh2wCMy8+TnHM3cc4Qqfqgkx7DQ
 Gn1DsMoCVMA/yAM3xcwCIMW0vFmL4/jxbnqU8JWxMUISj4rCxUUC8LQzeg/Z3bFO2q4fw0oB8vk
 Rz14yVpXD1zhuIcT2GAwevrwjE1gZthDv9jqgSH/PlTbBIcenRRgIg3kJLizgMOXvkpWpTd9tTV
 3V/KsymeWdZdamOhC8kOv6L1njG+oZs91BvGvKM+7RjAU7QshNMqKW7Zezb9zh6Aevc1tLLsnRd
 Yq5RHYy2PWIiphCrKDaDI4YheJKvS8ocaEzaSlYlrupxonoIyK6IoSbTvl94+4qZ6reJDaXvT+5
 Q7WCLa78HhJ3lrs8ebtFgk
X-Received: by 2002:a05:690e:1c1a:b0:67d:bc6d:a4f0 with SMTP id
 956f58d0204a3-67df43cf2a4mr4898537d50.23.1795441056388; Mon, 23 Nov 2026
 05:37:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165546.3050013-1-peter.maydell@linaro.org>
 <awQ-vnYjY8BEAdFi@linaro.org>
In-Reply-To: <awQ-vnYjY8BEAdFi@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 13:37:24 +0000
X-Gm-Features: Aa3M54ozPfJrsImcufVrU5GEVI-9eKkCGo-EwixlTJzMf1AzRtj23n8cjYPXAFQ
Message-ID: <CAFEAcA-j1tady8pueaLqrWEj5La74qsaU6hmGoergbxM1cfq2g@mail.gmail.com>
Subject: Re: [PATCH for-11.2] target/arm: Handle "PMU disabled" in migration
 validate functions
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 13:25, Jim MacArthur <jim.macarthur@linaro.org> wrote:
>
> On Thu, Nov 19, 2026 at 04:55:46PM +0000, Peter Maydell wrote:
> > In various test functions for VMSTATE_VALIDATE() fields, we check
> > whether the migrated region number register is within bounds (i.e.
> > less than the total number of configured regions).  These tests fail
> > spuriously if there are zero configured regions, because then "x <
> > cpu->pmsav7_dregion" is always false.
> >
> > When we allowed v6M CPUs to have PMSAv7 in commit 157f6c69edd06, this
> > exposed a bug, because we now have a CPU which has PMSAv7 according
> > to the pmsav7_needed() function but which is configured with 0 PMSA
> > regions: the Cortex-M0.
> >
> > We could fix this by having pmsav7_needed() return false if there
> > are 0 regions; however, the cpu/m-security vmstate struct does
> > migration of the secure equivalents of these fields, and we also do
> > a VMSTATE_VALIDATE that checks against the number of MPU regions
> > there. Making those fields be migrated only if there is more than
> > one region would be awkward (we'd need to pull them out into their
> > own vmstate struct), and it's unnecessary -- migrating something
> > that's all zeroes and not used isn't a problem.
> >
> > So instead we relax the checks to handle the "no configured regions"
> > case, insisting then that the rnr field in the CPU state (which
> > should never be used) is zero.
> >
> > Similarly, we adjust the check in sau_rnr_vmstate_validate against
> > sau_sregion; this one is currently theoretical as all our CPUs which
> > implement the Security Extension have at least one SAU region, but
> > architecturally it is permitted to implemnt no SAU regions.
> >
> > Fixes: 157f6c69edd06 ("target/arm: extend PMSAv7 support to v6-M CPUs")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  target/arm/machine.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/arm/machine.c b/target/arm/machine.c
> > index c3aef3f3301..d624425c0dd 100644
> > --- a/target/arm/machine.c
> > +++ b/target/arm/machine.c
> > @@ -593,7 +593,8 @@ static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_id)
> >  {
> >      ARMCPU *cpu = opaque;
> >
> > -    return cpu->env.pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion;
> > +    return cpu->env.pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion ||
> > +        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_NS] == 0);
> >  }
> >
> >  static const VMStateDescription vmstate_pmsav7 = {
> > @@ -693,14 +694,16 @@ static bool s_rnr_vmstate_validate(void *opaque, int version_id)
> >  {
> >      ARMCPU *cpu = opaque;
> >
> > -    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion;
> > +    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
> > +        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_NS] == 0);
> >  }
> >
> >  static bool sau_rnr_vmstate_validate(void *opaque, int version_id)
> >  {
> >      ARMCPU *cpu = opaque;
> >
> > -    return cpu->env.sau.rnr < cpu->sau_sregion;
> > +    return cpu->env.sau.rnr < cpu->sau_sregion ||
> > +        (cpu->sau_sregion == 0 && cpu->env.sau.rnr == 0);
> >  }
> >
> >  static bool m_security_needed(void *opaque)
> > --
> > 2.43.0
> >
> >
>
> The logic makes sense; it would be nice to have a comment in there explaining
> that RNR==0 indicates an unused value rather than a genuine region numbered
> 0, but I'm OK with this being applied as is.

Yeah, that's reasonable. Something like:

/*
 * field is migrated even when MPU not present: in that case number
 * of regions is 0 and the field is RAZ/WI and also 0
 */

?

thanks
-- PMM

