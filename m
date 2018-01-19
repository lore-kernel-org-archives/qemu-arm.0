Received: by 10.28.71.27 with SMTP id u27csp1048308wma;
        Fri, 19 Jan 2018 10:12:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBosaBwmHlIZG3dLU+GcMZVGRyfjzA8ePap2nhcI5xbN5ymYniN0295S6J2wRGaSEQoWOuypg
X-Received: by 10.13.197.193 with SMTP id h184mr10506909ywd.514.1516385567100;
        Fri, 19 Jan 2018 10:12:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516385567; cv=none;
        d=google.com; s=arc-20160816;
        b=gBc0hV86oF19D48/1PJVIVEAiV6y67S+Caub5UBFxhcVB86XbdU1Ym0m9JN6bN6iY+
         lVUNWLE+x3u9qFyUcL1Hkgz/n7EP3NOUrUWoDEyakG+wdVr1vwDOEAUKhoXTY8p1wf15
         b5dtMcJqQ6+lV+hKkrAEJmzNj4fBRswTWtBQwFSb3FEZOBJB8CsVEnDRt75VxNt++aXv
         ByRq26eXPW1WrNMSSLtNZGeNgKbSqB1VwYSXY481fsf3lvXqx2O/lsez7ONduoBPomHS
         hUiRDwWiwlJVQWhKUc+j+/6o5zuQH/meSqqlDIrpZ88B+PnfOWD3P84mEFjg/gMcvNDq
         iyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=H2aVhiHhqe9l5OPvrUyF/3vZh8TobHpwsRqgupWgc2c=;
        b=Dqg6D4wAzPdzABBqDAD7m+LmNQHcm0iHw7ZNu9E2z63Sr48gYP0NcYkAlvXadljUKd
         SY2lcyTISptz+wYXxYMFj7oLoQ6ACQvEpZB+wEdnM/GduapKmA5PQtZOPnURH6LYDD4M
         E7g/pD++lXqgrwzLOUf3R1snSrJuwdJZrxZjrQzJ5DhX2yhym9KV76J8+gHbHrlEmwZ6
         +aE3ZWLo/BDfU9rY/TiC9rSd4u8cHqgmaeKqBEhEcTaHwK10ehDSNa/X0BZNevI2leZG
         hOrjuz5nzbhxC0MYtts0JNw7EHtJkDjOOymc4ghMsPOE+kw564h6O/fi3PacYOqUYU1O
         Pqew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qSttOE4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c12si717492ybm.548.2018.01.19.10.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 10:12:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qSttOE4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecb9i-0001K9-CF
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 13:12:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecb9V-0001HH-Hk
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 13:12:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecb9S-00031u-Dx
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 13:12:33 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecb9L-0002n6-Bc; Fri, 19 Jan 2018 13:12:23 -0500
Received: by mail-lf0-x241.google.com with SMTP id t79so3137661lfe.3;
	Fri, 19 Jan 2018 10:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=H2aVhiHhqe9l5OPvrUyF/3vZh8TobHpwsRqgupWgc2c=;
	b=qSttOE4h3H5dIFOFeEt561ObmWYUYWEFkvGMBUZ2PkY2OYOENTtnCAZ5OQNsDsDHsi
	NrrOEeJN+4Rw5OAlD9szxw4/yXuQG7djwiUvuFZT335Pq6j8HHMDP32vqZm7frxe41az
	/yZOmJkdUmwKh6jCHYxLm8IYqWO2c03pRDVFcfAcd6LONix1wgucovbRrrhRU1N5klgs
	uUC4+To2YzHq9dYDcrR2QNYJ3h6ilD4iUQOv+4iGCLBd5DheF21XfHvZp21dVWysIW+/
	yQycHjEh7Pre1JW1gZ+aPTs9mLJFmBqaPCgOy7UV/RhPz0VqTJIi6hSl9cThrPTjaV+N
	PGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=H2aVhiHhqe9l5OPvrUyF/3vZh8TobHpwsRqgupWgc2c=;
	b=AVxhc/3n7tHS1wl0kAtpRUWH/8OzbalxLzlm3sbX+6FM07b70MiJbMFXjas98FDjFa
	M9B5JLPiQbgBsy+TpjuVa2GflWk37Z2TZr3MEgoSNLJ7Y/+IzqB1HbZlh6qw1iMU3/bc
	Akod98DB/yVUV1zVj44j7CsjfsJUeBjYVLC1FXoqQM7XKMaXAIPSOLDgHjqtPIACs4Kq
	Ulz1rBzU47TSyndfWrIa174eZekJBtPd9Zt6z85YURbrKNB6a3c8gkK6d/V4Zv0lJZiL
	qZv6EH2oDWT9LgS1kjL1ZUZ+cpShpYB8IJJ6/ZBIl3So3oncxp5HBgD+JRJ42mKNPnQz
	kGJg==
X-Gm-Message-State: AKwxyteLt0ivDwuzqTqt3W7WM35KIw8yLShN638NNKSCvseyfENWtN2S
	pW7yWgzzkQXWjm/Lyz2azF2bJGB9TFCH5S9Yuf8=
X-Received: by 10.46.41.93 with SMTP id u90mr8756570lje.35.1516385541726; Fri,
	19 Jan 2018 10:12:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Fri, 19 Jan 2018 10:11:51 -0800 (PST)
In-Reply-To: <b3c2a434-754a-7285-f79b-1d22e0dd3b0a@amsat.org>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
	<406cec176afe5821bece00c94f1030948373d5c1.1516300623.git.alistair.francis@xilinx.com>
	<b3c2a434-754a-7285-f79b-1d22e0dd3b0a@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 19 Jan 2018 10:11:51 -0800
X-Google-Sender-Auth: iO2wlzs3Jmy_bVi85v8R0tjbLzw
Message-ID: <CAKmqyKPMQy15-+OLz_6iXc67Cp42QM_RP2t4Cceu-DcCK4ewZQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH v6 5/9] xlnx-pmu-iomod-intc: Add the PMU
 Interrupt controller
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WFFKcDAZYhWl

On Thu, Jan 18, 2018 at 1:29 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 01/18/2018 03:38 PM, Alistair Francis wrote:
>> Add the PMU IO Module Interrupt controller device.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> ---
>>
>>  default-configs/microblaze-softmmu.mak |   1 +
>>  include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
>>  hw/intc/xlnx-pmu-iomod-intc.c          | 554 ++++++++++++++++++++++++++=
+++++++
>
> Thanks for installing the git.orderfile :)
>
>>  hw/intc/Makefile.objs                  |   1 +
>>  4 files changed, 614 insertions(+)
>>  create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
>>  create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
>>
>> diff --git a/default-configs/microblaze-softmmu.mak b/default-configs/mi=
croblaze-softmmu.mak
>> index ce2630818a..7fca8e4c99 100644
>> --- a/default-configs/microblaze-softmmu.mak
>> +++ b/default-configs/microblaze-softmmu.mak
>> @@ -9,3 +9,4 @@ CONFIG_XILINX_SPI=3Dy
>>  CONFIG_XILINX_ETHLITE=3Dy
>>  CONFIG_SSI=3Dy
>>  CONFIG_SSI_M25P80=3Dy
>> +CONFIG_XLNX_ZYNQMP=3Dy
>> diff --git a/include/hw/intc/xlnx-pmu-iomod-intc.h b/include/hw/intc/xln=
x-pmu-iomod-intc.h
>> new file mode 100644
>> index 0000000000..3478d8cf6c
>> --- /dev/null
>> +++ b/include/hw/intc/xlnx-pmu-iomod-intc.h
>> @@ -0,0 +1,58 @@
>> +/*
>> + * QEMU model of Xilinx I/O Module Interrupt Controller
>> + *
>> + * Copyright (c) 2014 Xilinx Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
>> + * of this software and associated documentation files (the "Software")=
, to deal
>> + * in the Software without restriction, including without limitation th=
e rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or=
 sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be inclu=
ded in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALIN=
GS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef XLNX_PMU_IO_INTC_H
>> +#define XLNX_PMU_IO_INTC_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/register.h"
>> +
>> +#define TYPE_XLNX_PMU_IO_INTC "xlnx.pmu_io_intc"
>> +
>> +#define XLNX_PMU_IO_INTC(obj) \
>> +     OBJECT_CHECK(XlnxPMUIOIntc, (obj), TYPE_XLNX_PMU_IO_INTC)
>> +
>> +/* This is R_PIT3_CONTROL + 1 */
>> +#define XlnxPMUIOIntc_R_MAX (0x78 + 1)
>
> Good, I prefer this way, rather than having all the registers exposed in
> the header.
> Can you rename this with CAPS to stay consistent with the CODING_STYLE?
>
>> +
>> +typedef struct XlnxPMUIOIntc {
>> +    SysBusDevice parent_obj;
>> +    MemoryRegion iomem;
>> +
>> +    qemu_irq parent_irq;
>> +
>> +    struct {
>> +        uint32_t intr_size;
>> +        uint32_t level_edge;
>> +        uint32_t positive;
>> +    } cfg;
>> +
>> +    uint32_t irq_raw;
>> +
>> +    uint32_t regs[XlnxPMUIOIntc_R_MAX];
>> +    RegisterInfo regs_info[XlnxPMUIOIntc_R_MAX];
>> +} XlnxPMUIOIntc;
>> +
>> +#endif /* XLNX_PMU_IO_INTC_H */
>> diff --git a/hw/intc/xlnx-pmu-iomod-intc.c b/hw/intc/xlnx-pmu-iomod-intc=
.c
>> new file mode 100644
>> index 0000000000..1ce2f4fa6b
>> --- /dev/null
>> +++ b/hw/intc/xlnx-pmu-iomod-intc.c
>> @@ -0,0 +1,554 @@
>> +/*
>> + * QEMU model of Xilinx I/O Module Interrupt Controller
>> + *
>> + * Copyright (c) 2013 Xilinx Inc
>> + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> + * Written by Alistair Francis <alistair.francis@xilinx.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
>> + * of this software and associated documentation files (the "Software")=
, to deal
>> + * in the Software without restriction, including without limitation th=
e rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or=
 sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be inclu=
ded in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALIN=
GS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/register.h"
>> +#include "qemu/bitops.h"
>> +#include "qemu/log.h"
>> +#include "hw/intc/xlnx-pmu-iomod-intc.h"
>> +
>> +#ifndef XLNX_PMU_IO_INTC_ERR_DEBUG
>> +#define XLNX_PMU_IO_INTC_ERR_DEBUG 0
>> +#endif
>> +
>> +#define DB_PRINT_L(lvl, fmt, args...) do {\
>> +    if (XLNX_PMU_IO_INTC_ERR_DEBUG >=3D lvl) {\
>> +        qemu_log(TYPE_XLNX_PMU_IO_INTC ": %s:" fmt, __func__, ## args);=
\
>> +    } \
>> +} while (0)
>> +
>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> +
>> +REG32(IRQ_MODE, 0xc)
>> +REG32(GPO0, 0x10)
>> +    FIELD(GPO0, MAGIC_WORD_1, 24, 8)
>> +    FIELD(GPO0, MAGIC_WORD_2, 16, 8)
>> +    FIELD(GPO0, FT_INJECT_FAILURE, 13, 3)
>> +    FIELD(GPO0, DISABLE_RST_FTSM, 12, 1)
>> +    FIELD(GPO0, RST_FTSM, 11, 1)
>> +    FIELD(GPO0, CLR_FTSTS, 10, 1)
>> +    FIELD(GPO0, RST_ON_SLEEP, 9, 1)
>> +    FIELD(GPO0, DISABLE_TRACE_COMP, 8, 1)
>> +    FIELD(GPO0, PIT3_PRESCALE, 7, 1)
>> +    FIELD(GPO0, PIT2_PRESCALE, 5, 2)
>> +    FIELD(GPO0, PIT1_PRESCALE, 3, 2)
>> +    FIELD(GPO0, PIT0_PRESCALE, 1, 2)
>> +    FIELD(GPO0, DEBUG_REMAP, 0, 1)
>> +REG32(GPO1, 0x14)
>> +    FIELD(GPO1, MIO_5, 5, 1)
>> +    FIELD(GPO1, MIO_4, 4, 1)
>> +    FIELD(GPO1, MIO_3, 3, 1)
>> +    FIELD(GPO1, MIO_2, 2, 1)
>> +    FIELD(GPO1, MIO_1, 1, 1)
>> +    FIELD(GPO1, MIO_0, 0, 1)
>> +REG32(GPO2, 0x18)
>> +    FIELD(GPO2, DAP_RPU_WAKE_ACK, 9, 1)
>> +    FIELD(GPO2, DAP_FP_WAKE_ACK, 8, 1)
>> +    FIELD(GPO2, PS_STATUS, 7, 1)
>> +    FIELD(GPO2, PCAP_EN, 6, 1)
>> +REG32(GPO3, 0x1c)
>> +    FIELD(GPO3, PL_GPO_31, 31, 1)
>> +    FIELD(GPO3, PL_GPO_30, 30, 1)
>> +    FIELD(GPO3, PL_GPO_29, 29, 1)
>> +    FIELD(GPO3, PL_GPO_28, 28, 1)
>> +    FIELD(GPO3, PL_GPO_27, 27, 1)
>> +    FIELD(GPO3, PL_GPO_26, 26, 1)
>> +    FIELD(GPO3, PL_GPO_25, 25, 1)
>> +    FIELD(GPO3, PL_GPO_24, 24, 1)
>> +    FIELD(GPO3, PL_GPO_23, 23, 1)
>> +    FIELD(GPO3, PL_GPO_22, 22, 1)
>> +    FIELD(GPO3, PL_GPO_21, 21, 1)
>> +    FIELD(GPO3, PL_GPO_20, 20, 1)
>> +    FIELD(GPO3, PL_GPO_19, 19, 1)
>> +    FIELD(GPO3, PL_GPO_18, 18, 1)
>> +    FIELD(GPO3, PL_GPO_17, 17, 1)
>> +    FIELD(GPO3, PL_GPO_16, 16, 1)
>> +    FIELD(GPO3, PL_GPO_15, 15, 1)
>> +    FIELD(GPO3, PL_GPO_14, 14, 1)
>> +    FIELD(GPO3, PL_GPO_13, 13, 1)
>> +    FIELD(GPO3, PL_GPO_12, 12, 1)
>> +    FIELD(GPO3, PL_GPO_11, 11, 1)
>> +    FIELD(GPO3, PL_GPO_10, 10, 1)
>> +    FIELD(GPO3, PL_GPO_9, 9, 1)
>> +    FIELD(GPO3, PL_GPO_8, 8, 1)
>> +    FIELD(GPO3, PL_GPO_7, 7, 1)
>> +    FIELD(GPO3, PL_GPO_6, 6, 1)
>> +    FIELD(GPO3, PL_GPO_5, 5, 1)
>> +    FIELD(GPO3, PL_GPO_4, 4, 1)
>> +    FIELD(GPO3, PL_GPO_3, 3, 1)
>> +    FIELD(GPO3, PL_GPO_2, 2, 1)
>> +    FIELD(GPO3, PL_GPO_1, 1, 1)
>> +    FIELD(GPO3, PL_GPO_0, 0, 1)
>> +REG32(GPI0, 0x20)
>> +    FIELD(GPI0, RFT_ECC_FATAL_ERR, 31, 1)
>> +    FIELD(GPI0, RFT_VOTER_ERR, 30, 1)
>> +    FIELD(GPI0, RFT_COMPARE_ERR_23, 29, 1)
>> +    FIELD(GPI0, RFT_COMPARE_ERR_13, 28, 1)
>> +    FIELD(GPI0, RFT_COMPARE_ERR_12, 27, 1)
>> +    FIELD(GPI0, RFT_LS_MISMATCH_23_B, 26, 1)
>> +    FIELD(GPI0, RFT_LS_MISMATCH_13_B, 25, 1)
>> +    FIELD(GPI0, RFT_LS_MISMATCH_12_B, 24, 1)
>> +    FIELD(GPI0, RFT_MISMATCH_STATE, 23, 1)
>> +    FIELD(GPI0, RFT_MISMATCH_CPU, 22, 1)
>> +    FIELD(GPI0, RFT_SLEEP_RESET, 19, 1)
>> +    FIELD(GPI0, RFT_LS_MISMATCH_23_A, 18, 1)
>> +    FIELD(GPI0, RFT_LS_MISMATCH_13_A, 17, 1)
>> +    FIELD(GPI0, RFT_LS_MISMATCH_12_A, 16, 1)
>> +    FIELD(GPI0, NFT_ECC_FATAL_ERR, 15, 1)
>> +    FIELD(GPI0, NFT_VOTER_ERR, 14, 1)
>> +    FIELD(GPI0, NFT_COMPARE_ERR_23, 13, 1)
>> +    FIELD(GPI0, NFT_COMPARE_ERR_13, 12, 1)
>> +    FIELD(GPI0, NFT_COMPARE_ERR_12, 11, 1)
>> +    FIELD(GPI0, NFT_LS_MISMATCH_23_B, 10, 1)
>> +    FIELD(GPI0, NFT_LS_MISMATCH_13_B, 9, 1)
>> +    FIELD(GPI0, NFT_LS_MISMATCH_12_B, 8, 1)
>> +    FIELD(GPI0, NFT_MISMATCH_STATE, 7, 1)
>> +    FIELD(GPI0, NFT_MISMATCH_CPU, 6, 1)
>> +    FIELD(GPI0, NFT_SLEEP_RESET, 3, 1)
>> +    FIELD(GPI0, NFT_LS_MISMATCH_23_A, 2, 1)
>> +    FIELD(GPI0, NFT_LS_MISMATCH_13_A, 1, 1)
>> +    FIELD(GPI0, NFT_LS_MISMATCH_12_A, 0, 1)
>> +REG32(GPI1, 0x24)
>> +    FIELD(GPI1, APB_AIB_ERROR, 31, 1)
>> +    FIELD(GPI1, AXI_AIB_ERROR, 30, 1)
>> +    FIELD(GPI1, ERROR_2, 29, 1)
>> +    FIELD(GPI1, ERROR_1, 28, 1)
>> +    FIELD(GPI1, ACPU_3_DBG_PWRUP, 23, 1)
>> +    FIELD(GPI1, ACPU_2_DBG_PWRUP, 22, 1)
>> +    FIELD(GPI1, ACPU_1_DBG_PWRUP, 21, 1)
>> +    FIELD(GPI1, ACPU_0_DBG_PWRUP, 20, 1)
>> +    FIELD(GPI1, FPD_WAKE_GIC_PROXY, 16, 1)
>> +    FIELD(GPI1, MIO_WAKE_5, 15, 1)
>> +    FIELD(GPI1, MIO_WAKE_4, 14, 1)
>> +    FIELD(GPI1, MIO_WAKE_3, 13, 1)
>> +    FIELD(GPI1, MIO_WAKE_2, 12, 1)
>> +    FIELD(GPI1, MIO_WAKE_1, 11, 1)
>> +    FIELD(GPI1, MIO_WAKE_0, 10, 1)
>> +    FIELD(GPI1, DAP_RPU_WAKE, 9, 1)
>> +    FIELD(GPI1, DAP_FPD_WAKE, 8, 1)
>> +    FIELD(GPI1, USB_1_WAKE, 7, 1)
>> +    FIELD(GPI1, USB_0_WAKE, 6, 1)
>> +    FIELD(GPI1, R5_1_WAKE, 5, 1)
>> +    FIELD(GPI1, R5_0_WAKE, 4, 1)
>> +    FIELD(GPI1, ACPU_3_WAKE, 3, 1)
>> +    FIELD(GPI1, ACPU_2_WAKE, 2, 1)
>> +    FIELD(GPI1, ACPU_1_WAKE, 1, 1)
>> +    FIELD(GPI1, ACPU_0_WAKE, 0, 1)
>> +REG32(GPI2, 0x28)
>> +    FIELD(GPI2, VCC_INT_FP_DISCONNECT, 31, 1)
>> +    FIELD(GPI2, VCC_INT_DISCONNECT, 30, 1)
>> +    FIELD(GPI2, VCC_AUX_DISCONNECT, 29, 1)
>> +    FIELD(GPI2, DBG_ACPU3_RST_REQ, 23, 1)
>> +    FIELD(GPI2, DBG_ACPU2_RST_REQ, 22, 1)
>> +    FIELD(GPI2, DBG_ACPU1_RST_REQ, 21, 1)
>> +    FIELD(GPI2, DBG_ACPU0_RST_REQ, 20, 1)
>> +    FIELD(GPI2, CP_ACPU3_RST_REQ, 19, 1)
>> +    FIELD(GPI2, CP_ACPU2_RST_REQ, 18, 1)
>> +    FIELD(GPI2, CP_ACPU1_RST_REQ, 17, 1)
>> +    FIELD(GPI2, CP_ACPU0_RST_REQ, 16, 1)
>> +    FIELD(GPI2, DBG_RCPU1_RST_REQ, 9, 1)
>> +    FIELD(GPI2, DBG_RCPU0_RST_REQ, 8, 1)
>> +    FIELD(GPI2, R5_1_SLEEP, 5, 1)
>> +    FIELD(GPI2, R5_0_SLEEP, 4, 1)
>> +    FIELD(GPI2, ACPU_3_SLEEP, 3, 1)
>> +    FIELD(GPI2, ACPU_2_SLEEP, 2, 1)
>> +    FIELD(GPI2, ACPU_1_SLEEP, 1, 1)
>> +    FIELD(GPI2, ACPU_0_SLEEP, 0, 1)
>> +REG32(GPI3, 0x2c)
>> +    FIELD(GPI3, PL_GPI_31, 31, 1)
>> +    FIELD(GPI3, PL_GPI_30, 30, 1)
>> +    FIELD(GPI3, PL_GPI_29, 29, 1)
>> +    FIELD(GPI3, PL_GPI_28, 28, 1)
>> +    FIELD(GPI3, PL_GPI_27, 27, 1)
>> +    FIELD(GPI3, PL_GPI_26, 26, 1)
>> +    FIELD(GPI3, PL_GPI_25, 25, 1)
>> +    FIELD(GPI3, PL_GPI_24, 24, 1)
>> +    FIELD(GPI3, PL_GPI_23, 23, 1)
>> +    FIELD(GPI3, PL_GPI_22, 22, 1)
>> +    FIELD(GPI3, PL_GPI_21, 21, 1)
>> +    FIELD(GPI3, PL_GPI_20, 20, 1)
>> +    FIELD(GPI3, PL_GPI_19, 19, 1)
>> +    FIELD(GPI3, PL_GPI_18, 18, 1)
>> +    FIELD(GPI3, PL_GPI_17, 17, 1)
>> +    FIELD(GPI3, PL_GPI_16, 16, 1)
>> +    FIELD(GPI3, PL_GPI_15, 15, 1)
>> +    FIELD(GPI3, PL_GPI_14, 14, 1)
>> +    FIELD(GPI3, PL_GPI_13, 13, 1)
>> +    FIELD(GPI3, PL_GPI_12, 12, 1)
>> +    FIELD(GPI3, PL_GPI_11, 11, 1)
>> +    FIELD(GPI3, PL_GPI_10, 10, 1)
>> +    FIELD(GPI3, PL_GPI_9, 9, 1)
>> +    FIELD(GPI3, PL_GPI_8, 8, 1)
>> +    FIELD(GPI3, PL_GPI_7, 7, 1)
>> +    FIELD(GPI3, PL_GPI_6, 6, 1)
>> +    FIELD(GPI3, PL_GPI_5, 5, 1)
>> +    FIELD(GPI3, PL_GPI_4, 4, 1)
>> +    FIELD(GPI3, PL_GPI_3, 3, 1)
>> +    FIELD(GPI3, PL_GPI_2, 2, 1)
>> +    FIELD(GPI3, PL_GPI_1, 1, 1)
>> +    FIELD(GPI3, PL_GPI_0, 0, 1)
>> +REG32(IRQ_STATUS, 0x30)
>> +    FIELD(IRQ_STATUS, CSU_PMU_SEC_LOCK, 31, 1)
>> +    FIELD(IRQ_STATUS, INV_ADDR, 29, 1)
>> +    FIELD(IRQ_STATUS, PWR_DN_REQ, 28, 1)
>> +    FIELD(IRQ_STATUS, PWR_UP_REQ, 27, 1)
>> +    FIELD(IRQ_STATUS, SW_RST_REQ, 26, 1)
>> +    FIELD(IRQ_STATUS, HW_RST_REQ, 25, 1)
>> +    FIELD(IRQ_STATUS, ISO_REQ, 24, 1)
>> +    FIELD(IRQ_STATUS, FW_REQ, 23, 1)
>> +    FIELD(IRQ_STATUS, IPI3, 22, 1)
>> +    FIELD(IRQ_STATUS, IPI2, 21, 1)
>> +    FIELD(IRQ_STATUS, IPI1, 20, 1)
>> +    FIELD(IRQ_STATUS, IPI0, 19, 1)
>> +    FIELD(IRQ_STATUS, RTC_ALARM, 18, 1)
>> +    FIELD(IRQ_STATUS, RTC_EVERY_SECOND, 17, 1)
>> +    FIELD(IRQ_STATUS, CORRECTABLE_ECC, 16, 1)
>> +    FIELD(IRQ_STATUS, GPI3, 14, 1)
>> +    FIELD(IRQ_STATUS, GPI2, 13, 1)
>> +    FIELD(IRQ_STATUS, GPI1, 12, 1)
>> +    FIELD(IRQ_STATUS, GPI0, 11, 1)
>> +    FIELD(IRQ_STATUS, PIT3, 6, 1)
>> +    FIELD(IRQ_STATUS, PIT2, 5, 1)
>> +    FIELD(IRQ_STATUS, PIT1, 4, 1)
>> +    FIELD(IRQ_STATUS, PIT0, 3, 1)
>> +REG32(IRQ_PENDING, 0x34)
>> +    FIELD(IRQ_PENDING, CSU_PMU_SEC_LOCK, 31, 1)
>> +    FIELD(IRQ_PENDING, INV_ADDR, 29, 1)
>> +    FIELD(IRQ_PENDING, PWR_DN_REQ, 28, 1)
>> +    FIELD(IRQ_PENDING, PWR_UP_REQ, 27, 1)
>> +    FIELD(IRQ_PENDING, SW_RST_REQ, 26, 1)
>> +    FIELD(IRQ_PENDING, HW_RST_REQ, 25, 1)
>> +    FIELD(IRQ_PENDING, ISO_REQ, 24, 1)
>> +    FIELD(IRQ_PENDING, FW_REQ, 23, 1)
>> +    FIELD(IRQ_PENDING, IPI3, 22, 1)
>> +    FIELD(IRQ_PENDING, IPI2, 21, 1)
>> +    FIELD(IRQ_PENDING, IPI1, 20, 1)
>> +    FIELD(IRQ_PENDING, IPI0, 19, 1)
>> +    FIELD(IRQ_PENDING, RTC_ALARM, 18, 1)
>> +    FIELD(IRQ_PENDING, RTC_EVERY_SECOND, 17, 1)
>> +    FIELD(IRQ_PENDING, CORRECTABLE_ECC, 16, 1)
>> +    FIELD(IRQ_PENDING, GPI3, 14, 1)
>> +    FIELD(IRQ_PENDING, GPI2, 13, 1)
>> +    FIELD(IRQ_PENDING, GPI1, 12, 1)
>> +    FIELD(IRQ_PENDING, GPI0, 11, 1)
>> +    FIELD(IRQ_PENDING, PIT3, 6, 1)
>> +    FIELD(IRQ_PENDING, PIT2, 5, 1)
>> +    FIELD(IRQ_PENDING, PIT1, 4, 1)
>> +    FIELD(IRQ_PENDING, PIT0, 3, 1)
>> +REG32(IRQ_ENABLE, 0x38)
>> +    FIELD(IRQ_ENABLE, CSU_PMU_SEC_LOCK, 31, 1)
>> +    FIELD(IRQ_ENABLE, INV_ADDR, 29, 1)
>> +    FIELD(IRQ_ENABLE, PWR_DN_REQ, 28, 1)
>> +    FIELD(IRQ_ENABLE, PWR_UP_REQ, 27, 1)
>> +    FIELD(IRQ_ENABLE, SW_RST_REQ, 26, 1)
>> +    FIELD(IRQ_ENABLE, HW_RST_REQ, 25, 1)
>> +    FIELD(IRQ_ENABLE, ISO_REQ, 24, 1)
>> +    FIELD(IRQ_ENABLE, FW_REQ, 23, 1)
>> +    FIELD(IRQ_ENABLE, IPI3, 22, 1)
>> +    FIELD(IRQ_ENABLE, IPI2, 21, 1)
>> +    FIELD(IRQ_ENABLE, IPI1, 20, 1)
>> +    FIELD(IRQ_ENABLE, IPI0, 19, 1)
>> +    FIELD(IRQ_ENABLE, RTC_ALARM, 18, 1)
>> +    FIELD(IRQ_ENABLE, RTC_EVERY_SECOND, 17, 1)
>> +    FIELD(IRQ_ENABLE, CORRECTABLE_ECC, 16, 1)
>> +    FIELD(IRQ_ENABLE, GPI3, 14, 1)
>> +    FIELD(IRQ_ENABLE, GPI2, 13, 1)
>> +    FIELD(IRQ_ENABLE, GPI1, 12, 1)
>> +    FIELD(IRQ_ENABLE, GPI0, 11, 1)
>> +    FIELD(IRQ_ENABLE, PIT3, 6, 1)
>> +    FIELD(IRQ_ENABLE, PIT2, 5, 1)
>> +    FIELD(IRQ_ENABLE, PIT1, 4, 1)
>> +    FIELD(IRQ_ENABLE, PIT0, 3, 1)
>> +REG32(IRQ_ACK, 0x3c)
>> +    FIELD(IRQ_ACK, CSU_PMU_SEC_LOCK, 31, 1)
>> +    FIELD(IRQ_ACK, INV_ADDR, 29, 1)
>> +    FIELD(IRQ_ACK, PWR_DN_REQ, 28, 1)
>> +    FIELD(IRQ_ACK, PWR_UP_REQ, 27, 1)
>> +    FIELD(IRQ_ACK, SW_RST_REQ, 26, 1)
>> +    FIELD(IRQ_ACK, HW_RST_REQ, 25, 1)
>> +    FIELD(IRQ_ACK, ISO_REQ, 24, 1)
>> +    FIELD(IRQ_ACK, FW_REQ, 23, 1)
>> +    FIELD(IRQ_ACK, IPI3, 22, 1)
>> +    FIELD(IRQ_ACK, IPI2, 21, 1)
>> +    FIELD(IRQ_ACK, IPI1, 20, 1)
>> +    FIELD(IRQ_ACK, IPI0, 19, 1)
>> +    FIELD(IRQ_ACK, RTC_ALARM, 18, 1)
>> +    FIELD(IRQ_ACK, RTC_EVERY_SECOND, 17, 1)
>> +    FIELD(IRQ_ACK, CORRECTABLE_ECC, 16, 1)
>> +    FIELD(IRQ_ACK, GPI3, 14, 1)
>> +    FIELD(IRQ_ACK, GPI2, 13, 1)
>> +    FIELD(IRQ_ACK, GPI1, 12, 1)
>> +    FIELD(IRQ_ACK, GPI0, 11, 1)
>> +    FIELD(IRQ_ACK, PIT3, 6, 1)
>> +    FIELD(IRQ_ACK, PIT2, 5, 1)
>> +    FIELD(IRQ_ACK, PIT1, 4, 1)
>> +    FIELD(IRQ_ACK, PIT0, 3, 1)
>> +REG32(PIT0_PRELOAD, 0x40)
>> +REG32(PIT0_COUNTER, 0x44)
>> +REG32(PIT0_CONTROL, 0x48)
>> +    FIELD(PIT0_CONTROL, PRELOAD, 1, 1)
>> +    FIELD(PIT0_CONTROL, EN, 0, 1)
>> +REG32(PIT1_PRELOAD, 0x50)
>> +REG32(PIT1_COUNTER, 0x54)
>> +REG32(PIT1_CONTROL, 0x58)
>> +    FIELD(PIT1_CONTROL, PRELOAD, 1, 1)
>> +    FIELD(PIT1_CONTROL, EN, 0, 1)
>> +REG32(PIT2_PRELOAD, 0x60)
>> +REG32(PIT2_COUNTER, 0x64)
>> +REG32(PIT2_CONTROL, 0x68)
>> +    FIELD(PIT2_CONTROL, PRELOAD, 1, 1)
>> +    FIELD(PIT2_CONTROL, EN, 0, 1)
>> +REG32(PIT3_PRELOAD, 0x70)
>> +REG32(PIT3_COUNTER, 0x74)
>> +REG32(PIT3_CONTROL, 0x78)
>> +    FIELD(PIT3_CONTROL, PRELOAD, 1, 1)
>> +    FIELD(PIT3_CONTROL, EN, 0, 1)
>> +
>> +static void xlnx_pmu_io_irq_update(XlnxPMUIOIntc *s)
>> +{
>> +    bool irq_out;
>> +
>> +    s->regs[R_IRQ_PENDING] =3D s->regs[R_IRQ_STATUS] & s->regs[R_IRQ_EN=
ABLE];
>> +    irq_out =3D !!s->regs[R_IRQ_PENDING];
>> +
>> +    DB_PRINT("Setting IRQ output =3D %d\n", irq_out);
>> +
>> +    qemu_set_irq(s->parent_irq, irq_out);
>> +}
>> +
>> +static void xlnx_pmu_io_irq_enable_postw(RegisterInfo *reg, uint64_t va=
l64)
>> +{
>> +    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(reg->opaque);
>> +
>> +    xlnx_pmu_io_irq_update(s);
>> +}
>> +
>> +static void xlnx_pmu_io_irq_ack_postw(RegisterInfo *reg, uint64_t val64=
)
>> +{
>> +    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(reg->opaque);
>> +    uint32_t val =3D val64;
>> +
>> +    /* Only clear */
>> +    val &=3D s->regs[R_IRQ_STATUS];
>> +    s->regs[R_IRQ_STATUS] ^=3D val;
>> +
>> +    /* Active level triggered interrupts stay high.  */
>> +    s->regs[R_IRQ_STATUS] |=3D s->irq_raw & ~s->cfg.level_edge;
>> +
>> +    xlnx_pmu_io_irq_update(s);
>> +}
>> +
>> +static const RegisterAccessInfo xlnx_pmu_io_intc_regs_info[] =3D {
>> +    {   .name =3D "IRQ_MODE",  .addr =3D A_IRQ_MODE,
>> +        .rsvd =3D 0xffffffff,
>> +    },{ .name =3D "GPO0",  .addr =3D A_GPO0,
>> +    },{ .name =3D "GPO1",  .addr =3D A_GPO1,
>> +        .rsvd =3D 0xffffffc0,
>> +    },{ .name =3D "GPO2",  .addr =3D A_GPO2,
>> +        .rsvd =3D 0xfffffc3f,
>> +    },{ .name =3D "GPO3",  .addr =3D A_GPO3,
>> +    },{ .name =3D "GPI0",  .addr =3D A_GPI0,
>> +        .rsvd =3D 0x300030,
>> +        .ro =3D 0xffcfffcf,
>> +    },{ .name =3D "GPI1",  .addr =3D A_GPI1,
>> +        .rsvd =3D 0xf0e0000,
>> +        .ro =3D 0xf0f1ffff,
>> +    },{ .name =3D "GPI2",  .addr =3D A_GPI2,
>> +        .rsvd =3D 0x1f00fcc0,
>> +        .ro =3D 0xe0ff033f,
>> +    },{ .name =3D "GPI3",  .addr =3D A_GPI3,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "IRQ_STATUS",  .addr =3D A_IRQ_STATUS,
>> +        .rsvd =3D 0x40008787,
>> +        .ro =3D 0xbfff7878,
>> +    },{ .name =3D "IRQ_PENDING",  .addr =3D A_IRQ_PENDING,
>> +        .rsvd =3D 0x40008787,
>> +        .ro =3D 0xdfff7ff8,
>> +    },{ .name =3D "IRQ_ENABLE",  .addr =3D A_IRQ_ENABLE,
>> +        .rsvd =3D 0x40008787,
>> +        .ro =3D 0x7800,
>> +        .post_write =3D xlnx_pmu_io_irq_enable_postw,
>> +    },{ .name =3D "IRQ_ACK",  .addr =3D A_IRQ_ACK,
>> +        .rsvd =3D 0x40008787,
>> +        .post_write =3D xlnx_pmu_io_irq_ack_postw,
>> +    },{ .name =3D "PIT0_PRELOAD",  .addr =3D A_PIT0_PRELOAD,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "PIT0_COUNTER",  .addr =3D A_PIT0_COUNTER,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "PIT0_CONTROL",  .addr =3D A_PIT0_CONTROL,
>> +        .rsvd =3D 0xfffffffc,
>> +    },{ .name =3D "PIT1_PRELOAD",  .addr =3D A_PIT1_PRELOAD,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "PIT1_COUNTER",  .addr =3D A_PIT1_COUNTER,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "PIT1_CONTROL",  .addr =3D A_PIT1_CONTROL,
>> +        .rsvd =3D 0xfffffffc,
>> +    },{ .name =3D "PIT2_PRELOAD",  .addr =3D A_PIT2_PRELOAD,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "PIT2_COUNTER",  .addr =3D A_PIT2_COUNTER,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "PIT2_CONTROL",  .addr =3D A_PIT2_CONTROL,
>> +        .rsvd =3D 0xfffffffc,
>> +    },{ .name =3D "PIT3_PRELOAD",  .addr =3D A_PIT3_PRELOAD,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "PIT3_COUNTER",  .addr =3D A_PIT3_COUNTER,
>> +        .ro =3D 0xffffffff,
>> +    },{ .name =3D "PIT3_CONTROL",  .addr =3D A_PIT3_CONTROL,
>> +        .rsvd =3D 0xfffffffc,
>> +    }
>> +};
>> +
>> +static void irq_handler(void *opaque, int irq, int level)
>> +{
>> +    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(opaque);
>> +    uint32_t mask =3D 1 << irq;
>> +    uint32_t prev =3D s->irq_raw;
>> +    uint32_t temp;
>> +
>> +    s->irq_raw &=3D ~mask;
>> +    s->irq_raw |=3D (!!level) << irq;
>> +
>> +    /* Turn active-low into active-high.  */
>> +    s->irq_raw ^=3D (~s->cfg.positive);
>> +    s->irq_raw &=3D mask;
>> +
>> +    if (s->cfg.level_edge & mask) {
>> +        /* Edge triggered.  */
>> +        temp =3D (prev ^ s->irq_raw) & s->irq_raw;
>> +    } else {
>> +        /* Level triggered.  */
>> +        temp =3D s->irq_raw;
>> +    }
>> +    s->regs[R_IRQ_STATUS] |=3D temp;
>> +
>> +    xlnx_pmu_io_irq_update(s);
>> +}
>> +
>> +static void xlnx_pmu_io_intc_reset(DeviceState *dev)
>> +{
>> +    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(dev);
>> +    unsigned int i;
>> +
>> +    for (i =3D 0; i < ARRAY_SIZE(s->regs_info); ++i) {
>> +        register_reset(&s->regs_info[i]);
>> +    }
>> +
>> +    xlnx_pmu_io_irq_update(s);
>> +}
>> +
>> +static const MemoryRegionOps xlnx_pmu_io_intc_ops =3D {
>> +    .read =3D register_read_memory,
>> +    .write =3D register_write_memory,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 4,
>> +        .max_access_size =3D 4,
>> +    },
>> +};
>> +
>> +static Property xlnx_pmu_io_intc_properties[] =3D {
>> +    DEFINE_PROP_UINT32("intc-intr-size", XlnxPMUIOIntc, cfg.intr_size, =
0),
>> +    DEFINE_PROP_UINT32("intc-level-edge", XlnxPMUIOIntc, cfg.level_edge=
, 0),
>> +    DEFINE_PROP_UINT32("intc-positive", XlnxPMUIOIntc, cfg.positive, 0)=
,
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void xlnx_pmu_io_intc_realize(DeviceState *dev, Error **errp)
>> +{
>> +    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(dev);
>> +
>> +    /* Internal interrupts are edge triggered?  */
>
> Is this an unresolved question?
>
>> +    s->cfg.level_edge <<=3D 16;
>> +    s->cfg.level_edge |=3D 0xffff;
>> +
>> +    /* Internal interrupts are postitive.  */
>
> positive
>
>> +    s->cfg.positive <<=3D 16;
>> +    s->cfg.positive |=3D 0xffff;
>> +
>> +    /* Max 16 external interrupts.  */
>> +    assert(s->cfg.intr_size <=3D 16);
>> +
>> +    qdev_init_gpio_in(dev, irq_handler, 16 + s->cfg.intr_size);
>> +}
>> +
>> +static void xlnx_pmu_io_intc_init(Object *obj)
>> +{
>> +    XlnxPMUIOIntc *s =3D XLNX_PMU_IO_INTC(obj);
>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
>> +    RegisterInfoArray *reg_array;
>> +
>> +    memory_region_init(&s->iomem, obj, TYPE_XLNX_PMU_IO_INTC,
>> +                       XlnxPMUIOIntc_R_MAX * 4);
>> +    reg_array =3D
>> +        register_init_block32(DEVICE(obj), xlnx_pmu_io_intc_regs_info,
>> +                              ARRAY_SIZE(xlnx_pmu_io_intc_regs_info),
>> +                              s->regs_info, s->regs,
>> +                              &xlnx_pmu_io_intc_ops,
>> +                              XLNX_PMU_IO_INTC_ERR_DEBUG,
>> +                              XlnxPMUIOIntc_R_MAX * 4);
>> +    memory_region_add_subregion(&s->iomem,
>> +                                0x0,
>> +                                &reg_array->mem);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +
>> +    sysbus_init_irq(sbd, &s->parent_irq);
>> +}
>> +
>> +static const VMStateDescription vmstate_xlnx_pmu_io_intc =3D {
>> +    .name =3D TYPE_XLNX_PMU_IO_INTC,
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, XlnxPMUIOIntc, XlnxPMUIOIntc_R_MAX),
>> +        VMSTATE_END_OF_LIST(),
>> +    }
>> +};
>> +
>> +static void xlnx_pmu_io_intc_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->reset =3D xlnx_pmu_io_intc_reset;
>> +    dc->realize =3D xlnx_pmu_io_intc_realize;
>> +    dc->vmsd =3D &vmstate_xlnx_pmu_io_intc;
>> +    dc->props =3D xlnx_pmu_io_intc_properties;
>> +}
>> +
>> +static const TypeInfo xlnx_pmu_io_intc_info =3D {
>> +    .name          =3D TYPE_XLNX_PMU_IO_INTC,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(XlnxPMUIOIntc),
>> +    .class_init    =3D xlnx_pmu_io_intc_class_init,
>> +    .instance_init =3D xlnx_pmu_io_intc_init,
>> +};
>> +
>> +static void xlnx_pmu_io_intc_register_types(void)
>> +{
>> +    type_register_static(&xlnx_pmu_io_intc_info);
>> +}
>> +
>> +type_init(xlnx_pmu_io_intc_register_types)
>> diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
>> index ae358569a1..211655023e 100644
>> --- a/hw/intc/Makefile.objs
>> +++ b/hw/intc/Makefile.objs
>> @@ -3,6 +3,7 @@ common-obj-$(CONFIG_I8259) +=3D i8259_common.o i8259.o
>>  common-obj-$(CONFIG_PL190) +=3D pl190.o
>>  common-obj-$(CONFIG_PUV3) +=3D puv3_intc.o
>>  common-obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
>> +common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-pmu-iomod-intc.o
>
> If you prefer to use CONFIG_XLNX_ZYNQMP_ARM for ARM, why not using
> CONFIG_XLNX_ZYNQMP_MB (or similar) here?

I have fixed all of your other comments.

Ideally we don't want to use CONFIG_XLNX_ZYNQMP_ARM but we have to in
order to avoid compilation issues (from memory the display port device
is always a problem). I'd rather not add another specific one unless
we have to.

Alistair

>
>>  common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
>>  common-obj-$(CONFIG_IMX) +=3D imx_avic.o
>>  common-obj-$(CONFIG_LM32) +=3D lm32_pic.o
>>
