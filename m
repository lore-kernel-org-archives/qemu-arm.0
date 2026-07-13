Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484F1C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 10:57:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjELn-0005kL-K3; Mon, 13 Jul 2026 06:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjELm-0005ji-CP
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 06:57:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjELk-0004la-UZ
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 06:57:26 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D7Yoih794294
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 10:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SNuZ3bbn6U4Dg7zow7HCAWMjkGisgq84Sg6LG7Y4owA=; b=XvuTeiKqo30ie/MB
 Fj61MzxRRZPTw8BNlFJul+N/tFvkTWhbfiN9aW53+X5hm/kszel8QNR72fu66rlS
 2eSDas6Rs+E4dJCOPObTiULa66IN3TXN/cs7ljyVtRBj6KIC0hrJGl4DMNvz67lz
 8EAwFU2QhexFDGZ7iOQnZjqgO4NPG9A+mC84pmrPqNhecFxKHN42omvO3u2N7UEK
 BBWvGCJVMRffa9g8gxPPLX3k927rjHQc6X9cQx8FKUFWRPytdJlo0MYUmawDzLmR
 +1qqgzl9DBzLDjYObb6zJwkLPupGDJJShnekA4FyOlHmu1jlIAHktWUOkNkv0ZLY
 +S6d3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0q4c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 10:57:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1d137a68so70525551cf.3
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783940243; x=1784545043; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SNuZ3bbn6U4Dg7zow7HCAWMjkGisgq84Sg6LG7Y4owA=;
 b=V0chMq4sjpl1f0SMahQOC86gQgq+ONpKCPKIuEp7WB49qBU8jOcz5cWxBteVbY2+W2
 1dtmHTJ00rBla+p9vUTMMha5HtgFTuQvk1yQf5bcW+AeaQHBLSpgPvRrDwZ0qqz5D8Ud
 C5xYmjsus3MWxl2EGlPATGc++XpBz6RPclbuj8kdwG0E05BSjeiC/l/9fJ2dE7PaBSwQ
 1nHp9LfOvcOQY6SBuEPncb4UqddS/+oXAOqY86sZQUkqmTNBtokp6iueouDT0SRyQo8e
 2oowFPWPsitKUOjNkiFr/vD6UR4R/NMDCmGt511xTybAcgRe0grMw/NrH8gOwkVMg4My
 2DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783940243; x=1784545043;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SNuZ3bbn6U4Dg7zow7HCAWMjkGisgq84Sg6LG7Y4owA=;
 b=gVUj7SO3hvISws38IqiFsTD418vBAHLCpbbKKC+ZypQ17d4I747KcvSu0jZ8aeFVVU
 8Nr16/K4pfC13snlPS0YEli7667AmBnxSOTMZ56A8FC5gvwvyekfz/6oUIIIs1pZtnKL
 VGe0Hj/tquZT1KbaxOsPTYVJcmHqdrIGVU+AqMCEWkdJ9W5BY7bpznWQpt7PyY1PZQ2N
 ZK67TKHx54i4ZtCV+AohBt3PyiReg94YYNov5TQPHkk5+PMAiAn1B67irwvMCkpsWBO/
 0YzwP1YjkLG7rFJvTDQgjLKEJDEH+kP/t7oiZNcjwqQF7GqHNOlIZIhDVxUh/FcPBQES
 lbwA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxsrdOHywxzw+qb0OmuS8ZuzYS3g6HLDtKWcAMhABhIguPXLQoH0ejEgmz6DbsPX5sw5Yy7tb7dQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzgxq9GvdewwhSUp2XaC4raLM0gD87cKoABR3C7kPtzj+TN46ai
 5kgmzsw4x/QCRXJ17puJ/RfuQU62zZ3M/SBp8e/qPyekWrzNi0QcGQJBkopCnHSGcxwcZ8etD9U
 aRYf3QX6WPoXE727SrX99yarZxIDfsRkQI7t87dn8q0kyt1sZDvlnJbg=
X-Gm-Gg: AfdE7clnedVEj1laRCezmO4u49c9ghZZ4G703WIWfGYr7IOYOl4FTlntq69HLfm5gUx
 1ewD/AocWHiT1fWkIRG0DXmuoUmlJChkVi3qbQ1GZYw6bqUq9+IY2VhFJNQxnKC8C0M/7qhLxfS
 JMF17CJbDcrroAU/TJslpcw1/EVFsU01bHUTCHsSV/ZV1pOqfJvONDsX5MHs1wWB3wHL4EgT5KA
 MTKHFoz+hHOlJ+SSxzG6+TXrK/Y6wtA8VaIY9ITqgdTmLcYw5jypvGX20yPyTd31PhG+jGJivmd
 dsRInjwBaNKpYmhXKItzsMuVTyyAm3/svqCBShuYm4Zw8BBbYrhOLU0S8duNSbWhmHPhRkBieu1
 jijLLokSSPSF9BOGWK6EVRcpSwcPvaNSJF1oiEOAcKexLzkgnkPiehoYqHtTIRw==
X-Received: by 2002:a05:622a:1446:b0:51c:8439:14e5 with SMTP id
 d75a77b69052e-51cbf0c7fe6mr96986851cf.10.1783940243486; 
 Mon, 13 Jul 2026 03:57:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1446:b0:51c:8439:14e5 with SMTP id
 d75a77b69052e-51cbf0c7fe6mr96986721cf.10.1783940242987; 
 Mon, 13 Jul 2026 03:57:22 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f25b23b7esm29489580f8f.18.2026.07.13.03.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 03:57:22 -0700 (PDT)
Message-ID: <3f70bfd4-a410-4709-9d50-a6ce6cd0253f@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] hw/dma/soc_dma: Remove soc_dma_port_fifo support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710105907.2570621-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KVAKK2wnz1vA0F5UCeoEpG5jjOrn_rww
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54c494 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfXykq0uFJkEkhJ
 2SC99pe8NV9fUdikp45e2bcLv4Boc0p1xRWvIUzhQlZbgXULVnpkxmmev2pR+4IrprtPvMz9o1z
 tIrWocRmgeF+Ffel/x9AFH92rYY3o7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMyBTYWx0ZWRfXzvCNPmpBE6/E
 LuRQggAlmDAsJOoWf/yJjp4r4CyJfmY684d8yCaZzXiYZPmIrw2PaM/H3YwlKhO+/Y2f1ErJV8h
 i9Ok9iMggJ0X5I1Cm4kPChs7qDTgHKHyxhr+HEgifzYrsr6tTr0WYrjF62Nh6ZqTa65pEfFg7Gb
 dYn8Pheku70S78qABmna3KH1H57zGWayWBm/vUD6q/ry0ortqGV0Q1KtmKj6aNYSLlgWnEqv9uH
 a5STkE9meQa4Igdao2HKx3vb+AgdhOHo9YdP0mIQfXmTyJEPwFYNMi0maZm7wm7d4wIPSxvktol
 z1ZXe0OquPAg+zex5+365CvhxKkLHAzVm4/goANl9dhb5DpnLpVutVXwBR5G9ilKmn5kIeLnCDQ
 FNLfFuYTIV1zqUki39GfGw8176jbOsWFxlJnZWUETC8HdufEC8XkJEtYYRidudktuqt/9RkoQxH
 YdHpO3UJuATvaxkfaVg==
X-Proofpoint-GUID: KVAKK2wnz1vA0F5UCeoEpG5jjOrn_rww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130113
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

On 10/7/26 12:58, Peter Maydell wrote:
> Our current single OMAP SoC doesn't call the soc_dma_port_add_fifo(),
> soc_dma_port_add_fifo_in() or soc_dma_port_add_fifo_out() functions.
> Remove them, plus the soc_dma_port_fifo handling that only those
> functions needed.
> 
> The motivation for this is that it removes a lot of code that is
> careless about the fact that the largest possible DMA transfer is
> more bits than will fit into an "int" variable, and which does direct
> accesses to host memory pointers into guest backing RAM without doing
> bounds checks.  Deleting this code means we don't have to audit and
> update it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/dma/soc_dma.c         | 105 +--------------------------------------
>   include/hw/arm/soc_dma.h |  24 ++-------
>   2 files changed, 5 insertions(+), 124 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

