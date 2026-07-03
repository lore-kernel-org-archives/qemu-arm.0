Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72B3C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:25:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfa96-0003ZZ-K4; Fri, 03 Jul 2026 05:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfa95-0003ZN-RA
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:25:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfa94-0006Kv-Cp
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:25:15 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6635sCdF3127066
 for <qemu-arm@nongnu.org>; Fri, 3 Jul 2026 09:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BtuvWETEIafHlI89h+kC44LxZS64vXDOPHiPsInwsVU=; b=hlMU8sZQ03+l+s+w
 HxuYuzRXe7CcKarFxAlw4X8qvFzGHpDEE56Y2qR2YfOM3FzFNSLHNb6xTWQfBzyV
 vrX0+YmtKI+0yPBJPJWdXhCR8r1HVSGRGwsIAIUM1/H0mAUAw3Rnl4FjhVKcgQ1S
 zu5dS5NImS1RvtfUd5ZHuQBl/BZpV9CbVsKC25Fqzq8aAdCCvcjS/7NbRiI/eMbX
 uwpG46t+y5kBctN9jKXUTj9EVbDV5ixgri2HHGDbov5gXs73i+kPRKsqI8xSHa0l
 hrT3UQ+pQX4At9dEsFxkXON9nj1hTpOO7715X3LGK0JLl03kIUGoLvQxJperfm9h
 XJaCLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnkrb7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 09:25:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8e9489f62bfso3836076d6.2
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783070712; x=1783675512; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BtuvWETEIafHlI89h+kC44LxZS64vXDOPHiPsInwsVU=;
 b=KmcLja7bkFlWH7sqR7yyG8SfNu0MyRPheGBeCDnOyMhlgPVIAIpsGgh+nghBiPVWY/
 RWWA+HkLZvZCoL8bmswO74YTCldmTP3ILsFUrEcLLmgchR7YJA8vUE2ceP0VzmaUMHCE
 j+vX1EqBpTB7rEedxVCzc9Rj3WEKulBdHIkxmopjU/gweUaH7aOEht7zjA8yt8tlHEhQ
 FNGc+/UX6sON7kq7gFP0yuOato56ZopcsshRSAqIb7SuEFVmEH9lI+c0FHaPBw+38HiA
 FWx1xKpPXx4MZOHolOvXmu+6WhVVI6FDCQJy4ZWB0pmHJ10cJaQShHeXXYZLOv4cmXb1
 8JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783070712; x=1783675512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BtuvWETEIafHlI89h+kC44LxZS64vXDOPHiPsInwsVU=;
 b=C4ONOnGO+ENHcUhyK6VFJGY3Vp+yaUQQaTYvt/8dfnFHIbK3t2BUeoiJScCNKi6xlL
 aMetK2mOBqT3KAtQwuSe1Pr7uqCYl7DCXXWB44Hr+Jqh6DjhW0c+2Kyz9hKlZeez/lzk
 2Lye5+6VVlE12LSi7WLdVqnliZmqgzyKnBRFN2G4wDngv9SbG7EEMM9DigvLYQ9/MY96
 pNlAl73INfTbJn+CLtKQsaEmoW7tg1g9mq8zsVE+sXb5UqfzYYsgvGLKVPQjak+IfyoH
 am8Vv66DXqXCR63+A22JZ3Wu5qt07ZK9Qf1Z5wKur2411ez9cdtkOGlE0kZ+evCpfPnj
 TOVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+FnqCFjbUi6NfpKxmlkWRuJdwj5nqQgCgujW1yDLoXgAKkWXSG0+PgoxgQnFzHWlnfZ3J5rGlQng==@nongnu.org
X-Gm-Message-State: AOJu0YzTHgzrdjZgq8xAXcSS3xBGxkUF4lMPFMSDBob+MERmfnBgY1GM
 VP/7H6G0xz4QPWf4lEQufHygBuJ0M7wBAQ5z4sXETMQ8PPiyKB1XVJNQIT8HVx2YYn+Dg7/IH2w
 UiGUJmrKOQFpjmC3/LQ2eMElhwhKiS4sT5nxk1dXy7kq8UdkwY2vrwt4=
X-Gm-Gg: AfdE7clLqElsHO1zwzxVXkSOFeluLaB4azc38v18ItjT+7Ifi573HPeSyi5zuNHV02p
 YU7b0BcTALzM+R7EobtEV60x3CuFMQ7ylQd2NNtAGlrOSP4CQbzEvzUSchtYuGzRa2vmdt2xvt/
 QgwjTbFqedFm69b7lau7E+jzruneJ/h2vV95vMTvHiq1ELAp/oYef/JJypaxfDMbG7NtU+grhWl
 5XtIvr/poItNGdnfDhRbmTQ1ItX39Ea7fCeWU6WaKO9piIWdBz5nc7aK4lnGcQp8H/WVzTPNylj
 vvvJX5d2L+nFm/gjNBqSAfqUgGuyxeZMMo5Wht3XpkXweayOV0ao9Y32dz/Dd+q9E9pCbXuzQ1z
 p7JWBq0SmprXnNc6kpMTJkKewAkwILUyxn+0Ftvh0IXR+MFAasP3XTiFi+cuiiQ==
X-Received: by 2002:a05:620a:29c3:b0:915:b718:accd with SMTP id
 af79cd13be357-92e781f130fmr1265519585a.6.1783070712001; 
 Fri, 03 Jul 2026 02:25:12 -0700 (PDT)
X-Received: by 2002:a05:620a:29c3:b0:915:b718:accd with SMTP id
 af79cd13be357-92e781f130fmr1265516685a.6.1783070711468; 
 Fri, 03 Jul 2026 02:25:11 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dde19e8dsm17765476f8f.27.2026.07.03.02.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 02:25:10 -0700 (PDT)
Message-ID: <492afb3a-328d-4354-a620-10e1aa0a2ec9@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] hw/arm/aspeed_ast27x0: Add unimplemented Privilege
 Controller MMIO regions for SSP/TSP
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260703064506.937904-1-jamin_lin@aspeedtech.com>
 <20260703064506.937904-5-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260703064506.937904-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ENwrxCcaxGxFwQICYsLpRSxALs1J-7DE
X-Proofpoint-ORIG-GUID: ENwrxCcaxGxFwQICYsLpRSxALs1J-7DE
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a477ff8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=O0DVhGvcGMGwp8E8R44A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX6KtosryHewoZ
 EWvu0nMB7cbrxRFTXdhKStvr9Joq0wc1C5DZMPGhCs71kUNzZ6RYoW44WXVe71GxSgx8dKveqeX
 9I16F3SNPSORITOMEVkUh3iA/Qt2HuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX9MXNluJLzrjq
 tq9+upgopV4SobwKZaYisOTf7ru0YrU/UkH6IGIvJDq+Rkab6qFnF6ifv5d6VGXbZEsoeGsh+4c
 ODbj336T2KxdvESHeNGXqPgkuxw1Y6Er0mUoiNiZMNBsFfK2hKfWxq7L/m9vWdvP/bw/tKRvR9G
 y6vR9veyt6oea3wrv1vlXMkRX7zEVqTr/cRFlWsbwLx6Z7B5dBbp8ifTP594MiJz5kxbeLm/6n0
 eQ88zpVd7/e+T9rEMVW+em/D5s6ZwPxhN8Ojsx5PWYUHpMiERqIlf9ZaEJvaFMHVJ2VQ7xna8G3
 xFrMkBawlLLM4hJ8H3j+tL+G0uGhM9IXXbpe/xubG64Mi6Qf5o8V9BWgddodydlvrZ9arKJrkLK
 5hdpg2s7t8hMlM08OPchcpnFrqPWLP1XNTPCFrFf/EFvypRjylCJqzGw56qhXHJGvzzrLWIM2jD
 Z7JP+raEBTd8hzo2K3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030088
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

On 3/7/26 08:45, Jamin Lin wrote:
> The AST2700 SSP/TSP firmware accesses Privilege Controller MMIO regions that
> are not yet implemented in QEMU.
> 
> This change adds unimplemented MMIO devices for the Privilege Controller
> blocks and maps them to their corresponding physical addresses in the SSP/TSP
> address space. These stub devices allow QEMU to safely handle firmware
> accesses and prevent spurious exceptions, while accurately reflecting
> the hardware memory map.
> 
> No functional changes.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/arm/aspeed_coprocessor.h |  1 +
>   include/hw/arm/aspeed_soc.h         |  2 ++
>   hw/arm/aspeed_ast27x0-ssp.c         | 13 +++++++++++++
>   hw/arm/aspeed_ast27x0-tsp.c         | 13 +++++++++++++
>   4 files changed, 29 insertions(+)


> diff --git a/hw/arm/aspeed_ast27x0-ssp.c b/hw/arm/aspeed_ast27x0-ssp.c
> index b3c4eb1915..1b68e4eb5f 100644
> --- a/hw/arm/aspeed_ast27x0-ssp.c
> +++ b/hw/arm/aspeed_ast27x0-ssp.c
> @@ -22,10 +22,13 @@ static const hwaddr aspeed_soc_ast27x0ssp_memmap[] = {
>       [ASPEED_DEV_SDRAM]     =  0x00000000,
>       [ASPEED_DEV_SRAM0]     =  0x70000000,
>       [ASPEED_DEV_INTC]      =  0x72100000,
> +    [ASPEED_DEV_PRIC0]     =  0x72140000,
>       [ASPEED_DEV_SCU]       =  0x72C02000,
>       [ASPEED_DEV_TIMER1]    =  0x72C10000,
>       [ASPEED_DEV_UART4]     =  0x72C1A000,
>       [ASPEED_DEV_IPC0]      =  0x72C1C000,
> +    [ASPEED_DEV_FMC]       =  0x74000000,
> +    [ASPEED_DEV_PRIC1]     =  0x74100000,
>       [ASPEED_DEV_SCUIO]     =  0x74C02000,
>       [ASPEED_DEV_INTCIO]    =  0x74C18000,
>       [ASPEED_DEV_UART0]     =  0x74C33000,


> diff --git a/hw/arm/aspeed_ast27x0-tsp.c b/hw/arm/aspeed_ast27x0-tsp.c
> index 6098d1aae3..59dcccd511 100644
> --- a/hw/arm/aspeed_ast27x0-tsp.c
> +++ b/hw/arm/aspeed_ast27x0-tsp.c
> @@ -22,10 +22,13 @@ static const hwaddr aspeed_soc_ast27x0tsp_memmap[] = {
>       [ASPEED_DEV_SDRAM]     =  0x00000000,
>       [ASPEED_DEV_SRAM0]     =  0x70000000,
>       [ASPEED_DEV_INTC]      =  0x72100000,
> +    [ASPEED_DEV_PRIC0]     =  0x72140000,
>       [ASPEED_DEV_SCU]       =  0x72C02000,
>       [ASPEED_DEV_TIMER1]    =  0x72C10000,
>       [ASPEED_DEV_UART4]     =  0x72C1A000,
>       [ASPEED_DEV_IPC0]      =  0x72C1C000,
> +    [ASPEED_DEV_FMC]       =  0x74000000,
> +    [ASPEED_DEV_PRIC1]     =  0x74100000,
>       [ASPEED_DEV_SCUIO]     =  0x74C02000,
>       [ASPEED_DEV_INTCIO]    =  0x74C18000,
>       [ASPEED_DEV_UART0]     =  0x74C33000,
It would be clearer to set ASPEED_DEV_FMC in a distinct patch,
otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


