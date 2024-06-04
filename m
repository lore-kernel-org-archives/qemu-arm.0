Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp3131650ejs;
        Tue, 4 Jun 2024 11:08:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVpsQ8JFMCrChr4cezWL/AwbTfmPQF8QNeI+V4w582o1OkIVSTSbgKxyo4/66wFmWcaBii0BVGddsf4TJtkOAWb2wVmh4o
X-Google-Smtp-Source: AGHT+IEaf/sJMiNrfLDbQNPHk7XIJhObt3KlLivjswMWMxJNMwXvO51InKgRxHD1OnUb/vKXvm8a
X-Received: by 2002:a05:6359:4c89:b0:19c:50d0:b909 with SMTP id e5c5f4694b2df-19c6c6920ddmr24016355d.8.1717524518396;
        Tue, 04 Jun 2024 11:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717524518; cv=none;
        d=google.com; s=arc-20160816;
        b=cCDCP56eA3rWTRs1NF6nFt362L+0r5SNqSlf4hKWnWN7LIpIiMpKUHuILEW5O8iqdp
         UC5T3O5N/e0fgfD3ngK4AYcUO1H5fA98+OOdp7pvScN2O3k0J3lIi8P1mENm3p9c4Van
         1bDSnMqLtyvOjGFvXlr7LqOnav2A7bTQsF3IMaTMU8ekH+wwcBmnFZwxJecesgx7sJyg
         +/6IcYCwwdcjZhehcZBx2QLNmTsvwdv67UX0XZMZR5I87iKhfE0yLYvQy1LWFzm7FGAU
         BZd/OVm3UmYyodxZLsFV7wwt4DG7y4cJm6vpqJRpqR+OisBR+wNqw+ES3scFOWgsXrj8
         sdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=GRdyMNWI1/nLhg2t3CJMpyoR7lf8Bg93JMh6F28wXn8=;
        fh=QQ3+2YpdQFqLxAiCeTGflSaBQTA+ww3XoFpwO5CDDQA=;
        b=C7H0DTzDLTqMDxEWNljZ45LXV4TA/N1W4fEoPyW8PSbNU4K4GAh59P7iIxrcAYDwQs
         SQQe+dv8WxIIMm6k8utiO8tmbp8GCIFH+UlACb7Zd/AOPK35gR7FogjZpWMZSMiFd8mv
         JsjFyg6tUELpxoCWsgKuvA650OmrVZ2AToDuqYv78wIgQ6OulUUiJLZVR9H7X0QyJhui
         amy6DFAgTUn9Y5de0e1Nf16wnRAhbTYga/rWOyT11/3yJynW/9sC5J6PckvLA+647Kcr
         iVzYVOabneYaiBrrsZoLAd3YBFF2dcPAmlSd0R18Z2ux0Y6wYrs4P6jYeVl44njqSRtJ
         rQkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksKxX4xM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b43b005si12536586d6.565.2024.06.04.11.08.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 11:08:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksKxX4xM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEYaD-00032E-Q8; Tue, 04 Jun 2024 14:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1sEYaB-00031r-So
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 14:08:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1sEYa9-0005oH-Tc
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 14:08:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-35dc9cef36dso4978314f8f.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717524502; x=1718129302; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GRdyMNWI1/nLhg2t3CJMpyoR7lf8Bg93JMh6F28wXn8=;
 b=ksKxX4xMd4QwKvEapEkxmxzH/uxDi9gb1U5dJ/Fg41ZhGv6qoi+kh/q7EgMd3hcG04
 5OB/EsvlBBOvn4DZ24MwOYU1LysM3Mg0QTI6IlndHpUw0aMdiJ2PFdroX5ZMlZ0xfMx2
 xbAeqxyomropr9qxwktWF7ttcdPSU98XovK/OCXI2cidPbS9pqVyraIuVTjyR1fkdG0H
 E8hf1YL08iPx0qYlVOVLHC1Sy72V15H5QIL1EhJMI2XM0xpaqwXR5LLfAOz/7TPH9f9M
 jPx9RF3uQSIXhfWAufTDcZJuRNE3bXVM1DwZJ5oBOqqHOXlfWy0jjUxLky/FOZ9zGgpd
 NdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717524502; x=1718129302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRdyMNWI1/nLhg2t3CJMpyoR7lf8Bg93JMh6F28wXn8=;
 b=TfssvJS2ddTehPoSAIxczam+z1f0URfTgLTWqUKLouK/t4h0rsojQ+KKG2zOTjpP8H
 MWRL/EpvM26J/+WlA2R9IkNcuQ/37C1htwWX9GVup1bDupc1TlEH2R34NaNN4Tu6O+w/
 vaDTGBOqR7hXX2UBjPV6s5I7kah9clPB2njnUCf21jfyNbq+iZZadFBDUYSM71bmru5j
 EAylcqfsD4J/HNOvsr2m07OYArqbD8ZGufGDgVwXkE4gWyGAnUW0uK0Ea3+kHl62FVuw
 fzR+JqZEL11viV9+cGJDdEvQgO4nekjiDqYGYS4afbD0549Fcn3EEdyjuJ8lxpI26UBs
 vKhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmahtkQ/30TFm+L2bCteuDnknTwB3iPnRnFzQuBRrv9JXi9Haya0SdxTfwBr/3WE7/G1IUGqQ8DVEPj0i0/grwWuqV
X-Gm-Message-State: AOJu0YyfIDjM72YP/Y32+TsbGit1cvE71+sN3kN1gRBFSxTssG9iMdsg
 x63r3+nC8TPpNO3iAWt92UeCsxyQqPUwYtTeW1SL+GqLNfq5mbpCyr8aL4TK+g8=
X-Received: by 2002:a05:6000:6:b0:34f:7788:37ef with SMTP id
 ffacd0b85a97d-35e8833a089mr125767f8f.29.1717524502366; 
 Tue, 04 Jun 2024 11:08:22 -0700 (PDT)
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064fd2fsm12209005f8f.109.2024.06.04.11.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 11:08:21 -0700 (PDT)
Date: Tue, 4 Jun 2024 19:08:36 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Gavin Shan <gshan@redhat.com>, Itaru Kitayama <itaru.kitayama@linux.dev>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
Message-ID: <20240604180836.GC875061@myrica>
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
 <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
 <cbd630d7-01e8-49ba-9c8b-a6514d898ed2@redhat.com>
 <20240531150922.GA83195@myrica>
 <CAMj1kXHK+xTTMsfP0sfn+-8S_fJebSXr4QTcHU2aCzd7t5x3HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHK+xTTMsfP0sfn+-8S_fJebSXr4QTcHU2aCzd7t5x3HA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: BgtEie5v/7jQ

On Fri, May 31, 2024 at 05:24:44PM +0200, Ard Biesheuvel wrote:
> > I'm able to reproduce this even without RME. This code was introduced
> > recently by c98f7f755089 ("ArmVirtPkg: Use dynamic PCD to set the SMCCC
> > conduit"). Maybe Ard (Cc'd) knows what could be going wrong here.
> >
> > A slightly reduced reproducer:
> >
> > $ cd edk2/
> > $ build -b DEBUG -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc
> > $ cd ..
> >
> > $ git clone https://github.com/ARM-software/arm-trusted-firmware.git tf-a
> > $ cd tf-a/
> > $ make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu DEBUG=1 LOG_LEVEL=40 QEMU_USE_GIC_DRIVER=QEMU_GICV3 BL33=../edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd all fip && \
> >   dd if=build/qemu/debug/bl1.bin of=flash.bin && \
> >   dd if=build/qemu/debug/fip.bin of=flash.bin seek=64 bs=4096
> > $ qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3 -cpu max -m 2G -smp 8 -monitor none -serial mon:stdio -nographic -bios flash.bin
> >
> 
> Hmm, this is not something I anticipated.
> 
> The problem here is that ArmVirtQemuKernel does not actually support
> dynamic PCDs, so instead, the PCD here is 'patchable', which means
> that the underlying value is just overwritten in the binary image, and
> does not propagate to the rest of the firmware. I assume the write
> ends up targettng a location that does not tolerate this.

Yes, the QemuVirtMemInfoLib declares this region read-only, so we end up
with a permission fault

  // Map the FV region as normal executable memory
  VirtualMemoryTable[2].PhysicalBase = PcdGet64 (PcdFvBaseAddress);
  VirtualMemoryTable[2].VirtualBase  = VirtualMemoryTable[2].PhysicalBase;
  VirtualMemoryTable[2].Length       = FixedPcdGet32 (PcdFvSize);
  VirtualMemoryTable[2].Attributes   = ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK_RO;

Making it writable doesn't seem sufficient, since I then get a "HVC issued
at EL2" fault. I'll keep debugging.

Thanks,
Jean

> 
> Running ArmVirtQemu or ArmVirtQemuKernel at EL2 has really only ever
> worked by accident, it was simply never intended for that. The fix in
> question was a last minute tweak to prevent some CVE fixes pushed by
> MicroSoft from breaking network boot entirely, and now that the
> release has been made, I guess we should revisit this and fix it
> properly.
> 
> So the underlying issue here is that on these platforms, we need to
> decide at runtime whether to use HVC or SMC instructions for SMCCC
> calls. This code attempts to record this into a dynamic PCD once at
> boot, in a way that permits other users of the same library to simply
> hardcode this in the platform definition (given that bare metal
> platforms never need this flexibility).
