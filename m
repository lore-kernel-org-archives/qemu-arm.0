Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BDFD3B7EA
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Dec 2025 17:36:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSf9h-0000YG-Kn; Mon, 08 Dec 2025 12:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSf9f-0000Uj-9W
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 12:36:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSf9c-0000Ex-Du
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 12:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765215366;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKnl8T6+eLdjS1EJKvQaKjVfpMlQErCfv8LJX9RyCRg=;
 b=F9BJxDe6c+sDMjCy4LIBNKKDTvAo2j/YgJ0J8wvur3tNd/3W/O4C5s6VJ3Ot/77H68C4WU
 Bvikmp1PDcNaY2fRQ71QFeB1IstX9LRvWYIuZ7rqMy/Nl7Ti18fHycZ2TY+WBS7/hV9Bm9
 v2J59/EHWRtxKpnkyka8IGzyoSkwn8Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-wdiUP5wVOIeKV_OFF5UMQg-1; Mon, 08 Dec 2025 12:36:05 -0500
X-MC-Unique: wdiUP5wVOIeKV_OFF5UMQg-1
X-Mimecast-MFC-AGG-ID: wdiUP5wVOIeKV_OFF5UMQg_1765215365
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b234bae2a7so986530385a.3
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 09:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765215365; x=1765820165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKnl8T6+eLdjS1EJKvQaKjVfpMlQErCfv8LJX9RyCRg=;
 b=f3ZimsQACyPXuFwcQkgDSYRMwhkb6gTXftEiBFOO32oKdMm8JW+7Ia76ZK7RhCfkJR
 P2DwFBuBoIekaNJinfOn1NSLZ9ZEvG6Zg2yphlX2DIpDf/zq9uqfYC+Vt6Oou7IbFLWb
 kN+Tx2v+i0c42uZO+ChFF68BFSvduF0o2fOhF/mkXhSbvnPrj2tSWUJHamtMfscjseMW
 3jbQU17LE+G7F7IFNnzXp/aw7KGlbvQ8pVnVBD29or4Q54LRIVrNSsmdjb+LJCQJTJPp
 AgWdct11jqvWDnVI7haRPdee9NnYfiJzJ0sRyWEwpq2L7PIWXqq0eBWDF5rEckjJWoJV
 ppRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoxn1rctAkZ6YOddEHY8qD6V7HajSUjQ5XZjaZuIKipgupClvweP7O9iMPYBmTPtEmmvi/KlZm2Q==@nongnu.org
X-Gm-Message-State: AOJu0YyGAY5XvdkYhSwIm0Dtnj+08UH9LokKR4jZFys8WfcVIFJJbyiA
 EAk6h6n0Il/7RrfNvDk9uK4cv8Vfc7VDd83iJNDlPyP89v+YRR7cgQt69W3E6U4TVNZDhV4gbZ3
 6EbR4kGmAmhqoUZSssehmRrsnXEbusL0sDv2ibPkC8wtovLjZ9NuX5g==
X-Gm-Gg: ASbGnct0SH23A/J/JtjJtC4eIYRsmrGYe9LHo/JRKvU9rAIwdoYDhDPwpvJ+WvUC6Wq
 jWOgp4LguSLA2PlKXAQZ1/+DX6Riymp35UnclDzs8zZYnvgLyCQBabty1lMl0nA9FSd2KM50KsY
 tf2mb9HeFre+spNVTKSfqvyDo4/tQEhJW6dHkF5PyfAhgoL7KYzV3PhPZHPjzvYyju64KM32HTD
 qUVs1vMB40FpahqqWOZu+g/EV0EMnp3qVjqrE/t96bu++L112FUsL3lBilZfHkYUrSpejrGyFOK
 YUQkY65eMS1ejjkYBM0SSjTyBp6uj8DGnOiTfo3m1/hKnVLPO5kfj0qfrGc2Hrctvcxo9HENt24
 0FN2hgJOdEx9fQtNVsJsqp+2llifRaLvcxagZHlPtgHZHQP2+VqPalL40kg==
X-Received: by 2002:a05:620a:690e:b0:8b2:5d6e:48b5 with SMTP id
 af79cd13be357-8b6a253542emr1081471085a.30.1765215364809; 
 Mon, 08 Dec 2025 09:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG/wZP2yS+c/cnezBbNeu1AvF9ArRr5L/X5cF1eZO1gs6Q8EpniZ4HAgEWyWDHQFXfDlqDzg==
X-Received: by 2002:a05:620a:690e:b0:8b2:5d6e:48b5 with SMTP id
 af79cd13be357-8b6a253542emr1081466985a.30.1765215364290; 
 Mon, 08 Dec 2025 09:36:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b627a798desm1083136485a.33.2025.12.08.09.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 09:36:03 -0800 (PST)
Message-ID: <60d244b6-d29a-4056-b671-604bdb06fcf7@redhat.com>
Date: Mon, 8 Dec 2025 18:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/33] hw/arm/smmuv3-accel: Add support for ATS
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-29-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251120132213.56581-29-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JcXwp1ZFzNbOlYgi8fSqNykbmlyII0Nn_kwbQyqmDnQ_1765215365
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 11/20/25 2:22 PM, Shameer Kolothum wrote:
> QEMU SMMUv3 does not enable ATS (Address Translation Services) by default.
> When accelerated mode is enabled and the host SMMUv3 supports ATS, it can
> be useful to report ATS capability to the guest so it can take advantage
> of it if the device also supports ATS.
device = assigned device
>
> Note: ATS support cannot be reliably detected from the host SMMUv3 IDR
> registers alone, as firmware ACPI IORT tables may override them. The
> user must therefore ensure the support before enabling it.
>
> The ATS support enabled here is only relevant for vfio-pci endpoints,
> as SMMUv3 accelerated mode does not support emulated endpoint devices.
> QEMU’s SMMUv3 implementation still lacks support for handling ATS
> translation requests, which would be required for emulated endpoints.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c    |  3 +++
>  hw/arm/smmuv3.c          | 21 ++++++++++++++++++++-
>  hw/arm/virt-acpi-build.c | 10 ++++++++--
>  include/hw/arm/smmuv3.h  |  1 +
>  4 files changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index b6429c8b42..73c7ce586a 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -647,6 +647,9 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>  
>      /* By default QEMU SMMUv3 has RIL. Update IDR3 if user has disabled it */
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, s->ril);
> +
> +    /* QEMU SMMUv3 has no ATS. Advertise ATS if opt-on by property */
opt-in?
> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, s->ats);
>  }
>  
>  /* Based on SMUUv3 GPBA.ABORT configuration, attach a corresponding HWPT */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 296afbe503..ad476146f6 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1498,13 +1498,24 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp)
>               */
>              smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
>              break;
> +        case SMMU_CMD_ATC_INV:
> +            SMMUDevice *sdev = smmu_find_sdev(bs, CMD_SID(&cmd));
> +
> +            if (!sdev) {
> +                break;
> +            }
> +
> +            if (!smmuv3_accel_issue_inv_cmd(s, &cmd, sdev, errp)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +            break;
with the compilation issue fixed,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

>          case SMMU_CMD_TLBI_EL3_ALL:
>          case SMMU_CMD_TLBI_EL3_VA:
>          case SMMU_CMD_TLBI_EL2_ALL:
>          case SMMU_CMD_TLBI_EL2_ASID:
>          case SMMU_CMD_TLBI_EL2_VA:
>          case SMMU_CMD_TLBI_EL2_VAA:
> -        case SMMU_CMD_ATC_INV:
>          case SMMU_CMD_PRI_RESP:
>          case SMMU_CMD_RESUME:
>          case SMMU_CMD_STALL_TERM:
> @@ -1930,6 +1941,10 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>              error_setg(errp, "ril can only be disabled if accel=on");
>              return false;
>          }
> +        if (s->ats) {
> +            error_setg(errp, "ats can only be enabled if accel=on");
> +            return false;
> +        }
>          return true;
>      }
>      return true;
> @@ -2057,6 +2072,7 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>      /* RIL can be turned off for accel cases */
>      DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
> +    DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2084,6 +2100,9 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "configured in nested mode for vfio-pci dev assignment");
>      object_class_property_set_description(klass, "ril",
>          "Disable range invalidation support (for accel=on)");
> +    object_class_property_set_description(klass, "ats",
> +        "Enable/disable ATS support (for accel=on). Please ensure host "
> +        "platform has ATS support before enabling this");
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index fd78c39317..1e3779991e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -346,6 +346,7 @@ typedef struct AcpiIortSMMUv3Dev {
>      /* Offset of the SMMUv3 IORT Node relative to the start of the IORT */
>      size_t offset;
>      bool accel;
> +    bool ats;
>  } AcpiIortSMMUv3Dev;
>  
>  /*
> @@ -401,6 +402,7 @@ static int iort_smmuv3_devices(Object *obj, void *opaque)
>  
>      bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
>      sdev.accel = object_property_get_bool(obj, "accel", &error_abort);
> +    sdev.ats = object_property_get_bool(obj, "ats", &error_abort);
>      pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
>      sbdev = SYS_BUS_DEVICE(obj);
>      sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> @@ -544,6 +546,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i, nb_nodes, rc_mapping_count;
>      AcpiIortSMMUv3Dev *sdev;
>      size_t node_size;
> +    bool ats_needed = false;
>      int num_smmus = 0;
>      uint32_t id = 0;
>      int rc_smmu_idmaps_len = 0;
> @@ -579,6 +582,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Calculate RMR nodes required. One per SMMUv3 with accelerated mode */
>          for (i = 0; i < num_smmus; i++) {
>              sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, i);
> +            if (sdev->ats) {
> +                ats_needed = true;
> +            }
>              if (sdev->accel) {
>                  nb_nodes++;
>              }
> @@ -678,8 +684,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      build_append_int_noprefix(table_data, 0, 2); /* Reserved */
>      /* Table 15 Memory Access Flags */
>      build_append_int_noprefix(table_data, 0x3 /* CCA = CPM = DACS = 1 */, 1);
> -
> -    build_append_int_noprefix(table_data, 0, 4); /* ATS Attribute */
> +    /* ATS Attribute */
> +    build_append_int_noprefix(table_data, ats_needed, 4);
>      /* MCFG pci_segment */
>      build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number */
>  
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 533a2182e8..242d6429ed 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -70,6 +70,7 @@ struct SMMUv3State {
>      uint64_t msi_gpa;
>      Error *migration_blocker;
>      bool ril;
> +    bool ats;
>  };
>  
>  typedef enum {


