Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AA8EE36B6
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 17:54:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqatp-000477-7Q; Thu, 12 Feb 2026 12:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqath-00044r-Ij
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 12:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqatf-0005eh-K2
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 12:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770918874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSEA8OncxrNUG9f4Lg3BCN0+IwEH1LSh6Oan66nr+VQ=;
 b=LCICeaLXtR8kskkMePSIjfDlpzgJzQOFjfsAzWs1rVmfEQ5dHfCMKNQtLjHbvwX5L0AYIw
 9OYPwKfluWyJXj2Gyhok9t2bVi+perzNEythIJL6RfVJKlXY/OeeTL8QxqcThAsvrWGI6F
 iraAkkLFD9VWeRgtl5ianP2VNSiLWRc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-suOKCUD5MEyaYc73y5NPmw-1; Thu, 12 Feb 2026 12:54:31 -0500
X-MC-Unique: suOKCUD5MEyaYc73y5NPmw-1
X-Mimecast-MFC-AGG-ID: suOKCUD5MEyaYc73y5NPmw_1770918870
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4804157a3c9so3927515e9.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 09:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770918870; x=1771523670;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSEA8OncxrNUG9f4Lg3BCN0+IwEH1LSh6Oan66nr+VQ=;
 b=TejfZ545vx2GSrF5M+YBIl0dwBvvWFsMeXXOGMM+IY052vE72fOx+b4I77cjliO+v7
 wJbSWY5K/ht/y8ejny+2fvBvZ53c9I+E8eP3bpxCGAaT2WiKjtNXYgE7HhLtjpSnIU2j
 gLrpbvSZ1SmEzA/ErGDbEr9xAsFUz+NAq0amfWY7Xdp9bKOuXUswY8sf4r4EIs5UTQlD
 z8dXE8whOig+G1c90whic31pgIGUgap8lLykctnF44ESx/ZNCspYTMqeI95bB++EXLDo
 vgifoEeqbtcsO/xStIjz3ZH6ngr54RFSaa4jlfP3swbUjCnRFF44WxnKZQyBzqKeFimd
 so/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXry8ByOJm5cJZGQCldlASYEsWmcz0b6A1C9ji/uxfv2T7ntpaYNqnwrKfT0GGgskHOdKhNbThfxQ==@nongnu.org
X-Gm-Message-State: AOJu0YxhknE/r21gBYaFpZ3byXqmvVJ2rjpeOMm1R3eRHGufJhzo+hoV
 r9D0TX8Rg1YSYBp7CRjXIq0wr0dHmTCzwXjbsK+chsf1g3mqxN74+TjS+tIvH7pr0rrIY1LRo5Y
 bBTMfFT84MB0ubiiQ52SpwI01Bla1w4mLIW/niqsCZ5EO0pIPx/MmHQ==
X-Gm-Gg: AZuq6aL3UDyTcxV+k15xYPGhn828z8erqBDKOYj2hAnQQd9hYiS6rVKTgAr6fvuX6wX
 EN0tC4sQzk8NMY2QSp87vhPbQB9joBN0exfXeWmE/0MhjmibWnhBqjrcSc+QfsQW3lWSJ5WHdiR
 eQb8xEEH1nCJSPvUxW00AGvy9nc1Af+2TAJLIRghSqh31bqFhVpdwJFO3+z9r3hYKijQn04o9u2
 ds0u66b5/b9uHz0kDyIeXZf6+pXifaj89T2vbigx6R4awY+sd0LkXPsOvM9kl9NDOzr4ItD7sip
 WDRpbooDEqJKaJvQ+qAy8GMrvMbQ3JemDQz5m8Nf/pwI+8EroZ2UP1+oSJXfr6BmASEU+5x0zX6
 xluhWPfX/WyQv4KtnJGc606zZR2RrTbx3S/XuRBhYFsfwRAJew9Z9dogRdNsDR3mKM+0e6Q==
X-Received: by 2002:a05:6000:420b:b0:435:ab34:93bb with SMTP id
 ffacd0b85a97d-4378aa017d7mr6802863f8f.12.1770918869856; 
 Thu, 12 Feb 2026 09:54:29 -0800 (PST)
X-Received: by 2002:a05:6000:420b:b0:435:ab34:93bb with SMTP id
 ffacd0b85a97d-4378aa017d7mr6802822f8f.12.1770918869419; 
 Thu, 12 Feb 2026 09:54:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e39c6asm13085063f8f.28.2026.02.12.09.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 09:54:29 -0800 (PST)
Message-ID: <3fe1a6d6-8fa9-4fed-a46f-872f1b3ddbf3@redhat.com>
Date: Thu, 12 Feb 2026 18:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/24] hw/arm/smmuv3: Add per-device identifier
 poroperty
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-23-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-23-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gui1E86OyBNH-hyJiWPVX2iUfW7hDOdQA32KcIs6RpA_1770918870
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> Add an "identifier" property to the SMMUv3 device and use it when
> building the ACPI IORT SMMUv3 node Identifier field.

typo in the title.

I don't understand what does mandate that change? We already have an
identifier set in the IORT table. The rationale behind that patch needs
to be clarified

Thanks

Eric
>
> This avoids relying on enumeration order and provides a stable
> per-device identifier. This is useful when we add support for
> Tegra241 CMDQV DSDT in subsequent patch.
>
> No functional change intended.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3.c          | 1 +
>  hw/arm/virt-acpi-build.c | 4 +++-
>  hw/arm/virt.c            | 3 +++
>  include/hw/arm/smmuv3.h  | 1 +
>  4 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7858bf2c33..7f84c87a46 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2114,6 +2114,7 @@ static const Property smmuv3_properties[] = {
>       * Defaults to stage 1
>       */
>      DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> +    DEFINE_PROP_UINT8("identifier", SMMUv3State, identifier, 0),
>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
>      /* GPA of MSI doorbell, for SMMUv3 accel use. */
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ae3b4aac52..046e930ca5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -342,6 +342,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>  typedef struct AcpiSMMUv3Dev {
>      int irq;
>      hwaddr base;
> +    uint8_t id;
>  
>      /*
>       * IORT-only fields.
> @@ -407,6 +408,7 @@ static int iort_smmuv3_devices(Object *obj, void *opaque)
>      bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
>      sdev.accel = object_property_get_bool(obj, "accel", &error_abort);
>      sdev.ats = object_property_get_bool(obj, "ats", &error_abort);
> +    sdev.id = object_property_get_uint(obj, "identifier", &error_abort);
>      pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
>      sbdev = SYS_BUS_DEVICE(obj);
>      sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> @@ -642,7 +644,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                       (ID_MAPPING_ENTRY_SIZE * smmu_mapping_count);
>          build_append_int_noprefix(table_data, node_size, 2); /* Length */
>          build_append_int_noprefix(table_data, 4, 1); /* Revision */
> -        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
> +        build_append_int_noprefix(table_data, sdev->id, 4); /* Identifier */
>          /* Number of ID mappings */
>          build_append_int_noprefix(table_data, smmu_mapping_count, 4);
>          /* Reference to ID Array */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 390845c503..22ee5c4a41 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3059,12 +3059,15 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                         (vms->legacy_smmuv3_present) ?
>                         "iommu=smmuv3" : "virtio-iommu");
>          } else if (vms->iommu == VIRT_IOMMU_NONE) {
> +            static uint8_t id;
> +
>              /* The new SMMUv3 device is specific to the PCI bus */
>              object_property_set_bool(OBJECT(dev), "smmu_per_bus", true, NULL);
>              object_property_set_link(OBJECT(dev), "memory",
>                                       OBJECT(vms->sysmem), NULL);
>              object_property_set_link(OBJECT(dev), "secure-memory",
>                                       OBJECT(vms->secure_sysmem), NULL);
> +            object_property_set_uint(OBJECT(dev), "identifier", id++, NULL);
>          }
>          if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
>              hwaddr db_start = 0;
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 87926f8cb3..39cb43506e 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -63,6 +63,7 @@ struct SMMUv3State {
>      qemu_irq     irq[4];
>      QemuMutex mutex;
>      char *stage;
> +    uint8_t identifier;
>  
>      /* SMMU has HW accelerator support for nested S1 + s2 */
>      bool accel;


