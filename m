Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F302AD29C2E
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 16:02:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhrhP-0007d4-G9; Mon, 19 Jan 2026 11:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vhrh5-0007ak-H8
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 11:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vhrh1-0007kn-Fr
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 11:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768838485;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xkNFHMjVcRNOk3MkCKGBOyDTzxGFZH8/T+TYOSWSSUg=;
 b=L6k3QTrlXFuODcZW51JLVzAtvWvF4S6SUh9PbxZB1GunX/GkdXF+jk550M9TUwz2eH+g18
 8bFVQmbZOg/kxV7VsrOpncYu4is4oa6Pca+NFUlhf63j75Vg2xBxMxrrq5EZiKmKLcnjxb
 /g6eKl9CgMOlFrOyjelo2fKYIo/q0Yg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-oX7YUmkQNp2E7o0pocdm-w-1; Mon, 19 Jan 2026 11:01:24 -0500
X-MC-Unique: oX7YUmkQNp2E7o0pocdm-w-1
X-Mimecast-MFC-AGG-ID: oX7YUmkQNp2E7o0pocdm-w_1768838483
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47ee868f5adso33528605e9.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 08:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768838483; x=1769443283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkNFHMjVcRNOk3MkCKGBOyDTzxGFZH8/T+TYOSWSSUg=;
 b=J3djBIZAIuy1BYuT0Xo0/NWNY/NjnSHqrikfq/NAtJCAP0XVWZbRy1wV4fLO87Towf
 SI9EoEEYNrziNoBPWwgEoVb0ZuMdF7Zr3yXBsnN/gRl+D6gBsnIK1AxK6NMuiXByy1W9
 w68RZD8x3DP1D0KkzQwI66Z5DUn9wwFsj8TqpcFY2vawX0F8NAh5lCa12bdZiLaPkPZ+
 /4QLztEoi8W/CKETwlQ2z33zNm6gdmje7QVTniKHQu2oOKWXg49jqictW4D0ZtC3kcY3
 Xjj93M1veFYbOgITAnN6BPRugMuyEjK4bRDOr+yjSrhel3tKN38qyVQLnjYEgGpEgv0X
 Y7TQ==
X-Gm-Message-State: AOJu0YyIS/J0ciAb9nZxj4shvEMDtdUEQol+lzSh4Aur6k772wBlhQFr
 ZNWxQBkC0SxGuBghS2WVuY06RzaKudYg9K8MIlWzs8Nj/GibeDbMdlP4UQ/Fn83oPUQrctifhMn
 sOsfK6/oVYWup1hsEDXjAZl0rhXTM/FemMEMVzmouVU3T6U9q2oEBfw==
X-Gm-Gg: AY/fxX6H9L6RXmsk6X9NFukOPBHBV3ShhBDID3HL+0XAjP+7/kz64VjAVip6M2Q8HlU
 XRMXB05jV/06MA4LpXgnSGNZZMg8Befi1x0vtGsHPgS8yNwB/TZBp3iPs9Q7ZsQfqCPyzBItvS3
 ZtABBu/YsvHJ4KkqRVwF/mAudoQzvKpmW8QmYY/XNs7qnNBlHUMa97KcS5DvDwcscL9ZvdmKn4v
 QtUr3wCZbItyetZzr2kclCSpgHR7cZ9IE8nE/oZfWhbftmkyCyFukXCyvQGL8bPmEcCn/Pyj36j
 hBNn8gBg8Jp0xXo9A/RqitGVHBzZbQK5OPq86Q0d8Dpp+VHjOZvg5pa3uQn4fpvoXjqRaWtAaXB
 rs2qSY3NWofHrj3EqRN3snl3hmRaFwtNwgllYyOTWKItar6y8XbUiCWf0Jw==
X-Received: by 2002:a05:600c:8b38:b0:477:89d5:fdb2 with SMTP id
 5b1f17b1804b1-4801e30f96cmr148175535e9.14.1768838482614; 
 Mon, 19 Jan 2026 08:01:22 -0800 (PST)
X-Received: by 2002:a05:600c:8b38:b0:477:89d5:fdb2 with SMTP id
 5b1f17b1804b1-4801e30f96cmr148174305e9.14.1768838481656; 
 Mon, 19 Jan 2026 08:01:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f429071besm252304705e9.10.2026.01.19.08.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 08:01:21 -0800 (PST)
Message-ID: <c796d5e8-6859-41e6-87f9-b1195dddeb1a@redhat.com>
Date: Mon, 19 Jan 2026 17:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 33/36] hw/pci: Add helper to insert PCIe extended
 capability at a fixed offset
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "clg@redhat.com"
 <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20260111195508.106943-1-skolothumtho@nvidia.com>
 <20260111195508.106943-34-skolothumtho@nvidia.com>
 <CABQgh9FwSTB8Cp8f1POSBti376ZH3B0e0mLu9FU==p1wVwquGg@mail.gmail.com>
 <CH3PR12MB7548626563C6E67FB802D850AB8FA@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548626563C6E67FB802D850AB8FA@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IUUGZdwj9mvDZ6AAbxTjeHzf_pApaczQktqCPnKUxPs_1768838483
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.016,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 1/14/26 11:36 AM, Shameer Kolothum wrote:
> Hi Zhangfei,
>
>> -----Original Message-----
>> From: Zhangfei Gao <zhangfei.gao@linaro.org>
>> Sent: 14 January 2026 04:18
>> To: Shameer Kolothum <skolothumtho@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> eric.auger@redhat.com; peter.maydell@linaro.org; Jason Gunthorpe
>> <jgg@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>; ddutile@redhat.com;
>> berrange@redhat.com; clg@redhat.com; alex@shazbot.org; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhenzhong.duan@intel.com; yi.l.liu@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>; Michael S . Tsirkin <mst@redhat.com>
>> Subject: Re: [PATCH v7 33/36] hw/pci: Add helper to insert PCIe extended
>> capability at a fixed offset
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi, Shameer
>>
>> On Mon, 12 Jan 2026 at 03:58, Shameer Kolothum
>> <skolothumtho@nvidia.com> wrote:
>>> Add pcie_insert_capability(), a helper to insert a PCIe extended
>>> capability into an existing extended capability list at a
>>> caller-specified offset.
>>>
>>> Unlike pcie_add_capability(), which always appends a capability to the
>>> end of the list, this helper preserves the existing list ordering
>>> while allowing insertion at an arbitrary offset.
>>>
>>> The helper only validates that the insertion does not overwrite an
>>> existing PCIe extended capability header, since corrupting a header
>>> would break the extended capability linked list. Validation of
>>> overlaps with other configuration space registers or
>>> capability-specific register blocks is left to the caller.
>>>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> The guest kernel fails to boot with para "ssidsize=16" with v7 series.
>> Without ssidsize, guest kernel can boot no problem.
> Thanks for giving this a spin. 
>
>> However, pasid feature requires ssidsize.
>> smmuv3_accel_get_viommu_flags
>> if (s->ssidsize) {
>> flags |= VIOMMU_FLAG_PASID_SUPPORTED;
>>
>> v6 does not has such issue, and does not requires ssidsize param.
> As mentioned in cover letter this series has changed the way the overall 
> PASID is enabled. It now allows user to specify an offset to place the
> PASID CAP for vfio-pci devices,
>
> -device vfio-pci,host=0018:06:00.0,..,x-vpasid-cap-offset=xxx
>
> If none is specified it will place it at the last offset as default.
>
> And you need "ssidsize" to specify the SMMUv3 sub stream Id bits.
>  
>> log:
>> ASSERT_EFI_ERROR (Status = Invalid Parameter) ASSERT [PciBusDxe]
>> /home/linaro/work/edk2/MdeModulePkg/Bus/Pci/PciBusDxe/PciLib.c(626):
>> !(((INTN)(RETURN_STATUS)(Status)) < 0)
> It could be that the pcie_insert_capability() helper added here is corrupting
> the config space. Looking at it again, I can see that it is not handling a few
> corner cases.  Could you please replace the pcie_insert_capability() with
> the below and retest. 
>
> Thanks,
> Shameer
>
> ...
>
> bool pcie_insert_capability(PCIDevice *dev, uint16_t cap_id, uint8_t cap_ver,
>                             uint16_t offset, uint16_t size)
> {
>     uint16_t pos = PCI_CONFIG_SPACE_SIZE, prev = 0;
>     uint32_t header;
>
>     assert(offset >= PCI_CONFIG_SPACE_SIZE);
>     assert(offset < (uint16_t)(offset + size));
>     assert((uint16_t)(offset + size) <= PCIE_CONFIG_SPACE_SIZE);
>     assert(size >= 8);
>     assert(pci_is_express(dev));
>
>     header = pci_get_long(dev->config + pos);
>     if (!header) {
>         /* No extended capability, check requested offset is at PCI_CONFIG_SPACE_SIZE*/
>         if (offset != pos) {
>             return false;
>         }
>         pci_set_long(dev->config + pos, PCI_EXT_CAP(cap_id, cap_ver, 0));
>         goto out;
>     }
>
>     while (header && pos && offset >= pos) {
>         uint16_t next = PCI_EXT_CAP_NEXT(header);
>
>         /* Reject insertion inside an existing ECAP header (4 bytes) */
If I understand correctly you don't check the whole EXT CAP size but
just the header, correct?
>         if (offset < pos + PCI_EXT_CAP_ALIGN) {
>             return false;
>         }
>
>         prev = pos;
>         pos = next;
>         header = pos ? pci_get_long(dev->config + pos) : 0;
>     }
>
>     pci_set_long(dev->config + offset, PCI_EXT_CAP(cap_id, cap_ver, pos));
>     if (prev) {
>         pcie_ext_cap_set_next(dev, prev, offset);
>     }
>
> out:
>     /* Make capability read-only by default */
>     memset(dev->wmask + offset, 0, size);
>     memset(dev->w1cmask + offset, 0, size);
>     /* Check capability by default */
>     memset(dev->cmask + offset, 0xFF, size);
>     return true;
> }
Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric


