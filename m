Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB4FC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 12:13:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjFWl-0001k2-VK; Mon, 13 Jul 2026 08:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjFWj-0001jA-SR
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 08:12:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjFWg-0006oB-6y
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 08:12:47 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D98mYo793086
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 12:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0XLo5c5bXPi1kcGUU3o6fmF+i8P5fiilgFAhUvqzwdM=; b=feZSAqAQWIZ9Wdm7
 rro3V7gbjFW8KWr3iP39vO/V4938QIqtbAxBQPqdb2jGBjH2onkQyFyrH86tFVpX
 1z8LI3N3gzVlobIqShdvQZWIPq3Vc85bIK+NSemgCb7vYpJuBc8XflJUoQsA4fSf
 N2a/uXvT0r++z4szGeIGbr9qvPqlrRYBy1ffc4QqpRFG2vFWYZ811B0QUJ/yO7FI
 vrUvLEE83NTeoFzccmMbh0F4U/JvEBCAsPEWawVKtbCiPZqPNKybQHuAq34NiJDl
 J/gJfNeugV32s+Ufn5sOrVDs7fx6TQYueOV6JhFlXs8b8AONfOHnLYfwxA1DSlJg
 hoT7/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrmv4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 12:12:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1a97644aso52184121cf.2
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 05:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783944763; x=1784549563; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0XLo5c5bXPi1kcGUU3o6fmF+i8P5fiilgFAhUvqzwdM=;
 b=e4a/hsDN75qx8WiQQ2yYIZhxTtV5nBVRLi4qlruJL1dAfEVTLpTBsmjBzhWv4yBali
 U8ysHqr9qNegdtJU1i41WEr1k9a+pvuCrPsjRNBhfRulHizZraksgYr2h4JSBMZhxlf/
 IUOshmQbFP4Hp2TDuBOapWG5EgouCmttyyDN+qJDWJiB6rfLGQYL0aKvnvcsgh5iRxQR
 fsNLx2M2J0LJFj3PF1eO2hAcBH1QyhX6G8/g1SQq5hYoq2r0XsdtqxQdea63V5Vytv9d
 NCpMQIWNELZyob6+ORdhLIeEPk7NrS/P1ZwuYqLTfxAF4VA8ZuteayNabzjV68aXh6XZ
 JGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783944763; x=1784549563;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0XLo5c5bXPi1kcGUU3o6fmF+i8P5fiilgFAhUvqzwdM=;
 b=e5RTSexjd66RSLFzbNDTNp5YQA7KV8hvL21R5xoafGWXEI/0PcoxiRh+f7c8+5wnqJ
 SaPRTJxHhSxYLSm9+Ri0+adY2SgS2uSnLpnyZtHmz3DwsvC2Z49lABnBH8UPX6YOXcB6
 IPTcQ2EnalpllBNAOcoiXPxSmchTiDK72cKhIuEHCx0Za/WpuLKudyvRHSmP/CTB+yOE
 wBv23h2kNpWS3NQk5xyni0VbvJFQp7CD7+f+jkXZ76LEfV1xPgOGYDi3CS0Sio8Gp0QR
 zBBv3zLRCL/wAbElgdKaSQKyg6a47ySW2bHVhfU+yciVvq3sCcTgq6KaMtAP+F7vimBz
 4UoA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVLZSFH/tIjGriA/QnQSEG4NJ6v1Lv1oTFXd6jnrGPTX19fAzOr5edNN/TUXTfDNDtsZoo0dI5Vg==@nongnu.org
X-Gm-Message-State: AOJu0YwhY5gdNMFrUM+br/qO97jGt+1td0XabTqtWV3QvZQRqSSpkEhp
 U9yvQ76XtCwabr9kFW2qCIxF/5BVch7abl3iWiF/IGDYPCLCmTzTqj+nVucFqzxZ/9yxQLl9Dp1
 QLj1yVixi3wpWKBdvr7mIAWsfNZh2BzkZAfFTW6/To+5+Ty141jGZ8qM=
X-Gm-Gg: AfdE7cksWSvm47k+X5vVKADVAnengqZs4nLiA2q9ljILdzlDzlB58wx2xygxJfbUnmG
 rBinRiDBmBqKBL7iOHkgBTZA5PuOuNG1hurY57s0U4PRJXcuI5oifT3OmiofFh3e8o+pM/Id3pe
 rXKQ62X22V7Rssc9Av2D1DFwH3Hmo7Zrznx90AC2uJ5kCYm2Z6OSWFY888whs+qiDrfD3g8yJTl
 47ZLa+NCZv+BEACHQMhRf4iQPr+9CtrWcueCAeWuSTX2oeiXmJc9Br9Ah5rDHGc2ZACiBBZ9i5q
 LjvpLgJJfEOcCkIfHEYErYuSf+TB4hxinyJS++LKpKrcso2TGWWuBf+qzSvOGmg5bJE/9A22e1o
 I9WOkVqxisLsGwjoCl6ZV+PQg+0dNmdea5rq7khlBwXK3QzrkIVpNSfqLVWYnfw==
X-Received: by 2002:a05:622a:1f8b:b0:51c:7b11:41b4 with SMTP id
 d75a77b69052e-51cbf2eeb27mr84549661cf.80.1783944763190; 
 Mon, 13 Jul 2026 05:12:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8b:b0:51c:7b11:41b4 with SMTP id
 d75a77b69052e-51cbf2eeb27mr84549281cf.80.1783944762792; 
 Mon, 13 Jul 2026 05:12:42 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2a2e499sm289167485e9.0.2026.07.13.05.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 05:12:42 -0700 (PDT)
Message-ID: <af1ef226-7cd4-474e-80fd-6500c2f365b2@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] MAINTAINERS: Add soc_dma to OMAP section
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710105907.2570621-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX48nS3TsWOwGn
 Dp3RTkRHYpUk8crIJgU3aNZpq6QpTcWw21f0VWGHrjyWM/bXnhWhz66saJmgK0a5B2PRWu5Nrc4
 rVT+EZk+gtQ7qDRzjVD/LsOiyDnstJa8+7cSxbE6yBO9vpvg+JVl53dPrI4R3FeTeMx7Q3VS0As
 jfN3fvGhEw0IuHLdx7KJXjXyanJjcZ4kfOIUWAx48GejZgrytk+YG9KUCAndu90kr+Xc0WP+5W4
 hF5ycgowwWwZ0k3if3/CxxDQeBbaOc9iu76DD4hSADqUt+NfSqOjWmY+pGb2pgv43RsfBBnuUHn
 kuGEF+xtIL6S3+XVUGPvDxZyY777mlnLuRf6/1J9YUiW4YFqe96mn0E77h0FHsMu+Wu/YXUYPGD
 VWHstvHOm1QkxXsnQbzqNxeyI6X6k03SR/uRmYdCj67lmKE6QzQJtvuO2w0CNEwqSxAah8zzi4i
 btzW6pEabkYgYBTyahg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54d63c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9AZmM4cXTG6XT2A47SnvIhOLkOnc7M0N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX1R2+TJjENp2+
 PGMLvVxtWFNRJNNMb2Ovz307vEQnhQJL2IpYWsOLmf4XSWy8JdkaiESDo+3d6drPO34tnQ/5StJ
 pLyhbW76IxILfgH2DGRuC1hqj0Bos/8=
X-Proofpoint-ORIG-GUID: 9AZmM4cXTG6XT2A47SnvIhOLkOnc7M0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130127
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

On 10/7/26 12:59, Peter Maydell wrote:
> The hw/dma/soc_dma.c code appears to have been written with the idea
> that it abstracts out DMA transfer operations from the details of a
> particular DMA controller device.  In practice, it's used only by the
> omap_dma code and I would not today recommend trying to use it in any
> new DMA device.  Add the files to the OMAP section of MAINTAINERS so
> that patches can be cc'd to the appropriate places.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

