Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3432203njb;
        Tue, 9 Jul 2024 10:22:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsqz/dGZZkAo+PgxZJ45kTpw5nHXZfKf0TDCX2cus1zFtIEv+v5rBWqSreo/HAf7uvsuZ/xiENqWpNJVUP7J4rdUXnI2Fk
X-Google-Smtp-Source: AGHT+IGAcqp9GDSbNV6+ntnbaSHxe+1OfUg/7z97CxkKV+ZWL9elMsM1x8EbMCt3YVUE2XRvKo9f
X-Received: by 2002:ac8:5982:0:b0:447:e749:8f37 with SMTP id d75a77b69052e-447faaa5bfemr29705581cf.44.1720545763148;
        Tue, 09 Jul 2024 10:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720545763; cv=none;
        d=google.com; s=arc-20160816;
        b=Sjx2v4hqrC7Rht04HeSgQgwAYS7OQC1hCOlltkiceCdKmV6WoPt9JPNi4B03LpBR+G
         17OfvpaL4Om/qQZqv9EhCMvOTYMwYlJ8ITDCjUq8S5uO22+CqpydoPUCQTcPDuMbJwNG
         KPrgXTZ8ANOWjxzOU+XB397nRe4c+MmyM8Qf4uAalDUk7P5M+roZp5LiU2g0q7qxqOsM
         Lb4eG2Ye9f1ThLchNbdXETGWlXRgpe4p4CDGyqsYMEhiU4Gpm84oqkaUbUtbwFhnH7EB
         tfQDvymU/C64Uzijl03cMfVuT6xS47ETUOPi6K4dP2IQD55NjIcuxbZPxwT60i9bmiam
         8P9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iLCSdK5CDxFC2cuLoRA2C0FbaS0h1Z97ombPVZtp9+E=;
        fh=AjU9Lwua+2yitWU+nmYMe0pqrrGQzbe+zmrFZi/87ec=;
        b=U/rGWObJ0iCqwiKTmk7jomXm2wWdaEoD9gtCsHsQ+20lcUs/qQwhjYOVQyPbcqba0V
         4DT9LmVuqiXdp71Zy+y0CYHALc7VGHILWOeWkzMIcDp48W+jIrUdx3p9oZAFS4V4r01f
         9BEhJWF7tCMcGoWZ3tPXu/MMYDqAfCKBeHt64YUXPFKnnO1IgkA6uGyKAQnQaWWq4Fz2
         5R+3IzKKQVCY8wWzVePLLZHzyfbx0ASaClmf/aCGqQVCm/3PiuzQH7W713xvMY+N3HPK
         zPOvxS1uT6UmXuhTxdsuHWo+YVc7kqlKmMTxXzPZfEU9JVULTBFRqGra3o4I6shJe8so
         MKBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JZjes+mS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9beae90si25137031cf.599.2024.07.09.10.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 10:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JZjes+mS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sREXx-00080P-FE; Tue, 09 Jul 2024 13:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sREXv-0007zH-My
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 13:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sREXt-0002U8-RX
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 13:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720545748;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLCSdK5CDxFC2cuLoRA2C0FbaS0h1Z97ombPVZtp9+E=;
 b=JZjes+mS2vwNolZmf/MePjiALotLFFJofW/nBViNFzSu0VVG2lGHm3kjWMJJ7K0e1ePW4s
 Y8Hsm/klwXd7ENGTeunKIhEk9MleMcjyj0j6JAEfmVj04jMsZVsAG37zQxAbVhlpk32Oru
 YU5N0fLet5UI0wDEmOgZHvshotRdixE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-xeLKzelKPB-gKdyd6hj96w-1; Tue, 09 Jul 2024 13:22:21 -0400
X-MC-Unique: xeLKzelKPB-gKdyd6hj96w-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4465c3713daso78218881cf.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 10:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720545741; x=1721150541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLCSdK5CDxFC2cuLoRA2C0FbaS0h1Z97ombPVZtp9+E=;
 b=P8MjfVfFJy+XOZAos6xExzk+vVR2rBIrSKy9sDQRGO95XqPROTzcdn1mAcMk+rHcTY
 gYl5heRxot5E44FwFC/Af5maQAEh9iFWDfK1h7k1tl6/ORZmaT69pS0+W0KY2bmR8NFT
 tJFUKcjWd1GXlOd/LrnZhoTOtEIr5GMhsE/R8KRkLQ+iIft9B1U6FNeTeC/b8bwnGRgq
 /oYXud6HWfilxRh/4f0OKJEySAGfef364U6OblXQLGC0y7l4YkTc6WfluhS6Gbz2sgbB
 uZ6Dq0CrxqX7HxOJFauKCyq3f65daUAt+ex1oCOZ7GCAxjTeGBd7RwDr8T1SIz7wk00X
 TIbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuFYnOUWhExwReD+oGOLnCJ6zdTRW5uAR4wH9MHeiXNxE8TgIqaRUdYaG8wPiKDr3AXCKwvf9WkqWVjy1bLvXP0UYU
X-Gm-Message-State: AOJu0YwBGlNhB2MCzm3bwBu702WaEdI7gT/BaNJRuSLD+pw6qz6C/TXZ
 yqrb5sLTs/RQzIOBfQwHh8wnm99XbRxZM3W8+/Is7JSWzmoFfTUQeaUBQo6ofRQTafPJn8FWLNK
 heszs516vmbsvlad1/dplxgnyXhM4pvMa0fHgc7AX1MZ0AsJxsA==
X-Received: by 2002:a05:622a:24e:b0:447:f259:2954 with SMTP id
 d75a77b69052e-447faaa5f53mr31109351cf.51.1720545741231; 
 Tue, 09 Jul 2024 10:22:21 -0700 (PDT)
X-Received: by 2002:a05:622a:24e:b0:447:f259:2954 with SMTP id
 d75a77b69052e-447faaa5f53mr31109121cf.51.1720545740923; 
 Tue, 09 Jul 2024 10:22:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-447f9b26842sm12359921cf.3.2024.07.09.10.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 10:22:20 -0700 (PDT)
Message-ID: <33e5c4b7-6f5e-4ef2-9156-9a1e4b6a2dfe@redhat.com>
Date: Tue, 9 Jul 2024 19:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 03/10] hw/arm/virt: Get the number of host-level
 SMMUv3 instances
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peterx@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jgg@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, jasowang@redhat.com
References: <cover.1719361174.git.nicolinc@nvidia.com>
 <886883c4cb43117ef26e6c9434247b75cd827f31.1719361174.git.nicolinc@nvidia.com>
 <3d151591-4cc6-4de4-8055-27d6fb7200df@redhat.com>
 <Zo1vW5dwHqBM5zFN@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Zo1vW5dwHqBM5zFN@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +sKMfoyM21eB



On 7/9/24 19:11, Nicolin Chen wrote:
> On Tue, Jul 09, 2024 at 11:20:16AM +0200, Eric Auger wrote:
>> On 6/26/24 02:28, Nicolin Chen wrote:
>>> Nested SMMUv3 feature requires the support/presence of host-level SMMUv3
>>> instance(s). Add a helper to read the sysfs for the number of instances.
>>> Log them in a vms list using a new struct VirtNestedSmmu.
>>>
>>> This will be used by a following patch to assign a passthrough device to
>>> corresponding nested SMMUv3 instance.
>> Laterly the HostIOMMUDevice has been introduced to allow, among other
>> things, to pass information related to the physical IOMMU to the virtual
>> IOMMU.
>> I guess it would be well fitted to associate the viommu with its
>> underlying piommu.
> Wow, I missed that part -- backends/host_iommu_device. I will
> see how I can fit these well with that.
>
>> I don't think we have such kind of host introspection in machine type.
>> Generally in can happen in the very device or in libvirt.
> I think the biggest reason for having such an introspection in
> the virt code is because of hotplug, (though it's not properly
> implemented yet), as we don't know what new devices requiring
> for nested translation would be joining later. So somebody has
> to hold a full list.
>
> Would you mind elaborating how the "device" or "libvirt" can
> handle that?
If you know that on Grace you have 5 SMMU instances, can't you pre-build
a PCIe topology with 5 PXB and root ports at libvirt level.
Then when you hotplug your device you specify the corresponding slot
just as we do normally. But maybe I misunderstood the hotplug problematics.

Eric
>
> Thanks!
> Nicolin
>

