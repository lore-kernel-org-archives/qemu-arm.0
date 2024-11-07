Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4540312njc;
        Thu, 7 Nov 2024 14:12:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnw+OEeEKvGdxP8H2g61iz+4AdrQk/2VnhopvKIz4ieRWJW3FDCQQpN5cDQX7uVAyZINDMRFG6ta5Yxg==@linaro.org
X-Google-Smtp-Source: AGHT+IHyQmyIHrqEO7stAHPIz5gpgL/pDt7WP0IXTqjMBkNHLKeKYX647ABETC6Va0QS4YBNiLPR
X-Received: by 2002:a05:6214:4697:b0:6cb:d538:cc48 with SMTP id 6a1803df08f44-6d39e141f9bmr8368786d6.22.1731017547506;
        Thu, 07 Nov 2024 14:12:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731017547; cv=none;
        d=google.com; s=arc-20240605;
        b=f6LFeG4smXI3UjVGXnshv7DyD5VIQ+o/q+Olz5r/5/ycWHFn9SCle26X6tsrjjJa52
         5JwVKbfWFf7fQd8AUChjsab0OyXqnY4jOpK5SRjxuZX1T+aYsNoHjA6qOxcOoZwbeGw8
         kpyuIASPsGyeoRTN6Re/JjSJ6KSako8xkryZeBRmTBpyQjNRQDO4UGTCzN065AsrLBWI
         n9Xyf/jHyg9FzHEuS4ssw8x5ukmUa2aq/t83dZQjioxkzDyMcMPJuXK7blnbUMWTML10
         pWTt71ZKGG/gpyeeXZuIpNWIvpbbAvNjV0DmXXsi4sfcC2kgCiDKowWtq5iUotYVwxsn
         5Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MLj/r2S6FL5GjaiB48pVfo7q+aIuXmWCPCeY3VuXw6A=;
        fh=MXa/AEz2ye0dx0u3Z5nWiQ5VIerUw8Er0QVMyaNabuQ=;
        b=TL+0LK8Zis0jMtQgShPnJVlhZkG3I5R51mcnqpVReCHVbBl00k2GVgReineWLazXyr
         2NTDQEqWZGES3+kfLhEefEi73OLDPduMoYbvvcT/qmUquln+mFszWujdKx3V4r45S9KE
         6gnINWXNfqM4UJjh//EB5OO6oz5PCJ+jFXjFVpmsAAqMQ3XlL94vD/DDd/egY7FR6CIM
         BNkEg2oElyoP037mKEex/v3XjAS0+PMG2+d5cNsDlXaWclCFlT9DpJACi7VJFrmZdlem
         jWUMC+91oZHpidsqZ6Fugi/q8ePR0v2EIl2AN/XVK679s5Zj8RiVvc+RUemaXLnZPOEG
         JzWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dN0Nrq4o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad398a4si257800485a.681.2024.11.07.14.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2024 14:12:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dN0Nrq4o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9Ajc-0003lx-US; Thu, 07 Nov 2024 17:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1t9Aja-0003lj-Ae
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 17:12:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1t9AjX-0005Xk-BP
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 17:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731017522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLj/r2S6FL5GjaiB48pVfo7q+aIuXmWCPCeY3VuXw6A=;
 b=dN0Nrq4oQ1nqRpnIDjdQkUQ3h6XNfhwiD1EDHr1mkKCHReOYjzNBbMx8b0npBMqn38NGiU
 MN4h/FQxZ3QI7DgTR/JTCvI5b6tFBTVg1bMAAy7gMoMp80NMbEGu556LkecznavLpZm95w
 uaoQ/ZTvFD2vLhRfjFFpJcS8FEMzvqA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-JlSMUmM_MDqQQq8SpuGbEg-1; Thu, 07 Nov 2024 17:10:33 -0500
X-MC-Unique: JlSMUmM_MDqQQq8SpuGbEg-1
X-Mimecast-MFC-AGG-ID: JlSMUmM_MDqQQq8SpuGbEg
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-7092f2d50ceso1678478a34.2
 for <qemu-arm@nongnu.org>; Thu, 07 Nov 2024 14:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731017433; x=1731622233;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MLj/r2S6FL5GjaiB48pVfo7q+aIuXmWCPCeY3VuXw6A=;
 b=XUavlht9sa9ZmGpG/Sl8Sd8IljAf5KgvmnoLdWobRktQbdjGrXtFe4exv+Y13UcYe+
 4m5yKhRvggyfIuot1mqGLlAqgrJJFfV3mDwOtVXTE9T1K0xcQTzpjI+Ug/KAMZW/GELo
 yLnt1RGGRIZLqWop8VMTqU3BZu/vH4EmJq5qaW8Yh0pGIPL1VvTE5cBLIv0uc6wPXncb
 1pD7+lDo5ZCcjTm1IiZAxN4Xe/9LN5UZvhjhEnmkjP9kGchq+86Ew1Ku+yhkielkKV/d
 oEQC9H9pBWwggktH7m+zMQXrUQAr3quZ0XHMftZ9I4QyQ/G21jXSkQO0EI4pLJn+jhV0
 D/wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCMtyjx1XBuqOU2G9nJWTq9+QK8KnLjcxXeVtODG+prjVqe0I0LC5RyBgPBW9AgFb+j71LrdlJsA==@nongnu.org
X-Gm-Message-State: AOJu0Yw8dO5a+60waKx82AluDO012jfVNGS761kKt2kJ0eJdobabt16S
 PLKaF0tFK4ffBGeWAn7F6onn43NxlByMx60fSGf0P99IyHO0Sgrpbpis/v2BZMGee4pwGiSkeg9
 nwR9+4VHakD4v9CkNKI3+z08Z5es5lS/Ratj+RFV8WrbnJV4yIQ==
X-Received: by 2002:a05:6830:d8a:b0:717:ffa8:2481 with SMTP id
 46e09a7af769-71a1c1de35emr869932a34.3.1731017433006; 
 Thu, 07 Nov 2024 14:10:33 -0800 (PST)
X-Received: by 2002:a05:6830:d8a:b0:717:ffa8:2481 with SMTP id
 46e09a7af769-71a1c1de35emr869894a34.3.1731017432710; 
 Thu, 07 Nov 2024 14:10:32 -0800 (PST)
Received: from [192.168.40.163] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-462ff57e913sm12412771cf.70.2024.11.07.14.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 14:10:32 -0800 (PST)
Message-ID: <d54115c8-f359-42c1-b402-b3d82064434a@redhat.com>
Date: Thu, 7 Nov 2024 17:10:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
To: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>,
 Andrea Bolognani <abologna@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>, nathanc@nvidia.com,
 arighi@nvidia.com, ianm@nvidia.com, jan@nvidia.com, mochs@nvidia.com
References: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
 <1845a6b8-5214-4379-85f4-3d36b61059dd@redhat.com>
 <Zy0jiPItu8A3wNTL@Asurada-Nvidia>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <Zy0jiPItu8A3wNTL@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jJAvf9qx2bPl_j-nOnDDUxoVNxMyxMW3XkSBqgWowws_1731017433
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 52hlj/wTjW5e



On 11/7/24 3:31 PM, Nicolin Chen wrote:
> Hi Eric,
> 
> On Thu, Nov 07, 2024 at 12:11:05PM +0100, Eric Auger wrote:
>> On 11/1/24 05:09, Nicolin Chen wrote:
>>> Hi,
>>>
>>> This is a continued discussion following previous month's:
>>> https://lore.kernel.org/qemu-devel/Zvr%2Fbf7KgLN1cjOl@Asurada-Nvidia/
>>>
>>> Kernel changes are getting closer to merge, as Jason's planning to
>>> take vIOMMU series and smmuv3_nesting series into the iommufd tree:
>>> https://lore.kernel.org/all/cover.1730313494.git.nicolinc@nvidia.com/
>>> https://lore.kernel.org/all/cover.1730313494.git.nicolinc@nvidia.com/
>>> https://lore.kernel.org/all/0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com/
>>>
>>> So, I think it's probably a good time to align with each others and
>>> talk about kicking off some QEMU upstream work in the month ahead.
>>>
>>> @Shameer,
>>> Do you have some update on the pluggable smmuv3 module?
>>>
>>> Updates on my side:
>>> 1) I have kept uAPI updated to the latest version and verified too.
>>>     There should be some polishing changes depending on how the basic
>>>     nesting infrastructure would look like from Intel/Duan's work.
>>> 2) I got some help from NVIDIA folks for the libvirt task. And they
>>>     have done some drafting and are now verifying the PCI topology
>>>     with "iommu=none".
>>>
>>> Once the pluggable smmuv3 module is ready to test, we will make some
>>> change to libvirt for that and drop the auto-assigning patches from
>>> the VIRT code, so as to converge for a libvirt+QEMU test.
>>>
>>> FWIW, Robin requested a different solution for MSI mapping [1], v.s.
>>> the RMR one that we have been using since Eric's work. I drafted a
>>> few VFIO/IOMMUFD patches for that, yet paused for getting the vIOMMU
>>> series merged to this kernel cycle. I plan to continue in Nov/Dec.
>>> So, for the near term we will continue with the RMR solution, until
>>> we have something solid later.
>>>
>>> [1] https://lore.kernel.org/linux-iommu/ZrVN05VylFq8lK4q@Asurada-Nvidia/
>>
>> At Red Hat we may find some cycles to resume working on the QEMU
>> integration. Please can you sketch some tasks we could carry out in
>> coordination with you and Shameer? Adding Don in the loop.
> 
> That is great!
> 
> So, given that Shameer is working on pluggable module part and we
> have folks working on libvirt. I think the only big thing here is
> the SMMUv3 series itself. Please refer to the changes in the link:
>   - cover-letter: Add HW accelerated nesting support for arm SMMUv3
>   - https://github.com/nicolinc/qemu/commits/wip/for_smmuv3_nesting-v4/
> 
> I expect the IOMMU_HWPT_ALLOC (backend APIs) will go with Intel's
> series once their current "emulated devices" one gets merged. And
> I think I can prepare IOMMU_VIOMMU_ALLOC patches for backend APIs
> aligning with HWPT's.
> 
> That being said, one thing I am not sure is how we should bridge
> between these backend APIs and a virtual IOMMUs (vSMMU/intel). I
> think it'd be better for you and Red Hat to provide some insight,
> if calling the backend APIs directly from a viommu module isn't a
> preferable way.
> 
> We also need your comments on vSMMU module patches that are still
> roughly a draft requiring a rework at some small details I think.
> So, if your (and Don's) bandwidth allows, perhaps you could take
> over the vSMMU patches? Otherwise, we can also share the task for
> reworking.
> 
> Thanks!
> Nicolin
> 
Nicolin,
Hi!
Sounds like a plan.  Glad to join the effort.
- Don

