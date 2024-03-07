Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp982097ejb;
        Wed, 6 Mar 2024 23:36:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJCqQEbY1eibUprevwkc2AAFodnV3BsUuApQlXB0hltYJEfdbzyzlcQZCERot7rFx8R/dd7uPtV6xUOmIumD8QlopSr08L
X-Google-Smtp-Source: AGHT+IGLEHaV4adM2fNPZ+c6B2jbdorVNv2VWFi9QRLCurJrb9CZ4xNCkAqg+UE/Yp1riFPwMazx
X-Received: by 2002:a05:620a:19a9:b0:788:4891:53d0 with SMTP id bm41-20020a05620a19a900b00788489153d0mr711552qkb.30.1709796996370;
        Wed, 06 Mar 2024 23:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709796996; cv=none;
        d=google.com; s=arc-20160816;
        b=iYMXobjqu/R8IvbmZ2KHmrB6ce0+7yRnlP+GnSpbWm4nm68N5f0m4BtDj106VN5vkM
         B38kK0QrFESDWovGurQjPUGJjjSmUN946M3EAGlQsWl3ZjqeBxU+jNdNVWVod0ardSGx
         Y0pLog999ics82ZWgF6rUZKToJVOpQM88wNQI9r5Mb/r+B30NEK7MyZzLliv0u40CbjY
         uly2s0wGtCjzmzVUz9nuuHPeg41MQE4wSy+68ho3N2yBqPmQI2dEIMEs+ipChSeZQdqK
         HMWIdnNOkQCDPdKAp0GNZlUu1zerh+EAI7VTlLg/8MFwYeau4ZDi3VbGjWPjv49hhsps
         BQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=D1WfqLZgDka9rQY484/u0YexWs9lTrfR0ok04P3iYdo=;
        fh=KYsowhbGlyWVlzUNHELBVFWJAy+h6vnqEOUMK8trAZs=;
        b=EMVwLojE0SJwB4qlKevyTFo1NcDKMdtTlTkwiyzj+lALAh9kuxgwIh7Li6JPHo2YAl
         dCp2IpIvVtxWryGJSJio1ad6VywFmwQuFwXqflQ6h5upmyuzYHiDN7n6AX2E0MVpoMxp
         CJT775wCHBS+7b+CAfFMGSzPZFNMg7OIyt3MX0zqzdRD+S5x92hnV+1FcCB4ETM+spkb
         Wv1UpvGMnboP6TmRZq9ep/c54QjGQc11+w+Nc2rb1nkVTjo5ukS2Ef+yrmL+eoLMTvro
         gTPug7kDPqtXcCovcY3/4NMUROLIMaBlffiPCMmbyQeRaaMegyfISEgVSYDl9AqJz76f
         agNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OgXsVTZr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi18-20020a05620a379200b00787c0bd8f36si15982387qkn.333.2024.03.06.23.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 23:36:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OgXsVTZr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ri8IT-0006CO-8m; Thu, 07 Mar 2024 02:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ri8IP-0006C0-Gv
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 02:36:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ri8IM-00046P-Rh
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 02:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709796961;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1WfqLZgDka9rQY484/u0YexWs9lTrfR0ok04P3iYdo=;
 b=OgXsVTZrdhB1NE6W8c0PIFeAJq2/lmIdN8+jRIZQEr1yPiEolO+9FHyK3rQI78WHRfgijd
 UXXhbj25gBDuaLhAICGydGPrFDOi/YQhW/K6E/JPFjnMTjUPEkhOLnJUx1VQE175sRWg7F
 bmNEwrfhnu8jJUk8gNwikA+2O5UbYL0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-Wp3_jZ8jPlSwca-71Y0xbQ-1; Thu, 07 Mar 2024 02:36:00 -0500
X-MC-Unique: Wp3_jZ8jPlSwca-71Y0xbQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2d2a5e2e7c3so3508291fa.2
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 23:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709796959; x=1710401759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1WfqLZgDka9rQY484/u0YexWs9lTrfR0ok04P3iYdo=;
 b=n2Mg1I7nd7+4E3FyyUnM/VMTR7a5A+M7sHFszVkn9RLcUHWJv/icnv1T1lLcSCQ0dq
 s4r3eH2MGpg+HD5a69t2PH1Vka17dp8t72YA1RqI8pMGXdGebZRYNy1cYWfkvUkbzE8C
 +qoMDW5I8MXQswRaNsrXrtbQWeYq9m6c4TwM3dp+z6N4ZwTwe/7Xh6jAQFRYCM0EiAza
 aX/bVnutNtpKxJhS3D/xTvSIb1v8lLOcWmkEGxgIiqBm3R2xTtSfVuQcZsETOPoAjc60
 yNR4dK4ZEz7E7VkRe6m+SjhEwf4OMqq7oz+A0yheBvR2xrEGchZqamfTALseV3MukZSU
 XOQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUszyDg5VBxqIPT1uc5LzSXt5xrCuBdK2yV3OIoZ2QmrRo0w1QedBKX5moZKq+D2OQhGFC6u8dMRjDzkW9JrCj9Qe0q
X-Gm-Message-State: AOJu0YwHW0wspM/iML9zHp4HQFc5Y67K/2DZOVLdQrbAqc6u78O1QOJw
 pW4JhoqM+yU4pxXhGI9vstTIj/rqKpnkamEzw1BdueKfisYXf2MPIO5R73d7mAVC5b70yKmC8RX
 ciy27wb8hmpBBW/9xE+mqNy6IC4OZdYYtLgzEt5e6TqNmENa7Cw==
X-Received: by 2002:a05:651c:198c:b0:2d3:ffa0:8782 with SMTP id
 bx12-20020a05651c198c00b002d3ffa08782mr851556ljb.43.1709796959002; 
 Wed, 06 Mar 2024 23:35:59 -0800 (PST)
X-Received: by 2002:a05:651c:198c:b0:2d3:ffa0:8782 with SMTP id
 bx12-20020a05651c198c00b002d3ffa08782mr851536ljb.43.1709796958628; 
 Wed, 06 Mar 2024 23:35:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a5d6590000000b0033d56aa4f45sm19575005wru.112.2024.03.06.23.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 23:35:58 -0800 (PST)
Message-ID: <0b2dea01-f587-4ef8-bf56-e56b881b693e@redhat.com>
Date: Thu, 7 Mar 2024 08:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] virtio-iommu: Add an option to define the input
 range width
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jean-philippe@linaro.org, imammedo@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240306203348.65776-1-eric.auger@redhat.com>
 <20240306203348.65776-7-eric.auger@redhat.com>
 <708f7eb4-f1fb-4f8e-8cba-7d270c84847c@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <708f7eb4-f1fb-4f8e-8cba-7d270c84847c@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: h2yLnVAxPs7p



On 3/6/24 21:45, Philippe Mathieu-Daudé wrote:
> On 6/3/24 21:32, Eric Auger wrote:
>> aw-bits is a new option that allows to set the bit width of
>> the input address range. This value will be used as a default for
>> the device config input_range.end. By default it is set to 64 bits
>> which is the current value.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - Check the aw-bits value is within [32,64]
>> ---
>>   include/hw/virtio/virtio-iommu.h | 1 +
>>   hw/virtio/virtio-iommu.c         | 7 ++++++-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h
>> b/include/hw/virtio/virtio-iommu.h
>> index 67ea5022af..83a52cc446 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -68,6 +68,7 @@ struct VirtIOIOMMU {
>>       Notifier machine_done;
>>       bool granule_frozen;
>>       GranuleMode granule_mode;
>> +    uint8_t aw_bits;
>>   };
>>     #endif
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index aab97e1527..9b2813188b 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -1314,7 +1314,11 @@ static void
>> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>        * in vfio realize
>>        */
>>       s->config.bypass = s->boot_bypass;
>> -    s->config.input_range.end = UINT64_MAX;
>> +    if (s->aw_bits < 32 || s->aw_bits > 64) {
>> +        error_setg(errp, "aw-bits must be within [32,64]");
>
> Don't we need to return?
It looks better. Nevertheless this was tested and it gives the expected
behavior.

Thanks

Eric
>
>> +    }
>> +    s->config.input_range.end =
>> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
>>         switch (s->granule_mode) {
>>       case GRANULE_MODE_4K:
>> @@ -1544,6 +1548,7 @@ static Property virtio_iommu_properties[] = {
>>       DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>>       DEFINE_PROP_GRANULE_MODE("granule", VirtIOIOMMU, granule_mode,
>>                                GRANULE_MODE_HOST),
>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>

