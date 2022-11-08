Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3838273ejx;
        Tue, 8 Nov 2022 04:05:09 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4iyVMBHMrCemu/rwk8KW53e5rYpehUlYJaL4Ho5l4TgUtzF3qNMTUK2BfmW5WxeNuPtVKL
X-Received: by 2002:adf:dd4d:0:b0:236:6e72:be17 with SMTP id u13-20020adfdd4d000000b002366e72be17mr33446172wrm.460.1667909108175;
        Tue, 08 Nov 2022 04:05:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667909108; cv=none;
        d=google.com; s=arc-20160816;
        b=vYZ67K2uZAIXFrnjKHWRDp+cUssIHw0I7WLCfo9eDB4+p+J8vUO4v91J5cJMKJxCAP
         w98D0SZwgdvF/33lTEww+ov7wZlFtpbVUF2iiicPvBZZmQ5U8hLo4fXaDVrI8bzzBECb
         I4QD48/y2I28zuDy9wXNvIB/yc6RxNG/BwlawDB75ULmJq9+x/kJMLRB4MXWcrn8PmEO
         DLeZgkXM73rhBUcOcQymYCG7Ako/iMELW8+HfLgiGmKbQDBx6qyhWaajarh6Auazj4Ur
         QesjDMUjphF9Gz+CuIo4darMEYVmeI0ANP3ypOjfUL1/31jXZz/eMXMygdQ2cJUEhpvM
         wYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8EXzkHbtDW2F7LvsdDEJoXpjpbhaMw6b/pV5RERF+zc=;
        b=e4K6jGslupZeyTbTq7WBLe+PubNJnm+n56OoplwjMnay2OArpwYE3N4zZxY5PeskR+
         8rnl7hWVSVLXrNXxa3Nnj9mAS0ascEpM56jI3hxhZQJuWL1drhVBAGo6bAGhzPpa7+0I
         +Tg8aaUsMteavmbehdchAhZoZrax9yJCisutFkAx+D5pz+CgUkwqxUy5OXa74zZLI7B6
         uCsC0fwtpK//F4/G+6H6IneIh+RsnbB6jszRHIyAGqmFI733RD0GAul713R6kHSHqhM5
         52r/WkQMmUXgWL63l9cHJWW8d/idj8amIyBckXnhvql2XzTbkOvlVcwDNMPoXC0Mjp+/
         LK4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DUmk0YAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v37-20020a05600c4da500b003a3478f6d2esi7241772wmp.153.2022.11.08.04.05.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Nov 2022 04:05:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DUmk0YAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osNLb-0001Ep-3r; Tue, 08 Nov 2022 07:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osNLF-000156-2x
 for qemu-arm@nongnu.org; Tue, 08 Nov 2022 07:04:33 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osNLC-0001ZK-7P
 for qemu-arm@nongnu.org; Tue, 08 Nov 2022 07:04:32 -0500
Received: by mail-pf1-x42e.google.com with SMTP id y13so13616133pfp.7
 for <qemu-arm@nongnu.org>; Tue, 08 Nov 2022 04:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8EXzkHbtDW2F7LvsdDEJoXpjpbhaMw6b/pV5RERF+zc=;
 b=DUmk0YAtpIh/f7RjioQ4MBYiauMBDbiVRVFM4frArVQIZThd696unuXeRbvZ5rLMs6
 IfyUJD3aXywLgj94bIoKZJM3bFpALdyNrTmRrg+yGrA862Jt6SmQiM35JE8z4ac3Xng5
 tF8oK8rP2jf6W7rudMDnH6DDW8XOTPBYt7k+dwddAig2FFXRFPkYeSY59hIlY39kBdxv
 JQI9lkQDbT0k33tXM2FhXVtONjLVnS5bP/ms4a4R0k9bhp2krGUcjLQwzHfxF42bZyim
 BzE9ReJgz3MvesQX58hFOzI7TLwH8cKWY4peCjcVEC778LfsKQXR4M9/G8QxLToCbpW3
 OtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8EXzkHbtDW2F7LvsdDEJoXpjpbhaMw6b/pV5RERF+zc=;
 b=3rhPX0d4qz4eiiOULvMTWrlsmkRRmoKDlk1ZU8e37lN4yVS41tIfMyfoXw1w1TAVPO
 DDolkL/HvNt8x4HUC5DMQNLu5eBO/ozF7ufOEXPJ47SPNt2UcIJiIR4Wk6S7dtTApP0j
 umvNmodiVOB1I7ntOmoz5VBABhqqmRClRNHA8pB213aYcD7D8BcQDgrE+f144Fl4yG68
 qvwEHk463Rb8xkQHvBlwxEcNAEUS2a87WYLdjYsXCKeuuXARoioqNz5nWorMFjAPm52r
 ePFB5USfDCOt87aT+WKRh23GSZvi33ZCgGXKs00l0f0ijeXcx/7jf5kQp43nt5ff5Alb
 aLuA==
X-Gm-Message-State: ACrzQf1BrCTMl6sYgGyZVzMXBMAWpOSfliy2E0DXUdkl2PzI17B+uQK+
 0uC26VBqdS0BukbU7o6Hh1KNJEXUNdT2xzIo6WVZvA==
X-Received: by 2002:a05:6a00:1595:b0:56d:e04d:e0ab with SMTP id
 u21-20020a056a00159500b0056de04de0abmr37347378pfk.51.1667909065082; Tue, 08
 Nov 2022 04:04:25 -0800 (PST)
MIME-Version: 1.0
References: <CAGPg-2T=cGvXBpB=SxHv2NTru2ghk-TgYCwaZvt5qHfJt-OwJg@mail.gmail.com>
In-Reply-To: <CAGPg-2T=cGvXBpB=SxHv2NTru2ghk-TgYCwaZvt5qHfJt-OwJg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Nov 2022 12:04:13 +0000
Message-ID: <CAFEAcA-7NUoc3CgQLu_Vvnx0CcWWbCe2AtJYNhp3x78i+LYqVw@mail.gmail.com>
Subject: Re: Raspberry PI emulation - "state of the art"
To: Filipe Pinto <fpinto@filipe-pinto.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6yMBWmUuFCfF

On Mon, 7 Nov 2022 at 14:08, Filipe Pinto <fpinto@filipe-pinto.com> wrote:
> Since I'm new to the emulation of ARM processors, the following questions popped into my mind:
>
> why is emulation of an accurate representation of a RPI physical
> SoC is so complex?

The answer to this is "because a modern physical SoC is complex".
The rpi SoC contains many devices, many of which are seriously
complicated pieces of hardware in their own right (for instance
the USB controller, or the graphics related hardware). To run
guest code which interacts with that hardware, QEMU needs to have
a model of the hardware. And every vendor's SoC is different:
even if, say, the Broadcom SoC in the rpi and a Samsung SoC
both have a serial port controller (UART), the two UARTs are
typically different hardware with different registers, etc.

The CPU itself is certainly pretty complicated to emulate, but
because all Arm-based SoCs are the same architecture we can have
one CPU emulation that works in all of them (with some feature
flags to define exactly how it behaves). The problem with the
devices is that because they're all different, the work we might
do on one SoC doesn't carry across to help with a different SoC.

> what is the most recent known successful RPI emulation? Is it RPI 3?
> using open source would be ideal (e.g.,QEMU), but would you recommend
> against it since my ultimate objective is to enter the Hyperledger
> identity stack?

I couldn't find anything in a quick search that said what
this piece of software is, but assuming it is "some guest software
that wants to run on an Arm Linux system", I would suggest
using QEMU's "virt" board to boot Linux and then run the software
on that, rather than trying to use the raspberry pi model.
The 'virt' board is much better suited for "just run a kernel",
and has more useful peripherals. QEMU's rpi board models are not
actively being developed, and they have various missing peripherals
and awkward qualities (like not having networking unless you can
make network-over-usb work). You'll spend more time messing around
trying to deal with the emulation than actually getting on with
what you want to be investigating.

PS: be aware that performance characteristics of an emulator
are wildly different from those of real hardware. Don't expect
to be able to get any useful info about performance of the
software by running an emulator. For that you need real h/w.

> is there any article that you  know of that explains in detail
> the differences between "physical SoC" versus "processor" emulations?

You don't need an article for that. The "processor", ie the CPU,
is the thing that executes instructions. The "SoC" is "the CPU
plus a whole lot of other stuff" -- from the point of guest
software, the "other stuff" is basically "lots and lots of devices".
If you run guest code that wants to touch the devices, you need
to emulate those devices. If the guest code you're interested in
is abstracted from the real hardware (eg because it runs in Linux
userspace) then you don't have to emulate that exact SoC and all
its devices, because you can emulate something else that the
kernel (the abstraction layer) will run on.

thanks
-- PMM
