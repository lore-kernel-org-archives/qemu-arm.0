Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4EAC43327
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 06:12:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weoAq-0004q0-45; Wed, 01 Jul 2026 02:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoAo-0004pM-7w
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:11:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoAm-0004ap-LH
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:11:49 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lO12102900
 for <qemu-arm@nongnu.org>; Wed, 1 Jul 2026 06:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SoHyYqO4aqroluLj9Q1S+7qEdoozN1L04oaP2Sw1UDc=; b=SN/Pavn5l0nOKbXO
 Jltj6avEsGCkPjJkv4MyT5Y8ci2Nt3SIGuL3dmtl2wV8WTq4Emz6mkN/lqoYWrHr
 EAXkJ3WreYmiF0EcTRgqaNxowvObK+auipeICpsy4JSye32RjyHpBl56hPgxbnHB
 soO30D1mOX5Xko58C/i1V8OHgTGjHtcnaNFewtRA4CanC7coahwR2IDdi7mphMc6
 w9ft3ftMlrDw1GcIMEq1ae9wURzb2t6OjIcNNGOFvhvuCP5exRrij8/AmjYUvwqK
 5dkwN9JP6q5uzAGMbxzoGZnggkfOIbaqhaviLJ8FiVKiq8sr540hlwwSymoH9eXC
 BlMOBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwabsb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 06:11:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-91ed0e140c5so67071385a.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 23:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782886307; x=1783491107; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SoHyYqO4aqroluLj9Q1S+7qEdoozN1L04oaP2Sw1UDc=;
 b=ck35inMSrQUyeisaVbFrdpgKiPhc4A1cuEsXUv6tzi46KnqMBlZsb09BwFQ7Oqcky9
 T9DPlGNC8UUffHumma7FjrlQVPVqR3w36oRGkscU7CIFcVRxozquHa4K2y6L/JAVivRj
 hRANXdGSH4VPjXYvwFxtMS7tSRdb/nkQfp67d+h3w321ivK6LIWobiX12FCb25JWkbWM
 gF8hYliMN3RHqMONIpLIk0Uat1NEaebT+hu51m3aXMHl1W/JDx7wGJBPK3gj7NTBWUqd
 9Z0LFCnVHgUx6+yWrKI3kp/25PlF6ON1BAdXbOYl5LlOuiTPlx9eyWm05nNn+m5aUtah
 SbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782886307; x=1783491107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SoHyYqO4aqroluLj9Q1S+7qEdoozN1L04oaP2Sw1UDc=;
 b=DL4xdx+s52pGuAgIwvFpbi09/cT2krFW1ziTWFdo2DRo1yIjmJRCh+wKOuBtITPZgr
 69QGOA2jDUReJrJ5BzbkVfA9TemIbstijF9mt4wOGb5Q+nXpd/Z0KGEAnBi8EfCGyeAK
 wGa4NdehsXDxdrWURMr6bP6aHPbo27Iw9IekOPK/rUAiLSpM0LD47CLWzJswL5Udp0B4
 zft8hkq+vHSJkG7puym4tEs/TEmsTDFi+L1IQVG0tcIihorz2ZITxeQi+2Ari1K7aQn4
 XHX63A0wHoRP234GOiWCrc2EhAuB5Ghp/1SiAvDdyP43OHSaZp3yHfeJ2U+G67PpRKAe
 0+8g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8fB3E2F2e6FFNqSO4a3gd1QP/McJ7Hgi4ZamqHwcVjRN4VtPe8olbV63IGrnAUB76M0HOTVdeQVA==@nongnu.org
X-Gm-Message-State: AOJu0YyS9pYSmUIjy87ETev/Dc3SbwuSYrWKJjSqNS7oRU38Lgcdkr9J
 lBzcLIMWvOHOZQe9sI937OjMn1jWpe9JKolbGh+D8snYsgFW/myMmp/luDESCmA2sHuMUH1PNCg
 pvB+6E/RFx6WqfZUHmeVJOxccrp0IcsQWvlleUCnq9VwyLBOQUL72YAQ=
X-Gm-Gg: AfdE7clREA3xYxPj8jyKgfSb7Djd00mVS7FUHmHRWQWQGWeZyCEQwisGmC9UxzOzbVe
 ua1nnSp/rtzXb2Gag7o7EGeqIDhpXvvh2q2zQRcJDHRJAYxTK3MmpQBDZbu7JQWxslSU+8Tx3F9
 LjrdtnsgGVvAWRHTByHB7GwWmL7nXVDb2RvN789fOPTNneeatcDNIQ/qvJmmSKgTL7FHlIT8y0S
 XQJZBXwaQLed7lH60oa7EYQozdgLys8OdvPtb1JKl7/FivyvWIkIUxtmDcHz5A1231m28QxyY8z
 wuCsnDGy3xeEYoZwiQZ58uh2usm48i91tLBJ01WVlWqeijdLUHcPn3wtOs2lqMd0+j8TIZBdMBN
 ochcOQmVOn0eqiZiwYVfF7glVvCZUEmck5VLDS3hbrZ07g0aLhl8/ve0gaeIUww==
X-Received: by 2002:a05:620a:258e:b0:92e:51ee:7944 with SMTP id
 af79cd13be357-92e784d1225mr40353085a.34.1782886306631; 
 Tue, 30 Jun 2026 23:11:46 -0700 (PDT)
X-Received: by 2002:a05:620a:258e:b0:92e:51ee:7944 with SMTP id
 af79cd13be357-92e784d1225mr40350685a.34.1782886306167; 
 Tue, 30 Jun 2026 23:11:46 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47560effc81sm14096761f8f.0.2026.06.30.23.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:11:38 -0700 (PDT)
Message-ID: <bf05f5e5-737d-44ca-8fd5-abd97c6513d4@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] exec/breakpoint: Move BP declarations from
 hw/core/cpu.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _BPoMI468gWKz7tiijkuUKn_iQxaYS4t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX4JHaNh/ZZBIo
 TH45ofdZgEGLV0aYWMfNBXOFWhOIaiZOp0OiMJgHGLlvGUEJFvcV03JpTxyEG941uLxUjxuZAAH
 4jMEnlHi5P1VWqkcO3TPNGsl0QBDK5E=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44afa3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9e7byKQMp6R3KdQvgMwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _BPoMI468gWKz7tiijkuUKn_iQxaYS4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfXzRZR9P0J55yw
 LbiBv3UEed3cMyEDA6crtgD2MGNO12iunDA/VdvZFeQm5hzsJE4lIhtGrpjQ7XBBoPfNmtm5Oqg
 y+dHKBYvLMqfQ50v8ZSGgqL1Hs58RvE58PDFF1cAuCpyHqbOjdSjRlpUSFVzULeCcRhlTeojoVr
 M3v1+JoltTgfRA3HTI6GkxaMHbtfIZ7VSsvUFeRdTaEqBZiJWOhvx9ZxvIGG631BN8L2mrB5cRR
 uxrwr6zoLK3ZiZ/wuUP2QT5gnj/mcrhMy9ETqCxQSe3WSQ8Jm/RMqKD7/tfP8QDYExWSm8IlaIG
 WaTmFXugUJ/Z4AjugFswtQXDfs80hshDkgWRi1O3dprvgR5+Q79FUh4/jANs+9nH7xQHTBHajoO
 KkOe4g4CJk9wWlumWwqUwJEL0O6B4PrUUwQaGb/3ZOrXrPBI/CAcJLq8WNND+QOP8OS8uUmuJAp
 rWJakVRb+ZvQhTMiXyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010061
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

On 1/7/26 05:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h | 21 +++++++++++++++++++++
>   include/hw/core/cpu.h     | 21 ---------------------
>   2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
> index 95f0482e6d..4013d9a07c 100644
> --- a/include/exec/breakpoint.h
> +++ b/include/exec/breakpoint.h
> @@ -12,6 +12,20 @@
>   #include "exec/vaddr.h"
>   #include "exec/memattrs.h"
>   
> +/* Breakpoint/watchpoint flags */
> +#define BP_MEM_READ           0x01
> +#define BP_MEM_WRITE          0x02
> +#define BP_MEM_ACCESS         (BP_MEM_READ | BP_MEM_WRITE)
> +#define BP_STOP_BEFORE_ACCESS 0x04
> +/* 0x08 currently unused */
> +#define BP_GDB                0x10
> +#define BP_CPU                0x20
> +#define BP_ANY                (BP_GDB | BP_CPU)
> +#define BP_HIT_SHIFT          6
> +#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
> +#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
> +#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)

See 
https://lore.kernel.org/qemu-devel/20260630220100.1289-18-philmd@oss.qualcomm.com/ 
;)

