Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1755298eje;
        Tue, 11 Jul 2023 02:56:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHkeiPgnpVXYNv3MPBKwbpNvcayW1Fp4C5VS+U0mST3k31tZ2HRCEaGKBoWedUpU3Cp/iqS
X-Received: by 2002:a05:620a:288d:b0:767:dcd9:c785 with SMTP id j13-20020a05620a288d00b00767dcd9c785mr2981588qkp.66.1689069378043;
        Tue, 11 Jul 2023 02:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689069378; cv=none;
        d=google.com; s=arc-20160816;
        b=gAyDad3DelRNqoZ7duji4S1DEvFA6+YuTrrsM+xP0qJuvepi1Y/IlF1YkYjKo6nyD3
         55M1TEM0Kf/anFvBshsOCGtCgwzQmExXICljzC6r4ocI56pc3O0UKCEU3+k1nK6nzkbj
         QJEy3SEHpFqYLf+eC4jsizVObZPv4Z/jVUIO5BZ1KDdwVumLglomnSN9drENF62Q5TiG
         /27s5yW5m38AvkQ/d5LEoDIVGuWEFCPJHMQ5/DVKJNnbmCO3tEe2PrjvPjfxBta6NE0o
         VBxxrUwadFNt2xSL9QILWx0IAJnNTDpNjgUAY28WpU3o+ohnGGsOBF3YgSwggMV6qlqs
         Y4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=DzsbIMpcdxaHltEiCTHwV8Dsk+inxl58VAQnRcIdVOM=;
        fh=CNxqadBdQ7AopOKrrB+irDTjgvn+kvXDSsrsRMLt2mE=;
        b=Bp1oLiYSF8v6cWDzob7GKYC9mvcqkC2nu6GVCGDYbNj/2w4RaFa4XPdJNJJeyWoyel
         XJT0A0a6FE3DSgP91Odf9OqV7TgWEyYmnL0uAxE3iJNRcIP5VKB03Wvs3Bh9kSfNsOwZ
         V9pdFvFaSds5SNOApOlloYP6K53bPxKvUfIZ5+AD11DODqByQwksKRFHPPB1PB+7DD/o
         e7om8rpOIpKZQrnqbGxrynNSenJRY2KKDHrUhklpW/3ntw9zdUHfw8SuCM7c5I5kRpC3
         NPFylATxviUXMWRY8HqrWDwYiL7JiREtKKEJ9/qrewMOnDeMtFr0ynFRBrG9q5x+DXtl
         paoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pv3Kth82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020a05620a0c4200b00767da14f0cesi647589qki.13.2023.07.11.02.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 02:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pv3Kth82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJA6D-0002Wg-3V; Tue, 11 Jul 2023 05:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJA6A-0002Vt-Su
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 05:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJA68-0006ms-TP
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 05:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689069356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzsbIMpcdxaHltEiCTHwV8Dsk+inxl58VAQnRcIdVOM=;
 b=Pv3Kth82Y6R4lLsWiuR8ClXECM2LxkEwCemnp6sdrsb9cyR14Z/ZrQa+HGx5B9WKaKQ4WA
 fzO+ZUjARYpq2bFurSwY587Tg6npY5luW8rGHlZKEzdfxi7hB3jBC80A8EXZ6lOjGOA1O9
 iRzKiFUkkx2EyRC48aTWqzyB7sbcaYQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-VCLsJTlkOMyBc5o-fy2RrA-1; Tue, 11 Jul 2023 05:55:54 -0400
X-MC-Unique: VCLsJTlkOMyBc5o-fy2RrA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30e6153f0eeso3131861f8f.0
 for <qemu-arm@nongnu.org>; Tue, 11 Jul 2023 02:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689069353; x=1691661353;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DzsbIMpcdxaHltEiCTHwV8Dsk+inxl58VAQnRcIdVOM=;
 b=iiMn1pMCJdBMkE3VFMCrEqOS+2pNVSwdJlV24SdOMMJ3q8Gegfks7ziwY8HuETBp22
 IQMGVDB0S8L/qLel3ZFfS4Q5nj00orF3c9iWqlG8/Q6LeGtlyEkPBh+1kTHS9LX2tJtK
 1CLYBkgGXMKwWOFRmiBXuSQhMJI7N+DLEkUitrQHsWoXnxPtteZ4aMRVVNmC5SksNf6f
 v3Xgu0NIKMAHlXrsAvJcbmZjzpc3sZaBEiOngu9alEJGR2TnMWefg2Ur/tal0hs32c0N
 TrfslJnEwVWogWHjMLOUi//7hmIkbc1uqa5l8I4HB60Im+ARDJErVo0p87ZUcIaiIeLn
 gcXQ==
X-Gm-Message-State: ABy/qLZ1eLAQc0cGVoRcqI02i4m9EwUP5bp4+HLUS3Oa403dd9YSmFMc
 y4HdEwE9sXVpcAQtJB64N7Bap7qdxcUZSs6SNFqlpMv+0oanuFMAHcApCnXR3AF1P2KhaRJB85X
 r4C3mKGcFXrz8oiUmMXei
X-Received: by 2002:a5d:5386:0:b0:314:1e60:a1da with SMTP id
 d6-20020a5d5386000000b003141e60a1damr14435056wrv.30.1689069353703; 
 Tue, 11 Jul 2023 02:55:53 -0700 (PDT)
X-Received: by 2002:a5d:5386:0:b0:314:1e60:a1da with SMTP id
 d6-20020a5d5386000000b003141e60a1damr14435037wrv.30.1689069353386; 
 Tue, 11 Jul 2023 02:55:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d?
 (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de.
 [2003:cb:c745:4000:13ad:ed64:37e6:115d])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d49c1000000b0031444673643sm1785494wrs.57.2023.07.11.02.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 02:55:51 -0700 (PDT)
Message-ID: <b5c777e4-c9a9-00bb-37be-f468a8845348@redhat.com>
Date: Tue, 11 Jul 2023 11:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/7] arm/virt: Use virtio-md-pci (un)plug functions
From: David Hildenbrand <david@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
References: <20230710100714.228867-1-david@redhat.com>
 <20230710100714.228867-4-david@redhat.com>
 <20230710173933-mutt-send-email-mst@kernel.org>
 <b9351bf7-cabd-784c-bebc-a18a9b3f4bc1@redhat.com>
 <20230711044647-mutt-send-email-mst@kernel.org>
 <840d704e-879e-5d13-5bef-038d275e038d@redhat.com>
Organization: Red Hat
In-Reply-To: <840d704e-879e-5d13-5bef-038d275e038d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pSuEsknZjNbo

On 11.07.23 11:22, David Hildenbrand wrote:
> On 11.07.23 10:47, Michael S. Tsirkin wrote:
>> On Tue, Jul 11, 2023 at 10:32:31AM +0200, David Hildenbrand wrote:
>>> On 10.07.23 23:40, Michael S. Tsirkin wrote:
>>>>> @@ -2855,12 +2796,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>>>>                                          SYS_BUS_DEVICE(dev));
>>>>>             }
>>>>>         }
>>>>> +
>>>>>         if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>>>>             virt_memory_plug(hotplug_dev, dev, errp);
>>>>> -    }
>>>>> -
>>>>> -    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>>>>> -        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
>>>>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>>>> +        virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>>>>>         }
>>>>>         if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>>>>
>>>>
>>>> How is this supposed to link if virtio-md is disabled at compile time?
>>>>
>>>
>>> Good point.
>>>
>>> The old code unconditionally enabled MEM_DEVICE, so we never required subs
>>> for that.
>>>
>>> We either need stubs or have to wrap this in #ifdef.
>>>
>>> Stubs sound cleaner.
>>
>> That is what we usually do, yes.
>>
> 
> I'm testing with the following:
> 
> 
> diff --git a/stubs/meson.build b/stubs/meson.build
> index a56645e2f7..160154912c 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -65,3 +65,4 @@ else
>    endif
>    stub_ss.add(files('semihost-all.c'))
>    stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
> +stub_ss.add(when: 'CONFIG_VIRTIO_MD', if_false: files('virtio_md_pci.c'))

Needs to be

diff --git a/stubs/meson.build b/stubs/meson.build
index a56645e2f7..f16a365731 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -60,6 +60,7 @@ if have_system
    stub_ss.add(files('semihost.c'))
    stub_ss.add(files('usb-dev-stub.c'))
    stub_ss.add(files('xen-hw-stub.c'))
+  stub_ss.add(files('virtio_md_pci.c'))
  else
    stub_ss.add(files('qdev.c'))
  endif


Otherwise it still fails when building for multiple targets.

-- 
Cheers,

David / dhildenb

