Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0512AC624A5
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 04:45:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0ttb-0008IQ-Im; Mon, 31 Aug 2026 00:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0tta-0008EX-4o
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 00:45:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0ttY-0005AE-Lm
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 00:45:21 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V1cDYS2242130
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 04:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nPYxV+O0Z15eR5RrRad7MU9jwfVWEH48qRMjqbgNO4k=; b=lqcLFqABv6DKM9Ej
 f45Dx3a+k0UiPRWwRwHGCFIDUkP75hK7TDUVBHhtRrFz6vtH624t2IozjTFAfktq
 9/IZi+eZ+0H1ZtAnFjaErc+Byns2xP1nO8s2WF7p3IvrjfyWeun3UIqoGMl2UpVA
 hwYVMf9zjkYCBNzTPYfsu12Aoe6t8Z1yy7Epo2vPsk/pchhO/RE4TnMZ8wdmvbyh
 VKdVqVKclBfFHkMjbA7yIAq4j1m3TjXVXIe05xzjKj5wYZM0SouGn+C5q8uqOiLK
 5ZVYllUxOJxlssh3EupdVsq8SaNaCmvhkr1GWy0i49sEhhxJjjy+cheHX3cM/gNx
 LPC3UQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwckj1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 04:45:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93494527488so512548985a.3
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2026 21:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788151519; x=1788756319; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nPYxV+O0Z15eR5RrRad7MU9jwfVWEH48qRMjqbgNO4k=;
 b=h0nv4UOhU98nZG8vAdIcKX455Ba79Wu5+Gir0gbP/vA1X0oJDcp7iRgSmYcep9sCrV
 U93/19yqCnH7gIXd6PX9HVO7E8ARxZikrbigjgf8k85LCHPlMfubgWy+dGfAZ6u0JiVo
 NvakBi2SVhWqFL1UJpBz8ngMt2AGs0ZQo0Lpi/PCbL8gDwXC1jD4DEy1zJDkXuw3A0PL
 2dM3q6adCQ+i1Rx4tjpHXvfffHbDnvYDPhJZnf/bSaIj0c+sm3SOO72G35uGD/fmQu7B
 1tDB1Zu2TWbr9BlPmyZlaAfzJ7cAR0Zh617qDNK1GYEiUAOj5oTVSQjyZbDlthDDGtcB
 li6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788151519; x=1788756319;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nPYxV+O0Z15eR5RrRad7MU9jwfVWEH48qRMjqbgNO4k=;
 b=iD9as+Df65QGaeAWm2MpJ8igLHaY62PHfShNDNFxPloqCEOExzaKMoD8PISgPdsxzc
 /Cz0e/n9B5/aKw6fQG/JT1xb6mvnKM0mUdLXKnMRcb6uhK+X9YtC6FB0UMjQbcNEiWxu
 Zdcd3Bwe/NcA7bOVZIKMPbbezv7/tdk2h6fA8cDgeBoDg1mjZiOtHNGtZouBR6SBUju/
 W2oAN1eyLoHPpmVEPCZgd1wpKCHcC9WXPavATsuopViIlOa92zk08LrS6IhJzTRWk00A
 Zc+LiZUXodVeCvSQhwLtdsG1vXIVC31fHUknCIw4b6AbYtJjyYm/BQqv5YGbR/4XRili
 /ZOQ==
X-Gm-Message-State: AFuF++lJWh6+pVkx6j30qXN7dwmyA1A7kMiXeM+fvpynjQsbR+sKjh0v
 4skk7y1xiTOxC9snOS/v1A4J+lX/LYtsSQNpTzHY4jbOfgqlVWiUu0BGvaKH2nHBPy3FdH/ODLC
 MF0h/vsBWcYa57NnjFchhvJ0hVgHyMpmXJAPuhTYCk/VwOHJq3/veAZ0=
X-Gm-Gg: AR+sD100M8pdaIIHQIU47ufDUmPVwBoVehlC+ULCbFMzNxNI2BL8uE+JiUnviF0zo0M
 K4wC4Nx472lDwr6ZDc7CPH/GrBp3qm/Jgn2qfY86JIZF1uNVuT3N9HzJ4hZD6sVwYkLbIdvpjfy
 vkZWzf+3qqyMz+w0rfN4qkTdmfsNC3qe3h6EZmxcvc0QUWUQcfptmd9TRJ00JZ3l3NnSkhZnDy6
 hACD3om+F8CEntJZeiViJRqXZW7LxyWtXqgYfo7lop0EpFshuckgH621aPMI4G+F45fKHkirtbT
 VBr8sDyUvyzmHgTFcFHP507xGDVneXIXbXPSCbo+GKXiZORbOQWaIqirepsAgz+DJ7SbxyUALZ/
 f19nDS6zqmGn/pqJxDSWSpDE7Rfs4Y1btLg==
X-Received: by 2002:a05:620a:318a:b0:936:9f46:cec8 with SMTP id
 af79cd13be357-939139040fbmr2292503485a.20.1788151518695; 
 Sun, 30 Aug 2026 21:45:18 -0700 (PDT)
X-Received: by 2002:a05:620a:318a:b0:936:9f46:cec8 with SMTP id
 af79cd13be357-939139040fbmr2292501285a.20.1788151518322; 
 Sun, 30 Aug 2026 21:45:18 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4843ce8b015sm2873484f8f.13.2026.08.30.21.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 21:45:17 -0700 (PDT)
Message-ID: <f24533b0-6d69-4990-b301-e8122557dd59@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 06:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] target/arm: Separate cpu types max-v8 and max-v9
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260828222639.1432046-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W6V1KKZT7dFwixCnABBWMh6sDTQwXNb5
X-Proofpoint-ORIG-GUID: W6V1KKZT7dFwixCnABBWMh6sDTQwXNb5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAzOCBTYWx0ZWRfXzrYGC2QoB15C
 y5HYz8tN8zol4f+1OMesAn+Sc/0Pp3qD/gesb0VzJvu9KapYK8AHdzR/FKcqWKtsruFgppYpuqv
 0Z/dKp8wxp3ExCNkfPI5EvFesVKLJTk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAzOCBTYWx0ZWRfXwpY6bmfp9NyC
 QlMND6Z9BEwmjBHfpzbv+ShjZGUWyxqOnDYMNUaDM6kpkM42fvTUjrb+N+4JxUJqRfIEbLZ0uI2
 xclXU67Mv6ZLJ7FVHHKksJIswI9KZ/gxBoVuYzvPSf2JI0bde7tAiL1+aQaennIOBAFh24eOkRt
 wnl7qKzlNlbRbkkYUVJxiGrVFxACu2sJUjrRyc2vM8TUgoHhjQbserQIMEo/L/IPnWMqxA6xa65
 7sN5jGhmblPZ3y8dJ82d77ctuYByBrgpui866xyhazLP0u8Lz6jmGX/RLb/Pwk35dVReaHoXwx5
 YWMGbfSNN4I/dlIWPvc8u3r4eV7xZZqmLNJKxfs5wzTEnb+q4sHaIH1Pu3L7iCe0cbYfJxsnSAy
 C409c655fqCZpXW5c/yZ+Wmoosf/A1f96LSqIvHswlOcc2YihmEOHHHTn6cqpdmNdnpK1exeFtC
 brlT3yDE6QtLar9NbDQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a9506df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310038
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

On 29/8/26 00:26, Richard Henderson wrote:
> Do not include v9-only features in "max-v8".
> Do not include the prohibited v8 features in "max-v9".
> In tcg mode, define "max" as "max-v9".
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h        |   2 +-
>   target/arm/cpu-max.c          |   2 +-
>   target/arm/tcg/cpu64.c        | 162 ++++++++++++++++++++++------------
>   target/arm/tcg/stubs32.c      |   2 +-
>   docs/system/arm/emulation.rst |  13 ++-
>   5 files changed, 122 insertions(+), 59 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

