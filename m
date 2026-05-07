Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD59CCD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 18:15:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL3FX-0002iv-Jr; Thu, 07 May 2026 14:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wL3FX-0002if-1F
 for qemu-arm@nongnu.org; Thu, 07 May 2026 14:15:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wL3FV-0008O0-Cb
 for qemu-arm@nongnu.org; Thu, 07 May 2026 14:15:02 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 647FehiA3464037
 for <qemu-arm@nongnu.org>; Thu, 7 May 2026 18:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vsm7g6sic+/Sugoc5kzB9gJocoiL4wG2LeCL/RKuJ7s=; b=FkVfs1ogT/4JPh8D
 1Us4hAKeq34iVFvUSPCGsRZOyW5cSbaA9aKK3B8jqdFlY07aW1LoeHLk2H7bvV1J
 rJvvvQ0Qnktc69u2FsKJAgJgnbxyKMrJZNje6IHxA2RQzP7V+RUCMxKb7eVYVJTT
 7uas0VZBB12MoEC8p/pmx3/qx9kbrv8dfKBrJXzIekqeXpkWVCf96thsinhyiY5A
 IbiISlmpf81KozaE1FPRjqvUy0IZpFJXkQj7qmSLEgZkmrZAuWp/G74qgRo44DCR
 3a0QI/jWqnyhA7sae74MnfMzcP7gLXmXgcjUncPIWM4CQATVVDdOcvzYV7yuUXEd
 ezDDoA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn3jv0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 18:14:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-12c35f2c09dso2033038c88.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778177698; x=1778782498; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vsm7g6sic+/Sugoc5kzB9gJocoiL4wG2LeCL/RKuJ7s=;
 b=UbaPFzADg7jVgCjakLzTDrzyy0aUPKETi769NPP00nAZj/XqBJxJEJ+MM+xEW6d4SN
 DA68SgygX1SLNxn5esiFKtD4YiY9Noh5ZW4976chlffuLdNR7Nfyxsqv+pUzJG+ELaJs
 xTnXrk3FCe9+NA6TKPVIScsf4LDmQ/Ty8yavIVW1BxEWtCBYuj0ZCBrIPvUXRX11xieM
 3lCI46iBmu+5W7pgcGBl4vzWSo9QHDh5vhe2XFfJokhAbbHZpAgNtqMZx04zwf+Fd/4i
 iuojrX4Qm14f+i/68GViqpv5QrrjSgWH0dKRj/HMC3DSBnixnu/S2glbuQAHFJypSo9M
 cQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778177698; x=1778782498;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vsm7g6sic+/Sugoc5kzB9gJocoiL4wG2LeCL/RKuJ7s=;
 b=GKPZi3WU7WNfP3eIbcqgAY92wLdDI2uuscerZYRY0TVGXPoxhI3NpMnpW4NuSkP1Ln
 WrqvDOGDsxR4GSPYgzX38qXLDSzKPn21JInojDRdlAny5mQzrNiSrcuIeRHjBzzvqQWq
 xJZnuBnUfaNyTbWTGRm32fDystn/xjU4rfVeQzHPHXIL+r++oruGkbA8uMkovtWdw7xJ
 6v8GhlPH9gevMjAUEBanmBsyNGBncnhNgXndT+yz3UBzw3XX4ZfOlYU3TLvhQi5UJpFr
 MJ3mQIEbyNQzYgfGvOP8IYW0nynQ+zwF+QHECsL8os+YejLKUg+Tuw3J0kRb0xKwL0b3
 c2Ww==
X-Gm-Message-State: AOJu0Yx8zyX35cIwfxEfNvWzb50akQ06oGdra3hBQHxEh5hAhBZfHBik
 4rGqa29tpjp88P1inxgsd3qhrXbajPXwCjfrVmqDvyo7rUyamBLilRTgQtQtPh5LSI9i0T6qNyG
 oU0bpoa2nS/QIPZ6mf2R/0JwCpDqiQI1hA95bhcwg03rMzIS0MFcB8CQ=
X-Gm-Gg: AeBDiesZnLE4rv85v3rfp8x31p1LXFnYHYk40WpygF62iqzN8p8hNzJo7rQyIbm5EA9
 xbQr9BrAkeF1LSkzG0/993ELgQ25V2HsCv/8tSlLMYuaDoIfRplggQ3KwvGY8v0ZFrZd6v7SEHU
 QwvpHKxZrCG7vt8Aa16i393x8fBxCRq/yjClJ659ThZJ8u+rbw1b21D2UVnPBzDEoJZ56yVBU93
 SNgH+4cX5j1gr+d9L9gnUgppg7R61cZClLlA709iw1xtoTr8lyk+U8pgckqBoJcuGywjAg2ma7+
 GVqtCA0mwp+r7DiS9fsppReFkjZyS4iGBiBTnObITRm0DP+GrbbNpCcJWXNlY4vzSdA043UPL8p
 w4tJz9jpX+ofCtWRenLkCCSmOt1yyeYHwvdvXDSvEoRP4kgqlTCt1f4Edjzne6udtwPyq0bTg2R
 PeE5Ied9UYivFN6w==
X-Received: by 2002:a05:7022:4593:b0:12d:b8e5:5ee with SMTP id
 a92af1059eb24-1318e7f7339mr4631357c88.23.1778177698038; 
 Thu, 07 May 2026 11:14:58 -0700 (PDT)
X-Received: by 2002:a05:7022:4593:b0:12d:b8e5:5ee with SMTP id
 a92af1059eb24-1318e7f7339mr4631341c88.23.1778177697309; 
 Thu, 07 May 2026 11:14:57 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1326c61f2b1sm40444c88.10.2026.05.07.11.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 11:14:56 -0700 (PDT)
Message-ID: <f1ed7aaf-e1e1-4a04-ab70-743398554055@oss.qualcomm.com>
Date: Thu, 7 May 2026 11:14:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Rename Aarch64-specific methods
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260507134709.70507-1-philmd@linaro.org>
 <20260507134709.70507-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507134709.70507-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE4MyBTYWx0ZWRfX7YRRFdcS4l7/
 X35IDtCgPPK8A5VEAUz9UvvqsvNKxUvFL1IPyYJjXHJ4dv/IM1/x3WYJ+FrDppaizrNRskdEFlf
 qP9bjY0pdQlXDI/d5DrfMwszgMI0eI052HuB6qeOFzbJ8l4ZaOs4Hmrx7/FjNKU6sLzTcQNdDg5
 HojLAmPALb0tzNeoLxXs7FpmaxAMT70Uz/izwm3yMCs8iSkDSfrqK42Q9ruhCkchE29Ee4tCDTa
 vvKA4oUfL4gQYvW6Yc2Lt0hYCr1MLc/Uzi1nG3VRdYq9tjT3ULAyQG2tYgh3bxk+2I6efMQbk6p
 +MiVH5rIxskmtWuHifhDWsZydGdZ26wP/9BQhl0pSUJe7RR5hE3I6R2PqsQeb10aFultdQ2VNFR
 MnEwSk1LRqVAFRGojartgxw+RXbusJ8CAWVxeiHItvQleva+cp/Jtr70WHZcTERPZevg3YsCU9P
 4r7+YPvGNbc6NM46ysQ==
X-Proofpoint-ORIG-GUID: RdS5luVDhlavXLnAxaxmywIBXqTlU0io
X-Proofpoint-GUID: RdS5luVDhlavXLnAxaxmywIBXqTlU0io
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fcd6a2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=yxX4FA_8Oh2w2vnb4N8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070183
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/7/2026 6:47 AM, Philippe Mathieu-Daudé wrote:
> Various Aarch64 specific methods start with the 'aarch64_'
> prefix. Rename few more emphasizing Aarch64 specific features.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/internals.h   |  8 ++++----
>  target/arm/cpu.c         |  8 ++++----
>  target/arm/cpu32-stubs.c |  8 ++++----
>  target/arm/cpu64.c       | 12 ++++++------
>  4 files changed, 18 insertions(+), 18 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

