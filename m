Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp3161224ejs;
        Tue, 4 Jun 2024 12:05:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvrHPCsgaQ3SPblPDHCW9z43heIljlkghKmOXwSGPweVmBulWOzLUsOW8coT/lJHIrOJzwpKfaucIWtBSMJg6OmKj+ahx7
X-Google-Smtp-Source: AGHT+IH9NV4Hx7me86xKojUDBeEDY0LlYwtvB136N9I+LF5uf0CdCLzMv8DgBA/mxODzHcvlsRhw
X-Received: by 2002:ac8:57c4:0:b0:43d:f71d:98d8 with SMTP id d75a77b69052e-4402b5cceffmr3151421cf.25.1717527938773;
        Tue, 04 Jun 2024 12:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717527938; cv=none;
        d=google.com; s=arc-20160816;
        b=wR3Ns21ZuU5mPnuQkWiyVGdGMW3tTC+1JrwxgjW4Gm62+MXqBcClcAUD7B4Ki4XIml
         ZbrAMXIeXdERA1uJQ6g62pqX9Mbdqfv8EHB5nYOjFzHxHq2Y8FelgTgiZMJAmiv+tIVN
         T5MeSZRzCtolK5WXacvKg54DevrO4XrtEfMmCoFEetiJA+pa/aAqLDgFOnZLkTf6R4pF
         2A6aTxVV1Qwa9C1NbpJXMF+sHDclMmNQSgXys50YNFj4/dH/sKL1iBLudhq+sxLH+mMp
         czPThxGhbouEWgmOKfLD7KEnFRw/vSYCsOgr2B2zo/mIpSE+A9qmqw26OUHaP5g/N07c
         k4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+rTOJ7Kqr/rnSKI7Ci68T3WwWUPxt+fUJX6a/S6M7ds=;
        fh=Lv1zggVIZYfihVrKeWDBi0zBRRpM+PtBeWH8a75jbHM=;
        b=W/WR47/6FYPN0cuxcE8OmoN2D8v8tpbzz1XK3YNmaqhujkUrgVdFrfouXYpm370yvt
         oTjVEJwuOzf/wMH1+G/GBQH6/S4WlODx57CCqZ/QOAzGgA4tLuiNbHpCNq4Tj2R0bL2e
         MhDf5w53ZdLh77q/4BSNKdzYiKlBguNyvHk/QNV1vQG8yclEpDKn20Rr0fatKgc0zgSj
         Nw3B360mBuKMP4B6YH+oQqoyRJT2/iEkPN+gj9XIYS6mydllVuvqy1w4iZX4lScv4yJB
         RxZrB9y5+y2FW0+DnIGw+RHNhFlZGhjMJLZ1zgUf/nK5JqKJDDCTU1NH8sMX7lmruFtS
         Z6Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=d7dbAJqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff259d27esi9003651cf.633.2024.06.04.12.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 12:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=d7dbAJqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEZT5-0004Xo-Hb; Tue, 04 Jun 2024 15:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1sEZT3-0004Vs-DT; Tue, 04 Jun 2024 15:05:09 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1sEZT1-0000OZ-6j; Tue, 04 Jun 2024 15:05:09 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A82F9614C3;
 Tue,  4 Jun 2024 19:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5945CC32782;
 Tue,  4 Jun 2024 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717527903;
 bh=jmr8m84QeZRaioH92NzXs8J5yjL4diJvoxDyDaOt5BQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d7dbAJqMd1o9M8Yk5I1cUs3YCiTMVFY0deSWeDXFvDvfVaBvjsC/nd/lj+rdhzA6H
 AvvQuiYbZau8dAZF0kAplP+wfqnTFnmRMtkaUxdt5o1Ed/TEXDHkCpBchwVatJH0iW
 Z64sTJPtQpmIDab4n1fmHklFBR4ToLycxXoGGKNonX4kxdZOAw8juY0zDiC9wSlVQB
 2RMmfFGyD5Q9d6GPnK/NpvlweZN2QLGTLWGNsL5QJKQ4M/KFUyOpliUFD6A7E/cpqM
 G1kjSgRSd1cJeoTY88r5onIHrlqPPiDLhPPASLFmJhP+UPypItExhSVSMRGTK6HepN
 HA9SOZgjCe/aQ==
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e95a1f9c53so72967151fa.0; 
 Tue, 04 Jun 2024 12:05:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVr5PZnRBz0Y8V2a+qtYfZyNTkPTz3AbBlDOaj1Q9xpEaSRklCclvnm3ZI3YVK0yxh9gARv9ic7Y1bSL1O3omPBVKFCuga0u4ywa0SJ74pbChKWiNSADHqqPtw=
X-Gm-Message-State: AOJu0Yz+ZM1+oZ46AnKiYvz31mBjxbld2XSQcoecIGd9gm9sTTfaOZbq
 ALfzX0WCtB8MWQjN/AaB3KacWpqs7xhQiBotwzDP82SsbHsJd6YzNQW3OOV+hWf5rbwXgTtrnyw
 VQ7zGoKmqW2ia66u6sJSnYiz0WD8=
X-Received: by 2002:a2e:9617:0:b0:2d8:3e60:b9c9 with SMTP id
 38308e7fff4ca-2eac7a82898mr845991fa.33.1717527901688; Tue, 04 Jun 2024
 12:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
 <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
 <cbd630d7-01e8-49ba-9c8b-a6514d898ed2@redhat.com>
 <20240531150922.GA83195@myrica>
 <CAMj1kXHK+xTTMsfP0sfn+-8S_fJebSXr4QTcHU2aCzd7t5x3HA@mail.gmail.com>
 <20240604180836.GC875061@myrica>
In-Reply-To: <20240604180836.GC875061@myrica>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 4 Jun 2024 21:04:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGiXucTF_Zxix4KeZXufdcDPpBHA5wOubQHHyt=E7w10Q@mail.gmail.com>
Message-ID: <CAMj1kXGiXucTF_Zxix4KeZXufdcDPpBHA5wOubQHHyt=E7w10Q@mail.gmail.com>
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
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: 3cMvAIIFqGyS

On Tue, 4 Jun 2024 at 20:08, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Fri, May 31, 2024 at 05:24:44PM +0200, Ard Biesheuvel wrote:
> > > I'm able to reproduce this even without RME. This code was introduced
> > > recently by c98f7f755089 ("ArmVirtPkg: Use dynamic PCD to set the SMCCC
> > > conduit"). Maybe Ard (Cc'd) knows what could be going wrong here.
> > >
> > > A slightly reduced reproducer:
> > >
> > > $ cd edk2/
> > > $ build -b DEBUG -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc
> > > $ cd ..
> > >
> > > $ git clone https://github.com/ARM-software/arm-trusted-firmware.git tf-a
> > > $ cd tf-a/
> > > $ make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu DEBUG=1 LOG_LEVEL=40 QEMU_USE_GIC_DRIVER=QEMU_GICV3 BL33=../edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd all fip && \
> > >   dd if=build/qemu/debug/bl1.bin of=flash.bin && \
> > >   dd if=build/qemu/debug/fip.bin of=flash.bin seek=64 bs=4096
> > > $ qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3 -cpu max -m 2G -smp 8 -monitor none -serial mon:stdio -nographic -bios flash.bin
> > >
> >
> > Hmm, this is not something I anticipated.
> >
> > The problem here is that ArmVirtQemuKernel does not actually support
> > dynamic PCDs, so instead, the PCD here is 'patchable', which means
> > that the underlying value is just overwritten in the binary image, and
> > does not propagate to the rest of the firmware. I assume the write
> > ends up targettng a location that does not tolerate this.
>
> Yes, the QemuVirtMemInfoLib declares this region read-only, so we end up
> with a permission fault
>
>   // Map the FV region as normal executable memory
>   VirtualMemoryTable[2].PhysicalBase = PcdGet64 (PcdFvBaseAddress);
>   VirtualMemoryTable[2].VirtualBase  = VirtualMemoryTable[2].PhysicalBase;
>   VirtualMemoryTable[2].Length       = FixedPcdGet32 (PcdFvSize);
>   VirtualMemoryTable[2].Attributes   = ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK_RO;
>
> Making it writable doesn't seem sufficient, since I then get a "HVC issued
> at EL2" fault. I'll keep debugging.
>

That is expected, sadly. As I said, this code was never intended to run at EL2.

The dynamic PCD will propagate to other boot stages. However, the
'patchable' PCD that we use in ArmVirtQemuKernel is local to the
driver, and other users of the PCD will see the default value of
'HVC'. Which would be fine if we only executed at EL1.

So I know exactly what is wrong and have an idea how to fix it - I
just need to find the time for it.
