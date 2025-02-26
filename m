Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp995711njg;
        Wed, 26 Feb 2025 07:52:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdek20K46GVryyYQ50o64Y0Xpesyc/dP+MhGn8behJ1R+J91oI7LoGKllrSsW1I4/hnqkweG6yFlQO+A==@linaro.org
X-Google-Smtp-Source: AGHT+IGA3rAFiesv270T0ELwvLZvw+jYL+X6yvmb4izUh2/MIw2bBuKWfTiRoMThncUWCJV610iP
X-Received: by 2002:ac8:5a92:0:b0:472:2df:6ff1 with SMTP id d75a77b69052e-4737721a964mr138020961cf.13.1740585163425;
        Wed, 26 Feb 2025 07:52:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740585163; cv=none;
        d=google.com; s=arc-20240605;
        b=Ug/3npixPrXTRfMMo0eQQT6dsJvpVEd54cLDAC5jbFwn18Ld14Uc/GHu+pqV9Go6l9
         OwjWmNlPMvwsy1wRgRylhnWzUzMamWF8Aj+exesE+dkDhQvsJDpS42SPRTColQaFTJ8l
         6RiNtogIEknfRwzS19+3bT9kfMCgI3+h7l/nDsOXVFj4Le5o3BVQ4uuLWvg+Rmm/I6O7
         EbiIbfVnEhA9BCTJpOYWu3L2qD86IlbnCpMkJSx5oClqO2PR0WaETuqYeqyQZiUUxu6N
         ipKxu9DB/1ugBgO6/6tLSQkEq+4o7RauwJ9nIJunIOIK8HuvR3PTsgjVCIxxMi1QyQdU
         PFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=8KGq5La7yk+czEiF+6Xo77Jf5JrsRdt59tbf6s0nbt8=;
        fh=h0WiLFDc49/bi35WuazsMrVfWyK7g5q1oSYIicS7Kac=;
        b=HirXTL61tIJKB3BgqFOa6Tgr56xLGYeqNFqX0uPI2PMWUr3tZCkAJcns7Q4UJJHaHC
         FutT+QAUarswG31u9E7XjCYDKj7reUrRhKWW+ZXq1j5js5mN1jDdcb7atS19xoJ8+P8i
         Kh3eo/Jdy/uM4PrZBDcSpIGZR7vP0WgOEnfYYO2b0f2eBBgQfzCBLoV1AabyN8JC+ef6
         3kcu1TxDHg2dpXVnWt2oGpQpj/rFMWK424PFxj0bHynvWYxi3+oTC5+NPPDLzr6rGIXE
         BH0Dn82Wfmno3jGX/4xHzUFS4c4fbLew47+wmnlLZMWzwb77/q8Yfzky+ZQcVXotG7a6
         jbrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VsaM3y6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47378097b8asi35897781cf.417.2025.02.26.07.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 07:52:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VsaM3y6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnJiC-00028c-83; Wed, 26 Feb 2025 10:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnJi6-00022N-C2
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 10:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnJi3-0004Fz-Nk
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 10:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740585151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KGq5La7yk+czEiF+6Xo77Jf5JrsRdt59tbf6s0nbt8=;
 b=VsaM3y6WBu5f0YE7YKG6F0hAKDzLg05LiMbidf+uZQLCFRW47rRnnsKnaB+nC5uCMF8GvR
 XZbMsZtN6931X3d1TKQmDXXdSLrGBgdnP8JvnBgpOyw3iejJZeZAEKg0FisTIxuqxbIc0t
 jsgIV7cl51e1WHlVZj8tnvRc9RoaNLA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-7Ys2lryyMHqDrp4tc59qZw-1; Wed, 26 Feb 2025 10:52:29 -0500
X-MC-Unique: 7Ys2lryyMHqDrp4tc59qZw-1
X-Mimecast-MFC-AGG-ID: 7Ys2lryyMHqDrp4tc59qZw_1740585149
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43ab4563323so10248535e9.3
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 07:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740585148; x=1741189948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KGq5La7yk+czEiF+6Xo77Jf5JrsRdt59tbf6s0nbt8=;
 b=BLObNjfA/waDMMXPK8bx3j0WBYYhKktYJkMJNx/QlJWx2kBkL3VrUntu5R6ECuXMNo
 Q+BmYaITEuMNtspXQI3LwFlf/wbmh0eS5PSeAsPePGb/FdBtzJci+GM0VE6TwTmfICfG
 e66aYNgYvH2OmEjn5/3ZZaU9c7fH9KICFzda+G1nAQa06QVqRne05rTbmucSIHGoOSHc
 tM0FsE2USggcOkzUAaJX6xkZBYpYzO5sq3yAI//KQWmkqZ7iT4EYYj9kegv+jbi8p598
 akauN3qycoW+rsB9GjvGfOMtzwGzMM/LGXJjS9SoiCXmqVIK91VlOk+E4cdQus0R+9LG
 /XZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6QrUj+6Kha4GXmg1OSBynLQ1Q4icThee6StER6D2k0TuQSglJrp66aGyLb/okamnzDEB0XT9U6Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx9GdFoHDg5o6aBvXZMz+RKg/6cB49b4QdA2U6L78+OA/uHBMOc
 eKRqVJbDEDYChCkDkJVNrELvCqQH5i7dquWrXcWOaoPOGZjE6jPipl/RaG7kR7iWWAsq0jT9ACW
 obxrYSKJCgvnkyD1biWOSOjuVPasqBxyKDiZGWP+4npLuG469WA==
X-Gm-Gg: ASbGncsDZnbPI+4+iGxWzfUSlYamqd54E7XeC6TrrEAy88xyHiJVh+q/FJy4n9nMFSE
 kVP0fYyXAAuOcvjW7XMA8d99Cou8XGUYDgbub36IeKEJTKH1IWwOMI8J1l862Cz9se4Bk/uLFdW
 pqUGKeo/ZHiwRgK/OxfHf+Sr7vRv95NuccXkbBSAncezL73i18ROQtabTe79eId6/dVvZx0CJdR
 HmMqn+WrKMZktvQcDQF2owfR1GO0IBPePBHee7rvMYFYyXK26kWuHGb3iasfJ1wc0mbGwo1QVGu
 2k8i3JBAKXCnfSZiEQuNKYwvyCteq5lnA9LygbBBApumZQycPQCJtG0K5UpBF9w=
X-Received: by 2002:a05:600c:5493:b0:439:9a40:a9ff with SMTP id
 5b1f17b1804b1-43ab0f27170mr57873625e9.1.1740585148403; 
 Wed, 26 Feb 2025 07:52:28 -0800 (PST)
X-Received: by 2002:a05:600c:5493:b0:439:9a40:a9ff with SMTP id
 5b1f17b1804b1-43ab0f27170mr57873335e9.1.1740585147976; 
 Wed, 26 Feb 2025 07:52:27 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba571274sm26036365e9.31.2025.02.26.07.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 07:52:27 -0800 (PST)
Date: Wed, 26 Feb 2025 16:52:26 +0100
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
Subject: Re: [PATCH v4 08/14] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250226165226.49b88429@imammedo.users.ipa.redhat.com>
In-Reply-To: <e9e0aafd7cc8613709171ec5d8a6d9d9be62d7c1.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
 <e9e0aafd7cc8613709171ec5d8a6d9d9be62d7c1.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G1yf3hSsfnlLM-8ocisZVkhqt0zcwjAjxINANsybF_k_1740585149
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
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
X-TUID: GBBxh3uh1Vrh

On Fri, 21 Feb 2025 15:35:17 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 10.0 and upper) or via the legacy way via an offset obtained
> from the hardware_errors firmware file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

you below set it for 9.2 to false, so
shouldn't it be set to true by default here?

>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4439252e1a75..9de51105a513 100644
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
> @@ -950,7 +954,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_dbg2(tables_blob, tables->linker, vms);
>  
>      if (vms->ras) {
> +        static const AcpiNotificationSourceId *notify;
>          AcpiGedState *acpi_ged_state;
> +        unsigned int notify_sz;
>          AcpiGhesState *ags;
>  
>          acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> @@ -959,9 +965,17 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>              ags = &acpi_ged_state->ghes_state;
>  
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

