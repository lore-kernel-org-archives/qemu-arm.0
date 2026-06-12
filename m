Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49E6CD8CA8
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 04:25:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXtSO-0006wR-AP; Fri, 12 Jun 2026 00:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wXtSN-0006w9-1h
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 00:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wXtSL-0002CC-1k
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 00:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781238318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6RoHxcfMm8wEl1zX0M4gbuUihfheo0DnW2iJppjSWI=;
 b=bBwcMhP+6tD3LpokJNkmYknIxfQG18WjSirFDAkyrdmhKj7/yXR5CHUAlOVZlHX4aFuHsJ
 Kvl7XDAVUi01tSWuF/nw+sOEj3iz69LxlwURsUQAZHUqlb0RxBqQ0NbWlKII8tOSEhF+bn
 RryGNpNomyZJQ0GmPa3UN6F+IWxnhsk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-2-wYSpWFOdq74LDi5xvPoA-1; Fri, 12 Jun 2026 00:25:16 -0400
X-MC-Unique: 2-wYSpWFOdq74LDi5xvPoA-1
X-Mimecast-MFC-AGG-ID: 2-wYSpWFOdq74LDi5xvPoA_1781238315
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2bd04e4fe3dso13593365ad.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 21:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781238315; x=1781843115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O6RoHxcfMm8wEl1zX0M4gbuUihfheo0DnW2iJppjSWI=;
 b=V+Jyz/Xop2WIQ4YvfEIgNgycNv5Xmar0sO6R4SKaFslgM++oOA1CXn3ED/jEsjTjjE
 AcuBMEGtkHhaOMF135uJW9Ac+18K6atReRVLeMyOX2KFskmTwwm5uo1PiJAXWCZtN7bP
 c3UItFRC4vAeVacGaIF4tKiwF8iZ6312zl50jOj80xZPkNZRER9yxKv6WI07FTH+858d
 6pewPCpQcx9InWgmQKfccHuZiFQBKUbi7yzTtl7Vsqt13Ca+rabUjC67pXYkvCjrOVtq
 /cZc3nuqw+j2KMtzCroiLoxve6/pl1MpR5B6HGsIBcI64K+P6P3uitoJ6d19U/GSCMbt
 uiJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lgWcSHJ1UG1uTviRhR0zEPYioCDpfqZtR3vZfRp6JolA3/Z60m00mGxxbeLDNlNFRczgVLZs4WA==@nongnu.org
X-Gm-Message-State: AOJu0Yw7utjfuGqRKgQV8TOKCvqNsi4rl8uoovZqBVW1Nx+2I86y2hqT
 UgYhgTb8ea/TzMwWcN/c04rBFltXDINXX6Fq1Q6mL4YodDiS+6scIaHxw83XQST1dsNfsED/yJo
 LqffG7y0HVPFzm3rf3JIGwPFCeB+irQb50fmceTNak9T4Bh9FAE4hcw==
X-Gm-Gg: Acq92OEbXVOqZdwN4UBtW+xa0bSiAKdbXy06ABl3DK7JtijSisgIUCXG/Cs4C1RzF5F
 OYPZfbfW27/ood5gcVABdYdDPrPYzdUPuUnYshucSRjgxJgWAM+mVA57XIjhLQtB8DHZY3k+FdS
 ZLjbNUJU1Qe3KNd9x9K+mwIWUWnUhwFgjOu5y7LwVffmCc8FNV9NUexf5mo9IUtTD20Mq9tLE7x
 47Ck/9qV3di1WFnqgjWWkePCssBMnNTZNtArZ+Mc6qAzSV/3ZNR7tmbvNhQ5tMOC5DL1bkiP7DS
 OR11nqekFyPXLPl6VqEf4Gi2Yp6cd3wqJqI+/Oa1woZqr5JQ13j9k07a1jHgXC/6bwkqLNexVeB
 TOY6mUr+1TcuoBwgY/I9wxTvUVZVVB2T4NOuaE+ohj/bmkFYQuek1XORnAW5o+LZM
X-Received: by 2002:a17:903:2cc:b0:2c1:1a22:7c43 with SMTP id
 d9443c01a7336-2c412360000mr16042905ad.24.1781238315220; 
 Thu, 11 Jun 2026 21:25:15 -0700 (PDT)
X-Received: by 2002:a17:903:2cc:b0:2c1:1a22:7c43 with SMTP id
 d9443c01a7336-2c412360000mr16042525ad.24.1781238314744; 
 Thu, 11 Jun 2026 21:25:14 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c433078264sm5234415ad.65.2026.06.11.21.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 21:25:13 -0700 (PDT)
Message-ID: <ec32c5ae-782c-4c83-8432-23d979552fbe@redhat.com>
Date: Fri, 12 Jun 2026 14:25:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pavel Hrdina <phrdina@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jugraham@redhat.com, shan.gavin@gmail.com, Alex Williamson
 <alex@shazbot.org>, David Hildenbrand <david@kernel.org>
References: <eb0f0da1-11dd-4437-94fd-a65af55851e1@redhat.com>
 <20260610082637-mutt-send-email-mst@kernel.org>
 <5d8cbd4b-3725-437e-88a3-e0af32164815@redhat.com>
 <e7cc9f2d-ccb4-442f-a1ed-7c5474395099@redhat.com>
 <20260610095712-mutt-send-email-mst@kernel.org> <aimEl9QQ_LTRPLtd@x1.local>
 <20260610121026-mutt-send-email-mst@kernel.org>
 <1e9515c9-7e32-4d95-9b73-aab8bf10bddc@redhat.com>
 <20260611012217-mutt-send-email-mst@kernel.org>
 <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
 <20260611023428-mutt-send-email-mst@kernel.org>
 <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
 <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FyYVOPdPWj8RfvorEcTmxQ2sU1_lsJZobhc0Kv-xlaE_1781238315
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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

On 6/11/26 10:48 PM, Peter Maydell wrote:
> On Thu, 11 Jun 2026 at 13:34, Gavin Shan <gshan@redhat.com> wrote:
>>
>> Let me try to summarize what I understood. As VFIO is concerned, there
>> are multiple memory regions for one particular PCI BAR, and they're stacked
>> up. The memory regions for PCI BAR#4 of the GH100 card looks as below.
>>
>>     (qemu) info mtree
>>                :
>>     address-space: pci_bridge_pci_mem
>>       0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>>         0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4          <---- (1) VFIOBAR::mr
>>           0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4             <---- (2) VFIOBAR::VFIORegion::mem
>>             0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0] <---- (3) VFIOBAR::VFIORegion::VFIOMap::mem
>>
>>     (1) Its MemoryRegionOps is NULL. No data accesses are routed to this region
>>     (2) The data accesses routed to this region is handled by pread() and pwrite()
>>     (3) The data accesses routed to this region is handled by memcpy() before
>>         commit 4a2e242bbb.
>>
>> There are identified PCI devices who have quirks, see vfio_bar_quirk_setup().
>> Accesses to part of the PCI BAR have to be emulated by the extra IO regions,
>> something like below for rtl8168 PCI device, where two extra IO regions are
>> stacked up for the quirks.
>>
>>     address-space: pci_bridge_pci_mem
>>       0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>>         0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4          <---- (1) VFIOBAR::mr
>>           0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4             <---- (2) VFIOBAR::VFIORegion::mem
>>             0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0] <---- (3) VFIOBAR::VFIORegion::VFIOMap::mem
>>             0000042000000010-0000042000000014 (prio 1, i/o): 0009:01:00.0 BAR 4 quirk[0]  <---- (4) quirk[0]
>>             0000042000000018-000004200000001c (prio 1, i/o): 0009:01:00.0 BAR 4 quirk[1]  <---- (5) quirk[1]
>>
>> Access on 0000042000000010-0000042000000014 should be routed to region (4) quirk[0]
>> and access on 0000042000000018-000004200000001c should be routed to region (5) quirk[1].
>> However, accesses to 0000042000000000-0000042000000020 are routed to region (3) before
>> commit 4a2e242bbb and the data transfer is done by memcpy(), bypassing region (4) and
>> (5). It's not the expected behavior and why memcpy() isn't expected on device rtl8168's
>> PCI BAR due to the quirks, answering your question.
>>
>> With commit 4a2e242bbb applied, the accesses will be routed to the correct region.
> 
> The way I read 4a2e242bbb's commit message, it isn't about things being routed
> to the wrong region. It's about the handling of areas which aren't in the small
> quirk regions but which are in the same 4K page as them. These have to
> be handled
> via the memory subsystem's "subpage" mechanism. This does route
> everything to the
> correct region, but if the region (3) is marked as "direct access is OK" then
> QEMU assumes that any kind of direct access is OK, i.e. this behaves
> like true RAM.
> It then does a memcpy access to a BAR that's really a bank of device registers,
> and this goes wrong.
> 

Ok, thanks for your followup and explanation. I also spent some time going through
system/memory.h and system/physmem.c. I think I fully understood the issue now. There
are two concerning paths as mentioned by Peter Xu in another reply: (a) vCPU accessors
like address_space_rw(), address_space_write_rom(), address_space_ldq(), address_space_stq()
and their variants; (b) functions used in the DMA path like address_space_map() and
address_space_unmap().

For (a), memmove() and memcpy() are used, and they can be replaced something else that
is safe. However, the replacement in (a) can't fix the issue existing in (b). In (b),
the host's pointer is returned by address_space_map() and the memory block (perhaps not
a real RAM block) can be accessed in all means after that. I guess we have to ensure
the memory region is a real RAM block before the pointer can be returned in (b). Otherwise,
we still fall back to the bounce buffer in (b).

>> Back to our case (GH100 card), there are no quirks for the PCI BAR (0009:01:00.0 BAR 4)
>> so it's fine mark the RAM DEVICE region as directly accessible. We perhaps needn't host
>> to export the capability (VFIO_REGION_INFO_CAP_DIRECT_ACCESS) suggested by you. It's
>> safe to mark any PCI BARs as directly accessible if they have no quirks attached. All
>> the devices except those listed in vfio_bar_quirk_setup() are capable of this.
> 
> I still feel like there are different kinds of PCI BAR here ("this BAR is
> true RAM and can be accessed arbitrarily" vs "this BAR is full of registers
> and can't be handled that way") and the vfio code in QEMU needs to set up
> the memory regions differently for the two cases. For your example I think
> it would be fine to have direct-access even if there were some kind of
> quirk memory region, because for the parts of the BAR that aren't covered
> by a quirk overlay the underlying BAR still allows "entirely like RAM,
> any alignment and size is OK" accesses.
> 

Agreed. If the PCI BAR is a 'real RAM block' is determined by hardware vendor. I
think the solution proposed by Michael is a nice one as this specific case is concerned:
A flag (capability) is returned by nvgrace_gpu_vfio_pci driver to indicate that the
PCI BAR is a 'real RAM block' and tolerant to all kinds of memory accessor. QEMU marks
the memory region for this PCI BAR as directly accessible. Alternatively, qemu also
can determine the capability by the PCI device's vendor/device/subsystem/version information
in hw/vfio/region.c.


> -- PMM
> 

Thanks,
Gavin


