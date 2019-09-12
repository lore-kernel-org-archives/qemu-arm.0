Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1875884wrp;
        Thu, 12 Sep 2019 02:01:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjJJ2/7vj2TAACmHXOVoGkRmTzKRZOkGLI9jRjgakF4Ga9rnz3RSXsJIRakbeGNt6/t9W3
X-Received: by 2002:a37:bd45:: with SMTP id n66mr38433799qkf.272.1568278886962;
        Thu, 12 Sep 2019 02:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568278886; cv=none;
        d=google.com; s=arc-20160816;
        b=Ae8grBjQ19E+fKb1kmLyj1SDbxgXLoeiJ/sbGGPuPNV1YjR5d1fYPJtSHpP9rt8cDN
         Q6hDUIVWrhM7QMuwU/HBtz4jryWHpuvLyl47Y6Dvql4AY6OPVLd+dG7IA92UQOpUnm70
         UMhlSsRUNRPLrlRRnhcEzVTi9j9UmGcdR8uWJOTzWvXkRyXHXAUgHthm6ZKIVdISEcfs
         U9OUdKASZ+h+y5uXIC2f8Ar2iypNjzSW1W9WrLfSaq0j3A3eahV7Qekd/P4lfXnvemw1
         yXiI/MnYhLIyIYqU0TodQeHrxPZVIcZnoVAmYXWzL4CsqBNDI5CBQqQNQoyeBzpPzo9d
         F/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKAjqj/41klknl2QNfAVWPQR2aLtTz/mhjdc7DMyAyE=;
        b=OOeXkCHXz+j/m077kBQDZ92WW4lXgDBx3AYA46AdC1TcdEa9laawtcBzafY+cVrQiP
         BSr2AUXEUGYUccFxamWJFOdTKf8Ij1IaxyfMlc9HZwXqvizc1/8GEcH7EWaAYjE6/KqK
         M2hysrH7Lk2g4ydf0AK0cHRDdmTBq2Y4adX3xXObuvpjGqGo1gGDDqnMM3R+0En7xs79
         HaDZktU3j0pRPIay7yc2gwGqiYqbs/7zaWGpjGcIzwjf3GFgaXNGEs4ajT5d8Twlol0L
         y6PBRAEpP3nffNjMM/ORCGtDQBLMWM/01r/wr/Pcmda59a8PzIOHA/D5zmDbpJyp1f/z
         IfkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=grhiSMuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si7125108qkg.231.2019.09.12.02.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 02:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=grhiSMuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8Kyj-0003Q2-MH
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 05:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i8KyE-0003FX-Si
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 05:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i8KyD-0005TI-Ey
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 05:00:54 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:33991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i8KyD-0005SU-2X
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 05:00:53 -0400
Received: by mail-ot1-x331.google.com with SMTP id z26so16093368oto.1
 for <qemu-arm@nongnu.org>; Thu, 12 Sep 2019 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OKAjqj/41klknl2QNfAVWPQR2aLtTz/mhjdc7DMyAyE=;
 b=grhiSMuFCmf832JF9vGDDEmzU4Bw7YjAHjUmG1X6dpmvkMFUHp5Cn/w696KXoBRpgX
 Me50AA5VvakDciC5tuOtEOX5gCratk//qa3MBk/nJ3yKDR72ZFDF9wgMm1zqfc6T17nb
 Udvo6oH7+jQ//+niLY2D3Fwp5gQixXeIKbYJ8Er1f7hSMl3ofNSBJIAHFrA55tU32HS4
 X5Ftie4+Q9GYmk+CnLAZDpVhM03yjQ7/Yjm3ta85ArwkSCq3UGtr7/SPbInyQSVuGwuT
 cY4EQCQkhbJ2sT/3jPwypARibQwAPzwvwLo/g67D0JvaLUAlzzgxA5RtR6qor+PmjC8Q
 kbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OKAjqj/41klknl2QNfAVWPQR2aLtTz/mhjdc7DMyAyE=;
 b=iNSKuSn4cs/iEpDElhQOy5B2c5X6D8mlfZsOQSapO6Fm49Zf/FJ5hoiYCKNvs8tsFV
 39oTPaOTPozTIbhDgMVOnQrCKo/rQhUWa7+NKHbac2TZXFvh6u8HJvi+kBZiJvkndH0O
 rSS/Ec7hXHEpiMGubv4FXQNbvaYS1JucFdeY24JTOKTBUrGLylf+8NwpU5peiAbqCCH3
 dxniraoYHMfqz0987t0InceJtEr4UtKG6FIRlTCJ/CnyMCv5g/RzzPhqU2yz7VDPEpRZ
 cYkSc7lpTz18CfrOcFgcGkbYhuGVQ5cPFvpy2vbELTSmxS8BDD7iFoDQN2SaefmYMFd4
 RyYg==
X-Gm-Message-State: APjAAAWxvt3f6bDjCa0n5jFB4mopSX/5bTys/s2Z3MHoy99+3EhYVVir
 WGi72OVE5Gxp7SmJI9G/TiWsamMRE2bplQZwbIa8ug==
X-Received: by 2002:a9d:68d6:: with SMTP id i22mr26144709oto.232.1568278851677; 
 Thu, 12 Sep 2019 02:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190911155125.11932-1-eric.auger@redhat.com>
 <20190911155125.11932-4-eric.auger@redhat.com>
 <CAFEAcA-tZJ2C8=ZH5e7tXzigPu3SGjSJbnLybZTG+hZO-7ZV0A@mail.gmail.com>
 <1b849672-31a6-3d8d-b8ea-254e737e3b80@redhat.com>
In-Reply-To: <1b849672-31a6-3d8d-b8ea-254e737e3b80@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 10:00:40 +0100
Message-ID: <CAFEAcA-xrPP6=dmaee7PZHOr_Fpw-KsCGY5QKHR94wL1uKWL6A@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 3/3] virt: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tN8BW1fm4rZz

On Thu, 12 Sep 2019 at 09:57, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Peter,
> On 9/12/19 10:42 AM, Peter Maydell wrote:

> > Is there really no place to put this check in common code?

> Not sure what you mean by common code here? Do you mean in a common code
> for ARM machines (I don't think we have any atm) or directly in
> kvm_init(). I did not want to pollute this latter with this ARM specific
> fix.

I'd just rather we didn't have to have the same "if ..." check
in every arm board that supports KVM.

If kvm_init() happens at a point where we have enough info to
make the check, then you can put the check in kvm_arch_init(),
which is the architecture-specific hook that kvm_init() calls.

thanks
-- PMM
