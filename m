Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3615501ejc;
        Thu, 16 Nov 2023 08:38:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGm/fj6PbqWc7BGnUSWbp63R1VgTjcs82CMb3sppPt80kiPHDEFEA1tJfz3VZZXWp+gPtu
X-Received: by 2002:a05:6214:1649:b0:66f:ba8f:39a9 with SMTP id f9-20020a056214164900b0066fba8f39a9mr10198977qvw.8.1700152704016;
        Thu, 16 Nov 2023 08:38:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700152704; cv=none;
        d=google.com; s=arc-20160816;
        b=RhFt0blHSa7R0ppg3u5Mfej1vHzpAZDCqoKbHM3q1BB5VCisUKdtdWmIXFCzGFw9HU
         o23qAmo3tmcgLkSD/wAReTZQoCPcQBpNl3yJkNYPulRTgcX6V2UxS/Sq/cqUo20XWIDD
         teduTjJRzs6H3IM7VozxAhOLR7TQFKqr2qE+HMjdTVlbQBCXCdSV8MF2ctl7zhdAX8UI
         Xuqv2/IzV5+9jnv7UjaO5NiHxcnKCxWX1wzA91P1fZ3XWEfdvjK36E2LRyBiiA9kSEit
         HfcopDUUAbQKPmsFWDQ9klkRE8s7ZELEMGOVHGrrZWRE3Y8CE4uejmrRGYl9/CpbAlqx
         WGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ktGhejA0i54v/J4kYe0bRHlQH8aSFbAJWN6VW2Ab7ws=;
        fh=c9e8ZdZT8wwMBwRGuaC0xkbztqutrDCy/JBNLaqw0pY=;
        b=VK76DHXUxo8nd0dccPDPbLAO0kat+v27GR31t8zoyHpZrCki5AE0mLhIf52bGMYlgc
         kQBclgx0mkPTTr/vqF8TALDCDgvN7JhUOlEJT7bO+8iTTL1yG23hWf+giMkv95rwxJFl
         dqLk7SklssOx6AKV3iJvgbTAL/yy/ck9hqszP+0Vb5iwsrOuOuuL+u6OcJgeywzEPVVd
         awaS1ca08lE8TcGKYIub6VV5pbdACRz58YVWQcJQEMt0swFGDJvmsYGhOg0WhII2wjY4
         Bu/L3Zk/ENuUEbMXMrpqqprO7WpjPVsYaOLsYpiTWk/36nv+9sZ71UqZwY3uFy5cDlQB
         vsYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOfmTgVc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qb8-20020ad44708000000b00670de8563e9si11219689qvb.444.2023.11.16.08.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 08:38:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOfmTgVc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3fNc-0005bY-4A; Thu, 16 Nov 2023 11:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r3fNa-0005SG-5I
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 11:38:10 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r3fNY-0006EX-AP
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 11:38:09 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9becde9ea7bso442748566b.0
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700152687; x=1700757487; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ktGhejA0i54v/J4kYe0bRHlQH8aSFbAJWN6VW2Ab7ws=;
 b=NOfmTgVcU8feKjQMn7/mvAQWrZfgpsNhw21u+VT+tfZ+DFfe1bxLUjDZs55az8KFrT
 pMcwN9rx4zmLKSaXV5P+sI4RMBIxHGAxdceGC1eK94nqAqo0w0ctIGSk4zxsvTnlXjE9
 4aVoh94q6UVUiMh1IiOkkbPHDknkddgVuoFMvX3PcUgzr5xz/vJDSwGU/YrR++e5jDQt
 9x4RRt4XNJgnlbfANOd9/3g+i6U4y3gGZ36qeAGM99hAcJ8QyKo48T4rnH0+g0cc2i5j
 83rALjb2+qVqRRV5QfNcJaEYdRt4po3PLsm9W+xomsmGZR6X6M6A/LKqnu7tFxZ1cItn
 fkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700152687; x=1700757487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ktGhejA0i54v/J4kYe0bRHlQH8aSFbAJWN6VW2Ab7ws=;
 b=LUD7AU5a3kLng2q1UqnQQHwHqLYK7/4BBz+Z5D1NxlUhLlYKVoEypBMU+kPJWgfrKc
 FrqS6nGymS6W5vWFNmkzy1z+hgvLA1YfPqmHDASTdGUV5+IsZiqULLFiD33rJT6HYLDi
 GY0oQpYsrJ0hYIKcfpqQTlZS7EAf74m/WGGGGAWwF7WotPJTsCHTEC+3aY9mk2XLAxq/
 XBkF2QtxjGWMdiVOAeb2f7F+2Jjyr+OEwprx2HnsDZ922NGlG+v/5d2KY75wkld4gdNh
 ZwUmlwKDPFWk7NLS+6oIkoka0LoSg/UOwVfaInZe9zNwa0XXMeHQvdU70DzFmtPBNTer
 HAsQ==
X-Gm-Message-State: AOJu0YyQQ6gxyoJ/ti0lk1qqnIm+diyIlCnzStmEeLIOuMjTjeoNC/5B
 RLjF3/diB+TlDlwiTPyo9IETeOj/QxFMFV7yKIVy2Q==
X-Received: by 2002:a17:906:4b42:b0:9dd:b919:79bf with SMTP id
 j2-20020a1709064b4200b009ddb91979bfmr1886337ejv.36.1700152686797; Thu, 16 Nov
 2023 08:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20231114165404.681826-1-ben.dooks@codethink.co.uk>
 <CAFEAcA-MG+ak8+xVyqgpWqmKAryOXJtOckUmA=GysQwnpuz5SQ@mail.gmail.com>
 <78989536-e29c-4ce1-a972-36be6c70349c@codethink.co.uk>
In-Reply-To: <78989536-e29c-4ce1-a972-36be6c70349c@codethink.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Nov 2023 16:37:56 +0000
Message-ID: <CAFEAcA8vZUZBADX109gCohhxxX_mdOp6h6EEOW8VgBYE6mNYOg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: ICC_PMR_EL1 high bits should be RAZ
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GiorHltrCJgt

On Tue, 14 Nov 2023 at 17:23, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 14/11/2023 17:14, Peter Maydell wrote:
> > On Tue, 14 Nov 2023 at 16:54, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >>
> >> The ICC_PMR_ELx bit msak returned from icc_fullprio_mask
> >> should technically also remove any bit above 7 as these
> >> are marked reserved (read 0) and should therefore should
> >> not be written as anything other than 0.
> >>
> >> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> >> ---
> >>   hw/intc/arm_gicv3_cpuif.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> >> index d07b13eb27..986044df79 100644
> >> --- a/hw/intc/arm_gicv3_cpuif.c
> >> +++ b/hw/intc/arm_gicv3_cpuif.c
> >> @@ -803,7 +803,7 @@ static uint32_t icc_fullprio_mask(GICv3CPUState *cs)
> >>        * with the group priority, whose mask depends on the value of BPR
> >>        * for the interrupt group.)
> >>        */
> >> -    return ~0U << (8 - cs->pribits);
> >> +    return (~0U << (8 - cs->pribits)) & 0xff;
> >>   }
> >
> > The upper bits of ICC_PMR_ELx are defined as RES0, which has a
> > complicated technical definition which you can find in the GIC
> > architecture specification glossary. It's valid for RES0 bits to
> > be implemented as reads-as-written, which is the way our current
> > implementation works. Valid guest code should never be writing
> > any non-zero value into those bits.
>
> Yeah, got some proprietary test code that is trying write-1 and
> then assuming read-0.
>
> > What problem are you running into that you're trying to fix
> > with this patch? If our implementation misbehaves as a result
> > of letting these high bits through into cs->icc_pmr_el1 that
> > would be a good reason for making the change.
>
> See above, local test code issue.

Ah, right. That is technically bogus, but it wouldn't be
the first time test case code explored the UNPREDICTABLE
and IMPDEF reaches of the architecture :-)

Looking at our GIC code, we *will* do something wrong if the guest
writes to these high bits, because later on we do checks like
    if (cs->hppi.prio >= cs->icc_pmr_el1) {
that will do the wrong thing. So I think we do want to mask
out these high bits (being easier than trying to ignore them
later). But I think we should be consistent between the
icc and icv code paths.

So if you want to write a patch that either:
 * masks out the high bits in both icc_fullprio_mask() and
   icv_fullprio_mask()
 * clears out those high bits directly in icc_pmr_write()
(whichever you think looks nicer) I'd be happy to take that upstream.

(Currently icv_pmr_write() happens to be written in a way that
it discards those high bits as part of the deposit64() into
ich_vmcr_el2.)

thanks
-- PMM
