Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1796289njb;
        Mon, 10 Feb 2025 00:41:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyRmV+s59XAG9ptn44eZyJUq3pA/ffNCz2po4D9e50AVYaeH47ORHCLJ5r1uAF2e/GidPsAalh0B6SZg==@linaro.org
X-Google-Smtp-Source: AGHT+IFyl+G35V+8jOlu2xqRtAax9C5gj2uqGXBKdRJuubtq5RLqB24wXEexz9FnwEwN3wpKlPET
X-Received: by 2002:a05:622a:22a4:b0:467:6b7b:7d0 with SMTP id d75a77b69052e-471679c6af9mr222376331cf.11.1739176878013;
        Mon, 10 Feb 2025 00:41:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739176878; cv=none;
        d=google.com; s=arc-20240605;
        b=LZMNDcDKx1VmtzfjkFIyfvouc8USoDhdsq1F5lIV65964Jolw5UkPxSJD3IT/pugZc
         ITsAzlI2pLpnWp7MMSeJCrfPmwytSeXbZJVnW6el5aSK5e5YvvwMfrz3KWgkv8agrohK
         El7YEfqzXwCCXxX251k/mEH9oSJHzLUVbYJv65P0TG0E9p5iY7G8r/iHm2RFxAMXOaYO
         2W7dHhhoWdatYk8NFaUpohTUH++egDPGoD3wKEbxMZrCZeY1N2pHWbGFjVPW25XKDTNN
         PWyAsAMQcpkm0Jg7vjsL5HxulmQNcTrGSWwKsi2YUv/0mCaAsSTBLRhrvCfZF/SaGP3L
         xruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PZFNEVFDlrWm+u1kbI2WmOD10Sb/Fn/tYL+zwgQm1aE=;
        fh=MNHt+2wXpXBfTS0DMjKhI+XcCZEEt0UzArv2XzFwbEM=;
        b=IjX2W/RCyZ2cab3YqfK5aWxz6gsfWTkhikp2xBGXihBjF632yAkBaBCv1rdzJ5appg
         wnKEWjDSnTtNuIvEA3d7bLQ4EzFsqkAJUBDfGg2hFFTBtabXsdaOpvaLZBpFGU9Jq16M
         YGFTbqrAG2BWyIc3K3YO2tmSGJJY4/pHxgR0Td+FGXnKgcy1oKFpVzo7RZnw8ZSwiesx
         dB9zvLe+C7TJAN2ZxO9gY2h/E+xp+yfCDFX2qvVD63NST3zc9My+CSTd4NjWbEwuzzG4
         m9NREogFkOhv7l5Yt80jhLlT6QxYEfkMhs2/nk4Lj1AGPMijqO0XlECQQQP6sTyHT29x
         1NUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frfjX9ho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4714927c1a7si92690311cf.124.2025.02.10.00.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 00:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frfjX9ho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thPLO-00022P-33; Mon, 10 Feb 2025 03:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPLM-00021O-AK
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 03:40:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPLK-0003YX-M2
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 03:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739176837;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZFNEVFDlrWm+u1kbI2WmOD10Sb/Fn/tYL+zwgQm1aE=;
 b=frfjX9hoHH7QsnbfynrwLmK8SibFgM9EXV+UXXpHbu/PA+/kMHGyYc/V6rCDEe21bp3kv7
 NC62hiSjXjaRydKoho2GJBFXottayW1oz2UhaE8l3+hAhNBDH0nIiiHeppFQGx5Mv4pCk7
 zo/IIoxlnh7LKPLKHDvBMtK6/eDQ5sU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-RljDNqWbPRe6z9JqClx9dQ-1; Mon, 10 Feb 2025 03:40:35 -0500
X-MC-Unique: RljDNqWbPRe6z9JqClx9dQ-1
X-Mimecast-MFC-AGG-ID: RljDNqWbPRe6z9JqClx9dQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38ddee833e0so311481f8f.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 00:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739176834; x=1739781634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PZFNEVFDlrWm+u1kbI2WmOD10Sb/Fn/tYL+zwgQm1aE=;
 b=AsSunjryazG0PYxX7nWv0LDrado9UnXkFf6cwkLuZazcFVCe1ZCy72tuFz4TiEvTmj
 HjBTkAXkLJgHHnEG293f7UIyFMChPcCSPB7o2O+WUHXZpcAVy9ADVJG3xcjn1t+3NzxP
 /IEuuvDNmB9Nb2W83DILMMMsivATHZRRDPnnfbr5JWJ3SPs5ejjyfo/D9me4IpA5mh+Z
 TEyw9eh0oXsHoWr1CpV+f9E166QYkcgEAg0VqqdQVpedlMXCBjP5aaV/kKSciOO3ZNLO
 J5y6y7VAUPXPNi0sIkdJMu7MlxKNDmbN7gk9KRBLH8HyllnubOeui6vzB1A0EQRqJT+V
 a2zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJaiqCRCCUM+ocOdEwT30yhrhSJZdbJj9D/ruBQAyD9Q59h6O76I3MOc/V9/4DifMaV4vtVdQqpw==@nongnu.org
X-Gm-Message-State: AOJu0YymgKNnkx+i1fR6M1GxE5C+u1lXXgRxgdmJhcZYjCYGO0+KlwyJ
 k0JiDmp7SAmoRWIe32l43mno0BB3WauRHE1Jsgynz9NF+F71PS+iOGpnT88jnt9eN3mKapAfYaS
 wYJ5qjEU5DGLrVxm1r6YU18WdRw0gvDBDiokuIww+L0c1b3pKcg==
X-Gm-Gg: ASbGncuRl0bjGFiXNpUg4fmDP7nIY/riVfwNiIfEIJORqw/jB34gTphWEfDLw4xQu+h
 HWoZuOYLyadD6x/QU+qBbhxHHaIRU6fpE6d/xGNtAol801ItOv+EP+gkAgBWpiAxQoZhf6QhUBa
 AA+5dHbkqWtZwpaLgsJIV1kL/FTb0hHaNlQ4KrKoly5eWwVDa76Nc8dDkqXbNygDYNapATEkYDX
 4tk+n8c2yWslJw5VPMegb730QKfhWMrVj5Qobv0yAws8/V3nXiv69trsNmOeCI4VUZURikr5558
 CvJjZEvBx9Oc67BD1x/4vodPVhz7LQLTZWoCSIrmFjTPlDZb5xSv
X-Received: by 2002:a05:6000:402b:b0:38d:afc8:954e with SMTP id
 ffacd0b85a97d-38dbb251e08mr14070528f8f.11.1739176834257; 
 Mon, 10 Feb 2025 00:40:34 -0800 (PST)
X-Received: by 2002:a05:6000:402b:b0:38d:afc8:954e with SMTP id
 ffacd0b85a97d-38dbb251e08mr14070500f8f.11.1739176833855; 
 Mon, 10 Feb 2025 00:40:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43946bff4d4sm14580465e9.3.2025.02.10.00.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:40:33 -0800 (PST)
Message-ID: <4f058421-e0de-4a81-9452-e19684132998@redhat.com>
Date: Mon, 10 Feb 2025 09:40:31 +0100
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
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
 <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: etvnXDq3bWz6pHRZYTQTXdSJsj9AYmNDGyWMpwmeJrY_1739176834
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
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
X-TUID: CDLAmSlW3KXm


Hi Peter,

On 2/7/25 5:58 PM, Peter Maydell wrote:
> On Fri, 7 Feb 2025 at 16:50, Eric Auger <eric.auger@redhat.com> wrote:
>>
>>
>>
>> On 2/7/25 5:37 PM, Peter Maydell wrote:
>>> On Thu, 6 Feb 2025 at 14:23, Eric Auger <eric.auger@redhat.com> wrote:
>>>> Currently the iommu may be reset before the devices
>>>> it protects. For example this happens with virtio-scsi-pci.
>>>> when system_reset is issued from qmp monitor, spurious
>>>> "virtio: zero sized buffers are not allowed" warnings can
>>>> be observed.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> ---
>>>>  hw/arm/smmuv3.c     | 9 +++++----
>>>>  hw/arm/trace-events | 1 +
>>>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>> index c0cf5df0f6..7522c32b24 100644
>>>> --- a/hw/arm/smmuv3.c
>>>> +++ b/hw/arm/smmuv3.c
>>>> @@ -1870,13 +1870,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
>>>>      }
>>>>  }
>>>>
>>>> -static void smmu_reset_hold(Object *obj, ResetType type)
>>>> +static void smmu_reset_exit(Object *obj, ResetType type)
>>>>  {
>>>>      SMMUv3State *s = ARM_SMMUV3(obj);
>>>>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>>>>
>>>> -    if (c->parent_phases.hold) {
>>>> -        c->parent_phases.hold(obj, type);
>>>> +    trace_smmu_reset_exit();
>>>> +    if (c->parent_phases.exit) {
>>>> +        c->parent_phases.exit(obj, type);
>>>>      }
>>> If we need to do something unexpected like reset
>>> register values in the exit phase rather than the
>>> hold phase, it's a good idea to have a comment explaining
>>> why, to avoid somebody coming along afterwards and tidying
>>> it up into the more usual arrangement.
>> sure
>>> If I understand correctly we need to keep the whole IOMMU
>>> config intact until the exit phase? What's the thing the
>>> device behind the IOMMU is trying to do during its reset
>>> that triggers the warning?
>> The virtio-pci-net continues to perform DMA requests and this causes
>> some weird messages such as:
>> "virtio: bogus descriptor or out of resources"
>>
>> Also VFIO devices may continue issuing DMAs causing translation faults
> Hmm, right. I guess this only happens with KVM, or can you
> trigger it in a TCG setup too? Anyway, presumably we can
I have only tested with KVM acceleration for now.
> rely on the devices quiescing all their outstanding DMA
> by the time the hold phase comes along.
>
> (I wonder if we ought to suggest quiescing outstanding
> DMA in the enter phase? But it's probably easier to fix
> the iommus like this series does than try to get every
> dma-capable pci device to do something different.)
at least we can document this, as Peter later suggests. Indeed fixing it
at vIOMMU level looked much easier for me, hoping that no other DMA
capable device would stop DMAs at exit phase

Eric
>
> thanks
> -- PMM
>

