Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC13CD98C5
	for <qemu-arm@archiver.kernel.org>; Sun, 14 Jun 2026 16:03:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYnHc-00069A-Ci; Sun, 14 Jun 2026 12:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wYnHS-0005yJ-Qn
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 12:01:51 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wYnHQ-0008WE-3i
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 12:01:49 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66077c46c5cso2244921d50.1
 for <qemu-arm@nongnu.org>; Sun, 14 Jun 2026 09:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781452907; cv=none;
 d=google.com; s=arc-20240605;
 b=DmirFMB6uMWHzrhkR8yICf6p3cBT3vWIovRNzhUjCmFi+gYhULP/lX/o8GepH7PbiS
 ltcKlqix4VgKHxrJ87hxcJQl5k/F2AYbJnc7NykSirKYbC11GRlE2x5agTcfVCNiiVZN
 ZSlHqxDv3mOqDI151zIr42iSAyJFtX+iq7I92aUO3RMi0MfEO/KQsbUPlCtLWSEWqvg0
 uhqQ3Z4zY5ehn+pY3PURXLyx/+RFEWQhiHx0EQb45rv3UmhgLPC1F5aoQshHWfm4pdQs
 ayzlqUjPzA96c/3lhp1hdPUKbio/mk3p/VyYDCqFeR/T6Xtc2+lJVNmZAKDoBkBltcTR
 9oIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dQytVQWcZXAqTTjCK9UpPejll8FQDEY9Z5Xat4SNCF8=;
 fh=geu25TsK9u3gFBDMN32MnwRBQkTQy1pmv2Nkkwi5DkE=;
 b=YI1D+kEw8blQ/zQdHnNfX5J2xLpnsbYH+hNFsbaU6rtPWZWIoArbDjOF2eMbNy8aEA
 ZF0MLjAZpcv9oY4Hd8MaYj81Sr7t4mmodAiFRnYUFVvvcUBHszQ8xOrwFZjrb1qkr03R
 1m+fIsDAYj99pDfCvlQapyeuQ5ofdTahlHYglGUOk6GaFyhoOO/oMGJWcksqCZ9Xm8Rk
 IN920c6cAXxF7dkz/GpC1DuFycJ67kox8/TgbR0IAScMuZgKkaZf8/wEfScDRvuHaZmI
 yMUBouYheItJ08QzPrBMpmb9d+W4D16SwJw4WaTSH6bJJDLMxqJodCW1wL73Jr67lVr5
 ppMg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781452907; x=1782057707; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dQytVQWcZXAqTTjCK9UpPejll8FQDEY9Z5Xat4SNCF8=;
 b=IdVoQt8xd+LTlpl7gRVBB7Jyr6/O5KllWKfkF/1f2ochWJKkhC3V8RnYYwkXx7xfJL
 alcq9yE0/ap+2O2QIb7wM04giX5xRX8z3UTkEIn9bVJLIuhsKD23iQs/1ZirAkzfbwrF
 3DtqFPi9OO8kGyqs7DB7gyWu7y1zbT/jQq6vRRJmV6RwPEe91iCaNcpIg/yN1XMl9+Ru
 WlHZlZNCZhE2d+3m5PJZfcBAa4TYuIVGTFQT8ExXt+WPEBi8GKOTXh12rWht+zji4ZOb
 DzXNWl/4alk8LTaMXdSZhSO4RrBJovlmSoRijANYrIhuprtg7FMsklmYy96u/fQFP5v0
 RdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452907; x=1782057707;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dQytVQWcZXAqTTjCK9UpPejll8FQDEY9Z5Xat4SNCF8=;
 b=fAUgSc7M5pJTlKMqBb1Zyo10S/vdEDz5/StYApHNjMFAHin7KkuUyZ6FSFW0mi9Zjm
 Q73WBuoFAXCcqeUoytRy/KMC918C9NJDzDEvYZnF4rxlKdq/uKEi7qopya5mtHbmteCM
 aRQr+Ot0S4OT19N3/pHyan8OxTJ81t6HAWHMDbGWsdc6bjks0pWEd7OC7awWlNIusiSg
 yy2zW6ANcLKqLvSXm3ygEShDojsOCPNonDN+UeYmYCvLTsmvM9S+E9Aqnn/mRJIETjo7
 hmIl8sQu3MB4ZbwbkmV7l57faGO/PTjG3LujhPStaLnpo7mtHBUiHkN7V57zomq3pdOz
 WYag==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zj0QDn7/XJzzFycboqv33UkW0XP7jp7XLeTVY43lt3Ew1yVOYjJvcwAuh2Xhdsxx2DNURkWSI1g==@nongnu.org
X-Gm-Message-State: AOJu0YwIaUgxLW0gvd0uF6Zh9qBlJkTyJkeNFUdYBxSMiAHuit0h20/z
 d1WGjQ0tI8yhvv6WKGR1EByC2ixFVITOytEVRMnn4U68BvSufs4oHRTXyOGZAFJpsDAQi8Dm8TS
 ihRg0IqNOEn+ZJkETKgPrZEoNouVP30k1UiqSNfobMQ==
X-Gm-Gg: Acq92OEb1OlFWvy4WM6+RAY9LHxPis0PJWXLxaTQEBh6MRH4RRCu2azJZowWy/aOOX4
 EUrD6d42kVdjg8+JIRml7NBc5vbMR/fqqgRee1XRNhNJWOxqqgROYFAYnZvCCTJZwPxjIQ2LYX2
 Eh8TL7a2d/JAHkKQhSq/X0c4b3UifSvxseDjitrbzOLXpE1wsULaAypZhu32kh8BC+GjeMT2r+w
 A++izf+q/nfNVxys4UwimW89Cc8toyN7DTbWUpEmG7YQ757SuaDxbCIM3d8Ok4Qwq894aBxkPVc
 UPdJzcrku4ap5pbQxhEddm+CzG31LUSIuP9nVqToWiQCIEXs5Vsa37uLwRzIgYOMSaY=
X-Received: by 2002:a05:690e:b4f:b0:65e:b4d:c76e with SMTP id
 956f58d0204a3-6627831d91emr9180165d50.37.1781452906682; Sun, 14 Jun 2026
 09:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
 <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
 <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
 <20260614084004-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260614084004-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Jun 2026 17:01:34 +0100
X-Gm-Features: AVVi8Cenx2TdWi_PCbxqppIac2wgcybvx6kabFHt0oY84uIT39Ue05iIFHyp7WI
Message-ID: <CAFEAcA9ng79Z7ALpqqTZQijCyYSoqMNK1Q5CYR_kcYBW9+wD2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, peterx@redhat.com, berrange@redhat.com, 
 david@kernel.org, alex@shazbot.org, clg@redhat.com, pbonzini@redhat.com, 
 philmd@mailo.com, phrdina@redhat.com, jugraham@redhat.com, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Sun, 14 Jun 2026 at 16:13, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jun 12, 2026 at 10:25:35AM -0700, Richard Henderson wrote:
> > On 6/12/26 09:36, Peter Maydell wrote:
> > > On Fri, 12 Jun 2026 at 16:29, Richard Henderson
> > > <richard.henderson@linaro.org> wrote:
> > > >
> > > > On 6/12/26 04:03, Gavin Shan wrote:
> > > > > This replaces mem{cpy, move} with __builtin_mem{cpy, move} in the memory
> > > > > accessors to ram device memory region, preparatory work to make ram device
> > > > > region directly accessible and bypass the bounce buffer in the DMA path
> > > > > in next patch.
> > > >
> > > > memcpy/memmove *always* compile to __builtin_memcpy/memmove, and the compiler later
> > > > decides whether or not to expand inline.
> > >
> > > Yes, but if you pass it a fixed small integer, then it is likely
> > > to expand it inline, whereas if you pass it a variable then it
> > > is likely not to... The patch is attempting to persuade the
> > > compiler to definitely do an inline access for 1, 2, 4, 8
> > > byte access.
> >
> > Sure, for hosts with unaligned accesses.  We still have sparc64 and (some?)
> > riscv64 that don't automatically have such and will compile to more than one
> > host instruction.
> >
> > > > My real question is: what are you attempting to achieve?
> > > >
> > > > (1) is the problem unaligned access to a mapped physical device?
> > > > (2) is the problem vector access to a mapped physical device?
> > > > (3) something else?
> > >
> > > I think there are two problems we're trying to fix here:
> > >
> > > (1) If a device does e.g. a pci_dma_write() with size 1, we want
> > > this to turn into exactly 1 byte write into guest memory, for the
> > > normal case where the guest memory is real host RAM.
> > > This deals with the e1000 bug where the pci_dma_write() turns into
> > > a call to glibc memmove() with size 1 and glibc's implementation
> > > turns that into 3 writes of the byte to the same address...
> >
> > Gotcha.  Easily handled by not using memcpy/memmove at all.
> >
> >       *(char *)ptr = val;
> >
> > is sufficient for all hosts.
>
> Yes, I think it does work because we use -fno-strict-aliasing.
> For bigger sizes we'll need packed because the addresses
> could be unaligned.

IIRC "packed" will cause architectures that can't do
unaligned word accesses to emit code to do byte accesses,
so you don't want that. You need to explicitly check alignment,
I think.

> But again, qemu simply already relies on this in bswap.h
>
> I kind of dislike muddying the waters by making several
> unrelated changes here. If we do we should change bwap too.

The ldl_p etc functions in bswap.h provide different semantics:
ldl_p() is "do a load of a 32-bit quantity, even if the
address is not 4-aligned". We don't care if the compiler
or the memcpy ends up doing that as 4 byte accesses, which
on some hosts it must do.

thanks
-- PMM

