Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2068336ejb;
        Tue, 3 Oct 2023 08:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP+HKHZgYm5tX66C74Bv2vo0hL/C/ca4+LNFhhl4BJSK1L/Yvv9C7tiV0fKklOZNuFvFGm
X-Received: by 2002:ac8:7dd6:0:b0:410:acd5:a000 with SMTP id c22-20020ac87dd6000000b00410acd5a000mr19435287qte.21.1696348110146;
        Tue, 03 Oct 2023 08:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696348110; cv=none;
        d=google.com; s=arc-20160816;
        b=U6r36X7FQg4NjhOL2FiwvyoDOfxsMb0GyGq5wexnOQ8Y4MfNU8yTMqya4h2QEQKQ8P
         /cDzBRx49gbmF4MeJ4OG+9hqZtcGWZpHqY7WQWF7KP4Xk0wpiKfyUzu7OR2qP9iZlDoC
         SqK8E+CltHJLhYohVzSfR66NvY47uFFpdN0alOweMoh0P/77VC1q0MVahk37NmDEuhss
         Y/MkYn8oW4VPyV62OoZm5aXPJVGZtcMeB8z3kgzrhgvDJMucR4V/ChTcu8MYGouj4TyS
         t/LdRHWc3lb1F2y/ngjpKQ20+cbBZrB7hXhYh5mB8VSCqE2rbORi0H3rlg33inEYzm87
         fjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3HZdZ5c0/bKwO5Deq2ISGBy70fR2UpBl0C2Xwv8f9Bs=;
        fh=gVmgt05lYC9Kq3vZqToIEPbr8DFcTYootz8XWxc6lQg=;
        b=t3exncdf5GByXvf4DmKVqwMcHq7Bl/OEBKkbiAtADaaA+5XBEgQPudw+Zjll96pWQh
         x5MvGz1oCOundvoEmhcjNUt55+QivRVrwC90UM8aqNbGLHmWnhXb/a5UpXo8RhKVE4XV
         gKlv/zlZ+sohMOwQ3EWArfLyJoPApKs2UyldJuIriQ7MtEGgRDhiOPqjNhIWxPgCPrjN
         A/sKvSZP5h8W5hoZM4D4LerG0D1GtMw9gIU8yIq3MrVo9r+N5ENO4B0StrrnoFQvseWY
         FE7fcIjs1r0kVlGQlJMtGKfIiKu6lKgeruvuB/HZ9lUSAe8ImKvqn2+eppkYTvXhMzDW
         xnCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y2Tr/zPq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020ac87f51000000b004197105b96csi638872qtk.191.2023.10.03.08.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Oct 2023 08:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y2Tr/zPq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnhdF-0008E2-5L; Tue, 03 Oct 2023 11:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qnhdC-0008DP-RH
 for qemu-arm@nongnu.org; Tue, 03 Oct 2023 11:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qnhdA-0004kU-Pe
 for qemu-arm@nongnu.org; Tue, 03 Oct 2023 11:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696348095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HZdZ5c0/bKwO5Deq2ISGBy70fR2UpBl0C2Xwv8f9Bs=;
 b=Y2Tr/zPqacqYZ7lubG+y3QB8ya9LIEMUY3HZnUGkMxNAwR4OtTcZg0T5HbtjYPsPuDeLos
 IL1CqeTT+C+jI8lBPpcwUyXFfKC9oIO0g6MY9uMJm256mPwfPg1MydW4AecaeeT6GRIny9
 VAUn/VOyLlP0a4lxKxj6ENjG/S4V3EY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-Tkam-DukMrCSKDJg63FPDA-1; Tue, 03 Oct 2023 11:48:14 -0400
X-MC-Unique: Tkam-DukMrCSKDJg63FPDA-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7740bc7ad6fso166928785a.1
 for <qemu-arm@nongnu.org>; Tue, 03 Oct 2023 08:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696348094; x=1696952894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3HZdZ5c0/bKwO5Deq2ISGBy70fR2UpBl0C2Xwv8f9Bs=;
 b=CMmkZdvR8iMtcIQI8NowpVDzmtBhYrtLVe437TMIwm8onKbAIUGduZG/kZ+QhYfgSV
 9zWPXF68dD259/kagI8ZVbYb5MXLKfjIy9C/Qab3cOzIsRSgbh26CYwzeTMrLmwenOdj
 a2A2O9/VWiY6kK+PowA6Tsja4nOJX5RwNm5z/Zy5Ayl6p1K8Ggde9xkZu93Diagfk1UE
 andwrRAqmYbxNsmof/zhR9PdxTlV5JvLQ4XvLShvjI44AVXj0UeBffPfyrs202gSdKhc
 OrZCP/WHTR1xnWXJi8ZTW7gdE+HC7/aPjYD3JQD+hf/WII4xEl33nHNJRQQbwkR0j0hh
 N1Qg==
X-Gm-Message-State: AOJu0YysV6pGC3q10I6PRFpzl5hgL2AqxWECWCYSWlDXzP/Bg7cN1hsD
 alZMyaZiPt+f/b4NSyNcQd7Cvk6ISe9u/oBnT7VoACnPWES3+wrzP/IBx462ufGrAUdcu+Zzvnp
 ikTeLEkRgryP5
X-Received: by 2002:a05:620a:24c7:b0:775:a3fc:a9d1 with SMTP id
 m7-20020a05620a24c700b00775a3fca9d1mr9453754qkn.23.1696348093976; 
 Tue, 03 Oct 2023 08:48:13 -0700 (PDT)
X-Received: by 2002:a05:620a:24c7:b0:775:a3fc:a9d1 with SMTP id
 m7-20020a05620a24c700b00775a3fca9d1mr9453723qkn.23.1696348093688; 
 Tue, 03 Oct 2023 08:48:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05620a123000b0076ef004f659sm555734qkj.1.2023.10.03.08.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Oct 2023 08:48:13 -0700 (PDT)
Message-ID: <4bf0585d-884a-5f2f-5e98-c79b16fd100c@redhat.com>
Date: Tue, 3 Oct 2023 17:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/12] virtio-iommu: Introduce per IOMMUDevice reserved
 regions
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
References: <20230913080423.523953-1-eric.auger@redhat.com>
 <20230913080423.523953-6-eric.auger@redhat.com>
 <20230929155251.GA2957297@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230929155251.GA2957297@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 1poiW/T3DKUE

Hi Jean,

On 9/29/23 17:52, Jean-Philippe Brucker wrote:
> Hi Eric,
>
> On Wed, Sep 13, 2023 at 10:01:40AM +0200, Eric Auger wrote:
>> For the time being the per device reserved regions are
>> just a duplicate of IOMMU wide reserved regions. Subsequent
>> patches will combine those with host reserved regions, if any.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  include/hw/virtio/virtio-iommu.h |  1 +
>>  hw/virtio/virtio-iommu.c         | 42 ++++++++++++++++++++++++++------
>>  2 files changed, 35 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
>> index eea4564782..70b8ace34d 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -39,6 +39,7 @@ typedef struct IOMMUDevice {
>>      AddressSpace  as;
>>      MemoryRegion root;          /* The root container of the device */
>>      MemoryRegion bypass_mr;     /* The alias of shared memory MR */
>> +    GList *resv_regions;
>>  } IOMMUDevice;
>>  
>>  typedef struct IOMMUPciBus {
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 979cdb5648..ea359b586a 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -624,22 +624,48 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>>      return ret;
>>  }
>>  
>> +static int consolidate_resv_regions(IOMMUDevice *sdev)
>> +{
>> +    VirtIOIOMMU *s = sdev->viommu;
>> +    int i;
>> +
>> +    for (i = 0; i < s->nr_prop_resv_regions; i++) {
>> +        ReservedRegion *reg = g_new0(ReservedRegion, 1);
>> +
>> +        *reg = s->prop_resv_regions[i];
>> +        sdev->resv_regions = g_list_append(sdev->resv_regions, reg);
>> +    }
>> +    return 0;
>> +}
>> +
>>  static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
>>                                                 uint8_t *buf, size_t free)
>>  {
>>      struct virtio_iommu_probe_resv_mem prop = {};
>>      size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
>> -    int i;
>> +    IOMMUDevice *sdev;
>> +    GList *l;
>> +    int ret;
>>  
>> -    total = size * s->nr_prop_resv_regions;
>> +    sdev = container_of(virtio_iommu_mr(s, ep), IOMMUDevice, iommu_mr);
>> +    if (!sdev) {
>> +        return -EINVAL;
>> +    }
>>  
>> +    ret = consolidate_resv_regions(sdev);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    total = size * g_list_length(sdev->resv_regions);
>>      if (total > free) {
>>          return -ENOSPC;
>>      }
>>  
>> -    for (i = 0; i < s->nr_prop_resv_regions; i++) {
>> -        unsigned subtype = s->prop_resv_regions[i].type;
>> -        Range *range = &s->prop_resv_regions[i].range;
>> +    for (l = sdev->resv_regions; l; l = l->next) {
>> +        ReservedRegion *reg = l->data;
>> +        unsigned subtype = reg->type;
>> +        Range *range = &reg->range;
>>  
>>          assert(subtype == VIRTIO_IOMMU_RESV_MEM_T_RESERVED ||
>>                 subtype == VIRTIO_IOMMU_RESV_MEM_T_MSI);
>> @@ -857,7 +883,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>      bool bypass_allowed;
>>      int granule;
>>      bool found;
>> -    int i;
>> +    GList *l;
>>  
>>      interval.low = addr;
>>      interval.high = addr + 1;
>> @@ -895,8 +921,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>          goto unlock;
>>      }
>>  
>> -    for (i = 0; i < s->nr_prop_resv_regions; i++) {
>> -        ReservedRegion *reg = &s->prop_resv_regions[i];
>> +    for (l = sdev->resv_regions; l; l = l->next) {
>> +        ReservedRegion *reg = l->data;
> This means translate() now only takes reserved regions into account after
> the guest issues a probe request, which only happens if the guest actually
> supports the probe feature. It may be better to build the list earlier
> (like when creating the IOMMUDevice), and complete it in
> set_iova_ranges(). I guess both could call consolidate() which would
> rebuild the whole list, for example

you're totally right, I completely missed that point. Will try to follow
your suggestion.

Thanks!

Eric
>
> Thanks,
> Jean
>
>>  
>>          if (range_contains(&reg->range, addr)) {
>>              switch (reg->type) {
>> -- 
>> 2.41.0
>>

