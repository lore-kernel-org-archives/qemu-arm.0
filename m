Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp286533ejq;
        Wed, 24 Jan 2024 05:14:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMYpNvYPr/WM7S//RzvTt2WeVgy9zsmLvso6QeHUVXNV9NWrw2XhPWrQs3WPXJe8JnQe5S
X-Received: by 2002:ac8:5a82:0:b0:42a:4a36:d134 with SMTP id c2-20020ac85a82000000b0042a4a36d134mr2895877qtc.113.1706102083637;
        Wed, 24 Jan 2024 05:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706102083; cv=none;
        d=google.com; s=arc-20160816;
        b=g1CgRROkFawCadizuwSw37uHUnJyfyzIgro0jYeW+dogxhh7wGxXJr1QFdsYTFrUx6
         Js8FfvPZoQpCIOyRy15mjSdiTZhoChq/OdRpnmkA9GAhBOIpj03Oht+du50d3j+wNEQo
         xBvswU6duVL8Ku2/PzF1eOJjGgmg/u+FpUVxzQe12r6AZUh6hwpTo7lLmEIyXYASz1Wc
         NBN2iZ1CBiFfrrGhXq1i4rmdJxWboBnmkQo2NsnCi3kXk9Dhu1SXXvyqZcWGRlyRFGCT
         JsqV3hRKA4SVTWUg+MEV6e1d3UBWLqWaJ+fnqOJWaVTi1JbRtiE9hh5Hb/nXoxRqpEDX
         xqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Kikj5Q9USpTy7MPHUzO0q8pIzEJ5a9YPFpJuSzTrSjU=;
        fh=vSwT/VBY71qtAKEEWcguHenACYEbQUjHfUMtQuf6Vkw=;
        b=DWtz5eDBE2FiECb/r5wMLE5ynV9Ahd7oT33XdQCRxRS1kX6UMEwjpjuXz79DzHUufr
         kEw4bN4Fpups/vWZJgQfCEczQzyedAHOC1BN8V4GeKWYem1aTnGRGAm+tj5qtRsdEyQZ
         CK5CUHY/IsIPT0n0uoTxZ5wa5HWheVqcz1iwdyTHXG9NqZWlQ+oez5nMHe8AQvq/oFdy
         z0UtLCEDZiekMWRSQbaeh9CJ6dH3UIUqFiafncc2pva5lJuxQ1pL1kZiEWCJ4T8XF70V
         u9mBw22CiaqEhb22UbWd5BmEtJHTbZYjqr2wNkgumRr/MfScqWdZoLadE5ZA1fZotK7m
         e3Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FVk55Xmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020a05622a110800b0042a3a097dc1si7695903qty.728.2024.01.24.05.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 05:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FVk55Xmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSd5M-0006VV-GZ; Wed, 24 Jan 2024 08:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSd5I-0006Qm-KN
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 08:14:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSd5G-00056O-Vm
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 08:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706102065;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kikj5Q9USpTy7MPHUzO0q8pIzEJ5a9YPFpJuSzTrSjU=;
 b=FVk55Xmu8XbDXdvm95F1bgWZbkWk2bSM67UBOXVBlcja3Frb20vXSTgP15r9DIuWO5tKVN
 KWGejyYS5xOcIbCNMFHrT+rnsN95/aRPba+BT4uAd/oWQZsQ4X59+W6hoEXWppYYr4xB+h
 a8JPrCV8lA7cnBn6SMj8HdQbch6y8ME=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-A5rnMis4MbOnmWm2sdLnPw-1; Wed, 24 Jan 2024 08:14:23 -0500
X-MC-Unique: A5rnMis4MbOnmWm2sdLnPw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7830ab8fb5aso602940185a.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 05:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706102063; x=1706706863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kikj5Q9USpTy7MPHUzO0q8pIzEJ5a9YPFpJuSzTrSjU=;
 b=qBRc9Tp+hhqdPqj9oki5V41y+T7oojkSQGgVNAlhlcqtROL0mCw06p6g9qNIsWU+ux
 mfjHRD4w1ezR+34CGYkaSumPwTwca57lMMICzMR+We6o1GLWZxhuaUM2nQi1QFGDMrHm
 n+G9tL4SAgS/NTuiqf5pVphanbTirBJVAknbK8lE9JhxIqHiLSplLqim+Vkks5BybtFL
 TV8ZjesOyIksKKNG9FyeIF2BZ2oBMVmrOMQxqFdNxut/JQwquhp8efYxEvvem0G52U8Z
 /WJkVitEMiulFVk0STsaISj9bJpYqMsc0oAx3PH7qJK1Kt48Qu0GfDfomJ+0IC5C8t+5
 7cVA==
X-Gm-Message-State: AOJu0YwtLEkAVkhPIJcUZZuepXNV6wyLink9k6rZ2zdFPv4WwujZv6dR
 FDK2Z0G2kgFr+5AUjd41V5N8NwdozNxRY20evhycu51Y5k22FO16G7qfrZS7SEWrhYfmxSZycD9
 7vt8DfFN8aC45qcFP6qlx5o6vCbB51YU/MyUhMnmoyOg7hDNhSA==
X-Received: by 2002:a05:620a:218a:b0:783:3625:9e35 with SMTP id
 g10-20020a05620a218a00b0078336259e35mr7571485qka.20.1706102063348; 
 Wed, 24 Jan 2024 05:14:23 -0800 (PST)
X-Received: by 2002:a05:620a:218a:b0:783:3625:9e35 with SMTP id
 g10-20020a05620a218a00b0078336259e35mr7571475qka.20.1706102063081; 
 Wed, 24 Jan 2024 05:14:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a37ac10000000b007816dc2ef52sm4019251qkm.8.2024.01.24.05.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 05:14:22 -0800 (PST)
Message-ID: <a35c4fad-a981-4fbf-81d1-be5625a537b9@redhat.com>
Date: Wed, 24 Jan 2024 14:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] virtio-iommu: Add an option to define the input range
 width
To: Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, peterx@redhat.com, yanghliu@redhat.com,
 mst@redhat.com, clg@redhat.com, jasowang@redhat.com
References: <20240123181753.413961-1-eric.auger@redhat.com>
 <20240123181753.413961-2-eric.auger@redhat.com>
 <20240123165141.7a79de34.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240123165141.7a79de34.alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
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
X-TUID: kk5tO/sQx5N0

Hi Alex,

On 1/24/24 00:51, Alex Williamson wrote:
> On Tue, 23 Jan 2024 19:15:55 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> aw-bits is a new option that allows to set the bit width of
>> the input address range. This value will be used as a default for
>> the device config input_range.end. By default it is set to 64 bits
>> which is the current value.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  include/hw/virtio/virtio-iommu.h | 1 +
>>  hw/virtio/virtio-iommu.c         | 4 +++-
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
>> index 781ebaea8f..5fbe4677c2 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -66,6 +66,7 @@ struct VirtIOIOMMU {
>>      bool boot_bypass;
>>      Notifier machine_done;
>>      bool granule_frozen;
>> +    uint8_t aw_bits;
>>  };
>>  
>>  #endif
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index ec2ba11d1d..e7f299e0c6 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -1314,7 +1314,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>       */
>>      s->config.bypass = s->boot_bypass;
>>      s->config.page_size_mask = qemu_real_host_page_mask();
>> -    s->config.input_range.end = UINT64_MAX;
>> +    s->config.input_range.end =
>> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
> What happens when someone sets aw_bits = 1?  There are a whole bunch of
> impractical values here ripe for annoying bug reports.  vtd_realize()
> returns an Error for any values other than 39 or 48.  We might pick an
> arbitrary lower bound (39?) or some other more creative solution here
> to avoid those silly issues in our future.  Thanks,
You're right. I can check the input value. This needs to be dependent on
the machine though but this should be feasable.
Then I would allow 39 and 48 for q35 and 64 only on ARM.

Eric
>
> Alex
>
>>      s->config.domain_range.end = UINT32_MAX;
>>      s->config.probe_size = VIOMMU_PROBE_SIZE;
>>  
>> @@ -1525,6 +1526,7 @@ static Property virtio_iommu_properties[] = {
>>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>>                       TYPE_PCI_BUS, PCIBus *),
>>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  

