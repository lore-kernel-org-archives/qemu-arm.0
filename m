Received: by 10.25.44.15 with SMTP id s15csp4755512lfs;
        Tue, 11 Jul 2017 05:19:50 -0700 (PDT)
X-Received: by 10.200.57.91 with SMTP id t27mr10231074qtb.171.1499775590450;
        Tue, 11 Jul 2017 05:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499775590; cv=none;
        d=google.com; s=arc-20160816;
        b=tebkxir4VCEYpJy/zb5aevz329ESA6Tzn0hoM/IRGWde0J3+F5WhmN/6Hv/FPvLkK7
         BjA8ZJiW4Nhz2lL80A1YwK9Om0m3PO+HI5DdbOUyPzynuONj7HQzqTQ9LqA/0EBbJx9E
         qUZHi+QhUPGuOcyoTv5ugT8aDcBmV5g/tvZ1MUwdMVj9GIa2WUAqlEBr5Eipx5U8PV4i
         olWvZ6yNLvVkC8aDzeSDfMjDl0s7PdUWTrKsJ9433dsgqjt247fk3ZFH3n4+QDgGwiOr
         iz6QUfJCtgmi6sDvZMipnYc7+/ILIwOa+FygyBCoW6usUMi5B+LM7BPSe6zJGi/sJFQt
         L++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fM6xB3/fPHfEfDP0sK8uMIqiay3myqXEOsOurxWYo/U=;
        b=L4D3veT3Q63Pj0zVkxcge7xE8VkM4eOmZLF/tbdJKelTtsIh5ocq0/PyHgf5Lu2hiJ
         Ub5PRaypKV5xVG5tpggrulRmd8paONtylxZwpQTRVUDRDQNhVfsAXe4eot0psszu99pa
         4wiWpoL+tUWnwmULXWyWUbI5Q3Y2m4f8GBrfiZ5Vqhrg+Zq95x5XDuBsnlCJ5luW6XHG
         A0LrdbuUro+248LeXXHH+kGzAUBy7oKOaZZ7VMimcuRaHpb/m3MspnOy4pwDLIIRcBVU
         hr3hEIX/hd1goEv6KEmNeNHkFJ100rfv6OotDd/Zz6usYwrHXZRigBq3WgY3HZNMEEXr
         QHnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=JWNNoT5X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m21si1205554qkm.345.2017.07.11.05.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 05:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=JWNNoT5X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUu8p-0003Mg-Jm
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 08:19:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUu2G-0006K2-47
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 08:13:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUu2F-0007eA-01
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 08:13:00 -0400
Received: from mail-it0-f41.google.com ([209.85.214.41]:36880)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUu2A-0007YL-9l; Tue, 11 Jul 2017 08:12:54 -0400
Received: by mail-it0-f41.google.com with SMTP id m84so17733973ita.0;
	Tue, 11 Jul 2017 05:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=fM6xB3/fPHfEfDP0sK8uMIqiay3myqXEOsOurxWYo/U=;
	b=JWNNoT5X9/SLXMAGRK4OaZ9OU33Wo0wnUbMuUE/zHeBNyaMXcjk7oI4EqzI5imXQlf
	455aPF5eOLQfW9p+QOr518FnRGXjG7Td9vQtBZpf6mQ1Ihn2UHPylFXZJFLlO/jTpATb
	YzWEDMggxG94gseyRkv/MmhceUcbgt+sda6gbVW/0gVb6900KPRDwP/syCeKsw2yioVg
	HHTjhTAMarAvn5myLysHNyW3ECNLRvc9VG46zZSE/ABVumjcJV73QkfryP/D432rGSPX
	wJdkT8qV5L3uSiVj4HInVCliCNxK5r9KAL88kYk/WIrlrAbq25EW4czxAUYdHKzyKzUa
	7mEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=fM6xB3/fPHfEfDP0sK8uMIqiay3myqXEOsOurxWYo/U=;
	b=tyS2o1uHfnZIbH6yhOcBv7J6ThlN0jECxo1STPM1l6j+YhrScklBjRbe57e9jUjGJ4
	e5DIjP1qxUEgJQQY2+H7CpSxV3tOoRYhnCScj+wELUuMbC8K1GsePrMK/5hkX/Z6N4if
	mFdUkh/1MWuGVi5J2e5yAE0r5cReQ1qeY3YxGYQGhALREoukXeekVp6VhkPspNL51NwF
	PmUNEGErml6SM/6Yf+kZYhgyUVNflMv7Rggv0wLHhEe8qEzu1CyL+3XfNr/jZaEFHke8
	aO4iJSkcJxgjxa9sJ6CvcOBAlPzMBaX5RfzFBmAXCgR2fxgJFQUeV7lFTOERslegVl4x
	gbZw==
X-Gm-Message-State: AIVw113PahPVumDSAJpHzANGKQw+MGp4QG0oP4+smR/CwXLV+shVkUd0
	RIjgZ2jXLst9hbKnxIiKRMNlEp1K6A==
X-Received: by 10.36.217.197 with SMTP id p188mr3093899itg.110.1499775110791; 
	Tue, 11 Jul 2017 05:11:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.56.193 with HTTP; Tue, 11 Jul 2017 05:11:50 -0700 (PDT)
In-Reply-To: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe@mathieu-daude.net>
Date: Tue, 11 Jul 2017 09:11:50 -0300
X-Google-Sender-Auth: 4QHDaSU_ZXCrhd7KSjZTZ4Dg2bM
Message-ID: <CAAdtpL5_Qfy9h_Osa=tyMDMu4LhOn2mkXA-jYpmpgYwbDJq0yg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.41
Subject: Re: [Qemu-devel] [PATCH 0/7] ARM: implement MPS2 board (with 2 FPGA
 flavours)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NtSqKrT37GjD

Hi Peter,

It seems you forgot to add some files to MAINTAINERS.

That said, is there some old school perl guy motivated to add a such
chek in checkpatch?


On Tue, Jul 11, 2017 at 8:17 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchseries adds support for the ARM MPS2/MPS2+ dev board:
>
> The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
> FPGA but is otherwise the same as the 2). Since the CPU itself
> and most of the devices are in the FPGA, the details of the board
> as seen by the guest depend significantly on the FPGA image.
>
> We model the following FPGA images:
>  "mps2_an385" -- Cortex-M3 as documented in ARM Application Note AN385
>  "mps2_an511" -- Cortex-M3 'DesignStart' as documented in AN511
>
> They are fairly similar but differ in the details for some
> peripherals.
> Further info and links to all the documentation for the
> board and the various FPGA images can be found here:
>  https://developer.arm.com/products/system-design/development-boards/cortex-m-prototyping-system
>
> This patchset adds the boards themselves, and the UART, timer
> and system-controller devices they need. There are a number
> of other devices on the board which are not yet modelled
> (notably more GPIOs, a watchdog, another different kind of timer,
> and a display device), but this minimal set is sufficient to
> boot the "hello world" binary of the Zephyr RTOS and the
> "blinky" binary of the mbed RTOS.
> [To run the zephyr binary you also need this fix:
>   http://patchwork.ozlabs.org/patch/782811/
>  which is in the target-arm pullreq I just sent so should
>  get into master in a few days.]
>
> We can add more devices to the model later, but I figured
> this was a sufficient place to start.
>
> The underlying motivation here is that the v8M work that I
> have planned will need a board, and there is a v8M FPGA
> image for the MPS2 that we can use. It's also perhaps a more
> useful M profile board for general purposes than the stellaris
> boards (64K RAM) or the Netduino2 (128K RAM), since it has
> 16MB of RAM.
>
> thanks
> -- PMM
>
> Peter Maydell (7):
>   hw/arm/mps2: Implement skeleton mps2-an385 and mps2-an511 board models
>   hw/char/cmsdk-apb-uart.c: Implement CMSDK APB UART
>   hw/arm/mps2: Add UARTs
>   hw/char/cmsdk-apb-timer: Implement CMSDK APB timer device
>   hw/arm/mps2: Add timers
>   hw/misc/mps2_scc: Implement MPS2 Serial Communication Controller
>   hw/arm/mps2: Add SCC
>
>  hw/arm/Makefile.objs               |   1 +
>  hw/char/Makefile.objs              |   1 +
>  hw/misc/Makefile.objs              |   1 +
>  hw/timer/Makefile.objs             |   1 +
>  include/hw/char/cmsdk-apb-uart.h   |  78 ++++++++
>  include/hw/misc/mps2-scc.h         |  43 ++++
>  include/hw/timer/cmsdk-apb-timer.h |  59 ++++++
>  hw/arm/mps2.c                      | 378 +++++++++++++++++++++++++++++++++++
>  hw/char/cmsdk-apb-uart.c           | 390 +++++++++++++++++++++++++++++++++++++
>  hw/misc/mps2-scc.c                 | 310 +++++++++++++++++++++++++++++
>  hw/timer/cmsdk-apb-timer.c         | 253 ++++++++++++++++++++++++
>  default-configs/arm-softmmu.mak    |   6 +
>  hw/char/trace-events               |   9 +
>  hw/misc/trace-events               |   8 +
>  hw/timer/trace-events              |   5 +
>  15 files changed, 1543 insertions(+)
>  create mode 100644 include/hw/char/cmsdk-apb-uart.h
>  create mode 100644 include/hw/misc/mps2-scc.h
>  create mode 100644 include/hw/timer/cmsdk-apb-timer.h
>  create mode 100644 hw/arm/mps2.c
>  create mode 100644 hw/char/cmsdk-apb-uart.c
>  create mode 100644 hw/misc/mps2-scc.c
>  create mode 100644 hw/timer/cmsdk-apb-timer.c
>
> --
> 2.7.4
>
>
