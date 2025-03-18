Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3129575njb;
        Tue, 18 Mar 2025 11:32:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV70otnyDUVGu8BtfI1LzeIdRp3CX+wsJaNZmY5/IGgHUqFmFtR7duULEHbH5PSj9ZGSKcGOshoTet9Rg==@linaro.org
X-Google-Smtp-Source: AGHT+IHg1ZoPLbXAJHu/ic/gWKBewQM1bdOBRs7INabofVumf6zGKUtIbGpfcInXiQglf8v9kAE0
X-Received: by 2002:a05:622a:4185:b0:476:b489:8fa6 with SMTP id d75a77b69052e-47707d6b58emr1011581cf.4.1742322768467;
        Tue, 18 Mar 2025 11:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742322768; cv=none;
        d=google.com; s=arc-20240605;
        b=HcwuQcKd/uXvskjt9PYEbIZEj9QE7z658ZeH3jX3MdjdCAb70LFQSj9jsdJRssh1JL
         PR9Clw3mRajAXJExa4u9o1CEECA8qVsL2oJZdJdL4gPC7KGpSDr8eH7qwtkFYgphZN/c
         eGUtXOZ5YpoIqiSCpnJDtGcce6Cc3j7S2MTV1YkWAVXiT/sorGQrRaGTnNguEMocBJu4
         6a9gWpVgx8l5/mIBbsKZYVN5UhjEAINf7c1OylyTAvNGHmentJ9Urp6EAWcK3wSnZX7e
         /PIzpf2BmSHucsYozrnQYAOxa4nsP8V854t7OQ9HVWZir+jOwjuQsn1uLII4fi2Kvtrv
         j+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=isVT39Tp1plNgJjPWjPIhXflR6POwtIpRciclR11LO4=;
        fh=ZV2Kv0gyg2ovU97ZQCA2SA0mOW4EZyC9s9VWCzMfbfM=;
        b=FNvPuYm+cZJk2OnEg3xjZjhc3AeaazW0y/gx4KYRNax2Zh2AwUs21EOPvJcgPtZryP
         CTXBvM8ZWUeLZftVU9NZyNXBYRhjlCRQGsN8itcxK/SQwt5E5ZFGuVFURPZjBxelp6mF
         dupzNrLV4bvgnc1l+yNZbbSnQ1XFS6r+UNgIuFuDdm94ukmZf6HnMqtyJm9q6hM+ZOKM
         liDpKXuCozSgTKHKTQZDgR1UNgKPv8P88uNJfRRQxYy8B0xsDas10PjQbmoNmeOZe774
         2c1ahR5qKLEbbLWTLE844RrgIArnBjV4Z8dWDasn2EHzs5nQXkZKcYrhRfKyUq6S7fTP
         36zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UrYVQieI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb85f051si118599681cf.603.2025.03.18.11.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 11:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UrYVQieI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tubjo-0007eV-RQ; Tue, 18 Mar 2025 14:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tubjA-0007aW-OY
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 14:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tubj8-0005UH-QS
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 14:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742322703;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isVT39Tp1plNgJjPWjPIhXflR6POwtIpRciclR11LO4=;
 b=UrYVQieIF2sOAyIqdbsZDT0BrW9t+5C7NlPQfcYPHHMOARN893sXBwbYAfybsXR15ZMkaM
 YMKSabsP9l1HG8x46u54/JIWdu7zM0urviTusq0GF7/UogO6Mx0K1chiyyeupV7oS1gnX5
 wj4gnieSJatQxHaBKKyJF7NETcttJ1I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-Ch9EnEUHNnqK7tItUu8NyA-1; Tue, 18 Mar 2025 14:31:42 -0400
X-MC-Unique: Ch9EnEUHNnqK7tItUu8NyA-1
X-Mimecast-MFC-AGG-ID: Ch9EnEUHNnqK7tItUu8NyA_1742322701
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47689dc0f6dso111835741cf.3
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 11:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742322701; x=1742927501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=isVT39Tp1plNgJjPWjPIhXflR6POwtIpRciclR11LO4=;
 b=Fn0eDrveSbpu8DJZrnaD2MUTKGy8IyVS+dEt46Y0TzCta7PG+ayZRr6ZknCLhN/NRX
 fTFs2x0iXUT0NBknE/DO1NXCctNFjt67MV1aOhc9FYypZF0hWuRO2hYP7LGw/Sq7ROmq
 89B2TCgTBGbL2HVnB+CZN7Gtyc0W1A4/84yjNbtauSh69m6pmlW92Bpike5Vz1H2A0qa
 fLCY7js6a/jd6oFaurRH6+4kpNkps4batpG0Ivws0XoEd1y4WDItXIpFf4SjmzQBk+P/
 edzzGKa4V7F8JdwU81lssXNkziR1myGP9GsufRXNx5vgr2Bt4xNvDFCjWzQ2HBQ5VH0A
 DQaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7clyK5qxB3uCtZEJLcj16Rqx8Falja7POx1WY/9/YzbxztbK+1MuTH1vH2Zr8kfC7JmIZ/pbynA==@nongnu.org
X-Gm-Message-State: AOJu0YygW6fDXxbR2FWQK7ttoXEtUZNUuIgOGtwR/oNRHvWjIEWJaW9u
 QctFuOQULiDsFwn88XKfiSYWIavk+EVTQhP0Q1E2wsnQ8MkelGYmAk3mnN2gPXDGJ8qWrTlox+R
 6opq2oMDCs3zTpyXG4bwxhL20J+VMuqm+mieW0Ljs2PaYwWYdKA==
X-Gm-Gg: ASbGnctXyppdUVG9EUzQPYSC7Ku/UZMR4FJhPgjIFuKxDflub2upqmM0N2fZi5oLrls
 JSdmPTjyYESFUh/6AVGKDH2ISnQMoA/aTBHHsA3QMv4z5AscnabTFnTTifkTk+BFbR1D8Aw9sVp
 a7ON0wyn0Ydxzu3KaDYDKY1zS3TAa+8TIYo/sXnBwQTDyTb7pMYgR1HKJNtEMjwBm4QeQS9hsO5
 7OuUJwvc9AvY/ZBORYTbZpXr+LQPZQrq8KBt04XCjeoNBpqiOmz75HShldfBeGFeBlqr3w94IX9
 VNVZYSLGbbGliuZ4Ux0aRLrLSeuBnPJVe1VWtCr+BZxJJouXinxwQ9MzYENmKtc=
X-Received: by 2002:ac8:6f07:0:b0:476:a713:f783 with SMTP id
 d75a77b69052e-4770806a9b6mr529411cf.47.1742322701501; 
 Tue, 18 Mar 2025 11:31:41 -0700 (PDT)
X-Received: by 2002:ac8:6f07:0:b0:476:a713:f783 with SMTP id
 d75a77b69052e-4770806a9b6mr528991cf.47.1742322701146; 
 Tue, 18 Mar 2025 11:31:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4770065d060sm10380231cf.0.2025.03.18.11.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 11:31:40 -0700 (PDT)
Message-ID: <6cb391a4-d150-4692-b62e-a509448a1034@redhat.com>
Date: Tue, 18 Mar 2025 19:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia> <20250317192453.GR9311@nvidia.com>
 <Z9iDxSvZVsgtasGj@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z9iDxSvZVsgtasGj@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CFQD9sCPBdHHWw6aS25CE8U1Nyt6-5ZCH3z9_wReFVU_1742322701
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: atHFLrrtd9Nq

Hi,


On 3/17/25 9:19 PM, Nicolin Chen wrote:
> On Mon, Mar 17, 2025 at 04:24:53PM -0300, Jason Gunthorpe wrote:
>> On Mon, Mar 17, 2025 at 12:10:19PM -0700, Nicolin Chen wrote:
>>> Another question: how does an emulated device work with a vSMMUv3?
>>> I could imagine that all the accel steps would be bypassed since
>>> !sdev->idev. Yet, the emulated iotlb should cache its translation
>>> so we will need to flush the iotlb, which will increase complexity
>>> as the TLBI command dispatching function will need to be aware what
>>> ASID is for emulated device and what is for vfio device..
>> I think you should block it. We already expect different vSMMU's
>> depending on the physical SMMU under the PCI device, it makes sense
>> that a SW VFIO device would have it's own, non-accelerated, vSMMU
>> model in the guest.
> Yea, I agree and it'd be cleaner for an implementation separating
> them.
>
> In my mind, the general idea of "accel=on" is also to keep things
> in a more efficient way: passthrough devices go to HW-accelerated
> vSMMUs (separated PCIE buses), while emulated ones go to a vSMMU-
> bypassed (PCIE0).
Originally a specific SMMU device was needed to opt in for MSI reserved
region ACPI IORT description which are not needed if you don't rely on
S1+S2. However if we don't rely on this trick this was not even needed
with legacy integration
(https://patchwork.kernel.org/project/qemu-devel/cover/20180921081819.9203-1-eric.auger@redhat.com/).

Nevertheless I don't think anything prevents the acceleration granted
device from also working with virtio/vhost devices for instance unless
you unplug the existing infra. The translation and invalidation just
should use different control paths (explicit translation requests,
invalidation notifications towards vhost, ...).

Again, what does legitimate to have different qemu devices for the same
IP? I understand that it simplifies the implementation but I am not sure
this is a good reason. Nevertheless it worth challenging. What is the
plan for intel iommu? Will we have 2 devices, the legacy device and one
for nested?

Thanks

Eric


>
> Though I do see the point from QEMU prospective that user may want
> to start a VM with HW-accelerated vSMMU for one passthrough device
> using a simple setup without caring about the routing via command.
>
> Thanks
> Nicolin
>

