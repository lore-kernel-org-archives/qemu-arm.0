Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp801848lfk;
        Tue, 9 Nov 2021 02:56:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNc/ATmdSnxIBUe5bNFT14m6wzig63C6yDaXq0mwSjlkLS8tRmTrcsRvmHbRidrMze9+ub
X-Received: by 2002:a67:fa93:: with SMTP id f19mr114686855vsq.48.1636455383062;
        Tue, 09 Nov 2021 02:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636455383; cv=none;
        d=google.com; s=arc-20160816;
        b=KBYRm2WHuz8/Lkw2zsMMOyt8SDi2E3jgN/vp8Fuz0tnH+M3VTph26n0npCyj9nfRWf
         fa/79KhRBBvVVZY1xtY8pYIXPCEDbaNYm6R+ldi8p0o7tnaMA5v4aEhu4pRRF2P6czur
         nLieN0kBMWXbNH6vmiVPBpeXqmV219r9B5ZdoOY9S7PXqSTjfWUstuxUcIKAkBgAwyQ/
         +EG3+tNxKrYBJuSAA0UNgMSRBHb9FbGDn0aWyP/vrO6QJJGuY3BGFKxY4EfwqOCSiB2L
         W+51POoCX5B0MD/iTyMASZuSyneTyujVETBU7df49bMSOooN6biV2O9+HCcxncBr4gLB
         FIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PEvAXg6mNWbCNX/oINhvCyPDS4AFu8lL2cIfW1xA5+w=;
        b=NrF4FEKQNXty0k9aP7h9dfbhvkn2KnZ1Skg5gZMT8zG0B0ZGaSGmtvyJiw36gKekP8
         /WK6Dutq6uqfZQpWYoJLvOeC5bA6ZUqJNhS6UmU5F2EjZCN2Bag/AA5x+3Pe3wsE0Zf3
         A7eQ5euWc+daSZzUn/3wWBKxjq/TOGOiNKtPALYVyLkfFn64+bEygbdRW0iQyaXjiQPb
         eyeXYRlYr5lpBK0T40Yh/7nBP89tjamnPKAxtWGZ1Eqht730Yy5D0XWx1mlfHafNPjHz
         VjSPhu5lAVrmHy6z1lEwj1n2kYfBLiS0ECHfiSwC1bVE2cxt5CjTTkSk63pZ5EbC00rH
         6aXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C9a2GPE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z67si2623258vkd.3.2021.11.09.02.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Nov 2021 02:56:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C9a2GPE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mkOne-0005DQ-CV
	for alex.bennee@linaro.org; Tue, 09 Nov 2021 05:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkOnL-0005Cs-LI
 for qemu-arm@nongnu.org; Tue, 09 Nov 2021 05:56:05 -0500
Received: from [2a00:1450:4864:20::329] (port=42607
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkOnI-0008Th-Kp
 for qemu-arm@nongnu.org; Tue, 09 Nov 2021 05:56:03 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so1939014wmd.1
 for <qemu-arm@nongnu.org>; Tue, 09 Nov 2021 02:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEvAXg6mNWbCNX/oINhvCyPDS4AFu8lL2cIfW1xA5+w=;
 b=C9a2GPE8SwTFz9fzYuqJHyINsqDV0fp8S4rXJHo+wPPOFd776XzMXaaqaVAGK0a6aF
 wBladg980OdSIaZgESM+M8t6+J3KHDI8e/1K5u9/tGsJwSx0Tbm4ywZ8foKn6MBidUS/
 dx7ywJAjoJU/3C4le+O4fQOIgD2Zl+8eDRwsXRSPqSO57raS8DPOJ6r18FqlQTLOS9ld
 vk3HipGXcZtYnShVu5L8jf9LVR9rqnMVKgBkCxRTi8uwWiVlaHAFiI2r2lIcrutbyohh
 P+eZyMeR+i0qDPhOjjRfRZwSUKjI07FY6ydvCUYgjvrZ6hJu6QL/P8MnBz9gpe1kNODa
 P0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEvAXg6mNWbCNX/oINhvCyPDS4AFu8lL2cIfW1xA5+w=;
 b=nWPTTHTo0uEH+Gdz9qJGPTa+lOMxhWL2z/SN/mbNukr0Lalwz+qKFr7UJzouoe1kBP
 GjdIGWhDtr5aaUI8i7Dpo3S0I+HaLJeSRyTHfGz2SVtHo+IGmv34mtl44V3sXFg4xsEr
 yvyHIbwQJS6AgDW9ObpQxvFK2AOFLQydiLDc04+yMNu/H2PJcyRPrmY0SqLRhdKNHyrS
 eV104oueT0T3hcszUmSGq1jtstrx1lb3DXB8nzQC0ytXo80QLRl3sbNURadPMW2Cvh+t
 RZL3PJ1SfRNc6TTKSb9jOo71JwoNI5Uv5hAJKpMHSkfAFbdIWM1tHs4+8JzuHbUJwzD8
 Rypw==
X-Gm-Message-State: AOAM5308Vf4blEBqbem5Sw3VRbEaBJUK0FBG7Zvy5fJgYK7JM5ds0V8Z
 gryX13/B0bYn4n15SKVqGcK5hK3yTg9K2GoQq0HFzQ==
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr6135654wmq.21.1636455358844; 
 Tue, 09 Nov 2021 02:55:58 -0800 (PST)
MIME-Version: 1.0
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
 <CAFEAcA-DnbocsRHC3cUM_uX=kGn-KJa3q42TCyaB=isxKTS-Sg@mail.gmail.com>
 <ec74f093-9508-c0fc-3e06-2e8abf8655c6@tribudubois.net>
In-Reply-To: <ec74f093-9508-c0fc-3e06-2e8abf8655c6@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 10:55:47 +0000
Message-ID: <CAFEAcA8RU3=owBnCwJ7ePKW6Sm2GBU6er7o44iQd4Rs19TQs9Q@mail.gmail.com>
Subject: Re: Qemu and ARM secure state.
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KphwVgC8ZOgR

On Mon, 8 Nov 2021 at 22:09, Jean-Christophe DUBOIS <jcd@tribudubois.net> wrote:
> OK, so one problem seems to be that PSCI-via-SMC is enabled on i.MX6UL
> when there is no built in PSCI related function on this processor.
>
> According the Linux DTS, i.MX7 (solo and dual) processors have a
> somewhat PSCI related "entry-method"
> (https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/imx7s.dtsi).
> But it is not clear to me how this is used and this seems a bit strange
> as "entry-method" seems to be mostly used on arm64 and there is no other
> PSCI related information in the i.MX7 DTS files.

Yeah, PSCI was an interface introduced mostly with aarch64. In the
32-bit world bringing up multiple CPUs was complete anarchy -- the
way the kernel told the secure firmware that it should start up
a secondary core was entirely determined by the firmware, and
the kernel had to have board-specific code to do this. (For the
32-bit imx boards I think this is in arch/arm/mach-imx/src.c.)
For aarch64 we had a clean slate and took the opportunity to insist
that all boards did it the same way, ie using PSCI. (There are other
useful things PSCI allows, but standardising secondary boot is the
one that matters for this discussion.) So if a platform's firmware
implements PSCI, all the dts file has to do is say so, and then
there's no need for board-specific "start secondary CPUs" code.
PSCI does define an aarch32 interface, but there are a lot of
legacy older boards (and new flavours of boards in long-standing
design families) which still do things the old way in aarch32 land.

Typically the top-level "PSCI is available" node is added by the firmware.
(QEMU will do this too when it's emulating PSCI firmware) -- if the
board code enables the psci-conduit it will add an appropriate psci
node in the hw/arm/boot.c code.)

> As a matter of fact
> previous quad or dual i.MX6 were not supporting PSCI. Instead they were
> using a proprietary method through the internal SRC device (and i.MX7
> also has a similar internal SRC device). But let's assume Linux on i.mx7
> is actually using PSCI to handle processors.
>
> Thinking about it, I guess this might be u-boot that sets an EL3 monitor
> software that is able to handle PSCI requests for the Linux kernel. If
> this is the case, it make sense that Qemu emulates the PSCI services
> normally provided by u-boot to be able to boot linux directly (without
> booting a real u-boot prior to linux). All  is well and nice.

Yes, that's the way it works. The EL3 firmware is supposed to provide
PSCI.

For aarch64 the kernel is never entered in EL3 -- it will always run at EL2
or EL1. (This is unlike aarch32, where in some cases you might run the
kernel in secure-SVC, although even there starting the kernel in
NS-SVC or NS-Hyp is more common.)

> But then if I want to boot and test the u-boot binary (or any trusted OS
> for the matter) on a Qemu emulated i.MX7 (to later boot an hypervisor or
> an OS), it would be rather strange that any PSCI related service
> requested by the hypervisor/OS  would be handled by Qemu directly and
> not by the u-boot code (or any other EL3 code) running on the processor.

Exactly. This is why the board code is supposed to set things
up so that if we are starting the guest code in EL1 or EL2
then we enable the PSCI-via-SMC support, and if we're starting
the guest code in EL3 then we do not.

> How is it supposed to work? How can I tell Qemu (dynamically?) if I want
> it to provide (or not) the PSCI services (and more generally SMC/HVC
> services).

If you want PSCI via SMC or HVC, then set the psci-conduit
property on the CPUs to QEMU_PSCI_CONDUIT_SMC or QEMU_PSCI_CONDUIT_HVC.
If you do not want QEMU to provide PSCI, then leave psci-conduit
at its default (which is QEMU_PSCI_CONDUIT_DISABLED).

How can I tell it that I want to handle all SMC/EL3 services
> by myself even if the "psci-conduit" is already set to SMC in Qemu?

It's the imx7 code that's setting psci-conduit, so it should
not do that if it doesn't want that (and also should either
start or not start the secondary cpus powered off, depending
on what the hardware-to-firmware interface is supposed to be.)
This is a bit awkward, because the boards we initially wanted
PSCI for (notably virt) don't have an SoC object, so the code
creating CPUs is in the same source file as the code that knows
whether it's booting a kernel directly or not, and so it just
open-codes the decision logic. With the imx, the CPU creation
is in the source code for the SoC object which is abstracted
away from the board model code. So we'd need to sort out how
to plumb that information into the SoC object (or have the SoC
object's code that creates the CPUs call some function to find out).

-- PMM
