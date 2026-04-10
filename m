Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D598AF459E5
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 21:10:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBJ7D-00012z-1d; Fri, 10 Apr 2026 17:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wBJ77-00010Y-4Q
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 17:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wBJ72-0004DW-5h
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 17:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775855398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HHUy+8kwOWYeTacvtnWT8uHkA9Pe9UgLvnkWe75U+xI=;
 b=EM8QdiDqprarBZVlt1Wr/aPwWZzc5/1Z8H6LIMVDI2feIzIPztzu8nh3N/j934hQ1yeS7X
 d6toOcwtMtJXDezwbT6px6e7kaDIHLE8nUM4Wf9fSsKJURrZP1XM/ntGG/c3rk8KAWY6pb
 3rBkehCWcUWlt4qAIpGI9P67tfhE7k4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-m4kcZNVsPdCoSD8QFvWJxg-1; Fri, 10 Apr 2026 17:09:57 -0400
X-MC-Unique: m4kcZNVsPdCoSD8QFvWJxg-1
X-Mimecast-MFC-AGG-ID: m4kcZNVsPdCoSD8QFvWJxg_1775855396
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-488d4ac6ff9so9896345e9.1
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 14:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775855396; x=1776460196;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHUy+8kwOWYeTacvtnWT8uHkA9Pe9UgLvnkWe75U+xI=;
 b=CV5xqlGDKApFJhKXGyVDVOUu2NxILjVFMKEwomQMd6qNpbA+gjiOK0hVrjNVGz+Cpm
 sBIzCqsl5dGmvSv1T9t03mzpetXXtSjox9KJ5yimfdZIGTXAzss8GHBpfjqzwjY/m/JN
 HqnY7/WY42EdqibWsAI/tgmYesWcnv6prW9lR4ovwcPGaIGfcjo+3oguMya8QK7l8rK1
 z3Krx5Kaif/A1tT18k/RzItpe2g5I+jQC6eT/VwKkLFQtopkBuwqRrd9KSdvj2ClW2GD
 oeZDbkBzdEpYIgrKensUHrkSxu4DkPrBoRcpFwJvwZDTGo8Jwf5/tRdq10T5/vh1lxgd
 iR/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaiqZspPh6Ti+xMiZK6FSMv/d7BEwbcufQ9OiO5PVq5LeO6SowL+sNFn+uiNi3+NzjvsewOnyXMw==@nongnu.org
X-Gm-Message-State: AOJu0YyFSPgS8LRGlNnwAGHt+s2QM05NLpFfGcGHOpPcrhge+Q1kZWo3
 mWwh8qXAvr93kSMsb8+yPvyR+5sK+qRsLT2D7HPgKFnrv/3OErVrh6lOdZuCM+LIiC9kFoj4TSr
 h/NrwEhX8SSY9ivaIVLOvS8UjrRwQD4lHnj99Zb4141QznCFH8t7rbw==
X-Gm-Gg: AeBDietwsNlsKOOU+6PGaJR3cGl2yROv2D/3TMF0rrBk2MVi9KwIKy2UQAmZO6U5GzV
 Q88HNgIDvLAouRp+V+tDkHPxMHfrFodRyL3yWlYF0EYBhBGz07q1ajSVwLn+wxr1FpYYsnalBA5
 DAqRvycerzWiyn2i+F/8806Jt1cjBsNfxqLAZueAH4hfjmW2j4gvCKWWfIv1h+UXuAYG/rQJMHo
 ZzQC3tuwmTfgE8A54W2zarPD6YtGe/n/s+8FFA1kDr6iOb/CsrU/4hOYAG10RYzA4vQQ1gexeoM
 Fri15mdRyqjwNJTUM3KE+gy+TBknjte1QwmNFfGjy5gpuNCZIBjwiot4jB5koQ8PqjQRrdn3Lpz
 iX5tqKpvOhB429mRzaLkYuNF+BmfgN0K1X84fsrA/65Sp72TLqdJLslh4AFpR
X-Received: by 2002:a05:600c:64cf:b0:485:b6dd:5066 with SMTP id
 5b1f17b1804b1-488d67ce664mr57521215e9.7.1775855395738; 
 Fri, 10 Apr 2026 14:09:55 -0700 (PDT)
X-Received: by 2002:a05:600c:64cf:b0:485:b6dd:5066 with SMTP id
 5b1f17b1804b1-488d67ce664mr57520865e9.7.1775855395172; 
 Fri, 10 Apr 2026 14:09:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5934a6dsm104887685e9.11.2026.04.10.14.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 14:09:54 -0700 (PDT)
Message-ID: <084d5550-c471-4d5b-8e2b-d2529a77cde8@redhat.com>
Date: Fri, 10 Apr 2026 23:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] vfio/pci: Add ats property and mask ATS cap when
 not exposed
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex@shazbot.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260401010231.4166776-1-nathanc@nvidia.com>
 <20260401010231.4166776-5-nathanc@nvidia.com>
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
In-Reply-To: <20260401010231.4166776-5-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6UEi4L8sPVArJlv9Pck7RQxWhMUqGxiI9IUcWQSvaWM_1775855396
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hello Nathan,

On 4/1/26 03:02, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
> 
> Add an "ats" OnOffAuto property to vfio-pci. When the device has an ATS
> extended capability in config space but we should not expose it (ats=off,
> or ats=auto and kernel reports IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED), mask
> the capability so the guest does not see it.
> 
> This aligns with the kernel's per-device effective ATS reporting and
> allows omitting ATS capability when the vIOMMU has ats=off.
> 
> Suggested-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>

This looks like a standalone VFIO change that could be sent independently.
Could you please rebase on vfio-next [*] ? There are a few conflicting
changes in this branch.

[*] https://github.com/legoater/qemu/commits/vfio-next

You will need to add a compat machine property too. This is a guest-visible
ABI change. A separate patch would be preferred.

> ---
>   backends/iommufd.c                 | 15 +++++++
>   hw/vfio/pci.c                      | 63 ++++++++++++++++++++++++++++++
>   hw/vfio/pci.h                      |  1 +
>   include/system/host_iommu_device.h | 10 +++++
>   4 files changed, 89 insertions(+)
> 
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index e1fee16acf..52cb060454 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -22,6 +22,13 @@
>   #include "hw/vfio/vfio-device.h"
>   #include <sys/ioctl.h>
>   #include <linux/iommufd.h>
> +/*
> + * Until kernel UAPI is synced via scripts;
> + * matches include/uapi/linux/iommufd.h
> + */
> +#ifndef IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED
> +#define IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED (1 << 3)
> +#endif

This definition is introduced by :

   https://lore.kernel.org/all/20260303150348.233997-1-skolothumtho@nvidia.com/

It should reach Linux v7.1 since it is in linux-next. Anyhow, until then,
please isolate this change in a temporary patch updating linux-headers/

>   static const char *iommufd_fd_name(IOMMUFDBackend *be)
>   {
> @@ -573,6 +580,13 @@ static int hiod_iommufd_get_cap(HostIOMMUDevice *hiod, int cap, Error **errp)
>       }
>   }
>   
> +static bool hiod_iommufd_support_ats(HostIOMMUDevice *hiod)
> +{
> +    HostIOMMUDeviceCaps *caps = &hiod->caps;
> +
> +    return !(caps->hw_caps & IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED);
> +}
> +
>   static bool hiod_iommufd_get_pasid_info(HostIOMMUDevice *hiod,
>                                           PasidInfo *pasid_info)
>   {
> @@ -595,6 +609,7 @@ static void hiod_iommufd_class_init(ObjectClass *oc, const void *data)
>   
>       hioc->get_cap = hiod_iommufd_get_cap;
>       hioc->get_pasid_info = hiod_iommufd_get_pasid_info;
> +    hioc->support_ats = hiod_iommufd_support_ats;
>   };
>   
>   static const TypeInfo types[] = {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 1945751ffd..2d408e1d9a 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -49,6 +49,10 @@
>   #include "system/iommufd.h"
>   #include "vfio-migration-internal.h"
>   #include "vfio-helpers.h"
> +#ifdef CONFIG_IOMMUFD
> +#include "system/host_iommu_device.h"
> +#include "linux/iommufd.h"
> +#endif
>   
These includes are not necessary.

>   /* Protected by BQL */
>   static KVMRouteChange vfio_route_change;
> @@ -2550,10 +2554,53 @@ static bool vfio_pci_synthesize_pasid_cap(VFIOPCIDevice *vdev, Error **errp)
>       return true;
>   }
>   
> +/*
> + * Determine whether ATS capability should be advertised for @vdev, based on
> + * whether it was enabled on the command line and whether it is supported
> + * according to the kernel's IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED bit.
> + *
> + * Store whether ATS capability should be advertised in @ats_need.
> + *
> + * Return false if kernel enables IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED
> + * and ATS is effectively unsupported.
> + */
> +static bool vfio_pci_ats_requested_and_supported(VFIOPCIDevice *vdev,
> +                                                 bool *ats_need, Error **errp)

May be rename 'ats_need' to 'ats' or 'ats_needed'

> +{
> +    HostIOMMUDevice *hiod = vdev->vbasedev.hiod;
> +    HostIOMMUDeviceClass *hiodc;
> +    bool ats_supported;
> +
> +    if (vdev->ats == ON_OFF_AUTO_OFF) {
> +        *ats_need = false;
> +        return true;
> +    }
> +
> +    *ats_need = true;
> +    if (!hiod) {
> +        return true;
> +    }
> +    hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
> +    if (!hiodc || !hiodc->support_ats) {
> +        return true;
> +    }
> +
> +    ats_supported = hiodc->support_ats(hiod);
> +    if (vdev->ats == ON_OFF_AUTO_ON && !ats_supported) {
> +        error_setg(errp, "vfio: ATS requested but not supported by kernel");

hmm, I wonder if we shouldn't fail to realize the device and stop the VM
in this case (ats requested + no support).

> +        *ats_need = false;
> +        return false;
> +    }
> +
> +    *ats_need = ats_supported;
> +    return true;
> +}
> +
>   static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>   {
>       PCIDevice *pdev = PCI_DEVICE(vdev);
>       bool pasid_cap_added = false;
> +    bool ats_needed = false;
>       Error *err = NULL;
>       uint32_t header;
>       uint16_t cap_id, next, size;
> @@ -2603,6 +2650,11 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>       pci_set_long(pdev->wmask + PCI_CONFIG_SPACE_SIZE, 0);
>       pci_set_long(vdev->emulated_config_bits + PCI_CONFIG_SPACE_SIZE, ~0);
>   
> +    if (!vfio_pci_ats_requested_and_supported(vdev, &ats_needed, &err)) {
> +        error_report_err(err);
> +       err = NULL;

indent error

> +    }
> +
>       for (next = PCI_CONFIG_SPACE_SIZE; next;
>            next = PCI_EXT_CAP_NEXT(pci_get_long(config + next))) {
>           header = pci_get_long(config + next);
> @@ -2640,6 +2692,16 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>           case PCI_EXT_CAP_ID_PASID:
>               pasid_cap_added = true;
>               /* fallthrough */

This change is coupling the PASID and ATS capabilities. Is this intended ?


> +        case PCI_EXT_CAP_ID_ATS:
> +            /*
> +             * If ATS is requested and supported according to the kernel, add
> +             * the ATS capability. If not supported according to the kernel or
> +             * disabled on the qemu command line, omit the ATS cap.
> +             */
> +            if (ats_needed) {
> +                pcie_add_capability(pdev, cap_id, cap_ver, next, size);
> +            }
> +            break;
>           default:
>               pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>           }
> @@ -3819,6 +3881,7 @@ static const Property vfio_pci_properties[] = {
>   #ifdef CONFIG_IOMMUFD
>       DEFINE_PROP_LINK("iommufd", VFIOPCIDevice, vbasedev.iommufd,
>                        TYPE_IOMMUFD_BACKEND, IOMMUFDBackend *),
> +    DEFINE_PROP_ON_OFF_AUTO("ats", VFIOPCIDevice, ats, ON_OFF_AUTO_AUTO),

conflicts with vfio-next

>   #endif
>       DEFINE_PROP_BOOL("skip-vsc-check", VFIOPCIDevice, skip_vsc_check, true),
>       DEFINE_PROP_UINT16("x-vpasid-cap-offset", VFIOPCIDevice,
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index d6495d7f29..514a9197ce 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -191,6 +191,7 @@ struct VFIOPCIDevice {
>       VFIODisplay *dpy;
>       Notifier irqchip_change_notifier;
>       VFIOPCICPR cpr;
> +    OnOffAuto ats;
>   };
>   
>   /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
> diff --git a/include/system/host_iommu_device.h b/include/system/host_iommu_device.h
> index f000301583..44c56e87bb 100644
> --- a/include/system/host_iommu_device.h
> +++ b/include/system/host_iommu_device.h

Please add to your .git/config :

[diff]
	orderFile = /path/to/qemu/scripts/git.orderfile


> @@ -133,6 +133,16 @@ struct HostIOMMUDeviceClass {
>        * Returns: true on success, false on failure.
>        */
>       bool (*get_pasid_info)(HostIOMMUDevice *hiod, PasidInfo *pasid_info);
> +    /**
> +     *  @support_ats: Return whether ATS is supported for the device
> +     *  associated with @hiod host IOMMU device, checking if the
> +     *  IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED capability bit is set.
> +     *
> +     *  @hiod: handle to the host IOMMU device
> +     *
> +     *  Returns: true on success, false on failure

  "Returns: true if ATS is supported, false otherwise"

> +     */
> +    bool (*support_ats)(HostIOMMUDevice *hiod);
>   };
>   
>   /*


I would split this patch in 4 parts :

- linux-headers/ v7.1 update
- support_ats() handler introduction and iommufd implementation
- "ats" property addition
- compat property fixup

Thanks,

C.


