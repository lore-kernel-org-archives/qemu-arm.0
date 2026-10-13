Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFDFCC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:33:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGXxE-0004lQ-9V; Tue, 13 Oct 2026 04:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGXxB-0004kF-NK
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:33:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGXx7-0006Yx-Km
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:33:43 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D3xC923475951
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 08:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 epREFiIlJjP+MEMRArcN3bQyVsTI4sgO/LKcRgG/N/Q=; b=m4IdoRAYtD0Bndxe
 X0zxtsdSYWvekwFWs8dmAXb2U1Jky6+2jnMwerYGIM4DWTcXrhTHvTTCCiEHbEqw
 edd5Na/70/jvLmFlB7Vk2udtrrgMKZRTPWtCTrZ/8PEVPreZV5eHFFmp7gP+Omww
 L1/2XSFnmVl0Ji1dKxMZZ/IzYkZzSwUN6J3jgRus/C95VE53WWT7BmJ3DwXl6Of2
 6k8AIXw6qydKgghIhK922+nyxt3LcCxElF5TknDPK/BXevvCaU7ISUl4NMu3QUh6
 TXTTNMUsNhw+oF+J7/ZfSWn2xBLUdxkyGWECaSxO7Tz6LNpX/HFvIYOGvQ5yOUi3
 MbaJJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9158-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 08:33:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5338ff2cf14so51741181cf.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791880416; x=1792485216; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=epREFiIlJjP+MEMRArcN3bQyVsTI4sgO/LKcRgG/N/Q=;
 b=a3B7UM2EtyBQmL9/y8MxJ4DscWrb1iLV6IGBIyyc3IuaXLuFMZ5P3ZNB0UhMKb+pJo
 tjpmnMkDEcvBOhZrTcRYVyIxaU2tb4pcXI6Ah68xsZ4yd8BPMHuMG+kX17pmyYom1JFc
 myHrEjxsA00iUeNDEJUG9RuDH5eT7g+Lb2YeAS2lFjhCfa8QKNzz7+G1dIU3IgQYOjjv
 dm4BIBGqyBZJqw0DUUQdsvfhAGBengXBtBpnFo4XjBmHsZPwlvliV7D/1dfevzaRR7qH
 ZrMsZHRD4zSC9PFLS7WLlNOlHT2DL9PYjVcLFXQ088IILBbl6NQOGVKdZx9m+bsqOpZK
 0ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880416; x=1792485216;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=epREFiIlJjP+MEMRArcN3bQyVsTI4sgO/LKcRgG/N/Q=;
 b=GKAokecM9lG8yAnrBugS8qb0qjx5oJQ9sLOFHB3JAfNHPPtwU1pe4WixjYg62dVD6u
 2f80YdxC/clqhJySJnoTRhL3HcmPLRRJiuzJ2n84Rei3x7+bl3/zoZob0/lm6qJzi5kN
 9iuOY4g0As9aqeccMA4Nlb0xmm43CSkg3EVNdsSRxokWgTv/a5H4UNv7vkbaI/hqwR91
 sCfTQA8c5r1/OicN95JASxZILc9Uw+tyc5LdiKBDYhNnP3Th5BgfdCliEDR/HmNHIl6R
 OiVVrXgDU2xTUbBnV9ti4iVHPc6o9aiUXRkCHg7BCzbls9z8VYG3gNGoYo+mp1FETF2Y
 j30g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzD6aUHwmMCBViuhOvACQSLmJJCiLxcEObThP/ltAN7oqxHCQ7CeYmwcKmemRJmjxWMedOqfymH0w==@nongnu.org
X-Gm-Message-State: AFq9FYK3mDBaEo826h1OA0Gg9n0judU6qI87db81cDGzrfDtBgcSL9qD
 cZJnuaLs8dFrrwcfUwopN4KXZl9oMbCtrzdBSlE/Ehs9MBWFNcB01zEmgn5jBwbwt94Mb809QaA
 wiEfF4QpMbG5Liib7sxuEKd7BOA+B12cNX3tmRHoCS0V6IsmG8eVoCao=
X-Gm-Gg: AYBFou0ciSJDImkJxaNVfdh7rqztP4UCDLBnwJg3DjBIeHgH9rZFhaWzUtZ3CRCtVfU
 8fdfKZeMER0mFZMj9wDAynNhEfSrg7wYKMVSVPs2a62Hq92WPvV0v1eOHxd5v2PfipWxBBI7hRH
 Ad/20rAmkmk8rfTemM/umdR06uXSMG+ncgGeDC0XPTKKSi8b2aXXX9DtlSTZWV26BfYbxC29cmN
 lbDbvQ9HWWGAfXdkKFuAq8sBbQqkCy+aweGboxtOTIIEWbDgMnDuWH6egBpYxiy3aXLO6nvjPcz
 xiLCeHaoURpaWTjg9Kuc+kf52V6Wo63VZWOCO15tT7fa7BbkJc/BwaSCRYZK9eN7aggor6rpmE8
 GUssQdiNrewsbANy2zAFYdCmeYs+Ho77DGA==
X-Received: by 2002:a05:620a:1720:b0:93b:d7a3:45cf with SMTP id
 af79cd13be357-93ebd29005cmr1828615385a.56.1791880416211; 
 Tue, 13 Oct 2026 01:33:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:93b:d7a3:45cf with SMTP id
 af79cd13be357-93ebd29005cmr1828612985a.56.1791880415696; 
 Tue, 13 Oct 2026 01:33:35 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18d12fe04sm215133245e9.4.2026.10.13.01.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 01:33:34 -0700 (PDT)
Message-ID: <e47f3319-0d23-4565-ad4a-7297d734a864@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] hw/arm/aspeed: Use a table for unimplemented
 devices
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Ani Sinha <anisinha@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20261012064445.2571633-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261012064445.2571633-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JjZR0cNuf58PQL0SNFRWlYsa6XKJbiwT
X-Proofpoint-ORIG-GUID: JjZR0cNuf58PQL0SNFRWlYsa6XKJbiwT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMyBTYWx0ZWRfX/mN8VbjzgYPn
 jFGsOHUCMQGRjGcJ0EtgNFSrxHE/yr+leI5F4/0BgtFQPVD58xR3u344dco2UW8lTUKMFDwsq4g
 to4YpTidAWQUoJC7yTKuGLgqw//It9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMyBTYWx0ZWRfX8Bnr5S8rTYeW
 /NTPQjlMiMCZjhiBG2ybwMi2SjwuE+fAT4KRub5VdFnkr/b014Vs7chdRJh5YzpDiHpHinJuaj+
 /7Lee5TxF/z7eDlJCTHF46570dQpdQNcANzLELsxeiY665/Z4mhFyebTfZw63i8i6c4lL8sNsQT
 01FosydXlI+s1SuxoxAlStUwoP+vjamgZcDuH6XBFQ1HY6eWZqcqMcj/cFpnXgTYmhbOiNNgFtA
 zRk/83T7crpxvBa36MgKs8pbQ2+Alr0XRgg6J747wPO4ecf4Oa8JbdyvhV7kDQRwMPIVzlmO+dv
 EJLjir+lMCV8g2S/mdQZP54RndA7+O18ltm/YIwnCu1kYLtmNU06se1POjE6a77X70OXqcIPRLD
 x8lJ9P8/Og4RPHa/mA80ftDiBOY0ulHid+l5LxgG4cUHRvk6bFFnLXqSAbrtTrUyAk5pch9X8uB
 +MR2Y7c7lAiGIz6Mt1g==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdece1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=L0LbioGFXwacteMSHUUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130033
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

On 12/10/26 08:44, Jamin Lin wrote:

>   include/hw/arm/aspeed_ast1700.h     |  2 --
>   include/hw/arm/aspeed_coprocessor.h |  5 +--
>   include/hw/arm/aspeed_soc.h         | 14 +-------
>   include/hw/misc/unimp.h             | 21 +++++++++++
>   hw/arm/aspeed_ast1040.c             | 40 +++++++--------------
>   hw/arm/aspeed_ast10x0.c             | 55 ++++++++---------------------
>   hw/arm/aspeed_ast1700.c             | 21 +++++------
>   hw/arm/aspeed_ast2400.c             | 25 ++++++-------
>   hw/arm/aspeed_ast2600.c             | 44 +++++++----------------
>   hw/arm/aspeed_ast27x0-ssp.c         | 44 +++++++----------------
>   hw/arm/aspeed_ast27x0-tsp.c         | 44 +++++++----------------
>   hw/arm/aspeed_ast27x0.c             | 41 +++++++--------------
>   hw/arm/aspeed_soc_common.c          | 11 ------
>   hw/misc/unimp.c                     | 20 +++++++++++
>   14 files changed, 138 insertions(+), 249 deletions(-)

Per the diff-stat it was worth it IMHO :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

