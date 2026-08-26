Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84129C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 08:20:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wz8sK-0006m3-J6; Wed, 26 Aug 2026 04:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8sJ-0006lv-Fj
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:20:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wz8sH-0006h9-SN
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 04:20:47 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67Q6Rg1j3689287
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SMm49n7lMlJCLijzQbo4X+czm78mPK0STpAMVPWsgaA=; b=VCsB+cRW01SDtiaA
 QTsM2Q56BL8TAvbqEz75mXf6mKTIEsEnjMKVsRIURU8UZZRf1Jo1PbZOd2krcrrW
 j5XBSRHkGz2w+WXwW4p37C9dx3jzGyVyCAjZ37sBLLhCEOLBxdro8nSEIeBq/+mn
 uop9PD1U5eObmIejKYYDvOzFBYY5+Z51fWUTg1RXXlLXswtJt2T0G4df89YBluKC
 LVWQXOU4IazzN9jdawaOLJcD4Ua3VcXo45luM2q8LcuMWi8IdHhtVpXTM5LloHEo
 YUdidZM4wkOqy8U22XPqdM9ilDMaLLK3hgAwMFEHAINRcRR15qlOaJNA/kjpy6eh
 rKOevw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn2wc8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 08:20:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1a9764f0so6886481cf.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 01:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787732443; x=1788337243; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SMm49n7lMlJCLijzQbo4X+czm78mPK0STpAMVPWsgaA=;
 b=jnWy70kC1jUIC75ZAcdYI068AblUOZw5OaheiOHZVW/dLfmL5WS8N7Fc4fH3b5hPhK
 dROY40FdvflWaAWU+Ms8fv8IgfMrWl3MsW9m1MJ1GysV/k3TM1Xxc2LyZPLY4AVPhAgY
 K6uZwMPYf9ZVqtMU5/OMpsB3lXLpFp2CIKU/mn86N8eTpieugpMSSa7icC6OhQE5IIHf
 PZ22Adjp/dMTq3FyWnVZphGydvOlGkOv52FdGkyndPdk9paCzHiYGzGjxQkdpJKzgGZC
 eIjQ/3QFXjNLnm2Nnz3bpnZH4vlEB93sbSOLt8frh7e14BdCV6LQ3/x2yZq4F3O7oBLY
 kUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787732443; x=1788337243;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=SMm49n7lMlJCLijzQbo4X+czm78mPK0STpAMVPWsgaA=;
 b=jVPsi614iP49V50IPljGoJPvZYvSQ8xCasOCHBSsWcLP5Cv3uqp8CARVI5catG+WH2
 YO3Q0j5/X0yO4F6jdpz5o+IBu06rJ1LZJ5DNrnCKeNfGnZMV5FISaXuoRAEm/vqPir9X
 BNWgwL9kkLpqxuaANBXB9qJsefqE+fCDrpwmcPnex34KYhOp1pDjsIETNUj06hzJB3zi
 okj2DK+JD/DwTSysr1WI0Py7Rfn7/0C+V+YFGylzMhSRY8XjuiO8bQ1YHwcEIfp/3syu
 cIA+Dx+Cc4gRGeNT71rNz+qJp/ltil0nT8YBYj6/YOhbMoVwEw8mZ464fhqOwoSlOE3C
 M+Rw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6KKkTNMTErAWfTv5DP0kqOS04aMv3WpkKph0vk7tArAzB2Pvff3B4kAKIV3Y06Vrg9t/qbRvFcA==@nongnu.org
X-Gm-Message-State: AFuF++nf7KaPZUsPDhhid5Vta3Drdmax4HZkkl1cQqcNZ1/hWDkoiC5M
 TgtFIIgYi8eNb7oZkFxg1STCvJ4ZJCXt1xGRpeP6sknltQlt5j+KOqIX8vKXcp7T2kPH02GQnAB
 oQIE2oLLK1NOmj7WlfwOEFGwYVB70st0f8mbI8XZie3EP4a9NDwZJsIr3WjJ/onk=
X-Gm-Gg: AR+sD10AtD/DgFCAWQDzL1p7PddiRkhpi6pc/58slO17vvw54bUHpyJrLwEvGARjBpE
 LtYr7Id0p+FomJvWMFWVFEaNbLQoCjRfL1kK3EjpGx+Uz1c078vK31W0nRVSjcG5Kx6h98oQ8ik
 cNUnLfJ2tGfvq02oDrJYShzerOBQKmFsT1WcmGZ331LlZGSmf2svV3sDHTpib1kDwKw/Hb0BHiG
 nU/A5lzCGjvWYE64RUInpTq/UHQbz18QGNdH+5fqYB48VPmktdmFgIwJNxUR41ZMZn467u6J0MR
 F89CDmYyCSV9w77m01Ap7T0JNj2hI9GP4qPClLoTq1PsH9IP7zjjSyuSL2VeoIqeJBvdu+DAgOA
 HN8D1aIYXvbz+mGlQjdcIKvG4qpHkD1KCWWJdRg==
X-Received: by 2002:a05:622a:164d:b0:52e:3a32:e73d with SMTP id
 d75a77b69052e-52e42344b22mr41649751cf.21.1787732442549; 
 Wed, 26 Aug 2026 01:20:42 -0700 (PDT)
X-Received: by 2002:a05:622a:164d:b0:52e:3a32:e73d with SMTP id
 d75a77b69052e-52e42344b22mr41649501cf.21.1787732442054; 
 Wed, 26 Aug 2026 01:20:42 -0700 (PDT)
Received: from [10.254.188.74] (14.89.66.37.rev.sfr.net. [37.66.89.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e27a9945sm1887212f8f.9.2026.08.26.01.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 01:20:41 -0700 (PDT)
Message-ID: <de9dd447-80f2-45a8-b166-beccdd950287@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] hw/arm: Add Axiado Ax3005 EVB
Content-Language: en-US
To: Kuan-Jui Chiu <kchiu@axiado.com>, 163wangjack@gmail.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20260826074635.2850931-1-kchiu@axiado.com>
 <20260826074635.2850931-9-kchiu@axiado.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826074635.2850931-9-kchiu@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qIp_vRf7BZEPQmpMZFqwLH3nkCZpYEG7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2OCBTYWx0ZWRfX+//tYpSubWIa
 pknQRyNlT4aE7z/954mpeeoSqBaz+0adr2hpJkh6O9NtlwvVVDa49QEgm9X/ABjHlMZRPCeWUHi
 dwFamzESJ7VUaFOzBHMrHyKVYvPKhYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2OCBTYWx0ZWRfXzNnbFWS8y0ct
 c1OEDunTKc15gQyoDn2H7yc7OsOw7Kfd2mlFGu/Uow16lZUj4GxOdYeOtrTjhvxQKSw5o0ND4Gd
 TKur/glzuH6fyx3MJoUPGWgHmhYuoEGVtRELZpVNzH/oOBQZVtdCcy8kHtC8b4+lfWQuTQ1PDLg
 dS9BcyVGWDVbcc9Cb/xyDIEIMhCbNt2gF/27xxgMlsjmDT583pu9sfs3e5PjzWn9k602ehKFKLg
 rB6jBfT81YQBSYhnEmgYe9krMKksCTYyb/yT4mMnPg44VyjNo4rZLcWMDyXwzdlVnHBb4Kf1Fbl
 9rRJVKPf0KBwjFe5pKTKl/ZwOCaV6uCkjoTS/c77PGhGbk1vDgz34kwW32OY7/TH4LjepJFqWJU
 C18CwKhBmE47qoCadd1z5DW3b7vYP6wI8IxBJS0ZOHCuJQ5IOj0fbjRnXKlLgUE1mK8L1PpMyWZ
 hBMnrsRnSUd0pkQczfg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ea1db cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=JQZmDyB7+sUo+n2VpL1TLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=440cDlBIAAAA:8 a=-GMYWo8RcLAl5XYbW6cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-ORIG-GUID: qIp_vRf7BZEPQmpMZFqwLH3nkCZpYEG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 26/8/26 09:46, Kuan-Jui Chiu wrote:
> Add EVK ax3005-evb built with AX3005 SoC
> 
> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
> ---
>   hw/arm/ax3005-evk.c            | 64 ++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build             |  3 +-
>   include/hw/arm/axiado-boards.h | 10 ++++++
>   3 files changed, 76 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/ax3005-evk.c

Missing some description in docs/system/arm/.

> diff --git a/include/hw/arm/axiado-boards.h b/include/hw/arm/axiado-boards.h
> index 4a632661e1..7a610ecfda 100644
> --- a/include/hw/arm/axiado-boards.h
> +++ b/include/hw/arm/axiado-boards.h
> @@ -11,6 +11,7 @@
>   
>   #include "hw/core/boards.h"
>   #include "hw/arm/ax3000-soc.h"
> +#include "hw/arm/ax3005-soc.h"
>   
>   #define TYPE_AX3000_MACHINE       MACHINE_TYPE_NAME("ax3000")
>   OBJECT_DECLARE_TYPE(Ax3000MachineState, Ax3000MachineClass, AX3000_MACHINE)
> @@ -25,4 +26,13 @@ typedef struct Ax3000MachineClass {
>       MachineClass parent;
>   
>   } Ax3000MachineClass;
> +
> +#define TYPE_AX3005_MACHINE       MACHINE_TYPE_NAME("ax3005-evb")
> +OBJECT_DECLARE_SIMPLE_TYPE(Ax3005MachineState, AX3005_MACHINE)
> +
> +struct Ax3005MachineState {
> +    MachineState parent;
> +
> +    Ax3005SoCState *soc;

When a component is not optional, our style is to allocate it in
place (IOW this shouldn't be a pointer here but the plain struct).

> +};
>   #endif


