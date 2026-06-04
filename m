Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A310CD6E6B
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 12:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wV6os-0005b0-6N; Thu, 04 Jun 2026 08:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wV6ol-0005ZJ-60
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 08:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wV6oj-0007kS-Hk
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 08:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780574695;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWp2RSDCvMDMihzheVnZxgAJCtfA1V9HskT1OAMbe6E=;
 b=Hc5cc0ZZql6uattPOT/r3plzWdFi53hLczRzPNzYC9OD7jMeKLdV490MOTJ2sD/d+uGMaV
 RdrHH2ZbeSssVCcr0ZsFlFy5jp3BWQhf/aXn8JKEBGtIBdG8IeoFR8dnIe7DdW8tdHcUr2
 73q82y5nKaQEiTPrLHFJSsTyGH9ziTU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-Q4t_Xt4SP9Kfn_9M7xR1YQ-1; Thu, 04 Jun 2026 08:04:52 -0400
X-MC-Unique: Q4t_Xt4SP9Kfn_9M7xR1YQ-1
X-Mimecast-MFC-AGG-ID: Q4t_Xt4SP9Kfn_9M7xR1YQ_1780574691
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-490b4d3d3e6so5138455e9.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 05:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780574691; x=1781179491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWp2RSDCvMDMihzheVnZxgAJCtfA1V9HskT1OAMbe6E=;
 b=jIK+WtgfaLKfCzqNnk0mHcwzt1S7lE5DPtW67nrApbz4ucicLPXwQpmUpSCWOfobOQ
 Gx2dK84Jmr9o2s3G5rsAVs00mUdYEfCF6PRoMyO4+e7pAtLP7qXnXh/8bp0qgJVvNFif
 9OA6fVJaIkSSbqcMT+NzMDvF6g8N5vwAglb+jts+V6PPVt3QVWeU/1/PlQq0ZMPu0QKU
 OuQyNgBrpAJAxnqnkLj2wnsHqSdt0l4Rlt+Fuw95pAZ1qvhahf7TpgsNu0BZbLbEJKDN
 3FecNyth4s4kf6zcet0RoXgw8EZZyeAayiOw1V/VjR+L5OYsb5BjINbk8DItSHPj55pU
 nr+w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+9HtmjjpafYX0RlhzsVaFDIHgSA3hKfuo8ELcuHDjOrt21mnvVN0wa7Pgr/mREw8FeSk53iA/NUg==@nongnu.org
X-Gm-Message-State: AOJu0Yy8imXZpF2TXOMU7LzRS6jV+dIucsWTFMyhJr8LMd9qBhafdC7+
 6H1XZgRpUX8CCoroicRtcXRLK0tNkfYdu9KD2jxM/dKu76x/prE4ILCtaWRpqFuotvqMIabZMWo
 BhiXgYKrldBLcZTfEAcc1b99sRaNqs6GiOttI+mcaFHZK8VumlPT7aw==
X-Gm-Gg: Acq92OGAbBzf215fccbeQ0eOEHTyPRgS2cfqaVMsiVC8G+vB1BUckw4SffSXCN0Hxk8
 8lZ0U829ODvtFwhTC5S30+kmZYAnWU3kqBeGFN3njps/a8D+yf5d2m1Y1WFwcKsrkUVgaLZaOnp
 HiVmAfZ01JkoNeBJulcMjCYiUZNiD2L5gIUh+EVWhErlLsRMdFGGmvuG1P/EJbPFdfHE7sVx3rC
 yaZRpyNxpqHP9Wc7DOLdqP/o0qUIJa3MkuWzUppgjOmTbkswl+VqykyMBtZNQ/uJdOxo+TNmayC
 GxAAdz9dg2qS60SCzDdjACbWX2zyR4XjrFes8ShmKJt2bnMNzMOyVFejwMPyoyiwETHztTpUdHE
 2AcFWsesJ92yjkp4PrFlnNCpYup0r0AxxY7XsO/nWJC5pafH0fbs6YXKCZhugdr1RtjUsQP+TIg
 4npwVT
X-Received: by 2002:a05:600c:a09:b0:490:688b:f9f8 with SMTP id
 5b1f17b1804b1-490b5fe6672mr124374485e9.27.1780574691079; 
 Thu, 04 Jun 2026 05:04:51 -0700 (PDT)
X-Received: by 2002:a05:600c:a09:b0:490:688b:f9f8 with SMTP id
 5b1f17b1804b1-490b5fe6672mr124373775e9.27.1780574690619; 
 Thu, 04 Jun 2026 05:04:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcb13sm15562980f8f.2.2026.06.04.05.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 05:04:50 -0700 (PDT)
Message-ID: <0a3a4401-2c1f-485c-b0b4-5f435c0a58fa@redhat.com>
Date: Thu, 4 Jun 2026 14:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/31] hw/arm/tegra241-cmdqv: Limit queue size based on
 backend page size
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260601114221.457995-1-skolothumtho@nvidia.com>
 <20260601114221.457995-26-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260601114221.457995-26-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eGAHzpbQr5OIZxacH789wzGxKVvL5fBafNhaHp1hJ5w_1780574691
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 6/1/26 1:42 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> CMDQV HW performs DMA accesses to guest queue memory by its host
> physical address set up via IOMMUFD. This requires the guest queue
> to be contiguous in both guest PA and host PA space. With Tegra241
> CMDQV enabled, we must only advertise a command queue size (CMDQS)
> that the host can safely back with physically contiguous memory.
> Allowing a queue size larger than the host page size could cause
> the hardware to DMA across page boundaries, leading to faults.
>
> Use qemu_minrampagesize() to find the smallest memory-backend page
> size in use, then cap IDR1.CMDQS so the guest cannot configure a
> command queue that exceeds that contiguous backing.
>
> Note this is done at SMMUv3 init, before any guest queue GPA is
> known, so the cap is conservative. Maximum queue size is 8MiB;
> it is recommended to back the VM with hugepage sizes large enough
> so CMDQS stays at the HW maximum. Smaller backing pages reduce
> CMDQS accordingly.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/tegra241-cmdqv.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index ac17b56c1c..661c46e3d9 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -16,6 +16,8 @@
>  #include "hw/arm/smmuv3-common.h"
>  #include "hw/core/irq.h"
>  #include "smmuv3-accel.h"
> +#include "smmuv3-internal.h"
> +#include "system/hostmem.h"
>  #include "tegra241-cmdqv.h"
>  #include "trace.h"
>  
> @@ -874,6 +876,8 @@ free_viommu:
>  static void tegra241_cmdqv_init_regs(SMMUv3State *s, Tegra241CMDQV *cmdqv)
>  {
>      int i;
> +    long pgsize;
> +    uint32_t val;
>  
>      cmdqv->config = V_CONFIG_RESET;
>      cmdqv->param = FIELD_DP32(0, PARAM, CMDQV_VER, CMDQV_VER);
> @@ -905,6 +909,22 @@ static void tegra241_cmdqv_init_regs(SMMUv3State *s, Tegra241CMDQV *cmdqv)
>          cmdqv->vcmdq_base[i] = 0;
>          cmdqv->vcmdq_cons_indx_base[i] = 0;
>      }
> +
> +    /*
> +     * CMDQ must not cross a physical RAM backend page. Adjust CMDQS so the
> +     * queue fits entirely within the smallest backend page size, ensuring
> +     * the command queue is physically contiguous in host memory.
> +     *
> +     *   IDR1.CMDQS = log2(max_qsz) - entry_shift
> +     *
> +     * where entry_shift = 4 (each CMDQ entry is 16 bytes = 2^4).
> +     */
> +    pgsize = qemu_minrampagesize();
> +    if (pgsize == LONG_MAX) {
> +        pgsize = qemu_real_host_page_size();
> +    }
> +    val = FIELD_EX32(s->idr[1], IDR1, CMDQS);
> +    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS, MIN(ctz64(pgsize) - 4, val));
>  }
>  
>  static void tegra241_cmdqv_reset(SMMUv3State *s)


