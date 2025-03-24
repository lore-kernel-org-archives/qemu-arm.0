Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1973322njc;
        Mon, 24 Mar 2025 07:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVu5dzXW1fpHrzuFrYP7sYDO6Dy66edIVaYKfmQvBQrNzCWyQvkWhbsCYs08zOodxXQzKvkhnGPLu7cyA==@linaro.org
X-Google-Smtp-Source: AGHT+IF8VX5QaQzdoaRkJ/ZTo1kUnG14m+WPVcRT+GQJReDyomgyGNQpGAcIS/Cd+d4XsEr4iYP6
X-Received: by 2002:a05:6102:cd2:b0:4c3:6c4:e177 with SMTP id ada2fe7eead31-4c50d6355camr9990153137.22.1742825359304;
        Mon, 24 Mar 2025 07:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742825359; cv=none;
        d=google.com; s=arc-20240605;
        b=K9mOZyz5N9s9gRs4Z2DmiofE5tNZtj5A6LBR7zmRZCjVJujlofuiRb9v06erxhEJ+Q
         KqwiadEZZOWO4tTzJcX/sfvTS8CmFdQYx3klGuD48iVJ1vVPqJftw7fwiDz+0wl1/JTF
         VaqsAh/TNsEG02kkrv4uqqB8nb/ogt9vzHEgrImojEudxtpHPN7jQXGH2aqBiprdhwLT
         8LVRSsRpjGxLYD3dk1sCfxFeS9KzymAnvVL+L/fF0FtQ4gFzEiX3uQG+b//3+xQSL7s/
         riwgQhj/o6+GOsZ/vPnGukX/U6hH8oD5xJjiWouK76e3rWpl7cXpCU1RE9zQHwWoLT5I
         Gb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MBJs7Cr9ngAy77vwEXpqh1Y3gpeWITiXtV2Zs3BvqwU=;
        fh=hNShY7PXWW2K8NyqQIBjSgFlrd+cfVaAIf/4YM7NW30=;
        b=bKZK0HcczH5OBWsN5vdMdttiRLQC/z5soGyc/DCC6AK12+fP1LOOqfNjoCfObDSQPT
         k8XKpGKWeA+LrZdY0CCUvcNNBe97jlLy86jK78bEDGNsYBDLTvc2b7FwqL2tH8KNUssr
         vAzYBh9B3lV4ohEv6Dv8fyDLTEayyTl9uVwg3ZAqF3hIsGIDryM9krQ4Hp7a5bCgQ9Xu
         5ZXHNT5q3CZx9UU0WvTbJHS6/eAUWJpgzosd39NqRbvukElm5aU+LNtdr3J1HvLZTrQE
         BBFMBHqRpUUn2wInQisRHl1gj7DE0iodhNmKy8YQ1sxsDpe1AXV699PJ3aRaIR9aDmo8
         mn9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DPS6VinH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c50bed0574si1758215137.276.2025.03.24.07.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 07:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DPS6VinH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twiUJ-0005GD-1O; Mon, 24 Mar 2025 10:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twiU4-0005EA-Tt
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 10:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1twiU2-0005ZK-8e
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 10:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742825333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBJs7Cr9ngAy77vwEXpqh1Y3gpeWITiXtV2Zs3BvqwU=;
 b=DPS6VinHX3aaQmxUidhGnzxS2IMJBki2HQMjt2ECsPncJdxhr0nxVsszgQJXy2FOpYxYOi
 JJ+mEnjfom1GZQktkwdQfJ7xOm2vKomU78pPp5GQqRaxjjpAc5aIoRjmrQIQBQXQxcR1FU
 fYJFgIl0vj8vjKrD1m/IS1cN/0Pz8Gw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-D41lizkjNKq5H2M24n2Vfw-1; Mon, 24 Mar 2025 10:08:49 -0400
X-MC-Unique: D41lizkjNKq5H2M24n2Vfw-1
X-Mimecast-MFC-AGG-ID: D41lizkjNKq5H2M24n2Vfw_1742825329
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d0830c3f7so35207285e9.2
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 07:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742825329; x=1743430129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MBJs7Cr9ngAy77vwEXpqh1Y3gpeWITiXtV2Zs3BvqwU=;
 b=xR/fbxLms1I2bxWlA4sOkcngGtu8NphqWswbRtiBIr/8NgZv3d9MBiLSt/b5zCcMlR
 qJEE5Z5SKg9pcO6LpPnqmLFR4LILfi7IDuaoF3ZB1WOlllH5zdXhNjF8Zh/Kj5fb6iSe
 N3E30+udcVzjVmjlhuVwEKJFr27lKvxnddd2G8f8fV/N7iXYxccO0AtSQw/GGBS2F3lB
 448FMQ8NxMD1z7ciSD9Eb19mCLoWlceD6vQk6mLu9fmNThwXphkvpvS93YaI7ifaCjZa
 WLbuKlxudpqt6iNcAqtrA2Htn9XzXr8LLkQww4qfZE33ZbH4IWpw8y38KBW+1C4sU+sO
 Sl7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAirQbldM2GvzZ/jpQcvCGTYQJS8tbx5OZP2qx/M25s5cNUMX9qxF8CnCdf0W/tKW9IlXNag3amA==@nongnu.org
X-Gm-Message-State: AOJu0Ywfbs28MDrQcfniIBJ/N4KBVVknGpwtnSQv40OLyNiwHdUECuVB
 Uau81uFLKh9+ArjhmeLbLNUCgLq1AmrVy4Nl5y9ECq5Tv6wpZwJNkcjV7GeQgDGlPLZ6UZ2WfJi
 fnk8BlSEWcLQpWI/F9MnMLoli6wPTIsy5AYpp6VEAHxxra6p6VA==
X-Gm-Gg: ASbGnctRp+aL0ZkRC6VHWl64GSMP1PK8om7CngbS3TUInhd8b6/7wY0FPnBiBCGFbRE
 4a8jurBIJzf0SZ7X0aVZApD2ZRQhJW7k5hCg0NNFAbPdQqfJRCMTamZVLEBiJA2KleD06zN2KlC
 BWy8RTkDb8Jbg50hSpHa1ESZyp/NGY1WB9wmLqDLSm7Q+xesmqgtvP0lNV/YWo1rbXyYNIY1/p6
 NNWgEPtMpVy9huzqMyWUtxf4JXPw4ESGUX0/i+dW5xYaiAMhMbVNlE+Q5MAaQhE3zNnl4sGO9MX
 nh0qiT1YaiS+Q01fz16nt4sMZZFNmwRTj7cnHwm9Mf41hw/dwboeb/qHpXdQZQ0=
X-Received: by 2002:a05:600c:83cf:b0:43d:22d9:4b8e with SMTP id
 5b1f17b1804b1-43d509ec3famr146578715e9.10.1742825328706; 
 Mon, 24 Mar 2025 07:08:48 -0700 (PDT)
X-Received: by 2002:a05:600c:83cf:b0:43d:22d9:4b8e with SMTP id
 5b1f17b1804b1-43d509ec3famr146578065e9.10.1742825328196; 
 Mon, 24 Mar 2025 07:08:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3b83sm11271536f8f.33.2025.03.24.07.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 07:08:47 -0700 (PDT)
Message-ID: <efbec6a4-e37a-4fa1-ad4a-7294521ee947@redhat.com>
Date: Mon, 24 Mar 2025 15:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
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
 <6cb391a4-d150-4692-b62e-a509448a1034@redhat.com>
 <20250319003135.GH9311@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250319003135.GH9311@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g_iVzfqPYrMd61Wbkwtb0aAHUledKegPNCHiSOf8MKE_1742825329
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
X-TUID: n8NxYCI4Y+dQ

Hi Jason,

On 3/19/25 1:31 AM, Jason Gunthorpe wrote:
> On Tue, Mar 18, 2025 at 07:31:36PM +0100, Eric Auger wrote:
>> Nevertheless I don't think anything prevents the acceleration granted
>> device from also working with virtio/vhost devices for instance unless
>> you unplug the existing infra.
> If the accel mode is using something like vcmdq then it is not
> possible to work since the invalidations won't even be trapped.

I acknowledged I was more focused on the case without vcmdq which was
addressed in the past and now I better see the problem.

>
> Even in the case where we trap the invalidations it sure is
> complicated.. invalidation is done by ASID which is not obviously
> related to any specific device. An ASID could be hidden inside a CD
> table that is being HW accessed and also inside a CD table that is SW
> accessed. The VMM has no way to know what is going on so you'd end up
> forced to replicate all the ASID invalidations. :\
Nevertheless I think we shall also support the case without vcmdq
(currently supported in this series). And this one looks more compatible
with emulated devices althout less optimized.

>
> It just doesn't seem worthwhile to try to make it all work.
>
> I'd suggest arranging to share some of the SMMUv3 emulation code,
> maybe with a library/headerfile or something, but I think it does make
> sense they would be different implementations given how completely
> different they should be.
I agree with can do our utmost to separate implementations. I more
concerned about having libvirt guessing what kind of devices it shall use.

on x86 libvirt needs to use -device intel-iommu,caching-mode=on if one
wants to protect a VFIO device. So this looks like similar to adding
accel=on on ARM.

Eric
>
> Jason
>

