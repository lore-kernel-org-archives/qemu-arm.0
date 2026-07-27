Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232F4C53219
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 07:49:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woG5B-00070F-Lh; Mon, 27 Jul 2026 03:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woG59-0006zF-4T
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 03:49:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woG55-0000Kt-Ey
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 03:49:02 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66R7Rdrs3180898
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 07:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HBPVLbu6yw/BFwf738uPlDbTI4TCnEhtsxFEawoQNjc=; b=U7tOKx6mnR/rmtNX
 Q2Meqt2TNd5AqHWbNbbI9j0B3KXQDvx6fBJP4SlPhrR/J1TozJqRp2vQuNN7D+8N
 1Mnb7jsU2Rz7/SCruZ+m6RvQP26+O9v/GnXUOidKu3jsaUu7JOQh2D/AdHBEBMV5
 MLsw53/jJnRG8ETG6JkgN/XwP86mNundBv1Fqykv55Xhp/EuuLynvUorpDiZNEvg
 9OlYyJDjOozk1HwcRnkbCuFtXHfql3yqTAxp5pLdi2eAp20qo8g0SYYH5b3HxuNq
 tt7Bn1iawyjqoaJ3AW2OXEQGAxC0OdV3ze5k/7uUa+F+rGwZrkpEWorV3SaBs+DS
 OnIvRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngyst9nb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 07:48:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c083f1818so29716471cf.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785138535; x=1785743335; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HBPVLbu6yw/BFwf738uPlDbTI4TCnEhtsxFEawoQNjc=;
 b=ecqsStXmp1oTchJtBQnnIuq3rbeZjN60QfW8BybdMtSmfYL+jcvum122LKJUsbN3Tb
 o2uMGOY15ZYDQIGshok18C5CfZ5HxCuf1iSZ5tvBJAGCHXHSCOCXVFoKF6r11bvQXJGF
 qT5vlYomr4L9e2u7//E+AqYzZIj0XuUMHEVGmuQBgZLBBWM9YnjLOTF2FeD2SVaZEPr6
 p67xV1Qr1HVNfLrcb1rqAEiYwRbUGHsMU97pK1Ab7ZUuVOSFwq0U/a/0ICGOEFglpLVD
 bo8dLNDJD3Y8wqTf4aT88jBCaHzdX37eyRSnJIUeVk/WNmVmn/TOh8fXuG9spEqZfG/L
 WrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785138535; x=1785743335;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HBPVLbu6yw/BFwf738uPlDbTI4TCnEhtsxFEawoQNjc=;
 b=bHTBdNw2DM+/15Bcm+/CPVtF6tAcnUGeD3IaN06PsAK9t4BPwba/oaQ5pY3slMyYOp
 0TBudmUHu2tflScUsIFsSRuQOPAWl70gEkHrzbafD/erKSvDIAPkgVfPm5FmP4ky2iAD
 xNdXBNAiMxH79SOMmK7RI5jCjHpOoWpHIoxX/BpSgfnptPAQOzuBlISXaTFSwux+rWpd
 jvcK25T3WiES3VKEKEoIrDGZipw5VIOLXc7jUnb0WyBvvnNR72+JAgwi/8VPDrObBOyo
 L1oTNsuuTmZDWZBUMJyCdMBvoVf+Ko4OwlZoB/hihUo4G/3b8aCnYJYUqqhfwXxrFmXR
 yJKg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWRBxNYa4o1gxySodCAwR/ai8zDnBPiJmcvX2I/CSJOvsM0j451a8SklDloVm2fbah2baLTLSP0g==@nongnu.org
X-Gm-Message-State: AOJu0YyiHrHqcKx/yJYqwlc9jRdEQ2A9XE97Dq+J2S4FJNKbcMsnEU/w
 KkoXTwZt+I88+av+1IUlCyxterTGnuPV6X9qxH9WmPxnBqA7DJEHW5VKtAtFGQlBRTMx3ip+Zv7
 ZP2cCD8OVchbVrH5Vpiltebo1wdmAtOQRm1xHDfkWmAJzbXDxhyFU/ag=
X-Gm-Gg: AR+sD11yoLWSDpWr33vOjIJHeKZ3ou+ckGkNd0lnDrqghVCoo4ln4M+AJHRydDkVPr1
 mpSdkZGWasXxDbLJsJ7td3/KO1K92bD+ZtID0OGQpSS7XZT0uMscCv0aRhRJR7xM9XW5totA3Jy
 ZvJaXNXv2pl5ExWeUoT9HLOyus7D5PEs8SB6PnAFCRmsOxIbaBt2J+V4doGKIyOLi+WtTCUdSIC
 vdhf4lkVzSmVVBBpa9TJgDjokq612yHx16zCwTjc5Jnc+7iv6BuOq9dSS8b40Ro6mUd9xniQafW
 9G+miz24sLpl9HMQwRaiXJRkTcdxB9jQC75JCQOdV5OrSXyOQE9BHyj5Me4NYjLcCbmJL1LIngw
 Ztcjr7NHKgPnG0nkODIrfCVhTNJq7ZkBWGDDq/ttLm6xdXWqNKcQ=
X-Received: by 2002:a05:622a:2448:b0:51a:8aec:9bbd with SMTP id
 d75a77b69052e-529a8353f25mr77844021cf.19.1785138534923; 
 Mon, 27 Jul 2026 00:48:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:51a:8aec:9bbd with SMTP id
 d75a77b69052e-529a8353f25mr77843841cf.19.1785138534500; 
 Mon, 27 Jul 2026 00:48:54 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f9928fdsm229914945e9.1.2026.07.27.00.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 00:48:53 -0700 (PDT)
Message-ID: <895cc21e-db27-438a-884c-d041eb9abeed@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 09:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/5] hw/arm/stm32f103: instantiate and map GPIO
 ports
Content-Language: en-US
To: Jack Wang <163wangjack@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-rust@nongnu.org, caojunze424@gmail.com
References: <20260726145119.19881-1-163wangjack@gmail.com>
 <20260726145119.19881-4-163wangjack@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260726145119.19881-4-163wangjack@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfX9iBDndTRPOS5
 bqKRBF18qyjdfof7kKt2n2V7L2CyGiUwheUaGnTV51BxFO/gSa4D8mUNE4QVvMVnz3ML9h7yzVW
 WrakqhsIF58rEVGt0fWu1J7OaJk0uOroPfNVjsHi8GWFcVQsxbf4KFMm8pePk6LRYtFCGOX57du
 d1vvglvSdI56IhmITVLm6f9t5mNxYmzTUHEaCdS1OIZh6nRHH8UoJcdM557b8HemoO3rRSElKhF
 FnZT105RwSHhoC/Asu22ZVQ5wSqoc14JwANY0pCEfpJdq9rrIVVWPiCJNV79nF26I9wCT/ww7eB
 sbnZTFS4YFymSb+iMl8WJ3Pa/qe97ptM+Euycv4CHeNwSJ/m3w+7wHVLzkulEtABruht9g99hKy
 XcM77YPak3pOq8zAYMTva70k8+PFi3fVd2CMO82tjdhwwWxhCgdybBdQbeeOp6oYu3Ddm87YmLt
 yxsJjUINPHGFwxbpkYA==
X-Proofpoint-GUID: 0tCTUSQfQSKhMp5Mixyyp6m5W16KLOxG
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a670d67 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=qXP6Gehid05EP52y37IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfX7oCQ+tZwKx5R
 LSZWilRPyzk0u78tjqBtrW4CzP1sqaQ4Ocy77U8qKA7zu8F6D+I94uhijlPA7+PNhpofNk4u/1C
 Wq9Y2sgJkqB8Az0Qm8epPA7GJGTI4zI=
X-Proofpoint-ORIG-GUID: 0tCTUSQfQSKhMp5Mixyyp6m5W16KLOxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270076
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 26/7/26 16:51, Jack Wang wrote:
> Create the seven GPIO ports GPIOA..GPIOG by name via qdev_new() and map
> them at their APB2 base addresses, removing the corresponding
> unimplemented-device stubs so the real devices back that range.
> 
> The Rust GPIO type is only present in a Rust-enabled build, so the ports
> are created behind an object_class_by_name() check; with --disable-rust
> the type is absent and the range is simply left unbacked.
> 
> Signed-off-by: Jack Wang <163wangjack@gmail.com>
> ---
>   hw/arm/Kconfig                 |  1 +
>   hw/arm/stm32f103_board.c       |  2 +-
>   hw/arm/stm32f103_soc.c         | 54 +++++++++++++++++++++++++++++-----
>   include/hw/arm/stm32f103_soc.h |  9 ++++++
>   4 files changed, 58 insertions(+), 8 deletions(-)


> +/* GPIO addresses: GPIOA, GPIOB, GPIOC, GPIOD, GPIOE, GPIOF, GPIOG */
> +static const uint32_t gpio_addr[] = {

   static const uint32_t gpio_addr[STM32F103_NUM_GPIOS] = {

> +    0x40010800, 0x40010C00, 0x40011000, 0x40011400, 0x40011800, 0x40011C00,
> +    0x40012000
> +};
> +
>   static const int usart_irq[] = { 37, 38, 39, 52, 53 };
>   static const int spi_irq[]   = { 35, 36, 51 };
>   #define ADC_IRQ 18
> @@ -199,6 +209,37 @@ static void stm32f103_soc_realize(DeviceState *dev_soc, Error **errp)
>                              qdev_get_gpio_in(DEVICE(&s->adc_irqs), i));
>       }
>   
> +    /*
> +     * GPIO ports GPIOA..GPIOG.
> +     *
> +     * These are implemented by the Rust device "stm32f1xx-gpio-rust", created
> +     * by name with qdev_new() and mapped at its APB2 base address.  On STM32F1
> +     * a GPIO port has no dedicated NVIC line of its own: pin-change interrupts
> +     * are delivered through the EXTI controller (not yet modelled), so no
> +     * sysbus_connect_irq() to the NVIC is done here.
> +     *
> +     * The GPIO port is only provided by the Rust build; when QEMU is built
> +     * with --disable-rust the type is not registered, so skip creating the
> +     * ports and leave the address range unbacked.
> +     */
> +    if (object_class_by_name(TYPE_STM32F1XX_GPIO_RUST)) {
> +        for (i = 0; i < STM32F103_NUM_GPIOS; i++) {
> +            g_autofree char *name = g_strdup_printf("gpio%c", 'a' + i);
> +            s->gpio[i] = qdev_new(TYPE_STM32F1XX_GPIO_RUST);
> +            /*
> +             * Give each port a stable QOM name ("/machine/soc/gpioa"..) so
> +             * tests and the monitor can reach it and its gpio-out lines by
> +             * path.
> +             */
> +            object_property_add_child(OBJECT(s), name, OBJECT(s->gpio[i]));
> +            busdev = SYS_BUS_DEVICE(s->gpio[i]);
> +            if (!sysbus_realize_and_unref(busdev, errp)) {
> +                return;
> +            }
> +            sysbus_mmio_map(busdev, 0, gpio_addr[i]);
> +        }
> +    }

Please keep the UNIMP regions:

       else {
          create_unimplemented_device("GPIOA",       0x40010800, 0x400);
          ...
          create_unimplemented_device("GPIOG",       0x40012000, 0x400);
       }

> +
>       /*
>        * Unimplemented peripherals -- STM32F103 devices that do not yet
>        * have QEMU models.
> @@ -231,13 +272,12 @@ static void stm32f103_soc_realize(DeviceState *dev_soc, Error **errp)
>       /* APB2 peripherals */
>       create_unimplemented_device("AFIO",        0x40010000, 0x400);
>       create_unimplemented_device("EXTI",        0x40010400, 0x400);
> -    create_unimplemented_device("GPIOA",       0x40010800, 0x400);
> -    create_unimplemented_device("GPIOB",       0x40010C00, 0x400);
> -    create_unimplemented_device("GPIOC",       0x40011000, 0x400);
> -    create_unimplemented_device("GPIOD",       0x40011400, 0x400);
> -    create_unimplemented_device("GPIOE",       0x40011800, 0x400);
> -    create_unimplemented_device("GPIOF",       0x40011C00, 0x400);
> -    create_unimplemented_device("GPIOG",       0x40012000, 0x400);
> +    /*
> +     * GPIOA..GPIOG (0x40010800..0x40012000) are real devices mapped in the
> +     * GPIO loop above when the Rust build is used, so they must NOT be
> +     * registered as unimplemented devices here: overlapping MemoryRegions at
> +     * the same address abort at runtime.
> +     */
>       create_unimplemented_device("timer[1]",    0x40012C00, 0x400);
>       create_unimplemented_device("timer[8]",    0x40013400, 0x400);
>       create_unimplemented_device("timer[9]",    0x40014C00, 0x400);
> diff --git a/include/hw/arm/stm32f103_soc.h b/include/hw/arm/stm32f103_soc.h
> index 260f3695c0..8d78360ce0 100644
> --- a/include/hw/arm/stm32f103_soc.h
> +++ b/include/hw/arm/stm32f103_soc.h
> @@ -40,6 +40,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F103State, STM32F103_SOC)
>   #define STM32F103_NUM_USARTS 5
>   #define STM32F103_NUM_SPIS 3
>   #define STM32F103_NUM_ADCS 3
> +#define STM32F103_NUM_GPIOS 7


