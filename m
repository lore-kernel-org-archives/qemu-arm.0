Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2836362lfg;
        Tue, 22 Jun 2021 01:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKCrrneuxzGVZoVSIwmYTVAM8k26ySNDVLYTU83ElG85B9DSPtrUZqxBYRSuOSGfNmkqmr
X-Received: by 2002:ac8:728c:: with SMTP id v12mr2370699qto.324.1624350029300;
        Tue, 22 Jun 2021 01:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624350029; cv=none;
        d=google.com; s=arc-20160816;
        b=anyOM6vYCfSY57dH5jTXN50pEjBeX5Xmw0OcuqrKI6p2uS8ZEz6KmcIGxuX+LH83vk
         VaBhyh3wO23XJh2jUiC1TIQoKCvI/ypI7MjBE5rQEZ9SfzaXdgCPp+v5yaZmpA2VxtoX
         4+4PXhQE6hpsdVsr9Alz8ID2TJvSZzs5Je6/wBu8ZQCcGqFleLdfdpzVnv3+SCgTcn1y
         mlmpvsHBzHJ3jeXID+n9zHZSiCzFUC2Nr8ocpgpWwTGXMcbYvhamsSdFcVkSMpJbkVIb
         5U3imBwbFvgNOF8v3v4makNEN7KlRxTA/hrucfI9VwKoSDTLOnM7vFhoSjulVd8Xakvw
         NcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=OJfG6xHzKZO4p1mF7QOoq2I//Jjw6HTCsW5K0iOYu3Q=;
        b=aizrAdFSGXVGfoCqqlsrOTB5CGyLm9Zss8APFlfKLKksYC1Lq/r97p3Q6Mh9v2DJRG
         t4jhLaNEaWuIrtu8pya9oJT572tD16KGWOmkae+MUQKBp5qydAqolkiGPvxov7QqhVcw
         gyWTHQFU84QmPs/k1NPv8b7EfTCLB1g71yICYdvDr+Cez7kMJNRB4PjdkHIembAfa7KK
         TW/5ib1RVEjfa1r9goB82PFEZlW2qKdSCaRGADeCnmDNw6P83BEeLbUSWROS8wOT74GK
         nTkSUPzdj8Tn3yUGaTP5l51OWwMFps6OmxQLHZ2PYeu3ndJb6Xjb4w4re/jyCZ2Odmgl
         8HjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bWCturH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si7578792qvr.142.2021.06.22.01.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 01:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bWCturH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvbe0-0006Fu-Jn
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 04:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lvbdq-0006FF-8H
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 04:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lvbdo-0003M4-8W
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 04:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624350015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJfG6xHzKZO4p1mF7QOoq2I//Jjw6HTCsW5K0iOYu3Q=;
 b=bWCturH/RemvZdq/128m6Zp/BQ83a2JodnjwOcsIne+vQB9OzfvdCxCv5yVF624EQJPgXy
 XrN7bbIVsU1N5E87XwaDhLH3qpl4uuzq+zk5EPnY2KrkgmUO20iLqENXsvfKF5efpoRvnV
 zY3oaduJl50tg/vzPkvDA3vfPFbX5Tg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-Gh6mJl1mPJKHSvDyo59pRQ-1; Tue, 22 Jun 2021 04:20:12 -0400
X-MC-Unique: Gh6mJl1mPJKHSvDyo59pRQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m186-20020a1c26c30000b02901e1c85168f1so127838wmm.2
 for <qemu-arm@nongnu.org>; Tue, 22 Jun 2021 01:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OJfG6xHzKZO4p1mF7QOoq2I//Jjw6HTCsW5K0iOYu3Q=;
 b=XimEtEFQdMy6T1lNmpKdeRixHpaqy5hbUP73LcS3vFcMFTog7Eog01FDgrVBoazCY8
 0OFDoXPOaaod4ET3u8+xJrC0hTWwiW4fnSzr31XWB57PRHSXdZ3yR2um5sLeAUKTJe/y
 rxVjL+IeDnWoZy//Jo4nBJvY7kFE6cUl4LKfAbVu3DByQZuEDwzcsF/8S1HATsxaj/qe
 V+TTaviaJNZ8m6ZfeZ6x/Ap/vNwc2brhRwtN3Pdz9nCagMUnxOHy2EdlRaM5LDBY0VPR
 ULIpf6TDKzPMTadZvfEQXx+DYsR4XY0XlIjJJ00OweDUhBuwyByc/v9w8t+ztxOopUeo
 nLXw==
X-Gm-Message-State: AOAM532P05YLPhlh+UN70Qs/6A+8gqonpEH18MdBr0PhaRLLEaDIPE9J
 i17XoTq/61AkKYxNrla+bQ47wQG0fKLBd4Z6G0zAQMYV97/3aV2zgUVggnHu6gxtbfWfoC24PLh
 hFodYsOF1Hz70
X-Received: by 2002:a05:600c:210:: with SMTP id
 16mr3132902wmi.59.1624350010694; 
 Tue, 22 Jun 2021 01:20:10 -0700 (PDT)
X-Received: by 2002:a05:600c:210:: with SMTP id
 16mr3132869wmi.59.1624350010385; 
 Tue, 22 Jun 2021 01:20:10 -0700 (PDT)
Received: from [192.168.43.95] ([37.173.9.63])
 by smtp.gmail.com with ESMTPSA id z6sm16031414wrh.65.2021.06.22.01.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 01:20:09 -0700 (PDT)
Subject: Re: QEMU PCIe expander bridge with 64kB page guest -> guest BUG_ON()
From: Eric Auger <eauger@redhat.com>
To: qemu list <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Ard Biesheuvel <ardb@kernel.org>, Xingang Wang <wangxingang5@huawei.com>,
 miaoyubo@huawei.com
References: <1811f735-3426-08c0-ee86-b410b632efb5@redhat.com>
Message-ID: <f3a5e2ce-54fd-f19a-4a8c-1cdcc4ba8f57@redhat.com>
Date: Tue, 22 Jun 2021 10:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1811f735-3426-08c0-ee86-b410b632efb5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bDTySzGhyMeU

Adding Yubo in the loop as Jiahui's address is bouncing.


On 6/21/21 6:22 PM, Eric Auger wrote:
> Hi Jiahui,
> 
> I noticed the PCIe expander bridge + PCIe root port does not work with a
> 64kB page guest. One hits a kernel BUG at mm/vmalloc.c:96
> (BUG_ON(!pte_none(*pte));)! This happens with an upstream guest.
> 
> I understand this happens on pci_remap_iospace when handling the Io16
> regions below. Wonder if the edk2 code could be the source (I saw you
> write both the edk2 and the qemu part [edk2-devel] [PATCH v2 0/4] Add
> extra pci roots support for Arm).
> 
> Please could give me a hand?
> 
> Best Regards
> 
> Eric
> 
> 
> Sample qemu cmd options:
> 
> -device pxb-pcie,bus_nr=4,id=bridge,bus=pcie.0 \
> -device pcie-root-port,bus=bridge,chassis=4,id=pcie.11 \
> -device virtio-net-pci,bus=pcie.11,netdev=nic0,mac=6a:f5:10:b1:3d:d2
> -netdev
> tap,id=nic0,script=/home/augere/TEST/SCRIPTS/qemu-ifup,downscript=/home/augere/TEST/SCRIPTS/qemu-ifdown
> 
> 
> [    2.867734] ACPI: PCI Root Bridge [PCFE] (domain 0000 [bus fe-ff])
> [    2.869339] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
> ClockPM Segments MSI EDR HPX-Type3]
> [    2.871405] acpi PNP0A08:00: _OSC: platform does not support [LTR DPC]
> [    2.873226] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME
> AER PCIeCapability]
> [    2.875609] acpi PNP0A08:00: ECAM area [mem
> 0x401fe00000-0x401fffffff] reserved by PNP0C02:00
> [    2.877830] acpi PNP0A08:00: ECAM at [mem 0x401fe00000-0x401fffffff]
> for [bus fe-ff]
> phys_addr=0x3eff3000
> [    2.884036] ------------[ cut here ]------------
> [    2.885249] kernel BUG at mm/vmalloc.c:96!
> [    2.886322] Internal error: Oops - BUG: 0 [#1] SMP
> [    2.887560] Modules linked in:
> [    2.888352] CPU: 7 PID: 1 Comm: swapper/0 Not tainted
> 5.13.0-rc6-guest-64K+ #57
> [    2.890216] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0
> 02/06/2015
> [    2.891983] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
> [    2.893519] pc : vmap_range+0x1d8/0x208
> [    2.894600] lr : vmap_range+0x38/0x208
> [    2.895615] sp : fffffe0012c2f7f0
> [    2.896517] x29: fffffe0012c2f7f0 x28: fffffffefe800000 x27:
> fffffffefe801000
> [    2.898437] x26: ffffffff20070000 x25: 00000001407f0000 x24:
> 0140000000000000
> [    2.900357] x23: fffffe001134ffb8 x22: 000000000000003f x21:
> 0068000000000717
> [    2.902284] x20: 000000003eff3000 x19: fffffffefe801000 x18:
> 0000000000000010
> [    2.904236] x17: 0000000000000000 x16: 0000000000000001 x15:
> ffffffffffffffff
> [    2.906157] x14: 695f70616d65725f x13: 696370202a2a2a2a x12:
> fffffe0011c77150
> [    2.908084] x11: 0000000000000003 x10: fffffe0011bb7110 x9 :
> fffffe0010d33ad4
> [    2.909996] x8 : 00000000000bffe8 x7 : c0000000ffff7fff x6 :
> 0000000000000001
> [    2.911323] x5 : 0000000000000000 x4 : 000000003eff0000 x3 :
> 0000000000001ff7
> [    2.912631] x2 : 0040000000000001 x1 : fffffc07f4080038 x0 :
> fffffc07ffbecdc0
> [    2.913951] Call trace:
> [    2.914398]  vmap_range+0x1d8/0x208
> [    2.915363]  ioremap_page_range+0x20/0x30
> [    2.916453]  pci_remap_iospace+0xcc/0xf0
> [    2.917519]  acpi_pci_probe_root_resources+0x244/0x268
> [    2.918907]  pci_acpi_root_prepare_resources+0x28/0xc8
> [    2.920281]  acpi_pci_root_create+0x9c/0x2f8
> [    2.921443]  pci_acpi_scan_root+0x14c/0x230
> [    2.922574]  acpi_pci_root_add+0x268/0x5c0
> [    2.923710]  acpi_bus_attach+0x15c/0x2c0
> [    2.924794]  acpi_bus_attach+0x9c/0x2c0
> [    2.925833]  acpi_bus_attach+0x9c/0x2c0
> [    2.926881]  acpi_bus_scan+0x64/0x118
> [    2.927875]  acpi_scan_init+0x10c/0x25c
> [    2.928922]  acpi_init+0x3e8/0x458
> [    2.929847]  do_one_initcall+0x54/0x268
> [    2.930879]  kernel_init_freeable+0x290/0x344
> [    2.932068]  kernel_init+0x1c/0x128
> [    2.933017]  ret_from_fork+0x10/0x18
> [    2.934005] Code: a90687e2 97f518e5 a94687e2 17ffffe4 (d4210000)
> [    2.935673] ---[ end trace 1d687ce361e3e7ca ]---
> [    2.936922] Kernel panic - not syncing: Oops - BUG: Fatal exception
> [    2.938611] SMP: stopping secondary CPUs
> [    2.939760] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal
> exception ]---
> 
> 
> At EDK2 level I have:
> 
> PciBus: Resource Map for Root Bridge PciRoot(0x0)^M
> Type =   Io16; Base = 0x0;      Length = 0x3000;        Alignment = 0xFFF^M
>    Base = 0x0;  Length = 0x200; Alignment = 0xFFF;      Owner = PPB
> [00|02|02:**]^M
>    Base = 0x1000;       Length = 0x200; Alignment = 0xFFF;      Owner =
> PPB [00|02|01:**]^M
>    Base = 0x2000;       Length = 0x200; Alignment = 0xFFF;      Owner =
> PPB [00|02|00:**]^M
> Type =  Mem32; Base = 0x10000000;       Length = 0x700000;
> Alignment = 0x1FFFFF^M
>    Base = 0x10000000;   Length = 0x200000;      Alignment = 0x1FFFFF;
> Owner = PPB [00|02|02:**]^M
>    Base = 0x10200000;   Length = 0x200000;      Alignment = 0x1FFFFF;
> Owner = PPB [00|02|01:**]^M
>    Base = 0x10400000;   Length = 0x200000;      Alignment = 0x1FFFFF;
> Owner = PPB [00|02|00:**]^M
>    Base = 0x10600000;   Length = 0x1000;        Alignment = 0xFFF;
> Owner = PPB [00|02|02:10]^M
>    Base = 0x10601000;   Length = 0x1000;        Alignment = 0xFFF;
> Owner = PPB [00|02|01:10]^M
>    Base = 0x10602000;   Length = 0x1000;        Alignment = 0xFFF;
> Owner = PPB [00|02|00:10]^M
> Type =  Mem64; Base = 0x8000000000;     Length = 0x200000;
> Alignment = 0xFFFFF^M
>    Base = 0x8000000000; Length = 0x100000;      Alignment = 0xFFFFF;
> Owner = PPB [00|02|01:**]; Type = PMem64^M
>    Base = 0x8000100000; Length = 0x100000;      Alignment = 0xFFFFF;
> Owner = PPB [00|02|02:**]; Type = PMem64^M
> 
> 
> PciBus: Resource Map for Root Bridge PciRoot(0x4)^M
> Type =   Io16; Base = 0x3000;   Length = 0x1000;        Alignment = 0xFFF^M
>    Base = 0x3000;       Length = 0x200; Alignment = 0xFFF;      Owner =
> PPB [04|00|00:**]^M
> Type =  Mem32; Base = 0x10800000;       Length = 0x300000;
> Alignment = 0x1FFFFF^M
>    Base = 0x10800000;   Length = 0x200000;      Alignment = 0x1FFFFF;
> Owner = PPB [04|00|00:**]^M
>    Base = 0x10A00000;   Length = 0x1000;        Alignment = 0xFFF;
> Owner = PPB [04|00|00:10]^M
> ^M
> PciBus: Resource Map for Bridge [04|00|00]^M
> Type =   Io16; Base = 0x3000;   Length = 0x200; Alignment = 0xFFF^M
>    Base = Padding;      Length = 0x200; Alignment = 0x1FF^M
> Type =  Mem32; Base = 0x10800000;       Length = 0x200000;
> Alignment = 0x1FFFFF^M
>    Base = Padding;      Length = 0x200000;      Alignment = 0x1FFFFF^M
> Type =  Mem32; Base = 0x10A00000;       Length = 0x1000;
> Alignment = 0xFFF^M
> 

