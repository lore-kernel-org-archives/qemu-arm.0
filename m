Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0576FD59D99
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Dec 2025 10:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vV6En-0006hx-MI; Mon, 15 Dec 2025 05:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vV6EH-0006Vc-7G
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 05:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vV6EF-0006Xe-BK
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 05:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765796098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q7u8DaxR2YqssGiivXfgVgdazrOIZEqrM3h/GzR666A=;
 b=NLf0FNjCxNzikz3CAH5AC9NO13qe7+93tdQqry/RPN5NXcGbEGZc5QtqNWS0XVgFnX2nrC
 er+E9j9DwgU7Isno49BMLAuRAs7SHWiC8//3G+SILYRUQEyGDWVV0kjpeS0BRAks1X2MEJ
 PtKxtM8JnoTUMeCJBQoix+gzB/4Znog=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-1lrgkyt1McqnMWvF34bshg-1; Mon, 15 Dec 2025 05:54:57 -0500
X-MC-Unique: 1lrgkyt1McqnMWvF34bshg-1
X-Mimecast-MFC-AGG-ID: 1lrgkyt1McqnMWvF34bshg_1765796096
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4775e00b16fso22895725e9.2
 for <qemu-arm@nongnu.org>; Mon, 15 Dec 2025 02:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765796092; x=1766400892;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7u8DaxR2YqssGiivXfgVgdazrOIZEqrM3h/GzR666A=;
 b=qwTajoP5QYvqI5u0E+3roKs8fUW7Oft77MMte6OPmn+T1k8E7lFEfMLvI+VfTURtEb
 ZvEhDKuIBG+dd0e4u37nhKM3ReZEGmIDkL5wnup73CXSXxLu0cAos3H57KrXse4rKAGE
 oqRaNluBhIk8X9cqGUQL2S7mRdbZwgwbrs5yckkKJtADexpiNBIWOEc7hNo5qnFjfwrA
 bNOOJ6EXEsbfteQDOgS0JqfPQyQmP5BbAHaKHcuqyTlkbfv93AbvsSMP1KBeoXSkkoD5
 Smlf2RUjHMYJPNfFOrWJ6Yh2q89b9xBunGy8yu1Y78pewIq2hpKH5eaHMuQiOINpM6QS
 Popw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY/6aApqIMIV4yOzUsh823xUd1aNmehHyIM3EgX21SqusoPktgr7eY9A4YeMtcATKXaC8s09O4Vg==@nongnu.org
X-Gm-Message-State: AOJu0YyBtaecvMscm7fZMSMOooCeOFVx4WFP3914Xjvcmzrq75leHN/e
 cxEU85KB16/hGzIKOxWHNolkjcrQFlQWy5j1W5t7udDCAvpTGI3NaGsaje06ae9wXoIYLdyCnEx
 FjdZ56HpCaoIFVvQve35+VFeVXVsYCuc94SikcL4DPhG5EtTO1quGZA==
X-Gm-Gg: AY/fxX4Xq/Xp8VHZMSOhONUnFbMpZQcFAvIBtCzeWKydCKBXpHW96RE66q3xsHpbS4u
 R44RhultlCaOrtZB9YWKLAxA/ajjkmDL/d5tG0ckeGnpv/lyijxqqzl6fBOGJFkwuHJUNcmDgDt
 M0AzB9u7sF54ViTtvYdrCWPQZKaCFHMumf0nWDgj4YYOqVg9X1mMETSARKiwDhbC/0ceiIHXPSS
 ScAYwvvTgbmpzRYlNbnN4FCZWYLyIyt4otbeIsIoA2Nr7NACn97256xzWv+JxmZsxv78TeTiIrg
 Ia1M/HpNN3wMedIP/rRO0kdzeSKjnmnixna7AKSyegO8cjzYWi0+WHHE4kgpa9Apgm71TLMCKwq
 gY6LQ4soYNDKQGc5W52z4e8mFlXI5kTLDKDlULP40wrBXSRDI
X-Received: by 2002:a05:600c:444b:b0:477:8ba7:fe17 with SMTP id
 5b1f17b1804b1-47bd2b29f13mr6891405e9.7.1765796092101; 
 Mon, 15 Dec 2025 02:54:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaMTEbKWmyKWL3CbEHPeCLuktnt3+L/kO5vC4I7VliiUYpgGUQPDWd2BQMw6y6nFrUpsOzlA==
X-Received: by 2002:a05:600c:444b:b0:477:8ba7:fe17 with SMTP id
 5b1f17b1804b1-47bd2b29f13mr6891145e9.7.1765796091612; 
 Mon, 15 Dec 2025 02:54:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f6f118esm69904835e9.3.2025.12.15.02.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 02:54:50 -0800 (PST)
Message-ID: <fde9622a-a336-469e-982d-b82991243424@redhat.com>
Date: Mon, 15 Dec 2025 11:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 32/33] vfio: Synthesize vPASID capability to VM
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-33-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSJDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQHJlZGhhdC5jb20+wsGRBBMBCAA7FiEEoPZlSPBIlev+awtgUaNDx8/7
 7KEFAmTLlVECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQUaNDx8/77KG0eg//
 S0zIzTcxkrwJ/9XgdcvVTnXLVF9V4/tZPfB7sCp8rpDCEseU6O0TkOVFoGWM39sEMiQBSvyY
 lHrP7p7E/JYQNNLh441MfaX8RJ5Ul3btluLapm8oHp/vbHKV2IhLcpNCfAqaQKdfk8yazYhh
 EdxTBlzxPcu+78uE5fF4wusmtutK0JG0sAgq0mHFZX7qKG6LIbdLdaQalZ8CCFMKUhLptW71
 xe+aNrn7hScBoOj2kTDRgf9CE7svmjGToJzUxgeh9mIkxAxTu7XU+8lmL28j2L5uNuDOq9vl
 hM30OT+pfHmyPLtLK8+GXfFDxjea5hZLF+2yolE/ATQFt9AmOmXC+YayrcO2ZvdnKExZS1o8
 VUKpZgRnkwMUUReaF/mTauRQGLuS4lDcI4DrARPyLGNbvYlpmJWnGRWCDguQ/LBPpbG7djoy
 k3NlvoeA757c4DgCzggViqLm0Bae320qEc6z9o0X0ePqSU2f7vcuWN49Uhox5kM5L86DzjEQ
 RHXndoJkeL8LmHx8DM+kx4aZt0zVfCHwmKTkSTQoAQakLpLte7tWXIio9ZKhUGPv/eHxXEoS
 0rOOAZ6np1U/xNR82QbF9qr9TrTVI3GtVe7Vxmff+qoSAxJiZQCo5kt0YlWwti2fFI4xvkOi
 V7lyhOA3+/3oRKpZYQ86Frlo61HU3r6d9wzOwU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhW
 pOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNLSoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZ
 KXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVUcP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwp
 bV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6
 TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFU
 CSLB2AE4wXQkJbApye48qnZ09zc929df5gU6hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iS
 YBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616dtb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6g
 LxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7
 JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1cOY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0Sdu
 jWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/Jx
 IqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k
 8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoXywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjK
 yKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9j
 hQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Tad2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yop
 s302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it+OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/p
 LHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1nHzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBU
 wYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVISl73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lU
 XOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfA
 HQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4PlsZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQ
 izDiU6iOrUzBThaMhZO3i927SG2DwWDVzZltKrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gD
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20251120132213.56581-33-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QtRbEjsIfq8bTzT66vJkmbzVVV_RODIxXgzEv-NkL_0_1765796096
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/20/25 14:22, Shameer Kolothum wrote:
> From: Yi Liu <yi.l.liu@intel.com>
> 
> If user wants to expose PASID capability in vIOMMU, then VFIO would also
> need to report the PASID cap for this device if the underlying hardware
> supports it as well.
> 
> As a start, this chooses to put the vPASID cap in the last 8 bytes of the
> vconfig space. This is a choice in the good hope of no conflict with any
> existing cap or hidden registers. For the devices that has hidden registers,
> user should figure out a proper offset for the vPASID cap. This may require
> an option for user to config it. Here we leave it as a future extension.
> There are more discussions on the mechanism of finding the proper offset.
> 
> https://lore.kernel.org/kvm/BN9PR11MB5276318969A212AD0649C7BE8CBE2@BN9PR11MB5276.namprd11.prod.outlook.com/
> 
> Since we add a check to ensure the vIOMMU supports PASID, only devices
> under those vIOMMUs can synthesize the vPASID capability. This gives
> users control over which devices expose vPASID.
> 
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   hw/vfio/pci.c      | 38 ++++++++++++++++++++++++++++++++++++++
>   include/hw/iommu.h |  1 +
>   2 files changed, 39 insertions(+)


I just noticed another problem with this change. It relies on the
availability of the HostIOMMUDevice which doesn't exist with VFIO
mdev devices, such as vGPU. QEMU simply coredumps :/

We will have to check/protect QEMU in some ways. I need to take
a closer look because mdev handling seems to be spread across
the code and may need to be improved first.

Thanks,

C.

> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 8b8bc5a421..e11e39d667 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -24,6 +24,7 @@
>   #include <sys/ioctl.h>
>   
>   #include "hw/hw.h"
> +#include "hw/iommu.h"
>   #include "hw/pci/msi.h"
>   #include "hw/pci/msix.h"
>   #include "hw/pci/pci_bridge.h"
> @@ -2500,7 +2501,12 @@ static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
>   
>   static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>   {
> +    HostIOMMUDevice *hiod = vdev->vbasedev.hiod;
> +    HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
>       PCIDevice *pdev = PCI_DEVICE(vdev);
> +    uint64_t max_pasid_log2 = 0;
> +    bool pasid_cap_added = false;
> +    uint64_t hw_caps;
>       uint32_t header;
>       uint16_t cap_id, next, size;
>       uint8_t cap_ver;
> @@ -2578,12 +2584,44 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>                   pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>               }
>               break;
> +        /*
> +         * VFIO kernel does not expose the PASID CAP today. We may synthesize
> +         * one later through IOMMUFD APIs. If VFIO ever starts exposing it,
> +         * record its presence here so we do not create a duplicate CAP.
> +         */
> +        case PCI_EXT_CAP_ID_PASID:
> +             pasid_cap_added = true;
> +             /* fallthrough */
>           default:
>               pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>           }
>   
>       }
>   
> +#ifdef CONFIG_IOMMUFD
> +    /* Try to retrieve PASID CAP through IOMMUFD APIs */
> +    if (!pasid_cap_added && hiodc && hiodc->get_cap) {
> +        hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_GENERIC_HW, &hw_caps, NULL);
> +        hiodc->get_cap(hiod, HOST_IOMMU_DEVICE_CAP_MAX_PASID_LOG2,
> +                       &max_pasid_log2, NULL);
> +    }
> +
> +    /*
> +     * If supported, adds the PASID capability in the end of the PCIe config
> +     * space. TODO: Add option for enabling pasid at a safe offset.
> +     */
> +    if (max_pasid_log2 && (pci_device_get_viommu_flags(pdev) &
> +                           VIOMMU_FLAG_PASID_SUPPORTED)) {
> +        bool exec_perm = (hw_caps & IOMMU_HW_CAP_PCI_PASID_EXEC);
> +        bool priv_mod = (hw_caps & IOMMU_HW_CAP_PCI_PASID_PRIV);
> +
> +        pcie_pasid_init(pdev, PCIE_CONFIG_SPACE_SIZE - PCI_EXT_CAP_PASID_SIZEOF,
> +                        max_pasid_log2, exec_perm, priv_mod);
> +        /* PASID capability is fully emulated by QEMU */
> +        memset(vdev->emulated_config_bits + pdev->exp.pasid_cap, 0xff, 8);
> +    }
> +#endif
> +
>       /* Cleanup chain head ID if necessary */
>       if (pci_get_word(pdev->config + PCI_CONFIG_SPACE_SIZE) == 0xFFFF) {
>           pci_set_word(pdev->config + PCI_CONFIG_SPACE_SIZE, 0);
> diff --git a/include/hw/iommu.h b/include/hw/iommu.h
> index 9b8bb94fc2..9635770bee 100644
> --- a/include/hw/iommu.h
> +++ b/include/hw/iommu.h
> @@ -20,6 +20,7 @@
>   enum viommu_flags {
>       /* vIOMMU needs nesting parent HWPT to create nested HWPT */
>       VIOMMU_FLAG_WANT_NESTING_PARENT = BIT_ULL(0),
> +    VIOMMU_FLAG_PASID_SUPPORTED = BIT_ULL(1),
>   };
>   
>   #endif /* HW_IOMMU_H */


