Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp910424njc;
        Wed, 26 Jun 2024 03:39:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXL+OlACK+lBB/4HfhcZAg6KSx6U+noyRX6aagL7sXuNrqjq7OeGAr/mrYttVw/z8h7fSQxg4toINs/IoJjqG6b8CDLYDWD
X-Google-Smtp-Source: AGHT+IEO+hoJp2dn3oaCXyF0xolmgMdaWp4drcJjajUeJPvD5VU9SXl/mco6SNeLPriWTe+2buJh
X-Received: by 2002:a05:620a:2450:b0:795:5615:8cc4 with SMTP id af79cd13be357-79be7046d24mr1091675685a.71.1719398369702;
        Wed, 26 Jun 2024 03:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719398369; cv=none;
        d=google.com; s=arc-20160816;
        b=i9aXiHR9+5w4YbZUgyrYj9Gp2hpy/qQwskx5TTSVsDzlQPr/ZRkLsTJYXAhCl2Ix3r
         6GSX5+MpgBYde3Qidkfr5X5LBccS4AwrAKdNpCXGfG7FJkXsi1LTMCCvTQcnY2p63XKT
         vdhAAz4VHBdVf7QSLA6DEhc4ORwsU1Ee3JloWBA7YcOPQTurGm7687sKeIXS/m37+cai
         m+KTl+1dO1O1vniHQ4AK4yqIP/iZE076HYHB22OVy50JFKKaX5TAicl5e4NVLRScU8hU
         WPR1EAsbj9qffKjWYvrAN+w8ZeaRowDSLrqNWN3W9yYPuPrmdGrpAyw9U7O8+lL4ZDkC
         +kDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=MFBijKNCUp0T7Qta2WUTwJTAhudpMqd/9GjSe79/mj4=;
        fh=BTwyTqbnDx5Vir8/KEFjicmZBsldaIYEIKYz/f7Tm6s=;
        b=Kcao1yFVeYi2mw8i220p/0FPNc02sKpA8EUXZ1aS7NXDhfcLwZuk1UYVi70O0P041Y
         3/HvhzeqASevRsqL2KsgghanUxmtK+WRGP1aFuhQC+n0Y+hW/D+Q4UsOW43j9JrLHp+t
         m7by7PMC+6phiu09LS3dKOmOqyAmjGzMQ6220yUvZXUhEOLfilqD5lh5RoAGAxdInKVc
         iIIMLjm86rfHtMzzNTKojDXymA4p86Pjwwnv7xAB8MU7DNdW8VHE/1U5RP205oLGRbN/
         cwGo3Ltw6DtMUnT/8JTb6HgNBbV2UW/NhNZse8j43zU9zYF5UD0WRDdEdcGUsZ0Tr1Ny
         XMwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ANV9b+UD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce95e48dsi1257242085a.762.2024.06.26.03.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 03:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ANV9b+UD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMQ3W-0002nl-83; Wed, 26 Jun 2024 06:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMQ3U-0002n8-N8
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 06:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMQ3T-000893-1W
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 06:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719398348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFBijKNCUp0T7Qta2WUTwJTAhudpMqd/9GjSe79/mj4=;
 b=ANV9b+UDLpzLZU6ZDr1ZGbI8nMsrQIrDCCwuAr8uuQDTlIGyb5n2+vKI3d+/HZ2UaBFK1W
 p00lBZPRNcuu3glNuqW5vr/Jw2efOAS/xYvC1Cmgth3mNN2gKnnsCLgnz1XHrni6Y+3J6a
 4dOHB1Sx/9us1YyDO7mcvOfHOxL1EV0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-JHaAAX5yPJuEOcNEdOVYRw-1; Wed, 26 Jun 2024 06:39:03 -0400
X-MC-Unique: JHaAAX5yPJuEOcNEdOVYRw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-421791c4eadso34942675e9.3
 for <qemu-arm@nongnu.org>; Wed, 26 Jun 2024 03:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719398342; x=1720003142;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MFBijKNCUp0T7Qta2WUTwJTAhudpMqd/9GjSe79/mj4=;
 b=OXQEC7Kn/RZ/hxuPbUsraBqosxV83TtvbsIgNrY+ORtZ546O7O+pZf9kn86Y7rdlNb
 B9Aum9mPDQ6sDI09irRiU5Fvcb7CZWcnrSvRR0ETKm2Hmhkx339InqaiWhgsIVdaJ8an
 qnG6cTzLwTwsPPtXJsUOZCmQcXkWhLRQOHBeu6NGU0X+UpODjZ+2tu4Ks72u9AloTIW1
 ibYyfBRyGzelbFdxPm/S4V3PmvpZ9Z0UUe7rszT2BeJnuk5mrbQD2/f6pT//W0yqpReh
 6AkPBxVi965TWiSlb4w9SA9T2DOh7ICFgr2R+COjWZ8tDfeGq5/eI9pUlBUnuPHCi3ro
 7fZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQnHLrIFYztxDV6PvzbpBO/tPZ6VQXA+UXw75jNr5qtU3BvidOQlIec79bgCH3XvqeRRwnXwjUINUTQwNDHHdle1YV
X-Gm-Message-State: AOJu0Yzdp1EvjWqQwF6ZaDBpuU3td0pjP82trpd/zv/H8aQ+9T8OBO04
 mEWYLdz5LfanYwiHgd97lmipg1yIoHFKxE/vLvdU7ahOGOfAqLimTmrYrmzFof0r0+NmD5ux2y2
 IEqdeo62jVwJk4hF28dXmGHozUbW2TKNXWcdyy3e415iScGQ6NQ==
X-Received: by 2002:a05:600c:4209:b0:425:5e8b:679f with SMTP id
 5b1f17b1804b1-4255e8b69f7mr7812335e9.6.1719398342670; 
 Wed, 26 Jun 2024 03:39:02 -0700 (PDT)
X-Received: by 2002:a05:600c:4209:b0:425:5e8b:679f with SMTP id
 5b1f17b1804b1-4255e8b69f7mr7812245e9.6.1719398342362; 
 Wed, 26 Jun 2024 03:39:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c826a2e7sm20439615e9.21.2024.06.26.03.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 03:39:01 -0700 (PDT)
Message-ID: <6a01db71-fbca-4ff6-be8c-628b43c937f6@redhat.com>
Date: Wed, 26 Jun 2024 12:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] virtio-iommu: Fix error handling in
 virtio_iommu_set_host_iova_ranges()
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
References: <20240626082727.1278530-1-eric.auger@redhat.com>
 <20240626082727.1278530-2-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240626082727.1278530-2-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Pn1MKCijxJR+

On 6/26/24 10:26 AM, Eric Auger wrote:
> In case no IOMMUPciBus/IOMMUDevice are found we need to properly
> set the error handle and return.
> 
> Fixes : Coverity CID 1549006
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: cf2647a76e ("virtio-iommu: Compute host reserved regions")


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/virtio/virtio-iommu.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index b9a7ddcd14..b708fb96fd 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -543,10 +543,15 @@ static int virtio_iommu_set_host_iova_ranges(VirtIOIOMMU *s, PCIBus *bus,
>       int ret = -EINVAL;
>   
>       if (!sbus) {
> -        error_report("%s no sbus", __func__);
> +        error_setg(errp, "%s: no IOMMUPciBus found!", __func__);
> +        return ret;
>       }
>   
>       sdev = sbus->pbdev[devfn];
> +    if (!sdev) {
> +        error_setg(errp, "%s: no IOMMUDevice found!", __func__);
> +        return ret;
> +    }
>   
>       current_ranges = sdev->host_resv_ranges;
>   

