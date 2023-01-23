Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2798373ejc;
        Mon, 23 Jan 2023 01:26:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsthKDWsbcTs8087vwgL9F6G119do6Mz4MNJfExX38D1ZY5fdGa7eQpNhA8G0hWVAPAKLcG
X-Received: by 2002:ac8:6605:0:b0:3b6:341c:9143 with SMTP id c5-20020ac86605000000b003b6341c9143mr31486614qtp.62.1674465974030;
        Mon, 23 Jan 2023 01:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674465974; cv=none;
        d=google.com; s=arc-20160816;
        b=q992/ueMo328RNXbOJHH/S962CIimqt/imGes7zVeKwPviV1uYsZ05zWCy5fCsHZ8n
         p+lXME4yHYzcCCFSCO+H4S5BRkKklHOgr1jJYI/S+V2XDSEP/EH+eoFmsgRBMXIx/tR9
         9VNZ7KsU3BUpTx4uQXrsr/J96l7m/+jcK4+tkPNsU40f2R1NhjHZMCMo9t+dBqRcWfNT
         1E6GrpCVl7U965ctUKfGTKJIcZ/VdKr24CyNmKghoDEB1db/32/kLGt0Ldd/UgVdyzih
         Y5yKFmzWDP+MU+9kKD7m/jWwJDQ4ZJ6EF5gra//VieW2hW3JGzW1/Be0XX9WX5Gd1yZp
         ckiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fIBVz5Zn9FAE5uYwqrJflvFRS/TZJypsPtl07V6NFz0=;
        b=QPR0Ap7A+ZTPC+N6RpxlK+1u7S8Rk8pAKMwyH3ljojA0fzJrcRTb835w74Ud4ESPnZ
         4r4+24VGV3TTtwyTGgLstznRyDoqn/8LCL4R7N7NgWIHWuz596GXDNq4QVxlee224JZZ
         JcSTE3Obi0wozpyJtHdd/8FXxoIlMRLklv9sRKwUKtxdV1/1xFU3ZBZxtHDlRXHzTUjM
         fsLJbAxawxi7CVJCitACUjhGjFOqUyEY9QzIkK1XRx9HmYurcKMvILdsz5jEz4LY+wY1
         S0w2B/YfvdvUYncAoRiwqWz1Bv5tbJPhBqJpzQNQF1iNlQMPBJ+AOXgHTYgCXzbWbV4r
         gO6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acydmEUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe9-20020a05622a4d4900b003ac5966d01csi9541124qtb.665.2023.01.23.01.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 01:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acydmEUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJt5S-0000ez-Sk; Mon, 23 Jan 2023 04:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJt5Q-0000dh-U7
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 04:25:57 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJt5P-0008K5-3v
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 04:25:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id k16so8457269wms.2
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 01:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fIBVz5Zn9FAE5uYwqrJflvFRS/TZJypsPtl07V6NFz0=;
 b=acydmEUeBUeu09mrtfZHZ5Ji6XVV7RDyZbeUCIcPzwkxvhHmdplvJe5KhqXiUB3+w9
 P3rsU4mSqupJFUBzk9hXbTh2ajhd6K1AzxCe6iiIetp6nArCasZ26QvZjfbdONAA3EiR
 tgUr+OSfKZhWu2VajdR9zXOV+FiSvbY8syeJZ0htoTJz2DEA1iIEw07XwF0YCgqupnQW
 zTBwX5CbU+gc8Iz//881Nt/nS6d1bCux9+dcgsS9ZEvl8qoHdQdB7ZDIlbVUWFfX/TvH
 sxnYLeotrwZBv9C4Trc9OWYQopLcOyWXHt3K+FQ6ps5qBYBmWHAue2OMuyazS0w3OW3d
 7W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fIBVz5Zn9FAE5uYwqrJflvFRS/TZJypsPtl07V6NFz0=;
 b=QMy0C6UQuzk29jt9pfZ/z8iQ2luYSmQWmLSdtXnQuz36yP9AtOsHNqGKGyhen7j+p0
 PFP/apYO7dbGi3Nrgps6U1Kt1T3F9Aj2iUcniCcJ+nDM0WEenurfhRdeRdREAY76YHTs
 RmcYc4Up1RRhklz2zK/aisT6EyjpzB1XIfiOGAAVy6Y7kYpOv+3X9gsS+gDtGsNaw0z+
 mUyopYQAr6mJhfV2arf50BJBMfp9y84q+NqU8F4Hgb5g3e1ove+mti0UmbpzWkY595e8
 T9hmPww8rbaVaUh9wD220OFMuANOxJkYIkZ0onQb0n4bxT6dihPgzoLDDC0gZOm/n+bn
 +Y7A==
X-Gm-Message-State: AFqh2kq0KpnfwOOpFCjmTdhafOoUlJ4fnTqLDEhMkCTaMD0C8crr3ozc
 xXZtd4ikhJH2T3LWt4k2VAKvZA==
X-Received: by 2002:a05:600c:4e4b:b0:3db:2e6d:9f79 with SMTP id
 e11-20020a05600c4e4b00b003db2e6d9f79mr11870358wmq.39.1674465953513; 
 Mon, 23 Jan 2023 01:25:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r12-20020a5d4e4c000000b002be1d1c0bd7sm15016890wrt.93.2023.01.23.01.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 01:25:53 -0800 (PST)
Message-ID: <9578e7ca-5f3d-2d00-7288-16ae486fb8c0@linaro.org>
Date: Mon, 23 Jan 2023 10:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 00/33] Consolidate PIIX south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
 <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
 <752135A6-44DC-4504-8E16-C2E71EC76872@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <752135A6-44DC-4504-8E16-C2E71EC76872@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: m6H+Qu62WW3W

On 20/1/23 13:22, Bernhard Beschow wrote:
> Am 13. Januar 2023 17:39:45 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> Am 13. Januar 2023 08:46:53 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> On 9/1/23 18:23, Bernhard Beschow wrote:
>>>> This series consolidates the implementations of the PIIX3 and PIIX4 south
>>>> bridges and is an extended version of [1]. The motivation is to share as much
>>>> code as possible and to bring both device models to feature parity such that
>>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
>>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
>>>> list before.
>>>
>>>> Bernhard Beschow (30):
>>>>     hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>>>>     hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>>>>     hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific
>>>>     hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>>>     hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>>     hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>>>     hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>>>>     hw/i386/pc: Create RTC controllers in south bridges
>>>>     hw/i386/pc: No need for rtc_state to be an out-parameter
>>>>     hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>>>       south bridge
>>>>     hw/isa/piix3: Create USB controller in host device
>>>>     hw/isa/piix3: Create power management controller in host device
>>>>     hw/isa/piix3: Create TYPE_ISA_PIC in host device
>>>>     hw/isa/piix3: Create IDE controller in host device
>>>>     hw/isa/piix3: Wire up ACPI interrupt internally
>>>>     hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>>     hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>>     hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>>     hw/isa/piix3: Drop the "3" from PIIX base class
>>>>     hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>>     hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>>     hw/isa/piix4: Use TYPE_ISA_PIC device
>>>>     hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>>     hw/isa/piix4: Rename reset control operations to match PIIX3
>>>>     hw/isa/piix3: Merge hw/isa/piix4.c
>>>>     hw/isa/piix: Harmonize names of reset control memory regions
>>>>     hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>>     hw/isa/piix: Rename functions to be shared for interrupt triggering
>>>>     hw/isa/piix: Consolidate IRQ triggering
>>>>     hw/isa/piix: Share PIIX3's base class with PIIX4
>>>>
>>>> Philippe Mathieu-Daudé (3):
>>>>     hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>>>     hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>>>     hw/isa/piix4: Correct IRQRC[A:D] reset values
>>>
>>> I'm queuing the first 10 patches for now to alleviate the size of this
>>> series, and I'll respin a v7 with the rest to avoid making you suffer
>>> any longer :/ Thanks for insisting in this effort and I apologize it
>>> is taking me so long...
>>
>> Okay... What's the further plan? Is there anything missing?
> 
> Ping

The plan is "I'll respin a v7 with the rest".
