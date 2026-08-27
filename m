Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE471C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 08:50:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzVou-00081h-UT; Thu, 27 Aug 2026 04:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVoo-00080M-6h
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:50:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVol-0000kr-Fv
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:50:41 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R76n7U3226808
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 40rN5bwlaPuxqv5tDaLHOUPXPfypNCn9j4ojI/TTEN4=; b=WGGT6cU9Bfjyfwfa
 mkPrgIuAXanyZx20aAk/RPWEyxm+7n8/zmzZWoTseOLD57LTJ5wZZYJ8kXa1w1CP
 TgaOpGN/T4BArh+HWyn3RoI9hhYSIu/uN+dZsDABcP7h+oL6SDLCcqlKFeJ7azr3
 2z08ybOCEM2PGrysDeVN5m5pSYGTKhpTA53AHQ8xPc3ao9Y4pRtZ+jvnASh6TKiE
 K1OgMqbv9EeQKsax+nfifAb8O6zcoquB84dn/gS4z/Dur9PjzlMhOTL8dkwauJyS
 jDffWUn+bxvrJtqCEFQmUm+cIu0yYQtHKpaqLzMJagb5mJSFk8z3Td4bv2oQtfLg
 Ht3rQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjfrdcx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:50:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52f9f6b85cbso9290221cf.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 01:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787820637; x=1788425437; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=40rN5bwlaPuxqv5tDaLHOUPXPfypNCn9j4ojI/TTEN4=;
 b=jx0MOoCuAH853Dkj3mxvOWCxLs6h2n0T/0brfQ/Q8tiquMmEjfsRNX/DQy9e/hB3wo
 I3561AMaHNiEvweyVkvQw9K7kafmTymckVHjGnJKGtbMWxqwjaIgITkw5Ea2jtS/XBEq
 uQDV8JYh4UrpR7HPV3hEMmslXcFsI2ly4AZrz9YgTOmD/poIYc+JsRk0GqaAXXg9pbbo
 zM1hRsuurQb8qmPpHTVmQsLokcjxM5kJ54XsI6yk//yi4FumZvLniWd0Dmj6skA5xzAe
 qNtLbYVGbWLznLCUhVV1nLaYZd3VmBKEp6EKFEwwPl4X171YpA8Gq/DABUcFhmMVgC93
 5WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787820637; x=1788425437;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=40rN5bwlaPuxqv5tDaLHOUPXPfypNCn9j4ojI/TTEN4=;
 b=OyyOKVq3vQLwc+uymsi8lNVVgq6KsyxI2J5eiJGb+RqvrzyvK0Q87zsy29SnXZE4ej
 OdsB8wnqBji2nfThnvIfYrIji/ovXfn3peOm2HPHrcW+EfVgeKdRvuJ+pe5hjySwuGym
 Spk0VRpLtaUh5F/dwqw/MyRQNZIN7PMQVosPE/0LshneTbXlRVBN18DTil9IinjMVLvw
 4sBhgziacSTQOXaX9s5O4jkMNulwHcCmyxU/3gj+OkhUn3h9a05M6JgZNcrqCzwuRHg3
 KmKJ3VdImfAdjjlkQr8p83ooHQoe4LdxrNvrs5FiXsqmfgXIAMSG+Hvigmkd5dAePW+I
 O0aA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOSxW+FdRUjDF6vGiQ65fGZdbZWFnvdATbIbq7ykfuh4s3GmxtufguYCzaOWeYGDQ2DPvGsNTiPQ==@nongnu.org
X-Gm-Message-State: AFuF++lHOMsxWzqRcHrgcuh7PHr1kgZhi6zp03G9Vt5FwbSM0K4KVxbV
 j9V3iCIZR1dujoHvlWBqS4Dqt00wNHE1uUg7V8/6PPXsWdd4qWVyYHvq2V5H4UT3wrHuyCPjpzE
 hKTvhIucCNZr0T9GX4TvpyUgaSPB9rvcLyqdZSZZ+c9fMsk0V/CMg1d0=
X-Gm-Gg: AR+sD11i0KbVc6faLxhy+b2TvC+DGNtbL1r83BHnlKHw1Q8qZBsYcyy5DafMHyRgYir
 i5mo+BqqdC2caaIL72NEaI9dMu9gFxi+LAxMqcxyaGHbFP25dX1MDCZNBjVrRF+vgx+AKOKpmCL
 mgyuJHg1XSkk7LvQfJEoFYnUDLaOGhGCz585Kgb1kZpZ1Mc4yax+3rQtWjSjnSMWyX8Yvz7HAme
 mC6NUPEjwAodNLVOAvMHcEg9siW9NeRVCITli1wn3935mdnit+i4BIJ+FWmQeJL1ou+wZoQl0W8
 KVtQI/Jw0+1ttT7+M/eTOKKOkxDnRmwZzZg4bNh3cf8DU2lSYPErHb2/d5DZI92TMxh2KfsVPLX
 icU6cLvpMon4q54C3KWwobTSL7nI+0fbRdRTN1irbdRrLtVSY
X-Received: by 2002:a05:622a:148:b0:52e:12e6:6d7b with SMTP id
 d75a77b69052e-52e423f69fcmr128779991cf.39.1787820636871; 
 Thu, 27 Aug 2026 01:50:36 -0700 (PDT)
X-Received: by 2002:a05:622a:148:b0:52e:12e6:6d7b with SMTP id
 d75a77b69052e-52e423f69fcmr128779661cf.39.1787820636455; 
 Thu, 27 Aug 2026 01:50:36 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b49cc61cfsm35507555e9.6.2026.08.27.01.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:50:35 -0700 (PDT)
Message-ID: <33c9db8d-2004-482a-8d86-5400252fe2d2@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] hw/char/cadence_uart: Reserve MMIO with dynamic
 size
Content-Language: en-US
To: Kuan-Jui Chiu <kchiu@axiado.com>, 163wangjack@gmail.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20260826074635.2850931-1-kchiu@axiado.com>
 <20260826074635.2850931-5-kchiu@axiado.com>
 <5e22ac73-0650-493d-a099-c88cbb74b397@oss.qualcomm.com>
 <a3210074-7795-4a9b-b72e-aea0efb53664@axiado.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <a3210074-7795-4a9b-b72e-aea0efb53664@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Lg-W6ABO4xxk49ONd0dSRQFO9JZn-Cj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MiBTYWx0ZWRfX9GDHbg56newZ
 wbdrNgDx3hdKJg9uYgPklk/l7FNtfslOgUniDjVFcn3E44kpewWo02CTRzJb2dQca/OnSGo/uJa
 IpYVhPhUSl41LyEO3xnbpQCPPJx5brv5yutoHq1/VW7iMwRJ+y+XpsZNO5cTJfpQTPi3GrYKI5h
 kB+vOrPFPrnso45iBQrmhMOpZm6c24P2E7iY1KBuP5WC7NJBunwSt1OK01Zeu/OSyLMISeKHiPw
 ldGU89uDh5MkPtr5Od+pK8+M0FgwUKEKCzuo2XzKdljixnbXwWwcpRhphutqkd2PlRioVmL1GVI
 qWJcjWdUDcyXPsIWCDqtWKdM7NI/MTI1TPxTXumzN8tqwvtStr/kXZjKyo91YYrBcWTIhB1Yiuv
 s80D0w1Z+vYQpNvuXzE2ed0jfrRG69cS3o6eYP2liHB8SUxfhpWOSLAdNgfb8Y1leD8Dz6rJZq+
 5O5WgLlITwpGDV1NaOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MiBTYWx0ZWRfX6OnQJh4NGtGt
 vF6FA/dZ9hztzqfdMzQh6CW48rp/4j38NlRrVNtZ7Je8Yhqj7mK73H2GQTmWWnoqFTCxv6zO4Vn
 Q+75psGSI8X79HypRLysOhGe406Wcd8=
X-Proofpoint-GUID: Lg-W6ABO4xxk49ONd0dSRQFO9JZn-Cj7
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a8ffa5d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=440cDlBIAAAA:8 a=IMLJHsy39I7ZlmX_EL8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270072
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 27/8/26 06:26, Kuan-Jui Chiu wrote:
> Hi
> 
> Philippe Mathieu-Daudé 於 2026/8/26 下午 04:11 寫道:
>> CAUTION: This email originated from outside of the organization. Do 
>> not click links or open attachments unless you recognize the sender 
>> and know the content is safe.
>>
>>
>> Hi,
>>
>> On 26/8/26 09:46, Kuan-Jui Chiu wrote:
>>> Candence UART model is reserving 4 KiB for registers statically
>>> For other SoC models, the MMIO size may be not 4 KiB which would have
>>> overlapping sysbus regions in QEMU
>>>
>>> This patch adds a property which allows other models to revise the MMIO
>>> size and it is 4 KiB by default
>>>
>>> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
>>> ---
>>>   hw/char/cadence_uart.c         | 8 ++++++--
>>>   include/hw/char/cadence_uart.h | 3 +++
>>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>>> index f57cad57a8..d83c71b877 100644
>>> --- a/hw/char/cadence_uart.c
>>> +++ b/hw/char/cadence_uart.c
>>> @@ -541,6 +541,10 @@ static void cadence_uart_realize(DeviceState 
>>> *dev, Error **errp)
>>>   {
>>>       CadenceUARTState *s = CADENCE_UART(dev);
>>>
>>> +    memory_region_init_io(&s->iomem, OBJECT(dev), &uart_ops, s, "uart",
>>> +                          s->mmio_size);
>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>>> +
>>>       s->fifo_trigger_handle = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>>>                                             fifo_trigger_update, s);
>>>
>>> @@ -561,8 +565,6 @@ static void cadence_uart_init(Object *obj)
>>>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>>>       CadenceUARTState *s = CADENCE_UART(obj);
>>>
>>> -    memory_region_init_io(&s->iomem, obj, &uart_ops, s, "uart", 
>>> 0x1000);
>>
>> Are we sure this size is even correct and not a copy/paste error?
>> We can clearly reduce it up to 0x80 (so far the last register
>> implemented is R_TTRIG at address 0x44).
>>
> No
> 
> It is 0x1000 since the first release of this model

QEMU model use 0x1000, but what the datasheet says? I'm
suspicious using 0x1000 for the current model is correct.
Can you point me to the datasheet please?

> 
> Sure, I will change it to 0x80. It would be a simpler fix
> 
>>> -    sysbus_init_mmio(sbd, &s->iomem);
>>>       sysbus_init_irq(sbd, &s->irq);
>>>
>>>       s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk",
>>> @@ -621,6 +623,8 @@ static const VMStateDescription 
>>> vmstate_cadence_uart = {
>>>
>>>   static const Property cadence_uart_properties[] = {
>>>       DEFINE_PROP_CHR("chardev", CadenceUARTState, chr),
>>> +    DEFINE_PROP_SIZE("mmio-size", CadenceUARTState, mmio_size,
>>> +                     CADENCE_UART_MMIO_SIZE),
>>>   };
>>
> 


