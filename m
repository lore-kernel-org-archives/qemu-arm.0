Received: by 10.223.197.9 with SMTP id q9csp3639882wrf;
        Mon, 2 Oct 2017 11:38:59 -0700 (PDT)
X-Received: by 10.200.38.110 with SMTP id v43mr20062906qtv.296.1506969539282;
        Mon, 02 Oct 2017 11:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506969539; cv=none;
        d=google.com; s=arc-20160816;
        b=w6A8DWN3E2zf07et+mpOLbTGUXZ/8swbGEVYCZeONm75Ut8DgP9Zr6BKzzF6wD2n6Q
         CyKLDyE1iWcIZnbaDT+NYn3m+ZCfLqaYJ3XhA33U1r4CTl4uxhPwMJm+0baeWrm6Fx4o
         q+a6PgMojynQkRDhAjprMmejOU9bpfNIzimcpe0/oGuFVJj0Z4BkZwn4etPZZAO4sV4b
         awfQnLk50/nnE7GrvEwVQ3uqDtfQyn1K+u0ZxWo4ivRg0XwUC5zO0R1UkJrBg6ueCkCx
         f1rS66FRy3LS0y99MuCwEg70ONRSgg6SabgUII1ZsfFuzaNtbpJ0G6Xg4Up5zGUIbEQc
         RXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=61nzUa2Fs63Efy7BCqoIWXL3Svbx2sgerNattuqIK7Y=;
        b=mtlBPXgOcXiZW4LZXdF5Ss8RW4Udoic83vHnPZiOZTyzL8PAzW1BoAZwhW02Ou0YGJ
         mvHVyGsd2Ji3tsMUGnahMD9KbdZ93k7cMcO94DRVGgprwMDean9bnbLHcuoyp4dfMmou
         Ff0gbTDUH/INAP5GUB2WY3KUq7bLxZ5K/uEPwT+eFti7lP2wLg5vQg4U9S18jd04uCWz
         eFE8zLUmiyfF5KQYCD1gMD7EOhIVBKrKfgtPqnBGT2WM532cSPdpxjWeTiztOC0IdIql
         gkU8Ms1nDB448p2oKtae4Qx9wzjC9X5kA/pili55SVPLmPviynuoExhKStKx+u3o1PL8
         j5Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EnGnqV9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x33si9710755qtx.533.2017.10.02.11.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Oct 2017 11:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EnGnqV9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:53701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dz5cG-0000gW-S6
	for alex.bennee@linaro.org; Mon, 02 Oct 2017 14:38:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dz5c5-0000dl-IC
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 14:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dz5c0-0000Lu-NP
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 14:38:45 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dz5bg-0008HM-Bq; Mon, 02 Oct 2017 14:38:20 -0400
Received: by mail-qk0-x241.google.com with SMTP id a12so1742091qka.4;
	Mon, 02 Oct 2017 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=61nzUa2Fs63Efy7BCqoIWXL3Svbx2sgerNattuqIK7Y=;
	b=EnGnqV9bScZaBqNB1r6HsmQDSeNjSXATooVuZCiKEObRWV3W+kZmfoye9tELlVEveo
	HzCJ0jB2MDt6Ll4CL0OwuFT05vxW0PVC/SeJb3VQbKtgUKB3psd5CT/bMAFeU8Q79SDk
	ytF7ajQxHPZ2GoEGq03iK9CgW11wjrONe4EdRacTLSUXX5cJTGIxjHjeFFzNxXF9dVW4
	RWk5WAtFtsg2PW387Vqt3SZ3NZpb213ankcN3ukPiAYR3wu2PAwMC3EGsQk60bO0yQPo
	dt3ZenXyW9fK49UKFD3bYK3KvDvjGtxXq5XJ5135pRf7p99vrE2KVh4WlqJnc0g773N5
	hoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=61nzUa2Fs63Efy7BCqoIWXL3Svbx2sgerNattuqIK7Y=;
	b=c8cDNdXhN8srZi0MV7SYIqPNQ0GG3qe/bqkkOkuXucZe1FTCVf6pa6VDF6OyMKSlbA
	hIF4jtq+xSAKF4uUQt39qbzM9+uXJ+DrsCmB3xo73irTwKj0xQ5kAL4MZuhxdo7S3SqA
	mOu4mgB3qKxkNTmZ+I0lB6klTlaj1OCCvmqeYsknr9hnmE0qLVNTJiAqrVI3HGssZiMs
	4oxnQr8qsM60+HOvLUZ4g8CxADe/qdLYQJYwf9EGLNsp+EekID2t56uX7tJUX2d02IqF
	wduVZsZyTAy99fXjXs/NveSKBHjlW8wMU3mkrdD0rWZf1za9s9F83/RH6IzlOCs79+Z2
	5HTA==
X-Gm-Message-State: AMCzsaWlmpReTi6CMXqAKZyQ+xwvtRh1uW9siXGL0uKngU5J926x6PKo
	tBfmDaMgxytAf9oEJOGAPZypYsnk
X-Google-Smtp-Source: AOwi7QDF348AhrCKYfenNoBhHb2eT+0t3W/BNBtVcF7zUJxXtIVcoQ9nqyqPA3t6utxOemp5igGh/w==
X-Received: by 10.55.91.69 with SMTP id p66mr16613623qkb.167.1506969499384;
	Mon, 02 Oct 2017 11:38:19 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id w20sm727370qkb.95.2017.10.02.11.38.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 11:38:18 -0700 (PDT)
To: Marcel Apfelbaum <marcel@redhat.com>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-5-f4bug@amsat.org>
	<8a52b6be-ce55-307f-2bba-85858f739210@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <72e73fee-0e1e-6988-038d-a9823e7b6d19@amsat.org>
Date: Mon, 2 Oct 2017 15:38:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <8a52b6be-ce55-307f-2bba-85858f739210@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH 27/34] hw/pci: declare pci_nic_init_nofail()
 in "hw/net/pci.h"
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: y0YojWoRtW1o

Hi Marcel,

On 09/25/2017 11:30 AM, Marcel Apfelbaum wrote:
> Hi Philippe,
> 
> It seems the patch is doing much more than
> what is mentioned in the subject.
> 
> On 22/09/2017 19:01, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/pci/pci_internal.h | 16 +++++++++++
>>   include/hw/net/pci.h  | 20 +++++++++++++
>>   include/hw/pci/pci.h  |  4 ---
>>   hw/arm/virt.c         |  1 +
>>   hw/mips/mips_malta.c  |  1 +
>>   hw/pci/pci.c          | 67 ++------------------------------------------
>>   hw/pci/pci_nic.c      | 77 
>> +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   hw/ppc/e500.c         |  1 +
>>   hw/ppc/spapr.c        |  1 +
>>   hw/pci/Makefile.objs  |  1 +
>>   10 files changed, 120 insertions(+), 69 deletions(-)
>>   create mode 100644 hw/pci/pci_internal.h
>>   create mode 100644 include/hw/net/pci.h
>>   create mode 100644 hw/pci/pci_nic.c
>>
>> diff --git a/hw/pci/pci_internal.h b/hw/pci/pci_internal.h
>> new file mode 100644
>> index 0000000000..d967468767
>> --- /dev/null
>> +++ b/hw/pci/pci_internal.h
>> @@ -0,0 +1,16 @@
>> +/*
>> + * QEMU PCI internal
>> + *
>> + * Copyright (c) 2005 Fabrice Bellard
>> + * > + * This work is licensed under the terms of the GNU GPL, version 2 
> or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +#ifndef QEMU_HW_PCI_INTERNAL_H
>> +#define QEMU_HW_PCI_INTERNAL_H
>> +
>> +#include "hw/pci/pci_bus.h"
>> +
>> +PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root, const char 
>> *devaddr);
>> +
>> +#endif
> 
> Why don't add the function directly to hw/pci/pci_nic.c ?
> We have only one calling site anyway.

You right!

> 
> I have nothing against adding an internal H file, but then
> we would need to add there *all* the functions used
> only by the pci sub-system. And that may be out of the scope
> of your series.
> 
> 
> 
> 
>> diff --git a/include/hw/net/pci.h b/include/hw/net/pci.h
>> new file mode 100644
>> index 0000000000..529591b7f3
>> --- /dev/null
>> +++ b/include/hw/net/pci.h
>> @@ -0,0 +1,20 @@
>> +/*
>> + * QEMU network devices
>> + *
>> + * Copyright (c) 2005 Fabrice Bellard
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or 
>> later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +#ifndef QEMU_HW_NET_PCI_H
>> +#define QEMU_HW_NET_PCI_H
>> +
>> +#include "net/net.h"
>> +#include "hw/pci/pci.h"
>> +#include "hw/pci/pci_bus.h"
>> +
>> +PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>> +                               const char *default_model,
>> +                               const char *default_devaddr);
>> +
> 
> Can you add a short explanation on how the split
> helps removing i386/pc dependency from non-PC world?
> - it is not straight forward, at least for me.

I thought there was an old dependency on "hw/pci/pci.h" to something 
from i386/pc, so every machine using a PCI NIC would have this 
dependency. Extracting the NIC part as "hw/net/pci.h" would solve this 
issue. I didn't check attentively but it seems I was wrong, so I'll 
either drop this patch or reword it.

Regards,

Phil.

> 
> 
> Thanks,
> Marcel
> 
>> +#endif
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index aa7ef9cf69..6a0f7b5472 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -422,10 +422,6 @@ void 
>> pci_device_set_intx_routing_notifier(PCIDevice *dev,
>>                                             PCIINTxRoutingNotifier 
>> notifier);
>>   void pci_device_reset(PCIDevice *dev);
>> -PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>> -                               const char *default_model,
>> -                               const char *default_devaddr);
>> -
>>   PCIDevice *pci_vga_init(PCIBus *bus);
>>   int pci_bus_num(PCIBus *s);
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9e18b410d7..39fab3acb9 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -35,6 +35,7 @@
>>   #include "hw/arm/primecell.h"
>>   #include "hw/arm/virt.h"
>>   #include "hw/devices.h"
>> +#include "hw/net/pci.h"
>>   #include "net/net.h"
>>   #include "sysemu/block-backend.h"
>>   #include "sysemu/device_tree.h"
>> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
>> index 6945fa47c3..fb6a2f9363 100644
>> --- a/hw/mips/mips_malta.c
>> +++ b/hw/mips/mips_malta.c
>> @@ -48,6 +48,7 @@
>>   #include "hw/timer/mc146818rtc.h"
>>   #include "hw/input/i8042.h"
>>   #include "hw/timer/i8254.h"
>> +#include "hw/net/pci.h"
>>   #include "sysemu/blockdev.h"
>>   #include "exec/address-spaces.h"
>>   #include "hw/sysbus.h"             /* SysBusDevice */
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 1e6fb88eba..9b678c8fd0 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -28,7 +28,6 @@
>>   #include "hw/pci/pci_bus.h"
>>   #include "hw/pci/pci_host.h"
>>   #include "monitor/monitor.h"
>> -#include "net/net.h"
>>   #include "sysemu/sysemu.h"
>>   #include "hw/loader.h"
>>   #include "qemu/error-report.h"
>> @@ -41,6 +40,7 @@
>>   #include "hw/hotplug.h"
>>   #include "hw/boards.h"
>>   #include "qemu/cutils.h"
>> +#include "pci_internal.h"
>>   //#define DEBUG_PCI
>>   #ifdef DEBUG_PCI
>> @@ -671,8 +671,7 @@ static int pci_parse_devaddr(const char *addr, int 
>> *domp, int *busp,
>>       return 0;
>>   }
>> -static PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root,
>> -                                 const char *devaddr)
>> +PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root, const char 
>> *devaddr)
>>   {
>>       int dom, bus;
>>       unsigned slot;
>> @@ -1812,68 +1811,6 @@ PciInfoList *qmp_query_pci(Error **errp)
>>       return head;
>>   }
>> -static const char * const pci_nic_models[] = {
>> -    "ne2k_pci",
>> -    "i82551",
>> -    "i82557b",
>> -    "i82559er",
>> -    "rtl8139",
>> -    "e1000",
>> -    "pcnet",
>> -    "virtio",
>> -    "sungem",
>> -    NULL
>> -};
>> -
>> -static const char * const pci_nic_names[] = {
>> -    "ne2k_pci",
>> -    "i82551",
>> -    "i82557b",
>> -    "i82559er",
>> -    "rtl8139",
>> -    "e1000",
>> -    "pcnet",
>> -    "virtio-net-pci",
>> -    "sungem",
>> -    NULL
>> -};
>> -
>> -/* Initialize a PCI NIC.  */
>> -PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>> -                               const char *default_model,
>> -                               const char *default_devaddr)
>> -{
>> -    const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
>> -    PCIBus *bus;
>> -    PCIDevice *pci_dev;
>> -    DeviceState *dev;
>> -    int devfn;
>> -    int i;
>> -
>> -    if (qemu_show_nic_models(nd->model, pci_nic_models)) {
>> -        exit(0);
>> -    }
>> -
>> -    i = qemu_find_nic_model(nd, pci_nic_models, default_model);
>> -    if (i < 0) {
>> -        exit(1);
>> -    }
>> -
>> -    bus = pci_get_bus_devfn(&devfn, rootbus, devaddr);
>> -    if (!bus) {
>> -        error_report("Invalid PCI device address %s for device %s",
>> -                     devaddr, pci_nic_names[i]);
>> -        exit(1);
>> -    }
>> -
>> -    pci_dev = pci_create(bus, devfn, pci_nic_names[i]);
>> -    dev = &pci_dev->qdev;
>> -    qdev_set_nic_properties(dev, nd);
>> -    qdev_init_nofail(dev);
>> -
>> -    return pci_dev;
>> -}
>> -
>>   PCIDevice *pci_vga_init(PCIBus *bus)
>>   {
>>       switch (vga_interface_type) {
>> diff --git a/hw/pci/pci_nic.c b/hw/pci/pci_nic.c
>> new file mode 100644
>> index 0000000000..fb1a10ff12
>> --- /dev/null
>> +++ b/hw/pci/pci_nic.c
>> @@ -0,0 +1,77 @@
>> +/*
>> + * QEMU PCI network interface
>> + *
>> + * Copyright (c) 2004 Fabrice Bellard
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or 
>> later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +#include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>> +#include "hw/pci/pci.h"
>> +#include "hw/pci/pci_bus.h"
>> +#include "hw/net/pci.h"
>> +#include "net/net.h"
>> +#include "pci_internal.h"
>> +
>> +static const char *const pci_nic_models[] = {
>> +    "ne2k_pci",
>> +    "i82551",
>> +    "i82557b",
>> +    "i82559er",
>> +    "rtl8139",
>> +    "e1000",
>> +    "pcnet",
>> +    "virtio",
>> +    "sungem",
>> +    NULL
>> +};
>> +
>> +static const char *const pci_nic_names[] = {
>> +    "ne2k_pci",
>> +    "i82551",
>> +    "i82557b",
>> +    "i82559er",
>> +    "rtl8139",
>> +    "e1000",
>> +    "pcnet",
>> +    "virtio-net-pci",
>> +    "sungem",
>> +    NULL
>> +};
>> +
>> +/* Initialize a PCI NIC.  */
>> +PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>> +                               const char *default_model,
>> +                               const char *default_devaddr)
>> +{
>> +    const char *devaddr = nd->devaddr ? nd->devaddr : default_devaddr;
>> +    PCIBus *bus;
>> +    PCIDevice *pci_dev;
>> +    DeviceState *dev;
>> +    int devfn;
>> +    int i;
>> +
>> +    if (qemu_show_nic_models(nd->model, pci_nic_models)) {
>> +        exit(0);
>> +    }
>> +
>> +    i = qemu_find_nic_model(nd, pci_nic_models, default_model);
>> +    if (i < 0) {
>> +        exit(1);
>> +    }
>> +
>> +    bus = pci_get_bus_devfn(&devfn, rootbus, devaddr);
>> +    if (!bus) {
>> +        error_report("Invalid PCI device address %s for device %s",
>> +                     devaddr, pci_nic_names[i]);
>> +        exit(1);
>> +    }
>> +
>> +    pci_dev = pci_create(bus, devfn, pci_nic_names[i]);
>> +    dev = &pci_dev->qdev;
>> +    qdev_set_nic_properties(dev, nd);
>> +    qdev_init_nofail(dev);
>> +
>> +    return pci_dev;
>> +}
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index db0e49ab8f..482757ca7b 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -24,6 +24,7 @@
>>   #include "hw/hw.h"
>>   #include "hw/char/serial.h"
>>   #include "hw/pci/pci.h"
>> +#include "hw/net/pci.h"
>>   #include "hw/boards.h"
>>   #include "sysemu/sysemu.h"
>>   #include "sysemu/kvm.h"
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 17ea77618c..96007051e2 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -56,6 +56,7 @@
>>   #include "hw/pci-host/spapr.h"
>>   #include "hw/ppc/xics.h"
>>   #include "hw/pci/msi.h"
>> +#include "hw/net/pci.h"
>>   #include "hw/pci/pci.h"
>>   #include "hw/scsi/scsi.h"
>> diff --git a/hw/pci/Makefile.objs b/hw/pci/Makefile.objs
>> index 9f905e6344..125428fd54 100644
>> --- a/hw/pci/Makefile.objs
>> +++ b/hw/pci/Makefile.objs
>> @@ -1,4 +1,5 @@
>>   common-obj-$(CONFIG_PCI) += pci.o pci_bridge.o
>> +common-obj-$(CONFIG_PCI) += pci_nic.o
>>   common-obj-$(CONFIG_PCI) += msix.o msi.o
>>   common-obj-$(CONFIG_PCI) += shpc.o
>>   common-obj-$(CONFIG_PCI) += slotid_cap.o
>>
> 
