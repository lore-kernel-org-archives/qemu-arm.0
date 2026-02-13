Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4220EDF152
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 10:33:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqqU4-0003n5-OY; Fri, 13 Feb 2026 05:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqqU2-0003ml-VO
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 05:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqqU1-0000u9-5Z
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 05:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770978787;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvvxe81bjVqUoqJH9rH94PaqcHakWrCAZCBlpOyvW6A=;
 b=QtBPHydw7XLp87t5HyNj++Y/EaN7Bk79rhKC6kF5cShFxGytms16+880A//3nY/wr0uoJN
 xTin9Z5ZDmdxpjS7pfM0EtRqQMDxIh+OyTbh7+qTJX88PVopTyRP8Ks6kG6iCt3ufa6O1D
 HvJmHg99+XW0YU8J4ZUgk745jtufRkM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-ETU-d8vOPQWtiO51YSUogA-1; Fri, 13 Feb 2026 05:33:06 -0500
X-MC-Unique: ETU-d8vOPQWtiO51YSUogA-1
X-Mimecast-MFC-AGG-ID: ETU-d8vOPQWtiO51YSUogA_1770978785
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48057c39931so16149075e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 02:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770978785; x=1771583585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lvvxe81bjVqUoqJH9rH94PaqcHakWrCAZCBlpOyvW6A=;
 b=nOka5bRbH4jVQr+3gqj0HH+lirDFVOfIyIn8qygOC911Dbq80d2xeWFpptj3fIDCx5
 stKD64WZCPOUfM1HgpvJxw31rvxD9zpEMLw4w1msYc4sSFsEgxBHDqjpIxsNF7scw/Et
 FNKiqVcvo7ytNpuKXsb9tDm+6tGytMynvG2nbcdbpX6JA+1bfnjHPIhBg12gyX2BmEKW
 Ir/dnmaeMtG1TDEv46MP6/oz0PcD2XFJwTlohVRzfXlPxEvkWGy1qllyZkkP8tQvVGLW
 fObb+PbDHtmERCZZJ+4PuvC+riWHSGEUEUz0TmfkIDeD1w2/QEZXs3ledMzdaX5c/hFP
 Z6JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6rlK2ZGCSDQR7I8V4RylEyBLUPCOxqhmdcHbLHFsV6q7DFZgRVbVUbpSOr2dnD61R4CPAdjjRag==@nongnu.org
X-Gm-Message-State: AOJu0YzS3P6AZYcCWjl8eE6itI0FEQdGtoxjrts6CsDBIdYmeVxyQxhE
 c3Sdz+dU+2B+mmGcIbHlddTiuubvPHXEJKKroz1Qw3hh1sijyXherKL+ArWmAdm8q3117hKuB5n
 golLFUUyYWBE9qV6qddEwaIYXDAfqCUgUFIhQtTosANM297oWxUvjTggjgsjvNw==
X-Gm-Gg: AZuq6aLvwb8sLBmm3mcIs/RwRoSRVuU3oxltVBlrc2J6lZN3iH5Vz2nwHtL9l/T7iGg
 TyAiKTYqZxpkvkr29re/ddkYGkj0v0ssdRBtXibrw1Qf4EMHPExdN10sbTnpBn5MA98E4Fl2uTq
 dcWPeHAA7C5+CF43ulkmGesl8C/ksA+nlwH+GBuycPPurhrTie+CUI9K+u6BpnCN3+7e/OwHr3n
 erlh5cavpTuvYlxPD2dnN66EL1cq5V5GMe9ldBIm1aIW/HPo9lkrm3iGALiy/D0eSIm+ZUN6BxV
 N0+SYF2RNyQ6wn2ql4T5mSFxVQstwHI7+rjSiBbLBg6pDSphNwqCH7vJqcneYmENXVN+SVNSDQl
 dWIrXFTDnHHYTohzbMh6yRAyhHiZVxd6097Xz0Ya+casSeaHNQiXqsrt8zsMVB+OxCZEXrw==
X-Received: by 2002:a05:600c:4f4b:b0:477:9b4a:a82 with SMTP id
 5b1f17b1804b1-48373a7ce5emr21516165e9.35.1770978784801; 
 Fri, 13 Feb 2026 02:33:04 -0800 (PST)
X-Received: by 2002:a05:600c:4f4b:b0:477:9b4a:a82 with SMTP id
 5b1f17b1804b1-48373a7ce5emr21515685e9.35.1770978784192; 
 Fri, 13 Feb 2026 02:33:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0e15bsm155759915e9.13.2026.02.13.02.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 02:33:03 -0800 (PST)
Message-ID: <92832cfa-de59-49c0-8cf3-38cfa80d2c3b@redhat.com>
Date: Fri, 13 Feb 2026 11:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/24] hw/arm/tegra241-cmdqv: Use VINTF page0 for
 mapped VCMDQ registers
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-17-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-17-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Giaq-i3OK-mbIMBjqoSQkncSqzZGhoDbR8iP806iI1s_1770978785
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> When a VCMDQ is mapped and VINTF page0 is available, read and write
> VCMDQ registers directly via the VINTF page0 backing instead of using
> cached register values.

At this stage of the reading I do not really understand the dance
between mmap and not mmapped. Please could you elaborate? 
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 44 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 153fd70edb..c7e70d8e1d 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -38,12 +38,32 @@ static bool tegra241_cmdqv_mmap_vintf_page0(Tegra241CMDQV *cmdqv, Error **errp)
>   *
>   * The caller normalizes the MMIO offset such that @offset0 always refers
>   * to a VCMDQ0_* register, while @index selects the VCMDQ instance.
> - *
> - * All VCMDQ accesses are currently trapped. Use cached registers
>   */
>  static uint64_t tegra241_cmdqv_read_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0,
s/offset0/offset?
>                                            int index)
>  {
> +
> +    /*
> +     * If this VCMDQ is mapped and VINTF page0 is available, read directly
> +     * from the VINTF page0 backing. Otherwise, fall back to cached state.
> +     */
> +    if (cmdqv->vcmdq[index] && cmdqv->vintf_page0_mapped) {
> +        uint64_t off = (index * 0x80) + (offset0 - 0x10000);
> +        uint32_t *ptr = (uint32_t *)(cmdqv->vintf_page0 + off);
nit: you could introduce a static helper that return ptr from cmdqv,
index, offset0 or returns NULL if the VINTF is not mapped. resuable in
write().
> +
> +        switch (offset0) {
> +        case A_VCMDQ0_CONS_INDX:
> +        case A_VCMDQ0_PROD_INDX:
> +        case A_VCMDQ0_CONFIG:
> +        case A_VCMDQ0_STATUS:
> +        case A_VCMDQ0_GERROR:
> +        case A_VCMDQ0_GERRORN:
> +            return *ptr;
> +        default:
> +            break;
> +        }
> +    }
> +
>      switch (offset0) {
>      case A_VCMDQ0_CONS_INDX:
>          return cmdqv->vcmdq_cons_indx[index];
> @@ -241,6 +261,26 @@ tegra241_cmdqv_write_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0, int index,
>                             uint64_t value, unsigned size, Error **errp)
>  {
>  
> +    /*
> +     * If this VCMDQ is mapped and VINTF page0 is available, write directly
> +     * to the VINTF page0 backing. Otherwise, update cached state.
> +     */
> +    if (cmdqv->vcmdq[index] && cmdqv->vintf_page0_mapped) {
> +        uint64_t off = (index * 0x80) + (offset0 - 0x10000);
> +        uint32_t *ptr = (uint32_t *)(cmdqv->vintf_page0 + off);
> +
> +        switch (offset0) {
> +        case A_VCMDQ0_CONS_INDX:
> +        case A_VCMDQ0_PROD_INDX:
> +        case A_VCMDQ0_CONFIG:
> +        case A_VCMDQ0_GERRORN:
> +            *ptr = (uint32_t)value;
> +            return;
> +        default:
> +            break;
> +        }
> +    }
> +
>      switch (offset0) {
>      case A_VCMDQ0_CONS_INDX:
>          cmdqv->vcmdq_cons_indx[index] = value;
Thanks

Eric


