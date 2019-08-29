Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2104288wrs;
        Thu, 29 Aug 2019 05:51:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSWhtVNR/iT1d/oZSRSL0kajRlIdzUuFa41WUXicL008yUFV5nyF1xWHTPcKrd2wbZQ+us
X-Received: by 2002:a05:620a:11a6:: with SMTP id c6mr9378644qkk.275.1567083114260;
        Thu, 29 Aug 2019 05:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567083114; cv=none;
        d=google.com; s=arc-20160816;
        b=HoqzdytR59GcK4IjIgtIUSnZmr6vVwTOILXeEKjjpeORUvjpjSFXh485nyv6ektTeE
         /gNDBLCVjEvDuBr4+4dMj2EYo2UDBfxeaaWiOCITtQBgJnknl9AdCoQSwBKdwISxqMRx
         gS5FthJJUMg33j6fOBoPu0B+k+kyA5JL3tdiMADdpZi1TFWXXy9IppYiYwcP0Zn19pND
         I95+k4VYLG7wovAKqkh1I3IreKUH71iMxfSnND9+NvAI95xXf1r6CDLpn6TMxWWSZqr7
         c9BFgua44tE7E/BKb+RWH5ygnaASsOFXLrGOwmzkyqemeiwcy6OvEawsUrW7S1L2R6cG
         2EKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=E2OADY1uuEZbQli888KEKsXsvGkGT4Gpwlt4WsDzgEU=;
        b=xhNMlW5WYlwy4iQQBrIGj7RFBxmFkwhwPQH/IqLJ+HVVUDKxKnsoz+ui3idMV86uPD
         X0JUL/A7yoql+BzIP/T3Pk1fqoOZdYB+MUJCK//shJkAzZcpO87EHlsqtMlotFiS7CnV
         bzLcDaXxf6MUQny1LS3juXz6vmLnTkuN0Fb37gPq0XlL/PTCKfDmjobL9GTyckx1PMVX
         qzEOu6yJ9mfOcIrp7Kg8QaYJI0BMKP8FypFvTth5g8jWhpDJtn0s9QJpnYc6q1IWUC9D
         knO4eorOFW2T4MOeO+/PFI7qUsovfN5/ga5ylAGyfx17hsDw5rcO5U0vwOm4Gin5yVij
         1NXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si1677744qkg.125.2019.08.29.05.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 05:51:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3Ju5-0002Ss-4g
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 08:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3Jta-0002LP-0N
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 08:51:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3JtY-00051I-HU
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 08:51:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3JtY-00050G-8D; Thu, 29 Aug 2019 08:51:20 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5ABF412A2;
 Thu, 29 Aug 2019 12:51:19 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B3211001938;
 Thu, 29 Aug 2019 12:51:08 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-6-eric.auger@redhat.com> <20190816040016.GA3114@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <cd8ced8e-6bf6-72cc-e345-14e5b87b585e@redhat.com>
Date: Thu, 29 Aug 2019 14:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190816040016.GA3114@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 29 Aug 2019 12:51:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 05/15] virtio-iommu: Add the
 iommu regions
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IGh1SmwTfwk0

Hi Peter,

On 8/16/19 6:00 AM, Peter Xu wrote:
> On Tue, Jul 30, 2019 at 07:21:27PM +0200, Eric Auger wrote:
> 
> [...]
> 
>>  static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
>>  {
>>      VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
>> @@ -266,6 +333,15 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>> +
>> +    memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
>> +    s->as_by_busptr = g_hash_table_new(NULL, NULL);
> 
> VT-d was using g_hash_table_new_full() so that potentially VTDBus can
> still be freed.  Here for IOMMUPCIBus allocated in
> virtio_iommu_find_add_as() I think it'll be leaked if we remove
> entries in the hash table?
> 
> So I started to wonder whether PCI/PCIe buses are allowed to be
> plugged/unplugged after all because I never tried.  With latest
> 5.3.0-rc4 guest I gave it a shot and I see the error below.  It could
> be something that I did wrong or it could be simply that it's not
> working at all.  Have you tried anything like that?  Michael/Alex?

I have never tried this on my end.

However looking at docs/pcie_pci_bridge.txt it seems possible to hotplug
a pcie_pci_bridge downstream to a pcie-root-port under specific
conditions (see limitations section). So I guess the situation you
describe may happen. I switched to _full version.

Thanks

Eric


> 
> bin=x86_64-softmmu/qemu-system-x86_64
> $bin -M q35,accel=kvm,kernel-irqchip=on -smp 8 -m 2G -cpu host \
>      -monitor telnet::6666,server,nowait -nographic \
>      -device e1000,netdev=net0 \
>      -netdev user,id=net0,hostfwd=tcp::5555-:22 \
>      -device pcie-pci-bridge,bus=pcie.0,id=pci.1 \
>      -drive file=/images/default.qcow2,if=none,cache=none,id=drive0 \
>      -device virtio-blk,drive=drive0
> 
> (qemu) device_add pci-bridge,bus=pci.1,id=pci.2,chassis_nr=1,addr=1.0
> 
> [   66.172352] pci 0000:01:01.0: [1b36:0001] type 01 class 0x060400
> [   66.176897] pci 0000:01:01.0: reg 0x10: [mem 0x00000000-0x000000ff 64bit]
> [   66.186130] pci 0000:01:01.0: No bus number available for hot-added bridge
> [   66.189489] shpchp 0000:00:03.0: BAR 14: assigned [mem 0x80000000-0x800fffff]
> [   66.193235] pci 0000:01:01.0: BAR 0: assigned [mem 0x80000000-0x800000ff 64bit]
> [   66.198587] shpchp 0000:00:03.0: PCI bridge to [bus 01]
> [   66.204113] shpchp 0000:00:03.0:   bridge window [mem 0x80000000-0x800fffff]
> [   66.215212] shpchp 0000:01:01.0: HPC vendor_id 1b36 device_id 1 ss_vid 0 ss_did 0
> [   66.218531] shpchp 0000:01:01.0: enabling device (0000 -> 0002)
> [   66.229204] BUG: kernel NULL pointer dereference, address: 00000000000000e2
> [   66.232124] #PF: supervisor write access in kernel mode
> [   66.234369] #PF: error_code(0x0002) - not-present page
> [   66.236585] PGD 0 P4D 0
> [   66.237431] Oops: 0002 [#1] SMP PTI
> [   66.238617] CPU: 2 PID: 277 Comm: kworker/2:1 Kdump: loaded Not tainted 5.3.0-rc4 #85
> [   66.241200] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
> [   66.244916] Workqueue: shpchp-1 shpchp_pushbutton_thread
> [   66.246583] RIP: 0010:shpc_init.cold+0x5c3/0x8a1
> [   66.248041] Code: 24 90 01 00 00 8b 49 08 40 80 fe 02 0f 85 f4 01 00 00 f7 c1 00 00 00 f0 0f 84 b2 01 00 00 b9 13 00 00 00 80 3d 33 40 38 02 00 <88> 8a e26
> [   66.253771] RSP: 0018:ffffc9000025bb68 EFLAGS: 00010246
> [   66.255418] RAX: 00000000000000ff RBX: 0000000000000000 RCX: 0000000000000000
> [   66.257763] RDX: 0000000000000000 RSI: ffffffff826bcd01 RDI: ffffffff826bcd60
> [   66.260065] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
> [   66.263184] R10: 0000000000000005 R11: 0000000000000000 R12: ffff888032425400
> [   66.265706] R13: ffffc9000017109c R14: ffff888033da7000 R15: 000000000000001f
> [   66.268200] FS:  0000000000000000(0000) GS:ffff88807fc80000(0000) knlGS:0000000000000000
> [   66.270826] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   66.272731] CR2: 00000000000000e2 CR3: 0000000033afc002 CR4: 0000000000360ee0
> [   66.275373] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   66.277947] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   66.279965] Call Trace:
> [   66.280627]  shpc_probe+0x91/0x32b
> [   66.281644]  local_pci_probe+0x42/0x80
> [   66.282752]  pci_device_probe+0x107/0x1a0
> [   66.283877]  really_probe+0xf0/0x380
> [   66.284862]  driver_probe_device+0x59/0xd0
> [   66.285988]  ? driver_allows_async_probing+0x50/0x50
> [   66.287937]  bus_for_each_drv+0x7e/0xc0
> [   66.289752]  __device_attach+0xe1/0x160
> [   66.292076]  pci_bus_add_device+0x4b/0x70
> [   66.295244]  pci_bus_add_devices+0x2c/0x64
> [   66.297429]  shpchp_configure_device+0xc1/0xe0
> [   66.299692]  board_added+0x117/0x240
> [   66.301589]  shpchp_enable_slot+0x121/0x2e0
> [   66.303686]  shpchp_pushbutton_thread+0x70/0xa0
> [   66.305941]  process_one_work+0x221/0x500
> [   66.308253]  worker_thread+0x50/0x3b0
> [   66.310512]  kthread+0xfb/0x130
> [   66.312422]  ? process_one_work+0x500/0x500
> [   66.314617]  ? kthread_park+0x80/0x80
> [   66.316489]  ret_from_fork+0x3a/0x50
> [   66.318293] Modules linked in: intel_rapl_msr intel_rapl_common kvm_intel kvm crct10dif_pclmul bochs_drm crc32_pclmul drm_vram_helper ghash_clmulni_intel o
> [   66.331179] CR2: 00000000000000e2
> [   66.333090] ---[ end trace cfc73b2e92e207d4 ]---
> [   66.335431] RIP: 0010:shpc_init.cold+0x5c3/0x8a1
> [   66.337790] Code: 24 90 01 00 00 8b 49 08 40 80 fe 02 0f 85 f4 01 00 00 f7 c1 00 00 00 f0 0f 84 b2 01 00 00 b9 13 00 00 00 80 3d 33 40 38 02 00 <88> 8a e26
> [   66.346561] RSP: 0018:ffffc9000025bb68 EFLAGS: 00010246
> [   66.348659] RAX: 00000000000000ff RBX: 0000000000000000 RCX: 0000000000000000
> [   66.351412] RDX: 0000000000000000 RSI: ffffffff826bcd01 RDI: ffffffff826bcd60
> [   66.354204] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
> [   66.357013] R10: 0000000000000005 R11: 0000000000000000 R12: ffff888032425400
> [   66.360117] R13: ffffc9000017109c R14: ffff888033da7000 R15: 000000000000001f
> [   66.362953] FS:  0000000000000000(0000) GS:ffff88807fc80000(0000) knlGS:0000000000000000
> [   66.366003] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   66.368756] CR2: 00000000000000e2 CR3: 0000000033afc002 CR4: 0000000000360ee0
> [   66.371769] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   66.376036] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> Regards,
> 
