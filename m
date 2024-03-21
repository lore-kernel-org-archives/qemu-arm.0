Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp494393ejv;
        Thu, 21 Mar 2024 06:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWloYuQokADombC/rL7iI82SbCa3uwLg4shy0wcuy8hrqX7CqCx4XwQ/+UT13l1dhizk4g3RbwBgpsUEyl9sqbhbE0oWB5f
X-Google-Smtp-Source: AGHT+IFRvhfBhFLlp04nlcz/DiyvSuHaYGob07/FggqZd168Y1XAPNt4jO6gNg8vLtvmCGEbRGgL
X-Received: by 2002:a05:620a:4951:b0:78a:1e39:2674 with SMTP id vz17-20020a05620a495100b0078a1e392674mr5208647qkn.39.1711027114498;
        Thu, 21 Mar 2024 06:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711027114; cv=none;
        d=google.com; s=arc-20160816;
        b=v0ciEB5dv+6H6kdruP8povxV50aHlUDIg6ze+ctudIWx2LsuUpnu0eSYT4cd8czd/4
         KdAPRY+U7UC0MJaw6edOX1/wDO0+1Gi0jYA7xEimXkQPgLEK2eRuO5Zf6DBruSqVaSWb
         s57mQWGvTXFi2g/KixLxAFjyqnI2+kh8w4nShxPLN9YRvq3SXOtWRjUVaBm/lJM/+PSe
         jar5QeLFnQ97DTPN9Jilj/Rax0uyoeoIJ3BL9fnVfnodhLE/Mjd75lGDxDAmGJCXnPEN
         yQBC+nFU66m2MeDL7NgiFTUKr83Tq6YBD6c30DvOKjRX1pPUhZwDtldDMIegyQq4WloW
         pI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nnG5L9F/+cQzw4vKRYiCun9aRHIZliQRrI9DJfbrDXE=;
        fh=yjHd0vYFcM/QPHTFlYNPjAFChmehTPCgviIznMzliH0=;
        b=JThw3ajGvs45IKkHxWF2nY/JrWhxpB/SqBZTHDwdUnnfe05GrlYOPuXwnccQr2isq4
         9J3z34CEZpiOgJ4sVzYtieQT3CIcNT+6tbKU5PyUSYvX1v964YC3pOWnGX852Qqkn3d8
         MDnFlyJ67fMEqv/3cSg+4Yh3YHachVMhCfDTSiczqpM/B05zGTcAmclismw5hIn+jCHQ
         n+VejOXuGePm14/fhXf6/Zv6A6xhIR73LBZNu+cwnusAXwA86/pihj+5c4JNpq0g9QA9
         bKqaYARLH3iCtlCCGdU2Jw+lW5Lz1USzVKtSsMRybcD9aFd3GzIIJs5RF35IQIdeddU1
         PeVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xXk5v+//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23-20020a37ef17000000b00789ee7a1523si11539173qkk.185.2024.03.21.06.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xXk5v+//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnIJA-00070Y-6s; Thu, 21 Mar 2024 09:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnIJ6-0006yc-Kg
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 09:18:08 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnIJ4-0004Wo-GO
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 09:18:07 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56bcbf40cabso758783a12.0
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711027085; x=1711631885; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nnG5L9F/+cQzw4vKRYiCun9aRHIZliQRrI9DJfbrDXE=;
 b=xXk5v+//hA64cSEGtmSUuGi0czW9j6zAxdJwd6j/Pz/idX+J+9/l5R2FGke/nDbi2x
 OHdGPscvq+8s+Zzv+r2s3A577nvZ5ZNibR8ytKem/RMb/yoJQiTNd/Xs8ubEH1Y280qy
 TjzRp7mGpV46l0lhdroyY4OL/kEArAw8/xEVapi1gS6j+Ibo7xPlbWD5/fTqIvzJ8/Cb
 tTqTXvMPe/u4wV4DXGjsBicoMIaCpIlu3fmlS5juHBsY3kKEkZ7IgMR0rxKNXFzhC32F
 Um5wEwZHtafoH89aqJH1tOk4kwitCBruKrYkXb0bKkMQHiF/84eWVZlBU+7tRggcBlAs
 pZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711027085; x=1711631885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nnG5L9F/+cQzw4vKRYiCun9aRHIZliQRrI9DJfbrDXE=;
 b=DARdj7BWShDDlEdUO/CKcb5vdML0GQ/lK5EiF6bRH0VoXoc7JwVwleFBKi6zn2lIXm
 lROMpgG5MEme/n8toqkqnQDxymBheboJWO5Spe4G4emtbsmjzu/kP9HnLlvYvwxjFFD4
 Fel5HBtAAJqDwv4N066JXHv+4M+DrIxXDQtdKpOy9exOvP5FtrGst6BP4QvBWkW1x+UP
 ZbqzrrXk59JaHEqXTLINhNPRK/EP8KB23cIeuzbFI5XY83rZJAcYtz5O5kFYpLAmLV+S
 m+sY/PTFcs0nNW3RvAR6qblrcGS9x92t0tSrEweE9Ttydc+wEHYGaxyPIqcjk4MIrgES
 AGUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhQIV8223Uf+XBO1xBBjcDf5iQGfsXaAa/1qVHCuIN//oBX4YsUd3Q36X5BLzY3S72XRJTbIwlXg0myNnzmbV66nRf
X-Gm-Message-State: AOJu0YzMhN+e1+DVvMVSbLAostqzUisqsLuaESiJVL+DfyDTIZGHNvtB
 yrs9uwhQPDNKhsSg44UKCNKOu41xHHttfjxGmyHmpbM08oqv368KlL/wlwWiHIFG5SVq0/i/g6c
 8id/HOUW5ftOkFUv7JcIzudV9mEvyVB1J5ZDT3A==
X-Received: by 2002:a50:c04e:0:b0:568:93f:36c6 with SMTP id
 u14-20020a50c04e000000b00568093f36c6mr1290283edd.22.1711027084764; Thu, 21
 Mar 2024 06:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-14-ruanjinjie@huawei.com>
In-Reply-To: <20240318093546.2786144-14-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Mar 2024 13:17:53 +0000
Message-ID: <CAFEAcA_VWko1zNvbdGNBgHJ3TiC1duiQ0wZLJUnDhLomULVayQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 13/23] hw/intc/arm_gicv3: Add irq superpriority
 information
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3k0oWhkd1BXs

On Mon, 18 Mar 2024 at 09:38, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> A SPI, PPI or SGI interrupt can have a superpriority property. So
> maintain superpriority information in PendingIrq and GICR/GICD.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3:
> - Place this ahead of implement GICR_INMIR.
> - Add Acked-by.
> ---
>  include/hw/intc/arm_gicv3_common.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 7324c7d983..df4380141d 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -146,6 +146,7 @@ typedef struct {
>      int irq;
>      uint8_t prio;
>      int grp;
> +    bool superprio;
>  } PendingIrq;
>
>  struct GICv3CPUState {
> @@ -172,6 +173,7 @@ struct GICv3CPUState {
>      uint32_t gicr_ienabler0;
>      uint32_t gicr_ipendr0;
>      uint32_t gicr_iactiver0;
> +    uint32_t gicr_isuperprio;

This field stores the state that is in the GICR_INMIR0
register, so please name it that way: gicr_inmir0.

>      uint32_t edge_trigger; /* ICFGR0 and ICFGR1 even bits */
>      uint32_t gicr_igrpmodr0;
>      uint32_t gicr_nsacr;
> @@ -274,6 +276,7 @@ struct GICv3State {
>      GIC_DECLARE_BITMAP(active);       /* GICD_ISACTIVER */
>      GIC_DECLARE_BITMAP(level);        /* Current level */
>      GIC_DECLARE_BITMAP(edge_trigger); /* GICD_ICFGR even bits */
> +    GIC_DECLARE_BITMAP(superprio);    /* GICD_INMIR */
>      uint8_t gicd_ipriority[GICV3_MAXIRQ];
>      uint64_t gicd_irouter[GICV3_MAXIRQ];
>      /* Cached information: pointer to the cpu i/f for the CPUs specified
> @@ -313,6 +316,7 @@ GICV3_BITMAP_ACCESSORS(pending)
>  GICV3_BITMAP_ACCESSORS(active)
>  GICV3_BITMAP_ACCESSORS(level)
>  GICV3_BITMAP_ACCESSORS(edge_trigger)
> +GICV3_BITMAP_ACCESSORS(superprio)

This is the state behind the GICD_INMIR<n> registers, and
the GIC spec calls the bits in those registers NMI<x>,
so I would call this bitmap nmi, not superprio.

This commit adds new device state, so it also needs to be migrated.
You'll want to add a new subsection to vmstate_gicv3_cpu which
is present if the GIC implements NMIs, and which has an entry
for the gicr_inmir0 field. Similarly, you want a new subsection
in vmstate_gicv3 which is present if NMIs are implemented and which
has a field for the nmi array.

thanks
-- PMM
