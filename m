Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp350021njb;
        Fri, 4 Oct 2024 03:36:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4i0Fhg7KmFQ23XGKuryvZQfZtMSFHBYjbS/s3arekAQMBhCW3GajK77o0jOBh2fU+d8joM/XJmAsT8w==@linaro.org
X-Google-Smtp-Source: AGHT+IHLAIjtqOKYIwxr9wt4SePjmX4LwVTwEnRCX9dUtr4zTHlDuWIU+lrtz2ZNYRpaDJrG9p/Q
X-Received: by 2002:a0c:e5cf:0:b0:6cb:9c55:4215 with SMTP id 6a1803df08f44-6cb9c55430cmr19648016d6.33.1728038187321;
        Fri, 04 Oct 2024 03:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728038187; cv=none;
        d=google.com; s=arc-20240605;
        b=X10TXfNo2lbB6gH8H7j10FBOPnDj6K15KLjKIBqrNOW3nolBRKtRZ91fn8GABny6fq
         Dcv/xpyWJLlbv2puvsnd6qIjLQ785Giz9lXOB1iXmVCQqtsXGGG7egtV0ms3nKHuQdtk
         dafvJ88kJFUHLburP34RcWBYAOTKHGcs5GUMt7Y8AzOwMmDpklJNmrAtZ+Ck5NUtaMR8
         nNfJELwGt6rxS/+ut0vOIwSKEx11m/kqYJB8K3r/1VNcaaJ0XeaM4lS/iW/mYXjiOsqi
         L6y9MLtdEP3x7bRg2woROtDiN64v2Tb46PL89e6ebUHVtzbD1KXZfqg8su3F3K2PG5lh
         AaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=W9OlicifHtCtS77O14+qa+y/eM2RaCg2lpgZjfc3j5w=;
        fh=hgLuMk1u2KWLKw7JYWojqESeAksXr48FXWQiKVUgiIE=;
        b=eB2I1wsZLYt1Th/tH9w6llBlI2SrTQZHHGssYWAPdLsHfqvosiN9sMx/9LnaIBbbxW
         HYbA/2wsXZQZdykALmR6rzVh/gYuz988v+oaXM0u82SwGLeL4KYROiviS5es4h61m5Fp
         cKeyFWFSNU6HE4kyVTkYukG9Y28HAJeANida93dT2kOXuhQmUOaHzIPlpyzZV/KuRQf+
         hi3Z5W5ez3cNWVEgNDkgv5qhHmY3Bxm5CCWzdVxp0b1+WMNC5BvqP2RfvRqrezuzpz1j
         YkIp+f22B9EgOs/07mOVdPOHs7LBevO7EceMfVX/pYeMs9JqriEwaU1ZlDidFLHT61J8
         +pTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Op4rFDWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb9361468fsi33139996d6.125.2024.10.04.03.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 03:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Op4rFDWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swffX-0007PF-Vy; Fri, 04 Oct 2024 06:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swffX-0007On-3k
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 06:36:19 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swffV-0008H4-Br
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 06:36:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3e8a74so2572142a12.0
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728038174; x=1728642974; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9OlicifHtCtS77O14+qa+y/eM2RaCg2lpgZjfc3j5w=;
 b=Op4rFDWc9ffEV2KNmEaRfu0n9Sq+G61ISttP+Hm/sgupCnYdLIHeY/qv+gf9G4DPE0
 iwooVcl6KgkS40nGJVt5F/TmYJq2BpmHBEzydFK8RbiVse1AlndF/DhEln4F9sLHa/Qt
 FP9mlX4G2fORNLNeRxVOihM0ISdqzsVFsVZ0KTjhZ/AUxROeBoAL0V0mkqiQf9ReD+AS
 rsSThTo6lrShGgrK+0WyCK57TBTZpVur+GTxNYRYPWC+64zj7JNhEbaGXrP/70CdUpg1
 fnu3u4DDsSMExCZFEMLCubxmTFA9HNSfBgSfhSEH/YImx7dVAFVWjHYo9nQp6SVZRxW3
 Nkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728038174; x=1728642974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9OlicifHtCtS77O14+qa+y/eM2RaCg2lpgZjfc3j5w=;
 b=jYrNZ9Z/+xWeEibwcfZoj2u1Xes5penp6Wsrt6vxGwQyCa/u8cdUiPUxkMFDLZgOuq
 C2h+EGWbHrmc1I1JYZcyftXxDqdODp3+/v2nAoIjlrVFDhnEnLuN+6O7Jp0tJvHNzhBS
 szTB7bnC2xMA0MlCO/FEqMnh+eLCLB5sKyU7lArBV/N+0OnVUS3aGsGxBh3h/TEZk6DM
 Zff5Ok7rPMBiUEpAfrHj23U28YMexSzlFLWKTCFJlzNQU3k6KYnBvzL8GqEXJ06jlFDw
 RTztKl80S8ucl6qXd4fx9jEsscJDso51VCSVzAzpH07zNMKtU2Y4H48GuHR7EI3sdcd7
 kzRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXMl49ckfTj2qou0V7tTOXjZcFY0qdlXDGrpm9g0Lq2Au+822FKtxoflPE2UbkSUtpty8K5FauVA==@nongnu.org
X-Gm-Message-State: AOJu0YwL3OhiwaKrPk69cqWkch1R/AjATJhmi5Vf3sO6NKmGPjQ+OytR
 Om1tndEF1wR3SLzSAB3M0dcd/04iQ/vjsc1NxfCQmiyiyvKTRbW9qzcSC7b4NEggOQRwJqLBrq6
 O8WiJfZ1hxbSDOioUzHvcFsWfKBSP7c3QIyengYib3QHApdVc
X-Received: by 2002:a05:6402:440a:b0:5c8:8db1:1d55 with SMTP id
 4fb4d7f45d1cf-5c8d2e3a6b2mr1657000a12.10.1728038174213; Fri, 04 Oct 2024
 03:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240923035632.81304-1-sebastian.huber@embedded-brains.de>
 <20240923035632.81304-2-sebastian.huber@embedded-brains.de>
 <CAFEAcA8Wf-PzAC-YGdma3YVETyuatLJHmvjrrb_kG2NjDSGs+Q@mail.gmail.com>
 <1809049101.17000.1728005051804.JavaMail.zimbra@embedded-brains.de>
In-Reply-To: <1809049101.17000.1728005051804.JavaMail.zimbra@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 11:36:01 +0100
Message-ID: <CAFEAcA_zcdNaR5NTnTLmCZ5EgzBb=mFqqpLQKergk7z80kaEZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/boot: Use hooks if PSCI is disabled
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HN1Ys+mAjuF7

On Fri, 4 Oct 2024 at 02:24, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> ----- Am 30. Sep 2024 um 17:16 schrieb Peter Maydell peter.maydell@linaro=
.org:
>
> > On Mon, 23 Sept 2024 at 04:57, Sebastian Huber
> > <sebastian.huber@embedded-brains.de> wrote:
> >>
> >> In arm_load_kernel(), use the secondary boot hooks provided by the
> >> platform if PSCI is disabled also while booting a non-Linux kernel.
> >> While booting Linux with PSCI disabled, provide default hooks if neede=
d.
> >>
> >> In do_cpu_reset(), use the secondary CPU reset hook provided by the
> >> platform for resetting a non-Linux kernel.
> >>
> >> This change allows a more accurate simulation of the platform reset
> >> behaviour.
> >
> > So, the difficulty with this is that it's effectively
> > introducing an extra way of booting. At the moment we
> > have two boot approaches for Arm guests:
> >
> > (1) Booting Linux -- the boot.c code simulates what the BIOS,
> > boot rom etc, does, both to set up the 1st CPU for the kernel
> > boot entry, and to set up the secondaries in whatever way
> > the bootrom does that the kernel expects to release them from.
> >
> > (2) Booting bare-metal -- boot.c assumes the guest code is going
> > to do whatever the BIOS/bootrom does, so you get what you get
> > for real-hardware CPU reset. (Either the secondaries start
> > in power-off state and the primary will release them via some
> > kind of power controller device, or else all the CPUs start at
> > once at the reset vector and the bootrom is going to sort the
> > secondaries out and put them in a pen.)
> >
> > What you want is a third thing:
> >
> > (3) Booting not-a-kernel but not 100% bare-metal: emulate what
> > the bootrom does for primary and secondary CPUs but don't
> > boot the guest binary as if it was a Linux kernel.
> >
> > The problem with adding that is that we don't have any
> > way to distinguish whether the user wanted that or our
> > existing type (2), because both are "user gave us a binary
> > that isn't a Linux kernel". (It also has a bit of a
> > "continuously expanding job" problem because the bootrom
> > could do arbitrarily complicated things, like boot directly
> > from SD cards, which we have historically not wanted to
> > emulate within QEMU itself.)
> >
> > There are other platforms where the real hardware's bootrom
> > has a particular "this is what a bare-metal-under-the-bootrom
> > startup looks like" definition, notably the raspberry pi
> > boards. There too we don't currently implement that, and
> > instead effectively tell users "pick one of the two boot
> > paradigms we do support"...
>
> Ok, I understand your concerns. What I would like to do is running unmodi=
fied executables on Qemu so that I can test exactly the same program which =
would run on the real hardware. To properly initialize an SMP system, you h=
ave to do certain things in a proper order. Currently, when I start the Zyn=
q machine it immediately executes the ELF entry on both cores. This conflic=
ts with the normal system start sequence which assumes that initially the s=
econd core waits in an idle loop. For example, the second core is normally =
released after the GIC distributor is initialized.
>
> Changing all the existing machines to use this third way is probably a ba=
d idea, but would it be possible to make it configurable though the platfor=
m info or a command line option?

Image loading is already weird and inconsistent across
architectures and across machines. I'm not really
enthusiastic about adding an extra thing that only
applies to one machine type.

You might be able to get the effect you want by writing a
guest binary that does the things the boot-rom does before
starting the main executable, and telling QEMU to load
both that "bootrom/bios" ELF file and the main ELF file.

thanks
-- PMM
