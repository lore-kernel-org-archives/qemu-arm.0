Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp308641ejq;
        Wed, 24 Jan 2024 05:58:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMnk4aejphEUd9E7Ao6hK4rNDcp75NQeUMCfZmMshx3GxM1+D57e9DOBOC/FV31LNhpTgP
X-Received: by 2002:a05:620a:570:b0:783:252c:cd65 with SMTP id p16-20020a05620a057000b00783252ccd65mr7718200qkp.123.1706104689579;
        Wed, 24 Jan 2024 05:58:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706104689; cv=none;
        d=google.com; s=arc-20160816;
        b=dsuwAI/98VuBT6DxDs12RTscxozEMwRnnYoYNOjIIbxn5lkPdGyKrKSy+sLgrM4TMN
         KU214VjoWqC+v0U/0jTRb9dkDeDNpq10vcDTMqmqgW1uyQ5mPNd9pAIwMVu6wulmaryS
         iK8ntChtpR+kKKjxYqWvTk8v+1w8zrsOZWfmAU3veAtAyB7N68ELJSEh/0x2Nu42VpBx
         EPKJS8c1kYj46tWLrn369nK5M8TpzKghku7ypvhuy80/4sCayu11O6Nue4VQoccTozF7
         YXzUc4YDK/0SwxTmnotM6koAlRVoYiB13x3vEvCiiSYuBhC+kPlo0BExPoNaFii3unvK
         sx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=a1fnDX6sltVJ/8BF/VLCjhr9I2rkrkUjdXw/y9U6yng=;
        fh=vSwT/VBY71qtAKEEWcguHenACYEbQUjHfUMtQuf6Vkw=;
        b=r9vGoZwtV+E+nt76NGs2/fKGXETzhJMH6MfiopxC7m5KPxz05jUy/iCP356ULtLXqa
         qkoBV2XLiW4tI2AbDYAns1x7AqMm4lmmBHlCJggin8JL9/30eDRrtd8DoiVmj3RP0D6h
         j4O7G20RILYrA+ZnM5b6ssCaKrv5SX9NNfvem0RL+zTXnQO0OA/Kf8Bj0gLZUJuRnJ41
         d4M9PGE0eAZ2G9NgG0x8LyDFlTNMyady0jq5KaZ/7kum0zr+typSDb3R2SLrPNZv5aC1
         E1yWnatk1db1InT7OywuRjjnFZMwgmg01OgYywzi7n8CacVAyU69OuTkf/7rHPEzvGee
         A2xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gz8jCOst;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4-20020ae9e104000000b007832a89dedbsi10047733qkm.82.2024.01.24.05.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 05:58:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gz8jCOst;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSdlJ-0001ot-LM; Wed, 24 Jan 2024 08:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSdlI-0001mU-EE
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 08:57:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSdlG-0005tM-R7
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 08:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706104670;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1fnDX6sltVJ/8BF/VLCjhr9I2rkrkUjdXw/y9U6yng=;
 b=Gz8jCOsteJK2AHu2yTAlZ8oFDoU2lgvdnm5DcpsvaOHvAsFXKLSLLzUrjljc2XAKOR8tQM
 /Sx/3bpAO9yI+MXpS7QTH7xeZ7KeJbafnPwPrHXJjBheErVl/BkD1pF7pwg79vnijciICF
 eRBUVRT76z0IMhvHoagxF9S34ILLVCI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-VylQBbMzMsS-v7gVZhohRA-1; Wed, 24 Jan 2024 08:57:46 -0500
X-MC-Unique: VylQBbMzMsS-v7gVZhohRA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-783abd199dbso192966985a.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 05:57:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706104666; x=1706709466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a1fnDX6sltVJ/8BF/VLCjhr9I2rkrkUjdXw/y9U6yng=;
 b=EEwrkO13lUOt5xb33FyGFblOqgP4PzOs1i1RqDPZNdUTXriB245UPV3c1a6ElRVk2V
 y6Lluy/7jwUrbgZoiCTmEKWShOLeCLPbD0/9JY3r1N7FzjEdy7BptxFwSSlAE5CEOR02
 o8UgdSH1YhjxJm4PZSogZ/cAL25MqOij1+ONj/uGmoAIbw9AJbRq7slPaA2SeBw6Ter/
 HDP9iVRICcnjRE/ij7wZxrCRPEPH01I6BBCbuU2Lv9zYOuY4O9W4PfX+KLjK7xEyC/Lq
 7pwf2OeAbXiBK3cbDJCZu764bbeWnsn2eejd14B++IHg9IrqcPU2mFjpN1gj/tGcbOoa
 19jw==
X-Gm-Message-State: AOJu0YyuUjaDaFXGB6/XF00VFm4GEFuvh3ldVYUPWNnMwDvrC/tiuy93
 oGot0sUiSUcD/4cLC08dc3ajOMv21zfr4NyfAHKqycAOiNqaicyPJPOZZHS7mNuA27z8Jly8khi
 HKS7kr8bSw3il9v8hCFqbCdILzrBk4rDdzX3I7/oUdnxPXnLzJw==
X-Received: by 2002:a05:622a:15c5:b0:42a:311f:a7c2 with SMTP id
 d5-20020a05622a15c500b0042a311fa7c2mr2663606qty.1.1706104666252; 
 Wed, 24 Jan 2024 05:57:46 -0800 (PST)
X-Received: by 2002:a05:622a:15c5:b0:42a:311f:a7c2 with SMTP id
 d5-20020a05622a15c500b0042a311fa7c2mr2663596qty.1.1706104665995; 
 Wed, 24 Jan 2024 05:57:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ay23-20020a05622a229700b0042a5c2a81a8sm614103qtb.60.2024.01.24.05.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 05:57:45 -0800 (PST)
Message-ID: <a92a2023-7448-4b74-bfd9-e412c6092270@redhat.com>
Date: Wed, 24 Jan 2024 14:57:41 +0100
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
 <a35c4fad-a981-4fbf-81d1-be5625a537b9@redhat.com>
 <20240124063700.67c8c32c.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240124063700.67c8c32c.alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Z1sX0WA50VQN

Hi Alex,

On 1/24/24 14:37, Alex Williamson wrote:
> On Wed, 24 Jan 2024 14:14:19 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Alex,
>>
>> On 1/24/24 00:51, Alex Williamson wrote:
>>> On Tue, 23 Jan 2024 19:15:55 +0100
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>  
>>>> aw-bits is a new option that allows to set the bit width of
>>>> the input address range. This value will be used as a default for
>>>> the device config input_range.end. By default it is set to 64 bits
>>>> which is the current value.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> ---
>>>>  include/hw/virtio/virtio-iommu.h | 1 +
>>>>  hw/virtio/virtio-iommu.c         | 4 +++-
>>>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
>>>> index 781ebaea8f..5fbe4677c2 100644
>>>> --- a/include/hw/virtio/virtio-iommu.h
>>>> +++ b/include/hw/virtio/virtio-iommu.h
>>>> @@ -66,6 +66,7 @@ struct VirtIOIOMMU {
>>>>      bool boot_bypass;
>>>>      Notifier machine_done;
>>>>      bool granule_frozen;
>>>> +    uint8_t aw_bits;
>>>>  };
>>>>  
>>>>  #endif
>>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>>>> index ec2ba11d1d..e7f299e0c6 100644
>>>> --- a/hw/virtio/virtio-iommu.c
>>>> +++ b/hw/virtio/virtio-iommu.c
>>>> @@ -1314,7 +1314,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>>>       */
>>>>      s->config.bypass = s->boot_bypass;
>>>>      s->config.page_size_mask = qemu_real_host_page_mask();
>>>> -    s->config.input_range.end = UINT64_MAX;
>>>> +    s->config.input_range.end =
>>>> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;  
>>> What happens when someone sets aw_bits = 1?  There are a whole bunch of
>>> impractical values here ripe for annoying bug reports.  vtd_realize()
>>> returns an Error for any values other than 39 or 48.  We might pick an
>>> arbitrary lower bound (39?) or some other more creative solution here
>>> to avoid those silly issues in our future.  Thanks,  
>> You're right. I can check the input value. This needs to be dependent on
>> the machine though but this should be feasable.
>> Then I would allow 39 and 48 for q35 and 64 only on ARM.
> AFAIK AMD-Vi supports 64-bit address space.  Without querying the host
> there's no way to place an accurate limit below 64-bit.  Thanks,

Hum this means I would need to look at
/sys/class/iommu/<iommu>/amd-iommu/ or /sys/class/iommu/dmar* to
discriminate between AMD IOMMU and INTEL IOMMU physical IOMMU. Would
that be acceptable?

Eric
>
> Alex
>
>>>>      s->config.domain_range.end = UINT32_MAX;
>>>>      s->config.probe_size = VIOMMU_PROBE_SIZE;
>>>>  
>>>> @@ -1525,6 +1526,7 @@ static Property virtio_iommu_properties[] = {
>>>>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>>>>                       TYPE_PCI_BUS, PCIBus *),
>>>>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>>>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>>>>      DEFINE_PROP_END_OF_LIST(),
>>>>  };
>>>>    

