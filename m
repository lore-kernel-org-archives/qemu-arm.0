Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1169181lfg;
        Sun, 22 Aug 2021 09:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRgApKl5LeYLIp2b0tTETawierucB2qYkrYQru3vvhNJG/DNBzNuoUrhjaimRT7SONgGv1
X-Received: by 2002:a6b:28b:: with SMTP id 133mr23354059ioc.107.1629648543714;
        Sun, 22 Aug 2021 09:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629648543; cv=none;
        d=google.com; s=arc-20160816;
        b=YDwKoq9W4USord45p91PqALF0beGYqrtyHybh7U/uBcHrvQuRfO8ya6abkmS+9Sw+3
         kQm4zNmAb0DUCl2Oswlj19GEyikw6muSYHx4dE4APbxuLD6XgaeJ7ofMXN7Wk4vba3ix
         W69Aoh6K+4V8jiyEaZR5W3Hpvn5Wdar+75LcwBeu/Z1FXET1NjIuO57xSrkJAFmjDzLE
         t9w78lgmXcUyRwIo1Q9XB4SthRSQ5sPonPtyfJo1oUt6QSOBF4PQP6ZMormK8dCAki5p
         lbcGNAc1q9Egx21RvuX547PoYHBt/FGQK41A7CU5NXJQ5SEwDkw2rsq00oPWkaQ39fbn
         4qAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EQ3UnmjaEwnBJi0SF7sp2sDlo5x4+uu/4H3+9r5hYzI=;
        b=UrCO0t1EBu+UzDJQfI3tNSjuRON+8kbm2UyiVj+xG1ItYJhcC3aJcTl9XnM84PVsB2
         MeOiegFFEWe2ojOfH+Vt5h7THlwQQvYKU8lMTBCWq7S/VbYD0ESBBSp+Pi81BLsbW0zm
         ab5BuFMfv3hDxbHcyZzjEsWgui1Fvmok2aH2vyNYJnOU6B+MbFszt/6jCBDOjCmgKlUB
         e0LWNdf56Rjr57ylamu+wfL2304mWjOso8EOmwBP2d50UTKtMD2q2851vpsUbrAaR9fT
         sEs32loDk+EL2G/LClm6TiJ3FuJEsq53E4n+QYrdcgoAuaHeG4apOCt3zmPH+KPt92PM
         /cvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lm8of4Zf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si7758114ioz.59.2021.08.22.09.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Aug 2021 09:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lm8of4Zf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHq1v-0002Uj-1f
	for alex.bennee@linaro.org; Sun, 22 Aug 2021 12:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHq1l-0002UN-OU; Sun, 22 Aug 2021 12:08:53 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:34362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHq1k-0007bT-7z; Sun, 22 Aug 2021 12:08:53 -0400
Received: by mail-yb1-xb32.google.com with SMTP id a93so29231239ybi.1;
 Sun, 22 Aug 2021 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EQ3UnmjaEwnBJi0SF7sp2sDlo5x4+uu/4H3+9r5hYzI=;
 b=Lm8of4ZfEatfNW6HVW9aJjFrR3uBnXp9Xa4lyrmVW29VSqnpRNbdDiukeYUvcSIn96
 xjeeYYJzXtLuPbc8DPWjE0MIsdvXln1PPCcHWE7ErA6APUWoIj+gRUTz9ln5jsd4MImb
 VkFW7DsHkYwvBvJksiitcXGv0sYVTzicYzeeCKNxsE9rIcvNYntAyFZ+DD9J5eZgdPpF
 yBtwUJdbj62gyzs7FPQLDmOqOIxGU4K0QB6lXNc+qqWzNseR+1AAe1zcEY+n1qZpryCg
 OH8mY3PKcXYeIs+krDmp0fanK5lb1cM7CcY5XNeOzIv9Dow2G9rVtuRnl0q2W6c5hFj8
 3BOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EQ3UnmjaEwnBJi0SF7sp2sDlo5x4+uu/4H3+9r5hYzI=;
 b=Kq/JweI8crO1ZA/nVymR+qU92KWy9iCXgzYxA4ZnGoksD3xOBvY2uyKixN2JM2BGAm
 DXjfPQZSNo5nEGkLrnzcjcfEGshc7FYFWlR7hGN3M2Jfl+g5eYcWHDAu7gDjrYgNDVnY
 RJiDjBxdqlo4mWIzOfy37Nw5j2XsSVofYEBG6S53kBVp6h3THR/T+wzdRdRSjPd+iTQq
 hEwAumuet+Z/fsSN72Bi97n2zHmMfziQZFZP+zA3KVb6sTcAdrK0tK8Fk15I+W4T/F81
 hDS6vi1iSIFiGAZqO66JbXu1KRugnOLQEj0KMHiwtqPfJnucjBybfX4mbISsgRgoIH2c
 QMkg==
X-Gm-Message-State: AOAM532p5aDsdUdXGzU0R8NXwUQqF9hIfsV7+CVnk4gGSkfONxdKKatj
 W/S8mxzkU5JvhHsfT8i+mm392dweoPWtq0RHCgw=
X-Received: by 2002:a5b:391:: with SMTP id k17mr39470676ybp.152.1629648530341; 
 Sun, 22 Aug 2021 09:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210821154505.18033-1-bmeng.cn@gmail.com>
 <CAFEAcA_xQP0YqgfbJOKtt-kCeJDyQaLjqyjgRcMxfUZuS0g4Gg@mail.gmail.com>
In-Reply-To: <CAFEAcA_xQP0YqgfbJOKtt-kCeJDyQaLjqyjgRcMxfUZuS0g4Gg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 23 Aug 2021 00:08:39 +0800
Message-ID: <CAEUhbmWGjcTJn51qkaMYX_4Lpq=1ocPHsc-ApBzt_FEKx7VsKQ@mail.gmail.com>
Subject: Re: [For 6.1 PATCH] hw/arm: xilinx_zynq: Disconnect the UART clocks
 temporarily
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cdhDLNNTNmzB

On Sun, Aug 22, 2021 at 2:14 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 21 Aug 2021 at 16:45, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
> > does not receive anything. Initial debugging shows that the UART clock
> > frequency is 0 somehow which prevents the UART from receiving anything.
> > Note the U-Boot can still output data to the UART tx fifo, which should
> > not happen, as the design seems to prevent the data transmission when
> > clock is not enabled but somehow it only applies to the Rx side.
> >
> > For anyone who is interested to give a try, here is the U-Boot defconfig:
> > $ make xilinx_zynq_virt_defconfig
> >
> > and QEMU commands to test U-Boot:
> > $ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
> >     -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
> >
> > Note U-Boot used to boot properly in QEMU 4.2.0 which is the QEMU
> > version used in current U-Boot's CI testing. The UART clock changes
> > were introduced by the following 3 commits:
> >
> > 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
> > b636db306e06 ("hw/char/cadence_uart: add clock support")
> > 5b49a34c6800 ("hw/arm/xilinx_zynq: connect uart clocks to slcr")
> >
> > Looks like we don't have enough time to figure out a proper fix before
> > 6.1.0 release date, let's disconnect the UART clocks temporarily.
>
> This is too late for 6.1 regardless, I'm afraid.

That's too bad :(

I figured out a proper fix, and will send it out soon.

Regards,
Bin
