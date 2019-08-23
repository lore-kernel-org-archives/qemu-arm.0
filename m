Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp768073wrs;
        Fri, 23 Aug 2019 09:10:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfi+Xw0VjFe94yiq8iSCBuk49eqST8n2vRGEdFZYAI+wazC/7qr197ZzYtTUGfWS6iDrmm
X-Received: by 2002:a37:a48e:: with SMTP id n136mr4877086qke.223.1566576628217;
        Fri, 23 Aug 2019 09:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566576628; cv=none;
        d=google.com; s=arc-20160816;
        b=QPajb3NYiaec3UpcYod+4toxFOH2zJQ3mtn8R0sI806/AER+jBCbOSf/kQKQuZlUFP
         hSd5l5DBqgPVJu++P9VLxcNq9RHZuBel+gSi1kgzhBOymcpCXlgpBqu46AHylXHex7qf
         uVRaHUdmt6AyJzKIVctT/vR1GbIfdv6AZfkRxtQk/4oXNUiDVh8J49VGFMnLXkevcmfG
         t0fVswFvLS3dmOtCfMBfnaMhl3xJrAiBEyTU+onaUX/uaPQUzl/Nv1Mea5ureap7Vn+o
         gYpYUfhe7V3vfXnNe6FY4/Zcpz9hnleeGkeBazWC3bnZi8vAgBqsU8RuUp/fGNqoUKUP
         yl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJN13Og6DN9PUForrtTLS5vI8rP5ub7uU0ZHUkx6x1s=;
        b=DnH7FckpQcW5n9XKMv/r4HXUzlaDoBD+z7arfhoPPZSTxn0SEnPs+teww0G4nuS4nl
         jRqYTr8xTJdGtBctSuz9yDDW5XYdajPMI1QK9faL5Sfc/xovkjYAJlPOQyO0ITRioX0l
         qrkBr2qPnLS9J18Ntfij7MLV8KoAoyJW6YftRDek7LJI02gMzB/IWATRtco1VVxKgPEm
         ayhguKaPtUPIJG4xqaY+aUgtDmEoZJjRlTGRnAScG8wwgG9kHya+ZaS7ZIer3MsbgHCu
         pPrKAy6WQOJ6zsk1HgUr+3Q2TIQccebEHjnXawDsSaB/TCvAHGKfRxK2VAPMLx3egzwi
         KRUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YaGATZQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x35si2262395qta.154.2019.08.23.09.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 09:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YaGATZQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1C8x-0006G5-5p
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 12:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1C72-0004MV-IO
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:08:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1C70-0007FF-Ua
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:08:28 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41288)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1C70-0007Be-Lz
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:08:26 -0400
Received: by mail-oi1-x244.google.com with SMTP id g7so7393532oia.8
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 09:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vJN13Og6DN9PUForrtTLS5vI8rP5ub7uU0ZHUkx6x1s=;
 b=YaGATZQsmivVFJe1C5VkG9cL/JPCHgSJoZeG0HEH/+I3RDMvRjfvTd8+rqd9IN0bGj
 UDmh3sNdzFrZJWA6+qlpemmPbOswBkUvBCI/mpe2pvB1i2va4DXj44jJNXjKmKfGAx7R
 cemUui97qmtKvkW7Cy6GDKofPog7o9rjwJWnupsAI22f8j7/Qbtq3wQgAZTdqX2+cSXk
 vu0nC6x13QUtoXsAzKmPzrxbIM8cEZHMxd352jXYIalHVzEDqDffBP/YrALKl7ymPDtz
 11V/PuQfzBj96GhC7Q1jVO9YaQ++yiCa4T5oDEOgbUecQ/w1jmt8QvBSW+7+h2iXRH2+
 5ZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vJN13Og6DN9PUForrtTLS5vI8rP5ub7uU0ZHUkx6x1s=;
 b=oYqwR+QG3zbZrO13OA5MtLJ3e3HYiDR21Ijcg+ocuSrry2ETnW6mr6bKmpnFvsqoXq
 ZUCGqKQ3CaPgVO3xtfDZe4FRvcYsgGhS4wGr7o59D8X4qU1xmcbmTR8cY5TZ1lE6udma
 3zx+gaw5pPEBebD81YMj9pX0hp/118G2pbny/JYnUelAK/v4Y+Zk0zjVZR1JU0CAFKr9
 GH7rZPVrLDakhxM/eCniClNXhlpN45qHRhmyN3I36tJfud0PsaCiHiSaFxrNN0JzWsFX
 T7LqzJLWGyT0DALUcxvP0wxhc8SL8AeLrBKYaLEbSMZPjI92SEphZWqlx5bYnuK5rRSB
 OWww==
X-Gm-Message-State: APjAAAVxpbYhJPGax0XU0LEs4c6AdAKgxEKDbazcpBfbg2rbRDMTI2Fa
 Jch7ciWAhyNHuMlF7O/cbHBrrEmgPE8kPNmQmG87eQ==
X-Received: by 2002:aca:4814:: with SMTP id v20mr3798918oia.98.1566576505486; 
 Fri, 23 Aug 2019 09:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <04703275-47e1-90c0-1b64-d2373ab48970@here.com>
In-Reply-To: <04703275-47e1-90c0-1b64-d2373ab48970@here.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 17:08:14 +0100
Message-ID: <CAFEAcA-Zc3zz8p8YnxTskkUizuEXCTRA6ejO_0VbtvGXYwjZRw@mail.gmail.com>
To: "Bonnans, Laurent" <laurent.bonnans@here.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] Running u-boot on raspi2
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
Cc: "Xiang, Cheng" <ext-cheng.xiang@here.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5dle+a3tqkmK

On Fri, 23 Aug 2019 at 16:54, Bonnans, Laurent <laurent.bonnans@here.com> wrote:
>
> Hi,
>
> We (mostly Cheng Xiang's work) have been trying to use the raspi2
> machine to boot an image through u-boot.
> It seems, however, that there are some missing pieces:
>
> The first problem is that it trips very early if we keep the cpus count
> at 4 but will continue if we hard-patch it to be a single core.
> Symptom is that it seems all cores are running and trying to execute
> something, while u-boot probably has not intention of doing something
> with SMP.
> Our guess is that it's something related to the asm spin routine in
> raspi.c, which is maybe awoken too soon by some event in the mbox?

This is probably because your binary is not expecting to be
run the way that QEMU is running it. QEMU supports two
ways of starting guest code on Arm:
 (1) Linux kernels; these boot with whatever the expected
 boot protocol for the kernel on this board is. For raspi
 that will be "start the primary CPU, but put the secondaries in
 the pen waiting on the mbox". Effectively, QEMU emulates a
 very minimal bit of the firmware, just enough to boot Linux.
 (2) Not Linux kernels; these are booted as if they were the
 first thing to execute on the raw hardware, which is to say
 that all CPUs start executing at once, and it is the job of
 the guest code to provide whatever penning of secondary CPUs
 it wants to do. That is, your guest code has to do the work
 of the firmware here, because it effectively is the firmware.

We assume that you're a Linux kernel if you're a raw image,
or a suitable uImage. If you're an ELF image we assume you're
not a Linux kernel. (This is not exactly ideal but we're to
some extent lumbered with it for backwards-compatibility reasons.)

> Second problem is that u-boot relies on some SoC timer for the
> raspberrypi 2, "System Timer" in
> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf
> It has not been added to qemu, to our knowledge but it looks like it
> should be pretty easy to emulate.

Yeah, our emulation for this SoC's devices is still missing
pieces. Contributions of device models are welcome. (You
might want to check the list archives, etc -- I know there
are some bcm283x device models floating around which haven't
yet made it into mainline, which might be a workable base
for cleanup and contribution.)

thanks
-- PMM
