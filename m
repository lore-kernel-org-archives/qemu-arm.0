Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83B8CD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 13:04:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSwsa-0006U0-Ie; Fri, 29 May 2026 09:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wSwsW-0006Og-OR
 for qemu-arm@nongnu.org; Fri, 29 May 2026 09:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wSwsV-0001Mb-0r
 for qemu-arm@nongnu.org; Fri, 29 May 2026 09:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780059832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k0h/e48HKzK8qaSEuhnE2gETMlM29GhONx96gOKhjY0=;
 b=ak1+4NMlQAfvzOnnLLcwPv+4dLCOA0jCCVnQkhp55UaHV1RER8vUko4x+18ZagOBmpHD65
 Kbk76o8DYvZ6Pipab3mf8GZoqpdIk557LFjB1+kuNFDlWng6LvdoDCvdwrGxvEbi8yW5We
 6MWigjk3/iAqCRJ3mOj3ZHFmijSJsrI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76--tktn3pHPSuxeObc_Hch4w-1; Fri, 29 May 2026 09:03:50 -0400
X-MC-Unique: -tktn3pHPSuxeObc_Hch4w-1
X-Mimecast-MFC-AGG-ID: -tktn3pHPSuxeObc_Hch4w_1780059829
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49050c44bcdso80200135e9.3
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 06:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780059829; x=1780664629;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k0h/e48HKzK8qaSEuhnE2gETMlM29GhONx96gOKhjY0=;
 b=ctgn0ume4zdmxFoozPBrM/VxwslYhPjwswxp28QR6WO0NPHhUHyRcuNRpw92llK+1T
 7PklhMVlezKypAA2AVEObghA+t1uIkY3rVoC7DhdrFh7Aa258U6LteUmKmgfOsodQfoq
 N2lOTMuhxQeVGVkZrmCSu4rJzaDZ9ZO1wZEYIKzRSKavs+uxr/Aj4KLYcZhQdnYew8Nv
 RPs1rI9N6D2rAw/MQzX2y5DDdBSGaCQW8KuynM06lwRdipi5UUxUvc7zNSM9PAuqXBo4
 UbVhAxaWpbFQtdAZhy54zPwqPkHaEH34ZSeKGjsPjZ9z5NLkzl2unm6pDd9TzIOIF4hq
 Ip7w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/7+sWpT8/5PnBgFNszpFd6N7dDEjPTF9bHgJWNb0Khyh+4EuL0xPpidMr6tFoqMgdCtfrzOiQ4MQ==@nongnu.org
X-Gm-Message-State: AOJu0YxVO9hKVP4Sx6BR6IOWW90omb4jn6MTmO8mNMv7o6FmpVlQPv3U
 levFrPOnYepPTMU3Vhy7suSbvW3AzeZV7mBd10ZzwXyIUhu4pNQT5uDuwxXVgIchZBi0mtGByNa
 F8xeHgJcyLsemxZBPz7qmShOAzEKWTg/R06Ov6YKETmH909SUoWr70g==
X-Gm-Gg: Acq92OGBwBbTz1EXVvo2n6SH4spiZuwb4QyaAPjnr0dFg91uHtllHA8P6l2xC6aq9RP
 tLJZV5/F5goGL/0usJfxeBwyFWSL6XsZnBCczbXXMEkj4DnVnJtqMndOOmA4OAtU8cYocqI3n7M
 oAusj8fd67sCWIZSbF9qha6gDMucTjYA4eczYEAjIh4NUovNCiVcOSHT774FbPpNVjWhJB//W/v
 qZpLuH3o7YIkR/BnR1dryX1E/H61I3BGMorlo8aR0W5ZSfdYqWYDsPYsLkzFlj6VvBqlnp95WoG
 c9GRnCCaXhcK6WOwsiLGONO9UkJVOb0FvVrl6Xyt5MvK9tZLtousxtD5izzvTOLuyWTJbvZioTW
 GPyzqExeDnLtKhny0VnWBvIlGtb0hm01X6nHiTuxrej0YbHec5WL6yImP339MhcBndUUG87aQFr
 gXTY9avg==
X-Received: by 2002:a05:600c:1c0d:b0:490:45bb:8dd8 with SMTP id
 5b1f17b1804b1-4909c0e02c1mr57151375e9.25.1780059829219; 
 Fri, 29 May 2026 06:03:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1c0d:b0:490:45bb:8dd8 with SMTP id
 5b1f17b1804b1-4909c0e02c1mr57150705e9.25.1780059828738; 
 Fri, 29 May 2026 06:03:48 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cabfd6esm45521605e9.15.2026.05.29.06.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 06:03:48 -0700 (PDT)
Date: Fri, 29 May 2026 15:03:46 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: mst@redhat.com, Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: preserve config for ACPI PCI hotplug
In-Reply-To: <CAFEAcA-PkO3aeGoaAzpbJGrrE-_-RjJy9Q4D4MnQ=9W61--3hA@mail.gmail.com>
Message-ID: <48595a74-78b5-6136-8752-0a73501b9531@redhat.com>
References: <0de640a2-8807-69cf-4429-672263e3e759@redhat.com>
 <CAFEAcA-PkO3aeGoaAzpbJGrrE-_-RjJy9Q4D4MnQ=9W61--3hA@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S4cnqIZpuE5hnFU8G2PlhGhfBgWFrG1rCgaxNz9-B4U_1780059829
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
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

Lack of resources on the parent bus/bridge device - the bridge windows are
2M per default on ARM. The native PCIe hotplug controller would add the
additional resources to the parent bridge and retry allocation. The
ACPI PCI hotplug controller does not do that. I'm curently playing with
a hack that adds this to acpiphp.

Sebastian


