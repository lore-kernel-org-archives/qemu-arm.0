Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7503CD8C92
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 12:44:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWvov-0005V8-3m; Tue, 09 Jun 2026 08:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWvot-0005Us-Hu
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 08:44:39 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWvor-0005Ei-O7
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 08:44:39 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-65eb226b1ceso4829392d50.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 05:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781009077; cv=none;
 d=google.com; s=arc-20240605;
 b=hE6oZwbjOHrTGtlP7yyH8MBkisnoq8I8k9ocNblcTujopIKrBuW/7uTAQrzzPMziCr
 DSSYVM1hIUm7qe/vkaJiwt2ZZjEcN3uERAtPOnsDheeN8Cx6Uo9fUPg8QRP9XvNEjMW9
 sYDPso7YHpN+zRaXWeTrnTfUByyWuzNh1lz6lnlg/9hiWLkR/ockhKICcC/eL7ffpkTs
 59M3PImbFF8gM00ISjjfBpFV6t4xxYg6wpWqQZJV53mPVH8FCp2efAH5UvJEsufkxrre
 ekXDHzA60kJMPNDp1bPA9wGo/0igSK7tlJMUbzM3f+I5WSFpkBm7vq7yqmzuKVVfyvY4
 1dVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aeDrLcifxthJi2ua/z5xsr82IiW7eAqLRgoq0+uAzS0=;
 fh=JBoARXLYNrvdcibTJfoI5bcOniDW9O3ZbfAqeAg5QHE=;
 b=ZKOPa5ggT1BqHPOipa1DbQgvfNRQHaHza/hdb/LGwxC7sobviL9898caIoN+1Ys//S
 vPYGe2zGhv1F6eFUsG9mvOBlHt5+qCOZfr9ZiEnYRhAjsNruwmqI1lXuF4pZEuhr9Npp
 louajRo+Qoz9Zv5ZE2/WyExTiP6IigCG5dkh8tO+ATqBk5MfdxA61D5GMQcwjyLRHaps
 +SNYp0D1ZQ2YVK4d5dRum1JOZW9abFrS0NrTvH2FYmyrnlROyb417FNzrK3abhMFGaxh
 mbxX7xMA1Xd9bDUIFCZ9lD0qgXZaCF4x7yA/c7SNO6bigc62bW7QxqjoUls/mbNe7T5Y
 BndA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781009077; x=1781613877; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aeDrLcifxthJi2ua/z5xsr82IiW7eAqLRgoq0+uAzS0=;
 b=jM/kvny+CPAQoNif3EefqK6fk3v3MIjBnGjn4ri9H5oCw9HcyUVcWdyZHH8ScVM6fx
 Jdizzq7MiqnypYzj1fyb1p6hO5ZcQzbwR+wyGE9IRPQ/zo9jWoZKzbNcNGkAMj327DDd
 h2NTz2hYZey9cfLp6WAPlFeY02vPs2FYJUhGnGXe7eqVhKbYXjAiNUmRYIFi75MJ9KwW
 Coo2CG5zdRnHXs5jdIq87o3XQRPqnDUK4a55f2mw0D60sBfIJxchQpy8EWwOCB9bxur6
 VsZmctt+Ev9Ko0Q1zR0+Uhtx1CCIibFG+AeRV6iv7A319GyY3TafMLZfCNwPdmvkpqZs
 btEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781009077; x=1781613877;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aeDrLcifxthJi2ua/z5xsr82IiW7eAqLRgoq0+uAzS0=;
 b=mHks5OeD74QqhCm1rtuXAE6qlpXiM7T/dAaaqmMOSlHKmCxMQZPcYUK/0HBlqA2VAQ
 GsUT+ohkk2jPCRI1Vwtw11/jU0R2ffzmXrEGn0zDeJxwM6nw0+zfYPdJNuX/aKfiI5TO
 TGWTea+Cf9xDraK43NznDDLHJZrrJC4qjvbkgLkqURmZCxd7/lvbPBi/IzPiCkyNqJR+
 pcQ8THzNypjdPWYNpTqvgPQKfdHoqqDrZlwskzDuMcxE1jTBs3Q/+A3x8829zChxIixW
 oUbyor7bZkV82TwXH0CjkqgBYsy7iMF5g2lkEhupPDaP1be473gWgLx3kj1HYwcd1J5l
 E4dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9k7f5a07kGr1wX2K3KumqtCuPKFC0fvRY0u4aPVlFXVp04wHC6rLPa1Cp0yejpKhIPH0WplYTA0w==@nongnu.org
X-Gm-Message-State: AOJu0YzE0IN2IcXOXxLfapxTcgHisp2Oen6G0zeE9LhjSXatiBydgM2I
 L+1s0dAu2JxxbuVWhE6tKXJdqvsnYr0/plPPtEnZKNi/6mX26xrW290VK1mUltOgG/RWTi7h4pJ
 d1DIXysCkk/7Z0lyzgonLaLQuZpe5HYR6XBNHE6PW6Q==
X-Gm-Gg: Acq92OGzJtnfNcFsWzuad/egXrvST1TKUdFgEVDFqj2z3gSDBSDz+h9gfIjaroUo/AQ
 KvZPe3C5GSntN4pRUgjAHP+CRUCvVpiCcdQ7jcLhJKEMrVQJ2ph5WhZ6h/apz1hSs+eIVmESjZh
 3q3KM7BIRq+JnJNeY7vZuf3+CVyjmPjeK8uAxCTS6BEu4uOkPPSmFxY6lx+waj2n/s2WDd+F3r1
 yHDeuFVBpry319Xnp/FjS2nwnJsK7kXJhrlD/8abvpGmXfa3XafEjbSBjs4ws+pmKAmW59uOqqe
 +kU9Av00omn2sP+zyQ1MXyDeNfRBhviDKsgpUTHJ3Sq/BJaiB2Dfb2vJl2/Nprjt+8yusLeTi5x
 Wd7lY5+Cpcydu
X-Received: by 2002:a53:dc8f:0:b0:651:bcc4:c1 with SMTP id
 956f58d0204a3-66106f885edmr14532541d50.48.1781009076387; 
 Tue, 09 Jun 2026 05:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260521112806.504961-1-kraxel@redhat.com>
 <CAFEAcA8hbObntY8Tp+kOV7btb-io92O9GW99-6SPxigPJUjPrw@mail.gmail.com>
 <aiE5LrpfnJRbkx-A@sirius.home.kraxel.org>
 <CAFEAcA_ow2ro3h0nfhY3jA_XToAnjdVFNPrF25aWLd=X2cnmaw@mail.gmail.com>
 <aia8iXGozAclWQCb@sirius.home.kraxel.org>
 <CAFEAcA9oB_-ao5C8fGYonE7njUMWLHo5-iETeN_XtnFL4PzyvA@mail.gmail.com>
 <aibALjyPTXVUDpDv@sirius.home.kraxel.org>
 <CAFEAcA-VQWKzJ-aNnzYHZ7a+sVP1y6tkUnE3YCPydsqP0uVXvg@mail.gmail.com>
 <aiflCrf0iDwcpj27@sirius.home.kraxel.org>
 <CAFEAcA_+fZnFG_2xH2gXF7ZtGo-WVwAhwkz9ucuS5kXZOYShnw@mail.gmail.com>
 <aif6QGPxr4oMhb94@sirius.home.kraxel.org>
In-Reply-To: <aif6QGPxr4oMhb94@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 13:44:25 +0100
X-Gm-Features: AVVi8Ce52Ywx0xBDUfEoMqE6ml-_oTYRAK7uK7eN_l0NQD7mF73n9wfLZSkktdc
Message-ID: <CAFEAcA_qjzLjdqi3NWfY3cTDfkE0HmuvxSV3yVuBb+O95zvV9w@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: add support for shim loading
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 9 Jun 2026 at 13:00, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > > #  - specify a firmware and pass a hint to the kernel to boot
> > > > #  - direct kernel image boot
> > >
> > > That is a technical detail which doesn't make much of a difference
> > > from the end user perspective.  And often people talk about "direct
> > > kernel boot" without drawing a line between these two cases, because the
> > > user-visible behavior is pretty much identical:  You pass a kernel to
> > > qemu via '-kernel', and it gets booted ...
> >
> > As an end user I find them majorly different -- I usually
> > don't want the firmware, because it takes forever to boot
> > if you do that.
>
> Not sure what exactly you are doing, but for me edk2 is done in less
> than a second (unless I turn on firmware debug logging), and that on
> a rpi4 host which isn't exactly fast hardware.  I wouldn't call that
> "forever".

If you're running TCG emulation then booting EDK2 is definitely not
that fast, and I think a lot of use of QEMU for aarch64 targets is TCG,
not KVM.

thanks
-- PMM

