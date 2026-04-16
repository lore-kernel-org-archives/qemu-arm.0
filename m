Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18228F8D74A
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 13:58:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDNEX-00006I-Jc; Thu, 16 Apr 2026 09:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wDNEU-0008Uq-II
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 09:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wDNES-0001Z4-Tj
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 09:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776347891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IKD367N7QPIJ9Xb11x3gNG6IhVhADp+e8qm+jlLMmZ8=;
 b=WdzdHavaLfX+ZGfs2zZL6T2wLzCDipOeNbTGGGqM/QflJ0Yl77jaB4ohP9RVBYiVTeqoDP
 gKYG6LQcRoHGdKraBYfSYWOFahOZzRjspKghqgIDR3gQkQz1Lip5Jzy3e8Vbqpez0TiRsa
 LJmw6JWlDN5yEIuZWgm7Mrt2MksgNpw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-lZE4YsBOOV6nEoBEzIA3mg-1; Thu, 16 Apr 2026 09:58:10 -0400
X-MC-Unique: lZE4YsBOOV6nEoBEzIA3mg-1
X-Mimecast-MFC-AGG-ID: lZE4YsBOOV6nEoBEzIA3mg_1776347889
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-488c2cc0cbaso47072665e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 06:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776347889; x=1776952689;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKD367N7QPIJ9Xb11x3gNG6IhVhADp+e8qm+jlLMmZ8=;
 b=SZRMjigtZ2fV99umwK5yfRP0K1gztCZiFS9huLKSAZ5apNaZsqlwOMv6rLt/WKs6rY
 zIu2zMYlqWsCB9Zl88tSdQ7JhNMjjzA7/j5Vp4Q4BFBhJzkUTUtHnT9OahcW+PNT26s7
 6ARE/Yvb1SXUuPo9BEgk/9mYvx7U8rGTMcxAs6LWmdZ6ePuZZcOJZgACABbkjUfVTPiP
 cD2/N0n5aERdh37FjvMWjvNqebYN1yvOzEDfdqU4OCyLd32s5t6y9zpYuACDwOCtTwEo
 /tf5BiZZMr5t1asEqw7X+9TAaWpTzeVg4o4LYl/3XlSOA6HiCwA/dOcxJeZa+RGZhdAE
 AdhQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/6VPmlV+8QUcl6AlmOejRG+M5I+i9NcmMR1VoTc6kxTPw6Dhsl8IYUQHK0JLvFl17YLT8OKICSZA==@nongnu.org
X-Gm-Message-State: AOJu0YwQ7NdOD/6VXrdbX0Dc/VGhblmIs8oqenqdTEPqQcIc1v4I2izC
 f2421wYFP5TjbUcwYRJyxxtU+LEra8/l8Cfe7rg4HNKRCToG7D1ABe/dggcc8sXwVVMJin9Qt4E
 dUf1EvzLjEV9y0YnQZBLaWbuW0RYPd4jXRZEXmnXpBSRX5XzrnmBxAQ==
X-Gm-Gg: AeBDieuMPIKoRD+zrP0r4QiTXJwZpaWB58PaiFHzT9AF79g351sXnCjoWiRgfyD6M3h
 592daq9ZR7ktumBwusvJDwp78MVVgz47E5S29Ry0Yi3i4KsTYC0YTk1i/WB7Af6ZWq2F77pw2dP
 cLLUbzqTlqmWHn53nER1MMH2r6bslWdoZ98wkVSdmcHag9IZk+VuP2wLM7LFj4RQoecWG3hs7qb
 atNz4pGeKXCCHgx/d25MIiqicoOY83gwN35YlCamcrFEY8LdfoPQrNvdN4tHMU8Wnk306++nNkZ
 6Koc3Hrlnt1eBqJPXTohe4OwkPB3bQ5HOrqfcCUc/UI+n0AJ5YpU4kuqaUPAoTbZsIriXknZbsF
 89Kjb0GD5UqUwLLVfy3cmAQT9j6LoDlfeJDGdDaE6B3PW3Pzz2uLA+N/cjze0
X-Received: by 2002:a05:600c:c08e:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-488d6864d41mr253711895e9.24.1776347889052; 
 Thu, 16 Apr 2026 06:58:09 -0700 (PDT)
X-Received: by 2002:a05:600c:c08e:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-488d6864d41mr253711575e9.24.1776347888564; 
 Thu, 16 Apr 2026 06:58:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f584e243sm100915595e9.10.2026.04.16.06.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 06:58:08 -0700 (PDT)
Message-ID: <2f463a23-d0c7-464c-a42c-14d9a0f60bbe@redhat.com>
Date: Thu, 16 Apr 2026 15:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] vfio/pci: Add ats property and mask ATS cap when
 not exposed
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
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
 <084d5550-c471-4d5b-8e2b-d2529a77cde8@redhat.com>
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
In-Reply-To: <084d5550-c471-4d5b-8e2b-d2529a77cde8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aDn-KjZVc9qThwvX2Hd5y_PAZ73V8l1aLeOas1HDWNE_1776347889
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 4/10/26 23:09, Cédric Le Goater wrote:
> Hello Nathan,
> 
> On 4/1/26 03:02, Nathan Chen wrote:
>> From: Nathan Chen <nathanc@nvidia.com>
>>
>> Add an "ats" OnOffAuto property to vfio-pci. When the device has an ATS
>> extended capability in config space but we should not expose it (ats=off,
>> or ats=auto and kernel reports IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED), mask
>> the capability so the guest does not see it.
>>
>> This aligns with the kernel's per-device effective ATS reporting and
>> allows omitting ATS capability when the vIOMMU has ats=off.
>>
>> Suggested-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> 
> This looks like a standalone VFIO change that could be sent independently.
> Could you please rebase on vfio-next [*] ? There are a few conflicting
> changes in this branch.
> 
> [*] https://github.com/legoater/qemu/commits/vfio-next
> 
> You will need to add a compat machine property too. This is a guest-visible
> ABI change. A separate patch would be preferred.
> 
>> ---
>>   backends/iommufd.c                 | 15 +++++++
>>   hw/vfio/pci.c                      | 63 ++++++++++++++++++++++++++++++
>>   hw/vfio/pci.h                      |  1 +
>>   include/system/host_iommu_device.h | 10 +++++
>>   4 files changed, 89 insertions(+)
>>
>> diff --git a/backends/iommufd.c b/backends/iommufd.c
>> index e1fee16acf..52cb060454 100644
>> --- a/backends/iommufd.c
>> +++ b/backends/iommufd.c
>> @@ -22,6 +22,13 @@
>>   #include "hw/vfio/vfio-device.h"
>>   #include <sys/ioctl.h>
>>   #include <linux/iommufd.h>
>> +/*
>> + * Until kernel UAPI is synced via scripts;
>> + * matches include/uapi/linux/iommufd.h
>> + */
>> +#ifndef IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED
>> +#define IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED (1 << 3)
>> +#endif
> 
> This definition is introduced by :
> 
>    https://lore.kernel.org/all/20260303150348.233997-1-skolothumtho@nvidia.com/

This is now upstream.

> It should reach Linux v7.1 since it is in linux-next. Anyhow, until then,
> please isolate this change in a temporary patch updating linux-headers/

Please use script ./scripts/update-linux-headers.sh. I would wait
for v7.1-rc1 to be tagged though.

Thanks,

C.



