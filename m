Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2713835wru;
        Mon, 1 Jul 2019 07:29:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyv4cODDfKstfM0IEfm14X5Lm7SRzuTAkgCg0urVW3dtCEqcvIu/SK9u8avxkAzwj46PjfQ
X-Received: by 2002:a50:a511:: with SMTP id y17mr29203759edb.259.1561991340227;
        Mon, 01 Jul 2019 07:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561991340; cv=none;
        d=google.com; s=arc-20160816;
        b=NrxRw5NMrc+d7J1yu6M9fZbK9mQ2HVH+99Txb+3EMq4WiDHhqCh0Ln6B11kHSqPSEx
         nziay4PSWvAUgKiJXftlFdeKfS9eBllaaRWty46DOSorwOmWRjaKVEp9qT3spdhuiC/+
         P/2Yw+gxieQYEJunTaBvegVRqtR821+PWjWC7pJ3W+9VSgK/iDkmcQiZM5sLWgmxDzNU
         EERhX7gRZlilXGiqEHne5YVqLwW3HnqV9uhSyw+FVSbJf8e4sMFgTXcogpXF6qlo88TJ
         jGcG76D6Tk5Rj+yX9b+cze+Nz85V5bRgzi7L15A7KmqCVH0i2X0kTv0fbJeBfQdwiuaP
         BSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EY4Adx0OcbtAOPWeOiQ6foI2RYDNLt0gmr6T8P4rYnc=;
        b=eH6FzVomPPQzrX8GwDEWdZ16j2kC3wE0qmESGGAjqyvHZ49ghLZ7DK86YzhPJaLXSv
         xBz8C1iJcfNgARdNFz8jp9cMznghX3PuTUxDJSlUd1/UC/kyONYDb5nml3ltuU9gLEta
         4bmDhr7Jep/Gnr5EfiNRmnx1Q7RXC445C7LJbgSh6tsPFkPzuTts8b1DnTmgKeTVPQwr
         igrYJHcBDMkNoPWIV4AIRoiOZlG3GiEkLn1QJ4b5E4IOfAOxl5v42vHMvJH3rXbqenFK
         uixSzPtKejNvOmiGFTiJoC75F/mvDC6tbIRn5ChAI3OP4gKu9FcvaTlzxpOqzpuDsTCL
         +Z3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S19RzFaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p44si9515203edc.438.2019.07.01.07.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 07:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S19RzFaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhxIf-00071y-IQ
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 10:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhx6L-0002nC-1E
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhx6J-0005cr-HP
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:16:12 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44590)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhx6J-0005bp-5j
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:16:11 -0400
Received: by mail-ot1-x343.google.com with SMTP id b7so13593289otl.11
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EY4Adx0OcbtAOPWeOiQ6foI2RYDNLt0gmr6T8P4rYnc=;
 b=S19RzFaHFMPAsC8JggOBvrQ0XCcqqUvZaHS/xgr5bTJgOF1D32KN6NODKaUA6S4rpa
 5dbFGqRGu6eQVDS3Ju98o7q2T0uyMo6q+xDBGEgR+y6w9MNmDND4Ge4fvP2/JkT9ysku
 voC0Hn/Sr/iR8MPDEn2J08NV5BkYZncBBgb1BlMOZ4RizZ/6eok/jFuppEUgr8jq9BqH
 nnGZ+fOIX0A32Yuq2DI7Ln9jLSCJF8y0mMDsXMR8pg7K9eAsU/gTSFGX1FQFNjTAHQ7W
 fMWXx/0EXMsOSe24u7ngsX1fIJutPF7YKjbpK4VD4sVpjggNdVNDRB1pJoXfuqTwW2FA
 r9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EY4Adx0OcbtAOPWeOiQ6foI2RYDNLt0gmr6T8P4rYnc=;
 b=j5CgOS1pM9o47bD24/sJ1RwH87CEPoEH2h8LHgDD8PUNckoI6T3nDF3f9srWYCuUYx
 PPhwnFO8foepuiThWv+vG4Ri9GKvkuDMERYjfEJ5vDGcPUuUwT0Ws+X+bWdJ6IxdinqC
 9OXGvvCfjyfw/lProNBOf7/dsYE6nwimwNdUUSmKmRJ6kCYekQIXcwlh/a0mpaDSsfs0
 1K3IiXxUQwUWg4JdTDT+Og81ufpvitTbjKR8hB2KVhNiF5cKbMde0ags2j7UcZLGkGar
 mDN86uFl650ChHrvaMJXdBKri95KtVHebHE5LFTj4MxMYM73T1pvCEowgLYQhEHEHd6P
 2jyQ==
X-Gm-Message-State: APjAAAXsPq2gM1fhWWKWamhhGDy3wsw7WdAxdxo0wlO+A2RwNqqlUPX5
 tantxg4hxC7aAovyu4kvx2AZX8IDXzMiZHZ4L9PwQg==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr20494605oti.91.1561990570216; 
 Mon, 01 Jul 2019 07:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 15:15:59 +0100
Message-ID: <CAFEAcA8cut67vuwsc++H2TWa8Aq0g1ss8Gda3QnoyyP_-6WgwQ@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v9 0/2] Add Arm SBSA Reference Machine
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
X-TUID: hxV3DBivBqYJ

On Sun, 30 Jun 2019 at 11:21, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware,  to support
> firmware and OS development for pysical Aarch64 machines.
>
> This machine comes with:
>  - Re-designed memory map.
>  - CPU cortex-a57.
>  - EL2 and EL3 enabled.
>  - GIC version 3.
>  - System bus AHCI controller.
>  - System bus XHCI controller.
>  - CDROM and hard disc on AHCI bus.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Only minimal device tree nodes.
> And without:
>  - virtio deivces.
>  - fw_cfg device.
>  - ACPI tables.
>
> Arm Trusted Firmware and UEFI porting to this are done accordingly, and
> it should supply ACPI tables to load OS, the minimal device tree nodes
> supplied from this platform are only to pass the dynamic info reflecting
> command line input to firmware, not for loading OS.

Hi; this fails "make check" for me. Running the relevant bit of the
test suite standalone:

e104462:bionic:arm-clang$
QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm QTEST_QEMU_IMG=qemu-img
tests/qom-test
/arm/qom/integratorcp: OK
/arm/qom/nuri: OK
/arm/qom/mps2-an511: OK
/arm/qom/verdex: OK
/arm/qom/mps2-an505: OK
/arm/qom/ast2500-evb: OK
/arm/qom/smdkc210: OK
/arm/qom/collie: OK
/arm/qom/imx25-pdk: OK
/arm/qom/none: OK
/arm/qom/spitz: OK
/arm/qom/musca-b1: OK
/arm/qom/realview-pbx-a9: OK
/arm/qom/realview-eb: OK
/arm/qom/realview-pb-a8: OK
/arm/qom/versatilepb: OK
/arm/qom/emcraft-sf2: OK
/arm/qom/musicpal: OK
/arm/qom/sbsa-ref: **
ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:628:object_new_with_type:
assertion failed: (type != NULL)
Broken pipe
/home/petmay01/linaro/qemu-from-laptop/qemu/tests/libqtest.c:145:
kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
Aborted (core dumped)

It looks like the new board model is being added to the
32-bit qemu-system-arm as well as to qemu-system-aarch64.
This seems wrong, since the board will only work with a
64-bit CPU.

thanks
-- PMM
