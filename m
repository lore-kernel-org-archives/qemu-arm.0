Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAB2C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 21:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whw1R-0006cr-NE; Thu, 09 Jul 2026 17:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whw1Q-0006cA-0A
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 17:11:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whw1O-0007Tz-Cx
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 17:11:03 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669JUt6q2557209
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 21:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cyqhzuNTNPLfTn4uZmqLwtYCYZG7eFH8G/DDno3ET9A=; b=hFZqk9mGgXC6YQbz
 bOPZRYFsaI/W0I361svfDe3cOmnD70l58M20+vn3oGHuc3Qd1clmnNcIosytlNIn
 UKu/+64m4mZqjnjcizzBcLJ77THyLTFfcyC04fN6TGSzBdEFssJoaf5n8atpakV+
 IPGuSvc0M78Umyw91S5mpO12YL72PUn9O/KQ6lUiElJ0CGNUqpZhSi+GAFRtY+mg
 PNxSMlIRgl/Hq7YpyJRqV5voMz3w7AQwJEpJZTuBYpQZEZ7zji8rLdRlFBA7j7R8
 SonpxnAcOzOx86n3HjuKFdU/XpD8jqASj0t0DixxmTv1YHgS33D8nZSwfd7kSBoD
 +6jyrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8gbpw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 21:11:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51bf321d786so2655831cf.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783631460; x=1784236260; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cyqhzuNTNPLfTn4uZmqLwtYCYZG7eFH8G/DDno3ET9A=;
 b=e+mvM5yXDq2VhchCO1YVewyTdeE24dhfKVHXvXKo0MiMf+828fm66KFZ3z9Sbz0z2p
 Pm7GybKV0GgWFXm2xyvsTgt82ZLP6/77AgydsQGGpZe/B0XRyqbgNg7QkEdPfYWbFtTY
 l72xWSApSNAAB6Sz6zvTqvdWEm2XYgfe52McNfh2cAcT9Kw8NPjTf4a05jI2sEU+LXcT
 huxXxS8xDzADPhoRRxar3XNmt9yKifSXXFLjHkGol3RpdP25fqHAGmtR7A5Jjriu8LkA
 OsIZqF+9iNu8MbGge2IGXu4Qgu0fWYLq6ujt/e7inziRsi61PQbMsLNpXMAMESukUA2f
 uvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783631460; x=1784236260;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cyqhzuNTNPLfTn4uZmqLwtYCYZG7eFH8G/DDno3ET9A=;
 b=RSfHqeo+HGZdiMzn1PfygD/xp/wF/gRnmnhtY17CnMCVgYvooNwR9eU4q1KJgGwmrx
 zaFl7QxefiykAkHKUwC4afVmarw5uC7xR9lEA/gbHS8Di68rQEKuoaBKpO5zfVgEJlnj
 Tw9zrjA5HGJc243PSWVMH5vEHhSDpqQFGoAHvsU4mskGv2YqUcveEtxucSHrvudEAKQG
 HoBvCTSarEsLdJ0+Tzw2xgKZIMqJ2FffWh32VK+6IAxC56Pj7dilE4nGj9STxk8kkF9a
 KA+5imTwkeNIA91/ndsoPY8XzIUA86dNxH1nkuulZMUO2EFVt0RxBy0SImTOvcKKaLiG
 +pRg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqa/6/fAdp5NvtYzPKGkrbBRYa81WMfM5wp04R7Za45sWtjOB136rbZMclkwbGgds6BzJWmTL6t3A==@nongnu.org
X-Gm-Message-State: AOJu0YyhdmSlm9ETCCEGKAkleJ+RTFPO20Af5cd17nR7J9bQuL3s2i/m
 T8MwziGht8mKc3qMnpFuDjSKKv9deauvuowQq35X9tawtR/mEw/QmugnF8FWqTAEiYQtCnv9Wx3
 xUjYYZJdK5n7J9QE79FpXwjlcqHSuDuAcN4i1xjg+IEFQLMZvlgprq5I=
X-Gm-Gg: AfdE7cm80Eg6LyUv/imRQ7SvAIIS2JfYfFeLXneUdth4BJUWXcFluLDb3DHDtS9eyeQ
 9NlyWjRUjIlzqR1Lzp2JTE8a6oULRy0Z8XrdwXP02qjo7SMOb+vBJjE+ZQgBxTMeORIRDipu5zJ
 Nr9IUP8TlL/8CLDNlSfP8puFBgSdB4z3jOl95ncfa3jSknEcT5hXh//iO0J28VaTFwQBCha0A7o
 oU9zbEgY+PZ3B/A+hWSy6vH8rdN3KNvdqplRON+jD+BpTyNlzlC7EzgZVmRRnffdCGY9w8xxgQQ
 95JFH+LjUqol3FEfIMsJ+TMXSyeX3PqKAyriO/QfVlcPN2fFpalmM97Wl09FDbMcB7vAOFmq5Ad
 JJ/ZkLS/5z6nsPsomU9R3lb1CgfOH9Y+7kHKlNC/GwbhmiZdnrzQP/erTmbnUFg==
X-Received: by 2002:ac8:5f0c:0:b0:517:6d82:9aec with SMTP id
 d75a77b69052e-51c8b12b474mr93656631cf.0.1783631459591; 
 Thu, 09 Jul 2026 14:10:59 -0700 (PDT)
X-Received: by 2002:ac8:5f0c:0:b0:517:6d82:9aec with SMTP id
 d75a77b69052e-51c8b12b474mr93656281cf.0.1783631459158; 
 Thu, 09 Jul 2026 14:10:59 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccdbbsm89697445e9.3.2026.07.09.14.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 14:10:58 -0700 (PDT)
Message-ID: <38bae6ba-b380-47a1-a134-f16313a1f7e3@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 23:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] hw/arm/aspeed_ast2600: Wire up the UDC
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
 <20260703074332.1049473-4-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260703074332.1049473-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UIbrgz4AYRMaWrEz1pYtDztfCAMWvIED
X-Proofpoint-ORIG-GUID: UIbrgz4AYRMaWrEz1pYtDztfCAMWvIED
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxMSBTYWx0ZWRfX+Q6CD1D16Yao
 ZggZMyxytOhC4PW3N52MsEwzE5I23p7Hz06PaZ8Bqbnzre8fNKsbwFoLBx3FBRadG0HzdsIbXfj
 90ShxKmmPaLnjntakuY2o7v7/5jvlzM=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a500e64 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=V2NxCb60AAAA:8 a=mUOQmIRJj8fYqNWr_X8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxMSBTYWx0ZWRfXz7CKzG0xKQ3C
 WoLqIOwWT2LH2l/CL7EWNbobOZJOTcD7cs/AIbxPNwtBhsLCLpN8KhMkzc7gGVQz4IW0k9EGgUZ
 VOAuVYRIa5sdN8Um1V2V5Ki3IrBirU3YbQM3Kx0PACYx0aH/XYoXWMDiSjN4uRNj7lEAvJ3UQG6
 i08CE2PoLbCZTlHWiiWDr1PE7AP9yKNyp6UhyoVCahD4dD4WaRK8UF6jeLyC/Q2qewhGAOwP98F
 AHZ35aTC6kgjaPW4KUHE/h5eUAa+o0IOLVG+EazxdntJBq9AU7CqjotLP+6FS2ecALPb2VtvHwt
 z/I42KuhytfXkjrknHJxKS1PHqY13wjX23vE4qbnyDXDwQsqFZrHcfctnUr6GsHxdSHmPZh6PpS
 Sa+2mfCDWb60KgMt6qdp5mQBUw6PW8AJYwv5DHhR2f1G9XFNd1ZsxF0ljcKE0FFC+6pSzI9uFyj
 O9UauXk766K2xcQE+Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090211
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

On 3/7/26 09:43, Jamin Lin wrote:
> Create the USB Device Controller (UDC) at 0x1e6a2000 on the AST2600 SoC:
> map its registers and connect its interrupt.
> 
> The gadget USB device is not created by the SoC. It is a separate,
> user-creatable "aspeed.udc-gadget" USB device that the user plugs onto a
> USB host controller's bus; it finds its controller through the "udc"
> link property, e.g.
> 
>    -device aspeed.udc-gadget,udc=/machine/soc/udc
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast2600.c     | 13 +++++++++++++
>   include/hw/arm/aspeed_soc.h |  2 ++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index d1f18e471a..7d97f10448 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -32,6 +32,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_SPI1]      = 0x1E630000,
>       [ASPEED_DEV_SPI2]      = 0x1E631000,
>       [ASPEED_DEV_EHCI1]     = 0x1E6A1000,
> +    [ASPEED_DEV_UDC]       = 0x1E6A2000,
>       [ASPEED_DEV_EHCI2]     = 0x1E6A3000,
>       [ASPEED_DEV_MII1]      = 0x1E650000,
>       [ASPEED_DEV_MII2]      = 0x1E650008,
> @@ -113,6 +114,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_SDHCI]     = 43,
>       [ASPEED_DEV_EHCI1]     = 5,
>       [ASPEED_DEV_EHCI2]     = 9,
> +    [ASPEED_DEV_UDC]       = 9,
>       [ASPEED_DEV_EMMC]      = 15,
>       [ASPEED_DEV_GPIO]      = 40,
>       [ASPEED_DEV_GPIO_1_8V] = 11,
> @@ -214,6 +216,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
>                                   TYPE_PLATFORM_EHCI);
>       }
>   
> +    object_initialize_child(obj, "udc", &a->udc, TYPE_ASPEED_UDC);
> +
>       snprintf(typename, sizeof(typename), "aspeed.sdmc-%s", socname);
>       object_initialize_child(obj, "sdmc", &s->sdmc, typename);
>       object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
> @@ -573,6 +577,15 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>                                                         ASPEED_DEV_EHCI1 + i));
>       }
>   
> +    /* UDC - USB 2.0 Device Controller */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&a->udc), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s->memory, SYS_BUS_DEVICE(&a->udc), 0,
> +                    sc->memmap[ASPEED_DEV_UDC]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&a->udc), 0,
> +                       aspeed_soc_ast2600_get_irq(s, ASPEED_DEV_UDC));

Do we need to mux this IRQ line?

>       /* SDMC - SDRAM Memory Controller */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdmc), errp)) {
>           return;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 3aac144cd4..74fd83e957 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -36,6 +36,7 @@
>   #include "hw/gpio/aspeed_sgpio.h"
>   #include "hw/sd/aspeed_sdhci.h"
>   #include "hw/usb/hcd-ehci.h"
> +#include "hw/usb/aspeed-udc.h"
>   #include "qom/object.h"
>   #include "hw/misc/aspeed_lpc.h"
>   #include "hw/misc/unimp.h"
> @@ -138,6 +139,7 @@ struct Aspeed2600SoCState {
>   
>       A15MPPrivState a7mpcore;
>       ARMCPU cpu[ASPEED_CPUS_NUM]; /* XXX belong to a7mpcore */
> +    AspeedUDCState udc;
>   };
>   
>   #define TYPE_ASPEED2600_SOC "aspeed2600-soc"


