Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E8CCD98CE
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 16:37:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wY4sQ-0006Df-JO; Fri, 12 Jun 2026 12:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wY4sO-0006Cn-TA
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 12:37:00 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wY4sM-00010h-Du
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 12:37:00 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6607048fa62so1237264d50.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 09:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781282214; cv=none;
 d=google.com; s=arc-20240605;
 b=MoIyOQAQKDDrb1QKGBa2rxHAFAso5+Z9dDAvcopVQqgP95nVQllIA44DR/XSGgELJU
 pjGrsJQys24I5vW1GFGwu4TylOToKkUWxwIDMTc2z2dAbkPVcCI/7GxR32yk4xTpHfb9
 N5yTBuNhlBfFld/ihwLJdcTwlpHsRZ/08jr0yLFPDyET4HfXcoAZFcoyeVtAJuCz6gRj
 fTvm0wh2shmI6e0SJ6uNFlq7b4LAXNJMC8Mpl003GEGjldBTIFs36AOTvvXkLdry1W7h
 nZ8c6A6E2hDdFxWmw8AM8BMisNWuVIYDO29ujAV+tC/A2VV88KF0qUv+kMBua3x1FlYF
 6YGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zwXYwFMmWcXDkYRzgXTSPi/0vzhQdUkmxVByW2NUFQg=;
 fh=5qO1AXDTrGa96Zd7txnQ/IGT9u2nDNoqIjdjjXJwD8A=;
 b=kLL+qzBwR7klqXzOOi5bfm5OsBMHXiTwPmo9nQ+09WeCBfJWZu3j3T51po7TSDqRqP
 EGACb89O4UQoT6z6DHOkrOTyzF3ngvk9IVC68IckJ7ZszCAM17C+OrWprm0rxHPn9b36
 LcLWnwdaou4Hg9OcfKq1JMhoYNCQ5Qw8QjNXF27NwaHt7+3KsjGXO9OY9LGK7YVCnANU
 6dKo3XMb8n/KvF83kyopSrdPa36jt5INyKXyuGBxa/xAI+q9KV8fxm6kgQmPzJXm+Nxg
 LGbuNXWjLMjXq1aHWG2Bj1R7EVeKmp+MqYjx612V8K/BRJS2TAGSNIWXf4oLxTg/SdTm
 LYXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781282214; x=1781887014; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zwXYwFMmWcXDkYRzgXTSPi/0vzhQdUkmxVByW2NUFQg=;
 b=stIBaXpyvSOdPPtgdZdfSs1K3A+XQkWcb7eEDLQ4aVRMACPQV8hm13B8peqEBZUlC7
 oYSv9ZyV7HHvCsc/Z28Z6430G3nk+TyoinLBOrmS+LkNaLZ1INfEsL6CEcJqUv21KNc5
 MaZx9WmW5cuLl9jAEnv3CMd1BYA7+TQXt7+vNvoB9EVPQKF4DQfisOYx7VUsr0F/9fnV
 jMQ44b2ndk9pIBP/sPriZd0IpDIzaOAHIslcuK5vlUh++qUbLUUt2LhCRO3xYaKwCUmN
 Dt1Wjt4Im4IUPE5LXA9g3MrUDVGnuiBjQwPtTn2RGbbWPaT7ZnEsT50nFP/d4NCR9Vdw
 QxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781282214; x=1781887014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwXYwFMmWcXDkYRzgXTSPi/0vzhQdUkmxVByW2NUFQg=;
 b=Xf+c1kznkxVtV1FPQLen22QzRIyuEDqer+Z/XEbiFf6IzK6VMtGY9RyBR5AxRNoa8F
 t/+fwVSACo+qhg2frR10wgxUDh+d5mXMtNKRJCg9eo25nC4yMy1YlpWdZfQKIfavXdM5
 vzw68pjp4TNWVFiQaUbhlGyjoYqNk81KhXEfnFU2VcCBaQA3qD/dsBiup37nm4lzr5wv
 gojI/9sH/r3cSQ8gLFKemhHUkkITHddsBJOn9auUy+a1SNNrp4J3Foxkwo0ApPGOVdAA
 stDkkxT6JLsm1u5FteIiwJLMwp/KDGNkTzHx+UXVFuqsDkCoqt3N5Jzy32sQM8KrLbz/
 KJyg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+yhWQEU1zOMYkkYU8aGIrCMfxmgAcNx8yzE27Ai+u0PjB89Tp/KW3LdlRRP6X8l6ku0xGN1ql3MA==@nongnu.org
X-Gm-Message-State: AOJu0YxVYfZNmkrr85VX+h0+ll0bNYtk9Z+oJvO97CyNn4bX2XbTro8h
 qPorsiSwoDD6x4NkNcjFdl6DWkRJDj7ZrrIiSi/wz/pzrIrVk9TIlzbr3SVCY9ZNCOd29CdfPRR
 mUrlUWfBafRN6vxdVPdxBzn5ZUnJE1BLFJrtSIE2H4Q==
X-Gm-Gg: Acq92OEx39TfqkYQ17mR2ZRNvosl+VYoHA+a4X1hoZO5ShzQgiPDvCw5sFBqGim8z5P
 lP69KzFKSBIU+q+pc/Nsu7CctFVqhVax6cfDlGLw6o9HONhtMbJZk7qKPED4EDV1Qe445gAkgAO
 FI3dRWJ2wY7rX8UwsKwhZ5TQYwVZZSYrlsgpxDwuBpk4qLpBIOJLls4gKF/Krq6OC1+YrHeMZYt
 HLl7ey/6vW4xEF81piOnrzqZbndBNqnRvY0Arjlc1KnhT86YmQoebFAh1DbfZCSpW60YTppyWCc
 7mKOcYLlRNJKMx9U9VRZkKViGnR1VdGuY7vTANNXZayohu5sYj2rzBjlz0qAid/lOss=
X-Received: by 2002:a05:690e:4194:b0:660:3b5c:69f8 with SMTP id
 956f58d0204a3-66278365e0dmr3046602d50.59.1781282214471; Fri, 12 Jun 2026
 09:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
In-Reply-To: <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jun 2026 17:36:42 +0100
X-Gm-Features: AVVi8CdMu-7uYvT4bAX8tK5C71T05n1JYXUMFvRcSVuF3kTgZjpRWZEMgAwuw5A
Message-ID: <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
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

On Fri, 12 Jun 2026 at 16:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/12/26 04:03, Gavin Shan wrote:
> > This replaces mem{cpy, move} with __builtin_mem{cpy, move} in the memory
> > accessors to ram device memory region, preparatory work to make ram device
> > region directly accessible and bypass the bounce buffer in the DMA path
> > in next patch.
>
> memcpy/memmove *always* compile to __builtin_memcpy/memmove, and the compiler later
> decides whether or not to expand inline.

Yes, but if you pass it a fixed small integer, then it is likely
to expand it inline, whereas if you pass it a variable then it
is likely not to... The patch is attempting to persuade the
compiler to definitely do an inline access for 1, 2, 4, 8
byte access.

> So, this doesn't do what you think it does.
> My real question is: what are you attempting to achieve?
>
> (1) is the problem unaligned access to a mapped physical device?
> (2) is the problem vector access to a mapped physical device?
> (3) something else?

I think there are two problems we're trying to fix here:

(1) If a device does e.g. a pci_dma_write() with size 1, we want
this to turn into exactly 1 byte write into guest memory, for the
normal case where the guest memory is real host RAM.
This deals with the e1000 bug where the pci_dma_write() turns into
a call to glibc memmove() with size 1 and glibc's implementation
turns that into 3 writes of the byte to the same address,
and then a guest write/read might interleave badly with
the extra writes.[*] Similarly some devices specify that they
do definitely do DMA accesses in a particular way (e.g. the
Arm SMMU spec says that the SMMU reads 64-bit page table entries
as single-copy atomic accesses).

(2) If a vCPU (emulated or KVM) does a 4 byte access to an
address which is in the PCI BAR of a vfio-passthrough device,
we want this to turn into exactly a 4-byte access to the
mmap()ed memory which is the BAR of the host device. This
is because that address might be a real hardware device
register, so it's important to access it exactly the way
the guest vCPU asked for, and not do multiple accesses or
misaligned accesses or whatever.

(The reason we make pass-through BARs not "direct access"
but instead go via the bounce buffer is that we were working
around (2).)

[*] I have not fully investigated the e1000 situation so it's
possible that there is some other issue also there, e.g.
guest or device model getting barrier semantics wrong. But
writing the byte with the "done with this descriptor" bit
3 times rather than once seems like asking for trouble.

thanks
-- PMM

