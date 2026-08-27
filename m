Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7F1C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 09:21:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzWHo-0007lX-HQ; Thu, 27 Aug 2026 05:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzWHm-0007jy-R7
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:20:38 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzWHj-0007TX-P2
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:20:38 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-856114a8247so24025217b3.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 02:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787822434; cv=none;
 d=google.com; s=arc-20260327;
 b=lMzp4x2THoaixm8HYx/lVCJloZgJs8q8QbUrhR4l1hX7C7GBeTaRgJ6JDW9GnEgvLb
 VVzJ6mN3xon/wUeS77dUVuDIk8jz7frFXkTEPofTkmPaUMFyUnN880RNRH9bTe5vejvb
 56aiTIDK+byJ8e9gblQnROrRpP0rejfoWFbGf41Nw4IqxXhmrooKHYbgSZOoOYR0szud
 U6bBrByhzP4hC1J7WmORV3ZiZl1N5QnVXWGN+hk9YJHHeTL/y/IdO8o24+XUZL3dZCyt
 nEZ8IpPO3cmcQp+JUNVI2kDuEsTEICXrjdLBOrODDjU8TmPyduoUQMVABc1mJeRM8BCd
 2Hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dl8NJkMtjYytgCv/pceSiXJ9Uq3EezZoss9lloH+8C8=;
 fh=3cb1iweyfzeEDUPDCXP9mivsJyKxG1d2Ow5pjoyeHLA=;
 b=gLx3rsgcNnDyeFymOICg3bSMhAPaxMu1uEwBBF5UaF63RRK4aLiWLdU4Dn/wVKo2Rs
 iImIXA8aZgme4g03N09h2KcsbDknjON06+k6cGpnMnyvIP6fCGWv9yjA3NIJlFjg47fC
 BzETdqkakQWUgcQwWlPVJpk87RNRk4ZlDd5OqdKkSNi91f6baPjo4jULVFjbWExeaqkL
 aqlSp3K2tJGTv8ho1pVEctGnfE/Qo5hwoYXTNwsJ1dhd77zK6/0FGl52wGkekpsHWi9K
 uL6sBLAfw9PM0OYorxHHAVA7KdMoXzmYnZyzCgdVqwQIWlvfhwHtBb4vJQUhrNk233qk
 1O0Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787822434; x=1788427234; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=dl8NJkMtjYytgCv/pceSiXJ9Uq3EezZoss9lloH+8C8=;
 b=GahtlIEOC0BKgPepYhOQqwBKt93s0YV9HFxctTIU8ipHSA/+3+jju5Osb8rQCF2Lw+
 Dg5j3P3xlPfREF1oCMvVtOrMASem5QyZxNmV1GGhrSiJM5avW6V8NrvaQgF3CKmVZp3D
 ngrKj4nAqLQ89AbD/auQCbQX0ikO5EmMiFmRwWOKVe3xbNCCNNiH8sVZc1K4ecsyjnJX
 tctCN6QIK1sOvtueNrNV71rQbG66Ouud3CAJBIhjD8eKSP+v/WIi6CnPOayrMq3l3zir
 G7R6pPIQDPCHln6cXJqmamlyOl/oUAu6pK1hjs9RUMpLVzX4wjj49NMLdL1T/Kvc7qWm
 qVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787822434; x=1788427234;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dl8NJkMtjYytgCv/pceSiXJ9Uq3EezZoss9lloH+8C8=;
 b=VrpXyXaHk+4hes0kVrZHR1ADDL0Je4dltVUVGfSlshA+ShW/UIM4BB/htS5H0jFtCj
 ftuTdVk5WV29Jr8T73U0xCUjb0EXOOUAi6YtknUpQb2LfsU0H4F95AzTYnL4XQ0y4yXp
 jmbKaJA6E1j9PYNU8YOSm0060iIPxoGQSla65yGVwoyezcY0gQRfCWN36lXBDC6TnjQK
 qNBr7UqrDMwKfQmnRjDxQVILMOSla4J8YutLt+MNl5RWPnSpFBChuafxkQEfS87q4SJo
 u7fKhQ2FO4J5M66g/EAzgtBYwAn/MH6+3+73CPi0VSa8VhNFDlDbBXbUSudROKMdE6+a
 +j5g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpefqUf6FdCtQBOgst162vGLaY3mdioKLLeTIO0bsQaQWmlZlPd1Ud/t6EZDQxBTug4CPd4O1qa3Q==@nongnu.org
X-Gm-Message-State: AFuF++n6GgCakFhCxzE1idXItM9w+1soWMhEoKMIrH7vn5rn4aAL4kf8
 ljOQm17E5t9Vx4eWx8lBTgR+zjSDfJAT/+NLmvzvr3KhfJs9qPruvC3celtO5ynjl1STtxKjEGG
 i1GdsdPimjexNwgjGLvQLPllVRSYfufCqt4gGnr24iA==
X-Gm-Gg: AR+sD10SUGNhCZ0mEIlK1rg+rkWVmiMGB5TbhKAJC3GBfkRWaXYbhDsoEHcl909Gx5j
 rQhJmvnM9ra16mdj+IoiQO5c0T4pPaIcsdE5YBYuQioAGUBqPDYleUXFi3lzg+hel/IQnfSnw7o
 6Hm0XECiBqJ/5T8RIdJJ+15tg+V9RL4X0+3CrtlJYmG9VxRuyyBsBoWJ3XeY4ZdVaEtc2no+AVj
 iNwbGGZnbir1F/5hL+eEuOVCkIqGOHz4XW/81h9yQFUTvPHXU+4o7BoS5w4UdWCnJnIKogX2OeQ
 2y2tosx18m1C2/KTEk4oIuni5rybedGMf/V9rKNMs7dkYqfupXAigswA1p0VGd10N9W6/Mex/4v
 V5++yEa9ZonRVrFrY/PdI3qgx/83o
X-Received: by 2002:a05:690c:6f0d:b0:854:b29d:c670 with SMTP id
 00721157ae682-8573bb29a54mr60539917b3.5.1787822434248; Thu, 27 Aug 2026
 02:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <d88347aa69db68c498b593eabcd2377413ff4af5.camel@alistair23.me>
In-Reply-To: <d88347aa69db68c498b593eabcd2377413ff4af5.camel@alistair23.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 10:20:22 +0100
X-Gm-Features: AcwNN1VlxaXfMHY1NFt96SqOFcpbJtP9bP8Q0YYI6akMDmGfUDSYLaGv7Wn1Dn8
Message-ID: <CAFEAcA-OE2+H0Gapxqv61kSSgTzns-FWCyagAX0hzewu0Ab2xA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
To: Alistair <alistair@alistair23.me>
Cc: stephensportia@gmail.com, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Thu, 27 Aug 2026 at 06:37, Alistair <alistair@alistair23.me> wrote:
>
> On Tue, 2026-08-25 at 14:04 +1000, stephensportia@gmail.com wrote:
> > From: Portia Stephens <portias@oss.tenstorrent.com>
> >
> > The ssi_transfer function comments say that it takes a word varying
> > between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to
> > transfer
> > but there is no means to indicate the number of bits that should
> > actually be transferred. All child classes of SSI_PERIPHERAL class
> > have
> > transfer functions that, despite accepting a 32-bit tx, only transfer
> > a
> > single byte; m25p80_transfer8(), ssi_sd_transfer(),
> > ssd0323_transfer().
> >
> > The current implementation depends on the SSI model to know
> > what peripheral model will be attached and what transfer size it
> > expects which is error prone. If a SSI_PERIPHERAL model was written
> > that
> > accepted 32-bit transfers, it could not attach to any existing SSI
> > models.
> >
> > This change updates the the naming of ssi_transfer to ssi_transfer8,
> > as
> > well as changes the return value and transmit argument to be 8-bit.
> >
> > Most ssi models handle this correctly already, sending a single byte
> > at
> > a time. There are a few models that are written to support non 8-bit
> > transfers but there are no in-tree use cases that connect a
> > peripheral
> > to the SSI device. These have been updated to use 8-bit transfers.
> >
> > Portia Stephens (4):
> >   hw/ssi: Rename ssi_transfer to ssi_transfer8
> >   hw/ssi/pl022: Fix dropped upper bytes of ssi transfer
> >   hw/arm/strongarm: Fix dropped upper byte of ssi transfer
> >   hw/ssi/pnv_spi: Fix dropped upper bytes of ssi transfer
>
> Thanks!
>
> Applied to riscv-to-apply.next

Would you mind holding off on that until we figure out whether
this is a correct change and why we need it, please?

thanks
-- PMM

