Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB85C60A6F71
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Nov 2026 10:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mcqWfRoU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xTGWA-0001np-5k; Tue, 17 Nov 2026 05:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xTGW8-0001nK-U7
 for qemu-arm@nongnu.org; Tue, 17 Nov 2026 05:34:25 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xTGW6-0004z3-Vk
 for qemu-arm@nongnu.org; Tue, 17 Nov 2026 05:34:24 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-67da62357acso2786566d50.0
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2026 02:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794911661; cv=none;
 d=google.com; s=arc-20260327;
 b=J2PVeFpAoSYpk4zW9bDfIEsIRIrJmuHAN6grrXZR1chvsqHZfOAFS6e+4eBLBUdy/D
 qe0GnftLOAnMbk75qFkJvCkmahDosVX/JwAg/5aBW58/V6KZW/aKXyVtYxn4T0xKhNPo
 KOotVRTtP4wBR5PBOp3LLR16O2mKq2ClA1EO3sUL5jS5LaClh4alqP+kMxmj8n8H8H2A
 TPg2ZbtlVcBMIgCWJDc0sWldlFZmLmq8GCiq6mZi8gUsgR0SSSnpi/6HNuKY1/kTVGcb
 PZGHFMvxwWHJMsiTQ1bKTx19Z5iFKvYxG2XQw8TRTaJcdHWQo0paMdbogLzOQb8n0e/l
 yAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UuKlSkoymTDPg9TRp8wP0q3mBdMsqIqP7u05crQ915I=;
 fh=C8XhrYMzXQyjv3Osn6DiaLQx5tS21BCdx4oDoQz77LA=;
 b=jkDRgRiMDZvfSCw8YWwsJXMgU0U+LNebjuo3H+HXPECzJeuEk2PXaTSCqgFNtR5jAz
 ZWL+hxcHUOQk4jKgEJk6cux6FLQN5wixox3aGawOQPgToQTGlNo7eW5wf4IFUzdAktiS
 r4GrMcQdUDeV7PrelTUzqHhqVtolDdl1qpuTxnsVkzp87dzOqBGuj+Qs6CVYZd2vAVz/
 WdHUSrJKjVX8/tS7Jmq2lU4XVzIIMyKkvGZ31ins4uVaHS0JAcdfwhoHog7vEK+rbMR6
 1GDH4dqwD9j4kbY0ypNjigl2OKKyND0qIvTchc0NT9YgHI3l+6EcVWtiqQ9Urk9AhS36
 CzPA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794911661; x=1795516461; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UuKlSkoymTDPg9TRp8wP0q3mBdMsqIqP7u05crQ915I=;
 b=mcqWfRoU9ri7ZLF0Frxzzul3wnWT5S7ff8iY7n8CHIvRKC3hXoLu0mXxWfOcH724kG
 cDZi7yBqX/2t/GCYqRqA54GXgM1HzLaB4m9cd6oYUGDd7ABpHCWQNbsXyCxSEEkkpLSL
 5unl8/WHYj/JBO9lyu8wZ43eXbghrKiax6CqepsffNW2Rc7RiD7TDdV3UtpyuFKZX4bP
 rVYJ8OYabGkxzCVukPABfngMJWHnirE+9YUPmEHmY3VR/ORpvAf9VK+H5PO+0igOwQYD
 wV4TWLaRW4xD0rYvgLnI3GIoqsIbgjbrMqvN8VJa0+Zh8Mb5iMPu3PyW1x5m0cJFRz4O
 7NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794911661; x=1795516461;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UuKlSkoymTDPg9TRp8wP0q3mBdMsqIqP7u05crQ915I=;
 b=DEzOIN4PiZ8/SYTQ4pABhPbCzBTlXspQrKW//pBgLtsfBoZyB/ZSisVx69l62hyDPK
 YBcqUwXl7/f0190hgDWErooMKu7sIsKBEoXy72JJWkAyAN1VCXxPkEADGJK2UXQNub/B
 6fe3HPKsMzzePo27T6uh88WHLZa+P791uj2XBrVRvppHsJ4PWEVX9e9h3tJAzBFXGV32
 DvuCEktuy/6uJwj1rPliKvongA+opf1GDS7qm6QkstvaqUVRokYnf96PuEM6WU8gkZ/u
 CsKwtmf0TkElJq0fG1L5foOhzBkI6e4Yu2dQOD/3UEPESufnb1kFOw6qkWHj3LIDyVRb
 qOBg==
X-Forwarded-Encrypted: i=1;
 AL+hErEhyMdgPMGd7c5E81DL/akSUAkMs/qSOgYsJlkU3mc70EIyTufRA4vVkoeYjGLYWvUwoJyXSEr2JQ==@nongnu.org
X-Gm-Message-State: APuU4Z8CY2ExyomOLnIL1CTV/JKfiyMFnSkjlhZZl4usZMPWh3XafVeL
 +pPiQEblGQEhJ6rNjCjK1tAK5ZPQ/E8ye5glD0zGiqVL0FDuF4D5K3S8s1tIOkvlN34a6MRvjqr
 eNOOq268heMpbM+IUAnHM0dqAtFTDI5MsWDrib1jPtQ==
X-Gm-Gg: AZFdTZelBSVRNtT/OP8UKI5GFprv4tSwQ4N3WO3l/tB7EPLKGnGUkbW7g72gHHQEsDQ
 v0sYfOkc2X0U627pKqGPvmVb2963TGPmOcvk+eUVTBdGgEUf169B/jOs2JxDXQvAPlOHDe84b4M
 AjWZaoAz4jEkL8txg28VWzRRmvrs7rhE2Fs0x8mmHsZwCv0bq3MD+u1zcCF5pmtBTiOoKDJsL72
 caSenc3724Vuip9XTDedWLx8nIpNBqAiCZMdezFf4E0YrtFXT5O92q09sUXPPkgS+gOJfOULeSU
 zwo7s3+ZbFIo/WHa7xCMCXW+s+q5w175VNlKdAH/SZdnYy2jfIfx9PYxLYRHcXvHJNRN/T+WB+o
 pgUIONZsTaOK9fMW+5EHCpWTHexX6lYUgqX2buehO6fT4wDRK12EjkjjNqKQ+f1eNFptOoj/eah
 uW9oN4lxRuxS4g7JmjodL/
X-Received: by 2002:a05:690e:1904:b0:67d:b5fe:1ce1 with SMTP id
 956f58d0204a3-67db5fe1f42mr3789388d50.20.1794911661516; Tue, 17 Nov 2026
 02:34:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
 <CAFEAcA8Nmt_Nsvfm77en_oaE4orcQ3BdCBQWNAXmi0iqLgV7fw@mail.gmail.com>
 <c1df4a9e33b9e6a5e76cafa75a00d3c4a901fcbb.camel@wdc.com>
In-Reply-To: <c1df4a9e33b9e6a5e76cafa75a00d3c4a901fcbb.camel@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2026 10:34:09 +0000
X-Gm-Features: AclHuK_uJUGhQbi8NOa4sDvJDIUTEXw1Pydh21dI-uBn-5Y6sriDNzWNC__EksQ
Message-ID: <CAFEAcA-Pj_kfRyM97s-_z=uZDSuTAEsMuBBBCqezN7FWycUjNQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix RCsc store->load ordering of release stores
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 at 02:31, Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
> On Mon, 2026-11-16 at 19:31 +0000, Peter Maydell wrote:
> > On Fri, 21 Aug 2026 at 07:40, LIU Zhiwei
> > <zhiwei_liu@linux.alibaba.com> wrote:
> > >
> > > Several guest architectures give their store-release instructions
> > > RCsc
> > > semantics, which requires the store to be ordered not only after
> > > the
> > > memory operations that precede it, but also before any subsequent
> > > load-acquire with RCsc semantics.  The TCG translators, however,
> > > only
> > > emit the leading barrier before the store, so under MTTCG nothing
> > > prevents the host CPU from executing the load-acquire that follows
> > > a
> > > store-release before the store has left its store buffer.  On an
> > > x86
> > > host (TSO), store-load is the only reordering the hardware may
> > > perform, and it is exactly the ordering that is missing, so the
> > > architecturally forbidden [0,0] outcome of the Store Buffering
> > > litmus
> > > test is easy to observe:
> > >
> > >     CPU 0                      CPU 1
> > >     store-release X = 1        store-release Y = 1
> > >     load-acquire  r0 = Y       load-acquire  r1 = X
> > >
> > > The affected instructions are the RISC-V Zalasr store-release
> > > instructions and the Arm STLR, STLPUR and A32/T32 STL store-release
> > > instructions.  Neither architecture defines an RCpc store, so every
> > > store-release is RCsc (RVWMO preserved program order Rule 7; Arm
> > > Architecture Reference Manual DDI 0487, section B2.3.8 "Acquire and
> > > release semantics").
> > >
> > > Patch 1 fixes the RISC-V side and patch 2 the Arm side by emitting
> > > a
> > > full barrier after the store as well.  Patch 3 fixes an inverted
> > > barrier polarity found in the A32 LDA load-acquire translator while
> > > auditing the load-acquire side.
> >
> > > LIU Zhiwei (3):
> > >   target/riscv: Fix RCsc ordering of Zalasr store-release
> > >   target/arm: Fix RCsc ordering of store-release instructions
> > >   target/arm: Fix barrier polarity of A32 LDA load-acquire
> >
> > This series seems to have been accidentally missed, possibly
> > because it included both arm and riscv patches in the same
> > patchset. RTH tells me that the Arm patches are correct, and
> > Daniel has reviewed the riscv one.
> >
> > riscv maintainers: are you OK with me queuing the whole set
> > including the riscv patch in target-arm.next, or would you
> > prefer to take the riscv patch yourself through your queue?
>
> Thanks for checking, this is fine to go via target-arm.next

OK, I've queued it there. I added a cc:stable tag on all the
patches since they look like bug fixes that deserve backporting.

-- PMM

