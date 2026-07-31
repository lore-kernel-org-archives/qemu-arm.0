Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89368C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 07:03:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wphGx-000215-4H; Fri, 31 Jul 2026 03:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wphGv-0001yh-Ul
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 03:03:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wphGu-0004l2-Am
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 03:03:09 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V67eJM3011117
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 07:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GBT3XfyjPUom495lVaSfPTGufcXcof51c7FlkCIEgzo=; b=AcmduX/kVWJH3eN4
 BFTmDWqjbVrBManH+vr/EFoG47QvAqJUSFYZQExMs6IcPxL9o5qerun6AVrWayIk
 rO44ym5oY0bTap/jVn5ow6mwn6s1gKpioZNaicHXkENJH5B5zAXUvr9uDBwplsPZ
 y4VCHrYNyvp0getTFiU9D2f8csKZzE1PQkYYRmKHIbeJv+L4C4DOpb5QwCo18Ag8
 NHs1fbhAS5j0Ww8lIE6uRCfmpmuKN8S020vkuO0cAXNeQiMzGzaBePb14srXtTsb
 +05KLz9XaBx7U1fNLLP7cyvPEUOAbzTeBY7ierTDxCfQYBHNnXZHtfd4qKd3h6aR
 Q4M60g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5n87fr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 07:03:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bf321d786so6206841cf.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 00:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785481383; x=1786086183; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GBT3XfyjPUom495lVaSfPTGufcXcof51c7FlkCIEgzo=;
 b=MM5eb7R+8K0WsVz/xh5kib7Z+j+aynKowzhr3t13EZxIAG6Ox6Hqdbg9dWdLtLOiWC
 N3WEW+o8Yu0GuSNDaSpPffLYPE8KJk7hETUdVZ2brLX3Ja/trg5gU55w2uH06SQWGx4I
 0Wew5UpDhnWItPSV6NXMEnsvqJfO2g9Ht7LkrAOa7sZU0mQnm1d6kvi/1YY4sYqOvWHw
 MsrtNuwSLQMXjY+tdvpZX+fycWCAMI9X5A5BqO1QxKvt3qvLdkUk8fQRRaLnX/R5Mt3J
 2x2N8QQJJrqAAC/d/YGWpr3L6vUKsxtjfIywmtaKta46ZQNQrz2Gflu7MOYTKGULjc7Q
 F/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785481383; x=1786086183;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GBT3XfyjPUom495lVaSfPTGufcXcof51c7FlkCIEgzo=;
 b=gIqy8+kGs7WDIjrtwHDmtIrIbv+2kYUXLXPkGUtpE/OmkcQFxuN0SA1Bx90NnBv6Zv
 okR5JXzkzZARvGUnxLbRYXwHViTesDLgScfcZzwgcWJDIOmTQy2VMXECzD6g7tFOOkM+
 pFZ4lULaUhcYIZsX5NHI9Z8WJi185/NvkWbV2h7ef5GWXVvjfu+Nk3Y9Fnlpmwd+P/tL
 l5Fu49vJCaj9+JElubkHbp81Bb31kea1jd8n19H5qvJm8ykPimT/gSTlm9h+SuV2m34d
 P1NPtGP6lHX1xhv5AvpXPFCcGdpVv8ao1xddQRxbZmx7eCaeLYa6o6UDpG4EQM5wHiRA
 QZJA==
X-Forwarded-Encrypted: i=1;
 AHgh+RomDjWSxKi/JrzpElQMW/BGXE383bbefPq3doQcb0s83ENNNl3X6CZFOTuSgRwyM0OWlG2kldlneA==@nongnu.org
X-Gm-Message-State: AOJu0YzZIyMH55yrK5E9AbeGCNPO0uVoFchrjAYnx0f7HLVHLaJkZiek
 Ez6wRTPaPB3gwiiJ2j5maWYQvsXR4Flh8HMhAFSulI1ux7MCvrGFVQOO7mY9UipMAf1E+sAkOlX
 5GWCE0kPxLmAMOzYi5mMwk2k0bMrrkb/f541YqeX6sr5wS9B7tG7LzIs=
X-Gm-Gg: AR+sD122fU3LlYmHnN9k1HxnHdcA6GHMmmZi6E6xC9g1sXYdzoi2IaYLw32bdna0xsI
 mLr/nYxrKpVDtMvRpQoMQArSITWWqG8AUeFV/xn9Ir1nBRndAN7x/cJiQaJcMhjxFBAreJ3sE/N
 uuKUKj7XkOtuRjCqk1sHVrzliNaARuO3VCgiOWJaj41+MbnVVCzAolX1MRGQLrBriTGBR3fHkTD
 mCfcPkCJIPqDV9ZrtuGrh5RcJkotgqfflkheSDi4LCz287jxjklg2fpfQodCTc65jl79hVr5SlB
 VkvMroySzR9JsAeRdd3rXP35ckal/Kgwo6W+rBHl5yuK6O8tGRGKXMpbtA5I5yFWRwjTZTtgI4c
 i2PXobjy8FL4EQUaidfqMt5wa37rizf9PeLzDKS7uCQD+Q55XINs=
X-Received: by 2002:ac8:5953:0:b0:528:38b1:b539 with SMTP id
 d75a77b69052e-52b4aec47bemr9140911cf.10.1785481382877; 
 Fri, 31 Jul 2026 00:03:02 -0700 (PDT)
X-Received: by 2002:ac8:5953:0:b0:528:38b1:b539 with SMTP id
 d75a77b69052e-52b4aec47bemr9138961cf.10.1785481380560; 
 Fri, 31 Jul 2026 00:03:00 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a09c660f6fsm325090a12.25.2026.07.31.00.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 00:02:59 -0700 (PDT)
Message-ID: <064d4375-1e23-4076-85b3-99e9fc6091c7@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] tcg: Add revbit{32,64} opcodes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260731000503.170446-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9Cng5nJIjiN7fQb5cZRryXEERICUFeD8
X-Proofpoint-ORIG-GUID: 9Cng5nJIjiN7fQb5cZRryXEERICUFeD8
X-Authority-Analysis: v=2.4 cv=bKwm5v+Z c=1 sm=1 tr=0 ts=6a6c48a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0OCBTYWx0ZWRfX06pKTgCO0DjJ
 sWn+Zj4hEE2ZDdLgMd2p09zEXnh6gMs4Iq+2DGD6o6SxogYsKP51dEfTgGid5UKOY2UzoW5nOVP
 f9YPO/Ai5G+54pGjXeHmg7qkJqSa4yiCiffn5CnaWtcyQ60QV1zavEw/vkgQ/mN7BXay7mVxw8f
 l8pQIVutnaI0yUMdbrZjEL5VD3l0rlQ2smWj5W0suW2GCy8K5nqK9fVz7mpBTnbwoI7M/xWicqV
 iXliLjjQqCma7fEZK8FzRjlU9V+UX2MyjeQ/a2mQNB9PxhNVDJspRhU40HGLqS79s6R5omLFm/p
 o5lYrXrGGTOAlZGRIAmO5lHYr1GMafoF3qCVr51J8p7A4+gb+0g1OyDu1EGfadXxMh4uHLdfM+U
 IEcKzaAubLszgw9V1DjiVuhMvZWPbCWGCQu97iDW4s2mxbqOevSSAYQ41VHg7IkDNxHc3Ndo9fe
 z3Gd1WZGFh/q2fYr1Sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0OCBTYWx0ZWRfX52lLfLjKbuPm
 EmnDEwG3YWQOCWWGmw1/NiUhzF6x1zsJisWRjUhKaDNgKd081ki36hXnOLf2flIbkPUtgjzRjbl
 8X6HDjSUw3Pfuj+muqaZ9zgp+2UTeWc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310048
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

On 31/7/26 02:04, Richard Henderson wrote:
> Add the plumbing, but not yet implemented for any host.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-opc.h            |  2 ++
>   tcg/tcg-op.c                     | 43 +++++++++++++++++++++++---------
>   tcg/tcg.c                        |  6 +++++
>   docs/devel/tcg-ops.rst           | 11 ++++++++
>   tcg/aarch64/tcg-target.c.inc     |  8 ++++++
>   tcg/loongarch64/tcg-target.c.inc |  8 ++++++
>   tcg/ppc64/tcg-target.c.inc       |  8 ++++++
>   tcg/riscv64/tcg-target.c.inc     |  8 ++++++
>   tcg/s390x/tcg-target.c.inc       |  8 ++++++
>   tcg/sparc64/tcg-target.c.inc     |  8 ++++++
>   tcg/tci/tcg-target.c.inc         |  8 ++++++
>   tcg/x86_64/tcg-target.c.inc      |  8 ++++++
>   12 files changed, 114 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

