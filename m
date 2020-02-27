Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4369972lfg;
        Thu, 27 Feb 2020 04:13:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoh9C6/qGNV3z3w830FUv0g1ahRZpHWvmB58QToFSUGWQp5jDywv2KHJ7Lzg/zQB49z78K
X-Received: by 2002:aed:31e2:: with SMTP id 89mr4721130qth.35.1582805632382;
        Thu, 27 Feb 2020 04:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582805632; cv=none;
        d=google.com; s=arc-20160816;
        b=kOjZXNUM3YaYs/rUeWYThv42LTZRqInGTjAHasv4JRTc1pqa9Lh8bYoZLgqUYid7Wf
         ZxEMDAeq4tsiZiuP1y+cVHCUHo4bltowIRKSZL6dgdkDRyzb1jg3iFLxBTzIaTIUjsRO
         hyDY2cgCT1sYvsyBrmOJzTw59ODCxMu8khWv1I5B7k0eFhicYyqmj/fCMnnXqnWmMlRH
         MTDlqo1G5Hnu7VxWWPIx9ZU5WSIUDIus3+Ihz0kyWro+SKDXTiw17EfH4YLBvwdaGBKO
         slYMH0+W1B3/Oe9bHJoK/5Zr5XQZtil2N6l0TqbLdHpP2MM/DcDnlFM9D50u09r3WZ5s
         yfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LabFdtw+4yWQwHjyMs+KlbDhcQlBiBmnVkMXIHpPAYI=;
        b=CEAllZ/IPk+JNmfuvwRu8pRgDUsdGoYe9WHIv0aKhmqtGTXAPWXQ4dKQfdsr1Q1onI
         laQbp469dFEo7FpcaF5KFwQViRgENH//L95IUhe5SKtqhLToegQufEx9+C+m079E3eVN
         8QY74QzNSR4I5hs/FBjvAU0PiF3ao2bRTe7rBdffsZCZ6NvwPygybKYixk9jfmGpqJDd
         qJpm8FPVhYthdbDDSETKDvfNra0ZI3Fn7KMaHYfcM5kBWrz5pEOLdzqanVaQXdkcr9AS
         s5EaVrMF+SXyxnddZmfxLffUxV716iYthz7pOEwq96A5H7Jl+4Oun2wYnnmJFmKsgjwt
         D5Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i1U1EiHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si1237152qtj.357.2020.02.27.04.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 04:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i1U1EiHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7I35-0005oM-6p
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 07:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7I2y-0005o5-6N
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 07:13:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7I2x-0005aR-5c
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 07:13:44 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38262)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7I2x-0005Zb-0j
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 07:13:43 -0500
Received: by mail-oi1-x241.google.com with SMTP id 2so1903240oiz.5
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2020 04:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LabFdtw+4yWQwHjyMs+KlbDhcQlBiBmnVkMXIHpPAYI=;
 b=i1U1EiHVg3JosQKfVcQ6zT+v6aGYQCi4ePXTXGqowcYbah7tjaeK73eTWIJKsslRSW
 1prUo4herF8drM3tgOEswU7/rG4kJOFbGL8cDvzsX0YTIy4a1WdJOP9OTJnrX6LpYDrU
 SC8pTs9JYs//SMKd08L+GD5lrqbRiiT9GyrwESM9UhNA+za/PXAEGDtJcWd5TnilvUBC
 tQ8rO5aijpSvLhwau+CUAH1mMj3HxuEiYGgh3a5+h6Z05qQltTSAKe/FYiyzmzpv+Lii
 WBPhMTT7U+8k2F6ffKDEJdZV7u97+rmA7rY51rjx/zzdc4Z7BzyFBiUzqdDFBjPzbuVc
 U/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LabFdtw+4yWQwHjyMs+KlbDhcQlBiBmnVkMXIHpPAYI=;
 b=MB8meWGbYM/2Qav8bQ/JnsJ+YS5jDu7BJ3crUVGk/taa8teH4EjN7WDQ+IdKBnb8kN
 gNW5u5CmnbjDYH/QWIx6plQX1ISfs+wUYxiNwesMMswlXVTGbEsN592n9gBONkPSzCAh
 eHDyr/n18TYQ5+nVtyEX/5eBtcEu13XoYOH6wklKZjwq6p3Wgax7q/S2r4CcReJekCay
 DAGogQ8DDddG1zJ092LqGZWJgY8k58s0QPa+tJJP8eGUsx+hJs5z5UmCfVDtwcgpo3Hk
 jR9Tb/6TvcZgaPFzbzkU0bqzUJK4kLQe2h30LugHYCcPgcub/8Oi0Wkn/41Axc2vdLzx
 xm0g==
X-Gm-Message-State: APjAAAWMu6Vnoffoz/DWfk58gropa5hhbxDjhR1sbCLfuLWPR92OfszD
 AP1eHbQzXPrCmJEPIdvhUuSsosZXHD0xG2F7vjh/ag==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr3153650oiy.170.1582805622130; 
 Thu, 27 Feb 2020 04:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20200227112617.66044-1-root@stephanos.io>
 <20200227112617.66044-2-root@stephanos.io>
In-Reply-To: <20200227112617.66044-2-root@stephanos.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 12:13:31 +0000
Message-ID: <CAFEAcA9qbndHqoW1oaUAKMZY5hNYjP+mMt-K_WqoT9Z=Q=ct7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/armv7m: Downgrade CPU reset handler priority
To: Stephanos Ioannidis <root@stephanos.io>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FTXi06H7SK6m

On Thu, 27 Feb 2020 at 11:27, Stephanos Ioannidis <root@stephanos.io> wrote:
>
> The ARMv7-M CPU reset handler, which loads the initial SP and PC
> register values from the vector table, is currently executed before
> the ROM reset handler (rom_reset), and this causes the devices that
> alias low memory region (e.g. STM32F405 that aliases the flash memory
> located at 0x8000000 to 0x0) to load an invalid reset vector of 0 when
> the kernel image is linked to be loaded at the high memory address.
>
> For instance, it is norm for the STM32F405 firmware ELF image to have
> the text and rodata sections linked at 0x8000000, as this facilitates
> proper image loading by the firmware burning utility, and the processor
> can execute in place from the high flash memory address region as well.
>
> In order to resolve this issue, this commit downgrades the ARMCPU reset
> handler invocation priority level to -1 such that it is always executed
> after the ROM reset handler, which has a priority level of 0.


I think we should be able to do this with the new 3-phase
reset API : the rom loader reset should happen in phase 2,
and the Arm CPU should only load the new PC and SP in
phase 3. It's on my todo list to write some code for this
to see if this theory works out.

I'd prefer it if we do it that way, or alternatively find
out for certain that that approach does not work, before
we add a reset-priority concept to the reset APIs.

(In particular, this use of qemu_register_reset to arrange for
the CPU to be reset should ideally go away in favour of having
the CPU reset handled by the SoC which owns the CPU, so it's
not a good long-term way to look at trying to fix ordering issues.)

thanks
-- PMM
