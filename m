Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A10CA0FED
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 13:21:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuWMv-0002Rd-Qb; Fri, 05 Sep 2025 09:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuWMs-0002QG-FT
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 09:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuWMn-0004PB-O2
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 09:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757078434;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mf+KmcKug5eYQgMnjD5Ofc5b5jhpvyBPAd74jlWDiv0=;
 b=OIVaxC+HG7pZxEJbghe8m8V8zaa1mwy7CTDP4wy4ED7HdyeJokvo3s5fW+ohRKcGLWyIXy
 fxB/cnJRIvb4h8BmKkMldw7+Az84Dmm4ebGG4b49Q8jtY92bf/YvbVdEsBftC+KAXuFGWk
 0qJqj6BNkIKz6Y/S2J1cT+vjtq+3x0g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-twZxCTQzN3-OR7FjAw6sVA-1; Fri, 05 Sep 2025 09:20:33 -0400
X-MC-Unique: twZxCTQzN3-OR7FjAw6sVA-1
X-Mimecast-MFC-AGG-ID: twZxCTQzN3-OR7FjAw6sVA_1757078432
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedd1so1446377f8f.3
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 06:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757078432; x=1757683232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mf+KmcKug5eYQgMnjD5Ofc5b5jhpvyBPAd74jlWDiv0=;
 b=XATdreXXaG+7D/5salMYu1IzxF7GKPVFeeoyY1eF+Oftz84r9O9RQimMg1fg33Ui/f
 d08zU9RI9hgze2kmOaQ4cmTYlCulqfLLmR1OtF1+jZ2ZGa86HbRJidw+hqywHWt8/MqN
 EscnHnIPzBHpyA306fLIcbcf2lEm+0SsRR1h4azLiCtTTCM9By3x3csC1BgACEeGQV0e
 Q2nQ5n7RBrvlPUEiEnoP6R81sw7CBA0iiDxQjrWxJh114w4X6RePXr3v+s29NcLwR0Vv
 IXHD3eclpwpaZ8RSzoZTIi3+gekCU+F8j0YoQWN2RjQtxX6UjH2MaEZsEV++Em4KrCoz
 XDvQ==
X-Gm-Message-State: AOJu0Yyfwx3zQ+GiOxnhiyzo0mIMUEEJIin00ve6HIcin52O0MIvAQLr
 +WV4fmHAL5XROH/y1X/6HPw1BjA7jxnU4thUg5Pge8Kud+7st7pS1ZnYtkLmdE6BYB1cleQswxI
 2KgDW+n6O4GpEDu2F3VhYnjq4Nc7UOjUd1JpQg4rCE7i8jM63IQbcA2c7k5DjGUqzbJYY6qVB2X
 FcEi2xDmBSdvYYsqcxtNyLDRnJRFX503edkAcyMOEhIGI=
X-Gm-Gg: ASbGncsBul7DTR8l9vonlcQbbmg1UNXNDY0ZZJauJSuoD2vgAn3o1mMbRvCMbiBETyC
 k+GTInuNwruQGyF5YplD+Jgr877NrcUWRCSCVxU82QgyCs6FUFVxNqRfg/PT89ynAAQkiFm/+El
 /y0OlDwtfSx880j8rWVN/WAmDYSp8z/3PNt3akNEJQCiZhahUTv+5IYjVQ4MNeVoxmLDhwB7xm9
 wLq/8HEudvBU2jkUaT/ulRmPhzB6zeECk8NKkArA4LoTMebwjTyIhGJcVeJzuiageVT5OGcQI6x
 c0HKRu6APqGHqTDESIBaKfhGweRzoo4T0tuUEmqqe5aGQZFDGEWu69wqYyam4gTj6ZdN0ZAnrh6
 OKLEyv2JAd4A=
X-Received: by 2002:a5d:64c3:0:b0:3e4:d981:e312 with SMTP id
 ffacd0b85a97d-3e4d981e84amr880981f8f.62.1757078431665; 
 Fri, 05 Sep 2025 06:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrysbBh3yhS6icriu81WND2TJ96lt3L71bGR/2ZvUHHiVqxPm0gffUWuGVAPjkUj20UmddLA==
X-Received: by 2002:a5d:64c3:0:b0:3e4:d981:e312 with SMTP id
 ffacd0b85a97d-3e4d981e84amr880930f8f.62.1757078431014; 
 Fri, 05 Sep 2025 06:20:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d7ac825b88sm18510354f8f.7.2025.09.05.06.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 06:20:30 -0700 (PDT)
Message-ID: <e2a41acf-1700-4c92-937b-53993c7e25c0@redhat.com>
Date: Fri, 5 Sep 2025 15:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 14/15] Read and validate host SMMUv3 feature bits
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, shameerkolothum@gmail.com
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-15-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250714155941.22176-15-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7Rw0X-pNYprgO_uEyfzJk-RhqpmtTjPdYIIUdUbvn5k_1757078432
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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



On 7/14/25 5:59 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Not all fields in the SMMU IDR registers are meaningful for userspace.
> Only the following fields can be used:
>
>   - IDR0: ST_LEVEL, TERM_MODEL, STALL_MODEL, TTENDIAN, CD2L, ASID16, TTF  
>   - IDR1: SIDSIZE, SSIDSIZE  
>   - IDR3: BBML, RIL  
>   - IDR5: VAX, GRAN64K, GRAN16K, GRAN4K
>
> Use the relevant fields from these to check whether the host and emulated
> SMMUv3 features are sufficiently aligned to enable accelerated SMMUv3
> support.
>
> To retrieve this information from the host, at least one vfio-pci device
> must be assigned with "arm-smmuv3,accel=on" usage. Add a check to enforce
> this.
>
> Note:
>
> ATS, PASID, and PRI features are currently not supported. Only devices
> that do not require or make use of these features are expected to work.
>
> Also, requiring at least one vfio-pci device to be cold-plugged
> complicates hot-unplug and replug scenarios. For example, if all devices
> behind the vSMMUv3 are unplugged after the guest boots, and a new device
> is later hot-plugged into the same PCI bus, there is no guarantee that
> the underlying host SMMUv3 will expose the same feature set as the one
> originally used when the vSMMU was initialized.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c | 103 ++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h |   5 ++
>  hw/arm/smmuv3.c       |   4 ++
>  hw/arm/trace-events   |   2 +-
>  4 files changed, 113 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 1298b4f6d0..3b2f45bd88 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -23,6 +23,109 @@
>  #define SMMU_STE_VALID      (1ULL << 0)
>  #define SMMU_STE_CFG_BYPASS (1ULL << 3)
>  
> +static int
> +smmuv3_accel_host_hw_info(SMMUv3AccelDevice *accel_dev, uint32_t *data_type,
> +                          uint32_t data_len, void *data)
> +{
> +    uint64_t caps;
> +
> +    if (!accel_dev || !accel_dev->idev) {
> +        return -ENOENT;
> +    }
> +
> +    return !iommufd_backend_get_device_info(accel_dev->idev->iommufd,
> +                                            accel_dev->idev->devid,
> +                                            data_type, data,
> +                                            data_len, &caps, NULL);
> +}
> +
> +void smmuv3_accel_init_regs(SMMUv3State *s)
> +{
> +    SMMUv3AccelState *s_accel = s->s_accel;
> +    SMMUv3AccelDevice *accel_dev;
> +    uint32_t data_type;
> +    uint32_t val;
> +    int ret;
> +
> +    if (s_accel->info.idr[0]) {
> +        /* We already got this */
what does it mean?
> +        return;
> +    }
> +
> +    if (!s_accel->viommu || QLIST_EMPTY(&s_accel->viommu->device_list)) {
> +        error_report("For arm-smmuv3,accel=on case, atleast one cold-plugged "
> +                     "vfio-pci dev needs to be assigned");
to me this shall be relaxed. If you don't have any way to fetch HW info,
you apply the defaults and if a device is hotplugged any mismatch would
fail the hotplug
> +        goto out_err;
> +    }
> +
> +    accel_dev = QLIST_FIRST(&s_accel->viommu->device_list);
> +    ret = smmuv3_accel_host_hw_info(accel_dev, &data_type,
> +                                    sizeof(s_accel->info), &s_accel->info);
> +    if (ret) {
> +        error_report("Failed to get Host SMMU device info");
> +        goto out_err;
> +    }
> +
> +    if (data_type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
> +        error_report("Wrong data type (%d) for Host SMMU device info",
> +                     data_type);
> +        goto out_err;
> +    }
> +
> +    trace_smmuv3_accel_host_hw_info(s_accel->info.idr[0], s_accel->info.idr[1],
> +                                    s_accel->info.idr[3], s_accel->info.idr[5]);
> +    /*
> +     * QEMU SMMUv3 supports both linear and 2-level stream tables. If host
> +     * SMMUv3 supports only linear stream table, report that to Guest.
> +     */
> +    val = FIELD_EX32(s_accel->info.idr[0], IDR0, STLEVEL);
> +    if (val < FIELD_EX32(s->idr[0], IDR0, STLEVEL)) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STLEVEL, val);
> +    }
> +
> +    /*
> +     * QEMU SMMUv3 supports little-endian support for translation table walks.
> +     * If host SMMUv3 supports only big-endian, report error.
> +     */
> +    val = FIELD_EX32(s_accel->info.idr[0], IDR0, TTENDIAN);
> +    if (val > FIELD_EX32(s->idr[0], IDR0, TTENDIAN)) {
> +        error_report("Host SUUMU device translation table walk endianess "
> +                     "not supported");
> +        goto out_err;
> +    }
> +
> +    /*
> +     * QEMU SMMUv3 supports AArch64 Translation table format.
> +     * If host SMMUv3 supports only AArch32, report error.
> +     */
> +    val = FIELD_EX32(s_accel->info.idr[0], IDR0, TTF);
> +    if (val < FIELD_EX32(s->idr[0], IDR0, TTF)) {
> +        error_report("Host SMMU device Translation table format not supported");
> +        goto out_err;
> +    }
> +
> +    /*
> +     * QEMU SMMUv3 supports 4K/16K/64K translation granules. If host SMMUv3
> +     * does't support any of these, report the supported ones only to Guest.
> +     */
> +    val = FIELD_EX32(s_accel->info.idr[5], IDR5, GRAN4K);
> +    if (val < FIELD_EX32(s->idr[5], IDR5, GRAN4K)) {
> +        s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, val);
> +    }
> +    val = FIELD_EX32(s_accel->info.idr[5], IDR5, GRAN16K);
> +    if (val < FIELD_EX32(s->idr[5], IDR5, GRAN16K)) {
> +        s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, val);
> +    }
> +    val = FIELD_EX32(s_accel->info.idr[5], IDR5, GRAN64K);
> +    if (val < FIELD_EX32(s->idr[5], IDR5, GRAN64K)) {
> +        s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, val);
for migration purpose we would definitively need to store those values
in a VMState.

Thanks

Eric
> +    }
> +    return;
> +
> +out_err:
> +    exit(1);
> +}
> +
>  static void
>  smmuv3_accel_dev_uninstall_nested_ste(SMMUv3AccelDevice *accel_dev, bool abort)
>  {
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index d06c9664ba..e1e99598b4 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -49,6 +49,7 @@ typedef struct SMMUv3AccelState {
>      MemoryRegion root;
>      MemoryRegion sysmem;
>      SMMUViommu *viommu;
> +    struct iommu_hw_info_arm_smmuv3 info;
>  } SMMUv3AccelState;
>  
>  #if defined(CONFIG_ARM_SMMUV3) && defined(CONFIG_IOMMUFD)
> @@ -60,6 +61,7 @@ bool smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch);
>  void smmuv3_accel_batch_cmd(SMMUState *bs, SMMUDevice *sdev,
>                             SMMUCommandBatch *batch, struct Cmd *cmd,
>                             uint32_t *cons);
> +void smmuv3_accel_init_regs(SMMUv3State *s);
>  #else
>  static inline void smmuv3_accel_init(SMMUv3State *d)
>  {
> @@ -83,6 +85,9 @@ static inline void smmuv3_accel_batch_cmd(SMMUState *bs, SMMUDevice *sdev,
>  {
>      return;
>  }
> +static inline void smmuv3_accel_init_regs(SMMUv3State *s)
> +{
> +}
>  #endif
>  
>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 97ecca0764..100e3c8929 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1894,6 +1894,7 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
>   */
>  static void smmu_reset_exit(Object *obj, ResetType type)
>  {
> +    SMMUState *sys = ARM_SMMU(obj);
>      SMMUv3State *s = ARM_SMMUV3(obj);
>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>  
> @@ -1903,6 +1904,9 @@ static void smmu_reset_exit(Object *obj, ResetType type)
>      }
>  
>      smmuv3_init_regs(s);
> +    if (sys->accel) {
> +        smmuv3_accel_init_regs(s);
> +    }
>  }
>  
>  static void smmu_realize(DeviceState *d, Error **errp)
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 7d232ca17c..37ecab10a0 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -70,7 +70,7 @@ smmu_reset_exit(void) ""
>  smmuv3_accel_set_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x)"
>  smmuv3_accel_unset_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x"
>  smmuv3_accel_install_nested_ste(uint32_t sid, uint64_t ste_1, uint64_t ste_0) "sid=%d ste=%"PRIx64":%"PRIx64
> -
> +smmuv3_accel_host_hw_info(uint32_t idr0, uint32_t idr1, uint32_t idr3, uint32_t idr5) "idr0=0x%x idr1=0x%x idr3=0x%x idr5=0x%x"
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
>  strongarm_ssp_read_underrun(void) "SSP rx underrun"


