Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5DBCCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 16:44:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAszM-0007mq-FK; Mon, 20 Oct 2025 12:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vAszL-0007mR-52
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 12:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vAszJ-0004GJ-8d
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 12:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760978639;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPj3Vwu54LX9v8fMsZBp5Ek+ELZ3NQBdO0d0GVUn33w=;
 b=I3XblUa7HHbP41Ut45xq+oHGPw75tYfSZPve9gp1SyrPjr9RDIMEvftrfD/F0ViOgaSWcg
 CGBqEcc4V+GKB7y38SkO7mFZrCmo3tD0yZ3ttlGpZvJEQs+Ir21bjfJrRs+SGHGQj32tOW
 qBHNURcTPQanAKYan2IiSnVCAXzS/5M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-1hYVO_i4PFKC1oGMI5r3xw-1; Mon, 20 Oct 2025 12:43:58 -0400
X-MC-Unique: 1hYVO_i4PFKC1oGMI5r3xw-1
X-Mimecast-MFC-AGG-ID: 1hYVO_i4PFKC1oGMI5r3xw_1760978637
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4270a61ec48so3581954f8f.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 09:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760978637; x=1761583437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPj3Vwu54LX9v8fMsZBp5Ek+ELZ3NQBdO0d0GVUn33w=;
 b=E7EWpBoANDm3FAaeXwWK5zBU2toRy4NIOaHyqWdOtiFtDwoY+xJSrhM8TZ8h47vv/Q
 /YQg+qq0MIGYUDMIiNL6/IQZkBtGQXk3+ebQnT22Q447c0VS1kNiKJjFgmgmJb7uhEj1
 GBpsYvT8I/mEormX/zJFqu4LHh3gp/OW6/4Sr4MHKwRO2seCAV4r8HMZNdS+WRU/aLgJ
 CsasW0GEnRLa01bMs7ydw947EyrKVfzOyYrQeNb9Glyw/vCLqjNGo6raueMQugb5OYFG
 IJvxRr/dY65ZBrhANyDaVnvn0+hLJ4zCHZ6F9jhU3Fw7Qx+eUi76n09/7Vb1GdVLa80j
 lxzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNzj1YOk4gRs6+wTXwsDiBLKAmQ7lJP7l4CqcUcOzP4nnu8dJ0LzUsz1LhwO9ZqrtTMIJtM13kbQ==@nongnu.org
X-Gm-Message-State: AOJu0YwcDabYg+rlI90Ix2V+wmg1G7yf61tDzvEjVvvzUB8yW/4CVRQn
 3NIqf1FGXbbIbnWEosZaW75nhH86SuFz7DqV7kHwxXVBsTYJo1/YANlHXbD73rhEcAy9uLgYqrB
 oiji6nWw0CE0jhJrYjmMu0fEHTBgK49ueKMj78aWongZft3S9CqTZRA==
X-Gm-Gg: ASbGncsURWTssxc0NPFH40JD6HNO9+Xiij2HIL5n1BLF407PytqxM49bNMMMvtD6Kbf
 j60gCZDfSoQuuaTjIiKPckeuvg3YZid2RlTnYIkUcYi7b+Jg9AYdryv3XcuSHHhwiHPWxkshg7P
 nAGtLcd6g+tOzGSJ5A5+O1XGBHQDd56xlymq/oQWbZCJ3uaU3qw+9t9ZPZR+ndPV/dmJIJ71yCP
 5I5A7eTWMtR2LU69NTKRrGwepOez3F2uPkfRmCQ3AmqeMEIbiwORKN8c4VGE5QvaER3QLfa8Cdj
 bXhjGRNq2/mth7Nlmj2co5O1l3rJi2Qmd00rnBHVIkFSQhRW2ufNv6zGg1BmdQwJlSpFStHy4o4
 SV0X/
X-Received: by 2002:a05:6000:1863:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42704d7e91dmr9125752f8f.12.1760978636840; 
 Mon, 20 Oct 2025 09:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0xk5vTMSAX5abQSEf/PTOM6nTtoqWfX4WNj27pZNJ3V3w528fwCnQ4XG7RoOr3Z90vRvgbg==
X-Received: by 2002:a05:6000:1863:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42704d7e91dmr9125730f8f.12.1760978636471; 
 Mon, 20 Oct 2025 09:43:56 -0700 (PDT)
Received: from [192.168.43.95] ([37.166.134.90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a797sm16144976f8f.27.2025.10.20.09.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 09:43:56 -0700 (PDT)
Message-ID: <8ce5574e-3e31-456c-9579-0fbf8526651f@redhat.com>
Date: Mon, 20 Oct 2025 18:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/27] hw/arm/smmuv3-accel: Make use of
 get_msi_address_space() callback
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-13-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-13-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O2lJyTWZjK37o55XtRtKAYCwUuThOV9Kp6Fv1foIWVA_1760978637
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> Here we return the IOMMU address space if the device has S1 translation
> enabled by Guest. Otherwise return system address space.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 790887ac31..f4e01fba6d 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -387,6 +387,26 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
>      }
>  }
>  
> +static AddressSpace *smmuv3_accel_find_msi_as(PCIBus *bus, void *opaque,
> +                                              int devfn)
> +{
> +    SMMUState *bs = opaque;
> +    SMMUPciBus *sbus = smmu_get_sbus(bs, bus);
> +    SMMUv3AccelDevice *accel_dev = smmuv3_accel_get_dev(bs, sbus, bus, devfn);
> +    SMMUDevice *sdev = &accel_dev->sdev;
> +
> +    /*
> +     * If the assigned vfio-pci dev has S1 translation enabled by
> +     * Guest, return IOMMU address space for MSI translation.
> +     * Otherwise, return system address space.
> +     */
> +    if (accel_dev->s1_hwpt) {
> +        return &sdev->as;
> +    } else {
> +        return &address_space_memory;
> +    }
At the moment I don't understand this code either. In case of emulated
device it then returns address_space_memory whereas I would have
expected the opposite. I definitively need to trace things ;-)

Thanks

Eric
> +}
> +
>  static bool smmuv3_accel_pdev_allowed(PCIDevice *pdev, bool *vfio_pci)
>  {
>  
> @@ -475,6 +495,7 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>      .get_viommu_flags = smmuv3_accel_get_viommu_flags,
>      .set_iommu_device = smmuv3_accel_set_iommu_device,
>      .unset_iommu_device = smmuv3_accel_unset_iommu_device,
> +    .get_msi_address_space = smmuv3_accel_find_msi_as,
>  };
>  
>  void smmuv3_accel_init(SMMUv3State *s)


