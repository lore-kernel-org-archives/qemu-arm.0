Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BAFFCA168
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 17:45:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzef7-0003Rf-7c; Mon, 09 Mar 2026 13:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzeea-00031X-2d
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzeeW-00028s-Ko
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773078260;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5//QpP/4iX4uMHy0Q8XnPGhG/7HFLs/aXp/5g/ECkY=;
 b=avNPLT5h5n3Psj6P0JNj4EoSD35Gna9v1ubIWrfY6At+pBXEKSOkVfnBQ/m2kmpYJCymMB
 SUzBGo+xBq3rO5mYPk04LisLYyIOitovz+CpdqXERe4BXeIWlERM6hpuNEa7xM+qW6Hb5s
 hxjUQUgkGW9nCXxa10htXzgcZujbj/E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-GPIWHg2uOz6MMLsG7m-kpg-1; Mon, 09 Mar 2026 13:44:18 -0400
X-MC-Unique: GPIWHg2uOz6MMLsG7m-kpg-1
X-Mimecast-MFC-AGG-ID: GPIWHg2uOz6MMLsG7m-kpg_1773078257
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439b9116e2eso5477565f8f.2
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 10:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773078257; x=1773683057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5//QpP/4iX4uMHy0Q8XnPGhG/7HFLs/aXp/5g/ECkY=;
 b=owMI4dEAC6rASqfmuvG2ec3CDQWSkZQzgIdKIfR/ooBMjZJIvaGouen7tJyyXzFjpW
 3yehRAK0EKYWVUR2AYzalL9nNAA3Zkb+juckO5iM2SGEjnv1WicjP+30koRz9B4i5uUY
 V5/3uwAMdkokWWxv8dAtlA4lL7B3W8X4T4zisFD1KHsazuWhKwodIZnxqa44HEL29Yji
 jJ914IFLS6knGot+EQKm64CNowfCSUz88UkrS3+b9kL6ZlsibOCJ7nksw32OudA53iyi
 aarfKlYypYUcRN9xJltYzh/3qPV+Y3pkg8oNto3m+Qef2T6jIRqnnTIA1HZwv/VZN9pH
 2/mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKO9FfX3kwILPcehzmWMJ9OUX99nbL3zMWtwrtoqlNyIHNF7dLjh+Nmy/TmO14nlouVdlX07Qv1g==@nongnu.org
X-Gm-Message-State: AOJu0Yxxakr/99mUVdD4dY5+ph5m+CxLBi66QN4O4M/o+YBJH78cIqhi
 9lC7RafbrsEdaM6Vpg3a7Div564YiXZy6Y77nNSoaSyeh8uIoKnFmJxIXrVQGpU4BWudtr01pgc
 qPjUAdRATetXATqyEaDQ/KvLcc+baJIZYaXbqLgJPyyvGBsWxu21MWQ==
X-Gm-Gg: ATEYQzxNFbETz/MPALG7HF7tGpRLMn/5gzveh/CO0vNQzHiaMwsdklnJGmFDUx3EwYg
 bevHjZS11eE4+GScYRWQ4uHFzHVLROmln6gX9xib9+6cJz5EgY9k/teGi7DJaQyCxoQWiu76IjU
 r5VEKBvHAZTGWySxeOB0pY4OyJXDwKxztAddfgZkSNWdlDnnBrFp9q2tb02lJWOp9M/6cZyOdeo
 Tgtf6FgMOCvI2UR8zo4z0Cb2JQ4aCy23fxOFuWZ0Tav14OOjKR79Jp6q6kr/weJh/nfvUkn1eOF
 8+B7U6fzVbmLHYO4WMMrfWWGww6RWwnBF4jsQy4jfUmKzRL2OoGIBMaK6KJiK3YkNa3TbpCdNwx
 2SVYokmRj+HwMV4LWsZYcr7+WGZ+9haH1BObfUEKiYpW84OteIXgIAMPlyxYSkqTpy+9mBA==
X-Received: by 2002:a5d:584c:0:b0:439:ac53:a94d with SMTP id
 ffacd0b85a97d-439da6694dcmr21468404f8f.29.1773078257300; 
 Mon, 09 Mar 2026 10:44:17 -0700 (PDT)
X-Received: by 2002:a5d:584c:0:b0:439:ac53:a94d with SMTP id
 ffacd0b85a97d-439da6694dcmr21468340f8f.29.1773078256771; 
 Mon, 09 Mar 2026 10:44:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8daf2sm28911889f8f.2.2026.03.09.10.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 10:44:15 -0700 (PDT)
Message-ID: <1b64d8d1-85d9-4894-8813-d645977aee68@redhat.com>
Date: Mon, 9 Mar 2026 18:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/32] hw/arm/tegra241-cmdqv: Emulate global and VINTF
 VCMDQ register reads
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-16-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-16-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: leo0YM-UDcrQgchYBw9fuzM-FyHJmFm5aZDWFfm5Hf8_1773078257
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Tegra241 CMDQV exposes per-VCMDQ register windows through two MMIO views:
>
>   -Global VCMDQ registers at 0x10000/0x20000
Spec mentions CMDQV_CMDQ_BASE and CMDV_VI_CMDQ_BASE offset. You could
refer to that here and in the code (See fig 3.1).
Also there are size macros that could be used too.

By the way why do you name them "Global". Is that a spec terminology?

What I am really missing overall is the guest pov. I think I understand
the VMM is supposed to create some VIs, assign some VCMDQs to those VI
(that the guest will be able to have direct mapping to), define which
VMID, SIDs are going to use this VI/VCMDQS + conversion from vSID to
pSID. But then? what does the guest sees and what does he needs to program.


>   -VINTF VCMDQ (VI_VCMDQ) registers at 0x30000/0x40000
>
> The VI_VCMDQ register ranges are an alias of the global VCMDQ registers
> and are only meaningful when a VCMDQ is mapped to a VINTF via ioctl
> IOMMU_HW_QUEUE_ALLOC.
If the guest detects he can use a single VMCDQs (I guess he can
introspect this by reading the SMMU_CMDQ_PARAM_0) how does he know if he
shall access your so-called "Global VCMD regs" at 0x10000 or VI0 regs
(0x30000-40000). How does the guest know that he is supposed to use VI0? 

Thanks

Eric
>
> Add read side emulation for both global VCMDQ and VI_VCMDQ register
> ranges. MMIO accesses are decoded to extract the VCMDQ instance index
> and normalized to a VCMDQ0_* register offset, allowing a single helper
> to service all VCMDQ instances.
>
> VI_VCMDQ accesses are translated to their equivalent global VCMDQ
> offsets and reuse the same decoding path. All VCMDQ reads are currently
> served from cached register state.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.h | 178 ++++++++++++++++++++++++++++++++++++++++
>  hw/arm/tegra241-cmdqv.c |  77 +++++++++++++++++
>  2 files changed, 255 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
> index 50bcecee9d..d379b8860c 100644
> --- a/hw/arm/tegra241-cmdqv.h
> +++ b/hw/arm/tegra241-cmdqv.h
> @@ -48,6 +48,14 @@ typedef struct Tegra241CMDQV {
>      uint32_t vintf_sid_match[16];
>      uint32_t vintf_sid_replace[16];
>      uint32_t vintf_cmdq_err_map[4];
> +    uint32_t vcmdq_cons_indx[TEGRA241_CMDQV_MAX_CMDQ];
> +    uint32_t vcmdq_prod_indx[TEGRA241_CMDQV_MAX_CMDQ];
> +    uint32_t vcmdq_config[TEGRA241_CMDQV_MAX_CMDQ];
> +    uint32_t vcmdq_status[TEGRA241_CMDQV_MAX_CMDQ];
> +    uint32_t vcmdq_gerror[TEGRA241_CMDQV_MAX_CMDQ];
> +    uint32_t vcmdq_gerrorn[TEGRA241_CMDQV_MAX_CMDQ];
> +    uint64_t vcmdq_base[TEGRA241_CMDQV_MAX_CMDQ];
> +    uint64_t vcmdq_cons_indx_base[TEGRA241_CMDQV_MAX_CMDQ];
>  } Tegra241CMDQV;
>  
>  /* Global CMDQV MMIO registers (offset 0x00000) */
> @@ -141,6 +149,176 @@ A_VINTFi_LVCMDQ_ERR_MAP_(0, 0)
>  /* Omitting [0][1~2] as not being directly called */
>  A_VINTFi_LVCMDQ_ERR_MAP_(0, 3)
>  
> +/*
> + * VCMDQ register windows.
> + *
> + * Page 0 @ 0x10000: VCMDQ control and status registers
> + * Page 1 @ 0x20000: VCMDQ base and DRAM address registers
> + */
> +#define A_VCMDQi_CONS_INDX(i)                       \
> +    REG32(VCMDQ##i##_CONS_INDX, 0x10000 + i * 0x80) \
> +    FIELD(VCMDQ##i##_CONS_INDX, RD, 0, 20)          \
> +    FIELD(VCMDQ##i##_CONS_INDX, ERR, 24, 7)
> +
> +A_VCMDQi_CONS_INDX(0)
> +A_VCMDQi_CONS_INDX(1)
> +
> +#define V_VCMDQ_CONS_INDX_ERR_CERROR_NONE 0
> +#define V_VCMDQ_CONS_INDX_ERR_CERROR_ILL_OPCODE 1
> +#define V_VCMDQ_CONS_INDX_ERR_CERROR_ABT 2
> +#define V_VCMDQ_CONS_INDX_ERR_CERROR_ATC_INV_SYNC 3
> +#define V_VCMDQ_CONS_INDX_ERR_CERROR_ILL_ACCESS 4
> +
> +#define A_VCMDQi_PROD_INDX(i)                             \
> +    REG32(VCMDQ##i##_PROD_INDX, 0x10000 + 0x4 + i * 0x80) \
> +    FIELD(VCMDQ##i##_PROD_INDX, WR, 0, 20)
> +
> +A_VCMDQi_PROD_INDX(0)
> +A_VCMDQi_PROD_INDX(1)
> +
> +#define A_VCMDQi_CONFIG(i)                             \
> +    REG32(VCMDQ##i##_CONFIG, 0x10000 + 0x8 + i * 0x80) \
> +    FIELD(VCMDQ##i##_CONFIG, CMDQ_EN, 0, 1)
> +
> +A_VCMDQi_CONFIG(0)
> +A_VCMDQi_CONFIG(1)
> +
> +#define A_VCMDQi_STATUS(i)                             \
> +    REG32(VCMDQ##i##_STATUS, 0x10000 + 0xc + i * 0x80) \
> +    FIELD(VCMDQ##i##_STATUS, CMDQ_EN_OK, 0, 1)
> +
> +A_VCMDQi_STATUS(0)
> +A_VCMDQi_STATUS(1)
> +
> +#define A_VCMDQi_GERROR(i)                               \
> +    REG32(VCMDQ##i##_GERROR, 0x10000 + 0x10 + i * 0x80)  \
> +    FIELD(VCMDQ##i##_GERROR, CMDQ_ERR, 0, 1)             \
> +    FIELD(VCMDQ##i##_GERROR, CONS_DRAM_WR_ABT_ERR, 1, 1) \
> +    FIELD(VCMDQ##i##_GERROR, CMDQ_INIT_ERR, 2, 1)
> +
> +A_VCMDQi_GERROR(0)
> +A_VCMDQi_GERROR(1)
> +
> +#define A_VCMDQi_GERRORN(i)                               \
> +    REG32(VCMDQ##i##_GERRORN, 0x10000 + 0x14 + i * 0x80)  \
> +    FIELD(VCMDQ##i##_GERRORN, CMDQ_ERR, 0, 1)             \
> +    FIELD(VCMDQ##i##_GERRORN, CONS_DRAM_WR_ABT_ERR, 1, 1) \
> +    FIELD(VCMDQ##i##_GERRORN, CMDQ_INIT_ERR, 2, 1)
> +
> +A_VCMDQi_GERRORN(0)
> +A_VCMDQi_GERRORN(1)
> +
> +#define A_VCMDQi_BASE_L(i)                       \
> +    REG32(VCMDQ##i##_BASE_L, 0x20000 + i * 0x80) \
> +    FIELD(VCMDQ##i##_BASE_L, LOG2SIZE, 0, 5)     \
> +    FIELD(VCMDQ##i##_BASE_L, ADDR, 5, 27)
> +
> +A_VCMDQi_BASE_L(0)
> +A_VCMDQi_BASE_L(1)
> +
> +#define A_VCMDQi_BASE_H(i)                             \
> +    REG32(VCMDQ##i##_BASE_H, 0x20000 + 0x4 + i * 0x80) \
> +    FIELD(VCMDQ##i##_BASE_H, ADDR, 0, 16)
> +
> +A_VCMDQi_BASE_H(0)
> +A_VCMDQi_BASE_H(1)
> +
> +#define A_VCMDQi_CONS_INDX_BASE_DRAM_L(i)                             \
> +    REG32(VCMDQ##i##_CONS_INDX_BASE_DRAM_L, 0x20000 + 0x8 + i * 0x80) \
> +    FIELD(VCMDQ##i##_CONS_INDX_BASE_DRAM_L, ADDR, 0, 32)
> +
> +A_VCMDQi_CONS_INDX_BASE_DRAM_L(0)
> +A_VCMDQi_CONS_INDX_BASE_DRAM_L(1)
> +
> +#define A_VCMDQi_CONS_INDX_BASE_DRAM_H(i)                             \
> +    REG32(VCMDQ##i##_CONS_INDX_BASE_DRAM_H, 0x20000 + 0xc + i * 0x80) \
> +    FIELD(VCMDQ##i##_CONS_INDX_BASE_DRAM_H, ADDR, 0, 16)
> +
> +A_VCMDQi_CONS_INDX_BASE_DRAM_H(0)
> +A_VCMDQi_CONS_INDX_BASE_DRAM_H(1)
> +
> +/*
> + * VI_VCMDQ register windows (VCMDQs mapped via VINTF).
> + *
> + * Page 0 @ 0x30000: VI_VCMDQ control and status registers
> + * Page 1 @ 0x40000: VI_VCMDQ base and DRAM address registers
> + */
> +#define A_VI_VCMDQi_CONS_INDX(i)                       \
> +    REG32(VI_VCMDQ##i##_CONS_INDX, 0x30000 + i * 0x80) \
> +    FIELD(VI_VCMDQ##i##_CONS_INDX, RD, 0, 20)          \
> +    FIELD(VI_VCMDQ##i##_CONS_INDX, ERR, 24, 7)
> +
> +A_VI_VCMDQi_CONS_INDX(0)
> +A_VI_VCMDQi_CONS_INDX(1)
> +
> +#define A_VI_VCMDQi_PROD_INDX(i)                             \
> +    REG32(VI_VCMDQ##i##_PROD_INDX, 0x30000 + 0x4 + i * 0x80) \
> +    FIELD(VI_VCMDQ##i##_PROD_INDX, WR, 0, 20)
> +
> +A_VI_VCMDQi_PROD_INDX(0)
> +A_VI_VCMDQi_PROD_INDX(1)
> +
> +#define A_VI_VCMDQi_CONFIG(i)                             \
> +    REG32(VI_VCMDQ##i##_CONFIG, 0x30000 + 0x8 + i * 0x80) \
> +    FIELD(VI_VCMDQ##i##_CONFIG, CMDQ_EN, 0, 1)
> +
> +A_VI_VCMDQi_CONFIG(0)
> +A_VI_VCMDQi_CONFIG(1)
> +
> +#define A_VI_VCMDQi_STATUS(i)                             \
> +    REG32(VI_VCMDQ##i##_STATUS, 0x30000 + 0xc + i * 0x80) \
> +    FIELD(VI_VCMDQ##i##_STATUS, CMDQ_EN_OK, 0, 1)
> +
> +A_VI_VCMDQi_STATUS(0)
> +A_VI_VCMDQi_STATUS(1)
> +
> +#define A_VI_VCMDQi_GERROR(i)                               \
> +    REG32(VI_VCMDQ##i##_GERROR, 0x30000 + 0x10 + i * 0x80)  \
> +    FIELD(VI_VCMDQ##i##_GERROR, CMDQ_ERR, 0, 1)             \
> +    FIELD(VI_VCMDQ##i##_GERROR, CONS_DRAM_WR_ABT_ERR, 1, 1) \
> +    FIELD(VI_VCMDQ##i##_GERROR, CMDQ_INIT_ERR, 2, 1)
> +
> +A_VI_VCMDQi_GERROR(0)
> +A_VI_VCMDQi_GERROR(1)
> +
> +#define A_VI_VCMDQi_GERRORN(i)                               \
> +    REG32(VI_VCMDQ##i##_GERRORN, 0x30000 + 0x14 + i * 0x80)  \
> +    FIELD(VI_VCMDQ##i##_GERRORN, CMDQ_ERR, 0, 1)             \
> +    FIELD(VI_VCMDQ##i##_GERRORN, CONS_DRAM_WR_ABT_ERR, 1, 1) \
> +    FIELD(VI_VCMDQ##i##_GERRORN, CMDQ_INIT_ERR, 2, 1)
> +
> +A_VI_VCMDQi_GERRORN(0)
> +A_VI_VCMDQi_GERRORN(1)
> +
> +#define A_VI_VCMDQi_BASE_L(i)                       \
> +    REG32(VI_VCMDQ##i##_BASE_L, 0x40000 + i * 0x80) \
> +    FIELD(VI_VCMDQ##i##_BASE_L, LOG2SIZE, 0, 5)     \
> +    FIELD(VI_VCMDQ##i##_BASE_L, ADDR, 5, 27)
> +
> +A_VI_VCMDQi_BASE_L(0)
> +A_VI_VCMDQi_BASE_L(1)
> +
> +#define A_VI_VCMDQi_BASE_H(i)                             \
> +    REG32(VI_VCMDQ##i##_BASE_H, 0x40000 + 0x4 + i * 0x80) \
> +    FIELD(VI_VCMDQ##i##_BASE_H, ADDR, 0, 16)
> +
> +A_VI_VCMDQi_BASE_H(0)
> +A_VI_VCMDQi_BASE_H(1)
> +
> +#define A_VI_VCMDQi_CONS_INDX_BASE_DRAM_L(i)                             \
> +    REG32(VI_VCMDQ##i##_CONS_INDX_BASE_DRAM_L, 0x40000 + 0x8 + i * 0x80) \
> +    FIELD(VI_VCMDQ##i##_CONS_INDX_BASE_DRAM_L, ADDR, 0, 32)
> +
> +A_VI_VCMDQi_CONS_INDX_BASE_DRAM_L(0)
> +A_VI_VCMDQi_CONS_INDX_BASE_DRAM_L(1)
> +
> +#define A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(i)                             \
> +    REG32(VI_VCMDQ##i##_CONS_INDX_BASE_DRAM_H, 0x40000 + 0xc + i * 0x80) \
> +    FIELD(VI_VCMDQ##i##_CONS_INDX_BASE_DRAM_H, ADDR, 0, 16)
> +
> +A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(0)
> +A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(1)
> +
>  const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void);
>  
>  #endif /* HW_ARM_TEGRA241_CMDQV_H */
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index a3830a02d6..d2e6938e44 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -14,6 +14,46 @@
>  #include "smmuv3-accel.h"
>  #include "tegra241-cmdqv.h"
>  
> +/*
> + * Read a VCMDQ register using VCMDQ0_* offsets.
> + *
> + * The caller normalizes the MMIO offset such that @offset0 always refers
> + * to a VCMDQ0_* register, while @index selects the VCMDQ instance.
> + *
> + * All VCMDQ accesses return cached registers.
> + */
> +static uint64_t tegra241_cmdqv_read_vcmdq(Tegra241CMDQV *cmdqv, hwaddr offset0,
> +                                          int index)
> +{
> +    switch (offset0) {
> +    case A_VCMDQ0_CONS_INDX:
> +        return cmdqv->vcmdq_cons_indx[index];
> +    case A_VCMDQ0_PROD_INDX:
> +        return cmdqv->vcmdq_prod_indx[index];
> +    case A_VCMDQ0_CONFIG:
> +        return cmdqv->vcmdq_config[index];
> +    case A_VCMDQ0_STATUS:
> +        return cmdqv->vcmdq_status[index];
> +    case A_VCMDQ0_GERROR:
> +        return cmdqv->vcmdq_gerror[index];
> +    case A_VCMDQ0_GERRORN:
> +        return cmdqv->vcmdq_gerrorn[index];
> +    case A_VCMDQ0_BASE_L:
> +        return cmdqv->vcmdq_base[index];
> +    case A_VCMDQ0_BASE_H:
> +        return cmdqv->vcmdq_base[index] >> 32;
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_L:
> +        return cmdqv->vcmdq_cons_indx_base[index];
> +    case A_VCMDQ0_CONS_INDX_BASE_DRAM_H:
> +        return cmdqv->vcmdq_cons_indx_base[index] >> 32;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s unhandled read access at 0x%" PRIx64 "\n",
> +                      __func__, offset0);
> +        return 0;
> +    }
> +}
> +
>  static uint64_t tegra241_cmdqv_read_vintf(Tegra241CMDQV *cmdqv, hwaddr offset)
>  {
>      int i;
> @@ -42,6 +82,7 @@ static uint64_t tegra241_cmdqv_read_vintf(Tegra241CMDQV *cmdqv, hwaddr offset)
>  static uint64_t tegra241_cmdqv_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      Tegra241CMDQV *cmdqv = (Tegra241CMDQV *)opaque;
> +    int index;
>  
>      if (offset >= TEGRA241_CMDQV_IO_LEN) {
>          qemu_log_mask(LOG_UNIMP,
> @@ -67,6 +108,42 @@ static uint64_t tegra241_cmdqv_read(void *opaque, hwaddr offset, unsigned size)
>          return cmdqv->cmdq_alloc_map[(offset - A_CMDQ_ALLOC_MAP_0) / 4];
>      case A_VINTF0_CONFIG ... A_VINTF0_LVCMDQ_ERR_MAP_3:
>          return tegra241_cmdqv_read_vintf(cmdqv, offset);
> +    case A_VI_VCMDQ0_CONS_INDX ... A_VI_VCMDQ1_GERRORN:
> +        /*
> +         * VI_VCMDQ registers (VINTF logical view) have the same per-VCMDQ
> +         * layout as the global VCMDQ registers, but are based at 0x30000
> +         * instead of 0x10000.
> +         *
> +         * Subtract 0x20000 to translate a VI_VCMDQ offset into the equivalent
> +         * global VCMDQ offset, then fall through to reuse the common VCMDQ
> +         * decoding logic below.
> +         */
> +        offset -= 0x20000;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_CONS_INDX ... A_VCMDQ1_GERRORN:
> +        /*
> +         * Decode a per-VCMDQ register access.
> +         *
> +         * The hardware supports up to 128 identical VCMDQ instances; we
> +         * currently expose TEGRA241_CMDQV_MAX_CMDQ (= 2). Each VCMDQ
> +         * occupies a 0x80-byte window starting at 0x10000.
> +         *
> +         * The MMIO offset is decoded to extract the VCMDQ index and normalized
> +         * to the corresponding VCMDQ0_* register by subtracting index * 0x80.
> +         *
> +         * A single helper then services all VCMDQs, with @index selecting the
> +         * instance.
> +         */
> +        index = (offset - 0x10000) / 0x80;
> +        return tegra241_cmdqv_read_vcmdq(cmdqv, offset - index * 0x80, index);
> +    case A_VI_VCMDQ0_BASE_L ... A_VI_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        /* Same decode logic as A_VI_VCMDQx_CONS_INDX case above */
> +        offset -= 0x20000;
> +        QEMU_FALLTHROUGH;
> +    case A_VCMDQ0_BASE_L ... A_VCMDQ1_CONS_INDX_BASE_DRAM_H:
> +        /* Same decode logic as A_VCMDQx_CONS_INDX case above */
> +        index = (offset - 0x20000) / 0x80;
> +        return tegra241_cmdqv_read_vcmdq(cmdqv, offset - index * 0x80, index);
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s unhandled read access at 0x%" PRIx64 "\n",
>                        __func__, offset);


