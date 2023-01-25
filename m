Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp208478ejc;
        Wed, 25 Jan 2023 00:11:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3tCnsHNRi/Y60FfKPofijrkyrS1U+FKqjt8zOOREIwnu3mJjG2JnYvYOJarCOGKvSAvAf
X-Received: by 2002:ac8:7611:0:b0:3b3:560b:353 with SMTP id t17-20020ac87611000000b003b3560b0353mr45399739qtq.63.1674634307566;
        Wed, 25 Jan 2023 00:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674634307; cv=none;
        d=google.com; s=arc-20160816;
        b=n5iw+pAGQwTcxP1hm8WMCW9hyjgctJcDaRPMS6TQQvC0Ciq5PMC1yN5/TwvUzKxdOQ
         WboTxYcNvdNb37zqTm/AqG3DS63xddDHI8HZpuJu/Jp9iF7fM+p9Tg1KNZwdH1AhOGED
         NzF4w/YiEuBmPvmoPOOF1Bg34HHTVuBkEd57ovCheRSXyxQdgNr3v3ivO6/+zNy/R/5e
         7RQ2WXD4MKOcvb8oy7+TqOgg5bTWavkNJ9CkFJVkiRtmJIJWlh4lz5cJjruht1bAazGE
         2MNOk0vxllK6LWFpGCCioC8Vg+jyvGEw55kOlDj0BPHBsCekvy+Flpgzt2z6YU9XOfUq
         iwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2wnjeri0Js13tsnRaB88SvHQUZS4ARE6VTYNDHO2TCI=;
        b=q+e7CChZHjjsLZatWZmPyAv5yczyYtQaXAt1iY8hacX+xbOy/VvIc6hqfa2RRVwmbu
         oJpE/7pRe3DjvIDRuf8pkMxFDiHRj0ENsgzMtbZXTi8fpFBOYXdvVgtiNmiS35j4rB/I
         yNiwySZEH7xVOKPft5cd6Q/NSevG6pPboQCH2ZRk4HwULXfjy6Lv8TLC3shy67i154Oo
         1qfaPTVVGhhYf3bniPmvQiltZCN+w7j2BHBntiVvOatJR3roXqdpOv6Ugxxs/C35CU3S
         pcwQxLjmFrUsDhWMMGx18dEbx5ciOfRkh3Lpl8UEOey69aAdD6sz3Xsm/mqcElRFoj9O
         N1yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hx0o62i0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020ac8554a000000b003b62c3600cesi3238354qtr.737.2023.01.25.00.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jan 2023 00:11:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hx0o62i0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKase-0001YT-4s; Wed, 25 Jan 2023 03:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pKasU-0001Y3-PZ
 for qemu-arm@nongnu.org; Wed, 25 Jan 2023 03:11:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pKasT-0001dz-34
 for qemu-arm@nongnu.org; Wed, 25 Jan 2023 03:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674634288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wnjeri0Js13tsnRaB88SvHQUZS4ARE6VTYNDHO2TCI=;
 b=Hx0o62i0bDnSnpy0IixZlmUkCSc1MWng7L1JxkZtVEsql9TYJNOwL2q3tBHkm8GfChkFQ+
 8s7iXrIBiZ2p0c+YAXp8quX2Z36NLvQUQFuEKbAXg9UNdyG0MoogBKEGVH5nMUlr171gPf
 SSR3GYtgMKs88VeJ8Qtwotw8xFN/oGU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-P5XEdnGxMKiu5wk6L2Mimg-1; Wed, 25 Jan 2023 03:11:19 -0500
X-MC-Unique: P5XEdnGxMKiu5wk6L2Mimg-1
Received: by mail-qv1-f71.google.com with SMTP id
 kr11-20020a0562142b8b00b005355b472a65so8215012qvb.7
 for <qemu-arm@nongnu.org>; Wed, 25 Jan 2023 00:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2wnjeri0Js13tsnRaB88SvHQUZS4ARE6VTYNDHO2TCI=;
 b=GUSI9pJrICrqGK6Z5Ebxo0SN+Rm9uahXcqCjc9OS3t+GxQnXK6QzKVzLp9YzDuVUhz
 dX3f4VXEnKtyBuX85UMIB7vj7jYm4LJp042bKuUW5chbB5biJ51v0Z59/evo5qdemT/g
 ooxXXORhzlHNinEeTvJKYVNybUPsntb/wIf4I+pb1NneULZ9tUfd/AsV6OcJQPdv5XYO
 wd2izRApN4eSkk0q3HOI+QGaH0pLUrylrsvSb58yLsIIfasWSJZLD72e5m/rOdvyQ2Rl
 KdvrgvImfRB6aECaXgkzQaCdmmeJXNw1NoBLZPeheTRCoJBnSESQuDA6RYTEl6fVRypD
 H5/w==
X-Gm-Message-State: AFqh2kpCJuWSoFicv4FQrfhwye8ycV1/hjzPE25N1urjPR9fjvcVZOGI
 WeseCKT13k85RyPeLqZrPWAMiJIiPmCbJQDXa4fZwaOJXLQCP3h3rxJDJwOv5U2stMtQ4vaUwqp
 +THdbVuohyh8R
X-Received: by 2002:a05:6214:5a06:b0:535:5ec4:91e6 with SMTP id
 lu6-20020a0562145a0600b005355ec491e6mr31882643qvb.37.1674634279132; 
 Wed, 25 Jan 2023 00:11:19 -0800 (PST)
X-Received: by 2002:a05:6214:5a06:b0:535:5ec4:91e6 with SMTP id
 lu6-20020a0562145a0600b005355ec491e6mr31882626qvb.37.1674634278872; 
 Wed, 25 Jan 2023 00:11:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05620a223600b006fa22f0494bsm3006678qkh.117.2023.01.25.00.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 00:11:18 -0800 (PST)
Message-ID: <f63e8826-ca1d-1bed-1415-3d0a5339938d@redhat.com>
Date: Wed, 25 Jan 2023 09:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] hw/arm: Use TYPE_ARM_SMMUV3
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230124232059.4017615-1-richard.henderson@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230124232059.4017615-1-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: IiOdFNCgY/X3

Hi,

On 1/25/23 00:20, Richard Henderson wrote:
> Use the macro instead of two explicit string literals.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/sbsa-ref.c | 3 ++-
>  hw/arm/virt.c     | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 4bb444684f..8378441dbb 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -29,6 +29,7 @@
>  #include "exec/hwaddr.h"
>  #include "kvm_arm.h"
>  #include "hw/arm/boot.h"
> +#include "hw/arm/smmuv3.h"
>  #include "hw/block/flash.h"
>  #include "hw/boards.h"
>  #include "hw/ide/internal.h"
> @@ -574,7 +575,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>      DeviceState *dev;
>      int i;
>  
> -    dev = qdev_new("arm-smmuv3");
> +    dev = qdev_new(TYPE_ARM_SMMUV3);
>  
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5f1fddd210..d103de8c2e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1344,7 +1344,7 @@ static void create_smmu(const VirtMachineState *vms,
>          return;
>      }
>  
> -    dev = qdev_new("arm-smmuv3");
> +    dev = qdev_new(TYPE_ARM_SMMUV3);
>  
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);

