Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp327153njb;
        Fri, 7 Feb 2025 08:51:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVf9ZADgqyFIH3aa1o3fHwjmIq974pP20BNSQvIg4+VFuSoi73BoD7gO5JcNz5LWsHOS0JxGGMfpRPGTw==@linaro.org
X-Google-Smtp-Source: AGHT+IFp0rVm3cu4h+B4T4ha2/y/OyyGBYtS2qYAoOemPF1OP3aaWIJ+altflh9b9zZ1KSCbKQ1i
X-Received: by 2002:a05:620a:2b99:b0:7a9:bd5b:eb61 with SMTP id af79cd13be357-7c047bc70d8mr637123485a.27.1738947066728;
        Fri, 07 Feb 2025 08:51:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738947066; cv=none;
        d=google.com; s=arc-20240605;
        b=k0x4OpAuu7QPiccN7eWji+Jip5h0B1qrviBK3FEXJ+XHxUmO9N2j48CtB1TlQdYfve
         CIs+0m2ULGFvM8kgMuLMwD47tVcmJEyWQ/HJeHovz1d3PXH6AK6Z71ry+9bq4YKaRl2x
         oJcSkPI9w5j/O3+befAGf3CN/46ml9pHAiRE1RuZumw5WcPcABxlFvlmcV3vvCfB+AvT
         IaFBLN5/B3iy7HJelhMb6mGo1Dlf1ghJ1vvM590JpSzRnawG9k7FYh8QZhSsj+drqW4g
         T23we6V2d+DbU/35M1PaSVdiY7EWzCvRyHV8ZBWPrDwe0/WczC8Hf4+W6TQb5j9E88xu
         Ikbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kJF17qzTWI8+1y8sNpI/aLlEcWQYEquLiTZ6doqt0p0=;
        fh=b2lhGh6lY/ecHbrat6MjF5jmESDKJ14/HCP3OVFEexA=;
        b=FpS4ouKwUbC85x2ZXaOWD9iQaT06YLBAyLRWoXFi3rXUEV3b6u2JGs1JXhWjCktEY4
         yLe71gZb5MaLBsjWvrhnj9MP3YqWPcsrCsfPffWLnJcSti8lEEOSfa9HvQsYYgYLhgs5
         0z7DuCXd9qoQT2v1gKbwBDiXlzjDugQPJ3hIw1IR2iYh+2KL3dTYlL4oRDWf65AQ0z8v
         SgXpQE6K0QiZTiCNdUGI7OMO2JTRbf9/Uu4+S4/7RJNpbBFiwerSALnZjDGt3fe2sCLp
         VvfhU/aAkKL5+YVyQDNGY73gbe7zYbfZuWXSC/LLEiWfpUAoIdJDcPF6W77elyxtc6Qp
         t9dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eDgNMVC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041eb5162si379652485a.392.2025.02.07.08.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 08:51:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eDgNMVC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgRZ1-000758-20; Fri, 07 Feb 2025 11:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tgRYv-00074a-Dc
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tgRYt-00039W-NV
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738947039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJF17qzTWI8+1y8sNpI/aLlEcWQYEquLiTZ6doqt0p0=;
 b=eDgNMVC9rBY7qtX3QYYqGFTejNLSzOzId8+CqPQP/gSEeN1Gh8YrZv0/ok203zE0fB06H7
 k54n4vji9urYjj78ztV+oQRRCdUgcL9GsXpVnAPWSVbfswZQfJwE6+SoxzYlIbSqztS2V1
 JlWaR1rkkTvQqdJAtEcaLBY7taiQyQg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-Ry5f_cOGOtqP6OcyZwdj4w-1; Fri, 07 Feb 2025 11:50:34 -0500
X-MC-Unique: Ry5f_cOGOtqP6OcyZwdj4w-1
X-Mimecast-MFC-AGG-ID: Ry5f_cOGOtqP6OcyZwdj4w
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43631d8d9c7so12131335e9.1
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 08:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738947033; x=1739551833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kJF17qzTWI8+1y8sNpI/aLlEcWQYEquLiTZ6doqt0p0=;
 b=g0OI5FRtmhtZcLLS17q8cl/owB8U6eYC6ux8M7McQP0wxVwPLi3WusmzR9UZsScdej
 cpuC89VROQs8LuL/wllQIU1h1uM8SF9PRNphANQyYpAMFOwOSP5ElwYrCuRSGFh9IViv
 4AErsW5g2DaQwq748Pg8j+1ciH2bRACeSY+QIuU/jTuFiMj3UyyqzMi2BxzH/n5bVsqN
 cznkbwG1QGW8KytuiZ7MtFdKBA8VG+XdzFtS3CZ3CQ7EyIgLEVt1uH4pQCH5kgGVJfJO
 LD90gx6d1/mOBqp2EzRqobv09OSeIS8AS7sg+/7/8H+Iemn5++dQ0dB6F3SWN3anjlN/
 13MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+ddgdQsf+FXQqMaVtNQ/RGX+A8Xq1q3oPxARBF5tcODvwQs2s/NITFecEMwqqNOSnDrlMNElngw==@nongnu.org
X-Gm-Message-State: AOJu0YxdcXOY0ufLH2g9+shasfNQdx6hGhGpzGX0ilfog6hxT3BBWdmU
 p8NPzsgFfhVxUxp0smo9H3H0oPfJxq4kLrgizPlDQLDCxLYRXHsXSkuJPjf9kAOEkkI/E5mQjsR
 5gE4logUfmQ16UfYlPqH9cklb0XxL2oiz1UMu+fRSJeexEXVBSw==
X-Gm-Gg: ASbGncvdeQXhnT/TBrWAh8oVEWd0XTJzEETkRU59A3RlPCPoSIiLDewtK5lDQa2SjKG
 I1FVLjHPyL8GuIyBOSn50gj0BF2b306hh8T7LuR5/Ekj/D+UtgbbfC/wXilyknPgXz6tmyeKlgG
 qx4+jqAIDLCdQr3tgRlg2CwavOqgfO3Su3AKJqYJyzVZLsdn/1lL9UFuHJmx8zlm8c2P4sjQ+H/
 Mk6nquag1Q/AQYen2gi/WGcOSA6jPs+/0+5Dnfw2jFD62ymrjsYvnMaVRMsoaxutD4KFMnsx+Up
 bEJPR3d3e7h9/VFW74nijJQ7/k/V2G2aAxy8StgZpa/+LqP7NLCg
X-Received: by 2002:a05:600c:198a:b0:436:1af3:5b13 with SMTP id
 5b1f17b1804b1-43912d49c3amr67542475e9.15.1738947033634; 
 Fri, 07 Feb 2025 08:50:33 -0800 (PST)
X-Received: by 2002:a05:600c:198a:b0:436:1af3:5b13 with SMTP id
 5b1f17b1804b1-43912d49c3amr67542265e9.15.1738947033275; 
 Fri, 07 Feb 2025 08:50:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d966faasm95958615e9.23.2025.02.07.08.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 08:50:32 -0800 (PST)
Message-ID: <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
Date: Fri, 7 Feb 2025 17:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yDz5LgdpxDZWI7QQM0SnQtfbWI4uYp3f6ZdWJTS3ZG4_1738947034
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: oybI/ci0IVuI




On 2/7/25 5:37 PM, Peter Maydell wrote:
> On Thu, 6 Feb 2025 at 14:23, Eric Auger <eric.auger@redhat.com> wrote:
>> Currently the iommu may be reset before the devices
>> it protects. For example this happens with virtio-scsi-pci.
>> when system_reset is issued from qmp monitor, spurious
>> "virtio: zero sized buffers are not allowed" warnings can
>> be observed.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3.c     | 9 +++++----
>>  hw/arm/trace-events | 1 +
>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index c0cf5df0f6..7522c32b24 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -1870,13 +1870,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
>>      }
>>  }
>>
>> -static void smmu_reset_hold(Object *obj, ResetType type)
>> +static void smmu_reset_exit(Object *obj, ResetType type)
>>  {
>>      SMMUv3State *s = ARM_SMMUV3(obj);
>>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>>
>> -    if (c->parent_phases.hold) {
>> -        c->parent_phases.hold(obj, type);
>> +    trace_smmu_reset_exit();
>> +    if (c->parent_phases.exit) {
>> +        c->parent_phases.exit(obj, type);
>>      }
> If we need to do something unexpected like reset
> register values in the exit phase rather than the
> hold phase, it's a good idea to have a comment explaining
> why, to avoid somebody coming along afterwards and tidying
> it up into the more usual arrangement.
sure
>
> If I understand correctly we need to keep the whole IOMMU
> config intact until the exit phase? What's the thing the
> device behind the IOMMU is trying to do during its reset
> that triggers the warning?
The virtio-pci-net continues to perform DMA requests and this causes
some weird messages such as:
"virtio: bogus descriptor or out of resources"

Also VFIO devices may continue issuing DMAs causing translation faults

Thanks

Eric

>
> thanks
> -- PMM
>

