Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F66CD3442
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 17:04:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL28x-0001es-MI; Thu, 07 May 2026 13:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL28r-0001cf-GA
 for qemu-arm@nongnu.org; Thu, 07 May 2026 13:04:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL28l-0005Nk-RY
 for qemu-arm@nongnu.org; Thu, 07 May 2026 13:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778173436;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBbDuAKWNq6vxsxytQTB6e1y0xj2M0FbXNW45x08AoE=;
 b=FkPmhV7WSdo35HUByyp/u4WxJPiJ/NHB3GhXmo8VUhJRI+P2halhAPNVnUrodQZKpgtRQJ
 Dh+2npGUWTb71MowCUVpk5REtyfzshV3IzUFt1aV5/k/6h37gnZK6JQ75AHtgRakTXJ+m/
 +ASSItSDlI11s3d8CHBkHhD6kDspR34=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-7ZswDJfVMY-hQnEJ_f67jQ-1; Thu, 07 May 2026 13:03:55 -0400
X-MC-Unique: 7ZswDJfVMY-hQnEJ_f67jQ-1
X-Mimecast-MFC-AGG-ID: 7ZswDJfVMY-hQnEJ_f67jQ_1778173434
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-488c0120047so6626725e9.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 10:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778173434; x=1778778234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBbDuAKWNq6vxsxytQTB6e1y0xj2M0FbXNW45x08AoE=;
 b=XZj6Bo/Aqpadm5TNYaVrFa1akEpCfOxsihvTZsOMfe9pBxQThpTjsbzUUUILFHUCOk
 PmbPS561k6LXo2SFiPQcOAV2MCECIw0/yO1phTXj4+ZOKweMfpKzasLRCP6yNvB1dfre
 g6ubQ6K9vqblQ1cClX954myhO1+egVq6LBUHBQvxL9L3D7wCBeWz3mI1tmFZf9ZgAdGV
 XmUrW4TS+iwSIxGZGfpclPM0D3GkiPoqKx2EXVSyqLjuyRxRIIpFIwxosiwclnMSSOxy
 bKHC4YObibEzAU6sa/4eQyMr+aVyPvrJo0VvLoqrxi85Dr/2EXltH0fBB5mrVsV6Aq2k
 VmGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+T+n9sJIOu3ydkiPQKo5X8jGSH1wwdiXL+eTo1hivxZbNQviLXhFLLuovK4FjguGehfm32L/7d9Q==@nongnu.org
X-Gm-Message-State: AOJu0YyLafSwypD0WykKVi4mrM9OKubbYiei4Tvq6R/CiolTlqmXhZhD
 IxrqrM11tZ0mgMVPdMhCttTpCgtNwlV24NX8qRz9O4Sg/994YIk3fQuhBOY2567E2wSS0p/GoSb
 FtaEiCnetzcomDYoVHebeLCKZ0IKnmVJDSJz2T1SXmrwjqlvBqWuBCg==
X-Gm-Gg: AeBDieu3qmfWt2t3g6SAkO0sn2UzM4FgC3nRUoRXIo7n/MO5hHzbfLWKEvWaUMC7xEf
 qcpZylyLs7CotHlLWF7yH5SsunIU+n2LUOiqemSQsdjCrV8f8LgeoA8jYPwKCOJq4OvQh8ciofe
 Y62lrZfUjF9zwNe2Px9qrRM/eQ+MFw2CbhqPti3Pghutd6c3RvBKr4fLPfbgMsO1RlDXc0eVgcl
 GWCB3+VD0+qA/eFpBqxUTzmyQu4RL0MpKglX+a8be5ngHAfhS8Y/ZQfy/SCQbH2Sr6uLXzoo/Hk
 RR9Vm6r+GnKn1E2sC9C+94XnlIYnz67brGhwX0WlEfhxA+RbcOWGjhLCkJYJrwBY3uK1msQn9ln
 PDLFATp+d1GVaivMRvmrLmL5nxImp1UKd90sfjQCbrpvWlESvV/Nmd6zy170jIDG4HaHkVA==
X-Received: by 2002:a05:600c:4512:b0:488:ac01:72b6 with SMTP id
 5b1f17b1804b1-48e51f3a538mr142812095e9.21.1778173434140; 
 Thu, 07 May 2026 10:03:54 -0700 (PDT)
X-Received: by 2002:a05:600c:4512:b0:488:ac01:72b6 with SMTP id
 5b1f17b1804b1-48e51f3a538mr142811115e9.21.1778173433075; 
 Thu, 07 May 2026 10:03:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45412820303sm479472f8f.4.2026.05.07.10.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 10:03:52 -0700 (PDT)
Message-ID: <4fefb00e-44f3-42ca-8835-38e6bc731cb2@redhat.com>
Date: Thu, 7 May 2026 19:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/31] hw/arm/tegra241-cmdqv: Add reset handler
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-26-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-26-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Y0gQIbR0rKZz_wU7wHLIJGLrzkGs-r8Btx4t-AZpC0_1778173434
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 4/15/26 12:55 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Introduce a reset handler for the Tegra241 CMDQV and initialize its
> register state.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h |  2 ++
>  hw/arm/tegra241-cmdqv.c | 50 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events     |  1 +
>  3 files changed, 53 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 2befa6205e..b2a444daef 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -79,6 +79,8 @@ FIELD(CONFIG, CMDQ_MAX_CLK_BATCH, 4, 8)
>  FIELD(CONFIG, CMDQ_MAX_CMD_BATCH, 12, 8)
>  FIELD(CONFIG, CONS_DRAM_EN, 20, 1)
>  
> +#define V_CONFIG_RESET 0x00020403
please add a comment to explain what 

0x00020403 value means

Eric

> +
>  REG32(PARAM, 0x4)
>  FIELD(PARAM, CMDQV_VER, 0, 4)
>  FIELD(PARAM, CMDQV_NUM_CMDQ_LOG2, 4, 4)
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 9c2fc02b92..af68add2f0 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qemu/log.h"
>  
>  #include "hw/arm/smmuv3.h"
> @@ -645,8 +646,57 @@ free_viommu:
>      return false;
>  }
>  
> +static void tegra241_cmdqv_init_regs(SMMUv3State *s, Tegra241CMDQV *cmdqv)
> +{
> +    int i;
> +
> +    cmdqv->config = V_CONFIG_RESET;
> +    cmdqv->param = FIELD_DP32(0, PARAM, CMDQV_VER, CMDQV_VER);
> +    cmdqv->param = FIELD_DP32(cmdqv->param, PARAM, CMDQV_NUM_CMDQ_LOG2,
> +                              CMDQV_NUM_CMDQ_LOG2);
> +    cmdqv->param = FIELD_DP32(cmdqv->param, PARAM, CMDQV_NUM_SID_PER_VI_LOG2,
> +                              CMDQV_NUM_SID_PER_VI_LOG2);
> +    trace_tegra241_cmdqv_init_regs(cmdqv->param);
> +    cmdqv->status = R_STATUS_CMDQV_ENABLED_MASK;
> +    for (i = 0; i < 2; i++) {
> +        cmdqv->vi_err_map[i] = 0;
> +        cmdqv->vi_int_mask[i] = 0;
> +        cmdqv->cmdq_err_map[i] = 0;
> +    }
> +    cmdqv->cmdq_err_map[2] = 0;
> +    cmdqv->cmdq_err_map[3] = 0;
> +    cmdqv->vintf_config = 0;
> +    cmdqv->vintf_status = 0;
> +    for (i = 0; i < 4; i++) {
> +        cmdqv->vintf_cmdq_err_map[i] = 0;
> +    }
> +    for (i = 0; i < TEGRA241_CMDQV_MAX_CMDQ; i++) {
> +        cmdqv->cmdq_alloc_map[i] = 0;
> +        cmdqv->vcmdq_cons_indx[i] = 0;
> +        cmdqv->vcmdq_prod_indx[i] = 0;
> +        cmdqv->vcmdq_config[i] = 0;
> +        cmdqv->vcmdq_status[i] = 0;
> +        cmdqv->vcmdq_gerror[i] = 0;
> +        cmdqv->vcmdq_gerrorn[i] = 0;
> +        cmdqv->vcmdq_base[i] = 0;
> +        cmdqv->vcmdq_cons_indx_base[i] = 0;
> +    }
> +}
> +
>  static void tegra241_cmdqv_reset(SMMUv3State *s)
>  {
> +    SMMUv3AccelState *accel = s->s_accel;
> +    Tegra241CMDQV *cmdqv = accel->cmdqv;
> +
> +    if (!cmdqv) {
> +        return;
> +    }
> +
> +    tegra241_cmdqv_guest_unmap_vintf_page0(cmdqv);
> +    tegra241_cmdqv_munmap_vintf_page0(cmdqv, NULL);
> +    tegra241_cmdqv_free_all_vcmdq(cmdqv);
> +
> +    tegra241_cmdqv_init_regs(s, cmdqv);
>  }
>  
>  static const MemoryRegionOps mmio_cmdqv_ops = {
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index fd6441bfa7..6f602b9eda 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -76,6 +76,7 @@ smmuv3_accel_install_ste(uint32_t vsid, const char * type, uint32_t hwpt_id) "vS
>  tegra241_cmdqv_read_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
>  tegra241_cmdqv_write_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
>  tegra241_cmdqv_err_map(uint32_t map3, uint32_t map2, uint32_t map1, uint32_t map0) "hw irq received. error (hex) maps: %04X:%04X:%04X:%04X"
> +tegra241_cmdqv_init_regs(uint32_t param) "hw info received. param: 0x%04X"
>  
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"


