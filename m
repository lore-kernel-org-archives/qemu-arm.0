Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp897134njb;
        Wed, 27 Nov 2024 08:06:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkIZxNbPlzn7mR3al4jrwtRlX76wLFFFSInkAgjNL1cZtw+2PEPEJpBxRiOmjmOFmyJVdfZ7exdaEebg==@linaro.org
X-Google-Smtp-Source: AGHT+IFIHEzQs5raeqrhmWBaYKxh0iH42BFj+TxsFVpPGdk7n4CFsSpDZ7BPIgc4luJBWbweNZ+X
X-Received: by 2002:a05:6358:5289:b0:1ca:89a9:9c5 with SMTP id e5c5f4694b2df-1cab15d0aeamr273865455d.7.1732723606572;
        Wed, 27 Nov 2024 08:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732723606; cv=none;
        d=google.com; s=arc-20240605;
        b=k5Wr8XnRj9ZYYm2AODRS1fdMIOYZs6fUbhpviukhw6wkKSD0pg104x3Cu2FtdhFaF0
         2xZXdT47LDsdZFA3dVYJmaAedXe8+b9kX07TlLdNd7ap9+icBOBULTsbflSgup2aCly3
         PK3HU3vbSfa2zhxWJ9vE3H5vbZNOA7J2jb4kMlL/x9CIdRQZH+owp6yh4BjOR/YTpmwV
         pf+iMh9Giv8Ihdra4iqUo4mBU2KWAQdJ/SmkvzG36to5z1HWqpEfZvPe+V9kQpqtDBb7
         PPR5fLGq0Q8quzbKWLxS3QFwo7yi9BRcy0cK90wzBe9erQS4Qv7UYIfd1JaOl1evjiIt
         rA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W1rm5q7Jhe5OX3T1GOSaNBMS2MXoyvUvbnryuxez01A=;
        fh=qGWq1jByffF9SmK78BXUNpusoIRjrc4rqEdQjUgUq5k=;
        b=a07NwjYAhuPnv7KTa3/c273ffFHFNYSA0jDsRUNFCI+grsCxywd3YrpTpAqUdaKUWR
         0QXj0Rcecw0lmGR8uUKN25xxr5yv7YyKLJS+cy3A7sYaXhaG5DvUpBn+xBZZoMLYhp9g
         tEg5YmybXizuM2mVAbi0IicZfNotEe3+WQWnj7rNnXgyzqCqLy1k6TFMVcp+hbxPZjyb
         Rpdp4a4V6TEV5rmpeGtPSrJhSLeNCyCe+UaXg0eDVLv8GFmRNKZi3gxa8g8p+J8Zr0j6
         ttw/B4LzVKeNgIFudAdsRVQkwBJ2UPypS3TtbE1dPnSTCdkWEuOYtAJPZp9h2nLdon2Y
         qTHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kek1hnds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85b4e845a0csi1768197241.81.2024.11.27.08.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 08:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kek1hnds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGKYX-00005e-It; Wed, 27 Nov 2024 11:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tGKYR-0008WD-Hk
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 11:06:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tGKYN-0003iT-Lc
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 11:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732723567;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1rm5q7Jhe5OX3T1GOSaNBMS2MXoyvUvbnryuxez01A=;
 b=Kek1hndsYRSxvJ174RHg2Vcm/JdL32eANlyXMNdXp52J+KgV2hPTBMw3oWCc6nZvbktkjs
 Jgs3BEBGTLfhCrO0QogjlkPOp3AjiDDmoGnMeYfCB98dUE6kDxatUfAd3aNRsgUdJyKkF2
 eC66QEqU8r/r4nMhkxFgFcj29v4J9Ro=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-9JeLvY60PeqC8PXD43ADJw-1; Wed, 27 Nov 2024 11:06:06 -0500
X-MC-Unique: 9JeLvY60PeqC8PXD43ADJw-1
X-Mimecast-MFC-AGG-ID: 9JeLvY60PeqC8PXD43ADJw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43499388faaso30573345e9.3
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 08:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732723565; x=1733328365;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1rm5q7Jhe5OX3T1GOSaNBMS2MXoyvUvbnryuxez01A=;
 b=DUFe9dkioGpUuDtiqOB/+iCDrZgyleT8kJzxHwrvik/e4Rb4ChIylGEuYfu3uHhuXj
 rPHIrQKfEbHooOgvwBaWX/w1ospPCWF2dtVcDiauqZeP6JiuBmhIpIUokl2A1oqtsanO
 aNbIoG4BziNj0/Wl8m7UKPOAhgvj20CnfmLwKENHaigZwH+Ix6yB5bHb2N4Mmcm/ZXqB
 viK06eDqTpG61GI3hXRJGMJxI1XDhfPOt2FxhDPZqyhIUgH/D+iDdP1Z63cTRa2XHv+N
 AqlHOpSYGjlclEfdqiA6IOjRKG9u+s5PtG/YdBqqyKurl1GZeVwlFqXPv/kBDM2NIy+B
 K5JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlKRrlARh0JNPZiYZSVfRthwDWn+yOtfGRVzTSZ34gwVy5nGbJYW3Aouy1Q/hC/v8Pe/PCnVjNAg==@nongnu.org
X-Gm-Message-State: AOJu0YzuaBzic3G44UuiXMz2BJJkedBne8YmDiY5UTJB/s20zacGp4Fj
 6TneAyhEM/Q8pJI3OhAb7NbNBTbcb1LyBg0XtFMcjFdZHpVFFiKlDADrJZB+ppZODyNlIVopZLZ
 pCjJB3vFcq3nB5kRXlSiA356iKgz9vUUCGVIFTk8RFAvYHyLBeQ==
X-Gm-Gg: ASbGncs1grY4TMf1Nb7M0NmLEnKM354Ec+4JVRauHFbL2dZ3ZGiJdF6yK26MYVrEz7B
 96rMkny+l3VvtQJSzrYVux9HXv6gom6MNdpXXSr6R+bMN7f0su7tRpcvtxIdaQLk7xhAIKGr3c6
 x3GIaubGnr+zbDnUCdhyveJkVK8wndo/DSkv+Hqxg0bgDyrLoj85hCf8+SlDqn6yDevgUcjEHoD
 uS2VO7BuTxY05NihkZnh1Qd8NKui8wEGpWJBr8BDW+eRRgfDCLNQhclMDaX0VKVdzTFvtTlbgPZ
 y51qF9dCaHRQPI1x65iL2g==
X-Received: by 2002:a05:6000:4007:b0:37d:50e1:b3d3 with SMTP id
 ffacd0b85a97d-385c6ebb9bamr3328793f8f.20.1732723564068; 
 Wed, 27 Nov 2024 08:06:04 -0800 (PST)
X-Received: by 2002:a05:6000:4007:b0:37d:50e1:b3d3 with SMTP id
 ffacd0b85a97d-385c6ebb9bamr3328554f8f.20.1732723562110; 
 Wed, 27 Nov 2024 08:06:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad60c3sm17099524f8f.2.2024.11.27.08.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 08:06:01 -0800 (PST)
Message-ID: <bd4c4665-148c-427b-8717-457c584fb233@redhat.com>
Date: Wed, 27 Nov 2024 17:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
To: Jason Gunthorpe <jgg@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Donald Dutile <ddutile@redhat.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
 <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
 <d8fbaa677771425dac985438b4b1db59@huawei.com>
 <20241127160031.GA1253388@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20241127160031.GA1253388@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d-fMtpLlTClZkTNxffV0M5XnyzctWTsa8NH_cSdF36g_1732723565
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.931,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 0EIn18zViQ0/



On 11/27/24 17:00, Jason Gunthorpe wrote:
> On Wed, Nov 27, 2024 at 10:21:24AM +0000, Shameerali Kolothum Thodi wrote:
>>> For SMMUv3, NVIDIA-specific vCMDQ, it needs a parameter to state that
>>> specifically,
>>> since I'm concluding from reading the SMMUv3 version G.a spec, that
>>> ECMDQ was added
>>> to be able to assign an ECMDQ to a VM,
>> Not sure the intention of ECMDQ as per that specification is to assign
>> it to a VM. I think the main idea behind it is to have one Command Queue 
>> per host CPU to eliminate lock contention while submitting commands
>> to SMMU.
> Right
>
>> AFAIK it is not safe to assign one of the ECMDQ to guest yet. I think there is no
>> way you can associate a VMID with ECMDQ. So there is no plan to
>> support ARM ECMDQ now.
> Yep
>
>> NVIDIA VCMDQ is a completely vendor specific one. Perhaps ARM may come
>> up with an assignable CMDQ in future though.
> Yes, it is easy to imagine an ECMDQ extension that provides the same HW
> features that VCMDQ has in future. I hope ARM will develop one.
>
>>> ... and all needs to be per-instance ....
>>> ... libvirt  (or any other VMM orchestrator) will need to determine
>>> compatibility for
>>>      live migration. e.g., can one live migrate an accel=nv-vcmdq-based VM to
>>> a host with
>>>      accel=ecmdq support?  only nv-vcmdq?  what if there are version diffs of
>>> nv-vcmdq over time?
>>>      -- apologies, but I don't know the minute details of nv-vcmdq to
>>> determine if that's unlikely or not.
>> Yes. This require more thought. But our first aim is get the basic smmuv3-accel
>> support.
> Yeah, there is no live migration support yet in the SMMU qmeu driver,
> AFAIK?
the non accelerated SMMU QEMU device does support migration.

Eric
>
> When it gets done the supported options will have to be considered
>
> Jason
>

