Received: by 10.25.205.13 with SMTP id d13csp3233961lfg;
        Wed, 21 Dec 2016 07:31:48 -0800 (PST)
X-Received: by 10.55.175.132 with SMTP id y126mr5291749qke.43.1482334308002;
        Wed, 21 Dec 2016 07:31:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si15243946qtn.280.2016.12.21.07.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Dec 2016 07:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJiro-00086Z-T0
	for alex.bennee@linaro.org; Wed, 21 Dec 2016 10:31:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <smrithics@gmail.com>) id 1cJdKQ-0007gK-4F
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 04:36:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <smrithics@gmail.com>) id 1cJdKL-0003zu-9L
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 04:36:54 -0500
Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242]:34120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <smrithics@gmail.com>) id 1cJdKK-0003yR-N2
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 04:36:49 -0500
Received: by mail-wj0-x242.google.com with SMTP id xy5so31182244wjc.1
	for <qemu-arm@nongnu.org>; Wed, 21 Dec 2016 01:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=OFd5ZIpFyLQSZnsKWp/k3s9gwSy0VWBu8AzFUXzTcHs=;
	b=kIfpE3hQqsVmdfJRW7LsdtaDZjbeomCiEe7EZY9AlpBNDU3UW0I9eqUiOvlhk45Quc
	lBNCngfWraNzEmG3eLP7AAnPyxRRe1GYm0xk5GOjMPgB8eP3rp5S5oQl3ht4rWX2f94P
	/MrZ8ve7oXyBGZG+R8cf1xLKmL+rvyP/qDcGUPP4YMARBawlcuWaXd2uOECSgJ/NiN/Q
	dWX2w8bg2ePJXEF7JmkCVy3JBymOlaO1f6xWQ7daxccAyEw7AAUcBZYpoa/SJO+sfnfv
	WF6FdoWwB+iXohEYGPTG/OkkVaPLZovcFHOrvrCKnomDF32c2ZAZmaR1bYYTHzLagFXP
	tyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=OFd5ZIpFyLQSZnsKWp/k3s9gwSy0VWBu8AzFUXzTcHs=;
	b=riBBOSLdrOcXRcR43M0Fwwy8t7zgdNs1uEx4OmbiHoPiAnlMgSaoWF3MK4c6hgKaE+
	Mnl68Cr10Yg5SyFkw5MlXVCbHvnP2M53VhG3AaaZh7e3lB4vgVXpxGsYPqv/j+yn0Gft
	qwvQmN6rMxeoUQJwgvANziphV9B69/OY20F0u0Qzom76bBXPZlj9C31naIE9fy++TcEz
	0GoJ0ZEGnqYnGALUnpN6eaR/qTUQHQGgGc/evTvTDYFJDbwj4qMvtwXpRk1q9M9nGLyQ
	bXr6opRkdAIb1CMXRt+8OQMPrTDaqA/BZP9LKiFU3GuKN+qY82juQW9JCmAsw29MKcT+
	PP0g==
X-Gm-Message-State: AIkVDXIzClyrXrTbcRGqBvxIv9IS6kPpeMrIERTyjfXZ6hjMxfl8FATmhe7dEiqXMumkm+9DtEqsWKbsFQPZRA==
X-Received: by 10.194.21.35 with SMTP id s3mr3340797wje.192.1482313005579;
	Wed, 21 Dec 2016 01:36:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.161.131 with HTTP; Wed, 21 Dec 2016 01:36:44 -0800 (PST)
In-Reply-To: <mailman.38050.1482275911.22740.qemu-arm@nongnu.org>
References: <mailman.38050.1482275911.22740.qemu-arm@nongnu.org>
From: Smrithi Cn <smrithics@gmail.com>
Date: Wed, 21 Dec 2016 15:06:44 +0530
Message-ID: <CAMrBj+uigiJdEGnea_k1F3UNufQvne4eVM=w+VaQUoAEqywB+A@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=047d7b5d403e24c4d6054427e456
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c01::242
X-Mailman-Approved-At: Wed, 21 Dec 2016 10:31:32 -0500
Subject: Re: [Qemu-arm] Qemu-arm Digest, Vol 15, Issue 76
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gY1GM7wVjJC3

--047d7b5d403e24c4d6054427e456
Content-Type: text/plain; charset=UTF-8

Hi,
Im Smrithicn currently pursuing my mtech in embedded systems.Im using the
qemu for emulating at91sam9260.Whenever i give the kernel image compiled
for at91sam9260 to the command line as "qemu-system-arm -M vexpress-a9
-kernel linux-3.2/arch/arm/boot/zImage -initrd initramfs -append
"console=tty1"" i get an error executing code outside RAM or ROM at
addrress so and so...could you please guide me..

On Wed, Dec 21, 2016 at 4:48 AM, <qemu-arm-request@nongnu.org> wrote:

> Send Qemu-arm mailing list submissions to
>         qemu-arm@nongnu.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.nongnu.org/mailman/listinfo/qemu-arm
> or, via email, send a message with subject or body 'help' to
>         qemu-arm-request@nongnu.org
>
> You can reach the person managing the list at
>         qemu-arm-owner@nongnu.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Qemu-arm digest..."
>
>
> Today's Topics:
>
>    1. Re: [Qemu-devel] [PATCH v4 0/7] q35: add negotiable broadcast
>       SMI (no-reply@patchew.org)
>    2. [PATCH v3 0/3]  Add the generic ARM timer (Alistair Francis)
>    3. [PATCH v3 1/3] arm_generic_timer: Add the ARM Generic Timer
>       (Alistair Francis)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 20 Dec 2016 15:01:17 -0800 (PST)
> From: no-reply@patchew.org
> To: lersek@redhat.com
> Cc: famz@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
>         ehabkost@redhat.com, mst@redhat.com, somlo@cmu.edu,
>         zhaoshenglong@huawei.com, michael@walle.cc, qemu-arm@nongnu.org,
>         kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com
> Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/7] q35: add
>         negotiable broadcast SMI
> Message-ID: <148227487620.73.10055858460424473693@790289a7ca88>
> Content-Type: text/plain; charset="utf-8"
>
> Hi,
>
> Your series seems to have some coding style problems. See output below for
> more information:
>
> Subject: [Qemu-devel] [PATCH v4 0/7] q35: add negotiable broadcast SMI
> Message-id: 20161201170624.26496-1-lersek@redhat.com
> Type: series
>
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
>
> BASE=base
> n=1
> total=$(git log --oneline $BASE.. | wc -l)
> failed=0
>
> # Useful git options
> git config --local diff.renamelimit 0
> git config --local diff.renames True
>
> commits="$(git log --format=%H --reverse $BASE..)"
> for c in $commits; do
>     echo "Checking PATCH $n/$total: $(git log -n 1 --format=%s $c)..."
>     if ! git show $c --format=email | ./scripts/checkpatch.pl --mailback
> -; then
>         failed=1
>         echo
>     fi
>     n=$((n+1))
> done
>
> exit $failed
> === TEST SCRIPT END ===
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  - [tag update]      patchew/1480926904-17596-1-git-send-email-zhang.
> zhanghailiang@huawei.com -> patchew/1480926904-17596-1-
> git-send-email-zhang.zhanghailiang@huawei.com
>  - [tag update]      patchew/1481625384-15077-1-
> git-send-email-peter.maydell@linaro.org -> patchew/1481625384-15077-1-
> git-send-email-peter.maydell@linaro.org
>  - [tag update]      patchew/1481856403-23599-1-
> git-send-email-zhangchen.fnst@cn.fujitsu.com -> patchew/
> 1481856403-23599-1-git-send-email-zhangchen.fnst@cn.fujitsu.com
>  * [new tag]         patchew/1482137486-9843-1-git-
> send-email-douly.fnst@cn.fujitsu.com -> patchew/1482137486-9843-1-git-
> send-email-douly.fnst@cn.fujitsu.com
>  * [new tag]         patchew/1482140507-23607-1-git-send-email-vlad.lungu@
> windriver.com -> patchew/1482140507-23607-1-git-send-email-vlad.lungu@
> windriver.com
>  * [new tag]         patchew/1482145554-88823-1-git-send-email-wei.w.wang@
> intel.com -> patchew/1482145554-88823-1-git-send-email-wei.w.wang@
> intel.com
>  * [new tag]         patchew/1482156623-9111-1-git-
> send-email-peterx@redhat.com -> patchew/1482156623-9111-1-git-
> send-email-peterx@redhat.com
>  * [new tag]         patchew/148215768690.13973.9042496691140000163.stgit@bahia
> -> patchew/148215768690.13973.9042496691140000163.stgit@bahia
>  * [new tag]         patchew/1482158486-18597-1-
> git-send-email-peterx@redhat.com -> patchew/1482158486-18597-1-
> git-send-email-peterx@redhat.com
>  * [new tag]         patchew/1482187106-85065-1-
> git-send-email-sochin.jiang@huawei.com -> patchew/1482187106-85065-1-
> git-send-email-sochin.jiang@huawei.com
>  * [new tag]         patchew/1482255793-19057-1-git-send-email-ehabkost@
> redhat.com -> patchew/1482255793-19057-1-git-send-email-ehabkost@
> redhat.com
>  * [new tag]         patchew/1482268300-10082-1-
> git-send-email-andrew.smirnov@gmail.com -> patchew/1482268300-10082-1-
> git-send-email-andrew.smirnov@gmail.com
>  * [new tag]         patchew/1482268598-27422-1-
> git-send-email-thuth@redhat.com -> patchew/1482268598-27422-1-
> git-send-email-thuth@redhat.com
>  * [new tag]         patchew/1482269164-14642-1-
> git-send-email-minyard@acm.org -> patchew/1482269164-14642-1-
> git-send-email-minyard@acm.org
>  * [new tag]         patchew/20161201170624.26496-1-lersek@redhat.com ->
> patchew/20161201170624.26496-1-lersek@redhat.com
>  - [tag update]      patchew/20161212224325.20790-
> 1-marcandre.lureau@redhat.com -> patchew/20161212224325.20790-
> 1-marcandre.lureau@redhat.com
>  - [tag update]      patchew/20161214070156.23368-1-ppandit@redhat.com ->
> patchew/20161214070156.23368-1-ppandit@redhat.com
>  * [new tag]         patchew/20161219205054.4677-1-kirkseraph@gmail.com
> -> patchew/20161219205054.4677-1-kirkseraph@gmail.com
>  * [new tag]         patchew/20161220163139.12016-1-famz@redhat.com ->
> patchew/20161220163139.12016-1-famz@redhat.com
>  * [new tag]         patchew/b0619e40-daca-9b28-
> 2c78-1e2709d9f0ad@tuxfamily.org -> patchew/b0619e40-daca-9b28-
> 2c78-1e2709d9f0ad@tuxfamily.org
>  * [new tag]         patchew/cover.1482143215.git.vpalatin@chromium.org
> -> patchew/cover.1482143215.git.vpalatin@chromium.org
>  * [new tag]         patchew/cover.1482164622.git.vpalatin@chromium.org
> -> patchew/cover.1482164622.git.vpalatin@chromium.org
>  * [new tag]         patchew/cover.1482187052.git.ben@skyportsystems.com
> -> patchew/cover.1482187052.git.ben@skyportsystems.com
> Switched to a new branch 'test'
> 2d2326b hw/i386/pc_q35: advertise broadcast SMI if VCPU hotplug is turned
> off
> 3443a68 hw/isa/lpc_ich9: add broadcast SMI feature
> 3863642 hw/isa/lpc_ich9: add SMI feature negotiation via fw_cfg
> 12b2efd hw/i386/pc: introduce 2.9 machine types with 0x20 fw_cfg file slots
> 5387420 fw-cfg: expose "file_slots" parameter in fw_cfg_init_io_dma()
> c550b2c fw-cfg: turn FW_CFG_FILE_SLOTS into a device property
> 1f40c84 fw-cfg: support writeable blobs
>
> === OUTPUT BEGIN ===
> Checking PATCH 1/7: fw-cfg: support writeable blobs...
> Checking PATCH 2/7: fw-cfg: turn FW_CFG_FILE_SLOTS into a device
> property...
> Checking PATCH 3/7: fw-cfg: expose "file_slots" parameter in
> fw_cfg_init_io_dma()...
> Checking PATCH 4/7: hw/i386/pc: introduce 2.9 machine types with 0x20
> fw_cfg file slots...
> ERROR: Macros with multiple statements should be enclosed in a do - while
> loop
> #126: FILE: include/hw/compat.h:4:
> +#define HW_COMPAT_2_8 \
> +    {\
> +        .driver   = "fw_cfg_mem",\
> +        .property = "file_slots",\
> +        .value    = stringify(0x10),\
> +    },{\
> +        .driver   = "fw_cfg_io",\
> +        .property = "file_slots",\
> +        .value    = stringify(0x10),\
> +    },
>
> total: 1 errors, 0 warnings, 119 lines checked
>
> Your patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> Checking PATCH 5/7: hw/isa/lpc_ich9: add SMI feature negotiation via
> fw_cfg...
> Checking PATCH 6/7: hw/isa/lpc_ich9: add broadcast SMI feature...
> Checking PATCH 7/7: hw/i386/pc_q35: advertise broadcast SMI if VCPU
> hotplug is turned off...
> === OUTPUT END ===
>
> Test command exited with code: 1
>
>
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@freelists.org
>
> ------------------------------
>
> Message: 2
> Date: Tue, 20 Dec 2016 14:41:59 -0800
> From: Alistair Francis <alistair.francis@xilinx.com>
> To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
>         <peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
> Cc: <alistair.francis@xilinx.com>, <alistair23@gmail.com>
> Subject: [Qemu-arm] [PATCH v3 0/3]  Add the generic ARM timer
> Message-ID: <cover.1482265908.git.alistair.francis@xilinx.com>
> Content-Type: text/plain
>
> These three patches and and connect the Generic ARM Timer. This includes
> support for dropping insecure writes and includes the ReadBase memory
> map.
>
> V3:
>  - Add the ReadBase memory map
>  - Update the names to match the ARM ARM
> V2:
>  - Fix couter/counter typo
>
>
> Alistair Francis (3):
>   arm_generic_timer: Add the ARM Generic Timer
>   arm_generic_timer: Add support for the ReadBase memory map
>   xlnx-zynqmp: Connect the ARM Generic Timer
>
>  hw/arm/xlnx-zynqmp.c                 |  14 +++
>  hw/timer/Makefile.objs               |   1 +
>  hw/timer/arm_generic_timer.c         | 232 ++++++++++++++++++++++++++++++
> +++++
>  include/hw/arm/xlnx-zynqmp.h         |   2 +
>  include/hw/timer/arm_generic_timer.h |  74 +++++++++++
>  5 files changed, 323 insertions(+)
>  create mode 100644 hw/timer/arm_generic_timer.c
>  create mode 100644 include/hw/timer/arm_generic_timer.h
>
> --
> 2.7.4
>
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 20 Dec 2016 14:42:02 -0800
> From: Alistair Francis <alistair.francis@xilinx.com>
> To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
>         <peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
> Cc: <alistair.francis@xilinx.com>, <alistair23@gmail.com>
> Subject: [Qemu-arm] [PATCH v3 1/3] arm_generic_timer: Add the ARM
>         Generic Timer
> Message-ID:
>         <b985247bfcb7375de984e801c4145fde931360bb.1482265908.git.
> alistair.francis@xilinx.com>
>
> Content-Type: text/plain
>
> Add the ARM generic timer. This allows the guest to poll the timer for
> values and also supports secure writes only.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> V3:
>  - Use ARM ARM names
>  - Indicate that we don't support all of the registers
>  - Fixup the Makefile CONFIG
> V2:
>  - Fix couter/counter typo
>
>  hw/timer/Makefile.objs               |   1 +
>  hw/timer/arm_generic_timer.c         | 205 ++++++++++++++++++++++++++++++
> +++++
>  include/hw/timer/arm_generic_timer.h |  62 +++++++++++
>  3 files changed, 268 insertions(+)
>  create mode 100644 hw/timer/arm_generic_timer.c
>  create mode 100644 include/hw/timer/arm_generic_timer.h
>
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 7ba8c23..bb203e2 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
>  common-obj-$(CONFIG_IMX) += imx_gpt.o
>  common-obj-$(CONFIG_LM32) += lm32_timer.o
>  common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
> +common-obj-$(CONFIG_ARM_TIMER) += arm_generic_timer.o
>
>  obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
> diff --git a/hw/timer/arm_generic_timer.c b/hw/timer/arm_generic_timer.c
> new file mode 100644
> index 0000000..da434a7
> --- /dev/null
> +++ b/hw/timer/arm_generic_timer.c
> @@ -0,0 +1,205 @@
> +/*
> + * QEMU model of the ARM Generic Timer
> + *
> + * Copyright (c) 2016 Xilinx Inc.
> + * Written by Alistair Francis <alistair.francis@xilinx.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/timer/arm_generic_timer.h"
> +#include "qemu/timer.h"
> +#include "qemu/log.h"
> +
> +#ifndef ARM_GEN_TIMER_ERR_DEBUG
> +#define ARM_GEN_TIMER_ERR_DEBUG 0
> +#endif
> +
> +static void counter_control_postw(RegisterInfo *reg, uint64_t val64)
> +{
> +    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
> +    bool new_status = extract32(s->regs[R_CNTCR],
> +                                R_CNTCR_EN_SHIFT,
> +                                R_CNTCR_EN_LENGTH);
> +    uint64_t current_ticks;
> +
> +    current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
> +                             NANOSECONDS_PER_SECOND, 1000000);
> +
> +    if ((s->enabled && !new_status) ||
> +        (!s->enabled && new_status)) {
> +        /* The timer is being disabled or enabled */
> +        s->tick_offset = current_ticks - s->tick_offset;
> +    }
> +
> +    s->enabled = new_status;
> +}
> +
> +static uint64_t counter_value_postr(RegisterInfo *reg)
> +{
> +    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
> +    uint64_t current_ticks, total_ticks;
> +
> +    if (s->enabled) {
> +        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
> +                                 NANOSECONDS_PER_SECOND, 1000000);
> +        total_ticks = current_ticks - s->tick_offset;
> +    } else {
> +        /* Timer is disabled, return the time when it was disabled */
> +        total_ticks = s->tick_offset;
> +    }
> +
> +    return total_ticks;
> +}
> +
> +static uint64_t counter_low_value_postr(RegisterInfo *reg, uint64_t
> val64)
> +{
> +    return (uint32_t) counter_value_postr(reg);
> +}
> +
> +static uint64_t counter_high_value_postr(RegisterInfo *reg, uint64_t
> val64)
> +{
> +    return (uint32_t) (counter_value_postr(reg) >> 32);
> +}
> +
> +static RegisterAccessInfo arm_gen_timer_regs_info[] = {
> +    {   .name = "CNTCR",
> +        .addr = A_CNTCR,
> +        .rsvd = 0xfffffffc,
> +        .post_write = counter_control_postw,
> +    },{ .name = "CNTSR",
> +        .addr = A_CNTSR,
> +        .rsvd = 0xfffffffd, .ro = 0x2,
> +    },{ .name = "CNTCV_LOWER",
> +        .addr = A_CNTCV_LOWER,
> +        .post_read = counter_low_value_postr,
> +    },{ .name = "CNTCV_UPPER",
> +        .addr = A_CNTCV_UPPER,
> +        .post_read = counter_high_value_postr,
> +    },{ .name = "CNTFID0",
> +        .addr = A_CNTFID0,
> +    }
> +    /* We don't model CNTFIDn */
> +    /* We don't model the CounterID registers either */
> +};
> +
> +static void arm_gen_timer_reset(DeviceState *dev)
> +{
> +    ARMGenTimer *s = ARM_GEN_TIMER(dev);
> +    unsigned int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
> +        register_reset(&s->regs_info[i]);
> +    }
> +
> +    s->tick_offset = 0;
> +    s->enabled = false;
> +}
> +
> +static MemTxResult arm_gen_timer_read(void *opaque,  hwaddr addr,
> +                                      uint64_t *data, unsigned size,
> +                                      MemTxAttrs attrs)
> +{
> +    /* Reads are always supported, just blindly pass them through */
> +    *data = register_read_memory(opaque, addr, size);
> +
> +    return MEMTX_OK;
> +}
> +
> +static MemTxResult arm_gen_timer_write(void *opaque, hwaddr addr,
> +                                       uint64_t data, unsigned size,
> +                                       MemTxAttrs attrs)
> +{
> +    /* Block insecure writes */
> +    if (!attrs.secure) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Non secure writes to the system timestamp
> generator " \
> +                      "are invalid\n");
> +        return MEMTX_ERROR;
> +    }
> +
> +    register_write_memory(opaque, addr, data, size);
> +
> +    return MEMTX_OK;
> +}
> +
> +static const MemoryRegionOps arm_gen_timer_ops = {
> +    .read_with_attrs = arm_gen_timer_read,
> +    .write_with_attrs = arm_gen_timer_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static const VMStateDescription vmstate_arm_gen_timer = {
> +    .name = TYPE_ARM_GEN_TIMER,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, ARMGenTimer, R_ARM_GEN_TIMER_MAX),
> +        VMSTATE_END_OF_LIST(),
> +    }
> +};
> +
> +static void arm_gen_timer_init(Object *obj)
> +{
> +    ARMGenTimer *s = ARM_GEN_TIMER(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    RegisterInfoArray *reg_array;
> +
> +    memory_region_init_io(&s->iomem, obj, &arm_gen_timer_ops, s,
> +                          TYPE_ARM_GEN_TIMER, R_ARM_GEN_TIMER_MAX * 4);
> +    reg_array =
> +        register_init_block32(DEVICE(obj), arm_gen_timer_regs_info,
> +                              ARRAY_SIZE(arm_gen_timer_regs_info),
> +                              s->regs_info, s->regs,
> +                              &arm_gen_timer_ops,
> +                              ARM_GEN_TIMER_ERR_DEBUG,
> +                              R_ARM_GEN_TIMER_MAX * 4);
> +    memory_region_add_subregion(&s->iomem,
> +                                A_CNTCR,
> +                                &reg_array->mem);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void arm_gen_timer_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = arm_gen_timer_reset;
> +    dc->vmsd = &vmstate_arm_gen_timer;
> +}
> +
> +static const TypeInfo arm_gen_timer_info = {
> +    .name          = TYPE_ARM_GEN_TIMER,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(ARMGenTimer),
> +    .class_init    = arm_gen_timer_class_init,
> +    .instance_init = arm_gen_timer_init,
> +};
> +
> +static void arm_gen_timer_register_types(void)
> +{
> +    type_register_static(&arm_gen_timer_info);
> +}
> +
> +type_init(arm_gen_timer_register_types)
> diff --git a/include/hw/timer/arm_generic_timer.h b/include/hw/timer/arm_
> generic_timer.h
> new file mode 100644
> index 0000000..ae4319c
> --- /dev/null
> +++ b/include/hw/timer/arm_generic_timer.h
> @@ -0,0 +1,62 @@
> +/*
> + * QEMU model of the ARM Generic Timer
> + *
> + * Copyright (c) 2016 Xilinx Inc.
> + * Written by Alistair Francis <alistair.francis@xilinx.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining
> a copy
> + * of this software and associated documentation files (the "Software"),
> to deal
> + * in the Software without restriction, including without limitation the
> rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef ARM_GEN_TIMER_H
> +#define ARM_GEN_TIMER_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +
> +#define TYPE_ARM_GEN_TIMER "arm.generic-timer"
> +#define ARM_GEN_TIMER(obj) \
> +            OBJECT_CHECK(ARMGenTimer, (obj), TYPE_ARM_GEN_TIMER)
> +
> +REG32(CNTCR, 0x00)
> +    FIELD(CNTCR, EN, 0, 1)
> +    FIELD(CNTCR, HDBG, 1, 1)
> +REG32(CNTSR, 0x04)
> +    FIELD(CNTSR, DBGH, 1, 1)
> +REG32(CNTCV_LOWER, 0x08)
> +REG32(CNTCV_UPPER, 0x0C)
> +REG32(CNTFID0, 0x20)
> +/* We don't model CNTFIDn */
> +/* We don't model the CounterID registers either */
> +
> +#define R_ARM_GEN_TIMER_MAX (R_CNTFID0 + 1)
> +
> +typedef struct ARMGenTimer {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +
> +    /* <public> */
> +    bool enabled;
> +    uint64_t tick_offset;
> +
> +    uint32_t regs[R_ARM_GEN_TIMER_MAX];
> +    RegisterInfo regs_info[R_ARM_GEN_TIMER_MAX];
> +} ARMGenTimer;
> +
> +#endif
> --
> 2.7.4
>
>
>
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> Qemu-arm mailing list
> Qemu-arm@nongnu.org
> https://lists.nongnu.org/mailman/listinfo/qemu-arm
>
>
> ------------------------------
>
> End of Qemu-arm Digest, Vol 15, Issue 76
> ****************************************
>

--047d7b5d403e24c4d6054427e456
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div>Im Smrithicn currently pursuing my mtech=
 in embedded systems.Im using the qemu for emulating at91sam9260.Whenever i=
 give the kernel image compiled for at91sam9260 to the command line as &quo=
t;qemu-system-arm -M vexpress-a9 -kernel linux-3.2/arch/arm/boot/zImage -in=
itrd initramfs -append &quot;console=3Dtty1&quot;&quot; i get an error exec=
uting code outside RAM or ROM at addrress so and so...could you please guid=
e me..<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Wed, Dec 21, 2016 at 4:48 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:qe=
mu-arm-request@nongnu.org" target=3D"_blank">qemu-arm-request@nongnu.org</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Send Qemu-arm mailing=
 list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm@nongnu.org">qemu-arm=
@nongnu.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.nongnu.org/mailman/lis=
tinfo/qemu-arm" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.o=
rg/<wbr>mailman/listinfo/qemu-arm</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm-request@nongnu.org">=
qemu-arm-request@nongnu.org</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:qemu-arm-owner@nongnu.org">qe=
mu-arm-owner@nongnu.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of Qemu-arm digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. Re: [Qemu-devel] [PATCH v4 0/7] q35: add negotiable broadca=
st<br>
=C2=A0 =C2=A0 =C2=A0 SMI (<a href=3D"mailto:no-reply@patchew.org">no-reply@=
patchew.org</a>)<br>
=C2=A0 =C2=A02. [PATCH v3 0/3]=C2=A0 Add the generic ARM timer (Alistair Fr=
ancis)<br>
=C2=A0 =C2=A03. [PATCH v3 1/3] arm_generic_timer: Add the ARM Generic Timer=
<br>
=C2=A0 =C2=A0 =C2=A0 (Alistair Francis)<br>
<br>
<br>
------------------------------<wbr>------------------------------<wbr>-----=
-----<br>
<br>
Message: 1<br>
Date: Tue, 20 Dec 2016 15:01:17 -0800 (PST)<br>
From: <a href=3D"mailto:no-reply@patchew.org">no-reply@patchew.org</a><br>
To: <a href=3D"mailto:lersek@redhat.com">lersek@redhat.com</a><br>
Cc: <a href=3D"mailto:famz@redhat.com">famz@redhat.com</a>, <a href=3D"mail=
to:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>, <a href=3D"mailto:pete=
r.maydell@linaro.org">peter.maydell@linaro.org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:ehabkost@redhat.com">ehabkost=
@redhat.com</a>, <a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>, <a h=
ref=3D"mailto:somlo@cmu.edu">somlo@cmu.edu</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:zhaoshenglong@huawei.com">zha=
oshenglong@huawei.com</a>, michael@walle.cc, <a href=3D"mailto:qemu-arm@non=
gnu.org">qemu-arm@nongnu.org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:kraxel@redhat.com">kraxel@red=
hat.com</a>, <a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
, <a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a><br>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/7] q35: add<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 negotiable broadcast SMI<br>
Message-ID: &lt;148227487620.73.<wbr>10055858460424473693@<wbr>790289a7ca88=
&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
<br>
Hi,<br>
<br>
Your series seems to have some coding style problems. See output below for<=
br>
more information:<br>
<br>
Subject: [Qemu-devel] [PATCH v4 0/7] q35: add negotiable broadcast SMI<br>
Message-id: <a href=3D"mailto:20161201170624.26496-1-lersek@redhat.com">201=
61201170624.26496-1-lersek@<wbr>redhat.com</a><br>
Type: series<br>
<br>
=3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D<br>
#!/bin/bash<br>
<br>
BASE=3Dbase<br>
n=3D1<br>
total=3D$(git log --oneline $BASE.. | wc -l)<br>
failed=3D0<br>
<br>
# Useful git options<br>
git config --local diff.renamelimit 0<br>
git config --local diff.renames True<br>
<br>
commits=3D&quot;$(git log --format=3D%H --reverse $BASE..)&quot;<br>
for c in $commits; do<br>
=C2=A0 =C2=A0 echo &quot;Checking PATCH $n/$total: $(git log -n 1 --format=
=3D%s $c)...&quot;<br>
=C2=A0 =C2=A0 if ! git show $c --format=3Demail | ./scripts/<a href=3D"http=
://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> --=
mailback -; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 failed=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 n=3D$((n+1))<br>
done<br>
<br>
exit $failed<br>
=3D=3D=3D TEST SCRIPT END =3D=3D=3D<br>
<br>
Updating 3c8cf5a9c21ff8782164d1def7f44b<wbr>d888713384<br>
From <a href=3D"https://github.com/patchew-project/qemu" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/patchew-<wbr>project/qemu</a><br>
=C2=A0- [tag update]=C2=A0 =C2=A0 =C2=A0 patchew/<a href=3D"mailto:14809269=
04-17596-1-git-send-email-zhang.zhanghailiang@huawei.com">1480926904-17596-=
1-<wbr>git-send-email-zhang.<wbr>zhanghailiang@huawei.com</a> -&gt; patchew=
/<a href=3D"mailto:1480926904-17596-1-git-send-email-zhang.zhanghailiang@hu=
awei.com">1480926904-17596-1-<wbr>git-send-email-zhang.<wbr>zhanghailiang@h=
uawei.com</a><br>
=C2=A0- [tag update]=C2=A0 =C2=A0 =C2=A0 patchew/<a href=3D"mailto:14816253=
84-15077-1-git-send-email-peter.maydell@linaro.org">1481625384-15077-1-<wbr=
>git-send-email-peter.maydell@<wbr>linaro.org</a> -&gt; patchew/<a href=3D"=
mailto:1481625384-15077-1-git-send-email-peter.maydell@linaro.org">14816253=
84-15077-1-<wbr>git-send-email-peter.maydell@<wbr>linaro.org</a><br>
=C2=A0- [tag update]=C2=A0 =C2=A0 =C2=A0 patchew/<a href=3D"mailto:14818564=
03-23599-1-git-send-email-zhangchen.fnst@cn.fujitsu.com">1481856403-23599-1=
-<wbr>git-send-email-zhangchen.fnst@<wbr>cn.fujitsu.com</a> -&gt; patchew/<=
a href=3D"mailto:1481856403-23599-1-git-send-email-zhangchen.fnst@cn.fujits=
u.com">1481856403-23599-1-<wbr>git-send-email-zhangchen.fnst@<wbr>cn.fujits=
u.com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482137486-9843-1-git-send-email-douly.fnst@cn.fujitsu.com">1482137486-98=
43-1-git-<wbr>send-email-douly.fnst@cn.<wbr>fujitsu.com</a> -&gt; patchew/<=
a href=3D"mailto:1482137486-9843-1-git-send-email-douly.fnst@cn.fujitsu.com=
">1482137486-9843-1-git-<wbr>send-email-douly.fnst@cn.<wbr>fujitsu.com</a><=
br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482140507-23607-1-git-send-email-vlad.lungu@windriver.com">1482140507-23=
607-1-<wbr>git-send-email-vlad.lungu@<wbr>windriver.com</a> -&gt; patchew/<=
a href=3D"mailto:1482140507-23607-1-git-send-email-vlad.lungu@windriver.com=
">1482140507-23607-1-<wbr>git-send-email-vlad.lungu@<wbr>windriver.com</a><=
br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482145554-88823-1-git-send-email-wei.w.wang@intel.com">1482145554-88823-=
1-<wbr>git-send-email-wei.w.wang@<wbr>intel.com</a> -&gt; patchew/<a href=
=3D"mailto:1482145554-88823-1-git-send-email-wei.w.wang@intel.com">14821455=
54-88823-1-<wbr>git-send-email-wei.w.wang@<wbr>intel.com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482156623-9111-1-git-send-email-peterx@redhat.com">1482156623-9111-1-git=
-<wbr>send-email-peterx@redhat.com</a> -&gt; patchew/<a href=3D"mailto:1482=
156623-9111-1-git-send-email-peterx@redhat.com">1482156623-9111-1-git-<wbr>=
send-email-peterx@redhat.com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/148215768690.139=
73.<wbr>9042496691140000163.stgit@<wbr>bahia -&gt; patchew/148215768690.139=
73.<wbr>9042496691140000163.stgit@<wbr>bahia<br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482158486-18597-1-git-send-email-peterx@redhat.com">1482158486-18597-1-<=
wbr>git-send-email-peterx@redhat.<wbr>com</a> -&gt; patchew/<a href=3D"mail=
to:1482158486-18597-1-git-send-email-peterx@redhat.com">1482158486-18597-1-=
<wbr>git-send-email-peterx@redhat.<wbr>com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482187106-85065-1-git-send-email-sochin.jiang@huawei.com">1482187106-850=
65-1-<wbr>git-send-email-sochin.jiang@<wbr>huawei.com</a> -&gt; patchew/<a =
href=3D"mailto:1482187106-85065-1-git-send-email-sochin.jiang@huawei.com">1=
482187106-85065-1-<wbr>git-send-email-sochin.jiang@<wbr>huawei.com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482255793-19057-1-git-send-email-ehabkost@redhat.com">1482255793-19057-1=
-<wbr>git-send-email-ehabkost@<wbr>redhat.com</a> -&gt; patchew/<a href=3D"=
mailto:1482255793-19057-1-git-send-email-ehabkost@redhat.com">1482255793-19=
057-1-<wbr>git-send-email-ehabkost@<wbr>redhat.com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482268300-10082-1-git-send-email-andrew.smirnov@gmail.com">1482268300-10=
082-1-<wbr>git-send-email-andrew.smirnov@<wbr>gmail.com</a> -&gt; patchew/<=
a href=3D"mailto:1482268300-10082-1-git-send-email-andrew.smirnov@gmail.com=
">1482268300-10082-1-<wbr>git-send-email-andrew.smirnov@<wbr>gmail.com</a><=
br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482268598-27422-1-git-send-email-thuth@redhat.com">1482268598-27422-1-<w=
br>git-send-email-thuth@redhat.<wbr>com</a> -&gt; patchew/<a href=3D"mailto=
:1482268598-27422-1-git-send-email-thuth@redhat.com">1482268598-27422-1-<wb=
r>git-send-email-thuth@redhat.<wbr>com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:1482269164-14642-1-git-send-email-minyard@acm.org">1482269164-14642-1-<wb=
r>git-send-email-minyard@acm.org</a> -&gt; patchew/<a href=3D"mailto:148226=
9164-14642-1-git-send-email-minyard@acm.org">1482269164-14642-1-<wbr>git-se=
nd-email-minyard@acm.org</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:20161201170624.26496-1-lersek@redhat.com">20161201170624.26496-<wbr>1-ler=
sek@redhat.com</a> -&gt; patchew/<a href=3D"mailto:20161201170624.26496-1-l=
ersek@redhat.com">20161201170624.26496-<wbr>1-lersek@redhat.com</a><br>
=C2=A0- [tag update]=C2=A0 =C2=A0 =C2=A0 patchew/<a href=3D"mailto:20161212=
224325.20790-1-marcandre.lureau@redhat.com">20161212224325.20790-<wbr>1-mar=
candre.lureau@redhat.com</a> -&gt; patchew/<a href=3D"mailto:20161212224325=
.20790-1-marcandre.lureau@redhat.com">20161212224325.20790-<wbr>1-marcandre=
.lureau@redhat.com</a><br>
=C2=A0- [tag update]=C2=A0 =C2=A0 =C2=A0 patchew/<a href=3D"mailto:20161214=
070156.23368-1-ppandit@redhat.com">20161214070156.23368-<wbr>1-ppandit@redh=
at.com</a> -&gt; patchew/<a href=3D"mailto:20161214070156.23368-1-ppandit@r=
edhat.com">20161214070156.23368-<wbr>1-ppandit@redhat.com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:20161219205054.4677-1-kirkseraph@gmail.com">20161219205054.4677-1-<wbr>ki=
rkseraph@gmail.com</a> -&gt; patchew/<a href=3D"mailto:20161219205054.4677-=
1-kirkseraph@gmail.com">20161219205054.4677-1-<wbr>kirkseraph@gmail.com</a>=
<br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:20161220163139.12016-1-famz@redhat.com">20161220163139.12016-<wbr>1-famz@=
redhat.com</a> -&gt; patchew/<a href=3D"mailto:20161220163139.12016-1-famz@=
redhat.com">20161220163139.12016-<wbr>1-famz@redhat.com</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:b0619e40-daca-9b28-2c78-1e2709d9f0ad@tuxfamily.org">b0619e40-daca-9b28-<w=
br>2c78-1e2709d9f0ad@tuxfamily.<wbr>org</a> -&gt; patchew/<a href=3D"mailto=
:b0619e40-daca-9b28-2c78-1e2709d9f0ad@tuxfamily.org">b0619e40-daca-9b28-<wb=
r>2c78-1e2709d9f0ad@tuxfamily.<wbr>org</a><br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:cover.1482143215.git.vpalatin@chromium.org">cover.1482143215.git.<wbr>vpa=
latin@chromium.org</a> -&gt; patchew/<a href=3D"mailto:cover.1482143215.git=
.vpalatin@chromium.org">cover.1482143215.git.<wbr>vpalatin@chromium.org</a>=
<br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:cover.1482164622.git.vpalatin@chromium.org">cover.1482164622.git.<wbr>vpa=
latin@chromium.org</a> -&gt; patchew/<a href=3D"mailto:cover.1482164622.git=
.vpalatin@chromium.org">cover.1482164622.git.<wbr>vpalatin@chromium.org</a>=
<br>
=C2=A0* [new tag]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchew/<a href=3D"mailt=
o:cover.1482187052.git.ben@skyportsystems.com">cover.1482187052.git.<wbr>be=
n@skyportsystems.com</a> -&gt; patchew/<a href=3D"mailto:cover.1482187052.g=
it.ben@skyportsystems.com">cover.1482187052.git.<wbr>ben@skyportsystems.com=
</a><br>
Switched to a new branch &#39;test&#39;<br>
2d2326b hw/i386/pc_q35: advertise broadcast SMI if VCPU hotplug is turned o=
ff<br>
3443a68 hw/isa/lpc_ich9: add broadcast SMI feature<br>
3863642 hw/isa/lpc_ich9: add SMI feature negotiation via fw_cfg<br>
12b2efd hw/i386/pc: introduce 2.9 machine types with 0x20 fw_cfg file slots=
<br>
5387420 fw-cfg: expose &quot;file_slots&quot; parameter in fw_cfg_init_io_d=
ma()<br>
c550b2c fw-cfg: turn FW_CFG_FILE_SLOTS into a device property<br>
1f40c84 fw-cfg: support writeable blobs<br>
<br>
=3D=3D=3D OUTPUT BEGIN =3D=3D=3D<br>
Checking PATCH 1/7: fw-cfg: support writeable blobs...<br>
Checking PATCH 2/7: fw-cfg: turn FW_CFG_FILE_SLOTS into a device property..=
.<br>
Checking PATCH 3/7: fw-cfg: expose &quot;file_slots&quot; parameter in fw_c=
fg_init_io_dma()...<br>
Checking PATCH 4/7: hw/i386/pc: introduce 2.9 machine types with 0x20 fw_cf=
g file slots...<br>
ERROR: Macros with multiple statements should be enclosed in a do - while l=
oop<br>
#126: FILE: include/hw/compat.h:4:<br>
+#define HW_COMPAT_2_8 \<br>
+=C2=A0 =C2=A0 {\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0=3D &quot;fw_cfg_mem&quot;=
,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .property =3D &quot;file_slots&quot;,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .value=C2=A0 =C2=A0 =3D stringify(0x10),\<br>
+=C2=A0 =C2=A0 },{\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver=C2=A0 =C2=A0=3D &quot;fw_cfg_io&quot;,=
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .property =3D &quot;file_slots&quot;,\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .value=C2=A0 =C2=A0 =3D stringify(0x10),\<br>
+=C2=A0 =C2=A0 },<br>
<br>
total: 1 errors, 0 warnings, 119 lines checked<br>
<br>
Your patch has style problems, please review.=C2=A0 If any of these errors<=
br>
are false positives report them to the maintainer, see<br>
CHECKPATCH in MAINTAINERS.<br>
<br>
Checking PATCH 5/7: hw/isa/lpc_ich9: add SMI feature negotiation via fw_cfg=
...<br>
Checking PATCH 6/7: hw/isa/lpc_ich9: add broadcast SMI feature...<br>
Checking PATCH 7/7: hw/i386/pc_q35: advertise broadcast SMI if VCPU hotplug=
 is turned off...<br>
=3D=3D=3D OUTPUT END =3D=3D=3D<br>
<br>
Test command exited with code: 1<br>
<br>
<br>
---<br>
Email generated automatically by Patchew [<a href=3D"http://patchew.org/" r=
el=3D"noreferrer" target=3D"_blank">http://patchew.org/</a>].<br>
Please send your feedback to <a href=3D"mailto:patchew-devel@freelists.org"=
>patchew-devel@freelists.org</a><br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Tue, 20 Dec 2016 14:41:59 -0800<br>
From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xilinx.com">a=
listair.francis@xilinx.com</a>&gt;<br>
To: &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>&=
gt;, &lt;<a href=3D"mailto:qemu-arm@nongnu.org">qemu-arm@nongnu.org</a>&gt;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
>peter.maydell@linaro.org</a>&gt;, &lt;<a href=3D"mailto:fred.konrad@greens=
ocs.com">fred.konrad@greensocs.com</a>&gt;<br>
Cc: &lt;<a href=3D"mailto:alistair.francis@xilinx.com">alistair.francis@xil=
inx.com</a>&gt;, &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gma=
il.com</a>&gt;<br>
Subject: [Qemu-arm] [PATCH v3 0/3]=C2=A0 Add the generic ARM timer<br>
Message-ID: &lt;<a href=3D"mailto:cover.1482265908.git.alistair.francis@xil=
inx.com">cover.1482265908.git.<wbr>alistair.francis@xilinx.com</a>&gt;<br>
Content-Type: text/plain<br>
<br>
These three patches and and connect the Generic ARM Timer. This includes<br=
>
support for dropping insecure writes and includes the ReadBase memory<br>
map.<br>
<br>
V3:<br>
=C2=A0- Add the ReadBase memory map<br>
=C2=A0- Update the names to match the ARM ARM<br>
V2:<br>
=C2=A0- Fix couter/counter typo<br>
<br>
<br>
Alistair Francis (3):<br>
=C2=A0 arm_generic_timer: Add the ARM Generic Timer<br>
=C2=A0 arm_generic_timer: Add support for the ReadBase memory map<br>
=C2=A0 xlnx-zynqmp: Connect the ARM Generic Timer<br>
<br>
=C2=A0hw/arm/xlnx-zynqmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 14 +++<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/timer/arm_generic_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 232 +=
+++++++++++++++++++++++++++++<wbr>+++++<br>
=C2=A0include/hw/arm/xlnx-zynqmp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +<br>
=C2=A0include/hw/timer/arm_generic_<wbr>timer.h |=C2=A0 74 +++++++++++<br>
=C2=A05 files changed, 323 insertions(+)<br>
=C2=A0create mode 100644 hw/timer/arm_generic_timer.c<br>
=C2=A0create mode 100644 include/hw/timer/arm_generic_<wbr>timer.h<br>
<br>
--<br>
2.7.4<br>
<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Tue, 20 Dec 2016 14:42:02 -0800<br>
From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xilinx.com">a=
listair.francis@xilinx.com</a>&gt;<br>
To: &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>&=
gt;, &lt;<a href=3D"mailto:qemu-arm@nongnu.org">qemu-arm@nongnu.org</a>&gt;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:peter.maydell@linaro.org"=
>peter.maydell@linaro.org</a>&gt;, &lt;<a href=3D"mailto:fred.konrad@greens=
ocs.com">fred.konrad@greensocs.com</a>&gt;<br>
Cc: &lt;<a href=3D"mailto:alistair.francis@xilinx.com">alistair.francis@xil=
inx.com</a>&gt;, &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gma=
il.com</a>&gt;<br>
Subject: [Qemu-arm] [PATCH v3 1/3] arm_generic_timer: Add the ARM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generic Timer<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:b985247bfcb7375de984e801c=
4145fde931360bb.1482265908.git.alistair.francis@xilinx.com">b985247bfcb7375=
de984e801c4145<wbr>fde931360bb.1482265908.git.<wbr>alistair.francis@xilinx.=
com</a>&gt;<br>
<br>
Content-Type: text/plain<br>
<br>
Add the ARM generic timer. This allows the guest to poll the timer for<br>
values and also supports secure writes only.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xili=
nx.com">alistair.francis@xilinx.com</a>&gt;<br>
---<br>
V3:<br>
=C2=A0- Use ARM ARM names<br>
=C2=A0- Indicate that we don&#39;t support all of the registers<br>
=C2=A0- Fixup the Makefile CONFIG<br>
V2:<br>
=C2=A0- Fix couter/counter typo<br>
<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/timer/arm_generic_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 205 +=
+++++++++++++++++++++++++++++<wbr>+++++<br>
=C2=A0include/hw/timer/arm_generic_<wbr>timer.h |=C2=A0 62 +++++++++++<br>
=C2=A03 files changed, 268 insertions(+)<br>
=C2=A0create mode 100644 hw/timer/arm_generic_timer.c<br>
=C2=A0create mode 100644 include/hw/timer/arm_generic_<wbr>timer.h<br>
<br>
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs<br>
index 7ba8c23..bb203e2 100644<br>
--- a/hw/timer/Makefile.objs<br>
+++ b/hw/timer/Makefile.objs<br>
@@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) +=3D imx_epit.o<br>
=C2=A0common-obj-$(CONFIG_IMX) +=3D imx_gpt.o<br>
=C2=A0common-obj-$(CONFIG_LM32) +=3D lm32_timer.o<br>
=C2=A0common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o<br>
+common-obj-$(CONFIG_ARM_<wbr>TIMER) +=3D arm_generic_timer.o<br>
<br>
=C2=A0obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o<br>
=C2=A0obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o<br>
diff --git a/hw/timer/arm_generic_timer.c b/hw/timer/arm_generic_timer.c<br=
>
new file mode 100644<br>
index 0000000..da434a7<br>
--- /dev/null<br>
+++ b/hw/timer/arm_generic_timer.c<br>
@@ -0,0 +1,205 @@<br>
+/*<br>
+ * QEMU model of the ARM Generic Timer<br>
+ *<br>
+ * Copyright (c) 2016 Xilinx Inc.<br>
+ * Written by Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xili=
nx.com">alistair.francis@xilinx.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/timer/arm_generic_timer.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+<br>
+#ifndef ARM_GEN_TIMER_ERR_DEBUG<br>
+#define ARM_GEN_TIMER_ERR_DEBUG 0<br>
+#endif<br>
+<br>
+static void counter_control_postw(<wbr>RegisterInfo *reg, uint64_t val64)<=
br>
+{<br>
+=C2=A0 =C2=A0 ARMGenTimer *s =3D ARM_GEN_TIMER(reg-&gt;opaque);<br>
+=C2=A0 =C2=A0 bool new_status =3D extract32(s-&gt;regs[R_CNTCR],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 R_CNTCR_EN_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 R_CNTCR_EN_LENGTH);<br>
+=C2=A0 =C2=A0 uint64_t current_ticks;<br>
+<br>
+=C2=A0 =C2=A0 current_ticks =3D muldiv64(qemu_clock_get_us(<wbr>QEMU_CLOCK=
_VIRTUAL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND, 1000000);<br>
+<br>
+=C2=A0 =C2=A0 if ((s-&gt;enabled &amp;&amp; !new_status) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (!s-&gt;enabled &amp;&amp; new_status)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The timer is being disabled or enabled */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;tick_offset =3D current_ticks - s-&gt;ti=
ck_offset;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;enabled =3D new_status;<br>
+}<br>
+<br>
+static uint64_t counter_value_postr(<wbr>RegisterInfo *reg)<br>
+{<br>
+=C2=A0 =C2=A0 ARMGenTimer *s =3D ARM_GEN_TIMER(reg-&gt;opaque);<br>
+=C2=A0 =C2=A0 uint64_t current_ticks, total_ticks;<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 current_ticks =3D muldiv64(qemu_clock_get_us(<=
wbr>QEMU_CLOCK_VIRTUAL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND, 100000=
0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_ticks =3D current_ticks - s-&gt;tick_off=
set;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Timer is disabled, return the time when it =
was disabled */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_ticks =3D s-&gt;tick_offset;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return total_ticks;<br>
+}<br>
+<br>
+static uint64_t counter_low_value_postr(<wbr>RegisterInfo *reg, uint64_t v=
al64)<br>
+{<br>
+=C2=A0 =C2=A0 return (uint32_t) counter_value_postr(reg);<br>
+}<br>
+<br>
+static uint64_t counter_high_value_postr(<wbr>RegisterInfo *reg, uint64_t =
val64)<br>
+{<br>
+=C2=A0 =C2=A0 return (uint32_t) (counter_value_postr(reg) &gt;&gt; 32);<br=
>
+}<br>
+<br>
+static RegisterAccessInfo arm_gen_timer_regs_info[] =3D {<br>
+=C2=A0 =C2=A0 {=C2=A0 =C2=A0.name =3D &quot;CNTCR&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D A_CNTCR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .rsvd =3D 0xfffffffc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .post_write =3D counter_control_postw,<br>
+=C2=A0 =C2=A0 },{ .name =3D &quot;CNTSR&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D A_CNTSR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .rsvd =3D 0xfffffffd, .ro =3D 0x2,<br>
+=C2=A0 =C2=A0 },{ .name =3D &quot;CNTCV_LOWER&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D A_CNTCV_LOWER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .post_read =3D counter_low_value_postr,<br>
+=C2=A0 =C2=A0 },{ .name =3D &quot;CNTCV_UPPER&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D A_CNTCV_UPPER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .post_read =3D counter_high_value_postr,<br>
+=C2=A0 =C2=A0 },{ .name =3D &quot;CNTFID0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D A_CNTFID0,<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* We don&#39;t model CNTFIDn */<br>
+=C2=A0 =C2=A0 /* We don&#39;t model the CounterID registers either */<br>
+};<br>
+<br>
+static void arm_gen_timer_reset(<wbr>DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 ARMGenTimer *s =3D ARM_GEN_TIMER(dev);<br>
+=C2=A0 =C2=A0 unsigned int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;regs_info); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 register_reset(&amp;s-&gt;regs_info[<wbr>i]);<=
br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;tick_offset =3D 0;<br>
+=C2=A0 =C2=A0 s-&gt;enabled =3D false;<br>
+}<br>
+<br>
+static MemTxResult arm_gen_timer_read(void *opaque,=C2=A0 hwaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *data,=
 unsigned size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemTxAttrs attr=
s)<br>
+{<br>
+=C2=A0 =C2=A0 /* Reads are always supported, just blindly pass them throug=
h */<br>
+=C2=A0 =C2=A0 *data =3D register_read_memory(opaque, addr, size);<br>
+<br>
+=C2=A0 =C2=A0 return MEMTX_OK;<br>
+}<br>
+<br>
+static MemTxResult arm_gen_timer_write(void *opaque, hwaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t =
data, unsigned size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxAttr=
s attrs)<br>
+{<br>
+=C2=A0 =C2=A0 /* Block insecure writes */<br>
+=C2=A0 =C2=A0 if (!attrs.secure) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Non secure writes to the system timestamp generator &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;are invalid\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MEMTX_ERROR;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 register_write_memory(opaque, addr, data, size);<br>
+<br>
+=C2=A0 =C2=A0 return MEMTX_OK;<br>
+}<br>
+<br>
+static const MemoryRegionOps arm_gen_timer_ops =3D {<br>
+=C2=A0 =C2=A0 .read_with_attrs =3D arm_gen_timer_read,<br>
+=C2=A0 =C2=A0 .write_with_attrs =3D arm_gen_timer_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_arm_gen_timer =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_ARM_GEN_TIMER,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, ARMGenTimer, R_ARM_=
GEN_TIMER_MAX),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void arm_gen_timer_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 ARMGenTimer *s =3D ARM_GEN_TIMER(obj);<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
+=C2=A0 =C2=A0 RegisterInfoArray *reg_array;<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;<wbr>iomem, obj, &amp;arm_g=
en_timer_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_ARM_GEN_TIMER, R_ARM_GEN_TIMER_MAX * 4);<br>
+=C2=A0 =C2=A0 reg_array =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 register_init_block32(DEVICE(<wbr>obj), arm_ge=
n_timer_regs_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARRAY_SIZE(arm_gen_timer_regs_<wbr>info),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs_info, s-&gt;regs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;arm_gen_timer_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARM_GEN_TIMER_ERR_DEBUG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 R_ARM_GEN_TIMER_MAX * 4);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(&amp;<wbr>s-&gt;iomem,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A_CNTCR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;reg_array-&gt;mem);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
+}<br>
+<br>
+static void arm_gen_timer_class_init(<wbr>ObjectClass *klass, void *data)<=
br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D arm_gen_timer_reset;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_arm_gen_timer;<br>
+}<br>
+<br>
+static const TypeInfo arm_gen_timer_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_ARM_GEN_TIM=
ER,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(ARMGenTimer),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D arm_gen_timer_class_init,<br>
+=C2=A0 =C2=A0 .instance_init =3D arm_gen_timer_init,<br>
+};<br>
+<br>
+static void arm_gen_timer_register_types(<wbr>void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;arm_gen_<wbr>timer_info);<br>
+}<br>
+<br>
+type_init(arm_gen_timer_<wbr>register_types)<br>
diff --git a/include/hw/timer/arm_<wbr>generic_timer.h b/include/hw/timer/a=
rm_<wbr>generic_timer.h<br>
new file mode 100644<br>
index 0000000..ae4319c<br>
--- /dev/null<br>
+++ b/include/hw/timer/arm_<wbr>generic_timer.h<br>
@@ -0,0 +1,62 @@<br>
+/*<br>
+ * QEMU model of the ARM Generic Timer<br>
+ *<br>
+ * Copyright (c) 2016 Xilinx Inc.<br>
+ * Written by Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xili=
nx.com">alistair.francis@xilinx.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#ifndef ARM_GEN_TIMER_H<br>
+#define ARM_GEN_TIMER_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/register.h&quot;<br>
+<br>
+#define TYPE_ARM_GEN_TIMER &quot;arm.generic-timer&quot;<br>
+#define ARM_GEN_TIMER(obj) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECT_CHECK(ARMGenTimer, (obj),=
 TYPE_ARM_GEN_TIMER)<br>
+<br>
+REG32(CNTCR, 0x00)<br>
+=C2=A0 =C2=A0 FIELD(CNTCR, EN, 0, 1)<br>
+=C2=A0 =C2=A0 FIELD(CNTCR, HDBG, 1, 1)<br>
+REG32(CNTSR, 0x04)<br>
+=C2=A0 =C2=A0 FIELD(CNTSR, DBGH, 1, 1)<br>
+REG32(CNTCV_LOWER, 0x08)<br>
+REG32(CNTCV_UPPER, 0x0C)<br>
+REG32(CNTFID0, 0x20)<br>
+/* We don&#39;t model CNTFIDn */<br>
+/* We don&#39;t model the CounterID registers either */<br>
+<br>
+#define R_ARM_GEN_TIMER_MAX (R_CNTFID0 + 1)<br>
+<br>
+typedef struct ARMGenTimer {<br>
+=C2=A0 =C2=A0 /* &lt;private&gt; */<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+<br>
+=C2=A0 =C2=A0 /* &lt;public&gt; */<br>
+=C2=A0 =C2=A0 bool enabled;<br>
+=C2=A0 =C2=A0 uint64_t tick_offset;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t regs[R_ARM_GEN_TIMER_MAX];<br>
+=C2=A0 =C2=A0 RegisterInfo regs_info[R_ARM_GEN_TIMER_MAX]<wbr>;<br>
+} ARMGenTimer;<br>
+<br>
+#endif<br>
--<br>
2.7.4<br>
<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Subject: Digest Footer<br>
<br>
______________________________<wbr>_________________<br>
Qemu-arm mailing list<br>
<a href=3D"mailto:Qemu-arm@nongnu.org">Qemu-arm@nongnu.org</a><br>
<a href=3D"https://lists.nongnu.org/mailman/listinfo/qemu-arm" rel=3D"noref=
errer" target=3D"_blank">https://lists.nongnu.org/<wbr>mailman/listinfo/qem=
u-arm</a><br>
<br>
<br>
------------------------------<br>
<br>
End of Qemu-arm Digest, Vol 15, Issue 76<br>
******************************<wbr>**********<br>
</blockquote></div><br></div>

--047d7b5d403e24c4d6054427e456--
