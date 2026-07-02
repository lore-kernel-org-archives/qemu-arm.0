Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E562C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 12:45:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfGnU-0000EP-Up; Thu, 02 Jul 2026 08:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfGnM-0000Ch-Nf
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 08:45:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfGnK-00049d-FT
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 08:45:32 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6628OXYn3049474
 for <qemu-arm@nongnu.org>; Thu, 2 Jul 2026 12:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ixdZVsdJ2GcN1L4f30GQMNQ+c3pd1exfg5thJFhT3oY=; b=dVSJtzqwcB/euYD4
 gWfqygySScvZUm/ZlVeqavvPsoMPiLCBqvmEnMXa86k0YZ/b2pZlMRd9eYDb/exa
 mjwzQw/RghS2HIb6fwBWQNHL1qcIAt239z8FNVJOlo0i+tUUAEmNjOeFvP5hngwF
 Ctl7aFKEPlFwqD+7ba2RbryZLAy+ApF4HBmRBoh66ldgmFUYvLpwWlgPBvZne8SX
 3LSPP26yUKzdx/k90GmRJtk7hgWAOeYdJjXNZKOke00DFsL2MCFLvZ1p3tjQyPYF
 WGO8/9A9lLXnCzatIt/hxiOOnxsal6RZ23fwAHbfmSIFBZk6z/atNjcr64rPNJHK
 n3Cvnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vrt9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 12:45:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so208309685a.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782996327; x=1783601127; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ixdZVsdJ2GcN1L4f30GQMNQ+c3pd1exfg5thJFhT3oY=;
 b=OkCF/8ehlbOJalGHt93VjMIVKdnRvWIfM4jZUvKl3mk0y3RP2Xheuq2H12Jfsql4rb
 p0uGy8S45hSl41V8nnJPGobFMn8Xg9DIouvp6GMK1I7+swDaMZDusMiyIoYZ+8On2L7S
 RZBUzDGOQyQexyVVbqdX2Mc0rLm3/D3ONAAW9P0Fj0MYuX8BwZCwhDBKoY+2HGAj0tSd
 lGNCsJ9/Ku+oWmtoEwj0CYQ9vERkfXjHJ7N9NrMryzaXfbLbtH4p0xnT4ryCOya456fW
 NcQDrm0s6ikygfX1hTP74ai/0NjSOWob4VRY0KknuPxeRU4RUeZSAaVvVq3EQQdMqC7z
 i2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782996327; x=1783601127;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ixdZVsdJ2GcN1L4f30GQMNQ+c3pd1exfg5thJFhT3oY=;
 b=l4KbCfASOZ+hf7m/Csh/9KJXaV0MCxp9FoFh8rgZO3ldLJGZ/JiWxvAATzLLT1cILT
 AnKRcGsh9+s7Kco/khE0Zv0ttozoY9cN8IYTjXcQistl0YnsGNMfC7rLAhJdbPp+SBdk
 gI2QRDzT76FNWRqbDiOAaW3VaaWsNSLT+IHW49OaU6O1a123eDWNCDT9tGoix3tlt1na
 xzssPlvyALPYKjW9WhJ163XhDCF+JTmdR66cQlBALlJXV+ZMAgbnkHF0OEsjkyKAfiPW
 gdlqqv6CHlMZJ/9MAZG7Zsif7fNddr6V2XwVLJSiudhZy5LQdzpsFKwLkGuIszNHYt+x
 wTKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/x0EuVBxo3odw37G05xFTjY4dKw7igWY4LaVRF3ROzPsSTjcmMaTXl7CxhdZdHhM93Zkg/QQkhQw==@nongnu.org
X-Gm-Message-State: AOJu0YxRM6F9MJc8fwmGHSse5LuL+7WUHe+mwP6wwfeGZRH25Wlr8OVK
 VUEvqY67sVx4wT3E9EL2xTC+Qpy1wIedTSxiLV2N5jXjvO4Lmzin5ijCBpik/fDcKPMfJ1eWxKU
 +ZzoMFjiPM0jzUhRDVB5J+2Ne9Q7VSWmDEe6LjES7OUcGFKe7aX+wZ7c=
X-Gm-Gg: AfdE7clsnj4tyTtjEnsjQZYG3WnE7ZWT7syOSumQCqec30X0UBnzhZY5NcKWH5A8wsU
 ZF0hmaoGqOk2eUlxzl+hSVn/Ao1hOMhA3T+yxjDMq4qJh5dYIzPuaR+mJTid16jfbujPB4n+IyT
 NlDtTszKevqDyEhbzzs4PiNSmGGE2CPG8j/z6bLxUmKCKEE5vGyDESXxfTuTVl6U/mLZ1EVZ/c1
 u7Pq/zbKmhRvtiVsE+PU9gKOyifgAwUZJkOxN0BO7jPXTcEE/syzHt3ZnIMbYoGvSFWRm0aN6xl
 GO9DZzx3PbjVu1bP7VkHE+ASkTd4kk7iKV+gUwKWM4sCAKdwIswJf+Xd26ltYhtfyJ0D7G8HZay
 u3oEIebylPndCfSz1KuUcn1YUkuzG9na82uktnYDG38TttNi+2U4JfhgpqzGp3Q==
X-Received: by 2002:a05:620a:25cc:b0:92e:68b9:6b50 with SMTP id
 af79cd13be357-92e785062ebmr788583985a.57.1782996327351; 
 Thu, 02 Jul 2026 05:45:27 -0700 (PDT)
X-Received: by 2002:a05:620a:25cc:b0:92e:68b9:6b50 with SMTP id
 af79cd13be357-92e785062ebmr788577885a.57.1782996326778; 
 Thu, 02 Jul 2026 05:45:26 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12b6059e4csm124660166b.1.2026.07.02.05.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 05:45:26 -0700 (PDT)
Message-ID: <b7ba6659-9fec-4bb4-a9ab-6c009081357f@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:45:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Matyas Bobek <matyas.bobek@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260701224612.48342-1-shentey@gmail.com>
 <20260701224612.48342-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701224612.48342-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: onFk1q8Oj_alfRbLt5VLXBDPWzzMBdwr
X-Proofpoint-ORIG-GUID: onFk1q8Oj_alfRbLt5VLXBDPWzzMBdwr
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a465d68 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=muYP95uDBPSA-3iXPLIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX/Q1wK+CCRFO6
 dcaXnYcTK+1l8OEXhl0e/8MV8QlDbjQN+/rFvATnN2n4HD5Pr5jTkJ54j3tKAvJ4RtTmkv+2Lap
 n08WwNmUBpxSyQvMvtBQcUv3Jk4ZYS5OmPc2A6xUJE2EIbj4CcMRkfRF51hqNc3Sbljv43KuBgA
 OshlCgpKpJgN0lunrs8+AmYbUfoBRm+TPE7VbmrCksTV9mySDNQuWN9ZjoQCAgWzRkwb7OzMtjc
 l5pdNbjTtPdvgmnSQrCnLC2LoIYNTJj2/ww3l4Zjo0TV8NJutn5Gc3jMfn2QS/3yG5xg/oo1827
 5SYMKWD5TfHlJAGVIN/NkaD3WGOQdNKj/baku8Ma3FwVeOtEVQhtutTuJfdhKouB8Z+vKPRLT0W
 1IuylLAzeZafEEXfzgmHgIZQl3s21938/dCr60CYrAcUjxgb1DpfoHd1RoGgDe3TuGHDlrRxQCm
 r+SSIqQM4HpdQGvWpmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX+Ti7AyyN0f4Y
 7LVYrYbC3G5MPeNRgQVJ8jwZpj9wPIHhO/O4XXqZExsf+ijXrxVCs2jnVxktXhqu7cFy8RRpfeP
 NOWrK7VvIWbKKYd/KdKmE24CXzhjB7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133
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

Hi Bernhard,

On 2/7/26 00:46, Bernhard Beschow wrote:
> Subclass TYPE_CAN_FLEXCAN, yielding TYPE_CAN_FLEXCAN2 and TYPE_CAN_FLEXCAN3.
> Since TYPE_CAN_FLEXCAN is now abstract, TYPE_FSL_IMX6 needs to use
> TYPE_CAN_FLEXCAN2. TYPE_CAN_FLEXCAN3 will be used in TYPE_FSL_IMX8MP.
> 
> Note that Linux performs 8 byte accesses on the i.MX8M Plus, therefore
> .max_access_size has to be adjusted. Otherwise this results in bus errors.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/net/flexcan.h |  4 ++-
>   hw/arm/fsl-imx6.c        |  2 +-
>   hw/net/can/flexcan.c     | 61 +++++++++++++++++++++++++++++++---------
>   3 files changed, 51 insertions(+), 16 deletions(-)
> 
> diff --git a/include/hw/net/flexcan.h b/include/hw/net/flexcan.h
> index 153afc1e03..32de7b904a 100644
> --- a/include/hw/net/flexcan.h
> +++ b/include/hw/net/flexcan.h
> @@ -139,7 +139,9 @@ typedef struct FlexcanState {
>   } FlexcanState;
>   
>   #define TYPE_CAN_FLEXCAN "flexcan"
> -
>   OBJECT_DECLARE_SIMPLE_TYPE(FlexcanState, CAN_FLEXCAN);
>   
> +#define TYPE_CAN_FLEXCAN2 "flexcan2"
> +#define TYPE_CAN_FLEXCAN3 "flexcan3"

> diff --git a/hw/net/can/flexcan.c b/hw/net/can/flexcan.c
> index 1ea459d9f6..d6a76c28ab 100644
> --- a/hw/net/can/flexcan.c
> +++ b/hw/net/can/flexcan.c
> @@ -1298,7 +1298,7 @@ static const struct MemoryRegionOps flexcan_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 1,
> -        .max_access_size = 4,
> +        .max_access_size = 8,

Isn't it better to keep 32-bit renaming as flexcan2_ops and widen to
64-bit for Plus version in a new flexcan8_ops struct?

>           .unaligned = true,
>           .accepts = flexcan_mem_accepts
>       },
> @@ -1324,16 +1324,26 @@ static int flexcan_connect_to_bus(FlexcanState *s, CanBusState *bus)
>       return 0;
>   }
>   
> -static void flexcan_init(Object *obj)
> +static void flexcan2_init(Object *obj)
>   {
>       FlexcanState *s = CAN_FLEXCAN(obj);
>   
>       memory_region_init_io(
> -        &s->iomem, obj, &flexcan_ops, s, TYPE_CAN_FLEXCAN,
> +        &s->iomem, obj, &flexcan_ops, s, TYPE_CAN_FLEXCAN2,
>           offsetof(FlexcanRegs, _reserved6)
>       );
>   }
>   
> +static void flexcan3_init(Object *obj)
> +{
> +    FlexcanState *s = CAN_FLEXCAN(obj);
> +
> +    memory_region_init_io(
> +        &s->iomem, obj, &flexcan_ops, s, TYPE_CAN_FLEXCAN3,
> +        sizeof(FlexcanRegs)
> +    );
> +}

