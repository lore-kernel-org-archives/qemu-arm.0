Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB6DC43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 17:29:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgn8D-0005Xg-Ky; Mon, 06 Jul 2026 13:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgn8B-0005Qa-MY
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:29:19 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgn8A-0003AS-17
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:29:19 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-80a123ef90aso1251117b3.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 10:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783358957; cv=none;
 d=google.com; s=arc-20260327;
 b=VOIb1MOPuHr8ZgVI9XO3/EFn8Cqr3a7KnTGG1Wz1IVBk9KzCbSYYaOGInujl5fOQ92
 MQQDcyjFxtV6CmtCkN91xZrLnpI5cgrTQjQ0m+GYRkTbWYz+ez1G3NIg2EcHKuOmwy+4
 Ma7p543DaxbWXRZWMFWvxtHA1Uw+p7DQVtt3OELF7IAKxGH/HHuXNge3RBP0ePbHEEV6
 t6Z58Oli/QcPz6/s8AAWIjEa2TYGE+dgucAtk+du4AXbhX4WdkcCJhvbTUHSODfzyQ3Z
 qS40EVtr9JHr35PMZtXXjbLRdqNRssvW16UfnEUnr4fPLX1NsNVv1IKndhmCTnBQKXp0
 BJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=iClZscjiedIVC78pseYr2AnsDA+R5QCV3UOX/EOYR0Y=;
 fh=EW6cbQKEtjoCOtw6guTNCe6+y9bZT+W1EiOKh5nKKjg=;
 b=bzqEvPyhx+h7dGjDJPEfguxbeLAogBTLQ3LBwYk88xzA0V10FcARvNQBRckB6boY1K
 Nn8KqdOS3jbFbKj/wr/Z5jEj2dUfl5juE6CFaMKRV7shyhP7YG/IH8OE436TA1tPVv0o
 LWoc03T64BYuI6KBmxe70iJrpNKJeC2WwAl/SGyTDizUYj1V/r6886bj2peAa6J4Vrob
 3SfJfw+lCmatiZOL3D/7XKUGr/vb8KzJz7UGCpDqb1k2eWhg3VsAu/7bGWD3bO4vVsta
 HXUhtZJTXNQVNbCFV+s9qm1T5boFqg7/gOyoOfVzHMHniN0Abn0sgxJf2wPqqMqhGEic
 jTYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783358957; x=1783963757; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iClZscjiedIVC78pseYr2AnsDA+R5QCV3UOX/EOYR0Y=;
 b=eoAbHW+rWldDmc83LTA8zHpLS9vvXsMS6p8LeXWdSeQiqIC3omxGcX3wknwYVTAjKd
 QRTXSHvdF/4+1mCOZxu+8LWQTgzLMQjcAAgGn8cEcriUgyjWhFxvDkp6euvZ6xNgasOC
 ZucDuZS87G3tBw+OIftN+LulYqAB+I+nHutnWV2Bi312T46fxrS10VoEMlvN3zpWXfbJ
 OXUUQrB6z68898P1KH8+dB8hJ4B0XuUh6v9WZk1VbRaX9OUGM0NL1gW6SyDsOnfd/xYs
 ND3E2w/vYt8aXyK9cwM3Pw8Lg0x1nYYt1QfAHplNswURSuLyteUYJa95hiFUxzgchsEX
 nTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783358957; x=1783963757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iClZscjiedIVC78pseYr2AnsDA+R5QCV3UOX/EOYR0Y=;
 b=OcxTC08v3TpinwCU7FIshhEHsvLn5mbek5E/K9VvvinrZZjpMfSvEuKAKDf48miPAC
 usJRzbs/KiHtnurjP1kh5C4hXd2rQB/3kML/DELoj9SwdqXZIOlbUenjc9PM6AgLuTp2
 vc7V/TB3xK90fIgHgZrNtLUnHej89F6YzWwuQOOxwI7RTCIAT5kLLvjERAkjBkeZ8QzW
 Be1Ph74syVY5yP3zE14TFvQ4imkHp9gPmHID+M1UYXl9s+a488Ak+PW+0b8eHvelWEMy
 W+PVwc8ZYGhZVp+iho91Tqp02n8Ru6AusOwzbn4E5hQniRqJWRI7EnEYieLvqJ0yCu+s
 z/jw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpv2W1hMdFq+1NOUnVZgyLzIzCE6f7IvPVvEcgP6RWlthPB9THBCvc0SQHlBNhZAHiZfWMJRR12xA==@nongnu.org
X-Gm-Message-State: AOJu0YxQImzCPHGerluJ5P8hEpWIimGirnqd5sd21DRX8oPixKhlMB0F
 4r7mti1dSHq9T534VxjYZ1M8mbO1G3zNoMSJLsCmBL2PGkY5GsZQmr8qvB+aw4vXg/rdzY5bY/k
 GbnhKNRovRsRr23jcAdtBbkgncPdmNM/HZ3gLHfxlxw==
X-Gm-Gg: AfdE7ckNytu+1BwvDj/VUQdnka4rw+Au9itd+wNCytW/yx7QNv2np6ACvh3P20yt9z5
 l6cN9JQf76aa3IpJsSyjnD60o654RzqKV+QWBK0oMMBaNon5ZAfy6fhJ/pvk8FAmP2AIQbnjxbG
 QZxCXzqgov89lxYjHRmB3lLqBfjcn0+3WKHdQ3fhSBTdDdKHsU4MlmLKlJ99442KfFaTtdIODTN
 Ro+XPD7s3tXWQTlmAplnA6M8eG0U/3Wgk+wH7qBVC6cBU8YjpFktj+Rgp3QYRSAQxUy3NHfikxP
 xWgAwJrBjHcUrxT7/u7wXsEvRR0o9vxtHR49xa7ozSIMCJWq1wokP7Ad
X-Received: by 2002:a05:690c:386:b0:7dc:1c56:2901 with SMTP id
 00721157ae682-815ba02f022mr153648007b3.1.1783358956663; Mon, 06 Jul 2026
 10:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260702160640.3875666-1-clg@redhat.com>
 <20260706082023.7ee830b8@shazbot.org>
 <3f799ad7-08a5-44c7-b6bf-b143da038593@redhat.com>
 <CAFEAcA9wOZhn41Twz9zzCBD4MAET2+gbF71kUKnr7r6TXfhjuw@mail.gmail.com>
 <20260706094241.1457bbc6@shazbot.org>
 <CAFEAcA-d9CJhfJQ2B1h+mZTPphc7SKk8yjCuGH4RWYT9J=EATw@mail.gmail.com>
 <20260706111632.64266244@shazbot.org>
In-Reply-To: <20260706111632.64266244@shazbot.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2026 18:29:04 +0100
X-Gm-Features: AVVi8CcJSeUECnvXAjs5-pAw_6n-fWNKrjVxx9Nfe5kiYTX4fIMTgiuUsCcIX2Q
Message-ID: <CAFEAcA-Xcw0FJAgFJ2U7YXxS2cXEsgddAPH_0cajp5rAdjCy+g@mail.gmail.com>
Subject: Re: [PATCH] vfio/listener: Only warn on misalignment for VFIO-owned
 regions
To: Alex Williamson <alex@shazbot.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Mon, 6 Jul 2026 at 18:16, Alex Williamson <alex@shazbot.org> wrote:
>
> On Mon, 6 Jul 2026 17:12:35 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Mon, 6 Jul 2026 at 16:42, Alex Williamson <alex@shazbot.org> wrote:
> > >
> > > On Mon, 6 Jul 2026 16:27:46 +0100
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > It seems very unlikely that anything not page-aligned is going
> > > > to be a sensible target for DMA ops from a device: the main
> > > > reason to have a non-page-aligned or non-page-sized region is that
> > > > it's the way we've chosen to implement a device, or it's some
> > > > "RAM but not general-purpose RAM" thing. If there's a path to
> > > > warn/error if it's actually used for a DMA op that would be worthwhile,
> > >
> > > But for a vfio-pci device there is no DMA op, it either gets mapped
> > > into the IOMMU for direct access to the device or not.  This is the
> > > point at which that decision is made.
> >
> > Why is small RAM different from MMIO register regions here?
> > Those also you're not going to be able to have a device do
> > direct memory access to.
>
> There's a precedent for bare metal, peer-to-peer DMA is less reliable
> and drivers don't typically have blind faith in it working.
> Peer-to-peer DMA also has specific use cases, drivers don't arbitrarily
> pick a peer device to DMA to, they have specific use cases and target
> regions are inherently sized and aligned appropriately.

Sure, but if a guest does try it then it's going to fall over.
This is exactly the same as if it tries to do DMA to a small
MemoryRegion that we happen to have implemented as backed by
RAM rather than MMIO functions. In both cases the QEMU implementation
of the device is fine, and the guest has done something silly.

> Here we have RAM and we're trying to determine whether it's RAM that
> could be allocated as a DMA buffer or expect a DMA access from a
> device.

I think that there are no examples of memory-backed MemoryRegions
that aren't page-aligned that are going to expect a DMA access.
So a reasonable proxy test for "is this RAM that could expect
a DMA access" is "is it page aligned and at least a page in size?".
All blocks of real for-the-guest RAM will satisfy that.

> Commit 851d6d1a0ff2 spelled out that we could have declared these sorts
> of regions as RAM device, solving the problem with a simple test, but
> that wasn't well received (for reasons I don't remember), so we were
> forced to create this mechanism and maintenance issue.

Isn't a RAM device for "this MemoryRegion is backed by memory from
some actual host hardware device"? In this case it is not, so
not a good fit. But either way, if the RAM-device MR is not page
aligned then the guest can't DMA to it either. So "is this a RAM
device or not" doesn't seem like the test you want for whether
you want to flag a problem.

thanks
-- PMM

