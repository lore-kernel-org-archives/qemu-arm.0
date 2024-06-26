Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp1036725njc;
        Wed, 26 Jun 2024 10:11:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOFcHi2a8/0/L6eFs/A55v82pg4/m3RKxEkXIAKBfiCtku+DZQCxC3PzIPYQyBfD52vRPGDb+MldcuCtLKJ54t1Zj5SU/w
X-Google-Smtp-Source: AGHT+IGqkaEBauWe3jXfrO3sIUq+9x6gISeZ7m3elvIvb/QCWDTZmP7cUnBFtzTiaz8oO1xdEO1C
X-Received: by 2002:a05:6102:ccd:b0:48f:5ae8:e37a with SMTP id ada2fe7eead31-48f5ae8e51fmr11828752137.23.1719421875215;
        Wed, 26 Jun 2024 10:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719421875; cv=none;
        d=google.com; s=arc-20160816;
        b=ngKKcwr2KVDdus5kQblbvAWDYGD6xZVYJq/BifKOY6lMN1ZzPQpKk5O7k5KrhGPZSU
         axp+GbwC3d2trXgzquZcJ0qN+Tv81QbUMmS5HkckjNAWat1/BkpeKary2Y+lmJ4Gx8wn
         olnErJn3cy7+zY+6W9nVFvx/gsG3Nzzml7RemiC9J4ecQ1pcxAe1OD5njB94f2kYykla
         Z7sT9O/ws0vJA7x/QXVPRS3HYUTzgMGpgieTjH1Qgb2K8trIinZmfOcio8Sp1OHxqqur
         a0/O9asu1ptZWD/cDK08D0S5/Hclf/qJC3Oe8LZObstKiA3CUIXhgRbbE+fGjUjvKZIQ
         gXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:to:subject:from:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=QmifNyACBQHaeJ1t+zPW4q5tm/G2QJ9W3mNecYNNIgQ=;
        fh=BXmd2z/leuFoU/15IKGbdUONN4mjq8784Rzb0cwpIus=;
        b=Q3tOpv5XLKWD4Bu5NKWMYYOpN5ThzPcKYcgOLsvbBE3T15kb07pcJE04u3kCI8SAfU
         P0LT1/i77l/+tFyKDujR6GEF3ZE32isJC3/Z2drYXJ2TCHArOFcy5bbaDY3ke+Chd61U
         FNEJn4TMQYQ1vxDfjB/L9CICi9AOpQEUs5zdzVHXQNFylAEm1Dw9llzAFTpHlxNnIWkb
         rONzdN7IkRv9l2Wb2BTJCsDpGjoZN5mnmVEYly7MfQ3D38BIRt/0QlHznP73j/kShtuI
         TXQ7MtVacx3pU4TkVtYHOrmOPntO/XEavZMhJioLWgWTlhuo8c5ypm6x0jSwEspSNN28
         bS9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Po4iUSHh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48f4d1ec250si1330815137.124.2024.06.26.10.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 10:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Po4iUSHh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sMWAP-0000OL-Jd; Wed, 26 Jun 2024 13:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMWAN-0000O0-38
 for qemu-devel@nongnu.org; Wed, 26 Jun 2024 13:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sMWAK-00085g-EE
 for qemu-devel@nongnu.org; Wed, 26 Jun 2024 13:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719421839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmifNyACBQHaeJ1t+zPW4q5tm/G2QJ9W3mNecYNNIgQ=;
 b=Po4iUSHhgXF9PgOBb38vSyWYdByj4XLHS9khvQIuLEVziFi9lOqIjhGeOEcQiuPdkZVFJe
 qcO1pcl0MjoAz59Z78GI7dGLn66BrpiopEtzV15V75W4iLMhlNoStvcPtqMuhaBgFD+v1h
 yCcdNs7i9QeEZDYIwhCnlsEMWzkRhrE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-KxmgI6WbP7azdnwqNmUU5w-1; Wed, 26 Jun 2024 13:10:37 -0400
X-MC-Unique: KxmgI6WbP7azdnwqNmUU5w-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b51725a7ebso103923166d6.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jun 2024 10:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719421837; x=1720026637;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QmifNyACBQHaeJ1t+zPW4q5tm/G2QJ9W3mNecYNNIgQ=;
 b=UhiatmSc1H8aodMhtpvU8n7xpa4JhzLYkwbifUpxZZb3O2AjEDLjbegJ+C7LB0fqx5
 mYl0dQyrhZq2MhNiguBkVFusxh6jSIDmrB1UpOep/QO8IIiEn6CGREmC9ur57wh33VW7
 gfcXS+T/elH2pcU0PJIzmD0jn/+GhwbLcv3G5Zvw5h/qmM/ZyYeMz8Sw+V9GT4CNylss
 Y6m6/BaM0TEK+Qm7hb/dHusxlOhiqbplAeWOp7ilL6/lUMJSglwWoxC74f7Hs+SiwlZP
 JhQ6GFCbbO6SIiXPJaEhUBOSdnzKyhu98kdNkw0gWxQf9d8UmxFUWaLGrzJdC8aD+8WJ
 n99g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrP74o4GRBQ0bs/JiyJ0T6vkwmFp4h8PxG7haTnjN0EsBrktm3N7l7lFU5eo2DlSbTLD23nxMu6pAUXWQDevpq3+c56gc=
X-Gm-Message-State: AOJu0Yw20jX+KWWCtW2v7KkAc2K6kbJhY9NvrM2pcqOxT1lW4L+WnElT
 puwG0iFIWoCEPFKK4leaTTk75S4YPr7g/a0LbJ5bLIPFbNLDucurT0ReYoMc5b9ZNLt5C+ftMCO
 kiWoCjO32kD5nZssZBrZjeYV2yvawAtt8odH5MJlKDEMbHIPg31nq
X-Received: by 2002:a05:6214:5488:b0:6b0:7fcf:36b8 with SMTP id
 6a1803df08f44-6b540ab8f24mr109796826d6.53.1719421836879; 
 Wed, 26 Jun 2024 10:10:36 -0700 (PDT)
X-Received: by 2002:a05:6214:5488:b0:6b0:7fcf:36b8 with SMTP id
 6a1803df08f44-6b540ab8f24mr109796516d6.53.1719421836558; 
 Wed, 26 Jun 2024 10:10:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef5ca8fsm55990516d6.119.2024.06.26.10.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 10:10:36 -0700 (PDT)
Message-ID: <21eaa3bf-5f54-4bd6-919b-a245b425e7ac@redhat.com>
Date: Wed, 26 Jun 2024 19:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Subject: Re: [PATCH 7/7] virtio-iommu: Revert transient enablement of IOMMU MR
 in bypass mode
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
References: <20240626082727.1278530-1-eric.auger@redhat.com>
 <20240626082727.1278530-8-eric.auger@redhat.com>
Content-Language: en-US, fr
In-Reply-To: <20240626082727.1278530-8-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.207,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iX279kwyMhJB

On 6/26/24 10:26 AM, Eric Auger wrote:
> In 94df5b2180d6 ("virtio-iommu: Fix 64kB host page size VFIO device
> assignment"), in case of bypass mode, we transiently enabled the
> IOMMU MR to allow the set_page_size_mask() to be called and pass
> information about the page size mask constraint of cold plugged
> VFIO devices. Now we do not use the IOMMU MR callback anymore, we
> can just get rid of this hack.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/virtio/virtio-iommu.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index b24e10de81..f87359b3e7 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1385,18 +1385,6 @@ static void virtio_iommu_freeze_granule(Notifier *notifier, void *data)
>       VirtIOIOMMU *s = container_of(notifier, VirtIOIOMMU, machine_done);
>       int granule;
>   
> -    if (likely(s->config.bypass)) {
> -        /*
> -         * Transient IOMMU MR enable to collect page_size_mask requirements
> -         * through memory_region_iommu_set_page_size_mask() called by
> -         * VFIO region_add() callback
> -         */
> -         s->config.bypass = false;
> -         virtio_iommu_switch_address_space_all(s);
> -         /* restore default */
> -         s->config.bypass = true;
> -         virtio_iommu_switch_address_space_all(s);
> -    }
>       s->granule_frozen = true;
>       granule = ctz64(s->config.page_size_mask);
>       trace_virtio_iommu_freeze_granule(BIT_ULL(granule));

