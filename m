Received: by 2002:a05:7022:fa01:b0:6e:5a56:ff6c with SMTP id sy1csp20191dlb;
        Wed, 18 Oct 2023 11:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu+1rZADm82tq6UAv+NvZ1FTvUqolgqbyd4hokGoYKwPfih0g/DLiSp4aXrnzJEh3aGjo+
X-Received: by 2002:a0c:d6c7:0:b0:63f:8839:658 with SMTP id l7-20020a0cd6c7000000b0063f88390658mr7169601qvi.1.1697653474076;
        Wed, 18 Oct 2023 11:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697653474; cv=none;
        d=google.com; s=arc-20160816;
        b=uBk45UniEB7Rv6cIH9UUaKcMpbOfVGqp4/U2PbY0UK/8KdtStq7cl3WczJrz6Dyj1f
         WsfdPHEZU6MsSJ4Ke6gbmbJUDvbeWa+RlOwWtY0eBgnGNnEfR91g8pFKQ2bZR/zMBna4
         kEAwXCa+r9QDnlx+LzI/ACXh7+ZR+2xXFh28ZeN2cfU02XbSELO+Pl/S1snUaVywfUBu
         jCAxBhkLXRFXLrbSonY3OuQDUQeYnI2Yy6/F8afbwklfo37rCNuTIAizixCNfUKmuPz2
         +4rU+x96kZpVQpwExV2mv+I6Xg87a5/Cjzz+0dgxu4zGNWhbtC6G1xMFnTxNs6KlPRrs
         L9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BnzXx/C+GeU4JAizDiN/4urpuRzFanXW/hZ5GyEtlkQ=;
        fh=eFDoKNrJE3v3BqwczSGYBHnIg7T/J/oamfU2KtoPZMA=;
        b=TOWa5jIDtYmPUmbbch0XqjXZwLc49h/OzTU1JMHTOiYGPEIT7YLIcfNnCf9psnD+sN
         iw5h+A57+CdQfiunbqfSWFOwukZ8dCghJSftwV7z3B+GjO20tZKcUECE85dpic1erjUS
         EPoH9tHRCgVoTEkkQbVM+kvHh2xmhrmjOpLxQt6kPw6VmkuaXfPrRCvc+iRVywi6/PPh
         pY7XpPp4fLlWs6nh9UlK5AqgFaEtjYdEXc0pl7zX9d59tvU3Nt6TxTyCYeSJinMnh/Ts
         OaKGbYx2F4qqICfIl2yImDQ1iYXvEb9ARTfv0ZrV8qKGzcmSholpnPkvWKwKQjzM3ChO
         tnOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aT4KCYzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id on7-20020a056214448700b0065d026aeefasi383537qvb.78.2023.10.18.11.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aT4KCYzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtBDF-0003H0-AX; Wed, 18 Oct 2023 14:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtBDC-0003Fh-D3
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:24:06 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtBD9-0002dp-HW
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:24:06 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso14988829a12.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697653440; x=1698258240; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BnzXx/C+GeU4JAizDiN/4urpuRzFanXW/hZ5GyEtlkQ=;
 b=aT4KCYzDDt6MPb/MmDJ5Ay4uoJ6eAY2OPcMAYpTZo4H7FCq9Iez7hn1pO+kyLsuiqt
 9jfZ+MDdfWgqCchRtG+NrwHXsC9bEPSXOOgtGpUusT7nKCokJbGJ5bRZOfoil4TUzwA1
 e77X1V2h8rACev7PaWUz5hSh86OKZwbSyYchhHiTFg1CVVdv/Ihyobe1H1hae5SPcZtj
 TGlIF3ExsuYnZzGeKWcMA7n45cfCsqbseugk0tJrw3s87Wng4I8yx1Til7QtWVp9uDMT
 N7ImE30UtHQF2L9JhkpN9qQyz9b38L2lngVEI7yOSJJJ+zxFSJJqUZeO3UFKtwRlIrR4
 hqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697653440; x=1698258240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BnzXx/C+GeU4JAizDiN/4urpuRzFanXW/hZ5GyEtlkQ=;
 b=VBCLAoPg1wBI/HoCjm2bpIYJANL2i8kAJlUk++vcf8iKuIf7glNua62Fws3DGqzoZt
 CYcdtteC7dvHLVQ+6bVy1WMOD7EpbkEf2HQQ1fy2SXdr7ypc/i/LijTjeUJu2cEND0jm
 PZEefjhQnmQH6WU4pFmgOraQJCmEC2oVchCOVsJeBLvvM+ZC4PBgnR5PjDebcL3x0MnF
 3jk/ei2/OAav0uboMyRQpMO94tjBQCiLNkD20g4vPhSxi+xKx7hathVbFeDe1eGgb+Fx
 lf2Ewsrb9CnuLyuoXiHosN1d9FUKSYjsuhJdKTX8rSSdApd1cIVbWvo4WjK0l47SQdr2
 m3GA==
X-Gm-Message-State: AOJu0YwWcV+dmy/NkezI8HboruM5vlPExHVAzUOh97tCD4MBZ/5+AG1A
 751Iqdfm/tJ8QnU777XR5qBuPg==
X-Received: by 2002:a05:6402:5c4:b0:531:14c4:ae30 with SMTP id
 n4-20020a05640205c400b0053114c4ae30mr5610258edx.0.1697653439784; 
 Wed, 18 Oct 2023 11:23:59 -0700 (PDT)
Received: from [192.168.69.115]
 (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr. [176.171.218.149])
 by smtp.gmail.com with ESMTPSA id
 eg38-20020a05640228a600b0053e67bcb3e7sm3134891edb.82.2023.10.18.11.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 11:23:58 -0700 (PDT)
Message-ID: <227c8351-75d7-db1d-aeab-1e6fb2db22c0@linaro.org>
Date: Wed, 18 Oct 2023 20:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 05/12] hw/pci-host/bonito: Do not use SysBus API to map
 local MMIO region
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
 <20231018141151.87466-6-philmd@linaro.org>
 <6020a0cd-19a8-4cf7-a99d-781854464887@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6020a0cd-19a8-4cf7-a99d-781854464887@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kXAfJYDol5zI

On 18/10/23 18:05, Thomas Huth wrote:
> On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
>> There is no point in exposing an internal MMIO region via
>> SysBus and directly mapping it in the very same device.
>>
>> Just map it without using the SysBus API.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/pci-host/bonito.c | 29 ++++++++++++++---------------
>>   1 file changed, 14 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index ee6cb85e97..3b803bcad3 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -654,7 +654,6 @@ static void bonito_host_realize(DeviceState *dev, 
>> Error **errp)
>>   static void bonito_pci_realize(PCIDevice *dev, Error **errp)
>>   {
>>       PCIBonitoState *s = PCI_BONITO(dev);
>> -    SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
>>       PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
>>       BonitoState *bs = s->pcihost;
>>       MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
>> @@ -668,48 +667,48 @@ static void bonito_pci_realize(PCIDevice *dev, 
>> Error **errp)
>>       /* set the north bridge register mapping */
>>       memory_region_init_io(&s->iomem, OBJECT(s), &bonito_ops, s,
>>                             "north-bridge-register", 
>> BONITO_INTERNAL_REG_SIZE);
>> -    sysbus_init_mmio(sysbus, &s->iomem);
>> -    sysbus_mmio_map(sysbus, 0, BONITO_INTERNAL_REG_BASE);
>> +    memory_region_add_subregion(get_system_memory(), 
>> BONITO_INTERNAL_REG_BASE,
>> +                                &s->iomem);
>>       /* set the north bridge pci configure  mapping */
>>       memory_region_init_io(&phb->conf_mem, OBJECT(s), 
>> &bonito_pciconf_ops, s,
>>                             "north-bridge-pci-config", 
>> BONITO_PCICONFIG_SIZE);
>> -    sysbus_init_mmio(sysbus, &phb->conf_mem);
>> -    sysbus_mmio_map(sysbus, 1, BONITO_PCICONFIG_BASE);
>> +    memory_region_add_subregion(get_system_memory(), 
>> BONITO_PCICONFIG_BASE,
>> +                                &phb->conf_mem);
>>       /* set the south bridge pci configure  mapping */
>>       memory_region_init_io(&phb->data_mem, OBJECT(s), 
>> &bonito_spciconf_ops, s,
>>                             "south-bridge-pci-config", 
>> BONITO_SPCICONFIG_SIZE);
>> -    sysbus_init_mmio(sysbus, &phb->data_mem);
>> -    sysbus_mmio_map(sysbus, 2, BONITO_SPCICONFIG_BASE);
>> +    memory_region_add_subregion(get_system_memory(), 
>> BONITO_SPCICONFIG_BASE,
>> +                                &phb->data_mem);
>>       create_unimplemented_device("bonito", BONITO_REG_BASE, 
>> BONITO_REG_SIZE);
>>       memory_region_init_io(&s->iomem_ldma, OBJECT(s), 
>> &bonito_ldma_ops, s,
>>                             "ldma", 0x100);
>> -    sysbus_init_mmio(sysbus, &s->iomem_ldma);
>> -    sysbus_mmio_map(sysbus, 3, 0x1fe00200);
>> +    memory_region_add_subregion(get_system_memory(), 0x1fe00200,
>> +                                &s->iomem_ldma);
>>       /* PCI copier */
>>       memory_region_init_io(&s->iomem_cop, OBJECT(s), &bonito_cop_ops, s,
>>                             "cop", 0x100);
>> -    sysbus_init_mmio(sysbus, &s->iomem_cop);
>> -    sysbus_mmio_map(sysbus, 4, 0x1fe00300);
>> +    memory_region_add_subregion(get_system_memory(), 0x1fe00300,
>> +                                &s->iomem_cop);
>>       create_unimplemented_device("ROMCS", BONITO_FLASH_BASE, 60 * MiB);
>>       /* Map PCI IO Space  0x1fd0 0000 - 0x1fd1 0000 */
>>       memory_region_init_alias(&s->bonito_pciio, OBJECT(s), "isa_mmio",
>>                                get_system_io(), 0, BONITO_PCIIO_SIZE);
>> -    sysbus_init_mmio(sysbus, &s->bonito_pciio);
>> -    sysbus_mmio_map(sysbus, 5, BONITO_PCIIO_BASE);
>> +    memory_region_add_subregion(get_system_memory(), BONITO_PCIIO_BASE,
>> +                                &s->bonito_pciio);
>>       /* add pci local io mapping */
>>       memory_region_init_alias(&s->bonito_localio, OBJECT(s), "IOCS[0]",
>>                                get_system_io(), 0, 256 * KiB);
>> -    sysbus_init_mmio(sysbus, &s->bonito_localio);
>> -    sysbus_mmio_map(sysbus, 6, BONITO_DEV_BASE);
>> +    memory_region_add_subregion(get_system_memory(), BONITO_DEV_BASE,
>> +                                &s->bonito_localio);
>>       create_unimplemented_device("IOCS[1]", BONITO_DEV_BASE + 1 * 256 
>> * KiB,
>>                                   256 * KiB);
>>       create_unimplemented_device("IOCS[2]", BONITO_DEV_BASE + 2 * 256 
>> * KiB,
> 
> Would it make sense to cache the return value of get_system_memory() in 
> a local variable instead of calling it again and again ...?


This is done later, at this point I'm just doing mechanical
transformation with:

     @@
     expression sbdev;
     expression index;
     expression addr;
     expression subregion;
     @@
     -    sysbus_init_mmio(sbdev, subregion);
          ... when != sbdev
     -    sysbus_mmio_map(sbdev, index, addr);
     +    memory_region_add_subregion(get_system_memory(), addr, subregion);

     @@
     expression sbdev;
     expression index;
     expression addr;
     expression subregion;
     expression priority;
     @@
     -    sysbus_init_mmio(sbdev, subregion);
          ... when != sbdev
     -    sysbus_mmio_map_overlap(sbdev, index, addr, priority);
     +    memory_region_add_subregion_overlap(get_system_memory(), addr,
     +                                        subregion, priority);
