Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447D3C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 21:04:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whvud-0003OV-8L; Thu, 09 Jul 2026 17:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whvub-0003O8-GA
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 17:04:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whvuZ-0005bO-Mb
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 17:04:01 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669HY3W42520612
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 21:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MCHsDhRkjv0bAIdOYCKgBtR1pOxExvwo9e3ZrTaYk+0=; b=nvV/IIRe+FGWpdHI
 oLNmurv56Tn/haICJKaANORDbk2DVWI3pQJf7B2YWoe3Q+LKQIb6ObxVpEodRUef
 8xiJN9pIbZrLehD0ck5CW4IfGA/IOYIMjyBynXGYntbGnHycKH+Aw8S93JtZHSSg
 7vNWm4FuNkVrU+lqwy7XHJ6ooapvoZCppd9tvrzyvCo6Xy9xoU0TL+iD0YTTIwei
 +MR+kmwCoRZ2TA99qxDjN9YTXkiS2ZnhzAJ+YMl/+1PSpJaK8J8+MG/ZpGYeG1mv
 4RPSi9A3swV822u6a7nZHjPuFkU8/OUSkzUzb33afaQpxnkz6uCGHnsG/NpqmjFj
 Mq0G2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn9ex9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 21:03:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c26012cd0so2329921cf.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783631037; x=1784235837; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MCHsDhRkjv0bAIdOYCKgBtR1pOxExvwo9e3ZrTaYk+0=;
 b=SddLri8CCZOAzKVWrirYCSDqHtSD3mxPUCicDcN1rZAOiBM/dxT9+8w/Mu8rlU50gX
 OUEgLHufFzsEnElJuIJwYpUd5gjB+DMYJQQQP4cyg8rXe5uN7s4jIE0AcNkRvlRuYozH
 UiZmfuV3i/m0zd8TXqAIsbkaftKbKkrnnJFSlSXAuJ0zY0jjBf2F4XFKLdWqzK/vqEA4
 KKNCyJCAzttDCHl3n1Ly0/+6t08YwDm1YpR2M+CJiwq39IHXS+IR4FuEXAlJCfwC8xXT
 zfYXSa2glmizzeIN+v9vdZjC8g+jGXZ+c1acbmEhRcLTIvdssp6Uj3ywfF6kmG5ANK8L
 5kJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783631037; x=1784235837;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MCHsDhRkjv0bAIdOYCKgBtR1pOxExvwo9e3ZrTaYk+0=;
 b=NvY15V/JYtingly5VpAl2ACktJvFQ4H1VRTH3tcDhb8ylWLTardxDfXel1FnD5X2RE
 08uCWBoar5Czq6PdKmTssQOLRP9TwdJo8lcKl3xkMfOP7Oc5foXIgq+FP/OcYN9gisAc
 XwRaMotOT0MAKtatezsWvxkFUMTbY+7zmM6IrwugfWwkBf34V0jQjoH3wz1s9XojCOGM
 Dfr9a1p0RQde0wdgHNH+8l9Ch+jIGH8/QiouBDHKUAk/LHqoh2elvUUw636ahvQFq0VT
 E0KgHJHSCkYzRSPORtJrPxT2EDKv7SawU2+hnY2F9zvAsLx6Hbi2/WyIzvG5A9thEXMj
 k2Mw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoCN2dJaoBYUuLS2EyfXH7HilGKunRUj95oxtNoM6YEMHlDFBbv+m03ENw35kOktIzdpztaq4R1IQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz0lTxoRtq7+bOm8NXdnKB4xW9a+hARZL9BIfHNelYDS6VhOMx1
 39JXOeUig5O0etLZb6vpgaH2JyrTEQUAHJmheG78gycS6DUcwXIuEfI/wh/bBUeSJIfdk2pWRHT
 G2uaHmKYXbOqB/nvg4WuRGNShExMsg3IDjAyy9ZDqcnDCRoIamNPd5c4=
X-Gm-Gg: AfdE7cnJSRJjUP81WxAqhHYsTtyNccGK2PQFS61SGzy1LvQgz1RYnHkyX4o6SayYkMP
 aVlmjX0HJeM1DOuQsuc3S2l18S4/5rx9U1rH7kuyQhQhTg4N9602+mTwacEPRGzglrbo3LJMo7E
 1pxRW8NxO8t85UHhapzHMyJ6vWpPFL5XfcPuRttpD0EivAXmVBMG6BwA3qJSYGB/U/UPgsARTre
 uygefV7g+h6rT8QICi5qGoWuZRm+Wts/MaINSS+NSOGYGK2HTbmXZrBp4NXyNW0WLJB7X2D0ogG
 5nO0MSLY9oTyeXUBFu1nLqaPvaMHMsryGhDLSgCqTzNvhlmnR5xEFB2ZV2IT0tD+7Xn5Nyz07+n
 nSY0U69i79ALZbpm7Eg++ged9SgznPCCmlJKucGQ8a9MO9M9fVlqLjLjSLtKutA==
X-Received: by 2002:a05:622a:113:b0:51a:8c97:938c with SMTP id
 d75a77b69052e-51c8b5671f5mr112944141cf.67.1783631037206; 
 Thu, 09 Jul 2026 14:03:57 -0700 (PDT)
X-Received: by 2002:a05:622a:113:b0:51a:8c97:938c with SMTP id
 d75a77b69052e-51c8b5671f5mr112943541cf.67.1783631036749; 
 Thu, 09 Jul 2026 14:03:56 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm7718105e9.1.2026.07.09.14.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 14:03:55 -0700 (PDT)
Message-ID: <6537f5d6-4e21-4e55-8a21-2818a7d7fa28@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 23:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] hw/usb/aspeed-udc: Add ASPEED UDC device controller
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260703074332.1049473-1-jamin_lin@aspeedtech.com>
 <20260703074332.1049473-2-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260703074332.1049473-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxMCBTYWx0ZWRfX5L3risxUMVKc
 OmSEIeZgFi9AQkHxZX5mPK+FLLB2miB1LkVZjpynPMBgJilfn3UTpUPcjyMFSLP8+xG1+X9u2Hh
 N73rz4J7ZokFp+LEmwDAx4SF65xqC7c=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a500cbe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=V2NxCb60AAAA:8 a=C6oVvHcd0U7zB2UF4PsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: Oyh57Hq-SEH9HCfc4NcfwSqn6l52zIY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxMCBTYWx0ZWRfX4X5miToR8h3O
 chnpOqaA1jfyHPwjfedf+jfYDUOWGyme0nm1rt+OqVvxbj8k90GwuiwQK3CSjJXRLMwUROA7cV9
 GdYI4XgE9PqqKiCjTBbHMFAgGWH0NHMh7EgwmBOQh48ueI/WYoFnc5P308n5ETL51eyGPDZtJQx
 c6xJYcbqtGcCVA4dRi/LSW5tDTwoDZ+j+tghr1h2EzqcPmvSqe8Uc2eqAqLxDWPyqpEuMCbDkZQ
 6NqVxWvnYDCOd3krk1Do+I5aqQmuRu9Lt0U7dc5VC5TOxaofUNVUWBjL9/s/n1FFl2HcRNSSnh5
 AbwT6dSbpSVUP/Qz6e16moZk8UCELZgLfkKc5wPDI2cDkcXtyQP9DiLiF1rh5MouoVA+73EyTds
 x/6qauzWhtfx3W758Sv60t+9DhXrx9gbw5mFNz3fzKfoVZUSiXu85IKydi0AKi5opqrePXVBkTe
 TAR9e7xhhEkNL/ug6ng==
X-Proofpoint-ORIG-GUID: Oyh57Hq-SEH9HCfc4NcfwSqn6l52zIY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090210
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

Hi Jamin,

On 3/7/26 09:43, Jamin Lin wrote:
> The AST2600 has a USB 2.0 Device Controller (UDC) at 0x1e6a2000 with one
> control endpoint and four programmable endpoints, driven by the Linux
> "aspeed_udc" gadget driver.
> 
> Add the controller as a sysbus (system) device: the MMIO register map
> described with the registerfields macros, the interrupt line and the
> soft reset. This is only the register/system side.
> 
> Note: this "device controller" is the system-bus device (TYPE_ASPEED_UDC).
> It is not the gadget USB device (TYPE_ASPEED_UDC_DEV) that a host
> controller enumerates, which is added in the next patch.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/Kconfig              |   1 +
>   hw/usb/Kconfig              |   4 +
>   hw/usb/aspeed-udc.c         | 264 ++++++++++++++++++++++++++++++++++++
>   hw/usb/meson.build          |   1 +
>   hw/usb/trace-events         |   7 +
>   include/hw/usb/aspeed-udc.h |  54 ++++++++
>   6 files changed, 331 insertions(+)
>   create mode 100644 hw/usb/aspeed-udc.c
>   create mode 100644 include/hw/usb/aspeed-udc.h


> +static void aspeed_udc_realize(DeviceState *dev, Error **errp)
> +{
> +    AspeedUDCState *s = ASPEED_UDC(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    int i;
> +
> +    s->regs = g_new0(uint32_t, ASPEED_UDC_NR_REGS);
> +
> +    memory_region_init(&s->iomem, OBJECT(s), TYPE_ASPEED_UDC,
> +                       ASPEED_UDC_REG_SIZE);
> +
> +    /* Root/global registers occupy the low part of the window */
> +    memory_region_init_io(&s->reg_mr, OBJECT(s), &aspeed_udc_ops, s,
> +                          TYPE_ASPEED_UDC ".regs", ASPEED_UDC_NR_REGS << 2);
> +    memory_region_add_subregion(&s->iomem, 0, &s->reg_mr);
> +
> +    /* Each programmable endpoint has its own register bank */
> +    for (i = 0; i < ASPEED_UDC_NUM_EP; i++) {
> +        g_autofree char *name = g_strdup_printf(TYPE_ASPEED_UDC ".ep%d", i);
> +
> +        s->ep[i].index = i;
> +        s->ep[i].regs = g_new0(uint32_t, ASPEED_UDC_EP_NR_REGS);

Why allocate a fixed size? Otherwise LGTM.

> +        memory_region_init_io(&s->ep[i].mr, OBJECT(s), &aspeed_udc_ep_ops,
> +                              &s->ep[i], name, ASPEED_UDC_EP_NR_REGS << 2);
> +        memory_region_add_subregion(&s->iomem, ASPEED_UDC_EP_REG_BASE +
> +                                    i * ASPEED_UDC_EP_REG_SIZE, &s->ep[i].mr);
> +    }
> +
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +}

> +static void aspeed_udc_unrealize(DeviceState *dev)
> +{
> +    AspeedUDCState *s = ASPEED_UDC(dev);
> +    int i;
> +
> +    for (i = 0; i < ASPEED_UDC_NUM_EP; i++) {
> +        g_free(s->ep[i].regs);
> +    }
> +    g_free(s->regs);
> +}

> +/*
> + * EP0 (control) is served through the root registers (UDC_EP0_*), so only
> + * the 4 programmable endpoints get their own register bank / ep[] entry.
> + */
> +#define ASPEED_UDC_NUM_EP       4
> +/* 32-bit registers per programmable endpoint */
> +#define ASPEED_UDC_EP_NR_REGS   4
> +
> +/*
> + * The root/global register block spans 0x000...0x087: the SETUP data buffer
> + * ends at 0x84. Size the backing array to cover the whole block.
> + */
> +#define ASPEED_UDC_NR_REGS      (0x88 >> 2)
> +
> +/* MMIO window: root registers below EP_REG_BASE, then the per-EP banks */
> +#define ASPEED_UDC_REG_SIZE     0x300
> +#define ASPEED_UDC_EP_REG_BASE  0x200
> +#define ASPEED_UDC_EP_REG_SIZE  0x10
> +
> +typedef struct AspeedUDCEP {
> +    MemoryRegion mr;
> +    int index;
> +    uint32_t *regs;
> +} AspeedUDCEP;
> +
> +struct AspeedUDCState {
> +    SysBusDevice parent_obj;
> +
> +    /* container: root registers + per-endpoint banks */
> +    MemoryRegion iomem;
> +    MemoryRegion reg_mr;
> +    qemu_irq irq;
> +    uint32_t *regs;
> +    AspeedUDCEP ep[ASPEED_UDC_NUM_EP];
> +};
> +
> +#endif /* HW_USB_ASPEED_UDC_H */


