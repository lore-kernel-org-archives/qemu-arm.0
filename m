Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628DBCD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 12:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSZb6-0004Do-Uv; Thu, 28 May 2026 08:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wSZar-00045B-OR
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:12:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wSZan-0003lZ-P2
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779970324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tk8BQ6XRea2fMi8HhetRywoo6kj1M3c2NWpNTJXZ0NE=;
 b=YX3l2xEqWqa6CG9/2bCDFmQatBh1tg74g05zJ5aUHf8ko/s+KV+QXFIArdWqm8ONEF3m9K
 7m5m4PTHbtW7s4kB7db5nhYmMOrRJ+jIeECnDThfv8LRzS1pJ3SdjI7uHyiJr6DlxMOEDY
 cm1XCKmI9UOX1TPj3OvAFJdaTR4jYGU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-1n9Nutn6NvqofHu1W4Nc9A-1; Thu, 28 May 2026 08:12:02 -0400
X-MC-Unique: 1n9Nutn6NvqofHu1W4Nc9A-1
X-Mimecast-MFC-AGG-ID: 1n9Nutn6NvqofHu1W4Nc9A_1779970321
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48eb0da933fso86415815e9.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779970321; x=1780575121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tk8BQ6XRea2fMi8HhetRywoo6kj1M3c2NWpNTJXZ0NE=;
 b=GCn813L22KeYvwjNaDcj8Qk+WJzTjAso/GTxRP1WoyKb98KTQKFaE4SDl7aSMlX9GL
 DPs3JqriZvWd35XXwr4ar+5WRYJYfVOj0Fk6Wz7WPdznkFmeOBk6CEPS4Zg/z5OzkK5Y
 mvuWe5j+zsmftc2MKbCXDJq7vOPOGJi9iBI6FPWNNeQ0E8bqcfnECRJPGq6LqA0U1ALO
 /9pI8o0ZAxcrCrCbVux8HgY6F3top/NvBLgowNrPNHy4tB9nT21975Ee6dZ0kfQuj/XP
 WQRmfPdcToFzn8iSl7eMQp70dqnvDcqtIInVq0rNvA8aDjQwaFtF09ngQUEANfreZ/kV
 IXvg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9AZSwlNQi4u49rQePYQNgC8HInX+rkNAfRecC1OMQnvGhAZxSq4q6/OKY964HNhcWjx1CsJ2duWg==@nongnu.org
X-Gm-Message-State: AOJu0YzDxWGH1X8Nkjgl7w/gqBmljhYehE/A/D0kxrM+jPoFP2mc6dlt
 4hPtZem+TMvhLkKWCHv0bGd5HEyILYmGBljS4JhgL7ab/fxrS/yg6czz2lQKiBInGAgxr4qr9vd
 extIlYK51vAUTPSmPjazWKhiOcYjAVkkXy6aISlO3Or4Wpuw6bxUdiA==
X-Gm-Gg: Acq92OEs/87ii9Kns7jPpMDlNUycmfh/BcsBa8EAN181ivT8OrLXpQudFrz8g3dCm19
 61Hu4bXkOoXTk1ZE9vUNnflSDoKLfxOsGfilble80Len4pRK0KCn/4H98b83Ho/MtgppDp/Zqft
 s/P9Z3H5aCE+7u5dC6JPPJsEheb2pnMQbqCUaNsmdOS7W01HAeLWFM8pkDHKX2K9DzvDltCUEAW
 VGBfExCRdf5giFE/IXpSD83EL7LpRD5Bet00cGFj9sSCV41lHdFedI32nvoSHyX2w4UWPMM1U46
 qP9EyBRcECkUkxyVC2eMmNiiFlizM6LaNSmijpjuzFDJTKi1COHFC9SI0/o7TAVmogyn94+MiZN
 TRqbL54QZZSHWt0KW7Oqbe4dwzs5pEX++kqbI3HZ+xH1GzK7oTYVGa4AChyuZQvc1ZUOE4o0f61
 8=
X-Received: by 2002:a05:600c:a49:b0:490:6889:202 with SMTP id
 5b1f17b1804b1-4906889026emr277848215e9.29.1779970321271; 
 Thu, 28 May 2026 05:12:01 -0700 (PDT)
X-Received: by 2002:a05:600c:a49:b0:490:6889:202 with SMTP id
 5b1f17b1804b1-4906889026emr277847835e9.29.1779970320846; 
 Thu, 28 May 2026 05:12:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908eab248csm14188535e9.14.2026.05.28.05.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 05:12:00 -0700 (PDT)
Message-ID: <da658efa-13a5-426f-b801-67d56bfbb1ae@redhat.com>
Date: Thu, 28 May 2026 14:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt: preserve config for ACPI PCI hotplug
To: Peter Maydell <peter.maydell@linaro.org>, Sebastian Ott <sebott@redhat.com>
Cc: mst@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Jonathan Cameron <jic23@kernel.org>
References: <0de640a2-8807-69cf-4429-672263e3e759@redhat.com>
 <CAFEAcA-PkO3aeGoaAzpbJGrrE-_-RjJy9Q4D4MnQ=9W61--3hA@mail.gmail.com>
 <582348f6-c128-96b6-4d40-1c078e24038d@redhat.com>
 <CAFEAcA-vidfEaZ=CO_68JmGNmVSsasMGJzppS4mkpAvYL9Yydg@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <CAFEAcA-vidfEaZ=CO_68JmGNmVSsasMGJzppS4mkpAvYL9Yydg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VylLaHYPLZsl4wiefQ5TdrdIJBmXP9LGHZYR3tpQJvM_1779970321
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Peter,

On 5/28/26 1:46 PM, Peter Maydell wrote:
> On Thu, 28 May 2026 at 12:23, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> On Thu, 28 May 2026, Peter Maydell wrote:
>>> On Thu, 28 May 2026 at 10:23, Sebastian Ott <sebott@redhat.com> wrote:
>>>>
>>>> ACPI PCI hotplug of a PCI device using a bar > 2M fails on ARM
>>>> with a resource allocation failure in the guest kernel (Linux):
>>>>
>>>> qemu-system-aarch64 [..] -device pcie-root-port,id=rp1,bus=pcie.0 \
>>>>                     -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on \
>>>>                     -pflash /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.qcow2
>>>>
>>>> (qemu) device_add pci-testdev,bus=rp1,membar=4M
>>>>
>>>> [   55.106283] pci 0000:01:00.0: [1b36:0005] type 00 class 0x00ff00 conventional PCI endpoint
>>>> [   55.107627] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00000fff]
>>>> [   55.107864] pci 0000:01:00.0: BAR 1 [io  0x0000-0x00ff]
>>>> [   55.108015] pci 0000:01:00.0: BAR 2 [mem 0x00000000-0x003fffff 64bit pref]
>>>> [   55.118609] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: can't assign; no space
>>>> [   55.118653] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: failed to assign
>>>> [   55.118671] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: assigned
>>>> [   55.122828] pci 0000:01:00.0: BAR 1 [io  0x1000-0x10ff]: assigned
>>>> [   55.127090] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: releasing
>>>> [   55.127098] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: can't assign; no space
>>>> [   55.127102] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: failed to assign
>>>> [   55.127106] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: assigned
>>>>
>>>> This behavior is exactly the same on x86 - except the busses are created
>>>> with a default window size of 256M there. If the PCI devices being
>>>> hotplugged use a bar > 256M you get the same failure like on ARM.
>>>>
>>>> The workaround on x86 is to specify "pref64-reserve=" for the PCIe
>>>> root-port. On ARM this is currently ignored.
>>>
>>> From the perspective of somebody who doesn't know much about
>>> ACPI or PCI, this commit message doesn't really tell me why
>>> QEMU needs to change. The above reads like "this is a kernel
>>> problem" to me. Why is the kernel unable to allocate this BAR?
>>
>> DSM #5 defaults to 1 on ARM which tells the OS that it could
>> ignore the firmwares PCI configuration at boot time. Linux is
>> just doing that. The acpi pci hotplug controller can't find a
>> sufficient resource window of the parent bus and resource
>> allocation fails. DSM #5 == 0 tells the OS to not ignore the
>> boot time config from firmware.
> 
> OK, but if the firmware can find a working PCI configuration,
> why can't the kernel also do that?
> 
>>>> The following patch changes ACPI DSM #5 to return 0 (only when
>>>> ACPI HP is used) which basically tells the guest kernel to keep
>>>> all PCI resource allocations.
>>>
>>> If this makes things work why isn't it the default for all ACPI?
>>> Why doesn't the kernel ignore the ACPI table setting and do
>>> the thing that works all the time? Do we break some other use
>>> case by setting it to 0 ?
>>
>> From what I was able to find in the archives this has been tried
>> before but led to regressions for legacy devices:
>> https://lore.kernel.org/all/20210724185234.GA2265457@roeck-us.net
> 
>> It was recently selectively enabled for accel SMMU - I guess the
>> rational was that you don't use accel SMMU with legacy devices:
>> 45c57eaefd hw/arm/virt: Set PCI preserve_config for accel SMMUv3
> 
>     /*
>      * Accel SMMU requires RMRs for MSI 1-1 mapping, which require _DSM
>      * function 5 (_DSM for Preserving PCI Boot Configurations).
>      */

> 
> This isn't really very informative to me either... (I have cc'd
> some people involved in the smmu-accel stuff.)

The requirement stems from the IORT specification as we are relying on
reserved memory regions:

"If reserved memory regions are present, the OS must preserve PCIe
configuration performed by the boot firmware. This preservation is
required to ensure functional continuity of the endpoints that are using
the reserved memory regions. Therefore, RMR nodes must be supported by
the inclusion of the PCI Firmware defined _DSM for ignoring PCI boot
configuration, Function 5, in the ACPI device object of the PCIe host
bridge in ACPI namespace. The _DSM method should return a value of 0 to
indicate that the OS must honour the PCI configuration that the firmware
has done at boot time. See [PCIFW] for more details on this _DSM method.
"

Eric

> 
> The quote of the spec from that other thread on what the values mean is:
> 
> # 0: No (The operating system shall not ignore the PCI configuration
> #  that firmware has done at boot time. However, the operating system
> # is free to configure the devices in this hierarchy that have not
> # been configured by the firmware. There may be a reduced level of
> # hot plug capability support in this hierarchy due to resource
> # constraints. This situation is the same as the legacy situation
> # where this _DSM is not provided.)
> # 1: Yes (The operating system may ignore the PCI configuration that
> # the firmware has done at boot time, and reconfigure/rebalance the
> # resources in the hierarchy.)
> 
> For "1", that's a "may", not a "must". So that sounds to me like
> QEMU should always report 1, and the OS can choose whether it wants
> to use the existing PCI config from the firmware, wipe it and start
> afresh, or some mixture of the two.
> 
> Similarly, it's not clear to me either why the accel SMMU stuff
> needs this to be set to 0.
> 
> To me this all sounds like it's a guest kernel problem, and we
> should drop all the preserve_config handling and let the guest
> OS sort out what it wants to do.
> 
> thanks
> -- PMM
> 


