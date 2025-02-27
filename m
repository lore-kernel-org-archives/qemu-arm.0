Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp221234njb;
        Thu, 27 Feb 2025 05:33:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpKm4c+ESDYCZ23ZcTTZU71VsyKirLsDZVXup12iCwRbOnFD9P6ZiezWDsiJeRWnZ6jDpd78P6a5Ngaw==@linaro.org
X-Google-Smtp-Source: AGHT+IGG9L49VRGcp+Yi07vp0xtzTxBmuZ26AqTnYF9jRr9ehuaOJr4qDoxWzMZY/i9LZkL6bi08
X-Received: by 2002:a05:620a:2a0f:b0:7c0:c24a:ccab with SMTP id af79cd13be357-7c23be2410dmr1479674685a.28.1740663233695;
        Thu, 27 Feb 2025 05:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740663233; cv=none;
        d=google.com; s=arc-20240605;
        b=ih86Yz7GE6LZuVFdJFFI1uKS/RdXCiTz2c1TV7C9ZLob8Q3RlCN+D5zym0K61TXOz0
         rK3SHuo/kX3kNf/8QTr8NbZWIUk9GXDtqSAF/QVrMFP1Z2QLKAAPToesT/YkAK/vDupC
         150kC5ah72LxqAFGjs5hnqz0dXwgjpiOW8r+/P8xTz+nJxjdyoiEcw7mJ+jZUC8skIlh
         NLHqGHU22I7vKhjFMj6OAS+596XD5k6fX1nokMkShpEPwegJMuXpGGW5/3d0A0HMA2a3
         inFhnbYb8GkiYe20sIKvl9xYag0RZCGM2twmWmahrerJv56qHd9z7/R9ef+RUTwqREkz
         LB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=HuW0BIbjNJWghJa21XE54H5m1b+Yluf4uBw+NY/1p34=;
        fh=OwFzZro0STMSd2PkVy513TJUecD+oyoA7lQ5XhPa65M=;
        b=VFER9j7vN6R84CWNnZgkjQLa6iQQwWQbChcRZ4l3A+u8CpCyyCK1z56u8iKuvf19/z
         Fj8Tn7GYGVoS6YipiGg7UHkfFLBVahRm4MKWR3uXrQgHSucBsa2wreJ9q9CZu4C3gU6W
         JRknwgN3KqLLBdLP3z92kvtgkKH50lM4lz38KvgPaC2iz2gO2JZe7wKdpKPepWlWiRwU
         RQl0Sxo601ZGFZzOYZ0OZguD56/ZxsqDZIX5YxavRC98gL7Cgi5wbMqhpbWLuZy3NUJM
         Z2gpm634J38XPWopjkh6Wp5DY3+G73+1+ck0aCg5Z4zngzMMMaTU6KeO/yTDmy9iS6mN
         4b6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S0MKc0GM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378db3a7asi125563485a.629.2025.02.27.05.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 05:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S0MKc0GM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tne10-0004P1-5l; Thu, 27 Feb 2025 08:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tne0t-0004OC-36
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:33:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tne0r-0003B2-F1
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740663195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuW0BIbjNJWghJa21XE54H5m1b+Yluf4uBw+NY/1p34=;
 b=S0MKc0GMHmat4pszZAw83BLkTnSEPd0xWvLoqrpObLEeta0+8MZMsIZuPr2C+GSLTIVbFK
 yR/PWIwn3QYmPwEaMxKysflqWzIU9y/TDWucJ+jmXSYUjjTM9IapLcgRpQSg9jTKFqm4r+
 A9Bm8C2jkffOlo6xZUhKBheoqkwBGZs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-33Hbi0kbNvGcJvNIYn58kA-1; Thu, 27 Feb 2025 08:33:14 -0500
X-MC-Unique: 33Hbi0kbNvGcJvNIYn58kA-1
X-Mimecast-MFC-AGG-ID: 33Hbi0kbNvGcJvNIYn58kA_1740663193
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-abb61c30566so88338666b.2
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 05:33:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740663192; x=1741267992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HuW0BIbjNJWghJa21XE54H5m1b+Yluf4uBw+NY/1p34=;
 b=mGTO8nzmxaP6zLvuN5emSviLe/HbBh3DffeV4N6ajGjXDfcPG6xmVHOiq3+xzDWncG
 os7triCMQkcvzd94CXZfJ7QAx5vRL9cFsbD31NMbrZq+DoXWSyK6SDCch5zMJ9alTC0z
 ngoad+vzzYrp+J0oAvHvpROCJ2TvtEMDY88xR55kF8upI6clkDTr0eWnjWyqyD/6JxuR
 SS7tKhsazfJ1UXiU9N4Nw7OMQZTuCmNRpVi/X3DFhiSkAx7xNWukNKFr7fxfqxSNg+eA
 Tgr7vUVXE+RdcmGwKHSG1v1yRhMofgu/qoFG+wN5PJyp53A2t+RbZDGpztFuS0rTbNH5
 hF2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUldOQs7eKJ0udvFGkf00IYn7PF8Z3Ks8TvGpkkN/KTsxIwKqOBfzyq5psWJbFcOA32rTk04UZYSw==@nongnu.org
X-Gm-Message-State: AOJu0Yxurl9qYk71+B7hrtYgsBlEj+DMTMG3foJdugTI0+sFMuYHIIiT
 63ugQThPAbMnpKzm5FjGdpP4glsP6+2evpWycIRYKCWgAypve/2e5Wp3ZgGZ1uS8dAxaZetpPtW
 vky3CFIlp4lf0g1DPTvBX2MrdqPuqeuUhp3IOC+NFo2b/1WmBKCkwOXgwnA==
X-Gm-Gg: ASbGncu21JomZO3sRC4lJzo9zt85a5bbXI2u1PLkoGbBV66CGe36aag7kro75wK1jHN
 okKD1X7pT65OUj0Rcp883YxJiZ7Nv06SRxLLo4T8ERyTuMvHcsfotvpepRbNNUeJjMMOfn1Ggcb
 8yN9vCJQIarQ4VRRiancxDCJbWO9WM1q3WeJj9/Rtvgc8tEm1e3v9VHSAIFbAN4vTYev7341Nm+
 T+hAp4/mG01NFunXLiTA2GxmhMNXCuX5ZZ9ctmxaPyUf+41MoZQWpxd05WrqRDoneX4fNZQ0f5w
 5Z3NNwZ2kOCTos2MdJcAdBG4bxps8c7+XvlCWCdjKu+5VcqjM2ximq4ka8fkQEM=
X-Received: by 2002:a17:906:c102:b0:abf:692:40bd with SMTP id
 a640c23a62f3a-abf069269e7mr507684666b.43.1740663192436; 
 Thu, 27 Feb 2025 05:33:12 -0800 (PST)
X-Received: by 2002:a17:906:c102:b0:abf:692:40bd with SMTP id
 a640c23a62f3a-abf069269e7mr507680666b.43.1740663191987; 
 Thu, 27 Feb 2025 05:33:11 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf1bef130esm57685066b.40.2025.02.27.05.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 05:33:11 -0800 (PST)
Date: Thu, 27 Feb 2025 14:33:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/21] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250227143310.3df0687f@imammedo.users.ipa.redhat.com>
In-Reply-To: <73e0b70ed4125dc07a85fb43281a7731f452750e.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
 <73e0b70ed4125dc07a85fb43281a7731f452750e.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dVPkyadf0Al5hV87tA59H46QiMv1aQQvV0komUxv3qY_1740663193
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: fQa0/o8yku+m

On Thu, 27 Feb 2025 12:03:42 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 10.0 and upper) or via the legacy way via an offset obtained
> from the hardware_errors firmware file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

with checkpatch issues fixed
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/generic_event_device.c |  1 +
>  hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
>  hw/core/machine.c              |  2 ++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 5346cae573b7..14d8513a5440 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),
>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index af5056201c22..03ee30b3b3f0 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -897,6 +897,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
>      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
>  };
>  
> +static const AcpiNotificationSourceId hest_ghes_notify_9_2[] = {
> +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +};
> +
>  static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> @@ -951,6 +955,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  
>      if (vms->ras) {
>          AcpiGedState *acpi_ged_state;
> +        static const AcpiNotificationSourceId *notify;
> +        unsigned int notify_sz;
>          AcpiGhesState *ags;
>  
>          acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> @@ -958,9 +964,17 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>          ags = &acpi_ged_state->ghes_state;
>          if (ags) {
>              acpi_add_table(table_offsets, tables_blob);
> +
> +            if (!ags->use_hest_addr) {
> +                notify = hest_ghes_notify_9_2;
> +                notify_sz = ARRAY_SIZE(hest_ghes_notify_9_2);
> +            } else {
> +                notify = hest_ghes_notify;
> +                notify_sz = ARRAY_SIZE(hest_ghes_notify);
> +            }
> +
>              acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> -                            tables->linker, hest_ghes_notify,
> -                            ARRAY_SIZE(hest_ghes_notify),
> +                            tables->linker, notify, notify_sz,
>                              vms->oem_id, vms->oem_table_id);
>          }
>      }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 02cff735b3fb..7a11e0f87b11 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -34,6 +34,7 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "audio/audio.h"
>  
>  GlobalProperty hw_compat_9_2[] = {
> @@ -43,6 +44,7 @@ GlobalProperty hw_compat_9_2[] = {
>      { "virtio-balloon-pci-non-transitional", "vectors", "0" },
>      { "virtio-mem-pci", "vectors", "0" },
>      { "migration", "multifd-clean-tls-termination", "false" },
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
>  };
>  const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
>  

