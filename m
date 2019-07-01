Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2741958wru;
        Mon, 1 Jul 2019 08:00:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcJhxnt7EAIi1eRA3LwaDvM4dceS2hEom/1H7lD2rQqb+tamCYl5/kTguz1wxDqcVU7BMV
X-Received: by 2002:aa7:d5cf:: with SMTP id d15mr29590931eds.67.1561993205090;
        Mon, 01 Jul 2019 08:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561993205; cv=none;
        d=google.com; s=arc-20160816;
        b=b/ItoEzUs7RJjwiYSp8uH+A+J9RnamTe1FDlHF2uAHwfz8BxPpS4tYwXG5x69WapKT
         U0w+VwObo1vtdv4Q1Xg7zNaNZ4RiP2I3K3g8eSvkwHapu6CnChHQ6eS5cTVF2VwsP678
         HgTFIN6KwE2od77unkywaevYyUbtLElkL+53k73Us7MMKW1VfsQaIjpbkjlAXpOlnx9x
         O+mf8L6z6yTmJrRDRR3+bjnGti6994JtqeOlEto4Tp5dQtplybPU4K/md99bdV+w3p3Q
         Q/aXpKywf/j/HFvAlInah8YRUwgpKXO7CfT6r/mem/MNAKroqdumFEOnUz03zQmjpRwq
         JBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v8mWmOTDXUBtlhUdnimPF0goXk8Uy165smt3zk5fOYA=;
        b=Lt3XM9jWOnitJ1imZFVp+MCCOm0rv582FQN9SHLyfMHCoV7CkR4tjozMZn+mU/qMrC
         /oJdvkDOEPQImqzWWEMm+Z96Gq0uTD5DsY0Aifg4rgTS8CxoeWzXjZUqVhJNK89dQFTx
         IAhvo2jfgRaxI7Q2hHcRcLg3wZm11Iq+JqGcv4N/glSMg9o+nxNqFuEvBiHyZfODTa53
         1fahsyIj7oB4MmqW5VruPxJ7wPophHisNNeStU4bD4ehHZ9yw2igVPf03T+QSg8NMwnM
         laQYlI6Isu1EvdxgivJZaS6iCRpecmw2QmWXkgoYcaDJTQzRefJUoxPN4yAXln3XnKW1
         5/OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UfUdIVfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d38si8891178ede.318.2019.07.01.08.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 08:00:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UfUdIVfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhxmm-00019P-4L
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 11:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58633)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhxXh-0005pb-Bx
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhxXX-0001e1-8h
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:44:23 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43728)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhxXW-0001cL-IB
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:44:18 -0400
Received: by mail-oi1-x244.google.com with SMTP id w79so10155153oif.10
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v8mWmOTDXUBtlhUdnimPF0goXk8Uy165smt3zk5fOYA=;
 b=UfUdIVfrWj+XlxguyyRxkjPeK2B/tJ/NL4J6mdENeFvfST1kZsS2iKmFaYtPcx2hWs
 1PwKEBWQYrT74A4NUMSQtRx2y6asC2tqHy0ePXAbf6TLUXeyCww32xH/amU6LtR+OoJw
 dCqxGPG8qEmChsRvHDqA1/e2dYj6c6wEVFnC+wyyfPmttsppY+pTRmaabb9WuyG36n7+
 6V+Ja5gweoEbbQeNxH9NsHCYLoCTY1M/CGPheQ4QK34kiYgpOAIt/AAcc3srLDW6dg0R
 crTV9J2wjvhVIRl8v5wvrM+U/Ez+wqVuiS3MVsddTXOhK08diEA/KbhFpwYkqsqJHxeE
 zKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v8mWmOTDXUBtlhUdnimPF0goXk8Uy165smt3zk5fOYA=;
 b=OoNkzGeElECiGIbwiKZv2zY9T7zZRCj+p06Fi0Ifb+XXe+8nBKct7iK7leVkpZTgh/
 iW8q8uRlUHAHsTnYdFt01SC+IkWFKVXHBMIn0iikngB1AM/n33kJdixACqu2873212hl
 d6r5XgVJ1PUR4LHZp5tUEYGKqjmO/uI+Tnt77Rdiu8d3RoTmNDCUz1pa7ozdrsusMnRy
 jxRZ6RSMecTb7FzkdMexy6IiaQPuN7B4jRqn0Kt1TAUaEwL/6r5ZXkrW3R/TcoKwktSg
 Ae65aIv/7QFhxDhINJ5pMdxXpebcudZmvu239zNYa6CbQYaUTY2BAabZTVHO2GvNkCQW
 Cg0A==
X-Gm-Message-State: APjAAAXykLPJaEMlIo/MBSzcytLbjqwzJ/0OnU/0x7Td6wlchEpE8Xkz
 NxzsJhWTiEcHF/V4NBu3FrfCkrU9w7mjpK0EDenWxw==
X-Received: by 2002:aca:6185:: with SMTP id v127mr7240404oib.163.1561992257364; 
 Mon, 01 Jul 2019 07:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <1561890034-15921-2-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1561890034-15921-2-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 15:44:06 +0100
Message-ID: <CAFEAcA8Dxyz9tkhmmV0ACjCDw+r9q73-AY6vhK0cRE9AVLhrLA@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v9 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: va9jlU/Spoar

On Sun, 30 Jun 2019 at 11:21, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware, for supporting
> firmware and OS development for pysical Aarch64 machines.
>
> This patch introduces new machine type 'sbsa-ref' with main features:
>  - Based on 'virt' machine type.
>  - A new memory map.
>  - CPU type cortex-a57.
>  - EL2 and EL3 are enabled.
>  - GIC version 3.
>  - System bus AHCI controller.
>  - System bus EHCI controller.
>  - CDROM and hard disc on AHCI bus.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - No virtio deivces.
>  - No fw_cfg device.
>  - No ACPI table supplied.
>  - Only minimal device tree nodes.
>
> Arm Trusted Firmware and UEFI porting to this are done accordingly, and
> it should supply ACPI tables to load OS, the minimal device tree nodes
> supplied from this platform are only to pass the dynamic info reflecting
> command line input to firmware, not for loading OS.
>
> To make the review easier, this task is split into two patches, the
> fundamental sceleton part and the peripheral devices part, this patch is
> the first part.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>

> +static const TypeInfo sbsa_ref_info = {
> +    .name          = TYPE_SBSA_MACHINE,
> +    .parent        = TYPE_MACHINE,
> +    .class_init    = sbsa_ref_class_init,

You need here to also have

    .instance_size = sizeof(SBSAMachineState),

> +};

Otherwise we won't allocate enough memory for the size of
the struct, and will run off the end of the allocation.
You can see this if you do a build with just patch 1 and
try 'make check' on it with a clang-sanitizer build
(ie passing configure  '--cc=clang-7' '--cxx=clang++-7'
'--extra-cflags=-fsanitize=undefined -fno-sanitize=shift-base -Werror')
as it will catch reads off the end of the memory.

thanks
-- PMM
