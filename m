Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AFCCA0EE6
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 16:40:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoPNz-0007mh-48; Tue, 19 Aug 2025 12:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoPNu-0007kA-KO
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 12:40:32 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoPNs-0004yl-Kl
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 12:40:30 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e94dfbf7ba1so1411816276.3
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755621627; x=1756226427; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ijuv8WGHvrkf1N2aB2jxp8BO6m4HBaAKWnu2Iui5e/c=;
 b=diw/J7S1Lta3zlivhK+7UmW4QtFiwZBVnuKRC4EY1S00BRHXkX5PAAXQhYjOhEZA1t
 JRsC/Cvwd9CA+aYn8Q4SKmTGlaP7c3+OS9QxjkgZx5m5JqgQrXt8GlVqgMTGSb+/J+1r
 C8obtHYBynoHHfkAfMvTt/mntVoM0NfAcqB977NHt9sUZ4arxH127p7ibwphGxePe30m
 Zx0k+yhgigSLaVp6dN9JwygQ2iODzrjtdqCJ6+8sLKB8IsfbGZgI0pM4yqJYIbMpe26b
 3IbaUk8Tt7VMO1hbNWOSWPkCRqeB7J8fDAvJtAM/WL8FyDM8sl5uob7NZx/QRafSId0x
 9n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755621627; x=1756226427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ijuv8WGHvrkf1N2aB2jxp8BO6m4HBaAKWnu2Iui5e/c=;
 b=TkVTmJeeEdqDrv8wkQHZOWcthgFOraJ0sj7Ge16TCrMiimlmdp3jypm+8BlYXDwdPw
 pDwZVL0XzpLaIXarI1BrUi8cO89BLsfpu3SjNX/U4FOGdnm/a2qAWpa+cZvFJA31OluW
 qEAZrZfzv162EiE4yLP//tBwujDncnPeYFHaP9LQK/zdMeWZFZY5+RkrG3pizEgHp/y8
 p4LohDA5QWVxzMKYJB8M4DTQjLl6Gk1Tx7RNg3tgSloQjvtPUuGmCm57znheLX/pR3vs
 tf/llmf1Q67F72SNrGxL0M7PBHKkPkBLhPH4oQE0A19Jvt3+j6o/+cvYSQA3RSBh+bic
 vjwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1eU5UnWLSdLV1AX3QnZs6XJjhDb/7Wuh/tzz4rrGux9OR0t+RGWPRhO6Jwo3Jw4HMdSQLZXENFQ==@nongnu.org
X-Gm-Message-State: AOJu0YxJNfYzLMx9e6VRyJgIG6Y0Kwjjw4K8jocTg/onQYs6PZ+pcusb
 LT3OmBfwbNs/mqshtMitoMVTuUFMGELy0EGpv8r70iLdy5x+BUF9uIUJAy4zUQQH5LM16bt1FGM
 QliakCKdp1De9fYs5MfhlWmib2Lldfj3SnXAGU2DaYw==
X-Gm-Gg: ASbGncuE4QJJ6QjpJ1KWoNWMz3GNzmAQxZd8r6fejB8iHlqsiYQasG8Gyt16tu+FIQz
 0xjjCJUUVSSyJlKvQ5Z54vES5/1Yxne3DW4u8EqG4jaAskUY3ogtnopQ9vkNqW1CTu6ZdYCL3ar
 yc6OYc5X3wWRMf/URoujXw58L6prYpbF6zDpgAXgWrYimyUt7dr9Y0oX5OmAWRp8KGwkUb9svpl
 g7kp3/N
X-Google-Smtp-Source: AGHT+IGBno/ga5KM6GI9OGS8rJD6fHPfe47e81Cw3HCxAVUO9wpM8ACrMYaUvUd3WW4ilY+DOU5TmLE79hjhBi7PuIM=
X-Received: by 2002:a05:6902:1382:b0:e8e:26bb:2452 with SMTP id
 3f1490d57ef6-e94e61779f1mr2938118276.8.1755621627215; Tue, 19 Aug 2025
 09:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250815090113.141641-1-corvin.koehne@gmail.com>
 <CAFEAcA9y-0-Oe5beVObe+SZqmByRSOYkCaKM1FDjeo0jdxjjCQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9y-0-Oe5beVObe+SZqmByRSOYkCaKM1FDjeo0jdxjjCQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Aug 2025 17:40:14 +0100
X-Gm-Features: Ac12FXwriZGoD17SKJqW1wcUPS4OwzK155aLpA1SeWBIOOkwshbwM8-yUmrgC1o
Message-ID: <CAFEAcA8bFFB9CxCoVi+YVcJpwcQeEn4RkALVXDzwOH930WsGMw@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] hw/arm: add Beckhoff CX7200 board
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Fri, 15 Aug 2025 at 19:06, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 15 Aug 2025 at 10:01, Corvin K=C3=B6hne <corvin.koehne@gmail.com>=
 wrote:
> >
> > From: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
> >
> > Hi,
> >
> > Beckhoff has build a board, called CX7200, based on the Xilinx Zynq A9
> > platform. This commit series adds the Beckhoff CX7200 as new board vari=
ant to
> > QEMU.
> >
> > The emulation is able to successfully boot an CX7200 image. The image i=
ncludes
> > some self tests executed on every boot. Only the cache self test fails =
due to
> > QEMU emulating the cache as always being coherent. The self tests inclu=
de f.e.:
> >
> > * Network
> > * Flash
> > * CCAT DMA + EEPROM [1]
> > * TwinCAT (Beckhoff's automation control software [2])
> >
> > [1] https://github.com/beckhoff/ccat
> > [2] https://www.beckhoff.com/en-us/products/automation/
> >
> > YannickV (14):
> >   hw/timer: Make frequency configurable
> >   hw/timer: Make PERIPHCLK period configurable
> >   hw/dma/zynq-devcfg: Handle bitstream loading via DMA to 0xffffffff
> >   hw/arm/zynq-devcfg: Prevent unintended unlock during initialization
> >   hw/dma/zynq: Ensure PCFG_DONE bit remains set to indicate PL is in
> >     user mode
> >   hw/dma/zynq-devcfg: Simulate dummy PL reset
> >   hw/dma/zynq-devcfg: Indicate power-up status of PL
> >   hw/dma/zynq-devcfg: Fix register memory
> >   hw/misc: Add dummy ZYNQ DDR controller
> >   hw/misc/zynq_slcr: Add logic for DCI configuration
> >   hw/misc: Add Beckhoff CCAT device
> >   hw/block/m25p80: Add HAS_SR_TB flag for is25lp016d
> >   hw/arm: Add new machine based on xilinx-zynq-a9 for Beckhoff CX7200
> >   docs/system/arm: Add support for Beckhoff CX7200
>
> This patchset is on my list to review. As an initial request,
> for a new board could we have a test in tests/functional/
> please?

I've also now reviewed the two initial generic-arm patches
and the ones where you add new device models. I had a
quick scan through the bug fix patches to the existing
zynq devices but I'd appreciate it if the Xilinx folks
could review those ones.

thanks
-- PMM

