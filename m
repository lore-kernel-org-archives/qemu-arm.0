Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B06C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:22:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFKB-0002ys-AP; Tue, 08 Jul 2025 16:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZEHl-00014P-MA
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:47:31 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZEHi-0007Nw-8H
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:47:24 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6fad8b4c927so48975036d6.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752004041; x=1752608841; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3gXcDba5XjXwj4VxzITchOJeSktDK0fljaShAYOG7RI=;
 b=F7yP32CrHb/cNWsfzOiB8+7RCsJ93sfQChqN7eVwBt0VoOUEIVNAVrZ6fQBZqlwow1
 tOahf4djTgxiEINK6H6y7ok3R6P3Eqgh5sOQ2jOc9Qq1POnIGetXRZaeA8O2J9OIDQtM
 fB62MGrTvI9fCLK9dZrfM1PtRrMkhz0QhzB/gSX9QbCj2zYAsh3rpInY4+NCR/c+G2LG
 mdxfrqoRG2SSU6k0KES95cFNq8RRH/52VVHIcP4Ii1+0FCKj0HOhstPuk+j/A2QGChzj
 h6RjjguhphZTFVSiQ2E1ewOPJ/WF+3NeA5UpBIe4i4chY6NLcUXS1Qr4ei3qHQaxtHXd
 lUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752004041; x=1752608841;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3gXcDba5XjXwj4VxzITchOJeSktDK0fljaShAYOG7RI=;
 b=Yhb6eqmZrz3luYndLI97Ygm4Qw3XGkNQ6oWR0KDzlKcYvvewl59esELWiwXrHzxCC8
 0zsYklnU6/gkQktKBMjIWNSuPtxI4r0Xln5xz2fA7Qj0lD3wqCI4gR8ooC4/QFl8KyYJ
 ghk5QrUumjy7lQHQCEvf+/9F9W29Mq32n4FzcGsFGCRb/0yZgS2Tn+i8J6WrCuueU43b
 w1PKopZQ+hymQdviDxnZM9SnFWJAIfNuhxFTInDX2976peYqpgbye/58/o13EamvtZjX
 uwPVrZJf43HCQEaJNrkHDXc97HjtuNkG59b597lii+Y+aQfsmUHupoazspt+pbkzeXEI
 IHtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8SyDolyw3FgXaBU3HJ8GY7SlAPZO9Wu8oY4nMID7i6Uh2fSyzWHLPRYbcO4HdwHNXQ5SGlPTozQ==@nongnu.org
X-Gm-Message-State: AOJu0YzIS9uY3HnSL1cQUvRWPEtVIWu+EgoufxJjGuEwrzBjSG9r3+L6
 DlwvcMcWadTK8Gk5sZ0ObDA2XVtbjsdkktsCAw7ChHk77OTvxGWMsuByFxe/t8XB6ouZnufnSPU
 XwN3kcsdDZAwcdEktkVkdmPwf6m9TkBA11LxYPlRpsYmjt3v3oAhs
X-Gm-Gg: ASbGnctq5k1Jb/ytd7lQ+dx5pAL2h9JxGJephyneh6bMQIifSYbnOzQp+rv08GcqCyi
 Vo4AlSFtv8ZvP15UJG+cCD4880VN1Yq7vvnuMfJf+Hae8VI7OzIMEHTUx417JO/VKnrILNGaxnv
 U9aLbtVhmYMHAzsZEX3lhx5tbwBNAOO30o9KxvcciCdc0l
X-Google-Smtp-Source: AGHT+IFjSmpyQ3CHcXmyN3qtie09DmBDcnmCHCImr7srtXytjoxMt/Y/TM5jsXE10uSIOhaWtgLk6rptieFqvshz0jk=
X-Received: by 2002:a05:690c:64c5:b0:70e:731f:d4c7 with SMTP id
 00721157ae682-71668c0e7femr201134407b3.8.1751983184994; Tue, 08 Jul 2025
 06:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250703123728.414386-1-eric.auger@redhat.com>
 <152beeb2-7de7-4a4b-8f5d-806e7f18dda6@redhat.com>
 <20250707135106-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250707135106-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jul 2025 14:59:33 +0100
X-Gm-Features: Ac12FXxru7-LIqXPAtbxe2m1XeZoaHsn1qaQChfgk3r9Zc7wPOli4RE35O_Yci4
Message-ID: <CAFEAcA__rH00vLRSK23JyvafAwq5q9yV=_L8bcR4oV5P5vTULw@mail.gmail.com>
Subject: Re: [PATCH v5 00/36] ACPI PCI Hotplug support on ARM
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, imammedo@redhat.com, Jonathan.Cameron@huawei.com, 
 gustavo.romero@linaro.org, anisinha@redhat.com, shannon.zhaosl@gmail.com, 
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 7 Jul 2025 at 18:53, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jul 07, 2025 at 07:09:34PM +0200, Eric Auger wrote:
> > Hi,
> >
> > On 7/3/25 2:35 PM, Eric Auger wrote:
> > > This series enables ACPI PCI hotplug/hotunplug on ARM.
> > > It is not enabled by default and ACPI PCI hotplug can
> > > be selected by setting:
> > >
> > > -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
> > >
> > > Expected benefits should be similar to those listed in [1],
> > > ie. removal of some racy behaviors, improved latencies.
> > >
> > > The infrastructure used in x86 is heavily reused and a
> > > huge part of the series consists in moving code from
> > > hw/i386/acpi-build.c to a generic place and slightly
> > > adapting it to make it usable on ARM. The DSDT table is
> > > augmented to support ACPI PCI hotplug elements.
> > >
> > > On ARM we use use a GED event to notify the OS about
> > > hotplug events.
> >
> > gentle ping on this series. I was hoping that this could target 10.1 but
> > I ackowledge this is a big series to review and I am already very
> > grateful to all reviewers.
> >
> > At least patches 1-15 have collected R-bs including Igor's ones. They
> > can be seen as code move/reshuffle/cleanup and does not bring any
> > functionality. I think patches 16-19 also belong to prerequisite and
> > fixes and are easy to parse.
> > So if we could at least have patches 1-19 merged in 10.1, this would
> > alleviate the rebase efforts for next respins if any.
> >
> > Of course I have not totally lost all hopes to get this in in 10.1 ;-)
> > and I will be able to diligently respin upon comments.

> If no one objects, I can queue this. OK with ARM maintainers?

Judging by the diffstat this doesn't really touch the arm
stuff specifically, so if reviewers who are familiar with
hotplug and ACPI are happy that this is the correct way to
do PCI hotplug for Arm and have reviewed it then I'm fine
with going via the ACPI tree for whatever subset of patches
you think are ready to go in.

thanks
-- PMM

