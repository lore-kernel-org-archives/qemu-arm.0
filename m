Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp248305ejn;
        Wed, 19 Oct 2022 04:26:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/q+SjXcCI4UMoUSmIBWKdtNTsK2AkJW2IkY7bH/c8jJLZIeN2LkR0S1cJuUgFl7hDD0LJ
X-Received: by 2002:ac8:7f42:0:b0:35c:b7f0:3411 with SMTP id g2-20020ac87f42000000b0035cb7f03411mr5947794qtk.210.1666178803621;
        Wed, 19 Oct 2022 04:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666178803; cv=none;
        d=google.com; s=arc-20160816;
        b=xvdSWJNNhfPCog0pLLGd9bN6cJj70tuMtMusXYwEVFDI20/j5fRYP48or1tXBCtePl
         l9Cw/7sbm9zPw36Yz4TDGMCZki+p7fNwYuPX6X2HSbuNyeFyjwSLAPmqfi8qXptiOxyv
         OjaVyPu6kkmUNWXZEAbOo38qOr6klNsgUNTiGPVx/6pgugiGqFaSzm7Yiew7EB8JxI7i
         I4b0QqX/A8TOlpOQuXI6gmd95MzVEuLZ5KN8UBNJwa0C1eXfFJs49+vUPf+P4VqU7ieq
         Qx5ydBt4fjre/vemOl/QrYqFF3jYFFiYlWWvN5QWOipASnd8EGIOyqhByZ7V66+7LQa8
         VCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G17gnPz1x4qXpekJokg0a9OzIWkdEYY06+dtxdEbf80=;
        b=E7IViD4KXAmjDCLq4MwpgjurB7UPJjfhShvCFC1bqv2won0JkiANS05xWgk6n62puF
         ROzrt2ELbEOIeNAF0IFa7taDxE/UnhjhycQTlWgYBgnbd3EcwIPXCrUv86/nRP0IlWHS
         HVFTc/Ln9rJivsaSGnR2x0ud41fVwsWbYIfbsaCEHaGeYrCPQ2ZQpmvE0qvI80n3zaWm
         fquOc1g1JRcl5dvrZnxvbTXYtXAvyPFLu6+dv2P8lmTzs1IHtwlLEc0/u/VrYXb18uLg
         WFe1T11W8QDAOLTitXvOwIFMzGJsr3ux+8E/l8xNXpXep/yobxgE4jGdUPAafFuqL9uH
         7ZRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=InxfoSSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18-20020a05622a101200b003990c011c66si10453108qte.492.2022.10.19.04.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 04:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=InxfoSSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ol7DZ-0003Bu-W9
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 07:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ol7Ck-0003AV-Pi
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 07:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ol7Ci-0004Cx-R7
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 07:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666178743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G17gnPz1x4qXpekJokg0a9OzIWkdEYY06+dtxdEbf80=;
 b=InxfoSSueJ0KPB4Iq52DWDTVccyhs3Vosd4Q5hwhzCmv2NgfuFSB59+wLeGQ6IWaMG/0cM
 UeXh+gbmJHCX60z8Me3klYwZL1XMPZ1OvXvmMWGri4b2AEmBa2nHZZy2NT0kIeEnZLpn6/
 4HBipCjxVA3Fb5GxLtirY1JRckujQuA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-yJQe2czzMdaAzL6OdRI0dg-1; Wed, 19 Oct 2022 07:25:42 -0400
X-MC-Unique: yJQe2czzMdaAzL6OdRI0dg-1
Received: by mail-qv1-f70.google.com with SMTP id
 h3-20020a0ceec3000000b004b17a25f8bcso10577587qvs.23
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 04:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G17gnPz1x4qXpekJokg0a9OzIWkdEYY06+dtxdEbf80=;
 b=sF5HKg1+y5oBTEx3dQCytx3S0uzUPPEb8IyCf2jOCMumRTyZzhrVpMpriIHpLnDxji
 83ftbdCpXis2qAl3bPy1lB/iJZL/FB8Sl2k/MEVBWGVYFy5XdKSWYyHHtpXpFaGiw8vf
 sft/l+QQ3Qa6foJf57ohEQPvDGjpd+AysSbifNOU9f/bn9pJPp8UH/FkXFjXZlO/yYoP
 ujvLAPH5ZVX3CY7QCbOlEgkC60hkMG231Wy+ih7MWFeMCFLe8232kuthNDIT5fccCXjx
 CjAnoaI/hCwzkzXtKFkA7FkbKvLS4DxJ0Ej6R+1q/TJwB6bUBewYBGnfnvdVyCRaVxlZ
 X6jA==
X-Gm-Message-State: ACrzQf2gkAkEp7jHdjL/TDduf4uLcOOlCMTVq7mMGeGIfYcnn+fengRK
 923PhPkMxRvwk56FUfs0TQUh7IDZbmFucaurEpIbXH/J+GQOM+TBTwhD9zCwBMIeo/S7yEgihQC
 JlDdKIx73XAov
X-Received: by 2002:a05:620a:304:b0:6ee:77f1:ecf9 with SMTP id
 s4-20020a05620a030400b006ee77f1ecf9mr5027712qkm.94.1666178742066; 
 Wed, 19 Oct 2022 04:25:42 -0700 (PDT)
X-Received: by 2002:a05:620a:304:b0:6ee:77f1:ecf9 with SMTP id
 s4-20020a05620a030400b006ee77f1ecf9mr5027696qkm.94.1666178741806; 
 Wed, 19 Oct 2022 04:25:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bm34-20020a05620a19a200b006ce1bfbd603sm4523600qkb.124.2022.10.19.04.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 04:25:40 -0700 (PDT)
Message-ID: <6d7b1865-f3f5-19de-3b8d-5c7d138c478c@redhat.com>
Date: Wed, 19 Oct 2022 13:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats is
 set
To: Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eperezma@redhat.com, jasowang@redhat.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20221018122852.1185395-1-eric.auger@redhat.com>
 <Y063RZ4SkYcRM+SP@x1n> <31b87958-3be6-49c2-f0d9-9bcb8ec3bc1c@redhat.com>
 <Y08g9iaH5lZnPkte@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y08g9iaH5lZnPkte@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p2iOdSoWbXoP

Hi Peter,

On 10/18/22 23:56, Peter Xu wrote:
> On Tue, Oct 18, 2022 at 05:08:19PM +0200, Eric Auger wrote:
>> Hi Peter,
>>
>> On 10/18/22 16:25, Peter Xu wrote:
>>> Hi, Eric,
>>>
>>> On Tue, Oct 18, 2022 at 02:28:52PM +0200, Eric Auger wrote:
>>>> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
>>>> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
>>>> notifier. This latter is supported by the intel-iommu which supports
>>>> device-iotlb if the corresponding option is set. Then 958ec334bca3
>>>> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
>>>> silent fallback to the legacy UNMAP notifier if the viommu does not
>>>> support device iotlb.
>>>>
>>>> Initially vhost/viommu integration was introduced with intel iommu
>>>> assuming ats=on was set on virtio-pci device and device-iotlb was set
>>>> on the intel iommu. vhost acts as an ATS capable device since it
>>>> implements an IOTLB on kernel side. However translated transactions
>>>> that hit the device IOTLB do not transit through the vIOMMU. So this
>>>> requires a limited ATS support on viommu side.
>>>>
>>>> However, in theory, if ats=on is set on a pci device, the
>>>> viommu should support ATS for that device to work.
>>> Pure question: what will happen if one ATS supported PCI device got plugged
>>> into a system whose physical IOMMU does not support ATS?  Will ATS just be
>>> ignored and the device keep working simply without ATS?
>> Yes that's my understanding: in that case the ATS capable device would
>> work with ats disabled (baremetal case). In the iommu driver you can
>> have a look at the pci_enable_ats() call which is guarded by
>> info->ats_supported for instance on intel iommu.
>>
>> Following that reasoning vhost modality should not be enabled without
>> ATS support on vIOMMU side. But it is.
>>
>> In that sense I may rename the ats_enabled helpers with ats_capable?
> Sounds good to me.
OK
>
>> If I understand correctly setting ats=on exposes the ATS capability (
>> 615c4ed205  virtio-pci: address space translation service (ATS) support)
>> which is then enabled by the guest driver.
> I think it won't, as long as vIOMMU doesn't have DT support declared?
That's my assumption too
>
>>> [1]
>>>
>>> [...]
>>>
>>>> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>>>>      iommu->iommu_offset = section->offset_within_address_space -
>>>>                            section->offset_within_region;
>>>>      iommu->hdev = dev;
>>>> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
>>>> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>>>>      if (ret) {
>>>> +        if (vhost_dev_ats_enabled(dev)) {
>>>> +            error_reportf_err(err,
>>>> +                              "vhost cannot register DEVIOTLB_UNMAP "
>>>> +                              "although ATS is enabled, "
>>>> +                              "fall back to legacy UNMAP notifier: ");
>>> We want to use the warning message to either remind the user to (1) add the
>>> dev-iotlb=on parameter for vIOMMU, or (2) drop the ats=on on device.  Am I
>>> right?
>> My focus is to warn the end user there is no support for device-iotlb
>> support in virtio-iommu or vsmmuv3 but vhost does not really require
>> it.Indeed current users of virtio-iommu/vsmmuv3 seem confused now wrt
>> vhost integration and the lack of device-iotlb option on those viommus.
>>
>> On intel I understand we would like to enforce that ats and dev-iotlb
>> are both set or unset. But this is not really addressed in that series.
>> Indeed vtd_iommu_notify_flag_changed does not reject any registration of
>> IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier in case it does not support
>> device-iotlb. I think it should.
> Yes I agree, thanks for finding it.  Just posted a patch:
>
> https://lore.kernel.org/r/20221018215407.363986-1-peterx@redhat.com
OK thanks


>
>> The trouble is vhost_iommu_region_add
>> is not meant to nicely fail.
>>> As we've discussed - I remember Jason used to test with/without dev-iotlb
>>> on vhost on Intel and dev-iotlb is faster on vt-d guest driver than without
>> It would be nice to have a clarification about this. Indeed
>>
>> [PATCH v3 0/5] memory: Skip assertion in memory_region_unregister_iommu_notifier
>> https://lore.kernel.org/all/20201116165506.31315-1-eperezma@redhat.com/
>> mostly focussed on removing an assertion although one patch mentionned perf improvements. What does make the perf better (less device iotlb flushes than general iotlb flushes?)
> I'll leave that to Jason.  Thanks.

OK thanks

Eric
>
>>> it.  So that can make sense to me for (1).  I don't know whether it helps
>>> for (2) because fundamentally it's the same question as [1] above, and
>>> whether that's a legal configuration.
>>>
>>> Thanks,
>>>
>> Adding jean in the loop too
>>
>> Thanks
>>
>> Eric
>>

