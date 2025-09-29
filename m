Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0195ACAC5B5
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 10:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3B97-0006Ji-4n; Mon, 29 Sep 2025 06:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3B8z-0006IC-81
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:30:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3B8o-0000zB-88
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:30:07 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e52279279so6192635e9.3
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 03:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759141788; x=1759746588; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=otAPHpF296cQRbkad8nJc1OL9RjMt5npNGBCIIgYjjk=;
 b=oHJkUW8lRsDS3WnE3vwz5kiGpU7QRlrWBxV1Oc6rvsLWmeHi9JAWg9ybD7YCvK5OP+
 OP+44By9aZm+yCrnnee5PdvWco7pnDfh4pa7Lym8KqkAxg1vwRdRxQtGUPQ7P5jOJKNj
 4HSSjHjM4mGltYrhJt+Bad+gOUSzWnIFfTx/DHN1Ar/ijaOJl+zz2hnBlQ6eA2Zy5n8e
 dddPNgo0Yvmr3DeRqv948zNOlkIKWbgLFO4r3Gs2Ab0z6Xy533poxhoQKjqT529tE7bz
 XeZQwvcvnk75uPP1V3CtAjuJDpVeKT4LGmdbPzHqjFpuEeBrO7C1b1SnNWM1+0W0m/91
 bZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759141788; x=1759746588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=otAPHpF296cQRbkad8nJc1OL9RjMt5npNGBCIIgYjjk=;
 b=FsTz0xlGppf08R7j2OlsB1c7s3q3PtoKCUpw8RBLlQcD3DngcGqoCw2JYds6PHfrd3
 RT3ruB0dkWKGyPr9ZUGS/162FpEhVjGzYSqm+Se48m4JVDHbQd2D1EDdHafUybK04m7G
 e4ZvA0u5PUnbWqXvzffVQCxidW7ohcawxGkG09qntDdnnfCyoTbyvWhis6yBNvZKBXdE
 nWxOw4Q1AETp5lg8vFNLVZjhOtNIn+0z+5chscOoRl97LSBCOJDhe5LKmov+loFYueog
 kqiCD8upaINTe4NvUN0+TGr3g2TND4exNTBBVnKO9zs2dirrbyvkNFaA7d1wJxkg7gF3
 n4eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkU1ngiz1/I2r6aAtDjZ1g88JfnyrVjuyqKWDByYPi6fP/jJDbTGkeUscwT8TCihw50OLYQ4N7AA==@nongnu.org
X-Gm-Message-State: AOJu0Yz8rwphwqadZuiNN/ZAfO49uwcMvPCgm/AC02riCnRaDYRaA4HW
 HGf29lfqQaemiAcHHqQVLomCS4HvJas/5x+NFQpn7lQmPRVtmK8wDY/cfYFwNZQTpVI=
X-Gm-Gg: ASbGnct2+mj6oUjKzjo5IhtE0HJy1/Cdk+g4pp+6POagaDxC2oWY3QufAEkUUFxFZwf
 XJ4TeQEncK938Zmpng6bIDv6DEWacmA634q2dRAk7iDjP4RrARaOeBfxjsNgVXEyL8dW/JIgIor
 JsUTiYTf8N2CPBAVKiTv7CktfRuuLnmNuePeEXadn+0oMylCygqvNQWRL1agkIldSTZA0VCXnqO
 cdeiS8PB6MLU+5cxVofklVDAsbxVo9Lv5/bmnZuo0+cwl8NCNBJVkndHvn//zfo7pLbPr8UFzlr
 AjMSQRr/OW0AHo0iYBQ0VKJkpyIAGxYkpHRDucj4U2t/X2Ofz2UaDbJW1HnIlRWsh4Ds+lAkyy5
 jMV2BLRjp2K6+cgotm8lyz33WZiDaGwYzBs9ASSthB5SoWB/pdHjNXCNme68Hg87LgXju5w//cI
 XZrf+4vwSh730=
X-Google-Smtp-Source: AGHT+IEzIqLWC40sIcLP4pzyn0PWDTxBSFuP3gEHvLfuYpMq03WARSKLDjdji4/v424gk34fyqNSXw==
X-Received: by 2002:a05:600c:3f0f:b0:46e:3d50:362a with SMTP id
 5b1f17b1804b1-46e3d50376dmr100544695e9.4.1759141788466; 
 Mon, 29 Sep 2025 03:29:48 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab48b40sm218569975e9.19.2025.09.29.03.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 03:29:47 -0700 (PDT)
Message-ID: <e6ccb911-59ca-451e-bd00-3b788087c04a@linaro.org>
Date: Mon, 29 Sep 2025 12:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/47] hw/intc/arm_gicv3: Introduce a 'first-cpu-index'
 property
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250926070806.292065-1-luc.michel@amd.com>
 <20250926070806.292065-24-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250926070806.292065-24-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/9/25 09:07, Luc Michel wrote:
> From: Francisco Iglesias <francisco.iglesias@xilinx.com>
> 
> Introduce a 'first-cpu-index' property for specifying the first QEMU CPU
> connected to the GICv3. This makes it possible to have multiple instances
> of the GICv3 connected to different CPU clusters.
> 
> For KVM, mark this property has unsupported. It probably does not make
> much sense as it is intented to be used to model non-SMP systems.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
> Reviewed-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   include/hw/intc/arm_gicv3_common.h | 1 +
>   hw/intc/arm_gicv3_common.c         | 3 ++-
>   hw/intc/arm_gicv3_cpuif.c          | 2 +-
>   hw/intc/arm_gicv3_kvm.c            | 6 ++++++
>   4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 572d971d22c..38aa1961c50 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -227,10 +227,11 @@ struct GICv3State {
>       MemoryRegion iomem_dist; /* Distributor */
>       GICv3RedistRegion *redist_regions; /* Redistributor Regions */
>       uint32_t *redist_region_count; /* redistributor count within each region */
>       uint32_t nb_redist_regions; /* number of redist regions */
>   
> +    uint32_t first_cpu_idx;

Could we have a description for this new field? (Can be done by another
patch on top).

>       uint32_t num_cpu;
>       uint32_t num_irq;
>       uint32_t revision;
>       uint32_t maint_irq;
>       bool lpi_enable;

