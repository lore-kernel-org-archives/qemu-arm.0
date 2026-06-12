Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183D9CD98CF
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 17:58:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wY68S-0004lz-A8; Fri, 12 Jun 2026 13:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wY68R-0004lk-Ih
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 13:57:39 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wY68P-0005oP-Qt
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 13:57:39 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-66077e90382so1147145d50.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 10:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781287056; cv=none;
 d=google.com; s=arc-20240605;
 b=UhK2JNuBHj0ffifZgcu03kGiikuG0JoxMkBTnXdk2xHbL0h28JzhKuddwnzCQgQk1W
 ulU+Tec6QhBV+ibO220QBFAIGzG7yMd3QXYlTZqb4r4PTCP1NApYcREe8ZiVkzxTh3L+
 dV+hJXKOtVZzqUWARz1t3G6o6SVtZs1AtKjXQSnPcrU5bsA3pd5IWgTaJa/Yjjag/msL
 oDlqzrGJgcZ9b1yf1R5JI/es9bamM21kOfmSQr5AU47m7Mn6WbtCOHwVHr/9TCgiHsss
 Zg9KTyVekCVZeU21+cI1TSNLG2rcNQgG6kFvlobOed72D8I1GJp17Nilu1iNaGJHS9fn
 BFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3THv8Qi4hyunfp/vz0tV3yj1xibK7B5wQwcsxGjL5kc=;
 fh=6j5UgVEN3KdxK8rjeldRyzBYLDdVkpyCeWWYeUYgMas=;
 b=EU9b9nnbjMtAcUyKdDsh/ytjr0sSjSZn9+W68dw/tBB/CC7Asg90rQHA6a+UsiYZeu
 ThyqiiTmyL5z5InK5FRs+AfcR/jIFDWanIizpDvq+7vPkoARFMz548ozYyzHF3UQSyVL
 V7dJS7kl7kXMc7OENao//kHzpakwuBz8X5UV5aYEP9LH6QXopK/H8509t4IwgDzSzLBE
 qL4ctUYOnPMGwnuhiS0GVDBHPDxqWL2mclL/gVO6g1E89dnbiGmYX7Ko3Uf8sGhwF8Y+
 MIrMxqNmWlEgEhEGiNIOwnRVbwwTCEEcKwFA/Fz09OwI6uL9ooB5FT5iaeoeXFcFcOkI
 Pm+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781287056; x=1781891856; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3THv8Qi4hyunfp/vz0tV3yj1xibK7B5wQwcsxGjL5kc=;
 b=EelvOZ+Totzk/AgpsVDxBMi0EgAgJRGyzNZRbu5n041qLBZmcV6Yag5cGPvtdTnS6u
 3X9VV9m8U46oiK6/asW56Mc+rwV/I/qIRhp7zhqDnkuz33dQWP2blgjxk0QK/nTDvjTh
 t3ClCnGqJaam9No67lZCCyNs0NXIfykqBychfTWskNhbZ7uMug7IGhyM5JQjzPj/n8By
 GoGpD7n63xrRquyFqUK2/V7BWXU+NjJ0gzuhEPqXH4j2bWnM/MKUHzZZR3yEJfgbSHdn
 JjxLJBmHQ710K8Lc8gPSV8n5tNSQLciIgTAZVik8CGOdUcItmJ0uEj9i916m1nhpOD7H
 HAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781287056; x=1781891856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3THv8Qi4hyunfp/vz0tV3yj1xibK7B5wQwcsxGjL5kc=;
 b=KsHaAn+gyJSAkeVFzADcDtiGaOHYtPaJtTI2mnTdUqVgzutE76p92dINfT+v5IynKh
 qryMw+CKkXDKaP/lkScb34zHeEBD8zvAEgHIqtK15SIXPGM9uF18fXc3tGcQvvHTaUD8
 LVGfoXi0Ia6R7nmVyN35u8g3OBTw1ECrS6eQEwNXifeKCuInUK+DQgFMKtXLts+MejFe
 mZy0zXpDRF3rSFQZqFgya2PyxeMFbyX2ZoI5uCsM1v4o9KkcMYMocJUVEtVicskEwEJK
 yUmbwAGnED72INn2cFvD+XBFGoLloYepzO5dlUXj3JgCFGeaKSPAiguQ5zkOPAblPT28
 8Hqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ97OrSEyksWyYNX2A0gZ5UmMHNV66qqEgYVDhRqXIo5BbEy3JW5KRBZZ3TsTE3dG1XJcWGzy7xOFA==@nongnu.org
X-Gm-Message-State: AOJu0Yzmai5Be5qqXr3l3Y+ZP8GbhXXwBwOKea+0BzshyFRd/IQb9iV4
 pU7SGqU+fS42q9HlNu1MkAMtHhVBQ/UEZU7gBvretA9aRiFz8Xd2gUYlaqozElZvc6lTWojG0g+
 OtgazQQGToySRiENmn+ZcyeEU+VaG+mLnDfsikBhnEQ==
X-Gm-Gg: Acq92OF9vg2e+4hHOFWwuNxHZFD6S63K4ggNOFTmM65yx0n2zHTGNIIG6CvYr8M566A
 s87HlUtN7L6uIvSidRZ+xnI57vHbGkqtJSunBPn3wssjl6+zW04W1zf1E88oEpKaglLGsv5nlKa
 r9Dfob1+2YNvk7MPf7poJd7dpZ2GTwYVvusIboAErOPJ3ync3T6jZAsK2Q0PlgHIY+n9EF/LLgN
 OUKUfFqQzumSen75Ee8DejtEtl2Jr+M1lZOWHdY1VmL6B8pNZ3TWXE8dML4x0A27jSA+NM9cN0c
 Nk8H1jlXg0fvmyoakrIkAy6xegTsx81RiavBETfPhNxvEvYMNATrQjaWnLPECIEUnkQ=
X-Received: by 2002:a05:690e:1917:b0:660:ea2f:61e with SMTP id
 956f58d0204a3-66277f22ddbmr3391830d50.6.1781287056286; Fri, 12 Jun 2026
 10:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
 <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
 <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
In-Reply-To: <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jun 2026 18:57:22 +0100
X-Gm-Features: AVVi8CeKmPXisQypjXAMmpFlZAVb1milQvGtLbXyNaM3PExZ-b4d8OEY68lFBSI
Message-ID: <CAFEAcA_3AdNjGhk_Jv2N6rFAFCFpHujwGL4gkmcCFNN2AYKJWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, mst@redhat.com, berrange@redhat.com, david@kernel.org, 
 alex@shazbot.org, clg@redhat.com, pbonzini@redhat.com, philmd@mailo.com, 
 phrdina@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Fri, 12 Jun 2026 at 18:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/12/26 09:36, Peter Maydell wrote:
> > On Fri, 12 Jun 2026 at 16:29, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 6/12/26 04:03, Gavin Shan wrote:
> >>> This replaces mem{cpy, move} with __builtin_mem{cpy, move} in the memory
> >>> accessors to ram device memory region, preparatory work to make ram device
> >>> region directly accessible and bypass the bounce buffer in the DMA path
> >>> in next patch.
> >>
> >> memcpy/memmove *always* compile to __builtin_memcpy/memmove, and the compiler later
> >> decides whether or not to expand inline.
> >
> > Yes, but if you pass it a fixed small integer, then it is likely
> > to expand it inline, whereas if you pass it a variable then it
> > is likely not to... The patch is attempting to persuade the
> > compiler to definitely do an inline access for 1, 2, 4, 8
> > byte access.
>
> Sure, for hosts with unaligned accesses.  We still have sparc64 and (some?) riscv64 that
> don't automatically have such and will compile to more than one host instruction.

Good point.

> >> My real question is: what are you attempting to achieve?
> >>
> >> (1) is the problem unaligned access to a mapped physical device?
> >> (2) is the problem vector access to a mapped physical device?
> >> (3) something else?
> >
> > I think there are two problems we're trying to fix here:
> >
> > (1) If a device does e.g. a pci_dma_write() with size 1, we want
> > this to turn into exactly 1 byte write into guest memory, for the
> > normal case where the guest memory is real host RAM.
> > This deals with the e1000 bug where the pci_dma_write() turns into
> > a call to glibc memmove() with size 1 and glibc's implementation
> > turns that into 3 writes of the byte to the same address...
>
> Gotcha.  Easily handled by not using memcpy/memmove at all.
>
>         *(char *)ptr = val;
>
> is sufficient for all hosts.

That helps e1000 because it happens to be doing byte writes,
but the same effect probably occurs for word writes in other
devices...

> > (2) If a vCPU (emulated or KVM) does a 4 byte access to an
> > address which is in the PCI BAR of a vfio-passthrough device,
> > we want this to turn into exactly a 4-byte access to the
> > mmap()ed memory which is the BAR of the host device. This
> > is because that address might be a real hardware device
> > register, so it's important to access it exactly the way
> > the guest vCPU asked for, and not do multiple accesses or
> > misaligned accesses or whatever.
> >
> > (The reason we make pass-through BARs not "direct access"
> > but instead go via the bounce buffer is that we were working
> > around (2).)
>
> That's going to require qatomic and alignment checks.
>
> That's also going to beg the question of the intended behaviour
> anything that isn't a naturally aligned access of size in {1,2,4,8}:
>fall back to N operations of the minimum of alignment and size?

I think in practice we can probably say we don't care and
fall back to memmove: anything unaligned here is almost
certainly going to real RAM and not going to have any
particular ordering requirements (and/or might be caused
by the guest misprogramming a device DMA address).

I feel like we handle "unaligned access, maybe need to split it"
already in multiple parts of QEMU (for TCG accesses we do that
in accel/tcg; system/memory.c has a TODO comment about unaligned
accesses at the IO MemoryRegion read/writefn level and there's
a patchseries that tries to fix that), so if we find ourselves
really needing to do "handle this unaligned access by splitting
it into pieces" again here we ought to take a wider look at
whether we can consolidate that at all...

thanks
-- PMM

