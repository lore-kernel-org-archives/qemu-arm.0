Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp134416ejb;
        Fri, 14 Jun 2024 02:14:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPvOzF/VRxvIsW0ZcGbozSW9m1oYI+j40MMcLAKd2uqqo6/F6mi9Svud4Hz/lnjwpLwnx/UaNdYkRip1zRZHA5whWmg5Nd
X-Google-Smtp-Source: AGHT+IHoWKh2reVfI8nZzyGAGzJhdcBix0apSYZ6p1nDIgrfQ8hCVfpXhegX28ympZ71pN8dXHbd
X-Received: by 2002:a05:622a:1214:b0:43a:dce9:93c9 with SMTP id d75a77b69052e-4421689d6fbmr26695171cf.24.1718356470626;
        Fri, 14 Jun 2024 02:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718356470; cv=none;
        d=google.com; s=arc-20160816;
        b=qrtXPItScD25xvNyEhrWg0/dfAyyCbR0Aj3GnbPM/Ua0vMo07Qdg7aZwvC2kxHpzDO
         Cn03kAHC3b1zNZ42cWggwBPw9ha4AOK4CR1kX860qL4Q88/yOeG9e3L+jQ820tuD5qNS
         +mcDs3UcykGPnw+GNyg6DcXjem1nZsM2nTog5Yu8tgeP2cB3IIn2L4bXogESEC4bTBwR
         dLcs2qjrU7b6mptgHIAhb/r5TcObmpGh0bGvfXX58+QcJJ27UcDmdFDaOwUctzsovc90
         tDSNHrBLkN+lYOU0qIe2OdGb83oz0XXfA6emblvdZqjZBxWRKZerxMzfEkvgZUndchVz
         zVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Hkd7uqIU71s3vfuSqbkouRdH9KhguF0eO9bE/dDV+pA=;
        fh=Xc7uQMf2J9EDhiCwEJmqTr6NSRGLAF70gu2Yws3ZyS0=;
        b=xwvtHqrqicUGamk3WrULe3EOsY0iEX7O35nUocuMhwTRK7jn/76GX131z6iHGNjdFt
         mARwjJufVluZdQ3WldJggU65hUXAqw2qWPOVQRyGKYxL/EQgynvO3iq496XgzBNtESQW
         Uex/fF3Q6xKgjJT2JpRVt95BUifccsc5VfK28pMcz0fm0KdobI1b8ct6SPg5WxUyGbrq
         n2khZLDEJz+6E6yOy6Un5DH74oYT+HhYpK6CAAEFton7jjMadTBARhjpC2inu8l7iaCA
         RPAbCja2Rlnh8V3Rk4sa3akFmlaOnGpDQlbgudM8FK+/JAzrD/ihw19/QyvRadSJzmbR
         +EuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dv+BVMKQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441ef3ddbfbsi37041441cf.220.2024.06.14.02.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 02:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dv+BVMKQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sI30Y-0000wp-I3; Fri, 14 Jun 2024 05:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI30X-0000vf-9Q
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 05:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI30U-0003YA-EM
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 05:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718356441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hkd7uqIU71s3vfuSqbkouRdH9KhguF0eO9bE/dDV+pA=;
 b=Dv+BVMKQLQaBNixHx6qyn0A1pRiuN4mm3V5D44R+Jncgq5BSDDNOFyxoUw32aoJ8pVNZtJ
 3F+xAHyU2vm2dAQAufZNPeZamIHMpd32nxRlw5/tgsceawK9GiZTv9wIcrsL6O/QUjCDBU
 uOEa+ahDEspnYEei3l9Izqom4frKRnw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-kfP1icsuN9SNZxgkDGgosw-1; Fri, 14 Jun 2024 05:13:59 -0400
X-MC-Unique: kfP1icsuN9SNZxgkDGgosw-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-43fb05ef704so20534231cf.2
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2024 02:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718356438; x=1718961238;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hkd7uqIU71s3vfuSqbkouRdH9KhguF0eO9bE/dDV+pA=;
 b=Thir4umVwN2iKRxTeI3g120pycwDhXalhhoRiZ9NQOme/myS3kJh4Xn74nCO8eRY0Z
 5byJEn96AjGD42+H+4iTlhJpFk+AsznhdVM768Yye8px3FFp93u2S03iUCXgHdCxZoJ/
 3ZsqHe9VkDgedX3/JR9Lza9Y4hkFeQVOTodEjTwpQv3u7XxDKaygB8BjZsrZZ8BZYmCP
 77V7M3WNCcX6En0/o0zIFIeWTF77UngqAxLdD+1njiPawpjpJmqRe9xH4mg5F7AVWEwo
 LkeXjZ37G+/CyfO5RVB0Vxemw2lIebpzn2ZOrhC4SX4ZNbTw8SvAEOHQzpX4CjwHmo4i
 JzKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIUeNZ3UrClT7lqmgRkVlVUcHMVLIDZcX1C3f95NW2DlK/8rqrd41S5nFUN8KOpAx1jFNUwMzV1yjqU7JNyBA8quI1hak=
X-Gm-Message-State: AOJu0Yx2my7CTzQw+vsnYbW/TC1ToHUihws7AaSW1umHCpGSwjdrXvxX
 wkqe75xzGED1MFy44vRzd9Nh5tJ+DtrDUzkZBWomtZy56lcHJwYC9LP42x/SENrCqZCe5hTLubu
 7YBMF0M5b0wSgXBFGCQCxUfflP0ATava4Owk3eHCjXaGHoeGhvAip
X-Received: by 2002:a05:622a:1999:b0:441:5428:6dea with SMTP id
 d75a77b69052e-4421687d21emr28793531cf.18.1718356438406; 
 Fri, 14 Jun 2024 02:13:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1999:b0:441:5428:6dea with SMTP id
 d75a77b69052e-4421687d21emr28793351cf.18.1718356438075; 
 Fri, 14 Jun 2024 02:13:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f2fcc541sm14291471cf.77.2024.06.14.02.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:13:57 -0700 (PDT)
Message-ID: <ef400920-dcf4-4f37-b4ce-c5560b92d9c5@redhat.com>
Date: Fri, 14 Jun 2024 11:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] HostIOMMUDevice: Store the VFIO/VDPA agent
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240613092359.847145-1-eric.auger@redhat.com>
 <20240613092359.847145-2-eric.auger@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240613092359.847145-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XcQVOuntFhfE

On 6/13/24 11:20 AM, Eric Auger wrote:
> Store the agent device (VFIO or VDPA) in the host IOMMU device.
> This will allow easy access to some of its resources.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   include/sysemu/host_iommu_device.h | 1 +
>   hw/vfio/container.c                | 1 +
>   hw/vfio/iommufd.c                  | 2 ++
>   3 files changed, 4 insertions(+)
> 
> diff --git a/include/sysemu/host_iommu_device.h b/include/sysemu/host_iommu_device.h
> index a57873958b..3e5f058e7b 100644
> --- a/include/sysemu/host_iommu_device.h
> +++ b/include/sysemu/host_iommu_device.h
> @@ -34,6 +34,7 @@ struct HostIOMMUDevice {
>       Object parent_obj;
>   
>       char *name;
> +    void *agent; /* pointer to agent device, ie. VFIO or VDPA device */
>       HostIOMMUDeviceCaps caps;
>   };
>   
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index 26e6f7fb4f..b728b978a2 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -1145,6 +1145,7 @@ static bool hiod_legacy_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
>   
>       hiod->name = g_strdup(vdev->name);
>       hiod->caps.aw_bits = vfio_device_get_aw_bits(vdev);
> +    hiod->agent = opaque;
>   
>       return true;
>   }
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index 409ed3dcc9..dbdae1adbb 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -631,6 +631,8 @@ static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
>           struct iommu_hw_info_vtd vtd;
>       } data;
>   
> +    hiod->agent = opaque;
> +

This opaque pointer could be assigned in vfio_attach_device().

Talking of which, why are we passing a 'VFIODevice *' parameter to
HostIOMMUDeviceClass::realize ? I don't see a good reason

I think a 'VFIOContainerBase *' would be more appropriate since
'HostIOMMUDevice' represents a device on the host which is common
to all VFIO devices.
  
In that case, HostIOMMUDevice::agent wouldn't need to be opaque
anymore. It could  simply be a 'VFIOContainerBase *' and
hiod_legacy_vfio_get_iova_ranges() in patch 3 would grab the
'iova_ranges' from the 'VFIOContainerBase *' directly.

This means some rework :

* vfio_device_get_aw_bits() would use a  'VFIOContainerBase *' instead.
* HostIOMMUDevice::name would be removed. This is just for error messages.
* hiod_iommufd_vfio_realize() would use VFIOIOMMUFDContainer::be.

That said, I think we need the QOMification changes first.

Thanks,

C.




>       if (!iommufd_backend_get_device_info(vdev->iommufd, vdev->devid,
>                                            &type, &data, sizeof(data), errp)) {
>           return false;

