Received: by 10.28.173.206 with SMTP id w197csp4095871wme;
        Tue, 16 Jan 2018 07:43:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBotEg4fdQorufjhRuqYkdhFIck3tuR0p6yW1TYsPFAn7YyaCiCpi6ZCduDr53ttpp0bIgjVm
X-Received: by 10.129.4.207 with SMTP id 198mr7334100ywe.494.1516117405924;
        Tue, 16 Jan 2018 07:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516117405; cv=none;
        d=google.com; s=arc-20160816;
        b=d+s7H+B1kqgBdEu5d23rMPMICA2RRNQ89fN5ISRpeE3d1lq+qSiwuu0QZxX+2exhN/
         /ql61gvQcvy79Dt0F128Dm7bnCNzaG1hcHJLoqu4wM68pw65niZukC2ZJPLV/U1KFZKF
         f14JoBM1kSlLPRgLSfrYkWWR+OLhMbhCXUgU72PXvJVtxzKZ0ONMiB65nZKch1WY44AM
         zvm7SmsvajDkBqhk5xny5YNhAnqDFqtbTKl+lAF/ZfxgRhCcpBQkvWkNNt8awrTYmEMT
         GvkW386TJVNtMWa1Mc8IJ6LsnBgZmGZD+AjLsqfZV7QNH0I8L/VDtiFowWgDD4R9AW0s
         x9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Th5HN/FRE7MGsxoZ3jmxP2lWKqGWnFAgBq+GF2ksGWU=;
        b=g7YDTcQuiPH17mAYcCC9u9YnI+LoNklDQDzi63jd2/27qf5oeI1jUZ9VUVX2nNXzjq
         8S3yNNnJzMZ7Iop57ewR3lNOIfGDl6sDVbAAmHoogsORYBhRhf53ASM/vwusQGZW8Y1V
         r2OhygugbN1MSbjTML02PLeiAjwA6D7deTVeFV2fYDjwpnADa7bDvUSMZeqtrfqlQ+0h
         gcRC2dye4xxupsnD7Ulbx1+8/4qFf3eh3mayxQe5Vc9/DS/HGApUKlMlxwfIBfDFVHgr
         He96cPYkHxms0R4Knm9Qdn/8pt6tdMwwJ0va4ExsFHetVheevktYOfs3Y6Wvck6qZ+xl
         TL4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fAv4+VOS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r128si628680ywf.137.2018.01.16.07.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fAv4+VOS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTOX-0003qX-B0
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:43:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebSoP-0001fE-CM
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:06:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebSoJ-0006fi-Gw
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:06:05 -0500
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:47090)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebSoJ-0006fI-CN; Tue, 16 Jan 2018 10:05:59 -0500
Received: by mail-qk0-x22a.google.com with SMTP id l64so21114446qke.13;
	Tue, 16 Jan 2018 07:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Th5HN/FRE7MGsxoZ3jmxP2lWKqGWnFAgBq+GF2ksGWU=;
	b=fAv4+VOSOja48q4lFaWbYHAbX080Sa4VVeoHnc6xkUNMuiAhgXVy7ff+hvHTUB5RtD
	v8bfQIX4EALqLx2JONiId0KVJv8OZk7H8CN9VmHDMxSJRIkM7dN0XKKSqOYzq/ShUn2y
	nYbH8bNnTB7i6y2y5NJTg086bOHqHrpTICsYYi7WsbK2W90v2+DHLyHG3WSZu3r854b/
	SLbTpEkUdzZP+fA1bXAZQk3sxuvFH/LuYnks6G046sBK9nznDPob4/gYqAnLJ82up+P8
	174ODxIm46lGHT43pIqahl2xF+j8BxAY1Qu1NlC2uvhVaujmwnvVa/nOlz+lqQILdRVq
	y7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Th5HN/FRE7MGsxoZ3jmxP2lWKqGWnFAgBq+GF2ksGWU=;
	b=PptimZZhswMYDNNZFyojb1lri2L3M+dxBJNWQ65Vl+ogtpaFK+i/JrXlzy1LOgPL7F
	ee6CZAZND5zwvZYMSgAnBITNaKUnAMRBa7D3G9OVPXAqp5eXabWYfmB3YmD8/jOI2Hrn
	6PYWiVU+4KNJOnFzUaVnauSk7L+FlAGpZtfXItNdGxySKTkx46CgX4k9r2KfwphO0Thu
	JMz8oXQr8wyL/+CXbLiLj+pe/OmTvk1BAdZSUlkYA/7os+MFEsqE5AaLXg5CTPdEfks7
	QHjYxtTiCqaD0XtbtjZRVdhkSZTJkyjyJyqkhQD5D9OZJTWvSrIDuqQLgvI6/jJWvhY2
	UTow==
X-Gm-Message-State: AKwxytfxU8/0iTxnkh9AYl0a/NSuRVQ3KcIsWhiEkiHwBovvH+W5ldNE
	YLVWhr+Mr1HKbt1R2mTLsPzYMBS4eK3jxrt8KCI=
X-Received: by 10.55.215.20 with SMTP id m20mr54092451qki.60.1516115158647;
	Tue, 16 Jan 2018 07:05:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.39 with HTTP; Tue, 16 Jan 2018 07:05:58 -0800 (PST)
In-Reply-To: <ebab631b-7d14-dd9a-8e81-e76830bfda02@amsat.org>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-9-andrew.smirnov@gmail.com>
	<ebab631b-7d14-dd9a-8e81-e76830bfda02@amsat.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 16 Jan 2018 07:05:58 -0800
Message-ID: <CAHQ1cqFKMoearUuvpEciu8ZnNbWQF1A8CR9KXL=sxRy0MVxGLA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: Re: [Qemu-arm] [PATCH v4 08/14] i.MX: Add implementation of i.MX7
 GPR IP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JErMY0pOXONi

On Mon, Jan 15, 2018 at 8:45 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 01/15/2018 10:37 PM, Andrey Smirnov wrote:
>> Add minimal code needed to allow upstream Linux guest to boot.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/misc/Makefile.objs      |   1 +
>>  hw/misc/imx7_gpr.c         | 119 ++++++++++++++++++++++++++++++++++++++=
+++++++
>>  include/hw/misc/imx7_gpr.h |  28 +++++++++++
>>  3 files changed, 148 insertions(+)
>>  create mode 100644 hw/misc/imx7_gpr.c
>>  create mode 100644 include/hw/misc/imx7_gpr.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 019886912c..fce426eb75 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -36,6 +36,7 @@ obj-$(CONFIG_IMX) +=3D imx6_src.o
>>  obj-$(CONFIG_IMX) +=3D imx7_ccm.o
>>  obj-$(CONFIG_IMX) +=3D imx2_wdt.o
>>  obj-$(CONFIG_IMX) +=3D imx7_snvs.o
>> +obj-$(CONFIG_IMX) +=3D imx7_gpr.o
>>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
>>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
>>  obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
>> diff --git a/hw/misc/imx7_gpr.c b/hw/misc/imx7_gpr.c
>> new file mode 100644
>> index 0000000000..9e8ccea9e8
>> --- /dev/null
>> +++ b/hw/misc/imx7_gpr.c
>> @@ -0,0 +1,119 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * i.MX7 GPR IP block emulation code
>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
>> + * See the COPYING file in the top-level directory.
>> + *
>> + * Bare minimum emulation code needed to support being able to shut
>> + * down linux guest gracefully.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/misc/imx7_gpr.h"
>> +#include "qemu/log.h"
>> +#include "sysemu/sysemu.h"
>> +
>> +enum IMX7GPRRegisters {
>> +    IOMUXC_GPR0  =3D 0x00,
>> +    IOMUXC_GPR1  =3D 0x04,
>> +    IOMUXC_GPR2  =3D 0x08,
>> +    IOMUXC_GPR3  =3D 0x0c,
>> +    IOMUXC_GPR4  =3D 0x10,
>> +    IOMUXC_GPR5  =3D 0x14,
>> +    IOMUXC_GPR6  =3D 0x18,
>> +    IOMUXC_GPR7  =3D 0x1c,
>> +    IOMUXC_GPR8  =3D 0x20,
>> +    IOMUXC_GPR9  =3D 0x24,
>> +    IOMUXC_GPR10 =3D 0x28,
>> +    IOMUXC_GPR11 =3D 0x2c,
>> +    IOMUXC_GPR12 =3D 0x30,
>> +    IOMUXC_GPR13 =3D 0x34,
>> +    IOMUXC_GPR14 =3D 0x38,
>> +    IOMUXC_GPR15 =3D 0x3c,
>> +    IOMUXC_GPR16 =3D 0x40,
>> +    IOMUXC_GPR17 =3D 0x44,
>> +    IOMUXC_GPR18 =3D 0x48,
>> +    IOMUXC_GPR19 =3D 0x4c,
>> +    IOMUXC_GPR20 =3D 0x50,
>> +    IOMUXC_GPR21 =3D 0x54,
>> +    IOMUXC_GPR22 =3D 0x58,
>> +};
>> +
>> +#define IMX7D_GPR1_IRQ_MASK                 BIT(12)
>> +#define IMX7D_GPR1_ENET1_TX_CLK_SEL_MASK    BIT(13)
>> +#define IMX7D_GPR1_ENET2_TX_CLK_SEL_MASK    BIT(14)
>> +#define IMX7D_GPR1_ENET_TX_CLK_SEL_MASK     (0x3 << 13)
>> +#define IMX7D_GPR1_ENET1_CLK_DIR_MASK       BIT(17)
>> +#define IMX7D_GPR1_ENET2_CLK_DIR_MASK       BIT(18)
>> +#define IMX7D_GPR1_ENET_CLK_DIR_MASK        (0x3 << 17)
>> +
>> +#define IMX7D_GPR5_CSI_MUX_CONTROL_MIPI     BIT(4)
>> +#define IMX7D_GPR12_PCIE_PHY_REFCLK_SEL     BIT(5)
>> +#define IMX7D_GPR22_PCIE_PHY_PLL_LOCKED     BIT(31)
>> +
>> +
>> +static uint64_t imx7_gpr_read(void *opaque, hwaddr offset, unsigned siz=
e)
>> +{
>> +    if (offset =3D=3D IOMUXC_GPR22) {
>> +        return IMX7D_GPR22_PCIE_PHY_PLL_LOCKED;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void imx7_gpr_write(void *opaque, hwaddr offset,
>> +                           uint64_t v, unsigned size)
>> +{
>
> If you ever respin, please add a trace point here (just copy/paste from
> another file from the same directory), and in the read() function.
>
> Linux will evolve and use more registers from this device (and the other
> devices you are modelling), and a Linux driver busy loop is likely to
> hang QEMU. A trace event will ease your board next user soon :)
>

Sure, will do.

Thanks,
Andrey Smirnov
