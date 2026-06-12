Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4482CD98CE
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 10:25:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXz4k-0005eb-Ca; Fri, 12 Jun 2026 06:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wXz4i-0005dr-4l
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 06:25:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wXz4f-0002JK-RB
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 06:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781259915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOVyQRct5EpEBphUkhGdxwzQbngQfNDcP+rbuCp7lvY=;
 b=I2th3n0sRgIhtpAYIBszg660kj+Vwcx8qeVMiT4z8yn2r1PO0C62LAwoZ/y9IvBPzCU4A0
 c4zBPBm1Up4LLmcLzsePcQ4qwz+aMgJSX/r8CgPCL0Y348AhAqqu0+G6hMUlZTwGD5sXit
 jQ/fFahRN+wdW/YAUHXkaA83W798kas=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-Mr76uHu_PiqDHLn4Nm3ufA-1; Fri, 12 Jun 2026 06:25:14 -0400
X-MC-Unique: Mr76uHu_PiqDHLn4Nm3ufA-1
X-Mimecast-MFC-AGG-ID: Mr76uHu_PiqDHLn4Nm3ufA_1781259914
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2c0c36f1cc0so15358315ad.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 03:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781259913; x=1781864713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOVyQRct5EpEBphUkhGdxwzQbngQfNDcP+rbuCp7lvY=;
 b=EBW7Rc9Zz+rBIXvhIBlxbAD/C4bhYyvtJ0k6DDITbcVVNDc/SBAJGmsGViSZLDb40l
 6rYOLQitWkIulYtNmGBG94FsKzxsbLSXi2/FZVPLkdG2tY43SI6lMtINswTX9RGrG6rV
 1P8RWOZv8lRfkJkLK7j1Bg2nlUeLJYgL+AqD/00t5yisM+OW4i8hSbGaNZsKog55W5Wh
 yvSUBf7XtSewdNInmg4rKv3JKDUZbNFmOgiTVLRFbZZnlXMx2ewnahwg+xEoNxHhjzqE
 B/IUG+psvtXjLrVkUSDJ+7zgGW83ouZLEBeSCXkI/zA8MkFqKPimued496+qnJ/ZBwQ3
 ZROA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9BRCNpuDY/wYdU2lsJHuJYYlk2x3s45AOPjp3ph1aZgKD5lhkrXb/NhVeBCtNDEhoy3kE+U8yE7w==@nongnu.org
X-Gm-Message-State: AOJu0YxYJOiX/xBvLjQKL/ZcBYg6NYf806OusMxHAh+zka2i/jY0X3vo
 rNIJLLSOa2EWH1RHy3Ov37DSEgVt8ySuU0Wf38DCJsa37gvHfJGHqaqaBqHzdYPoqWFSo4pnP5D
 8S8aBgENu0bbt2ZeiJ7OSSoIUw3oYX9GSOTkF+6PClaxEJyB7kxvN2A==
X-Gm-Gg: Acq92OGMfTIEu0xTaCzV8U8H2vAYk7M+BPtg+/CYnB/3/yavoLjAqbs/pNL87edd/yl
 uF9lDTsTVUZgh8waPz/CCNC54sdXkWjoGNDVbGV1VVXBSS+VhHJGMc+W+nH74UcB58Ztvlko9CZ
 P1xUS+Lx5swLhIbU0eahMV3ERj/ZxRqvDzjE5LK+taYNiwb5Nd423CtjqT+6FLeSjlm8vkFh8fS
 Mr8KQfKXxGtSLJ4WuLpTMGvsN85kuqCXH6pD4rPTk+VxoQSdqEl34N88O+PADYO5jpaTefhJ2/H
 pgf7mEm2tDhca4p3pXG3tPn2pzOrGama2D1FV25PFSF1wcdJEwv/CuifTwb05CI+4DJj3pfemIg
 EE0FWBgm/DmYOGhtPWHxPqngJqaQa1YFWsDG2STsIYacUmoBys8vWbtrRg6H60CUO
X-Received: by 2002:a17:903:390b:b0:2b4:5aff:de60 with SMTP id
 d9443c01a7336-2c411d7b1famr31560105ad.22.1781259913425; 
 Fri, 12 Jun 2026 03:25:13 -0700 (PDT)
X-Received: by 2002:a17:903:390b:b0:2b4:5aff:de60 with SMTP id
 d9443c01a7336-2c411d7b1famr31559715ad.22.1781259912865; 
 Fri, 12 Jun 2026 03:25:12 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4327aca9dsm15926085ad.50.2026.06.12.03.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 03:25:11 -0700 (PDT)
Message-ID: <25e59c4a-b68a-43b1-9796-fb1f72f1d444@redhat.com>
Date: Fri, 12 Jun 2026 20:25:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 Pavel Hrdina <phrdina@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jugraham@redhat.com, shan.gavin@gmail.com, Alex Williamson
 <alex@shazbot.org>, David Hildenbrand <david@kernel.org>
References: <20260610095712-mutt-send-email-mst@kernel.org>
 <aimEl9QQ_LTRPLtd@x1.local> <20260610121026-mutt-send-email-mst@kernel.org>
 <1e9515c9-7e32-4d95-9b73-aab8bf10bddc@redhat.com>
 <20260611012217-mutt-send-email-mst@kernel.org>
 <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
 <20260611023428-mutt-send-email-mst@kernel.org>
 <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
 <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
 <ec32c5ae-782c-4c83-8432-23d979552fbe@redhat.com>
 <20260612044147-mutt-send-email-mst@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260612044147-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3CK1XCPN29av0nezLgCYhpHWPoRu7_6UtcCP5Wi3CMs_1781259914
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Michael,

On 6/12/26 6:43 PM, Michael S. Tsirkin wrote:
> On Fri, Jun 12, 2026 at 02:25:07PM +1000, Gavin Shan wrote:
>> On 6/11/26 10:48 PM, Peter Maydell wrote:
>>> On Thu, 11 Jun 2026 at 13:34, Gavin Shan <gshan@redhat.com> wrote:
>>>>
>>>> Let me try to summarize what I understood. As VFIO is concerned, there
>>>> are multiple memory regions for one particular PCI BAR, and they're stacked
>>>> up. The memory regions for PCI BAR#4 of the GH100 card looks as below.
>>>>
>>>>      (qemu) info mtree
>>>>                 :
>>>>      address-space: pci_bridge_pci_mem
>>>>        0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>>>>          0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4          <---- (1) VFIOBAR::mr
>>>>            0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4             <---- (2) VFIOBAR::VFIORegion::mem
>>>>              0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0] <---- (3) VFIOBAR::VFIORegion::VFIOMap::mem
>>>>
>>>>      (1) Its MemoryRegionOps is NULL. No data accesses are routed to this region
>>>>      (2) The data accesses routed to this region is handled by pread() and pwrite()
>>>>      (3) The data accesses routed to this region is handled by memcpy() before
>>>>          commit 4a2e242bbb.
>>>>
>>>> There are identified PCI devices who have quirks, see vfio_bar_quirk_setup().
>>>> Accesses to part of the PCI BAR have to be emulated by the extra IO regions,
>>>> something like below for rtl8168 PCI device, where two extra IO regions are
>>>> stacked up for the quirks.
>>>>
>>>>      address-space: pci_bridge_pci_mem
>>>>        0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>>>>          0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4          <---- (1) VFIOBAR::mr
>>>>            0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4             <---- (2) VFIOBAR::VFIORegion::mem
>>>>              0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0] <---- (3) VFIOBAR::VFIORegion::VFIOMap::mem
>>>>              0000042000000010-0000042000000014 (prio 1, i/o): 0009:01:00.0 BAR 4 quirk[0]  <---- (4) quirk[0]
>>>>              0000042000000018-000004200000001c (prio 1, i/o): 0009:01:00.0 BAR 4 quirk[1]  <---- (5) quirk[1]
>>>>
>>>> Access on 0000042000000010-0000042000000014 should be routed to region (4) quirk[0]
>>>> and access on 0000042000000018-000004200000001c should be routed to region (5) quirk[1].
>>>> However, accesses to 0000042000000000-0000042000000020 are routed to region (3) before
>>>> commit 4a2e242bbb and the data transfer is done by memcpy(), bypassing region (4) and
>>>> (5). It's not the expected behavior and why memcpy() isn't expected on device rtl8168's
>>>> PCI BAR due to the quirks, answering your question.
>>>>
>>>> With commit 4a2e242bbb applied, the accesses will be routed to the correct region.
>>>
>>> The way I read 4a2e242bbb's commit message, it isn't about things being routed
>>> to the wrong region. It's about the handling of areas which aren't in the small
>>> quirk regions but which are in the same 4K page as them. These have to
>>> be handled
>>> via the memory subsystem's "subpage" mechanism. This does route
>>> everything to the
>>> correct region, but if the region (3) is marked as "direct access is OK" then
>>> QEMU assumes that any kind of direct access is OK, i.e. this behaves
>>> like true RAM.
>>> It then does a memcpy access to a BAR that's really a bank of device registers,
>>> and this goes wrong.
>>>
>>
>> Ok, thanks for your followup and explanation. I also spent some time going through
>> system/memory.h and system/physmem.c. I think I fully understood the issue now. There
>> are two concerning paths as mentioned by Peter Xu in another reply: (a) vCPU accessors
>> like address_space_rw(), address_space_write_rom(), address_space_ldq(), address_space_stq()
>> and their variants; (b) functions used in the DMA path like address_space_map() and
>> address_space_unmap().
>>
>> For (a), memmove() and memcpy() are used, and they can be replaced something else that
>> is safe. However, the replacement in (a) can't fix the issue existing in (b). In (b),
>> the host's pointer is returned by address_space_map() and the memory block (perhaps not
>> a real RAM block) can be accessed in all means after that. I guess we have to ensure
>> the memory region is a real RAM block before the pointer can be returned in (b). Otherwise,
>> we still fall back to the bounce buffer in (b).
> 
> 
> No guest will DMA into a "non RAM block". Whatever is a DMA target, is a
> 'real RAM block'.
> 

Ok, I have no objection to this assumption.

>>>> Back to our case (GH100 card), there are no quirks for the PCI BAR (0009:01:00.0 BAR 4)
>>>> so it's fine mark the RAM DEVICE region as directly accessible. We perhaps needn't host
>>>> to export the capability (VFIO_REGION_INFO_CAP_DIRECT_ACCESS) suggested by you. It's
>>>> safe to mark any PCI BARs as directly accessible if they have no quirks attached. All
>>>> the devices except those listed in vfio_bar_quirk_setup() are capable of this.
>>>
>>> I still feel like there are different kinds of PCI BAR here ("this BAR is
>>> true RAM and can be accessed arbitrarily" vs "this BAR is full of registers
>>> and can't be handled that way") and the vfio code in QEMU needs to set up
>>> the memory regions differently for the two cases. For your example I think
>>> it would be fine to have direct-access even if there were some kind of
>>> quirk memory region, because for the parts of the BAR that aren't covered
>>> by a quirk overlay the underlying BAR still allows "entirely like RAM,
>>> any alignment and size is OK" accesses.
>>>
>>
>> Agreed. If the PCI BAR is a 'real RAM block' is determined by hardware vendor. I
>> think the solution proposed by Michael is a nice one as this specific case is concerned:
>> A flag (capability) is returned by nvgrace_gpu_vfio_pci driver to indicate that the
>> PCI BAR is a 'real RAM block' and tolerant to all kinds of memory accessor. QEMU marks
>> the memory region for this PCI BAR as directly accessible. Alternatively, qemu also
>> can determine the capability by the PCI device's vendor/device/subsystem/version information
>> in hw/vfio/region.c.
>>
> 
> 
> I sent it before I understood the issue.
> 

Thanks to all for the inputs and suggestions. It has been a deep discussion
and I learned a lot from this thread.

Let me prepare the patches to fix the issue that 4a2e242bbb30 resolved from
flatview side. After that, we can revert 4a2e242bbb30. I will post them for
review soon.

The spots where memcpy/memmove need to be replaced by __builtin_memcpy/
__builtin_memmove by Peter: address_space_read(), address_space_write_rom(),
flatview_read_continue_step(), flatview_write_continue_step(). It's not harmful
to have the replacement in vfu_object_mr_rw() either.

Thanks,
Gavin


