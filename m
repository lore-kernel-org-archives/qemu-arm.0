Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1454926lfp;
        Mon, 18 Jul 2022 11:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sL+f2YjIAUF1XBa+XZSl2q5fG4IXJS2vaJ25wVJ8HfbqHX02ePUkBE9k0lxgiA2PIqcQud
X-Received: by 2002:a05:620a:4452:b0:6b2:4f49:d053 with SMTP id w18-20020a05620a445200b006b24f49d053mr17232308qkp.685.1658168956677;
        Mon, 18 Jul 2022 11:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658168956; cv=none;
        d=google.com; s=arc-20160816;
        b=F9+29uIh+Ag0X7u+vPAz9OHLcHOcVj5ZLQgLTIRsj5ZKxEzFUXw4oLGUm6JE0CxqJh
         IPJ/eGuiCCsbT5yBGFFH7ItJDs+hbiNf9Ck5nfJOS0JSDnL/W99GzrA+DZQhH2/nmRIN
         cSfJyOvrBxoapfbuR69JDcw7sZPz/u/b7cTrT8MkwCD/zn7UnVS5NnmWQEwBV/TD8Sij
         yofEDQlfWfIF9MbYqFq8D/6Am2zUOxLSbKq6hELS4peQ1YLDFVDC8JKyHkjidjBdK1k4
         llCFGE4YMYTDK6qle+N+srzRakQYQDmZes9qbu2haWIz0QVUvIYq0LXlnVqLRBK5Vp6G
         fmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:from
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7PNgNb6zkq209T1kLm1cU9neNgyw5/02C5MNcIRUSGQ=;
        b=UA8IqWT1kLKbzgTMwDdADIkl19gFHQsZoc81pWaE57cnbHDIO6IafFXI3jO8beRYyD
         4vmGIf3Xr/KHyTz7in2z9ey8CSzPO0oIsxeUjvB54n2RyKLYC/SKEUiv4iONUqzA+zNu
         gIuFahOI2WIO0hZH2L00QN7vmgoNLnhRPv6Nzv10hiHSlOKajXkrKY4OfT3OKGJb/+Zc
         W7WtHq5kk7RiK9hX3pL7WdwRUUapE9TDFkqm/9Xk2RUdyatNrsFdlcW9HndhNs8iehMT
         hhPUf8S6DE+6TKxruDBas2oLN226TuKiLd+NjvwYhAD4cXuSM21R0SxvoXawS4gF1+9t
         Qmig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=pNPkV+bn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a05622a009100b0031eb55e2983si6148989qtw.272.2022.07.18.11.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 11:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=pNPkV+bn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDVUa-0003QE-5L
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 14:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVS1-0001TL-LE; Mon, 18 Jul 2022 14:26:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVRz-0004Tb-Jx; Mon, 18 Jul 2022 14:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7PNgNb6zkq209T1kLm1cU9neNgyw5/02C5MNcIRUSGQ=; b=pNPkV+bnEKAejdei+AYDvXXRwp
 N80S2SVozXPCB6a5idJ4aYO4qufAGK0A3+zZb9DcXv+K8Z8YvRNG6ETs7tt8793ef0uPdNkLuoIke
 F7QPMovfkF/GDb/NHnA/qPFXX8IfJYFjbe8xlC23pTHGevoS+h88ezG47L2jLf0k4FgeIB/b7PGfS
 YWn0Fz+OeyELQKDc/nI2l2ELoH75YF3qNh2cU3GSL670uag2iYSVYM6QJV4szs3WAtbobi1C30a1N
 2PiXnnwniRvIGZC2iLx0ln/1Ac/dr0dqSdh/jrWmGOf3MkwTdYHjwqskzHOSk8tm7G8Gm3PkQ5MmF
 LoVyLmc6z9xEH12jcc9KA2wJT3WM+hYveXjrDdJ/AEuqG/FIssENUOc+DKPuWGknOv8Rpv6OS7GuR
 hmW5CdzcFGJXbYXbHUap0+8IpbPclX3LBSeyOa6hW6mGUE6Sb4/vDQR7R2icVTBqZGA/Hw4d31Bjb
 NEoTkNUjmYoTBSTZbLyAUpY+SbTVQXc0nc8mQyQW9hlO5m+fDi0D+0Et2twKAZFXUqdE9eDB+0luB
 b30aJ87cYjS9/BoXqoTAto3ufsrE9/1PD37xz9MviaWWxFgn/JjNGY20kVxslnogM3Onkks1hcAwP
 jHVcNdk8xl722y5YXQ+xT6Yz9a8Uuirihi//BKOnw=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVQT-000B2Q-9v; Mon, 18 Jul 2022 19:25:05 +0100
Message-ID: <28ed7446-9500-a8c5-f4f2-54ae333f54fd@ilande.co.uk>
Date: Mon, 18 Jul 2022 19:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/40] PS2 device QOMification - part 2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ppWe3VWb/ccF

On 12/07/2022 22:52, Mark Cave-Ayland wrote:

> Here is the follow-on series from part 1 which completes the work to remove
> the legacy global device init functions for PS2 devices. Now that part 1 has
> been applied, the hard part to remove the PS2 function callback and argument
> has been completed and all that remains is to improve the PS2 device
> QOMification to allow the legacy PS2 functions to be removed.
> 
> Patches 1-11 update the pl050 device to remove the use of ps2_kbd_init() and
> ps2_mouse_init(), whilst patches 12-34 make some more involved changes to
> the lasips2 device (in particular completing the LASIPS2Port abstraction)
> before doing the same.
> 
> Finally patches 35-40 complete the process for the pckbd (I8042 and I8042_MMIO
> devices) before removing the now unused ps2_kbd_init(), ps2_mouse_init() and
> i8042_mm_init() functions.
> 
> Note that this series is a migration break for the HPPA B160L and MIPS magnum
> machines: I've had agreement from both Helge and Hervé that this is worth
> doing to allow the use of the DeviceClass vmsd property to set the
> VMStateDescription rather than manually calling vmstate_register().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Patches still requiring review for updated commit messages (no code changes
> from v1): 27, 28 and 34
> 
> v2:
> - Rebase onto master
> - Add A-B and R-B tags from Helge and Peter
> - s/jazz/magnum/ for consistency in commit message for patch 35
> - Update commit messages in patches 27 and 28 to clarify why the int_status
>    bitmap isn't immediately added to the vmstate_lasips2 VMStateDescription
> - Update commit message in patch 34 to detail the extra changes to the
>    vmstate_lasips2 VMStateDescription
> 
> 
> Mark Cave-Ayland (40):
>    pl050: move PL050State from pl050.c to new pl050.h header file
>    pl050: rename pl050_keyboard_init() to pl050_kbd_init()
>    pl050: change PL050State dev pointer from void to PS2State
>    pl050: introduce new PL050_KBD_DEVICE QOM type
>    pl050: introduce new PL050_MOUSE_DEVICE QOM type
>    pl050: move logic from pl050_realize() to pl050_init()
>    pl050: introduce PL050DeviceClass for the PL050 device
>    pl050: introduce pl050_kbd_class_init() and pl050_kbd_realize()
>    pl050: introduce pl050_mouse_class_init() and pl050_mouse_realize()
>    pl050: don't use legacy ps2_kbd_init() function
>    pl050: don't use legacy ps2_mouse_init() function
>    lasips2: don't use vmstate_register() in lasips2_realize()
>    lasips2: remove the qdev base property and the lasips2_properties
>      array
>    lasips2: remove legacy lasips2_initfn() function
>    lasips2: change LASIPS2State dev pointer from void to PS2State
>    lasips2: QOMify LASIPS2Port
>    lasips2: introduce new LASIPS2_KBD_PORT QOM type
>    lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
>    lasips2: move keyboard port initialisation to new
>      lasips2_kbd_port_init() function
>    lasips2: move mouse port initialisation to new
>      lasips2_mouse_port_init() function
>    lasips2: introduce lasips2_kbd_port_class_init() and
>      lasips2_kbd_port_realize()
>    lasips2: introduce lasips2_mouse_port_class_init() and
>      lasips2_mouse_port_realize()
>    lasips2: rename LASIPS2Port irq field to birq
>    lasips2: introduce port IRQ and new lasips2_port_init() function
>    lasips2: introduce LASIPS2PortDeviceClass for the LASIPS2_PORT device
>    lasips2: add named input gpio to port for downstream PS2 device IRQ
>    lasips2: add named input gpio to handle incoming port IRQs
>    lasips2: switch to using port-based IRQs
>    lasips2: rename LASIPS2Port parent pointer to lasips2
>    lasips2: standardise on lp name for LASIPS2Port variables
>    lasips2: switch register memory region to DEVICE_BIG_ENDIAN
>    lasips2: don't use legacy ps2_kbd_init() function
>    lasips2: don't use legacy ps2_mouse_init() function
>    lasips2: update VMStateDescription for LASIPS2 device
>    pckbd: introduce new vmstate_kbd_mmio VMStateDescription for the
>      I8042_MMIO device
>    pckbd: don't use legacy ps2_kbd_init() function
>    ps2: remove unused legacy ps2_kbd_init() function
>    pckbd: don't use legacy ps2_mouse_init() function
>    ps2: remove unused legacy ps2_mouse_init() function
>    pckbd: remove legacy i8042_mm_init() function
> 
>   hw/hppa/machine.c          |   7 +-
>   hw/input/lasips2.c         | 320 ++++++++++++++++++++++++++-----------
>   hw/input/pckbd.c           |  82 ++++++----
>   hw/input/pl050.c           | 112 ++++++++-----
>   hw/input/ps2.c             |  26 ---
>   hw/input/trace-events      |   2 -
>   hw/mips/jazz.c             |  13 +-
>   include/hw/input/i8042.h   |   7 +-
>   include/hw/input/lasips2.h |  57 +++++--
>   include/hw/input/pl050.h   |  59 +++++++
>   include/hw/input/ps2.h     |   2 -
>   11 files changed, 466 insertions(+), 221 deletions(-)
>   create mode 100644 include/hw/input/pl050.h

I've queued this via my qemu-sparc branch.


ATB,

Mark.
