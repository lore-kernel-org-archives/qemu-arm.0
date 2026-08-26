Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7B5C61DC2
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 08:11:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wz8jF-0000nP-BN; Wed, 26 Aug 2026 04:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8jE-0000n8-1S
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:11:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8jC-0007ZF-Hc
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:11:23 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67Q6RuAY122867
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xxo1fwcb+qkyCrnrmston4CFk/I1SyxJ8I2wPSzghlQ=; b=aLn5adhmvmcS9Psu
 dMsJk3YXVvxhPAWXEsYzyzh8j/qfIlHGNy4gB8zu/03rH9dsvgtH1DGkJyWTVr/V
 HN/XNgvgcA80qCki1m/Z7sgWZMtdXFAJWdA2z1BBcFFArHw4coCxhOaLdIn714qT
 JHi38bXAZuUXEJHzxcA7nrT/Xw3j/DewGk40E0itMAg5KYkD5SyLjqpNF2eA5JSB
 8ZcmnyoaGT7RPDEGqf6S1ehHl4IMZTda/YadpqL66VzLwSI0BVym99C/gpHt8Tz3
 HDDoHNPImzPPx5MQxACU6syl2Pab9AsPTvloZQqDrt1b9PxhAZDB64vl1MnaUrkK
 wxj2iQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mtnnd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:11:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso3855061cf.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 01:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787731880; x=1788336680; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xxo1fwcb+qkyCrnrmston4CFk/I1SyxJ8I2wPSzghlQ=;
 b=HmoAIeAb5PuXP6SnMzaf/FR6YtYw1YN9zB77H6QRSaaKYPQFf6LA2bk4ow6fDx4YZy
 6y9kOr1wOhFiH6HbgaFJA0kD8s84HeH9ww+6/Yc8nqUQn4UKoWh/zy+D3vRSTw+aE3Ez
 ln1W+KcH4Z+oM800S9HE2zFfICzz2zKwJaLY9aC/EmMsYkFtQualsChUe+GFoRT6B62q
 cN+zdoMS5t8wVBVH+o6AvKzAAsaZvn2QW8oQTBHjUAUNlY4/CJE8c0y9ZzYCAERo/rWS
 9Ci73LoayDVdRSPdEo/EjWuiY8lxi9L3BU/vuLZJVK6VILD0HQjnxaJiChTrvPlXycd1
 ojCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787731880; x=1788336680;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=xxo1fwcb+qkyCrnrmston4CFk/I1SyxJ8I2wPSzghlQ=;
 b=JV6PF9LO47X2y5TAYsNfU0s0SACWuvZSwodle/KSRG6946Vb0YL2/oLaLTyM9fejgM
 7qwcN2+k+Tq1Qr6zEvDeTPZ+9BK60q9jlJfPd/BVshiHPymedK1QeGPNu6aZiT2XTQ/F
 XABaT2pfUyOsORkxilh1OckgvCPxDhVUSFEkPzLNoA1AhFW5lcOvWlqC2TUNNC3pp0fb
 H8sDbOeHHAwmI8WRIH1LAAHKhWqK1xekLvYXtE4sp+k/WbSry81KkjGQ9bVtHVXFC7X/
 s6OzbtYFyeeAAMVleK2DV6wn8vUSVHNldovxizu/H9+R3bdvFdymWtlvTYZFkJusKvpY
 a+ZQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrX8XRX07DLlaPDrO2YMalQcYRGKiqCxZVU8k74GmT4l7qq6Wv93rFJEA2QnxC1cSDG04l6pvl3FA==@nongnu.org
X-Gm-Message-State: AFuF++nfpiZuF8SCv2PEfGymbT0tYGQhrfIXTJW0RRDfVItpVnYsRiB2
 bRyC59GWsfrZkIpa0aMzbeoV63DXZH50JbdcwOm5vkWJqSY0gtiAMkQuZu7V4DDETVoRKXzgDJ0
 0iMiHt4t0qOHAnaLFMLWwQEsSLpL0vqvhpKDP9N1EMtD54NfOjzujnEw=
X-Gm-Gg: AR+sD13snWoNHMIKDWVjLjm0bynlfNJOCboB6RCcZbN/pBQnOqO/dR8lx0OYrwZza/6
 V6+cdZAXv7WED/Y8OiZcW2yZ7U2MF/Rw3mD1NOPLQ9fcaiL2kBnMrlewOvrallwf+otePeJ7Bgs
 p9Nc/M6tyGl6tUk8+2cBgGmWPbo9dmSexNScXHaZDVJwhveJ3ifSpmvkjvRYWFq6xfVSo1pjklK
 8RNZyE5Tsn/aGVHMtFsU04MQ8JI54+ExuLogXDDzPPU8mnptJBCyBaxtAL2kDQWvbBvhweMfS+H
 HcquVbj1d1wQKPDS4IWibfrvrMuJbAj57VZk1jPK6tjzq6Lc+D69aj9jaLGL4EZMTpen4ABKGG5
 qrS9+0KwP6JjKqcey5hXojpuA+4W4xNWbrfavEb4=
X-Received: by 2002:ac8:7f8d:0:b0:519:f420:d780 with SMTP id
 d75a77b69052e-52e4234e850mr42995301cf.30.1787731880275; 
 Wed, 26 Aug 2026 01:11:20 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:519:f420:d780 with SMTP id
 d75a77b69052e-52e4234e850mr42994831cf.30.1787731879838; 
 Wed, 26 Aug 2026 01:11:19 -0700 (PDT)
Received: from [10.254.188.74] (14.89.66.37.rev.sfr.net. [37.66.89.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f854dsm1887068f8f.36.2026.08.26.01.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 01:11:19 -0700 (PDT)
Message-ID: <5e22ac73-0650-493d-a099-c88cbb74b397@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] hw/char/cadence_uart: Reserve MMIO with dynamic
 size
Content-Language: en-US
To: Kuan-Jui Chiu <kchiu@axiado.com>, 163wangjack@gmail.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20260826074635.2850931-1-kchiu@axiado.com>
 <20260826074635.2850931-5-kchiu@axiado.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826074635.2850931-5-kchiu@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfXx91acNzmVcKv
 8k9+1TD7yDsRbgd2H7ijbpuYG/rmlbKWdWNGqwVqtjAsjcBlMZR1NN0y7/jwo4dBKmCnPkx5haA
 TJT3qHB9kJ3Vzq2YK8CejqvmsG+g/zA=
X-Proofpoint-ORIG-GUID: cuITLNQCr3ndDGD-Np0cY2s1qFNuSSCP
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8e9fa8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=JQZmDyB7+sUo+n2VpL1TLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=440cDlBIAAAA:8 a=ouh_vfZ40caHO2bnYAEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfX7CGGPPLEj44/
 uan28gEOlfgQv0oXqQElFxhP5YEKpK9Pk8DzWAN5kfcTVftfi/Wfn36XfytF3g2tCGpNIfafW++
 Xe9CwkW6gMUdFR8D1GY1ZeKBUycp9YqqwuwYXh5H/eV5kJyRA+jzbfFEH4IY0vBkiTgr62tZyhE
 NNcqSV5+32fLJ+7lr7JkSurO6B4HKUsOe+Qm6G2PvOD/P+vpEjty7YAz5jd2ebN7ULjGqiDWrAw
 z5BoCe+r9OG4PKZjlmm/qPagcqP01rb9azhiov78wpdiMUyd0pNwsV9NCaXoI/owLtTFIhQ+IGL
 8Q0SN4H1NidY7Gpkw+ZefmmcuYz+zeze3Q/sMhVQEtJ35cVUf6QWz8fAySPE1TRlJWBMrl71CTb
 zCJ07Y2CugGcF39ARacPqwPVz8N8Cz8vbWMx56Xr4WIYWClAY11pkUcdcISRh3dJyVLGEYi29qA
 xs0EbDrVMn8GtvsWKOg==
X-Proofpoint-GUID: cuITLNQCr3ndDGD-Np0cY2s1qFNuSSCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260066
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

On 26/8/26 09:46, Kuan-Jui Chiu wrote:
> Candence UART model is reserving 4 KiB for registers statically
> For other SoC models, the MMIO size may be not 4 KiB which would have
> overlapping sysbus regions in QEMU
> 
> This patch adds a property which allows other models to revise the MMIO
> size and it is 4 KiB by default
> 
> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
> ---
>   hw/char/cadence_uart.c         | 8 ++++++--
>   include/hw/char/cadence_uart.h | 3 +++
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index f57cad57a8..d83c71b877 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -541,6 +541,10 @@ static void cadence_uart_realize(DeviceState *dev, Error **errp)
>   {
>       CadenceUARTState *s = CADENCE_UART(dev);
>   
> +    memory_region_init_io(&s->iomem, OBJECT(dev), &uart_ops, s, "uart",
> +                          s->mmio_size);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> +
>       s->fifo_trigger_handle = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                             fifo_trigger_update, s);
>   
> @@ -561,8 +565,6 @@ static void cadence_uart_init(Object *obj)
>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>       CadenceUARTState *s = CADENCE_UART(obj);
>   
> -    memory_region_init_io(&s->iomem, obj, &uart_ops, s, "uart", 0x1000);

Are we sure this size is even correct and not a copy/paste error?
We can clearly reduce it up to 0x80 (so far the last register
implemented is R_TTRIG at address 0x44).

> -    sysbus_init_mmio(sbd, &s->iomem);
>       sysbus_init_irq(sbd, &s->irq);
>   
>       s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk",
> @@ -621,6 +623,8 @@ static const VMStateDescription vmstate_cadence_uart = {
>   
>   static const Property cadence_uart_properties[] = {
>       DEFINE_PROP_CHR("chardev", CadenceUARTState, chr),
> +    DEFINE_PROP_SIZE("mmio-size", CadenceUARTState, mmio_size,
> +                     CADENCE_UART_MMIO_SIZE),
>   };


