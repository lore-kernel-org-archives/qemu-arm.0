Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC11EC982D6
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:04:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Eb7-0005Pv-6I; Thu, 17 Sep 2026 12:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x7Eb5-0005PB-QW
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:04:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x7Eb3-0006Vk-WE
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789661065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9mmrwX7rrp+nAEKNQR+TnszC+oD27WN8cxCUrE8893c=;
 b=TqTJHvFndrzql1nD7J6VIL734Z2skwANS7PXT8SYwlY2iETlsOCIAiB/AttLRo3bZkdH1Q
 hC1lw4VFf7i4zcVhEqVJw8KfiUThbUQTu6oQzNL5bBGYRRWaBcZ13D3hKrky8D3tey3Usf
 TObHvnXROL2qr0seX4rt+lqW0tpbwKY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-xuiiJT4PMg6psbIT00fPVQ-1; Thu, 17 Sep 2026 12:04:22 -0400
X-MC-Unique: xuiiJT4PMg6psbIT00fPVQ-1
X-Mimecast-MFC-AGG-ID: xuiiJT4PMg6psbIT00fPVQ_1789661061
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-487038bc9b8so685210f8f.2
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789661061; x=1790265861;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9mmrwX7rrp+nAEKNQR+TnszC+oD27WN8cxCUrE8893c=;
 b=OYka4lTEgEGXFlvnp5S53LerYsmvFvB0kaTKHiqG/XYlXUWkUV2UTtDaJNQG2BrOPC
 eHe059/tUjEp3K94J69QmD2bwnNFxfYnspWPHG19bZqGcZJv525sQSxTZTccKOQQNy0V
 DwaGxQIZ80B9gKn6jrDBuElzfTqv3moLcgcCsHrxPqmap0Gm92AaLF8A4AOCX4fMvru3
 AMN1e30nkJ9Cgo0jcvhfox3nGVuq/yoTbMccf4tJIbocMrAROaJqyxI+3kdWnpbBClqt
 W5s0JcfF+XM9y0Fcn30tHjSVfgyv29J87Ep9a4Pz2+sumpmkVyByoBTNPhFepGV3FqsS
 zzTA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwzwnqS6L6bJM4oBKWNdQrdx4Rt5qFdymnHdKI0jN0Z82BR67VItYlUTvOBrujeyXsDrmRAp/jJBQ==@nongnu.org
X-Gm-Message-State: AFuF++mkSdCkcca376ivSmnfYdxIWXZD19AAmG4bPkmXSh56gh7DlPWr
 9AKf9Uf7rTo45lRe7rpE7qgeJXwFZRELexKAnOtubw628Dgqu4XUTB5m3f5fnbEzdQjc9svgp8p
 itM+PvPZSEuzj8nK4EKz4p5zk6a7/twxvtYz9kYcIwBmnj+ilC/1o9g==
X-Gm-Gg: AYBFou1ovGw+KwfuBg0bB/fTbal6mpqXJQE+QYwQZ5ENgMz0rruYKSiUZepGWxnzPXE
 K9fsLT3Ds/bdkyLW7vtt3cu+6EntckWAyC+I/osEo+Qvr2/Yqq/OsaQvoOqUDBRrF2j1Cg+vlFC
 5ukLsXDes29aWZ8g3T8OkSxEp0qh3Oc9T/ufVA5n5BYJjsitR2uc/xIziKraQoRuo9rmlARQRxv
 NHOssqrl2X0x5XA2laBXoDxBydf2o+RgX4TgQzt5vO80CN3TyqOJa24oZo3MJTATwx5TPbSp5Yt
 tcYjnlG1vwe59C+Zq2ZUuf+4kkLwAL0yF6Znq6tghZYPin0DwGKN31pwP7lil2uAp07+QPFCM2m
 dHHhmZmXrKHW4EY6MwNIpktEiYaOmno95ZylMOmh2Fg==
X-Received: by 2002:a5d:64ef:0:b0:487:765:46bf with SMTP id
 ffacd0b85a97d-4870cf2080amr9058259f8f.19.1789661061273; 
 Thu, 17 Sep 2026 09:04:21 -0700 (PDT)
X-Received: by 2002:a5d:64ef:0:b0:487:765:46bf with SMTP id
 ffacd0b85a97d-4870cf2080amr9058209f8f.19.1789661060786; 
 Thu, 17 Sep 2026 09:04:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:1292:d530:e939:7a09:c368:e5d5?
 ([2a01:e0a:1292:d530:e939:7a09:c368:e5d5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1fad3sm15095107f8f.12.2026.09.17.09.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 09:04:20 -0700 (PDT)
Message-ID: <ae80ab03-fbf3-4f6e-84f8-50daa6841c8b@redhat.com>
Date: Thu, 17 Sep 2026 18:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] hw/vfio/pci: Detect a CXL Type-2 device and read
 its geometry
To: mhonap@nvidia.com, alex@shazbot.org, ankita@nvidia.com, jic23@kernel.org, 
 dave.jiang@intel.com, alejandro.lucero-palau@amd.com, smadhavan@nvidia.com,
 pierrick.bouvier@oss.qualcomm.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, pbonzini@redhat.com, eric.auger@redhat.com,
 peter.maydell@linaro.org, richard.henderson@linaro.org, cohuck@redhat.com
Cc: kjaju@nvidia.com, vsethi@nvidia.com, zhiw@nvidia.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, linux-cxl@vger.kernel.org
References: <20260916184412.3825713-1-mhonap@nvidia.com>
 <20260916184412.3825713-4-mhonap@nvidia.com>
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
In-Reply-To: <20260916184412.3825713-4-mhonap@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZEhOS2RzABVBwd-a6TtlxTGjQFNDo_HWEotONwAZQkY_1789661061
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/16/26 20:44, mhonap@nvidia.com wrote:
> From: Manish Honap <mhonap@nvidia.com>
> 
> The kernel marks a passthroughed CXL Type-2 device with a device flag and
> exposes two regions:
> - HDM memory (host physical)
> - the trapped HDM decoder register block.
> 
> Read the flag, locate both regions by type, and take the component BAR
> and block offset from the geometry capability. Realize only records this;
> later patches build the guest mapping on top.
> 
> AI-used-for: code (prototype)
> Signed-off-by: Manish Honap <mhonap@nvidia.com>

LGTM.

Thanks,

C.


> ---
>   hw/vfio/pci.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/pci.h | 15 +++++++++++
>   2 files changed, 87 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 428ab2f069..2f84af5cf8 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3570,6 +3570,64 @@ bool vfio_pci_interrupt_setup(VFIOPCIDevice *vdev, Error **errp)
>       return true;
>   }
>   
> +/*
> + * Learn the CXL geometry the kernel reports: the HPA-backed HDM memory region
> + * and the trapped HDM decoder block (which BAR carries it and at what offset).
> + * A non-CXL device leaves cxl.enabled false and takes no CXL paths.
> + */
> +static bool vfio_cxl_setup(VFIOPCIDevice *vdev, Error **errp)
> +{
> +    VFIODevice *vbasedev = &vdev->vbasedev;
> +    VFIOCXL *cxl = &vdev->cxl;
> +    struct vfio_region_info *mem_info = NULL, *comp_info = NULL;
> +    struct vfio_region_info_cap_cxl_comp_regs *cap;
> +    struct vfio_info_cap_header *hdr;
> +
> +    if (!(vbasedev->flags & VFIO_DEVICE_FLAGS_CXL)) {
> +        return true;
> +    }
> +
> +    if (vfio_device_get_region_info_type(vbasedev,
> +                                         VFIO_REGION_TYPE_PCI_VENDOR_TYPE |
> +                                         CXL_VENDOR_ID,
> +                                         VFIO_REGION_SUBTYPE_CXL_MEM,
> +                                         &mem_info)) {
> +        error_setg(errp, "vfio-cxl: %s: CXL memory region not found",
> +                   vbasedev->name);
> +        return false;
> +    }
> +
> +    if (vfio_device_get_region_info_type(vbasedev,
> +                                         VFIO_REGION_TYPE_PCI_VENDOR_TYPE |
> +                                         CXL_VENDOR_ID,
> +                                         VFIO_REGION_SUBTYPE_CXL_COMP_REGS,
> +                                         &comp_info)) {
> +        error_setg(errp,
> +                   "vfio-cxl: %s: CXL component-register region not found",
> +                   vbasedev->name);
> +        return false;
> +    }
> +
> +    hdr = vfio_get_region_info_cap(comp_info,
> +                                   VFIO_REGION_INFO_CAP_CXL_COMP_REGS);
> +    if (!hdr) {
> +        error_setg(errp,
> +                   "vfio-cxl: %s: component-register geometry not reported",
> +                   vbasedev->name);
> +        return false;
> +    }
> +    cap = container_of(hdr, struct vfio_region_info_cap_cxl_comp_regs, header);
> +
> +    cxl->mem_region_index = mem_info->index;
> +    cxl->comp_regs_region_index = comp_info->index;
> +    cxl->dpa_size = mem_info->size;
> +    cxl->comp_bar = cap->bar;
> +    cxl->hdm_offset = cap->offset;
> +    cxl->enabled = true;
> +
> +    return true;
> +}
> +
>   static void vfio_pci_realize(PCIDevice *pdev, Error **errp)
>   {
>       ERRP_GUARD();
> @@ -3700,6 +3758,20 @@ static void vfio_pci_realize(PCIDevice *pdev, Error **errp)
>           }
>       }
>   
> +    if (!vfio_cxl_setup(vdev, errp)) {
> +        /*
> +         * vfio_migration_realize() above installed a migration blocker in auto
> +         * mode (generic vfio-pci exposes no migration ops). out_deregister does
> +         * not remove it, so a rejected CXL setup would leave VM migration
> +         * blocked until QEMU restarts. Drop it here, under the same
> +         * failover-pair condition used to install it.
> +         */
> +        if (!pdev->failover_pair_id) {
> +            vfio_migration_exit(vbasedev);
> +        }
> +        goto out_deregister;
> +    }
> +
>       vfio_pci_register_err_notifier(vdev);
>       vfio_pci_register_req_notifier(vdev);
>       vfio_setup_resetfn_quirk(vdev);
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index c9ab949870..7fdd695704 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -122,10 +122,25 @@ typedef struct VFIOMSIXInfo {
>   
>   OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI_DEVICE)
>   
> +/*
> + * State for a CXL Type-2 device. The kernel owns the host physical placement
> + * of the device memory; QEMU only maps it at the guest physical address the
> + * guest commits into its endpoint HDM decoder.
> + */
> +typedef struct VFIOCXL {
> +    bool enabled;
> +    uint32_t mem_region_index;       /* HPA-backed HDM memory VFIO region */
> +    uint32_t comp_regs_region_index; /* trapped HDM decoder register block */
> +    uint32_t comp_bar;               /* component BAR carrying that block */
> +    uint64_t hdm_offset;             /* block offset within the component BAR */
> +    uint64_t dpa_size;               /* size of the HDM memory region */
> +} VFIOCXL;
> +
>   struct VFIOPCIDevice {
>       PCIDevice parent_obj;
>   
>       VFIODevice vbasedev;
> +    VFIOCXL cxl;
>       VFIOINTx intx;
>       unsigned int config_size;
>       uint8_t *emulated_config_bits; /* QEMU emulated bits, little-endian */


