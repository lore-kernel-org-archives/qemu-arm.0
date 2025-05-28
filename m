Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5571883njc;
        Wed, 28 May 2025 08:42:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXLNlyD8vGnwVa3e50FCPJkOC26MmTYbEwFrX1F7NGv8bjRpXgiX9KBcxvylnz95AktOVVCyvzNP+U+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHdwbiYZbmGUaUDrIZKLmzBai6Cc8s4qHI6yYcV5nyGqtASsZ0lGke7qiDerRbLSd/sbn3Y
X-Received: by 2002:a05:6214:b6b:b0:6f5:436:9e46 with SMTP id 6a1803df08f44-6fa9d01d7e5mr285364746d6.15.1748446946610;
        Wed, 28 May 2025 08:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748446946; cv=none;
        d=google.com; s=arc-20240605;
        b=gN5X4cB/6CqyFm2TKGPSLrzGT2dNxRhqw43if2LA1ODMtjbAlTwUuVWiDeVNAXr66u
         SFLNJ+yrnbBRFyeTBNmF9azF+G72GkMhuJyCqgu0xElHeAsBJOWufi9xs3EOD8f7JV9M
         9Du7ZMVqa2u3orA/eniNHiIMYJpRKXuqPZ6277kfbugHv6tW/1dpMY1xUbZ9bylmX7Us
         T4lJPBi36cs401gzo5urNhXghYEhtylbsO/jm6S6wkPKcpM+PMS45VKSdUcIGLdGPNab
         Xb477vIFccwtmP/+4GC4btPrXrWcJjjYVAlhbsSmhkVMKGviL3ZBc8lPZPZ7ueJraLTS
         lBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=JkVFHjCN69rMIYnSueLHuwO87ncH71LzvKdYlcB5jDE=;
        fh=py9nGToNxMaaWW5je+4J7K2faFFRTnrQTcy4tNgAoio=;
        b=WS4pMhXqTCFETXDFGVKwNohOHlyS8ubXm55Q7mi6kFYWeKb+brY2KmepvZV5wDJAgy
         ZYohp5oileeGW6nKv1FhmUuSWQtdMKC1+f/eGg0XzzB4nV+0gu8uc75OWyNEUKUFb8zC
         xXc2LN/Dv8wp+hwAtNB+HnTsfxHWZXtXL8v6al0nA1mWGvEBpPip3j33d9M3fA4XB7Mm
         nrpExTBAs/CqTTv8KbSw7FyKqgBfciGZ+upDStMdmQ3eWYbDouwgBQjr1jhZ9iHTnhi8
         ngTCTfLJA+koVhbBZ04r39RSu24Dgq14KlwegRdcTnKg3dp1y1Rml9HCahRnTYECgzzW
         qMXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Sf1/vDLj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac0bddb08si14262576d6.469.2025.05.28.08.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 May 2025 08:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Sf1/vDLj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKIv7-0001a2-Ii; Wed, 28 May 2025 11:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uKIv5-0001Zu-Vs
 for qemu-arm@nongnu.org; Wed, 28 May 2025 11:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uKIv4-00079u-6m
 for qemu-arm@nongnu.org; Wed, 28 May 2025 11:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748446937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JkVFHjCN69rMIYnSueLHuwO87ncH71LzvKdYlcB5jDE=;
 b=Sf1/vDLjLg4Sase7XL4gN093yGfnrycbrpKCnFICRavytGBtk3eXXzad/x3trZNuPslhaO
 FS/Rdo4zX1qRUs3z/Fj0kSJpa0x4Gd0+ObxJmfucE8QCXr3Bb6fj/5n0xXU1nwvGc+lzd9
 sJ/lYSiZk8H6+OMy65ErEVnkOMi9ogE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-x86RYHFNPkSocdpNk9Pexg-1; Wed, 28 May 2025 11:42:16 -0400
X-MC-Unique: x86RYHFNPkSocdpNk9Pexg-1
X-Mimecast-MFC-AGG-ID: x86RYHFNPkSocdpNk9Pexg_1748446935
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43efa869b19so30756035e9.2
 for <qemu-arm@nongnu.org>; Wed, 28 May 2025 08:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748446935; x=1749051735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JkVFHjCN69rMIYnSueLHuwO87ncH71LzvKdYlcB5jDE=;
 b=sUbq+C0NanS04vteq/dQSW+2wnCUZwTM/RQC7UOzxQv0DqZsjKbqqIfhmjsLLagsds
 SzBZ3ciu+5Jf2Bg/d/b3exuyYwDynMGf9KQ0lfTSu01fdEKShgA3446/NmMx2dMDfR9i
 dvuuyykklAj5VkQEqD0p7OJT9UcuOxfWruzZCkllMqjuFOl8ChbXM+cOaYzddN+L2ZNC
 Xv71Yl8870VsKCVbskFh+gyez/dR7Ox9nY11Kh5a75b5uKKHcJGjxblxtZ5hbgvIfcXr
 n7goNvVCO1nxW0ty0dar8tU5NV4Qj7hT/mZPMQJ9IfKjep4wus3oeOtaa4evmEu6AEAF
 EWXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUufXuAz3Vd8CZCZ3I/ZrEE23OAomi521oHEoAz8gNGO4Ob9VKR1Ux1b4txfssbnZyjufm4FsCcMg==@nongnu.org
X-Gm-Message-State: AOJu0YxNVy67bPms+wOOxv07d5q/ZreD5OgIVwqhGchovILJz9wSbBj4
 2eTPtRYVCKqmMrNlo4SS7XHTf/PLi8hFUO2FSneiK1wPb6to+iYukNpZ2PPiLL8DcGKubgZwns+
 WAf8vSwTHQfMts8+9oNCoBHBwoQ/VY4WB0+2SDe9w92Lg5eSbIY84tg==
X-Gm-Gg: ASbGncui3x3SQ9Icl14YQzjn6J2po5Z311J7lorjB44jHRHxZJH+JQhFh6YWCemcdAs
 DqPOjVg/lwn8/kIGZBhl7XbG/BTk2Ru0UGGJHUz0GrjbmrrR0CgrDs5Xh5Y4i5DYxyfYQ5OYcgf
 TRITCwTyhmvtTGGYB1sw08LEzg/8PV1I0R3ahkwxhhMjqx3pFZuKgrt1KOY491d/bGuVxqSoz2j
 wo9NyMFb9wpDtyvHPTf6nqWi4p8Am2U6RKhiB0aob4oV163BMv9o4zTgNvCantZGNdbP0OoCrqP
 jsD2+Jzj8FGnDQh1joJFouIEsvcc6Y39
X-Received: by 2002:a05:600c:4ecc:b0:43c:ec28:d31b with SMTP id
 5b1f17b1804b1-44c941880cbmr198078675e9.10.1748446934769; 
 Wed, 28 May 2025 08:42:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:43c:ec28:d31b with SMTP id
 5b1f17b1804b1-44c941880cbmr198078455e9.10.1748446934380; 
 Wed, 28 May 2025 08:42:14 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1dd785sm25901345e9.39.2025.05.28.08.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 08:42:13 -0700 (PDT)
Date: Wed, 28 May 2025 17:42:12 +0200
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
Subject: Re: [PATCH v9 12/20] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
In-Reply-To: <aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
 <aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RV0_f8qoqk9472BIM-uQ7qUk0CelTqIf24kjyC21iWM_1748446935
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.904,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: rms5SaIOXuJC

On Tue, 20 May 2025 08:41:31 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 10.0 and upper) or via the legacy way via an offset obtained
> from the hardware_errors firmware file.


it doesn't apply to current master anymore


> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/generic_event_device.c |  2 ++
>  hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
>  hw/core/machine.c              |  5 ++++-
>  3 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index d292f61b4e41..3cf9dab0d01a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
> +                     ghes_state.use_hest_addr, false),
>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index da3ebf403ef9..3126234e657d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
>      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
>  };
>  
> +static const AcpiNotificationSourceId hest_ghes_notify_10_0[] = {
> +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +};
> +
>  static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> @@ -947,15 +951,25 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  
>      if (vms->ras) {
>          AcpiGedState *acpi_ged_state;
> +        static const AcpiNotificationSourceId *notify;
> +        unsigned int notify_sz;
>          AcpiGhesState *ags;
>  
>          acpi_ged_state = ACPI_GED(vms->acpi_dev);
>          ags = &acpi_ged_state->ghes_state;
>          if (ags) {
>              acpi_add_table(table_offsets, tables_blob);
> +
> +            if (!ags->use_hest_addr) {
> +                notify = hest_ghes_notify_10_0;
> +                notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
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
> index b8ae155dfa11..dfd36cf063c7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -35,9 +35,12 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "audio/audio.h"
>  
> -GlobalProperty hw_compat_10_0[] = {};
> +GlobalProperty hw_compat_10_0[] = {
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> +};
>  const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
>  
>  GlobalProperty hw_compat_9_2[] = {

