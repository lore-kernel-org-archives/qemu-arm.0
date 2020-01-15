Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6898838lff;
        Wed, 15 Jan 2020 05:16:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwC61+ikDnoJAY+Ee0Q7ovmfLcayGEs1QzTexPyqeiDCM2BEMJBtIYEE7FPkJZ/T/mvWBnE
X-Received: by 2002:aa7:c946:: with SMTP id h6mr30201721edt.186.1579094184848;
        Wed, 15 Jan 2020 05:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579094184; cv=none;
        d=google.com; s=arc-20160816;
        b=A0C3gCu9qCaHkc+rHsYzFeaqjGZ7bNKNN81cQde3auXSC9XeQrt1xUMkJ7McRBs2J7
         LZrwvtMAlxTboPGQUtQwdcLnXh4PXdt3rduN/degiEnZidVjnfoDa8EocDEbklGDvcqV
         7n3Ivt9l4dew9RfO4heU0BRKKJomQps8BjMvwgUQSscUV3NAnJhhKRyztVETwtYUvsTO
         GDNwQ/DIE0fp5+QfXy3RCPXcPt4L/tkOPe8GChrH1xrR7Xv/b50K0BRWbKHAOIkC6ZfH
         aYMPbmR2saeXfJDYYUvC3M9qVeSSow96mrN35jBmeZNasxi8u6FSb4KVli/aA3JJ4mrs
         xRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uIjkDaB3m7Drix+JBb+7JSwNjXSmbcxRKCoudm3wKO4=;
        b=ni2USFPaaqKqak9OfMgE4ogY2SYPNsu0mI+QwCTXFpRnTG76ScmX/bYVhhGzREqOv5
         Qn07Km04plTPuo89wGNC8BlRACMtFYd/sb8JCwiupBmFhsam18gCvWeePfqr2RtZQR4j
         CsWquTT4P3btDYCfJkUUIQU3WIFi2NNim2UtA58G4T6KmHu5OY0Jbanrd3L9FmoyPYXW
         8q2kqeBTbUwT5chUweXFt7/ZlYQs5DplBPGzkQJyJEID90uwI9khdruamqYCo/H9hLis
         IXlrWN4G7g0rlEll58r2oo0oO4oEFi9Yx6+X7OduhSaJPEgUXZdRt3k0kERnKKT3KK66
         PxDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dptgOzXi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21si13027838edi.201.2020.01.15.05.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 05:16:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dptgOzXi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iriX1-0006jI-Ru
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 08:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iriWm-0006iY-03
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 08:16:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iriWk-0007hY-PN
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 08:16:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53378
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iriWk-0007h2-LC
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 08:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579094166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIjkDaB3m7Drix+JBb+7JSwNjXSmbcxRKCoudm3wKO4=;
 b=dptgOzXi0v3jt3xaWIIPI0IiqAWGTlC/aipl45KUPCEgYLw2UuO07iJmFZNn/FTzulhHLx
 TgaxsZTgwjd1etMpmhn518dy81onZw4750spp/yOPhu2ct8nU3mJepJM4tUkhoreaJNT5L
 nwTxixu7xo/FivrjpdHS0G51/AER93A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-2-s1A1z0NKaelmA28kmn-Q-1; Wed, 15 Jan 2020 08:16:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75CED800D4C;
 Wed, 15 Jan 2020 13:16:03 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E71580890;
 Wed, 15 Jan 2020 13:15:55 +0000 (UTC)
Subject: Re: [PATCH v12 05/13] virtio-iommu: Endpoint and domains structs and
 helpers
To: Peter Xu <peterx@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-6-eric.auger@redhat.com>
 <20200113202301.GD201624@xz-x1>
 <51267d84-c805-a4a1-8084-b278721a5b3f@redhat.com>
 <20200114180734.GB225163@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <cc2d028f-70ee-b6b1-0603-9bcff3249f43@redhat.com>
Date: Wed, 15 Jan 2020 14:15:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200114180734.GB225163@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 2-s1A1z0NKaelmA28kmn-Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gWFeng26ZS8a

Hi Peter,
On 1/14/20 7:07 PM, Peter Xu wrote:
> On Tue, Jan 14, 2020 at 09:51:59AM +0100, Auger Eric wrote:
>> Hi Peter,
> 
> Hi, Eric,
> 
> [...]
> 
>>>
>>>> +{
>>>> +    VirtIOIOMMUEndpoint *ep;
>>>> +
>>>> +    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
>>>> +    if (ep) {
>>>> +        return ep;
>>>> +    }
>>>> +    if (!virtio_iommu_mr(s, ep_id)) {
>>>
>>> Could I ask when this will trigger?
>>
>> This can happen when a device is attached to a domain and its RID does
>> not correspond to one of the devices protected by the iommu.
> 
> So will it happen only because of a kernel driver bug?
> 
> Also, I think the name of "virtio_iommu_mr" is confusing on that it
> returned explicitly a MemoryRegion however it's never been used:
> 
> (since they're not in the same patch I'm pasting)
> 
> static IOMMUMemoryRegion *virtio_iommu_mr(VirtIOIOMMU *s, uint32_t sid)
> {
>     uint8_t bus_n, devfn;
>     IOMMUPciBus *iommu_pci_bus;
>     IOMMUDevice *dev;
> 
>     bus_n = PCI_BUS_NUM(sid);
>     iommu_pci_bus = iommu_find_iommu_pcibus(s, bus_n);
>     if (iommu_pci_bus) {
>         devfn = sid & 0xFF;
>         dev = iommu_pci_bus->pbdev[devfn];
>         if (dev) {
>             return &dev->iommu_mr;
>         }
>     }
>     return NULL;
> }
> 
> Maybe "return !!dev" would be enough, then make the return a boolean?
> Then we can rename it to virtio_iommu_has_device().
> 
> PS. I think we can also drop IOMMU_PCI_DEVFN_MAX (after all you even
> didn't use it here!) and use PCI_DEVFN_MAX, and replace 0xFF.
Oh yes I can use PCI_DEVFN_MAX directly. Sorry.

Eric

> 
> Thanks,
> 

