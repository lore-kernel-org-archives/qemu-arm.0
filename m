Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp583547ejs;
        Fri, 31 May 2024 08:25:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmcRuYSFHvUuqIyYVhcZGmbMqBsJJkvEjadVQ7xXLB7aNDkhiZ4ukWRnK07To9IO8wMOgxH9/7mtKlU3l/tL3EPvyio9qv
X-Google-Smtp-Source: AGHT+IHYQWd8UVc7jokjZk79KggWddXvqcrhuqo7uadUCnF9XLnzxHC0eu3tGWLnrX48Cuq7QwKg
X-Received: by 2002:a2e:97d4:0:b0:2ea:7a26:d155 with SMTP id 38308e7fff4ca-2ea9511467emr13059671fa.30.1717169125045;
        Fri, 31 May 2024 08:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717169125; cv=none;
        d=google.com; s=arc-20160816;
        b=FVzsxZFEL7UZ48pJdictpZfsvIy+H1vVv9B1DZGDXpbLW9USb/+nqQxybLTSgZIGd+
         NdWgf7qDBTUZ4uKgCpKiLg8SRB0EpC5pqFOZfFCSVNvNVvdbFnYtREAwBOPJoVyeq7+C
         Z8oC3sdZymJLkiP9pF+VQCLRoj7O3dHOe9OUu4rJfYdkhGck572JSRykfcI/Vb3Ywda2
         WOccoUBzYoA4IlAfhFgL0ISjLIr+n6b3xVFiNV8VXfCsVmmQjm25QUGAF0JxyU/sFjIa
         htApTKP0m7ssVYT8dva1Tc3eo4hE5ZvSxTXj3fGhPi9JPt//uSANKhYQeALg2gzyL5Pv
         hJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TWyMl6UQxVm0HVXZ6APUGYq9EM3d7gYl4nXI68nQmBU=;
        fh=b9KicuAKFE+u4AkaZ6iYWS7oEKA0dFZkzZrVQ+EQgZ4=;
        b=D0yZOWcnnVte1AO0bwGmL4D0eBIEUgVJPFWQbsIUR3KPs1JGU03egtARs2HctpQwy8
         GNgMuBhvxdpSULhvrBERe7YR7ASxWrD9y4NEOgLWWNoNsq2VzdPe0mUTDFpv2QHboXUr
         A+BbDTWbO4tiLcW5x6eI/1wxynxg3Se8LRkIUqZMezCgu0DzQklatYmJ/CCI2+aukKUe
         2cFbYBR5chOGqRWOFm0qkyPmdI5Cx69VApsjSfLc5bkphniDcIMIduT2hauDRz/OCaTe
         IeUaxAmj+oA7o+hGCRyamishBUZCl4ntxnUKBRT/TDf5P53wvRtP/DKgAgjD1VdTGjrD
         4A6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sKb1NgZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42129e7845csi17077135e9.198.2024.05.31.08.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 08:25:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=sKb1NgZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sD47s-0006Cf-5b; Fri, 31 May 2024 11:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1sD47r-0006CT-JI; Fri, 31 May 2024 11:25:03 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1sD47o-0007em-Qi; Fri, 31 May 2024 11:25:02 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3316C62AF8;
 Fri, 31 May 2024 15:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DB3C2BD10;
 Fri, 31 May 2024 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717169097;
 bh=wNgmQZbejt8PgD6QdJomcAKqC10mtKRuTUyuNmBGgZs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sKb1NgZaJKWPUJWL6hjopVEYd4TT6lDpo6ia1NAnZy/TwdN83jVxjzfZiNX2YvECc
 2vgqjlEf3tL1cxzLLKYWM4FU0ukRfhhxmMQzdwF/6KnlYWhw1nA6A55RBY71yCVcnL
 JYBSMiOgA5Z9EaXYdlboa6P1ZWzzXyUOU92ckSDxXKjEKLdtX4resU73lcP6kidMVi
 P8Uzl9aDP1ZeRJ0OKkC8mkG6cLoFml4foyj4bys3j6fsGTNMapV2qIA5XNbSllnbNW
 PUJ4+jq43HZYaaw365M9Lk4/2HKsMF6xilRsGFSvvfnT8JQ26Y5dOc8YQscx7JyvAT
 fAPlaLMrGBS4Q==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52962423ed8so2621518e87.2; 
 Fri, 31 May 2024 08:24:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVS+VdPKYtMpg2L8Y1sTCiH9GlwJIr5YSacfIyvcNkDQ8ClKPDnmyIGcstylfFwtUVxmRqqlBYdm60dvLdsI1nYJ2lWOmdE/4+cxMBKZznprLfp7Og9roz9MuE=
X-Gm-Message-State: AOJu0YxN5MgK06AaxUvbjwg9x3lMjPkKash1TtjQaYpGvDRhgzGx9GR5
 goCeTz/IcjoZVCeYgxcdSa2U89oWnNnGkXMTyWMlm8dGn5D1O4pgWvOphCfn1cPXsxE9IwtNgZw
 aBDMcoiNyzm8G6xtiRprOoqqBHJ0=
X-Received: by 2002:a19:c514:0:b0:52b:7953:2389 with SMTP id
 2adb3069b0e04-52b895b2d6cmr1315627e87.39.1717169096126; Fri, 31 May 2024
 08:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
 <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
 <cbd630d7-01e8-49ba-9c8b-a6514d898ed2@redhat.com>
 <20240531150922.GA83195@myrica>
In-Reply-To: <20240531150922.GA83195@myrica>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 May 2024 17:24:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHK+xTTMsfP0sfn+-8S_fJebSXr4QTcHU2aCzd7t5x3HA@mail.gmail.com>
Message-ID: <CAMj1kXHK+xTTMsfP0sfn+-8S_fJebSXr4QTcHU2aCzd7t5x3HA@mail.gmail.com>
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, Itaru Kitayama <itaru.kitayama@linux.dev>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.085,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: aFtEFlvIbiNw

On Fri, 31 May 2024 at 17:09, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Hi Gavin,
>
> On Fri, May 31, 2024 at 04:23:13PM +1000, Gavin Shan wrote:
> > I got a chance to try CCA software components, suggested by [1]. However, the edk2
> > is stuck somewhere. I didn't reach to stage of loading guest kernel yet. I'm replying
> > to see if anyone has a idea.
> ...
> > INFO:    BL31: Preparing for EL3 exit to normal world
> > INFO:    Entry point address = 0x60000000
> > INFO:    SPSR = 0x3c9
> > UEFI firmware (version  built at 01:31:23 on May 31 2024)
> >
> > The boot is stuck and no more output after that. I tried adding more verbose output
> > from edk2 and found it's stuck at the following point.
> >
> >
> > ArmVirtPkg/PrePi/PrePi.c::PrePiMain
> > rmVirtPkg/Library/PlatformPeiLib/PlatformPeiLib.c::PlatformPeim
> >
> >  #ifdef MDE_CPU_AARCH64
> >   //
> >   // Set the SMCCC conduit to SMC if executing at EL2, which is typically the
> >   // exception level that services HVCs rather than the one that invokes them.
> >   //
> >   if (ArmReadCurrentEL () == AARCH64_EL2) {
> >     Status = PcdSetBoolS (PcdMonitorConduitHvc, FALSE);       // The function is never returned in my case
> >     ASSERT_EFI_ERROR (Status);
> >   }
> >  #endif
>
> I'm able to reproduce this even without RME. This code was introduced
> recently by c98f7f755089 ("ArmVirtPkg: Use dynamic PCD to set the SMCCC
> conduit"). Maybe Ard (Cc'd) knows what could be going wrong here.
>
> A slightly reduced reproducer:
>
> $ cd edk2/
> $ build -b DEBUG -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc
> $ cd ..
>
> $ git clone https://github.com/ARM-software/arm-trusted-firmware.git tf-a
> $ cd tf-a/
> $ make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu DEBUG=1 LOG_LEVEL=40 QEMU_USE_GIC_DRIVER=QEMU_GICV3 BL33=../edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd all fip && \
>   dd if=build/qemu/debug/bl1.bin of=flash.bin && \
>   dd if=build/qemu/debug/fip.bin of=flash.bin seek=64 bs=4096
> $ qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3 -cpu max -m 2G -smp 8 -monitor none -serial mon:stdio -nographic -bios flash.bin
>

Hmm, this is not something I anticipated.

The problem here is that ArmVirtQemuKernel does not actually support
dynamic PCDs, so instead, the PCD here is 'patchable', which means
that the underlying value is just overwritten in the binary image, and
does not propagate to the rest of the firmware. I assume the write
ends up targettng a location that does not tolerate this.

Running ArmVirtQemu or ArmVirtQemuKernel at EL2 has really only ever
worked by accident, it was simply never intended for that. The fix in
question was a last minute tweak to prevent some CVE fixes pushed by
MicroSoft from breaking network boot entirely, and now that the
release has been made, I guess we should revisit this and fix it
properly.

So the underlying issue here is that on these platforms, we need to
decide at runtime whether to use HVC or SMC instructions for SMCCC
calls. This code attempts to record this into a dynamic PCD once at
boot, in a way that permits other users of the same library to simply
hardcode this in the platform definition (given that bare metal
platforms never need this flexibility).
