Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AFEC5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 13:55:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyV96-0005d1-Jr; Mon, 24 Aug 2026 09:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyV94-0005cb-S5
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 09:55:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyV92-0000Ld-Tu
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 09:55:26 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OCusYQ2583535
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 13:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XUZAo6GcuLKPk2CoJqT164QTpYs/mih0dgLVX2ex7Ts=; b=OLASpdWA85RXKJ6/
 sc+4mcMWiiDI1fB7uS6kZLMGHQtKkyuQ6nKDS5/nfaEUuYtXFQLd5THJAZILTn6x
 JJEU3hFiHY1omhm9cWhYPrEl9RYMiwbfPb+zD9dKpRTUF9nWBaTI3LEn0EVaFy7S
 /5J5Wo1kPzquY8MyWy5mesB9AqTEGdyaDKnx/nMMwzUnrcGeQvqTVv5yVWkyJHxd
 OVHkxHnKx6X4M/EsufgcQwSmdSS3+68+gV6cWyGJ+CUAhAHSY9dDYwtXFx1OY2A9
 I91j16ogVHyIEQd4YQLAZAmOzrAypRQ4lJ1f3usUgsGgiOoVYyM+koQGXXHNkH+T
 CmQ7Lg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbthnrs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 13:55:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52d9cef8d15so66400951cf.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787579722; x=1788184522; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XUZAo6GcuLKPk2CoJqT164QTpYs/mih0dgLVX2ex7Ts=;
 b=Kc0A8+msIi/U0ZJUY++MljawlSWioJaAQqf6tFuW2qkolRLoWQkAbqmvucb+r2LTiU
 F0YRsFFFrO5o9enKQLixMrAGktZAILkM9B/GfAi9Gm/nTnEM4gFqvV4d6BrOd7i/SKTc
 qt/VBJncN2Z3FfCDeBYx9pvNMnF9Y/2EtPh8yJV7oRgtl1ghCYuZFutmN9yrsmhWaFbe
 tUnpyRIItuJACXvTrqMBEsJV4sPzGF9O3jlbEetsXkr7BZa64d84zSa4tIYs8a71efjV
 tutviTWS7zzdxjhkABWWig2xeQcvSbT8bn4S0LwW1Y/EjrknhQGZGDXaB77vhF+XAOis
 tDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787579722; x=1788184522;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=XUZAo6GcuLKPk2CoJqT164QTpYs/mih0dgLVX2ex7Ts=;
 b=cuH7tdxSSc01e58wDVKDr6SZ2aJA1bRKd7FNXJgapOUQHcEjBndU6MDvmdyuYGDglk
 yRX75fwEOYwHWekbPXadjAIg8aF8d1QIZTRPmiytggP1hJgaNyl6OhKzRG+wO3JDH4hK
 kX5T7i/O5f1i2e1/n3CGm1z3MAMbZSzp7LHgPMJuZ7eQ97CA6PJr79OWUlR7UlG0dD5H
 ZtlO/msH3K+9bKLcF4s7lYJoCXuwfUL6S0LYYycZAnVuPuh3cEp1cvfquHuQ9/2nW56q
 3mOlduFZhgPknCnRViAqOvCFj+xHa3wp4Z/rFgGmxQouj602wFWDbSNeSYVXE0mTz2Sq
 tKPg==
X-Forwarded-Encrypted: i=1;
 AHgh+RohSVK9txwfYYe5IpfZTXkrmw4x8lBM77DJNCgjjaFBLz2OgKYlhP/23kLX/f59DWlT1xxC/HenfQ==@nongnu.org
X-Gm-Message-State: AFuF++mxWretFXYEYGB6VbYT/l6cbzZ7eHz6IIW6MOUde1cEzczQ95T1
 XDZwxu2H2oCqMOWWqZ2a05n9dMaVsTXBnBjsngeSS0ZeZh07zSs5jKcIOLL0BdxpI85Mhu2HLq8
 /E7f+Difx2rpXsSLIzyRpmSjgePAu8CHguwIkc1HyI21R0SmuEkAFkAU=
X-Gm-Gg: AR+sD11dua5XJE5NjSKT0dvKSmvHZ4IBNLjKKBlDfpFt2ZQEcCFuQeWVbcRf0ETQleb
 AxnG7Ts7bWoqXYauGXBqehDI2x+Z1JfndvDXFAVNNycceJksn6Sd91n/jg/RtkHZ+m2D36G8Gbt
 Ncg5pS+I1rJQqSSh1EN8PJ0i+PC9MhoJZbeMTQsaK1Dn+gSsFCuAuokdDGgQ4IKPlcaZ3R73jB+
 nWyjaJA956qrBz0Eje+Tp950qxQcQqpE+sVbeP1wTMR+sxd0Jp+DeCBOrM2NCs32cM6dkps860W
 Yo8QN7xy/UTtfFi77qBBRdCX0kWSxFIZqemq15lSd6IOyJG+cU2YANgT/scdw1Pf4p16CHRJsKI
 8rXJgkgD9hzVkQXRkZvw/MSG1jPCdS8Ue73XxRMv8uUP1tCQjDA==
X-Received: by 2002:a05:622a:1352:b0:52d:8679:ba94 with SMTP id
 d75a77b69052e-52e09aa1528mr176619121cf.0.1787579721718; 
 Mon, 24 Aug 2026 06:55:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1352:b0:52d:8679:ba94 with SMTP id
 d75a77b69052e-52e09aa1528mr176618621cf.0.1787579721306; 
 Mon, 24 Aug 2026 06:55:21 -0700 (PDT)
Received: from [10.254.188.74] (102.19.205.77.rev.sfr.net. [77.205.19.102])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482c9c0acaesm8357253f8f.29.2026.08.24.06.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 06:55:20 -0700 (PDT)
Message-ID: <03dfa51a-64c2-4b79-b524-2bac3e53335c@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] hw/intc/arm_gicv5: Free memory in finalize
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260824102805.639072-1-peter.maydell@linaro.org>
 <20260824102805.639072-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824102805.639072-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX7Zpy6QxeTwct
 PaXXcKeL5ho32NHFc3zapAL9Ny5w7YDw7RkK1m0cgoCiouLGzgb2FiONdP8FGsBP7pIWa8r/whC
 7atbYVPqb3rQ/2YnURqgGajMKl25zwrbXNj8sS+WZyAmgaKvzXaYv9yUg+fep6GwoAVMt6C6EOh
 swQ+bugaG6JfxxgZRtPRUKUINXzduaNYH+N5xbOpLX6QeB/snDeRFGeL/5hoR39Lfl0r+0frE+H
 0hv0b8R4iHRyNQHq8mHlqdGGpcwWaiYUifYYzIS8+UKMayqelotJ+/A6f5pittMe8rqmcqjEKSk
 L4lml8HEaEXW3KUuU1pzfXSGHCMFAL5mvcVjAEhkzqlARIphbkVOvAKcawteXzf2SaiGdIfCGiM
 gl9hXshbBtgeGV2kdfOUYfc/BqYPOuXPQIBE6VfioiSdvKX5clmsoEBzRwgXVNt5XiZAu4rmvHe
 uE8d/TE/fT4x+Wy5UhA==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c4d4a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=3Njm2NGJn2tjTLCKQaqOdg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=9DJ1f-wVD1Wiv6ShGPwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXwUnhkN9kbTUV
 NdqJxQMKNaRrWgo5pz8sryp/poio41aW/qsA8S5AMJcp4LICn/MqhS2tZJTIfo2Yrtbz4glmnP1
 n6JZO7+EYeFBJxCFhED7a6+2i6jk5UM=
X-Proofpoint-GUID: 3LTvArGgNm7-v00lbLffrmApXejQIUJb
X-Proofpoint-ORIG-GUID: 3LTvArGgNm7-v00lbLffrmApXejQIUJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240116
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

Hi Peter,

On 24/8/26 12:28, Peter Maydell wrote:
> The GICv5 allocates memory and creates hashtables during realize and
> as part of its operation.  Free those resources in finalize.

Why not in unrealize() path?

> Since the GICv5 is created at QEMU startup and remains in existence
> for the lifetime of the process, this isn't an in-practice leak,
> only a theoretical one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c        | 11 +++++++++++
>   hw/intc/arm_gicv5_common.c |  3 +++
>   2 files changed, 14 insertions(+)


