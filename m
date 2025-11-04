Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FF6CCFA04
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Nov 2025 14:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGHwI-0005jn-T0; Tue, 04 Nov 2025 09:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGHw7-0005eS-0i
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 09:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGHw4-0006mv-Vf
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 09:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762266179;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+dRORFH5yIw9rK94yAAv2DYRI6VYvYD416/F1YBVupU=;
 b=LpJL8SarPUsEJjaWddCDFr7g8pDw2ntgmoVO4AGNI47a2GAUID7biD9FUrnP/JFB5FiK38
 uCGq6ZCrHagDk8RYE3lVG8Vvr77VuUJVGmz6bjADy53++8yB0KGG8NNiegYxXugRatGQQT
 EwVQ92IKs/z7ITABRXMB+xAGkUmGgqI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-NccazFZAP4a11DAne5WRpA-1; Tue, 04 Nov 2025 09:22:56 -0500
X-MC-Unique: NccazFZAP4a11DAne5WRpA-1
X-Mimecast-MFC-AGG-ID: NccazFZAP4a11DAne5WRpA_1762266174
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-471201dc0e9so48445915e9.2
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 06:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762266174; x=1762870974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+dRORFH5yIw9rK94yAAv2DYRI6VYvYD416/F1YBVupU=;
 b=VhWFUvhx6L21OPf0rYeZUmldOxXMGynHLbcfc1gptprR0UCN6Q0nXjz6F0aUx8JXfO
 YRb0U61ulEFIPScSEkdUTin63+kqyx0Nwjk0AQ2RFlBwjbW4BGwSxERRyitdT3IWqoZ/
 GLJc6S2faUJ3EtmZQpLylmf4U2kxHEU2DCzN65N+Zylv3d/j+jgtmBp962An1ixwr6pU
 8ceMw8o4b/BhUwuyK+tY8XvS1qLAPRfDDbcXLDh1ykA/zwAuaKPLDPo8YxDGmzkQorv/
 n9QkTGYgt9WsE6J+uRBUNN4j4MvX2eulj5kvVfWPdCAeTmEtvh4I8L4J+pDlj5Mg4HyW
 7VpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+8l+PqE3pP9tVG4nnLAnmZ+gB/3Rg+FwFMvI/pn2Ixlq3TSsrrY0USLfAurmRq0nsOLgNplBvXw==@nongnu.org
X-Gm-Message-State: AOJu0YyuwJsRP/VS7BI/FG6Lr9zdkHSI1XWve6aV8vPf2zK9seHnNBWY
 A1otlULhCZzyfizKLVSGBCq5Uoo6caQ13WsypFLQ6M5tgRl9XTqSFGNgjqTFKFnC4DVmFiuIvoh
 MRZ1tOd85R+ntEkVYALHhp692azL6xl+y7hBIgsg8fc7EXVSA8uKTkQ==
X-Gm-Gg: ASbGncvnV7ibHmynqYs1cEScLy6GrHcSFaTy7DrtE/dUKlMbdcHTctsBdeaooM4tj7W
 zY3vPihjbGlk9aISQVql8O3MlXyZlTAYNcH7MfxWJwqbjcMbQ4e8SOOLEqFsvP1oLp9mUjilIud
 XQD1Y64p4ok51jpHhg8eSx4VXU2yG9atwBHGvcxmro0njoHJg0fDbOp6REfSsHE2fVZDh/nnXOi
 MMCNMwLqFWfZCRgotkC8ux3BOkTaBdBWSgIwW2iVWsUwVeU6j14AysMXZwqV1L+40EEIsoZy7NW
 GfuE+pi70/+yRlJefhXHqBvXKlSh8P1ZSD91TNtayPMrdUemtb0bqWSfhEYh1RIZWn4Ya44kt2v
 UvNTBWkBQaTRyM0raJNM8P51zKoaKdsKN8Lgs3EQv7ngSbw==
X-Received: by 2002:a05:600c:45d3:b0:475:dde5:d91b with SMTP id
 5b1f17b1804b1-47730813642mr150558495e9.17.1762266174375; 
 Tue, 04 Nov 2025 06:22:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbD3TMFJQKgkLjHbam2qm1zXiYPF6AVaXYdmUn+R8gpSGwIlX7n217OVfY0OZuzNSDWeVYhA==
X-Received: by 2002:a05:600c:45d3:b0:475:dde5:d91b with SMTP id
 5b1f17b1804b1-47730813642mr150558265e9.17.1762266173913; 
 Tue, 04 Nov 2025 06:22:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47755f92274sm38873855e9.9.2025.11.04.06.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 06:22:53 -0800 (PST)
Message-ID: <2a4a1246-4515-4e98-b5dc-e1ff0e9f0003@redhat.com>
Date: Tue, 4 Nov 2025 15:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/32] hw/arm/smmuv3-accel: Add support for ATS
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-28-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-28-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Mukkh8Oodwnb4Ukn1DemvOPZqeEFL5YjCbl2gIgKhM_1762266174
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.788,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 10/31/25 11:50 AM, Shameer Kolothum wrote:
> QEMU SMMUv3 does not enable ATS (Address Translation Services) by default.
> When accelerated mode is enabled and the host SMMUv3 supports ATS, it can
> be useful to report ATS capability to the guest so it can take advantage
> of it if the device also supports ATS.
>
> Note: ATS support cannot be reliably detected from the host SMMUv3 IDR
> registers alone, as firmware ACPI IORT tables may override them. The
> user must therefore ensure the support before enabling it.

Please add a note that this is a partial ATS support, made possible because
emulated devices can be pluugged onto accel SMMU (ie. we do not support
ATS translation requests for instance)
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c    |  4 ++++
>  hw/arm/smmuv3.c          | 25 ++++++++++++++++++++++++-
>  hw/arm/virt-acpi-build.c | 10 ++++++++--
>  include/hw/arm/smmuv3.h  |  1 +
>  4 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 35298350cb..5b0ef3804a 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -645,6 +645,10 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>      if (!s->ril) {
>          s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 0);
>      }
> +    /* QEMU SMMUv3 has no ATS. Update IDR0 if user has enabled it */
"advertise ats if opt-on by property?"
> +    if (s->ats) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS, 1); /* ATS */
use s->ats directly?
> +    }
>  }
>  
>  /* Based on SMUUv3 GBPA configuration, attach a corresponding HWPT */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index b9d96f5762..d95279a733 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1517,13 +1517,28 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>               */
>              smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
>              break;
> +        case SMMU_CMD_ATC_INV:
> +        {
> +            SMMUDevice *sdev = smmu_find_sdev(bs, CMD_SID(&cmd));
> +            Error *local_err = NULL;
> +
> +            if (!sdev) {
> +                break;
> +            }
> +
> +            if (!smmuv3_accel_issue_inv_cmd(s, &cmd, sdev, &local_err)) {
> +                error_report_err(local_err);
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +            break;
> +        }
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
> @@ -1942,6 +1957,10 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>              error_setg(errp, "ril can only be disabled if accel=on");
>              return false;
>          }
> +        if (s->ats) {
> +            error_setg(errp, "ats can only be enabled if accel=on");
> +            return false;
> +        }
>          return false;
>      }
>      return true;
> @@ -2067,6 +2086,7 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
>      /* RIL can be turned off for accel cases */
>      DEFINE_PROP_BOOL("ril", SMMUv3State, ril, true),
> +    DEFINE_PROP_BOOL("ats", SMMUv3State, ats, false),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2096,6 +2116,9 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>                                            "in nested mode for vfio-pci dev assignment");
>      object_class_property_set_description(klass, "ril",
>          "Disable range invalidation support (for accel=on)");
> +    object_class_property_set_description(klass, "ats",
> +        "Enable/disable ATS support (for accel=on). Please ensure host "
> +        "platform has ATS support before enabling this");
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6106ad1b6e..1b0d0a2029 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -345,6 +345,7 @@ typedef struct AcpiIortSMMUv3Dev {
>      /* Offset of the SMMUv3 IORT Node relative to the start of the IORT */
>      size_t offset;
>      bool accel;
> +    bool ats;
>  } AcpiIortSMMUv3Dev;
>  
>  /*
> @@ -400,6 +401,7 @@ static int iort_smmuv3_devices(Object *obj, void *opaque)
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
> +    build_append_int_noprefix(table_data, (ats_needed ? 1 : 0), 4);
can't you use ats_needed directly?
>      /* MCFG pci_segment */
>      build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number */
>  
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 95202c2757..5fd5ec7b49 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -69,6 +69,7 @@ struct SMMUv3State {
>      struct SMMUv3AccelState *s_accel;
>      Error *migration_blocker;
>      bool ril;
> +    bool ats;
>  };
>  
>  typedef enum {
Eric


