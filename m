Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E849DCD6E49
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 11:24:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSYqV-0002cM-AK; Thu, 28 May 2026 07:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wSYqG-0002Sl-NI
 for qemu-arm@nongnu.org; Thu, 28 May 2026 07:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wSYqC-0004rx-FS
 for qemu-arm@nongnu.org; Thu, 28 May 2026 07:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779967434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vEc99dVBYHFovn4jM6dMr8Mo0YEo+VlxEaTA/0juKnM=;
 b=EFP1JwHXHCgs+HcKJbYWoCjt8qRPesuB7rA5kxH/FuErwa86PnzhZhNWB/ksNG0tNg8Ux9
 qUEY960BgnBCbpyirNCHiZwGONJaPTY7f/40aGvgTS+bbFWb4Ao/T+H1sSyCVET9kq1TUK
 /x61QES3dh7arijvxEhHk5uf02qtJV4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-_pS9bQApNti41hUEJkFo3Q-1; Thu, 28 May 2026 07:23:53 -0400
X-MC-Unique: _pS9bQApNti41hUEJkFo3Q-1
X-Mimecast-MFC-AGG-ID: _pS9bQApNti41hUEJkFo3Q_1779967432
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490402ae2c1so64849165e9.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 04:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779967432; x=1780572232;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vEc99dVBYHFovn4jM6dMr8Mo0YEo+VlxEaTA/0juKnM=;
 b=MtibvH4uCwQ97ZDjDPAEtE/Okkk1tnyUlj+WEJB9s1N89+t0972UrySbUajI9nNdOf
 Dg75O6sv1VPknpJoRZtWo5IVZFqDNBj/q6xfWd7yg86gzvps9lAH7LXu1E9xjyBPwgLz
 pGB7Dsf6e82Gp5v8Y3ka+rl2j7MrPFsCjmRiq7OYsIqp1eQib75taIykRvDDU4RSpIr0
 xe892vlOZNb9qqfoNpM6XAk2d01OcXSWWYAUF7R2YpTfr34IHdm93QFg1bF5mJ4G06Xm
 dq5y7hrXJd5M6F/yEDeuWiYSb8caaFoHt1VPL9EsvBTLhrBrudNLp/N3uZzqjOCtHOGF
 78rQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/tQITn3Vlzz284qP/mOSXSSa2+a9gC+ff3bEU4WaGF5pKm2X1dNSBQFSULcKDLIo0I/6PPlzpg6Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy8suaHzqrlW22ZJI5dLY9yUNyxQf8M7cAK5hXI/rlFBOvIeTy6
 95jfbrG0+5kwf8sffv+L+udcF5Jw98pKoP4Rdo7Su8wvu7ni00KU1TPOh8l6CO3/sAkVHDCOhqA
 3+Wr7NeJq/ODxYPa8BmAQf3DS4SD99193mFnH4MiNi7RRfRYkzDoB9g==
X-Gm-Gg: Acq92OGmdMSj/GxW0oHVCgG0dM6/oTDDbxplMyl+g0b5SFPzVpx09O+FJPz8fRZ0/1N
 ZT91/0AIBd7OaM//c8IeiaSDIgQeHnkUEF5OZidbYd0LAfTD19CnW83zXn+jVzcadU2bMZuJl0d
 OzHiIT2vfU5pK7pKwpgHjUF5bNR/Hpb1Od7O1svWavhpreLlBgagl1uIG6uysnnThh5hpQxBNN2
 AgNPSJmpzYDM3QWwv+bOjzN3IR41DvK3fwPi9h92pGA077TgAZMeHD2gPz9GJERMWlbJ3LdzQsV
 yp24P/OVcT01MWnufBMkxaPw91prVi7MEBKi/b4snhniE1vvwdPQvUPJ0pD871XfD270cP92m+a
 yBOX1uWhHmWMYiiHEYucOJCSbFR+PPuVZN0QPQqKwqgLbOJX+jVoJyvnqbkW5SAglNtm8Vlzb6i
 wMNZb5DA==
X-Received: by 2002:a05:600c:8214:b0:490:5000:917 with SMTP id
 5b1f17b1804b1-490947855eamr18587225e9.1.1779967431859; 
 Thu, 28 May 2026 04:23:51 -0700 (PDT)
X-Received: by 2002:a05:600c:8214:b0:490:5000:917 with SMTP id
 5b1f17b1804b1-490947855eamr18586645e9.1.1779967431309; 
 Thu, 28 May 2026 04:23:51 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908b59c53asm15178305e9.6.2026.05.28.04.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 04:23:50 -0700 (PDT)
Date: Thu, 28 May 2026 13:23:49 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: mst@redhat.com, Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: preserve config for ACPI PCI hotplug
In-Reply-To: <CAFEAcA-PkO3aeGoaAzpbJGrrE-_-RjJy9Q4D4MnQ=9W61--3hA@mail.gmail.com>
Message-ID: <582348f6-c128-96b6-4d40-1c078e24038d@redhat.com>
References: <0de640a2-8807-69cf-4429-672263e3e759@redhat.com>
 <CAFEAcA-PkO3aeGoaAzpbJGrrE-_-RjJy9Q4D4MnQ=9W61--3hA@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jJ-iKjUeCF8hgExLEtC4TdhapquAjko5Z2cWlXB1i1Y_1779967432
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 28 May 2026, Peter Maydell wrote:
> On Thu, 28 May 2026 at 10:23, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> ACPI PCI hotplug of a PCI device using a bar > 2M fails on ARM
>> with a resource allocation failure in the guest kernel (Linux):
>>
>> qemu-system-aarch64 [..] -device pcie-root-port,id=rp1,bus=pcie.0 \
>>                     -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on \
>>                     -pflash /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.qcow2
>>
>> (qemu) device_add pci-testdev,bus=rp1,membar=4M
>>
>> [   55.106283] pci 0000:01:00.0: [1b36:0005] type 00 class 0x00ff00 conventional PCI endpoint
>> [   55.107627] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00000fff]
>> [   55.107864] pci 0000:01:00.0: BAR 1 [io  0x0000-0x00ff]
>> [   55.108015] pci 0000:01:00.0: BAR 2 [mem 0x00000000-0x003fffff 64bit pref]
>> [   55.118609] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: can't assign; no space
>> [   55.118653] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: failed to assign
>> [   55.118671] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: assigned
>> [   55.122828] pci 0000:01:00.0: BAR 1 [io  0x1000-0x10ff]: assigned
>> [   55.127090] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: releasing
>> [   55.127098] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: can't assign; no space
>> [   55.127102] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: failed to assign
>> [   55.127106] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: assigned
>>
>> This behavior is exactly the same on x86 - except the busses are created
>> with a default window size of 256M there. If the PCI devices being
>> hotplugged use a bar > 256M you get the same failure like on ARM.
>>
>> The workaround on x86 is to specify "pref64-reserve=" for the PCIe
>> root-port. On ARM this is currently ignored.
>
> From the perspective of somebody who doesn't know much about
> ACPI or PCI, this commit message doesn't really tell me why
> QEMU needs to change. The above reads like "this is a kernel
> problem" to me. Why is the kernel unable to allocate this BAR?

DSM #5 defaults to 1 on ARM which tells the OS that it could
ignore the firmwares PCI configuration at boot time. Linux is
just doing that. The acpi pci hotplug controller can't find a
sufficient resource window of the parent bus and resource
allocation fails. DSM #5 == 0 tells the OS to not ignore the
boot time config from firmware.

>> The following patch changes ACPI DSM #5 to return 0 (only when
>> ACPI HP is used) which basically tells the guest kernel to keep
>> all PCI resource allocations.
>
> If this makes things work why isn't it the default for all ACPI?
> Why doesn't the kernel ignore the ACPI table setting and do
> the thing that works all the time? Do we break some other use
> case by setting it to 0 ?

From what I was able to find in the archives this has been tried
before but led to regressions for legacy devices:
https://lore.kernel.org/all/20210724185234.GA2265457@roeck-us.net

It was recently selectively enabled for accel SMMU - I guess the
rational was that you don't use accel SMMU with legacy devices:
45c57eaefd hw/arm/virt: Set PCI preserve_config for accel SMMUv3

>
>> ------->8
>> From 92cd64b8398f13e51b67ff8baf62f15cac300c94 Mon Sep 17 00:00:00 2001
>> From: Sebastian Ott <sebott@redhat.com>
>> Date: Wed, 20 May 2026 10:39:26 -0400
>> Subject: [PATCH] hw/arm/virt: preserve config for ACPI PCI hotplug
>>
>> Change ACPI DSM #5 to return 0 when ACPI PCI hotplug is used
>> to tell the guest kernel to keep all PCI resource allocations.
>>
>> This allows to use the pref64-reserve= option for pcie-root-ports
>> and thus enables hotplug of PCI devices with a barsize > 2M.
>>
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>> ---
>>   hw/arm/virt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b090233893..293a0c2163 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1094,6 +1094,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>           pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
>>                                                     vms->memmap[VIRT_ACPI_PCIHP].base);
>>           assert(pcihp_region_index >= 0);
>> +        vms->pci_preserve_config = true;
>>       }
>
> If we set this here, do we still need to set it in
> virt_machine_device_pre_plug_cb(), or is that now redundant?

I guess you can use accel SMMU without acpi pci hotplug and vice versa.

Thanks,
Sebastian


