Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE0BFCA16D
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 18:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzf5G-0002m5-Cn; Mon, 09 Mar 2026 14:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzf5A-0002Qf-Nh
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 14:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzf56-0007lX-FF
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 14:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773079911;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mj3P97yb9RRx48ItIGxujBywEF12DLHwJ6aUKmQbRlY=;
 b=aekcRw4DgzohWWAIp0z1gahBteuSQOWtYyzq5fizSifiVQIScntr33Ha8GGNFC0Cf/LvEg
 1xrnO+ycymHHAEpwV270OwlL5kTmNDPWJjKIihvjECLOkE9+Lv7gg0ACkgBrpBZU6cCylY
 t7KfNT9XI61eNRhR/K/4MitsMjdLEok=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-c7EM6MiUM6-rxa-eicuyEw-1; Mon, 09 Mar 2026 14:11:50 -0400
X-MC-Unique: c7EM6MiUM6-rxa-eicuyEw-1
X-Mimecast-MFC-AGG-ID: c7EM6MiUM6-rxa-eicuyEw_1773079908
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439ab866bc1so10687473f8f.2
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 11:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773079908; x=1773684708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mj3P97yb9RRx48ItIGxujBywEF12DLHwJ6aUKmQbRlY=;
 b=rIo8pJlpYv1T0Lx/n4zi9LaVezEYZU736AV2o8ydh+D1JOwtKaGZHx7x1z1swsbOEU
 /B/pLZj+R8oLcTaAXJdtsyzs9e7rfhRFMj5FCsHsIka2QTSVbSPbCc68jQVWdqLJ6nlW
 cPde8W5qkvvjgyCsg4NIszAtHtSMZn0x4pOAW7wqcGxz+K6/vdJZN44wJGGxqrte5CNg
 3nVeIOVBb9bvEXLCX6VJ/JJA7MQ4s75MW6GygseXV6Uv4u1k6gEm+mm6Xmp+IgyT+5Wu
 DLGz7C/o1QxT6bte6t9DDnjqWiLl+Cn7DhURd+nmKi0sUUCNQLlc1t6SCMB4LuckQg8U
 XHiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4WmbK5Muv1/Dsk5I3oLjxzqq/mPK1tICHLnvCMNmHOSIDAVkH0AqKYdyxiW14oC6xKzFHOXz2AQ==@nongnu.org
X-Gm-Message-State: AOJu0YzhuWR8hSXlNQhdwBcSY1JNLuK4ZnJk5FT9ke98kP68EH4+TDfb
 2JDDtSaiF1sxKVipFrRF9bKuFEemMNfC+ICFBA9ykaq9NwbS+ebBS8Qa1JGO09u5bSbJeaNCRrW
 qi3J92eTXY48Si/wXpV/RiRwUVLPQT5m/I77rHnncaH96BHUpJKKnug==
X-Gm-Gg: ATEYQzw4X39GbRkItkjae/bU9CMhBKSnD58JJbm2GtwlyvJhYY9CLRN1TZmgSufssqT
 bJpdVJKDO8ta6fIXG2W0AMQEkoS0Qk2ndWjCytzxZQt9yFs6n/ozuhOPKhfyF4Ce0CjG5HF0p5t
 bIfmQCQ9RyVv6togHxkxt+yuObVed0i0zPU9w+Ud9xYKRT2pAONau4TGHYrynRjVEP3ifNGVQM3
 jiAThRHWfq4e0Ohezkj5rxW+6EqNF0Wy5J+g5zzTQiC3VvNJZoPQ6Nl39R4Ua0PbwPQORJFz7zm
 BFmA3IBjqakD178bNBaKJK+sgMkU5HK8wqiJAyFI/2oAgSuI/FO35i8LJQBsVjjc8ViOLw3FQXS
 2B6uAk52AYil0uYdHTH9olZ4s8t3JZfNCju6jXyZP9xjmFIMJ9vnRZ8E6XWdhSKYMd8sqTw==
X-Received: by 2002:a05:600c:3109:b0:485:3c05:24dc with SMTP id
 5b1f17b1804b1-4853c05278amr61794045e9.33.1773079907679; 
 Mon, 09 Mar 2026 11:11:47 -0700 (PDT)
X-Received: by 2002:a05:600c:3109:b0:485:3c05:24dc with SMTP id
 5b1f17b1804b1-4853c05278amr61793615e9.33.1773079907172; 
 Mon, 09 Mar 2026 11:11:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541aa73easm8520175e9.3.2026.03.09.11.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 11:11:46 -0700 (PDT)
Message-ID: <2e990df5-4b9b-49ff-b479-2317e60fdc3a@redhat.com>
Date: Mon, 9 Mar 2026 19:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/32] hw/arm/smmuv3: Add per-device identifier property
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-29-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-29-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qHv5uoVwO2tB7K8veKGLGhXEG038E3xMOg2Uzezsk4E_1773079908
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Shameer,

On 2/26/26 11:50 AM, Shameer Kolothum wrote:
> Add an "identifier" property to the SMMUv3 device and use it when
> building the ACPI IORT SMMUv3 node Identifier field.
>
> This avoids relying on device enumeration order and provides a stable
> per-device identifier. A subsequent patch will use the same identifier
> when generating the DSDT description for Tegra241 CMDQV, ensuring that
> the IORT and DSDT entries refer to the same SMMUv3 instance.
>
> No functional change intended.
besides changes the IORT table
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  include/hw/arm/smmuv3.h  | 1 +
>  hw/arm/smmuv3.c          | 2 ++
>  hw/arm/virt-acpi-build.c | 4 +++-
>  hw/arm/virt.c            | 3 +++
>  4 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 648412cafc..73b8f39aaa 100644
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
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 468135bb24..c1f84bedd4 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2109,6 +2109,8 @@ static const Property smmuv3_properties[] = {
>       * Defaults to stage 1
>       */
>      DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> +    /* Identifier used for ACPI IORT SMMUv3 (and DSDT for CMDQV) generation */
> +    DEFINE_PROP_UINT8("identifier", SMMUv3State, identifier, 0),
>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
>      /* GPA of MSI doorbell, for SMMUv3 accel use. */
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ae78e9b9e0..20605185c5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -342,6 +342,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>  typedef struct AcpiIortSMMUv3Dev {
>      int irq;
>      hwaddr base;
> +    uint8_t id;
>      GArray *rc_smmu_idmaps;
>      /* Offset of the SMMUv3 IORT Node relative to the start of the IORT */
>      size_t offset;
> @@ -404,6 +405,7 @@ static int populate_smmuv3_dev(GArray *sdev_blob, VirtMachineState *vms)
>                                                 &error_abort));
>          sdev.accel = object_property_get_bool(obj, "accel", &error_abort);
>          sdev.ats = object_property_get_bool(obj, "ats", &error_abort);
> +        sdev.id = object_property_get_uint(obj, "identifier", &error_abort);
>          pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
>          sbdev = SYS_BUS_DEVICE(obj);
>          sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> @@ -630,7 +632,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                       (ID_MAPPING_ENTRY_SIZE * smmu_mapping_count);
>          build_append_int_noprefix(table_data, node_size, 2); /* Length */
>          build_append_int_noprefix(table_data, 4, 1); /* Revision */
> -        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
> +        build_append_int_noprefix(table_data, sdev->id, 4); /* Identifier */
>          /* Number of ID mappings */
>          build_append_int_noprefix(table_data, smmu_mapping_count, 4);
>          /* Reference to ID Array */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c75a8d6e9e..44c6b99c96 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3138,6 +3138,7 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>      }
>  }
>  
> +static uint8_t smmuv3_dev_id;
nit: I would rather put that at the top of the file
>  static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                              DeviceState *dev, Error **errp)
>  {
> @@ -3196,6 +3197,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                       OBJECT(vms->sysmem), NULL);
>              object_property_set_link(OBJECT(dev), "secure-memory",
>                                       OBJECT(vms->secure_sysmem), NULL);
> +            object_property_set_uint(OBJECT(dev), "identifier", smmuv3_dev_id++,
> +                                     NULL);
>          }
>          if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
>              hwaddr db_start = 0;
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


