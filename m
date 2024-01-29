Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp197771ejk;
        Mon, 29 Jan 2024 06:08:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENzyua8ZtujBsWTpeekXVB5PkNHJLohBjuiwGELNlG0LzRIEFtteAOrO7KAAa9fNtaAkKK
X-Received: by 2002:a05:6000:512:b0:332:e68b:416c with SMTP id a18-20020a056000051200b00332e68b416cmr3643032wrf.26.1706537301518;
        Mon, 29 Jan 2024 06:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706537301; cv=none;
        d=google.com; s=arc-20160816;
        b=vJMWfvBFKjcpfRvYb6eIt4e2P8uFRPtrg/YNIHqJEYmOq4Z3Gmn5sas9mr6kw7MfLf
         zQEXD5F5WmftUV1Nf5vhMvaUJfvm1en8ZDcv8MSbrBay9WP6vbSVmYuDSvkJhtBMulEK
         J9YfUYgBG0ZQ36TyqE4mBUrbkWX5b8w99zbjbBE2gcGz8BnoTHJeldgReJsvq/AMmZbB
         f2eWJAnbZrGHBV9mnEI3lYbulfc41tcPOw/+yQ2J7S0fdDTvIGJz9QzSI2puVYFXEYCf
         N1CVj7XqQcMKWBM1cUcspu1j78bX5q/2tJHnOP70DteWAnJ+XTvd1EXiPCvsREgepQ7z
         NUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WxuBZdoXUAsXj1GUkHQPVx95bUOL83JGn+VbAMej3Jk=;
        fh=lmEVlNugKYpMmE7ME3x3XcZGnNZ8Ak2prBzg/K3rtvg=;
        b=lNnZnmH3kyubNQmIVz5/d5bNAiNunF13/QMtEtJbnooXi3zAYZJ0lSP75S4F/Ufjcu
         E8KdUVFHCF0XFtUOcakzHSAcZ4WO+4D6OlVrGdrm2zoD22bHxrXpU/8W0TFk+KCbv10G
         IJUXpYf2/1pSUL7YzIaMroHWO0PxvKAr4o1FXME3eRGi3NgCqnmFPUmJ8n2JWcxFGL9E
         DZSro5t678P8xQCj4hvdWJ5IoZEgbGpKsLqDIMiC5AkGAWBwcG4ubf0Eyw1oT7QHSW8M
         JYKY3KMFQIhU8chu3l8FO3/65JmVMRPo9+IUxvnik2Vf3xOlsbly1sCmVwBDIZPXo30Q
         E2FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KscLWs8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020a5d4b0f000000b0033ae4233c2csi2765009wrq.396.2024.01.29.06.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 06:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KscLWs8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUSIn-00042x-Dv; Mon, 29 Jan 2024 09:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rUSIm-00042B-9F
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 09:07:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rUSIf-000085-Sx
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 09:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706537268;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxuBZdoXUAsXj1GUkHQPVx95bUOL83JGn+VbAMej3Jk=;
 b=KscLWs8O28cL7ic0C35P8sZhJHb4qjMYgILGWMnRs6ePYbTbgYTfEpJvKqIQvYTNMc/Ttb
 WMDpHClc6aveMMj5kz2auUdf6In7lJqeuhggxZSy+BEVBXkiMi59gjEce07qhV9iV9SuoX
 /3jcnt3u8GH5gwxrWa1gn1H98VENXr0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-OLPGz2ZwM9GNKg4s4fskrA-1; Mon, 29 Jan 2024 09:07:47 -0500
X-MC-Unique: OLPGz2ZwM9GNKg4s4fskrA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7817253831cso636799385a.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 06:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706537266; x=1707142066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WxuBZdoXUAsXj1GUkHQPVx95bUOL83JGn+VbAMej3Jk=;
 b=JRcTRGs5wl3pCs2NPyC+zny4xUBvl5S9Z54Dpobl3Pd4v6UHiDMcXYx108WriW88QX
 T68taM4Exo2hMsfIBnUz1PI3JtuvWFJ/K9oGqtYbXvehaxflQXU7y2jw+j45VFZlBYat
 2TOD7lt+Fz1LNUd6wOxD3XDU0SpfLZMITkvYjjGH6IwE8n8MCmIN4fJygi7iWXcLOhMN
 +wrFSFTFoQuS3GpvU7F0gWxXHqO4fsGiwmkyGgXJr+L3yITFsVA3x4zCVHP0BijmXMtL
 RyukqYscOkelWh0uop1hZ+4fPmapq1ZRqVlMsS/xhNo0PrdlYJOEZkIo561IIMj9WWEs
 d9rQ==
X-Gm-Message-State: AOJu0YweiwNpKC2rF0T8wy2AGmRFNjCry2TT0ojkH9QYZ8R3O150zchO
 K9a9la5YCdTtg+MPDtbWrBpXO4Hwk5AccvGGNcMWnLpkIbgVtJLp173dhmKPNeW9D4UF5x+Hq7v
 AIzYH2rD++3JCtV2TITihdx/cZviN5QEa9e4pi8ZGS1rHOZuBkA==
X-Received: by 2002:a05:620a:1441:b0:783:ebb7:fa41 with SMTP id
 i1-20020a05620a144100b00783ebb7fa41mr4773713qkl.42.1706537266682; 
 Mon, 29 Jan 2024 06:07:46 -0800 (PST)
X-Received: by 2002:a05:620a:1441:b0:783:ebb7:fa41 with SMTP id
 i1-20020a05620a144100b00783ebb7fa41mr4773698qkl.42.1706537266246; 
 Mon, 29 Jan 2024 06:07:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a29-20020a05620a439d00b0078400fab7a2sm633726qkp.111.2024.01.29.06.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 06:07:45 -0800 (PST)
Message-ID: <670991f9-e483-4acb-9ae9-6bad47b962b1@redhat.com>
Date: Mon, 29 Jan 2024 15:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] VIRTIO-IOMMU: Introduce an aw-bits option
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, peterx@redhat.com, yanghliu@redhat.com,
 mst@redhat.com, clg@redhat.com, jasowang@redhat.com
References: <20240123181753.413961-1-eric.auger@redhat.com>
 <20240129122332.GA909471@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240129122332.GA909471@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.29,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 8npXxOpP4XwF

Hi Jean-Philippe,

On 1/29/24 13:23, Jean-Philippe Brucker wrote:
> Hi Eric,
>
> On Tue, Jan 23, 2024 at 07:15:54PM +0100, Eric Auger wrote:
>> In [1] and [2] we attempted to fix a case where a VFIO-PCI device
>> protected with a virtio-iommu is assigned to an x86 guest. On x86
>> the physical IOMMU may have an address width (gaw) of 39 or 48 bits
>> whereas the virtio-iommu exposes a 64b input address space by default.
>> Hence the guest may try to use the full 64b space and DMA MAP
>> failures may be encountered. To work around this issue we endeavoured
>> to pass usable host IOVA regions (excluding the out of range space) from
>> VFIO to the virtio-iommu device so that the virtio-iommu driver can
>> query those latter during the probe request and let the guest iommu
>> kernel subsystem carve them out.
>>
>> However if there are several devices in the same iommu group,
>> only the reserved regions of the first one are taken into
>> account by the iommu subsystem of the guest. This generally
>> works on baremetal because devices are not going to
>> expose different reserved regions. However in our case, this
>> may prevent from taking into account the host iommu geometry.
>>
>> So the simplest solution to this problem looks to introduce an
>> input address width option, aw-bits, which matches what is
>> done on the intel-iommu. By default, from now on it is set
>> to 39 bits with pc_q35 and 64b with arm virt.
> Doesn't Arm have the same problem?  The TTB0 page tables limit what can be
> mapped to 48-bit, or 52-bit when SMMU_IDR5.VAX==1 and granule is 64kB.
> A Linux host driver could configure smaller VA sizes:
> * SMMUv2 limits the VA to SMMU_IDR2.UBS (upstream bus size) which
>   can go as low as 32-bit (I'm assuming we don't care about 32-bit hosts).
Yes I think we can ignore that use case.
> * SMMUv3 currently limits the VA to CONFIG_ARM64_VA_BITS, which
>   could be as low as 36 bits (but realistically 39, since 36 depends on
>   16kB pages and CONFIG_EXPERT).
Further reading "3.4.1 Input address size and Virtual Address size" ooks
indeed SMMU_IDR5.VAX gives info on the physical SMMU actual
implementation max (which matches intel iommu gaw). I missed that. Now I
am confused about should we limit VAS to 39 to accomodate of the worst
case host SW configuration or shall we use 48 instead? If we set such a
low 39b value, won't it prevent some guests from properly working?
Thanks Eric
>
> But 64-bit definitely can't work for VFIO, and I suppose isn't useful for
> virtual devices, so maybe 39 is also a reasonable default on Arm.
>
> Thanks,
> Jean
>
>> This replaces the
>> previous default value of 64b. So we need to introduce a compat
>> for pc_q35 machines older than 9.0 to behave similarly.

