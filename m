Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFFCCD3442
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 16:51:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL1wv-0005Ty-Dg; Thu, 07 May 2026 12:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL1wr-0005QW-5M
 for qemu-arm@nongnu.org; Thu, 07 May 2026 12:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL1wo-0002LH-U3
 for qemu-arm@nongnu.org; Thu, 07 May 2026 12:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778172697;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8kiIjydpHjmWLd5Ofrh2ka7+rp/VfScy8/WFFrDyo4=;
 b=ULXZnaNiyHnUGM8IKrnPitEqCXU6haq/NvSHHbZ3P93i2iiSGQfcvSxdkFR6Wdv8WqqskD
 nvqxxG7Uo4Ntl3Il63HefBW8I0cJW/ytifRrd5ey+WFIx9nFFHA0a8Y/UR2LBQomjsJwUp
 UNNzReFAe4T/paDCzasq3SBqhhmbfZA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-yqWbR-rvP966Z_TNCWIRjg-1; Thu, 07 May 2026 12:51:36 -0400
X-MC-Unique: yqWbR-rvP966Z_TNCWIRjg-1
X-Mimecast-MFC-AGG-ID: yqWbR-rvP966Z_TNCWIRjg_1778172695
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-44b186b715aso756098f8f.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 09:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778172695; x=1778777495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8kiIjydpHjmWLd5Ofrh2ka7+rp/VfScy8/WFFrDyo4=;
 b=m4UPUZMN6dqYFj5wpnfSaZ30DR8OwWfxfQa+Kq7Sm2FE0yytVg7NREGWULmEduyav3
 VSaCYL91yI/abN3fChHHQ5MXN0icVNrTIgJNkR5qrUAQjMy/9XH0lc65URN+HM+qV1n9
 YPbICz34cv7PHPAsFipoqz4lrJvj37wGn0Afp83QZYchXhsOoKCAZ+RNqpfo++/ZGeS5
 kOXstJBk7yb4X2XGPNIzNWg+Yw+5MkbVobj20nCx44rNyzDI9QpNVPQ27n5ewrzeoI6g
 rrJHUeFEySPLwVnWut3vW6j5uPyjFwsL0QZFjXDTJ/FxoYZeoiJ+3whh3QfXQWE6phGv
 yK4A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+43JLB25uGgCKOYjUPu3JgUatcNnWc37nFOcriQ9axDS+GqwNgeZcE6mfdKFF4R2+Anxlifft0lg==@nongnu.org
X-Gm-Message-State: AOJu0YyTXQlqHP9efApkStEa2OguwUqlZhhK6b9yf7u2gBg19W2XWy0I
 oGj0fbdoe0o/Kf+qhTnTFWNXuLsptGrFw0aAHlT5T1Id6/tfNDcflTnQYZOxM0xGECOdcTUbsSg
 pHn7zpHyb/3L14+HImZTPU8Eu0MA59z9m/gOx7PxT92x7yWu6fOvBZg==
X-Gm-Gg: AeBDiesrwmSIIwozweFV6aX+lnoR0FEe4QKO8uK6XHfYGlWvfGHm02ktcl9ErH5VyOy
 AZ1ubVGnuym83f9nWlW9DsExMzdPYlYsnUMOmsHB7fcw6lWYOtydnww850BI6b9EgvgWiuxOO+I
 gY5RDC4KSTTEg91CrES2/qCZ08uOEhd6RIQ+0RVQKReOcKxhuZ8cWET320bufANaNk4+1j2Idj0
 uXbQo/dY0GZWviryi81EW/dUoQ7HcV8GvT9JYL4WhOYscq/5T41auMKCDnZ4Ht5GT0Yc2QjHGEA
 v2Luq4Qz/h5anPkr/oiZ93tzav3acPjT0TgafDmsmYXHCyPdji19nTa5/39l5eR2JGyHc//Lsl7
 o5duY3/jl310VyF5iGnphWVgySGLQuyuwJCTGJR0re2sNPYTzq/Itcgg=
X-Received: by 2002:a05:600c:4512:b0:488:ac01:72b6 with SMTP id
 5b1f17b1804b1-48e51f3a538mr142165845e9.21.1778172694657; 
 Thu, 07 May 2026 09:51:34 -0700 (PDT)
X-Received: by 2002:a05:600c:4512:b0:488:ac01:72b6 with SMTP id
 5b1f17b1804b1-48e51f3a538mr142164735e9.21.1778172693510; 
 Thu, 07 May 2026 09:51:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e5390f854sm131236655e9.14.2026.05.07.09.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 09:51:32 -0700 (PDT)
Message-ID: <667dd47e-bb1a-47d7-bd19-194efade286a@redhat.com>
Date: Thu, 7 May 2026 18:51:31 +0200
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
X-Mimecast-MFC-PROC-ID: RluWsrX5D405JP3mJssouIHAzrjnNIh8p83ecRuoBpk_1778172695
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
hw/core/registerfields.h:#define FIELD_DP32(storage, reg, field, val)
what does this 0?
> +    cmdqv->param = FIELD_DP32(cmdqv->param, PARAM, CMDQV_NUM_CMDQ_LOG2,
> +                              CMDQV_NUM_CMDQ_LOG2);
I was a bit puzzled by the FIELD name being the value name but well.
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
the split looks pretty strange, ie. loop of 2 + continue with individual
setting. why don't you do the init of 

cmdqv->cmdq_err_map in the x4 loop below

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
Thanks

Eric


