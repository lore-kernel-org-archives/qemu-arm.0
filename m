Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp386856njc;
        Wed, 19 Mar 2025 10:02:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVivmRXIUHnvYvsIaST3bkOAHjD2Ft5AaL0rxZfT99HJagflE1zYZ9JJaMGDsgs0q4lj3qrk8x7gahCng==@linaro.org
X-Google-Smtp-Source: AGHT+IH0cyhP3azbWfmbax5MMJ3ZjeRXirADZEQB72dvYSWdw1VWNIHmS2rLFjjWzLEEzb72C+BR
X-Received: by 2002:a05:620a:4153:b0:7c5:47c6:b87f with SMTP id af79cd13be357-7c5a83d4053mr364601985a.19.1742403724861;
        Wed, 19 Mar 2025 10:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742403724; cv=none;
        d=google.com; s=arc-20240605;
        b=fzKPQ+WInn6giArF/xZFymrbtYG3M6umDGtqD0vQCiqZoGLTOr7N+yDfqHdisv1w71
         4XWxxXu/c4i/QcMEbx/+H15IWeLTC231Yl6qwQnMqw7b8IjL4Do54jIwZAleUFHFZqjE
         ufVw64GaRU4EhjD/Cfvd1vVG11cqB5jb/434u/6GxuFDVxbB7OX4YEpi3DPJMnkXrGYG
         mvv2RI2psS/4ACAE0yZCeUjNbEnwjrDyyda29P7nFXi2fkDG/tiLm/LW0yaCZII6HuwV
         S864KnXCmaC69Dp+ZVv8xVLKrA2w38ViwW7+ubZn+C4pUNYmR2b+c8x51c2bjnvwinjX
         O3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=egPJf6wKxHWczXc1lB/aGNuFGvu+4Swpt75RU6whBHA=;
        fh=Ix2xi+BhO/n94oHm2JlweCZPOktuGP3yKSX/icPZFto=;
        b=MBiVp7xwFLLa6ra7Rm+1UdanMDWYayvG/Hg9aUbgtdR/KHCS6746dKieWQeNB4d8gL
         hxImCNpqXiM1GOY+g+FzE93gCdoEMhRjSmm4PF57mwt9zk7uhSPEUmqxsf0HsyCWAiI2
         yQHwoULV8SpNSTEHkE7h54PQ0Z/Y02oNJxK3FdiIQwCmqMfCXaMhA1maXOHAvy+JARDT
         luRVdC1KCILIhkFJAdezQhGhJH6Vx5h6n1/QBTYkUjgAq4iJgfkVJtSM6FnfB+55PjUq
         A8mcmJBbuRSn9lZ+B78BU+BbQWEgPCungYjQSMa01jbhCshpLg9pEG48QJj0T6pTa+oT
         qhpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dHGONawO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573cb31e2si1398701985a.221.2025.03.19.10.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 10:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dHGONawO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuwnX-0004Ji-0a; Wed, 19 Mar 2025 13:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuwmz-0004Al-9K
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuwmt-00072d-Bu
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742403661;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egPJf6wKxHWczXc1lB/aGNuFGvu+4Swpt75RU6whBHA=;
 b=dHGONawOWGnmiCyQCi35r4FeKdD4yreHZYx7HNGliy1o4ar65k+vATspoKxD9jFOTLKZKm
 O5F7dXf2jck9TnuvQKBJhSEUyizPFKHDtrX+43+009wNLQcAq93IJIOu3Cu3+r3FuUeKcK
 dxsrR7jkFIOBODPyAcNqKMAdqFC5CgA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-lMZh40FNNTOC07ZE-7DoXQ-1; Wed, 19 Mar 2025 13:01:00 -0400
X-MC-Unique: lMZh40FNNTOC07ZE-7DoXQ-1
X-Mimecast-MFC-AGG-ID: lMZh40FNNTOC07ZE-7DoXQ_1742403659
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so6407475e9.1
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 10:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742403659; x=1743008459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egPJf6wKxHWczXc1lB/aGNuFGvu+4Swpt75RU6whBHA=;
 b=DOZuxDxrcIHlhNcCTjxttmJhkyTJjvA4y0VDvtNHplznW+uLb+zwdt8r/WYcjvGery
 CjuAy0GA/ZfKChfC6AkReqdHyzrBpqTeySKxoyNhzPqm3BU7WvuIW5Ay/fO9Rnc0ak2r
 e9R5CLDdugqaK0l5T+eHez9eygJUOYJwrFR7mfk9SfWybKR0X1wwEXBuvgnYfcYLXjdr
 YEUrFsm3NOo/g4acCssoNQ6oQCXRDwZR3IEkGZhUy7sBlGVNX26YonM0Z3VcMMH/arEW
 bb5ScBl21sWESTBtTdTx2k7P73g3rbDjxUxEb6V50hjMgcYgM/rVR7TfmIjJERMADklL
 ugSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULoY82spyv94/2+jwa9kidnnQF6byL/olEBbtUvhHrEciSMRLLGw9BhnR3sclp7z8sNBqA/K4DZw==@nongnu.org
X-Gm-Message-State: AOJu0YyGFBbIHYSfBAxXQmZuARUDpmtv/TJjqk3U4xsa7K4xzefl6eaW
 ee8eoyjMuvJR5SE8P7dOd/RRrn3A82LXnsWGTYfiu+WAwIaDaS+1+GB6zs1ddvKkafdv07T77cw
 xxrNTx+OrIpW/XWUC2wVtVkuwJTjbq42IwAeZ4RwQScwOkcFbjA==
X-Gm-Gg: ASbGnct60rTUZvygdq38T7Uw00bN/bT/oFVcFyjtlS4oq5webOgl3Kz9bi8DFf39NqV
 xXYZKPJELkmJ46Mt1wf3VqXLHJzYAiMH5jvpdE9o4qaL+sH9QWDx4JnJw1MDt2+KicVFw7V9qrn
 qACY7VuKRDZOozZi7uQQHiYposIYwjqI4Bd/ZGPXK7NWHffb3T9bI3aa7xcV/1BsNLNfRB8h9F9
 hlxbXai+c0uMsPa7/SiiBq0pdvgGhuYr4W1wtbvag59O2LEpoD2bVvF7Q5Zob+a2YYWjRqD/L6A
 HUzcQyCtb+jkBxYWmiP+L3QTRzbmFnUuN+IHfnDJ83WRnxe2avA7bsFnwa+W1Qs=
X-Received: by 2002:a05:600c:c10e:b0:439:5d00:e78f with SMTP id
 5b1f17b1804b1-43d491b70f1mr1060405e9.11.1742403659091; 
 Wed, 19 Mar 2025 10:00:59 -0700 (PDT)
X-Received: by 2002:a05:600c:c10e:b0:439:5d00:e78f with SMTP id
 5b1f17b1804b1-43d491b70f1mr1059815e9.11.1742403658600; 
 Wed, 19 Mar 2025 10:00:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeba1sm23768775e9.32.2025.03.19.10.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:00:57 -0700 (PDT)
Message-ID: <27aee7f3-5316-40b7-bd7e-dc68a7a1d0d2@redhat.com>
Date: Wed, 19 Mar 2025 18:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Jason Gunthorpe <jgg@nvidia.com>, Donald Dutile <ddutile@redhat.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia> <20250317192453.GR9311@nvidia.com>
 <Z9iDxSvZVsgtasGj@Asurada-Nvidia>
 <6cb391a4-d150-4692-b62e-a509448a1034@redhat.com>
 <Z9nF6FaIU37BNg4B@Asurada-Nvidia>
 <3716d39d-3f88-4914-a9d6-440d379db3d7@redhat.com>
 <20250319002325.GG9311@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250319002325.GG9311@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q6NE4haraPPrOvrtndRtDt0dvxz9WDXxXhK6NR75vVs_1742403659
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: 1JG1SEeSDRQF

Hi,


On 3/19/25 1:23 AM, Jason Gunthorpe wrote:
> On Tue, Mar 18, 2025 at 05:22:51PM -0400, Donald Dutile wrote:
>
>> I agree with Eric that 'accel' isn't needed -- this should be
>> ascertained from the pSMMU that a physical device is attached to.
> I seem to remember the point was made that we don't actually know if
> accel is possible, or desired, especially in the case of hotplug.
that's why I think it would be better if we could instantiate a single
type of device that can do both accel and non accel mode.
Maybe that would be at the price of always enforcing MSI resv regions on
guest to assure MSI nesting is possible.

>
> The accelerated mode has a number of limitations that the software
> mode does not have. I think it does make sense that the user would
> deliberately choose to use a more restrictive operating mode and then
> would have to meet the requirements - eg by creating the required
> number and configuration of vSMMUs.
To avoid any misunderstanding I am not pushing for have a single vSMMU
instance. I advocate for having several instances, each somehow
specialized for VFIO devices or emulated devices. Maybe we can opt-in
with accel=on but the default could be auto (the property can be
AUTO_ON_OFF) where the code detects if a VFIO device is translated.In
case incompatible devices are translated into a same vSMMU instance I
guess it could be detected and will fail.

What I am pusshing for is to have a single type of QEMU device which can
do both accel and non accel.
> In general I advocate for having several vSMMU instances, each of them
>
>> Now... how does vfio(?; why not qemu?) layer determine that? --
>> where are SMMUv3 'accel' features exposed either: a) in the device
>> struct (for the smmuv3) or (b) somewhere under sysfs? ... I couldn't
>> find anything under either on my g-h system, but would appreciate a
>> ptr if there is.
> I think it is not discoverable yet other thatn through
> try-and-fail. Discoverability would probably be some bits in an
> iommufd GET_INFO ioctl or something like that.
yeah but at least we can easily detect if a VFIO device is beeing
translated by a vSMMU instance in which case there is no other choice to
turn accel on.

Thanks

Eric
>
>> and like Eric, although 'accel' is better than the
>> original 'nested', it's non-obvious what accel feature(s) are being
>> turned on, or not.
> There are really only one accel feature - direct HW usage of the IO
> Page table in the guest (no shadowing).
>
> A secondary addon would be direct HW usage of an invalidation queue in
> the guest.
>
>> kernel boot-param will be needed; if in sysfs, a write to 0 an
>> enable(disable) it maybe an alternative as well.  Bottom line: we
>> need a way to (a) ascertain the accel feature (b) a way to disable
>> it when it is broken, so qemu's smmuv3 spec will 'just work'.  
> You'd turned it off by not asking qemu to use it, that is sort of the
> reasoning behind the command line opt in for accel or not.
>
> Jason
>

