Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3203143ejn;
        Tue, 18 Oct 2022 08:10:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4De89PL8GAbqgNys5XBv972AfFMYaeKIINlM7LiF+jpoqJ0OSALleJp50wjIIPqK4nb8qt
X-Received: by 2002:a05:620a:448c:b0:6ee:d075:2078 with SMTP id x12-20020a05620a448c00b006eed0752078mr2117459qkp.273.1666105805570;
        Tue, 18 Oct 2022 08:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666105805; cv=none;
        d=google.com; s=arc-20160816;
        b=EV++mOT93164BSM3RpdPhgRH7Uj5etnS2wSrUmbQQK6Lry2pix7NVWuVnDAiZr+/KO
         ocJWpXuT4oFyXYtveWQJ0fYecgM73Y4TxCl1CTKMGv8kgpKU6T06e3HcMPdlUbjkAjkF
         f2TfUAR/7DZLx7O77WebK1ii65VxOmwkll1cvvZdh+J8S/wHofyPTP58azA9B7e60CbZ
         bMczuPTm1GLLrEdCriXdgASWQNMOwQPgnx4U/z35hwu7yynKSbX2LHInFW3LGb/0eyLN
         8lYMZfSwUYowWXy9ESl6qxx+J5/hHd/2OmWF9zMs7luFib0jODhdpnhSVNiZR9A/HBgk
         EvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=l4UZAMN+G8w20iLkj6BfVptcgKmN+6B7LWyzcsG4WVY=;
        b=f2ML3n5eu0/Z5epHajtIxX/fZ1IfTIIFiVYj0bLAyA+TQsF1DguBoBqgy/8DHlMved
         aANGfO73JdmONdKMWRpJbmfUIxK3x10021UhcrGQkFK6cWVlxN1HYRyrp8LrLx2vmoKZ
         +jwrOMws1YfneCyMgH2tAsvfEvEMqmCQ+G89CpdpoJ+SJJe+SIPLsVUPz9G6BxMUG8q2
         eZEFCtvj37ECiJsBAduIUMKwVYc6w2XUutFwUbqPX3utigySwyg9kBoMcHBGKs7nUSuU
         m5kpgoZOJHgCLgbW2muWUHAsHhaM7NsF3ZNZrMPp8ud2UKNeXf8hegEzR5itDZHXyfCQ
         hGBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U7vVqOQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020ac8430c000000b0035cd90b83cdsi7557627qtm.376.2022.10.18.08.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Oct 2022 08:10:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U7vVqOQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okoEG-0006Jp-Ev
	for alex.bennee@linaro.org; Tue, 18 Oct 2022 11:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1okoCx-0006I7-Qy
 for qemu-arm@nongnu.org; Tue, 18 Oct 2022 11:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1okoCi-0004oZ-1s
 for qemu-arm@nongnu.org; Tue, 18 Oct 2022 11:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666105706;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4UZAMN+G8w20iLkj6BfVptcgKmN+6B7LWyzcsG4WVY=;
 b=U7vVqOQreYjrVO1/oADCiwkFj6E8hWTQYgCW60B9W6CzZrpQsYxkJf2DugJZJfcddMmElA
 //Iu3kObvJcTZP7qa65RDpfyAke+8Bho+emaQPkqHoB3Urt8jPVGGgQbeZlA6seVdqkFAv
 P82Ok0pedr3wEPE7qr1LjCZ5jGoxBZc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-yF41-ZaCOPCSTEAD_VOxyw-1; Tue, 18 Oct 2022 11:08:25 -0400
X-MC-Unique: yF41-ZaCOPCSTEAD_VOxyw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d12-20020a05622a100c00b0039ce6373d2cso4887029qte.9
 for <qemu-arm@nongnu.org>; Tue, 18 Oct 2022 08:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4UZAMN+G8w20iLkj6BfVptcgKmN+6B7LWyzcsG4WVY=;
 b=Jv/u1yavweUboUXjB3S+SOsz+ccOB0RsFXdpcwqbytcUf4qamc9fzY29wTOL2+r3mf
 3mj6FZ3plYBkXQouKi4WTHTTGTfty1v21lZNwyzoJ827prOgsr0nYe4wJkeCpGxfpxIo
 JNvXJhGZjfeFUYSNMopj/sud5MnScabdQ3xV/ZLMqBQAvj+S8PYFyKq7pQkf8oKazLPh
 esad2UEZIecZgtbemIuyxCpkt+HxkcH0L0HUzpp+edplk6510gjnIsp0SrJnkna2sgMo
 7oyg8U24tCtSekz27Z2PsETwY9a8fLtRSFBKQPc3Vgx/dxz3j8VYKyFWBHUkI07Tp9cC
 68aw==
X-Gm-Message-State: ACrzQf1qxeZUoo95sma6FRXWZ8Q8TGFAUVAjGS5joBPp/FKKRi1Fh+Vs
 AIgm8KiU7fh/DjW0uQ4u83/1PBZxKO8rH6nFME31Ne8w8B1DcCpamM19qk2oajO4qQQ38k04J0S
 cab0oa3t+Z9ko
X-Received: by 2002:a05:620a:1465:b0:6ee:95e9:d1ec with SMTP id
 j5-20020a05620a146500b006ee95e9d1ecmr2166930qkl.174.1666105704750; 
 Tue, 18 Oct 2022 08:08:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1465:b0:6ee:95e9:d1ec with SMTP id
 j5-20020a05620a146500b006ee95e9d1ecmr2166904qkl.174.1666105704473; 
 Tue, 18 Oct 2022 08:08:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a05620a0c5500b006b5bf5d45casm2684447qki.27.2022.10.18.08.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 08:08:22 -0700 (PDT)
Message-ID: <31b87958-3be6-49c2-f0d9-9bcb8ec3bc1c@redhat.com>
Date: Tue, 18 Oct 2022 17:08:19 +0200
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
 <Y063RZ4SkYcRM+SP@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y063RZ4SkYcRM+SP@x1n>
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
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZldUnnXB90s

Hi Peter,

On 10/18/22 16:25, Peter Xu wrote:
> Hi, Eric,
>
> On Tue, Oct 18, 2022 at 02:28:52PM +0200, Eric Auger wrote:
>> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
>> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
>> notifier. This latter is supported by the intel-iommu which supports
>> device-iotlb if the corresponding option is set. Then 958ec334bca3
>> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
>> silent fallback to the legacy UNMAP notifier if the viommu does not
>> support device iotlb.
>>
>> Initially vhost/viommu integration was introduced with intel iommu
>> assuming ats=on was set on virtio-pci device and device-iotlb was set
>> on the intel iommu. vhost acts as an ATS capable device since it
>> implements an IOTLB on kernel side. However translated transactions
>> that hit the device IOTLB do not transit through the vIOMMU. So this
>> requires a limited ATS support on viommu side.
>>
>> However, in theory, if ats=on is set on a pci device, the
>> viommu should support ATS for that device to work.
> Pure question: what will happen if one ATS supported PCI device got plugged
> into a system whose physical IOMMU does not support ATS?  Will ATS just be
> ignored and the device keep working simply without ATS?
Yes that's my understanding: in that case the ATS capable device would
work with ats disabled (baremetal case). In the iommu driver you can
have a look at the pci_enable_ats() call which is guarded by
info->ats_supported for instance on intel iommu.

Following that reasoning vhost modality should not be enabled without
ATS support on vIOMMU side. But it is.

In that sense I may rename the ats_enabled helpers with ats_capable? If
I understand correctly setting ats=on exposes the ATS capability (
615c4ed205  virtio-pci: address space translation service (ATS) support)
which is then enabled by the guest driver.

> [1]
>
> [...]
>
>> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>>      iommu->iommu_offset = section->offset_within_address_space -
>>                            section->offset_within_region;
>>      iommu->hdev = dev;
>> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
>> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>>      if (ret) {
>> +        if (vhost_dev_ats_enabled(dev)) {
>> +            error_reportf_err(err,
>> +                              "vhost cannot register DEVIOTLB_UNMAP "
>> +                              "although ATS is enabled, "
>> +                              "fall back to legacy UNMAP notifier: ");
> We want to use the warning message to either remind the user to (1) add the
> dev-iotlb=on parameter for vIOMMU, or (2) drop the ats=on on device.  Am I
> right?
My focus is to warn the end user there is no support for device-iotlb
support in virtio-iommu or vsmmuv3 but vhost does not really require
it.Indeed current users of virtio-iommu/vsmmuv3 seem confused now wrt
vhost integration and the lack of device-iotlb option on those viommus.

On intel I understand we would like to enforce that ats and dev-iotlb
are both set or unset. But this is not really addressed in that series.
Indeed vtd_iommu_notify_flag_changed does not reject any registration of
IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier in case it does not support
device-iotlb. I think it should. The trouble is vhost_iommu_region_add
is not meant to nicely fail.
>
> As we've discussed - I remember Jason used to test with/without dev-iotlb
> on vhost on Intel and dev-iotlb is faster on vt-d guest driver than without
It would be nice to have a clarification about this. Indeed

[PATCH v3 0/5] memory: Skip assertion in memory_region_unregister_iommu_notifier
https://lore.kernel.org/all/20201116165506.31315-1-eperezma@redhat.com/
mostly focussed on removing an assertion although one patch mentionned perf improvements. What does make the perf better (less device iotlb flushes than general iotlb flushes?)

> it.  So that can make sense to me for (1).  I don't know whether it helps
> for (2) because fundamentally it's the same question as [1] above, and
> whether that's a legal configuration.
>
> Thanks,
>
Adding jean in the loop too

Thanks

Eric

