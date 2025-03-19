Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp377793njc;
        Wed, 19 Mar 2025 09:47:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPNfzM6+Iyjtak7451sIZCoR3n3AlH1oQEiqWIlzjOSCtpKstBc2yk5ZaZDSqKA/q9Ee9oU3pUzHdQww==@linaro.org
X-Google-Smtp-Source: AGHT+IEZG3IXtu7HRNvjxhztgg+W/tsrKuc/7a7wjkTpJg7kkCykbL2BJ3b+E0SnBMzyGkydFPKS
X-Received: by 2002:a05:620a:2441:b0:7c5:9b2b:83c0 with SMTP id af79cd13be357-7c5a83982efmr487954285a.7.1742402835851;
        Wed, 19 Mar 2025 09:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742402835; cv=none;
        d=google.com; s=arc-20240605;
        b=SASjDCu8Yo5WsR+lza9JWHlKUb6guSOJcnzurirHR3IxUKASJmbX1zX5eNSVW6rBph
         n0tO/ul+xSyzQ7YqNndZPFkyFSyvlF3KUPTYkRC3VeSa3targGV8FE7ybtnfECGVrxTP
         6ajrzfyYyAF1koAYiLLLQ53DLeUkZr20EaDtU0o7jxohwjv0uYaRPA96NRYM3SuaLhQE
         hJqaSxibvJcqbytmxygnnh9hqUIPFwyK3s6meH4/RhXKfwwfE4eBUeBwpAHoD+kVU8e0
         f3svo2Yjk267nhSuGcgPHOgu0XjhQixcFLb9HCVItWdvruDzhxZqi1DlFNq7R/8iM8zp
         2QBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ps+r4+jdVyAOh6eJZGhPtJG9C5CqL8QyhJ6P2qBSgco=;
        fh=xrmm4CLdPvilpMh5VUPith5p+K3D0Cno4v6aQc8VcTk=;
        b=agN/cZX/N9MTGROqtiYjkIQEOSg1cpNHFTTRNLVG0MMTtBrlBgEChPsLx65XZwfQ8q
         lQA88W1kNWOlpnaII+becPyruqY2c3iKzRqtNH3V0KZYs7HkY6dslqBEnzuZ1W6+P/dr
         x3TuJjNLhgzrQcckNVsQgyATQ7fxR6AR5vrBt2w3snLOvu5GAScGNU6AEUOehwY+nII4
         ufHXCJUkkBjdis5wweeUBvBU75kAdiUwtnDItXpvSEqwhUkvjsl7R1nyYj+rcVMyZKrM
         07h63Z4/vDwWmHtZmx9zaIxbt5E3wxbmdQIKG7adkSZQRNLlDrsh+kHQ2Wt4ZERSsSZj
         W4rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BDDTF/BV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573b75466si1512565785a.54.2025.03.19.09.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 09:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BDDTF/BV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuwYs-0003Fe-KQ; Wed, 19 Mar 2025 12:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuwYQ-00038E-Qo
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 12:46:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuwYM-0002tb-RG
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 12:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742402761;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ps+r4+jdVyAOh6eJZGhPtJG9C5CqL8QyhJ6P2qBSgco=;
 b=BDDTF/BVhsfkTEqrSQj/qhdcARaPhL7OUPuHLlBSIWR7sbqMV+gUGRlMZ9Z7kWY8NJ6DMO
 mOQs3PCCST2bLB0gYHWv0av43QwumO+ENl6JWUdIBD3TpU/ImxCN0VQDNaMr9DLQ9ha/r9
 60AJDUFkeOG5tiq6rrvFcHtwl90Athw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-dWPfPGjhP7ym5OXmkL724g-1; Wed, 19 Mar 2025 12:45:57 -0400
X-MC-Unique: dWPfPGjhP7ym5OXmkL724g-1
X-Mimecast-MFC-AGG-ID: dWPfPGjhP7ym5OXmkL724g_1742402756
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so25314135e9.0
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 09:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742402756; x=1743007556;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ps+r4+jdVyAOh6eJZGhPtJG9C5CqL8QyhJ6P2qBSgco=;
 b=ptVbZCeXxbjC9SJ4CT5+2AQTOs8UU7Ka5O96c/lkZrPFzgvR052Y+G8DONE3izQAlM
 cD6q1FvogVNPSeYBxq4sdUl5LKdJEaSP7nRXg2oimYybfggLg3nvkG4qHmkH6GP4vhr0
 heVeajisby9R+ollFul1VrbozBNLymRtjqCBnqUraWMq51RhruoP54KCAVZqgZSh1URz
 gR1510F+UlRznDuJ4dxTtrj1kPAm3bolvqiheHkLbgEiX3hKmSNh+ongfa4Pw9HqRPNA
 17pbTOVXZeqthlNNLsA0emF3wC+eJPFMv42unbSdKd/TT6tCERhxcCdBWxDUpgw7uJVc
 pT/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPHTgVoazspdRsJHCvtq9HJALOFBRUW0CKX3wG5nC1A3SjcRk9bb7Wed90NhBTaA5P2HYQAFbKyw==@nongnu.org
X-Gm-Message-State: AOJu0YzfyEgzezh4mjzgajc4wpUvFvjj4fb1rrjap23V5JKT1TiCL6KH
 HfEB5knbQsTahLIQzLIkKComMKQznLbZ3H1xXnlks/Pxqjmb4U7e3avxpQyl7kt8HXKlSoTtrr3
 vkotuJ+8L8zIomCiuRHzllQjfB/YyV1FdfvohiE4zbj5S7wBzHQ==
X-Gm-Gg: ASbGncukLJcwIzWkEhmIWHS69jH/Uc2LUNyrJNPrrxzMrebF1fzQx7Ld5lEC6AGKrfT
 YAgap0pphMwghNRTmuAm4P1DlSjG8T5Cw/XUw3xogU/Mwqp/lCqLPYiHVQky2BBIM6yPSQd5TzK
 Car32dScFGzAfug/Pw9WmmE4+Bpc4+3DWTJhoCK9dF8mdbQypPg3rdUGwr7Epg+ihJKcUwOC8j1
 JMxh6tjNiPcvCVWG3hhsW158GdXj2On0ZOGxI56tw16QcAJt+l02Nxy4yQmVe2TzdkR2UPZirp/
 4dSszZu61MFut4+c6ZW+N4bT7N6EfNwb1cvPxgk6o/p/j1xx+QvTa8G3DBIZapA=
X-Received: by 2002:a05:600c:5488:b0:43c:f70a:2af0 with SMTP id
 5b1f17b1804b1-43d437f360dmr40431365e9.16.1742402755626; 
 Wed, 19 Mar 2025 09:45:55 -0700 (PDT)
X-Received: by 2002:a05:600c:5488:b0:43c:f70a:2af0 with SMTP id
 5b1f17b1804b1-43d437f360dmr40430885e9.16.1742402755029; 
 Wed, 19 Mar 2025 09:45:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4870ee71sm6921655e9.30.2025.03.19.09.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 09:45:54 -0700 (PDT)
Message-ID: <11895c78-d6ab-40c8-a500-4abed1565234@redhat.com>
Date: Wed, 19 Mar 2025 17:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z9hzmzHfWw18OyGO@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 80VFa2nmt4edbEWwZshJAC5n_DjQ4NYoZ8ORpSq3c3s_1742402756
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W+vmNGQwPb76




On 3/17/25 8:10 PM, Nicolin Chen wrote:
> On Mon, Mar 17, 2025 at 07:07:52PM +0100, Eric Auger wrote:
>> On 3/17/25 6:54 PM, Nicolin Chen wrote:
>>> On Wed, Mar 12, 2025 at 04:15:10PM +0100, Eric Auger wrote:
>>>> On 3/11/25 3:10 PM, Shameer Kolothum wrote:
>>>>> Based on SMMUv3 as a parent device, add a user-creatable smmuv3-accel
>>>>> device. In order to support vfio-pci dev assignment with a Guest
>>>> guest
>>>>> SMMUv3, the physical SMMUv3 has to be configured in nested(S1+s2)
>>>> nested (s1+s2)
>>>>> mode, with Guest owning the S1 page tables. Subsequent patches will
>>>> the guest
>>>>> add support for smmuv3-accel to provide this.
>>>> Can't this -accel smmu also works with emulated devices? Do we want an
>>>> exclusive usage?
>>> Is there any benefit from emulated devices working in the HW-
>>> accelerated nested translation mode?
>> Not really but do we have any justification for using different device
>> name in accel mode? I am not even sure that accel option is really
>> needed. Ideally the qemu device should be able to detect it is
>> protecting a VFIO device, in which case it shall check whether nested is
>> supported by host SMMU and then automatically turn accel mode?
>>
>> I gave the example of the vfio device which has different class
>> implementration depending on the iommufd option being set or not.
> Do you mean that we should just create a regular smmuv3 device and
> let a VFIO device to turn on this smmuv3's accel mode depending on
> its LEGACY/IOMMUFD class?

no this is not what I meant. I gave an example where depending on an
option passed to thye VFIO device you choose one class implement or the
other.
>
> Another question: how does an emulated device work with a vSMMUv3?
I don't get your question. vSMMUv3 currently only works with emulated
devices. Did you mean accelerated SMMUv3?
> I could imagine that all the accel steps would be bypassed since
> !sdev->idev. Yet, the emulated iotlb should cache its translation
> so we will need to flush the iotlb, which will increase complexity
> as the TLBI command dispatching function will need to be aware what
> ASID is for emulated device and what is for vfio device..
I don't get the issue. For emulated device you go through the usual
translate path which indeed caches configs and translations. In case the
guest invalidates something, you know the SID and you find the entries
in the cache that are tagged by this SID.

In case you have an accelerated device (indeed if sdev->idev) you don't
exercise that path. On invalidation you detect the SID matches a VFIO
devoce, propagate the invalidations to the host instead. on the
invalidation you should be able to detect pretty easily if you need to
flush the emulated caches or propagate the invalidations. Do I miss some
extra problematic?

I do not say we should support emulated devices and VFIO devices in the
same guest iommu group. But I don't see why we couldn't easily plug the
accelerated logic in the current logical for emulation/vhost and do not
require a different qemu device.

Thanks

Eric
>
> Thanks
> Nicolin
>

