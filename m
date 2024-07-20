Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp851533njc;
        Fri, 19 Jul 2024 23:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrRXSni6WWuANU2yXESV0GPNLdAv3HNULpQFL+2cdf4je21hWqb4e2+t3ABZe/t1D3s0nHtmH+QTroKJZoq+PRCmWnZnbH
X-Google-Smtp-Source: AGHT+IEqknnZOloPwuLZkFuY1CumM6tz7MCBjVWYuNvrPpilaJoiCB58ld874x4IUTw8MufdvxkT
X-Received: by 2002:a05:620a:4594:b0:79e:f878:7ffb with SMTP id af79cd13be357-7a1a18e8bc0mr326719685a.9.1721458671537;
        Fri, 19 Jul 2024 23:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721458671; cv=none;
        d=google.com; s=arc-20160816;
        b=JNne+LT45a/U/lhDGNktfjEsNS+GYMEwy4pbVSO9m9VPQ4X0i2BDTcAYPEoaKmDf3N
         HBucCmLUq9Eq9v7eQ8KtGd2quBS5VhxOJrgcGf859dKDYc9k0nmQ1yJXjbWtL+N86LQg
         0588hNdRplUXi1JKFDg/ckpu0hGBoSHryolg274bL0h0OgGNrjkMT3OLHSxfmrOsJHXP
         00cFmlzJwYVrmn/FHEFwWA9aJdjSo+4rhybGpEt63j7O7Jl1GcfBQ6zT3Wqa2fSKctvV
         /TSiBtxt4QMTx2bh6JI2ZbrQCUcFK75Uc9r6CIJPL4zNrXj2AmB7n5zTH/OUcSUcJ0hu
         NWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YXMsCmeXKhC38wpL3NNuJlhVAfBISSTjp4BIt8SDGGU=;
        fh=GPG6p65bssOFD/A7zXwdV6elrS9IqYbI39KG+0paOSY=;
        b=cqkauB5u0y5QVTyG3J41HeaQHubANk1x45Aq8UzjjiwT+DfwJrPRYQxpxN9U5C38Ia
         t+TGVrCfAx7nJvEm47HR+rxpBq7FTcavCWshF5EOAiq6PwG/PAsIvCM8C53lkiiZJYRH
         k+XN4YA2G9H8y4R8Y8g5MiV9EbaNoGbfTp5mYRbeEF4+wvODTCExEh1JGsoW32qOjiqS
         2Yw18z8arIPY9squhRAUNz+CqR173eqE2p7bnHJJX2bfCR2w4fh48weIav0GK65Mp7Rp
         mSnbAcyS7J+e4PLi1bjKA20MYG+BihcGGzOFfM+gldqh/zhK+imrsUjSzk8Urg06FpRK
         GpaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RdP6cmCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a199092662si340771085a.571.2024.07.19.23.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2024 23:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RdP6cmCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sV42G-0000oS-9R; Sat, 20 Jul 2024 02:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sV42B-0000lG-2m
 for qemu-arm@nongnu.org; Sat, 20 Jul 2024 02:57:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sV429-0004qF-ED
 for qemu-arm@nongnu.org; Sat, 20 Jul 2024 02:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721458650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXMsCmeXKhC38wpL3NNuJlhVAfBISSTjp4BIt8SDGGU=;
 b=RdP6cmCzUS895vImMlKPn+KyWrVKW+QQb7fGl347U4123ltBJ7/vzjAIZoq9Vya2VWl1KH
 ZK437O21LnTaOyHcAZ72rjvrhQfoxGa5LfMsIl/2lPE46zccbp3xGHSnP03qiG4tVcYXkL
 9g8lpiXY5uZU/KLFq3zvoZVJbqrYiBM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-7SIyNSPfN--Ec1s5SZ0pKw-1; Sat, 20 Jul 2024 02:57:27 -0400
X-MC-Unique: 7SIyNSPfN--Ec1s5SZ0pKw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-36878581685so1015779f8f.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jul 2024 23:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721458646; x=1722063446;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YXMsCmeXKhC38wpL3NNuJlhVAfBISSTjp4BIt8SDGGU=;
 b=PI7a/0YrjYOfvwOL6PTUmyoWx5PVfzCNQ1NxBpHOKk5luBR3rSOG4QrtW5m0fALeOC
 WZmgTKhfQFfGBgsPe2uFBOeKLQBuO020soWFM6nrmSj3KSKYloTKXf65Cir1L73/o9FI
 q4rSKzfeA+tTkV/sMp23JXrz8hNLK4MU/Oee59ilzLCwOGdutsC0ptOGUvfgmlhHMBD2
 KwEOh1Y68XSRF46DzG7JAKFIpEQorNctov4SmLi23Eie0kYRacMdMvsRop4VSDdJ8ToE
 0+M4xhIFvfIhMS2P5q8Z2B3IcqdZ422ftIoBqPjPGZfFwz3VRTgGGh0OgCXhdnyHr0ID
 JKgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlI0g5O9eoldSvT8l5Rv+abW4urJsu3zMY9I4IYHEpdJKHmRyfzktKGVjzaiGsGptKPpHBkou3F1gbAgFc4MC0jXNr
X-Gm-Message-State: AOJu0Yz+iA1y7scjTeprEYnTG3548D2ifnGop5FF9eljvXx+lU6Gs/qQ
 RcFmebk/78ZWQMekjSwl8tQA3+02T2LsiHyNY9wfqtK17eVykT9yHB84nMOA/fJLxj6jkdS7XEg
 nfbX6VE55+CCEMNjiLKm7D9pPfN69evLZrbzEhev6NOtemRbGKg==
X-Received: by 2002:adf:f94b:0:b0:367:89fd:1e06 with SMTP id
 ffacd0b85a97d-369bae86ae4mr379251f8f.36.1721458646676; 
 Fri, 19 Jul 2024 23:57:26 -0700 (PDT)
X-Received: by 2002:adf:f94b:0:b0:367:89fd:1e06 with SMTP id
 ffacd0b85a97d-369bae86ae4mr379235f8f.36.1721458646250; 
 Fri, 19 Jul 2024 23:57:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:530f:c053:4ab2:f786?
 ([2a01:e0a:9e2:9000:530f:c053:4ab2:f786])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ed572sm3259039f8f.110.2024.07.19.23.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 23:57:25 -0700 (PDT)
Message-ID: <6a46981d-8c36-4a83-b3bb-49f8cc5450c7@redhat.com>
Date: Sat, 20 Jul 2024 08:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/vfio/container: Fix SIGSEV on
 vfio_container_instance_finalize()
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhenzhong.duan@intel.com,
 alex.williamson@redhat.com
Cc: yanghliu@redhat.com
References: <20240719165011.1751831-1-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240719165011.1751831-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bICeIT40BRMG

On 7/19/24 18:50, Eric Auger wrote:
> In vfio_connect_container's error path, the base container is
> removed twice form the VFIOAddressSpace QLIST: first on the
> listener_release_exit label and second, on free_container_exit
> label, through object_unref(container), which calls
> vfio_container_instance_finalize().
> 
> Let's remove the first instance.
> 
> Fixes: 938026053f4 ("vfio/container: Switch to QOM")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Oh. Nice catch !


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/container.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index 425db1a14c..d8b7c533af 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -657,7 +657,6 @@ static bool vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>       return true;
>   listener_release_exit:
>       QLIST_REMOVE(group, container_next);
> -    QLIST_REMOVE(bcontainer, next);
>       vfio_kvm_device_del_group(group);
>       memory_listener_unregister(&bcontainer->listener);
>       if (vioc->release) {

