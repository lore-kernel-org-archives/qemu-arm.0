Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1909609ejx;
        Sun, 20 Nov 2022 14:10:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf46JJNWuG0v2jPWhR51qid2lcrlrgPzUDVdb+fX3kDfu5r09rSjJBQ1H5roc1ETJpILMYcQ
X-Received: by 2002:a05:620a:38f:b0:6fb:a0ec:c5ba with SMTP id q15-20020a05620a038f00b006fba0ecc5bamr14548736qkm.493.1668982229910;
        Sun, 20 Nov 2022 14:10:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668982229; cv=none;
        d=google.com; s=arc-20160816;
        b=iC61hMmoX3C3EwE+yWR5dh+FEdLBOMRojcmrpexalMonrgpx69d658QceiQCZu1ifL
         GC2jN7H0nt1EPKOhUBHntSQ2jJsUapYlutddRH9Zab1sjMVWILEg/i/FwaPlYkPqHrJC
         usey9M45r64GQxnRnEbPjtwW8w2gj03mQh8NoBA0eF53TsyHwjtAV1Eu52uhpVWFxQQE
         uJYqMG0Nv2duCy+hzBWeFs3Md4kFIiyNCXZyxUMfKsxkdr/TwCkRE6Aak+j7FP24lSvC
         erFOJYm4G2R1F+5OWZNYdWvasv06s7XuxQqXVJb/IUOE447p9KTCvTo4egycci8pvnwl
         CbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tSf3U0Mh5brC3j6sPgmpNvytyuuiAjMmNHFHIPZAkqU=;
        b=BJp83Vbp8AB9L7FO80SmThG0PWCSlTQJaVogUEJVwU4U0iNeqbQ1AHoBC9QxviG1QB
         Y6LinFZfdJgDvqxJNaThHrX6wonxfzZ4FujEBUvEoHd2x1j9xMM95uTBPVk+gxjG24jX
         T5jjUUdzBTHw88brPW5pqb0g8FqHzigvv+9pR0a599SbOP/XYKxfUNZ63IRr25+hftCf
         gHuKaKr0G6Rs5kiHjSu37jfLNVaYKbDGxK9ctZETCThQ0qZbCnDUWuXU2G9tAgyQaURE
         8D77DmLhJ0upTvsr9BQw5NeSaXcgYTPbyPZpdA60PNa76NH0k3BiAydXQ5X7zcN94BOq
         5eOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=sveX1FUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn31-20020a05620a2adf00b006fa8299e5f2si5187534qkb.402.2022.11.20.14.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Nov 2022 14:10:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=sveX1FUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1owsVf-0002hs-HD; Sun, 20 Nov 2022 17:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1owsVQ-0002ds-M5; Sun, 20 Nov 2022 17:09:42 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1owsVL-0002sZ-7g; Sun, 20 Nov 2022 17:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tSf3U0Mh5brC3j6sPgmpNvytyuuiAjMmNHFHIPZAkqU=; b=sveX1FUkJV3agFRcxNO14SYdDF
 /UvEXK1TPqJTO7HADUmnVyiyC4A5BrZYKdkbLbpCG1jX8rARJ7CAHPNPQC6aW3ujKU2u5U0jtRIbW
 l4HWqyWWEyNdPEJOGVZ3KFC8WL02obMDfSbKg2YOdzZtq3MCoCsucgLNxt0TcDIDAFVcmNFZoVbJ5
 gEZk1y3uMmhXYsbiDHMsXNweOjWESBd69HOAfcr8gXPYMY/6KKEkXgYZsURTZ19Bx0QW4t0SDiSJy
 tTOhB6FzlpFHQiHeAw09XFsJo5/fO636ZbbxlxRqflkI8r2mzCAV2KL1fjqqkr0vft25kSkPBLlHC
 +dPmtLb+aIIGDEuqCTZJGkNR3eALqYOEshDAlIa2X1XvLKy8btDvDn470Vvm3MXZ6l6XTz8UDrVO9
 FkBBsR0CuiBs0f730qidHpK1Nlz5oLqBAvCRDt2vP7cg+sXB6oN+TV03MrOkOY67Uxb05/K2oV0ja
 geoIbVWGoYTWLvSv9iqZ2KsnX6E+IiVvM72zKdVFlShU1OqY8HAOwmMlA8nXPeIf3BkL6fuMrpCcj
 H5/zu6DFEwvQs9hHC0GGLv9tdfBgYk3QZbmIOZXEawBwzn1zzLKyCk6MvHNIBXGUyqIM7pb8A/ZsW
 YPgBLTNQcwrdG3S3IhqytwpQ8GggKJOxxsajEPGmA=;
Received: from [2a00:23c4:8ba9:9200:322a:ac7b:c3c3:b65b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1owsUd-0001Ip-Tt; Sun, 20 Nov 2022 22:08:56 +0000
Message-ID: <916f93a2-3b0d-3e52-5137-995496c4aefa@ilande.co.uk>
Date: Sun, 20 Nov 2022 22:08:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221116152730.3691347-1-imammedo@redhat.com>
 <20221116152730.3691347-2-imammedo@redhat.com>
 <79ad881d-ac77-5bca-bd5f-ba6290b2c830@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <79ad881d-ac77-5bca-bd5f-ba6290b2c830@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba9:9200:322a:ac7b:c3c3:b65b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] remove DEC 21154 PCI bridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HlI6hOPUR4x/

On 16/11/2022 19:39, BALATON Zoltan wrote:

> On Wed, 16 Nov 2022, Igor Mammedov wrote:
> 
>> Code has not been used practically since its inception (2004)
>>  f2aa58c6f4a20 UniNorth PCI bridge support
>> or maybe even earlier, but it was consuming contributors time
>> as QEMU was being rewritten.
>> Drop it for now. Whomever would like to actually
>> use the thing, can make sure it actually works/reintroduce
>> it back when there is a user.
>>
>> PS:
>> I've stumbled upon this when replacing PCIDeviceClass::is_bridge
>> field with QOM cast to PCI_BRIDGE type. Unused DEC 21154
>> was the only one trying to use the field with plain PCIDevice.
>> It's not worth keeping the field around for the sake of the code
>> that was commented out 'forever'.
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>> hw/pci-bridge/dec.h       |   9 ---
>> include/hw/pci/pci_ids.h  |   1 -
>> hw/pci-bridge/dec.c       | 164 --------------------------------------
>> hw/pci-bridge/meson.build |   2 -
>> hw/pci-host/uninorth.c    |   6 --
>> 5 files changed, 182 deletions(-)
>> delete mode 100644 hw/pci-bridge/dec.h
>> delete mode 100644 hw/pci-bridge/dec.c
>>
>> diff --git a/hw/pci-bridge/dec.h b/hw/pci-bridge/dec.h
>> deleted file mode 100644
>> index 869e90b136..0000000000
>> --- a/hw/pci-bridge/dec.h
>> +++ /dev/null
>> @@ -1,9 +0,0 @@
>> -#ifndef HW_PCI_BRIDGE_DEC_H
>> -#define HW_PCI_BRIDGE_DEC_H
>> -
>> -
>> -#define TYPE_DEC_21154 "dec-21154-sysbus"
>> -
>> -PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn);
>> -
>> -#endif
>> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
>> index bc9f834fd1..e4386ebb20 100644
>> --- a/include/hw/pci/pci_ids.h
>> +++ b/include/hw/pci/pci_ids.h
>> @@ -169,7 +169,6 @@
>>
>> #define PCI_VENDOR_ID_DEC                0x1011
>> #define PCI_DEVICE_ID_DEC_21143          0x0019
>> -#define PCI_DEVICE_ID_DEC_21154          0x0026
>>
>> #define PCI_VENDOR_ID_CIRRUS             0x1013
>>
>> diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
>> deleted file mode 100644
>> index 4773d07e6d..0000000000
>> --- a/hw/pci-bridge/dec.c
>> +++ /dev/null
>> @@ -1,164 +0,0 @@
>> -/*
>> - * QEMU DEC 21154 PCI bridge
>> - *
>> - * Copyright (c) 2006-2007 Fabrice Bellard
>> - * Copyright (c) 2007 Jocelyn Mayer
>> - *
>> - * Permission is hereby granted, free of charge, to any person obtaining a copy
>> - * of this software and associated documentation files (the "Software"), to deal
>> - * in the Software without restriction, including without limitation the rights
>> - * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> - * copies of the Software, and to permit persons to whom the Software is
>> - * furnished to do so, subject to the following conditions:
>> - *
>> - * The above copyright notice and this permission notice shall be included in
>> - * all copies or substantial portions of the Software.
>> - *
>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> - * THE SOFTWARE.
>> - */
>> -
>> -#include "qemu/osdep.h"
>> -#include "dec.h"
>> -#include "hw/sysbus.h"
>> -#include "qapi/error.h"
>> -#include "qemu/module.h"
>> -#include "hw/pci/pci.h"
>> -#include "hw/pci/pci_host.h"
>> -#include "hw/pci/pci_bridge.h"
>> -#include "hw/pci/pci_bus.h"
>> -#include "qom/object.h"
>> -
>> -OBJECT_DECLARE_SIMPLE_TYPE(DECState, DEC_21154)
>> -
>> -struct DECState {
>> -    PCIHostState parent_obj;
>> -};
>> -
>> -static int dec_map_irq(PCIDevice *pci_dev, int irq_num)
>> -{
>> -    return irq_num;
>> -}
>> -
>> -static void dec_pci_bridge_realize(PCIDevice *pci_dev, Error **errp)
>> -{
>> -    pci_bridge_initfn(pci_dev, TYPE_PCI_BUS);
>> -}
>> -
>> -static void dec_21154_pci_bridge_class_init(ObjectClass *klass, void *data)
>> -{
>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> -
>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> -    k->realize = dec_pci_bridge_realize;
>> -    k->exit = pci_bridge_exitfn;
>> -    k->vendor_id = PCI_VENDOR_ID_DEC;
>> -    k->device_id = PCI_DEVICE_ID_DEC_21154;
>> -    k->config_write = pci_bridge_write_config;
>> -    k->is_bridge = true;
>> -    dc->desc = "DEC 21154 PCI-PCI bridge";
>> -    dc->reset = pci_bridge_reset;
>> -    dc->vmsd = &vmstate_pci_device;
>> -}
>> -
>> -static const TypeInfo dec_21154_pci_bridge_info = {
>> -    .name          = "dec-21154-p2p-bridge",
>> -    .parent        = TYPE_PCI_BRIDGE,
>> -    .instance_size = sizeof(PCIBridge),
>> -    .class_init    = dec_21154_pci_bridge_class_init,
>> -    .interfaces = (InterfaceInfo[]) {
>> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> -        { },
>> -    },
>> -};
>> -
>> -PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn)
>> -{
>> -    PCIDevice *dev;
>> -    PCIBridge *br;
>> -
>> -    dev = pci_new_multifunction(devfn, false, "dec-21154-p2p-bridge");
>> -    br = PCI_BRIDGE(dev);
>> -    pci_bridge_map_irq(br, "DEC 21154 PCI-PCI bridge", dec_map_irq);
>> -    pci_realize_and_unref(dev, parent_bus, &error_fatal);
>> -    return pci_bridge_get_sec_bus(br);
>> -}
>> -
>> -static void pci_dec_21154_device_realize(DeviceState *dev, Error **errp)
>> -{
>> -    PCIHostState *phb;
>> -    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> -
>> -    phb = PCI_HOST_BRIDGE(dev);
>> -
>> -    memory_region_init_io(&phb->conf_mem, OBJECT(dev), &pci_host_conf_le_ops,
>> -                          dev, "pci-conf-idx", 0x1000);
>> -    memory_region_init_io(&phb->data_mem, OBJECT(dev), &pci_host_data_le_ops,
>> -                          dev, "pci-data-idx", 0x1000);
>> -    sysbus_init_mmio(sbd, &phb->conf_mem);
>> -    sysbus_init_mmio(sbd, &phb->data_mem);
>> -}
>> -
>> -static void dec_21154_pci_host_realize(PCIDevice *d, Error **errp)
>> -{
>> -    /* PCI2PCI bridge same values as PearPC - check this */
>> -}
>> -
>> -static void dec_21154_pci_host_class_init(ObjectClass *klass, void *data)
>> -{
>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>> -
>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>> -    k->realize = dec_21154_pci_host_realize;
>> -    k->vendor_id = PCI_VENDOR_ID_DEC;
>> -    k->device_id = PCI_DEVICE_ID_DEC_21154;
>> -    k->revision = 0x02;
>> -    k->class_id = PCI_CLASS_BRIDGE_PCI;
>> -    k->is_bridge = true;
>> -    /*
>> -     * PCI-facing part of the host bridge, not usable without the
>> -     * host-facing part, which can't be device_add'ed, yet.
>> -     */
>> -    dc->user_creatable = false;
>> -}
>> -
>> -static const TypeInfo dec_21154_pci_host_info = {
>> -    .name          = "dec-21154",
>> -    .parent        = TYPE_PCI_DEVICE,
>> -    .instance_size = sizeof(PCIDevice),
>> -    .class_init    = dec_21154_pci_host_class_init,
>> -    .interfaces = (InterfaceInfo[]) {
>> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> -        { },
>> -    },
>> -};
>> -
>> -static void pci_dec_21154_device_class_init(ObjectClass *klass, void *data)
>> -{
>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>> -
>> -    dc->realize = pci_dec_21154_device_realize;
>> -}
>> -
>> -static const TypeInfo pci_dec_21154_device_info = {
>> -    .name          = TYPE_DEC_21154,
>> -    .parent        = TYPE_PCI_HOST_BRIDGE,
>> -    .instance_size = sizeof(DECState),
>> -    .class_init    = pci_dec_21154_device_class_init,
>> -};
>> -
>> -static void dec_register_types(void)
>> -{
>> -    type_register_static(&pci_dec_21154_device_info);
>> -    type_register_static(&dec_21154_pci_host_info);
>> -    type_register_static(&dec_21154_pci_bridge_info);
>> -}
>> -
>> -type_init(dec_register_types)
>> diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
>> index 243ceeda50..fe92d43de6 100644
>> --- a/hw/pci-bridge/meson.build
>> +++ b/hw/pci-bridge/meson.build
>> @@ -8,8 +8,6 @@ pci_ss.add(when: 'CONFIG_PXB', if_true: 
>> files('pci_expander_bridge.c'),
>> pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 
>> 'xio3130_downstream.c'))
>> pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c', 
>> 'cxl_downstream.c'))
>>
>> -# NewWorld PowerMac
>> -pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
>> # Sun4u
>> pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
>>
>> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
>> index aebd44d265..5c617e86c1 100644
>> --- a/hw/pci-host/uninorth.c
>> +++ b/hw/pci-host/uninorth.c
>> @@ -127,12 +127,6 @@ static void pci_unin_main_realize(DeviceState *dev, Error **errp)
>>                                    PCI_DEVFN(11, 0), 4, TYPE_PCI_BUS);
>>
>>     pci_create_simple(h->bus, PCI_DEVFN(11, 0), "uni-north-pci");
>> -
>> -    /* DEC 21154 bridge */
>> -#if 0
>> -    /* XXX: not activated as PPC BIOS doesn't handle multiple buses properly */
> 
> I think real hardware has this bridge and QEMU could emulate it but OpenBIOS can't 
> handle more than one PCI bus or this bridge yet so this was disabled for that reason. 
> Maybe leave the comment around as a reminder that this could be brought back from git 
> history if somebody wants to fix it in the future, otherwise this may be forgotten 
> and reimplemented from scratch.

Unlike OpenHackWare, OpenBIOS can enumerate PCI topologies containing PCI-PCI bridges 
and I believe this is the bridge present in New World machines. Since this bridge 
exists on the "main" PCI bus then in theory it should be possible to enable it 
without any changes required for OpenBIOS.

Having said that, my time working on QEMU is limited in the short term so I'd have a 
mild preference to keep it, but if it causes problems then it's easy enough to 
retrieve from git history later.


ATB,

Mark.
