Received: by 10.223.161.27 with SMTP id o27csp298775wro;
        Mon, 23 Oct 2017 14:45:47 -0700 (PDT)
X-Received: by 10.37.190.201 with SMTP id k9mr1582713ybm.68.1508795146942;
        Mon, 23 Oct 2017 14:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508795146; cv=none;
        d=google.com; s=arc-20160816;
        b=cNiPsmTYcox2jjyiZNOHheBDElWqzpscVSWnp0BiCPMwo8qnqYdD/s7GvKAe37SLzV
         WF0HY3m3mxhSzTwivt+mtgPUzNoSzR6aRE1VMbVz+CO15Q6mgWhhVSew8uhVV2fAhqLd
         IrHDrxNWMZmbend23qoAUvTmr9WhikrBx2ig9hPmIN8P+yBQUzx9acbCN+Yn9esalJyO
         IdJFuCoRROhV2bCarhcQQPFwEYpszpt4AaD+zG4J+SNXsGMdKjH+pSrewpQ+KyA+ZcMm
         DGshxrNIw9wIh3Gfevvi8UcemO4/eN6avP9ibgbpO2OJE1LRSLpQYBJsaeVItH+uMtN3
         lH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=/p2+4+Ln0kvngMfkZDym6T/nTCcZDrdfZXsfdMawVMs=;
        b=uZQiFCQjriflIM189M4K+Ncyt63/+mU8rl0o1sJPT7YkGBOJ+Lgs5V1kEInz5/EhQf
         UggV5P8SvK2qpRTJFNFId33AqkmG1qPRTZAzTH0uufmPsgrlFa6cW0iWv69dmA+r9NqS
         mj9p0dHmgn6Ipfw5Cvoe0Wvit/vJzpbc1YvCB8NtEWrUzpEd3rC4brgjWQaFtGIrblV1
         7YAb884Ai58r0W/P954ZmAYCjPfkmM/+IdXoXJx3muOm76PIDLU/CbAMwCQwvk1uLmVb
         3aI9a7W9vBP2Oi/nIzKU+THlOXYZPmRdcTOZ2lsQp+wGfZTkqdKWdBcjFYmjAErujA9L
         r3TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tyXyJdsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p19si1395350ywg.170.2017.10.23.14.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 14:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tyXyJdsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6kXZ-0005xe-GV
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 17:45:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kWe-0005KG-Kl
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 17:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kWd-0005Gt-0w
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 17:44:48 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:52761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kWX-0005EM-FV; Mon, 23 Oct 2017 17:44:41 -0400
Received: by mail-qt0-x243.google.com with SMTP id 31so28041507qtz.9;
	Mon, 23 Oct 2017 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/p2+4+Ln0kvngMfkZDym6T/nTCcZDrdfZXsfdMawVMs=;
	b=tyXyJdsTeAXKZlQo4WK2ca838n1feRDkOZ/XtvmW2eq6SAuAmjecogFauzaDiQwHHX
	1F4nAxvfsB9lTEgFYLVn117WKTZD1CEoA+kiWdmc8eUqOKN7F5y8WFgkxMQzC4STsY6z
	LLGEWbqH34uf/qNxPfLeKTrSM9GnTTSPv6cGjmGnbeorZINMuCZGmyqiTCDdFceyu0Cc
	lQh9Ztcbc75QJUMYhpRo7m33v0dx/MOR4uP+XQWinBvUH9lE5Y/5wFQSJLaxFS+wW7DO
	lNo+IX72bCzrWY6SamIrzL6Ha61JBxxMAnKbP/tiEHyPo/rr5un3yZcq4LRLt3T+SCHw
	9vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/p2+4+Ln0kvngMfkZDym6T/nTCcZDrdfZXsfdMawVMs=;
	b=eVvzAQzM9pc/eStWylLcyMTdHUpofErKLsE3cmvoa1GAOM0smf4bu1p9WA7OAmpM/7
	heCOH22giPSeEWGEURmW3THQg1FZB2qjsfPCz7RvPK0pyJCZNFFKVa2RJHcTldf6AO37
	BConLd7L+7HYmPdkOT2Feym96oKs3wyw07b7wodnvn8k8oUswFzVpFjSmz/agRkRoZdl
	XiMudCY20O76mINPTrK6e8UY1gB0AF4SRN4vuAq1A8YWlrRdKya6SSEwT4dawnyt2BEk
	Lpf6ZeySCyg5mpw4YfRFT3rCpW1lJS6GdWsm+Rv+5NZtqWZXYPqpJV2U8MQBY1VMyjkN
	dhrw==
X-Gm-Message-State: AMCzsaXobo550YrfzeQ+6xRLkZ6PVAThqF+yyM2N5wOyKSfhO0+HJc48
	n4BqRNyd2CQqqbjhIQo4hF4k9jaA
X-Google-Smtp-Source: ABhQp+QdOqr+5JyGyIOlmXkdZMu4eORQ1LjvxlkCAyp9IboMXeJ6f5Y6xqcLylOnjhfi1BiMmMUdRw==
X-Received: by 10.237.56.200 with SMTP id k66mr20636118qte.70.1508795080555;
	Mon, 23 Oct 2017 14:44:40 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id m63sm5262528qke.9.2017.10.23.14.44.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 14:44:39 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
References: <1508784509-29377-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <058f5cc2-ea09-0912-7425-e801cd32ab17@amsat.org>
Date: Mon, 23 Oct 2017 18:44:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508784509-29377-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH] hw/ide/ahci: Move allwinner code into a
 separate file
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A5FnYPMF6Olq

On 10/23/2017 03:48 PM, Thomas Huth wrote:
> The allwinner code is only needed for the allwinner board (for which
> we also have a separate CONFIG_ALLWINNER_A10 config switch), so it
> does not make sense that we compile this for all the other boards
> that need AHCI, too. Let's move it to a separate file that is only
> compiled when CONFIG_ALLWINNER_A10 is set.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/ide/Makefile.objs    |   1 +
>  hw/ide/ahci-allwinner.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/ide/ahci.c           |  95 ------------------------------------
>  3 files changed, 128 insertions(+), 95 deletions(-)
>  create mode 100644 hw/ide/ahci-allwinner.c
> 
> diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
> index 729e9bd..f0edca3 100644
> --- a/hw/ide/Makefile.objs
> +++ b/hw/ide/Makefile.objs
> @@ -10,3 +10,4 @@ common-obj-$(CONFIG_IDE_VIA) += via.o
>  common-obj-$(CONFIG_MICRODRIVE) += microdrive.o
>  common-obj-$(CONFIG_AHCI) += ahci.o
>  common-obj-$(CONFIG_AHCI) += ich.o
> +common-obj-$(CONFIG_ALLWINNER_A10) += ahci-allwinner.o
> diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
> new file mode 100644
> index 0000000..c3f1604
> --- /dev/null
> +++ b/hw/ide/ahci-allwinner.c
> @@ -0,0 +1,127 @@
> +/*
> + * QEMU Allwinner AHCI Emulation
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/hw.h"
> +#include "qemu/error-report.h"
> +#include "sysemu/block-backend.h"
> +#include "sysemu/dma.h"
> +#include "hw/ide/internal.h"
> +#include "hw/ide/ahci_internal.h"
> +
> +#include "trace.h"
> +
> +#define ALLWINNER_AHCI_BISTAFR    ((0xa0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_BISTCR     ((0xa4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_BISTFCTR   ((0xa8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_BISTSR     ((0xac - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_BISTDECR   ((0xb0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_DIAGNR0    ((0xb4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_DIAGNR1    ((0xb8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_OOBR       ((0xbc - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_PHYCS0R    ((0xc0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_PHYCS1R    ((0xc4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_PHYCS2R    ((0xc8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_TIMER1MS   ((0xe0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_GPARAM1R   ((0xe8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_GPARAM2R   ((0xec - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_PPARAMR    ((0xf0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_TESTR      ((0xf4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_VERSIONR   ((0xf8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_IDR        ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +#define ALLWINNER_AHCI_RWCR       ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
> +
> +static uint64_t allwinner_ahci_mem_read(void *opaque, hwaddr addr,
> +                                        unsigned size)
> +{
> +    AllwinnerAHCIState *a = opaque;
> +    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
> +    uint64_t val = a->regs[addr / 4];
> +
> +    switch (addr / 4) {
> +    case ALLWINNER_AHCI_PHYCS0R:
> +        val |= 0x2 << 28;
> +        break;
> +    case ALLWINNER_AHCI_PHYCS2R:
> +        val &= ~(0x1 << 24);
> +        break;
> +    }
> +    trace_allwinner_ahci_mem_read(s, a, addr, val, size);
> +    return  val;
> +}
> +
> +static void allwinner_ahci_mem_write(void *opaque, hwaddr addr,
> +                                     uint64_t val, unsigned size)
> +{
> +    AllwinnerAHCIState *a = opaque;
> +    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
> +
> +    trace_allwinner_ahci_mem_write(s, a, addr, val, size);
> +    a->regs[addr / 4] = val;
> +}
> +
> +static const MemoryRegionOps allwinner_ahci_mem_ops = {
> +    .read = allwinner_ahci_mem_read,
> +    .write = allwinner_ahci_mem_write,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void allwinner_ahci_init(Object *obj)
> +{
> +    SysbusAHCIState *s = SYSBUS_AHCI(obj);
> +    AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
> +
> +    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
> +                          "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
> +    memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
> +                                &a->mmio);
> +}
> +
> +static const VMStateDescription vmstate_allwinner_ahci = {
> +    .name = "allwinner-ahci",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AllwinnerAHCIState,
> +                             ALLWINNER_AHCI_MMIO_SIZE / 4),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_ahci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_allwinner_ahci;
> +}
> +
> +static const TypeInfo allwinner_ahci_info = {
> +    .name          = TYPE_ALLWINNER_AHCI,
> +    .parent        = TYPE_SYSBUS_AHCI,
> +    .instance_size = sizeof(AllwinnerAHCIState),
> +    .instance_init = allwinner_ahci_init,
> +    .class_init    = allwinner_ahci_class_init,
> +};
> +
> +static void sysbus_ahci_register_types(void)
> +{
> +    type_register_static(&allwinner_ahci_info);
> +}
> +
> +type_init(sysbus_ahci_register_types)
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 32d1296..373311f 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -1737,104 +1737,9 @@ static const TypeInfo sysbus_ahci_info = {
>      .class_init    = sysbus_ahci_class_init,
>  };
>  
> -#define ALLWINNER_AHCI_BISTAFR    ((0xa0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_BISTCR     ((0xa4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_BISTFCTR   ((0xa8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_BISTSR     ((0xac - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_BISTDECR   ((0xb0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_DIAGNR0    ((0xb4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_DIAGNR1    ((0xb8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_OOBR       ((0xbc - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_PHYCS0R    ((0xc0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_PHYCS1R    ((0xc4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_PHYCS2R    ((0xc8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_TIMER1MS   ((0xe0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_GPARAM1R   ((0xe8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_GPARAM2R   ((0xec - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_PPARAMR    ((0xf0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_TESTR      ((0xf4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_VERSIONR   ((0xf8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_IDR        ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -#define ALLWINNER_AHCI_RWCR       ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
> -
> -static uint64_t allwinner_ahci_mem_read(void *opaque, hwaddr addr,
> -                                        unsigned size)
> -{
> -    AllwinnerAHCIState *a = opaque;
> -    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
> -    uint64_t val = a->regs[addr/4];
> -
> -    switch (addr / 4) {
> -    case ALLWINNER_AHCI_PHYCS0R:
> -        val |= 0x2 << 28;
> -        break;
> -    case ALLWINNER_AHCI_PHYCS2R:
> -        val &= ~(0x1 << 24);
> -        break;
> -    }
> -    trace_allwinner_ahci_mem_read(s, a, addr, val, size);
> -    return  val;
> -}
> -
> -static void allwinner_ahci_mem_write(void *opaque, hwaddr addr,
> -                                     uint64_t val, unsigned size)
> -{
> -    AllwinnerAHCIState *a = opaque;
> -    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
> -
> -    trace_allwinner_ahci_mem_write(s, a, addr, val, size);
> -    a->regs[addr/4] = val;
> -}
> -
> -static const MemoryRegionOps allwinner_ahci_mem_ops = {
> -    .read = allwinner_ahci_mem_read,
> -    .write = allwinner_ahci_mem_write,
> -    .valid.min_access_size = 4,
> -    .valid.max_access_size = 4,
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> -};
> -
> -static void allwinner_ahci_init(Object *obj)
> -{
> -    SysbusAHCIState *s = SYSBUS_AHCI(obj);
> -    AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
> -
> -    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
> -                          "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
> -    memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
> -                                &a->mmio);
> -}
> -
> -static const VMStateDescription vmstate_allwinner_ahci = {
> -    .name = "allwinner-ahci",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_UINT32_ARRAY(regs, AllwinnerAHCIState,
> -                             ALLWINNER_AHCI_MMIO_SIZE/4),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
> -static void allwinner_ahci_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -
> -    dc->vmsd = &vmstate_allwinner_ahci;
> -}
> -
> -static const TypeInfo allwinner_ahci_info = {
> -    .name          = TYPE_ALLWINNER_AHCI,
> -    .parent        = TYPE_SYSBUS_AHCI,
> -    .instance_size = sizeof(AllwinnerAHCIState),
> -    .instance_init = allwinner_ahci_init,
> -    .class_init    = allwinner_ahci_class_init,
> -};
> -
>  static void sysbus_ahci_register_types(void)
>  {
>      type_register_static(&sysbus_ahci_info);
> -    type_register_static(&allwinner_ahci_info);
>  }
>  
>  type_init(sysbus_ahci_register_types)
> 
