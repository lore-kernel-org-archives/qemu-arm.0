Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6265C79F99
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:00:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3bl7-0000WR-EY; Mon, 07 Sep 2026 11:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x3bl5-0000WC-Hl
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 11:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x3bkr-0001W3-Gr
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 11:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788796772;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sYTkenoHwL/Q6hsEzZgbdCVIP12Bm+MkrzNE+422XfU=;
 b=O+EuJkfZ+qC+5l78uQlCdcmdETz4VG0JrLc6vRdmuZ2U3Jyv+lg7vntfmFLSSF2VGcz7Xm
 1/2ra7+pYFaFZX6cIkn87DwT/HXqZs1zpg/VWP77i4iBESRnDs5QiHh0ixekD508KqSWlH
 WgoK7wY0rU6C2o5YqZwPIcMFzHEih0s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-PsfTnwm2NemPjxk3faYHiw-1; Mon, 07 Sep 2026 11:59:31 -0400
X-MC-Unique: PsfTnwm2NemPjxk3faYHiw-1
X-Mimecast-MFC-AGG-ID: PsfTnwm2NemPjxk3faYHiw_1788796770
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49cf5bd2f12so51705715e9.1
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 08:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788796770; x=1789401570;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sYTkenoHwL/Q6hsEzZgbdCVIP12Bm+MkrzNE+422XfU=;
 b=eO5ae3B9k5JcDgk+P7b7zm/5laaRY5lDItgh49QFk1MThphN5+e9hY0hRJN4LpP7B6
 Cl7/ryk503GRs4AfugMYwvqdvZ45bEOoFJitk066bGl3KvWZ7lEEc0ebJiuaRYPN+VXN
 FPRv5jbCu4mUcyR9VExESJy3QBEUUx00zTN6qCJJAZaVh7aa6fk62KKZXowZqYj2WMxQ
 e6XPN+hfCDgV4KXVnDlP1XxdBYS+SkIBFitU13KTIA2O6HIxTCBLWH6eDsrJBQQirTQ/
 BYAjOunpEmZUD5AeCHON9zCHsdKF0N+k3dhgrfG0rMC61p6z+QN4gPU/BIAYGoAemgT+
 WdXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxHgtzdxkReQAJrAPNkPBAxPd5IyBPUIVBpHvg323so8CIA6EXhPc99LejZ5h++mqckna28+4ZNzg==@nongnu.org
X-Gm-Message-State: AFuF++nm2nhikMNAhxmY6mVmfZe2eyOTi73GnTvoiqY3j2SQnJImtmYB
 wTstjIDbhSTqyLPx0hj4ch0jbtXUvXsbbGS2WKKhPu1GQ6I7JPq3muWgTJgblcws9RlQK1PV1eo
 wfwXq+m2vALc2DBdy79U64Fa3QnkwywrzsK9PrVu6xGPQv7r4/tn0rHwjhvd9JQ==
X-Gm-Gg: AYBFou2SUEmXMHRH4FlIYcB+jhztH89yxbgJRp1ZfsjOEKZTCc8zTHo/zwzWeQHZY/k
 MqZGRh2b3KQh0excDGGQ/InQCLFLQ5bIIjnrt6dgQJljwVBOM1tnSzQWbXAQvf5YvIIhLeSieXp
 qtndXe1JpZs0SexSYAyfauRpgo1fF8h1KfltFRlGItOXfsV0GvwsfQZugLgG0WJRWfsFnBmbBsX
 3ibCQjAMd/3+OOIzRU3DoljgLNoLBXk78FoYbUsUPGpMjXrTc+IpeZbPKHhckxuobtos7+kSAXb
 5yPZ+jdJp29J8loakGeZ/yEDOUgHbKeMffB4uAuibuZzul4Ys70udTN2HBBuFEhh1O8pyGIs6ke
 S+7/Wd3hXcWefvRPoH/Sn8+uu0SrvBvrH+LVFJVxAviaIH0Us
X-Received: by 2002:a05:600c:a01:b0:499:7219:122f with SMTP id
 5b1f17b1804b1-49cf8222d53mr233767015e9.4.1788796770226; 
 Mon, 07 Sep 2026 08:59:30 -0700 (PDT)
X-Received: by 2002:a05:600c:a01:b0:499:7219:122f with SMTP id
 5b1f17b1804b1-49cf8222d53mr233766785e9.4.1788796769889; 
 Mon, 07 Sep 2026 08:59:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5d476esm444060935e9.1.2026.09.07.08.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 08:59:29 -0700 (PDT)
Message-ID: <81aebdfa-b550-4ef9-8c7e-1009ff1d9bb9@redhat.com>
Date: Mon, 7 Sep 2026 17:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 23/28] hw/pci: Add sec-sid property to PCIDevice
To: Tao Tang <tangtao1634@phytium.com.cn>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162145.2800835-1-tangtao1634@phytium.com.cn>
 <d39ce149-8479-40bc-8411-a52a635c7a0a@redhat.com>
 <a5cad895-37ff-4bf5-baae-cc9fdb708a02@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <a5cad895-37ff-4bf5-baae-cc9fdb708a02@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z6na02DUb2r1oAMMpWapPxlqV9GaCEcVcCeQgRX0M0o_1788796770
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 9/3/26 6:07 PM, Tao Tang wrote:
> Hi Eric,
>
> On 2026/8/31 14:03, Eric Auger wrote:
>> Hi Tao,
>>
>> On 8/13/26 6:21 PM, Tao Tang wrote:
>>> Arm SMMUv3 uses a SEC_SID (StreamID Security state) to determine the
>>> security state of the programming interface that controls a
>>> transaction.
>>> The architecture explicitly states that the association between a
>>> device
>>> and its SEC_SID is a system-defined property, not something derived
>>> from
>>> the physical address space.
>>>
>>> We need a way to represent this system-defined SEC_SID for PCI devices
>>> if we want to implement SMMU's Secure state. So that SMMUv3 can select
>>> the correct register bank and configuration when handling their
>>> streams.
>>>
>>> This patch adds a new char *sec_sid field to PCIDevice, together with
>>> a "sec-sid" QOM property. The property is intended to carry the
>>> platform-defined SEC_SID for the device; for now only Non-secure and
>>> Secure security states are supported.
>> You shall add PCI maintainers in cc.
>>
>> Is it only SMMU intended? I mean if you set this property, the PCI
>> device shall send DMA requests with secure attributes too?
>
>
> Yes, the current consumer is Arm SMMUv3 only. The property represents
> the system-defined SEC_SID presented to the SMMU, selecting its
> programming interface and Stream table. It does not make the PCI
> function issue DMA with Secure MemTxAttrs; that per-transaction
> attribute is passed separately through attrs_to_index(). Some code
> pieces: 
yes you're right. Those are different. But how do you tell a device to
send DMA transactions with attrs.secure (-> iommu_idx). That's what I am
confused about. Do we plan to have a prop for that or will it be
hardcoded such as in hw/misc/tz-mpc.c?

>
> ```
> static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                                       IOMMUAccessFlags flag, int
> iommu_idx)
> {
> .....
>     SMMUv3State *s = sdev->smmu;
>     SMMUSecSID sec_sid = sdev->sec_sid;
>     SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
> .....
>     entry.target_as = smmuv3_bypass_target_as(s, sec_sid, iommu_idx);
> ......
>     if (!smmu_enabled(s, sec_sid)) {
>         if (FIELD_EX32(bank->gbpa, GBPA, ABORT)) {
>             status = SMMU_TRANS_ABORT;
>         } else {
>             status = SMMU_TRANS_DISABLE;
>         }
>         goto epilogue;
>     }
> .....
> }
> ```
>
> We use the device-inherent `PCIDevice->sec_sid` to select the SMMU
> Programming Interface. The actual per-transaction attribute, on the
> other hand, is passed to `smmuv3_translate()` through the `int
> iommu_idx` parameter for each transaction.
>
> And Michael is already included in To: for both the cover letter and
> this patch. I agree that this needs PCI maintainer review. 
OK fine, sorry fo the noise. 

Eric
>
> @Michael, Could you please help review this patch?
>
> Thanks,
> Tao
>
>
>>
>> Eric
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>   hw/pci/pci.c                | 7 +++++++
>>>   include/hw/pci/pci_device.h | 3 +++
>>>   2 files changed, 10 insertions(+)
>>>
>>>
>


