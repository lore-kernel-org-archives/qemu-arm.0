Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F69CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 08:58:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRncU-0007Gj-QE; Tue, 26 May 2026 04:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRncT-0007Fq-Aq
 for qemu-arm@nongnu.org; Tue, 26 May 2026 04:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRncQ-0007Td-T0
 for qemu-arm@nongnu.org; Tue, 26 May 2026 04:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779785912;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSFBycUc/8AuE6rkD5m+1O2GuSbjZf8hW5E6sMadxcM=;
 b=Ko9HJRFBYhStRUMu6G87ybB8xRTmA/89xxVeJkXYS84r6K12TaZE3c5jFfiOmzZFzY/y8T
 0qUsfGQST4HYfLBuzC4Nmolh/H0MT8aqY+/4UibiVFsGuu9r0vOVrqw21tQ1UZV5d86SYP
 zF1BYEL72euVCVejWxum8ubJxev+tVw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-clCI0zXPPYqSM31S46YFCA-1; Tue, 26 May 2026 04:58:31 -0400
X-MC-Unique: clCI0zXPPYqSM31S46YFCA-1
X-Mimecast-MFC-AGG-ID: clCI0zXPPYqSM31S46YFCA_1779785910
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49049100a40so23772705e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 01:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779785910; x=1780390710;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hSFBycUc/8AuE6rkD5m+1O2GuSbjZf8hW5E6sMadxcM=;
 b=sUMjbBFx5sOHDnrvqP+ahlhd2RLnp6y9iCI3twlRRTaLL0M0wCM6DZWGTfm61Ie2xN
 cjIcigJStBUCT+aCV0Vu0NnVvZA4v7jkYt0JpJ5ZfZtu8f+FmPIoZPsgvkd1ZtD9KjMA
 Ljc/Zh5Lp3hD7iWmmK8u8Jwai8Byf2Qyi2pOMsS8sj2RVlsQ2QDoW40aZHxtQ3TqVwCy
 is5EAhETyuwqifjh0gbQTWSbC0mHcDOJSki9NsVUNCaU9z1845nz5tcxSNeipmsB7D1f
 reo4iXpDHGS6T7WKFWMAnY4FnaeossMqcRmYqlGtC+Mx/ey62ct1SuLbNYccIsJYzgGY
 dJNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VnMwb2V2uPQsLs3BRCrtdjGXxqBH6WlIUZOx5faIzcWxfmLrw4YVdHw0VakGZR/XQmFCJdQsFqg==@nongnu.org
X-Gm-Message-State: AOJu0YyojpZwBXO20cfBebfyOh1pzz+FculYxiieEawEb99F6pAH2Nb4
 Pekk/iv2BXiX/DuEOaC6vrxyaP3pQaqvxHWyJlTHgM14Uwx6EwTU54hS/wk3oGdYKUA40lwWWPj
 d54oWWLzlu1eSvxNAZdusN0xJ2MeZyOsC0t9AA6Rb4Pd3a9uOEPqDRA==
X-Gm-Gg: Acq92OEasVtAClr6B6JsCSCdPJLBSyMqc9lX0Yh8f8SMqIIr12aP6dnpu/FE9qJDbpS
 QiV4AE5ntwmlKz27/Bp5tsIkFcWdvMkPU++LggkHxx5KdD6WYkwkhmrtLq1e3T5XADbh8c2iB0B
 ym+SXZztILhFpS8Rxlc4IhesVm6aj+PDwspB1f5seCNN6JBlf1T5i2SUsM9p4xSgEG6ngmWRRiX
 lj2wxoblt0v70XdQgVLxUyhEup4KX0It89tGZzr+2pSHYbDjWMRmTL55tK75B4NBKoo2SzCoEQY
 OGMesz1uYHh4iiOw5o9h+FnjIJzORj0zwvsXjRqeS6d6fC2H94Hb7P0cL6dU8H+q3VfvN8XAhwR
 EGLzFKsRCianvqUDBldNg+9QBSFpXW1f3d39scirzIYeHPOv87NAOs8C99j1WBkCmsON6/g==
X-Received: by 2002:a05:600c:a0c:b0:490:6e12:542d with SMTP id
 5b1f17b1804b1-4906e12555amr76246915e9.19.1779785909702; 
 Tue, 26 May 2026 01:58:29 -0700 (PDT)
X-Received: by 2002:a05:600c:a0c:b0:490:6e12:542d with SMTP id
 5b1f17b1804b1-4906e12555amr76246525e9.19.1779785909295; 
 Tue, 26 May 2026 01:58:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454c60b5sm340035955e9.1.2026.05.26.01.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 01:58:28 -0700 (PDT)
Message-ID: <7eed6bab-d135-4c25-87dd-8a2be459bb1b@redhat.com>
Date: Tue, 26 May 2026 10:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/32] hw/arm/tegra241-cmdqv: Add reset handler
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-26-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-26-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: epeW8lagNcfQzuh5OZm0_31z7U2YQqq7_Nc1h2mSOkU_1779785910
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
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

Hi Shameer,

On 5/19/26 12:37 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Introduce a reset handler for the Tegra241 CMDQV and initialize its
> register state.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h |  3 +++
>  hw/arm/tegra241-cmdqv.c | 48 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events     |  1 +
>  3 files changed, 52 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index e9e1933a19..34cb5efb84 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -87,6 +87,9 @@ FIELD(CONFIG, CMDQ_MAX_CLK_BATCH, 4, 8)
>  FIELD(CONFIG, CMDQ_MAX_CMD_BATCH, 12, 8)
>  FIELD(CONFIG, CONS_DRAM_EN, 20, 1)
>  
> +/* CMDQV_EN=1, PER_CMD_OFFSET=16B, CLK_BATCH=256, CMD_BATCH=32. */
> +#define V_CONFIG_RESET 0x00020083
> +
>  REG32(PARAM, 0x4)
>  FIELD(PARAM, CMDQV_VER, 0, 4)
>  FIELD(PARAM, CMDQV_NUM_CMDQ_LOG2, 4, 4)
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 0bba2c1801..ad64f06260 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -853,8 +853,56 @@ free_viommu:
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
> +
> +    for (i = 0; i < 2; i++) {
> +        cmdqv->vi_err_map[i] = 0;
> +        cmdqv->vi_int_mask[i] = 0;
> +    }
> +    for (i = 0; i < 4; i++) {
> +        cmdqv->cmdq_err_map[i] = 0;
> +        cmdqv->vintf_cmdq_err_map[i] = 0;
> +    }
> +    cmdqv->vintf_config = 0;
> +    cmdqv->vintf_status = 0;
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
> index 5afbceee83..5ebb3dc9ea 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -76,6 +76,7 @@ smmuv3_accel_install_ste(uint32_t vsid, const char * type, uint32_t hwpt_id) "vS
>  tegra241_cmdqv_read_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
>  tegra241_cmdqv_write_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
>  tegra241_cmdqv_err_map(uint32_t map3, uint32_t map2, uint32_t map1, uint32_t map0) "hw irq received. error (hex) maps: %04X:%04X:%04X:%04X"
> +tegra241_cmdqv_init_regs(uint32_t param) "hw info received. param: 0x%04X"
why 'hw info received'.

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

>  tegra241_cmdqv_read_vcmdq_page0(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page0 offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  tegra241_cmdqv_read_vcmdq_page1(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page1 offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  tegra241_cmdqv_write_vcmdq_page0(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page0 offset0: 0x%"PRIx64" val: 0x%"PRIx64


