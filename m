Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86F5C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 16:13:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wglwB-0001og-Vw; Mon, 06 Jul 2026 12:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wglwA-0001oJ-6W
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 12:12:50 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wglw8-0005AR-JV
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 12:12:49 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66771ded50aso1392372d50.1
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 09:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783354367; cv=none;
 d=google.com; s=arc-20260327;
 b=aGiCsSXk/aGjSwVWjyc5BRUKnCgFsYsspNNnq+nAt8bXXr+Qv3Im24aZr1d38SfNWN
 N5EA1z6hDzKFhZm4ReQHAlsjRfclD4PHM6MXYK0vIhxETjQlQj0Rt83P6kM2Ip2txTcx
 3cUb8aCgCUiq/HHjx3h4nk+7UBVPUUv/PjZwsr7n3iTtoRmU7TSzNXpJ8Q9ZmwDBhls3
 hycPb5BXEDF37kTQN3dCIwwI/fFrgWt/uz8w56zkcGZ0e41vuxsCEO1knzieAM0KO4N0
 G7Wl78A2rfYCNp/h3OSAMIVFADKmE7KXje2MLfYBvHeeFcu6ExDEwCpZ2aISl0r5/zHa
 lw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TOWUY/ws1tfjb+R5jQVl/SdbXEUMX+n+5fLD2DDaVz4=;
 fh=zPbAjdkljmYg2edbRZG0ZXcWbXVXUEg4uef6NBfihfw=;
 b=oxTDY/JZpj/F3ddZJdgR6P19LsMig/3gffcJmN8jH6p1VfhdJhPKfOaOQip3Lp7yc3
 TQSMXmsqjKITK5F/Ilhev0HRWu4MmMINsI6Ta+Q7G3gO8iUzQ1okC+P6Onwy4fVLJxPV
 kktpRUqPr2ZUS74I/SpwWSDFGXz0KsYGHGviyGm1XESuMCyRcUlnFPw8PPjdAxqjagh6
 K5gGPIVYH5jZOqpKqT1T/xNIvLQchsj0FXKHWTIh9PUYpFviStPkpAi24vduQaTGQR+X
 khzBG3QxFjPYsHj7HSxJzaeKuIW+L9YlWyB2Z6rbSp9tuIQGAClEzQ4RvpWg5M0knKo9
 F9RQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783354367; x=1783959167; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TOWUY/ws1tfjb+R5jQVl/SdbXEUMX+n+5fLD2DDaVz4=;
 b=uaprgL51J9A/t4jqPPxMVnKr9obyUJvy210X5Pt0UXqST8RqP6wxV6Jg09NwJox506
 WgHbPUnmSN0TGu+MVsuKPCSaBba1oD15A7ka0xkjALmJctDUwhUa/JLu+XhO5/g7ihFp
 xLLfWQduRMSl7GM7+Rh6/1k159CZ9kOHaxZJcBTwxtU05IuweI3IlN7e/P7N3O0aHdte
 p++0nCiI+654WcVMNcA0HdRDpNik3iobQxDmaHew6gcknUlfS076F/v8zQcoIr5aWPdU
 xaLu9wT8+5P3LAaJjhkiIWzn6QqyY6r8znlhFef1Z3/iznLayY6fzeeJ6B7BPHaQtyoE
 XucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783354367; x=1783959167;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOWUY/ws1tfjb+R5jQVl/SdbXEUMX+n+5fLD2DDaVz4=;
 b=HDTNQ7gKZoq8ix46xMwVpjvwtAmbTXNgC+0CwEnlHcAfgK3UqayshVhi/v2cXUufXG
 arO5RfEc/aAO9euExBgN67HBJQG/hpbGQBD8RHQ0qakU9xyAYj8B3rWs3yftZGHquxeM
 oY0nG9tr3q3/E3gygyk3x2LvxlxTShCmo4WTRVuuIUk9S0OdOsjBRR3mHggeEyJ+2HNg
 9ArCTinXCTd5XEywFI+yAj5iKLdSApQAxWQcorwFO4ByVk3fui6OHHl2cG3fnMg3Wh2/
 oJj9nEzmRX9XVYqyAWTWYFmfgDEPsYllMF3o/ssM0XupMFl2w0RF5aj7PPRbov+PTfFZ
 NDtg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2vVzmoQMqXl8b7m4cnjk646sD+HxoanEqeUTDGu1Gy4/b9yJkNYEYF6ckg7iWs/0DSN3meRKPbA==@nongnu.org
X-Gm-Message-State: AOJu0Yx0HUG2lxv/9gnGITHVSzO9G7oAzxQ7k9SrWjrgV7r7nhTho5OY
 nERm3olaq39TGM8vv9gx6KDnzVAkTcMFX8fNWMlA33PCD9rnL21qG7NPcJgxJuPCIwKxMGlVC95
 BaCnAOTN4z7yoTZ85EIQYMRry54XeXHDTjvJS287IPw==
X-Gm-Gg: AfdE7cm0yldGhGeshM4SnTWGqbGa8B4u5iFmZvwdnGHEVnMCJIds1FI7YLoLnP5OzrZ
 Llm3M9x+NGN9bYk8fMCPSzgf+ROM5q6qUzTvWQdqS9Y62TC1TGB83ZTfce7AgY0xz0+omdi9o1m
 4+RayymkoPpf5sq0rZkCL00fLE84gOkvOv2Zed0LjUNu5hLk5P5RCvmLcZS+2MuqIQDuVkrOzyC
 bQw96kosyPyQ0DeCIlDzWj1Am3I/eMls2sRIYRiSXDJwgjse08QJRk6OU2YW7rcy9cZ/s/Srcee
 T/0TTYEqgLOIXtT70bjXvGyt2LMQwvtg4ZSYQl6ziomaqUbGV4j+UfcKlwsebbskY2k=
X-Received: by 2002:a05:690e:4842:b0:660:a41d:d175 with SMTP id
 956f58d0204a3-6677fcab813mr803228d50.55.1783354366988; Mon, 06 Jul 2026
 09:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260702160640.3875666-1-clg@redhat.com>
 <20260706082023.7ee830b8@shazbot.org>
 <3f799ad7-08a5-44c7-b6bf-b143da038593@redhat.com>
 <CAFEAcA9wOZhn41Twz9zzCBD4MAET2+gbF71kUKnr7r6TXfhjuw@mail.gmail.com>
 <20260706094241.1457bbc6@shazbot.org>
In-Reply-To: <20260706094241.1457bbc6@shazbot.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2026 17:12:35 +0100
X-Gm-Features: AVVi8CevKa91_jD7TwgVELBjvx-JlSWy3750LucH265OMJEUBUd17FqgTZgMCgE
Message-ID: <CAFEAcA-d9CJhfJQ2B1h+mZTPphc7SKk8yjCuGH4RWYT9J=EATw@mail.gmail.com>
Subject: Re: [PATCH] vfio/listener: Only warn on misalignment for VFIO-owned
 regions
To: Alex Williamson <alex@shazbot.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Mon, 6 Jul 2026 at 16:42, Alex Williamson <alex@shazbot.org> wrote:
>
> On Mon, 6 Jul 2026 16:27:46 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > It seems very unlikely that anything not page-aligned is going
> > to be a sensible target for DMA ops from a device: the main
> > reason to have a non-page-aligned or non-page-sized region is that
> > it's the way we've chosen to implement a device, or it's some
> > "RAM but not general-purpose RAM" thing. If there's a path to
> > warn/error if it's actually used for a DMA op that would be worthwhile,
>
> But for a vfio-pci device there is no DMA op, it either gets mapped
> into the IOMMU for direct access to the device or not.  This is the
> point at which that decision is made.

Why is small RAM different from MMIO register regions here?
Those also you're not going to be able to have a device do
direct memory access to.

> > but as it stands I think all this warning will ever cause us to
> > do is add more entries to its whitelist every time it complains.
>
> IMO, that's ok.  That's the purpose.  We're up to one whole class of
> device so far, we don't care about mapping failures to TPM devices.  If
> some day this does fire on something we care about, especially a
> regression, it'll earn its keep.  It doesn't seem like an excessive
> burden yet. Thanks,

The reason we're having this conversation is because it just fired
again, and the warning gives the impression that the right thing
to do is to somehow change the misaligned memory region, not to
add something to the whitelist. That's already wasted several
people's time.

You could add a comment saying

/*
 * If this warning ever fires, then it will almost certainly
 * be because of a legitimately non-aligned RAM-backed
 * MemoryRegion that needs adding to the whitelist.
 */

But I think that it would be much better just to dump the
warning, so we don't have to keep doing this.

thanks
-- PMM

