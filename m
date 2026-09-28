Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62166C9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:36:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7mD-0008QF-PX; Mon, 28 Sep 2026 05:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7m7-0008PR-8s
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:35:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7m5-0006fX-LB
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:35:54 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9MDnQ322684
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q9mTr8BLc2fogx+WMrCHjS4cxhNXtGHzdEwK/fOBuz8=; b=VBFNRQOdzZUYgIlt
 gi0367RbOcn3S8RAdQYGFaXoTuFV31hY3lNBGAjSZjBXTOuncCsVaHUV/EcF6Ewg
 QbiMdaLZN1RoV3zgT0Bxf6u3JKW6nsYfbPUBinU2Nqpnn+uWP3WXJuorl4ZXk+Md
 ORbRDznOHh8gOExh9pONtWFdh2nbJqJV/UpbtVqx8bCpGe/qVsiyCCCqP1e0t6n2
 VrA960cL4lPHRwzoB2HBwYQuiI0Xh4JiUVYkrbCyzpIcbERC/g3tiLkiNcrDS4mL
 XhOFiy5UteoNgv7uDNP7xI9bOnsmrTxmErVugxocDbRCaGECZBaxaCflIG/1bTYI
 LLoWRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1gkb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:35:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93be1861d2dso485840785a.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790588151; x=1791192951; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q9mTr8BLc2fogx+WMrCHjS4cxhNXtGHzdEwK/fOBuz8=;
 b=KkAN3VbmJecwMeoscd29Kpcr4ABBY5ITdigcgwTiMPhjsI8SUv3kbYDKjGCi5VChJA
 ZRydFgneObRjDCP6JWg8mB0g/l1Vk3Byjl2kSm6jT7WFhqqr0TwQUVOqH4IvwjXE3c4z
 a5sJTd691wXQXW7CcdhwYVTFF3kjvzBDbq7v555q9GYUEcn7UmCWNjWlZ4oOzsSOFc4W
 VozNtNIOLtxqmp5EYKo3eELqvtQWRPNN94q4ypE2QTgdbXPTyP4wqqJjYeelgf7qANzd
 EupUsJm6GlZ+UKKbeHoYa96hPqAEBEPz8e9kyWoyn6yfGK6FH27rddec6UK0Nze3GxzD
 G4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790588151; x=1791192951;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q9mTr8BLc2fogx+WMrCHjS4cxhNXtGHzdEwK/fOBuz8=;
 b=SWiojDP84v9toaMZkg78aXkkrpZnf5U+7fJM4iHXshm8gR7Df1VFPBfQoOVx5vxj8U
 +1HqUtcy4gnUV9mCrnorG8BeKGrejoui+PBlKZx8E6nKcFs2PdCP14kuyQVzu0g7KaXI
 wqsrxAG2i1GuVERN7f/9adaJji0lxRmA9CbZY9CqQ6+5poquoLsccfzWipqBy3FRPV4q
 mXaL7SZSRvkWCAwxFMhwmI0btQVOZ2oAZnkrqoUjfPaWyc3HocPC5+idAM3F+7/2tUfq
 Zzrb9fv/T4kXpfLYakH7xvwN0JVWIQ/8iczE51UPcBhOOvuV6zG8AMEWFiCaRNoHuVo7
 pG+g==
X-Gm-Message-State: AFuF++kMu6usKHONrR6Vdd2M8PXoQaRnynR2fd721HwDZSSxGiSnszXP
 qL+/FlMYgLcVgsg5B7Q1nMSDSQVSjE+EZBmcG3QA+Kmfmk0mDZgyS8l38gswA39s3UjHb6PkpS/
 o2ZjLK9arvAZwAoA12+koT0d3oZ2DGFoOah5PH4Kl/rpEtiZ8oxoFxdpcIS08YpU=
X-Gm-Gg: AYBFou14xazOJSNcvPP86Jio1s0KWm92Z6mmipKrmppmyjNVNII/tdSz2tWTjwpWG70
 GQFrPAF8Kr0Q5I/2TJKjyaz7nmW02POdtBLd+lF9UFQSWUCeIw+PaA3NHkgQdYcWo40BPF9E2q0
 4dmnsxLYhBFfq44p1fG2UdX7f2Pn3zmIi14d/qprabMUCaRV1KD02lt4rLe0cjEUSqtOoSBjTID
 j5mdRF1/8vVKQicihDNFHK20hFeITOl0Vh6CBCm9gVgONAVo9x9ZOcFHLTNy2xC3B6SJuvCPtRI
 ZXHGg5AjARMZhwRCcUQqsEzXE8SuCjxSg6BzOajhVTsc0okvE8B2Ornn2DHChQl5h0EzIqeCtqX
 JHSPiGmzIzg2jbhiKpwipxTt34REK9H2CiQ==
X-Received: by 2002:a05:620a:6e46:10b0:93c:82bc:146c with SMTP id
 af79cd13be357-93c82bc186fmr108309185a.37.1790588150751; 
 Mon, 28 Sep 2026 02:35:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6e46:10b0:93c:82bc:146c with SMTP id
 af79cd13be357-93c82bc186fmr108306985a.37.1790588150317; 
 Mon, 28 Sep 2026 02:35:50 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0017656cesm121285875e9.3.2026.09.28.02.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:35:49 -0700 (PDT)
Message-ID: <5582a997-b180-4659-8130-d172598666eb@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] target/arm: Honor PSTATE.UINJ during translation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925215004.456336-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yxYapyNavtvJPGENyVY6NOmnll6Q7L0k
X-Proofpoint-GUID: yxYapyNavtvJPGENyVY6NOmnll6Q7L0k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX8pXHXwf2TYnt
 Xpit27OyBeZlM6AtmtXsHO1KHY41VYy1AfMFe9aIQxCnzTs4NeZG7SA2VuOJMco4/slrgzYQRmn
 EucLcrwR6oaNBswa97fq5f9NGjwNIP8=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba34f7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX4ZOT2ASM+Hhk
 qVJA/JISVzoFEcwV6/K0QjQC47UQyPp5UXqvc+HyGTbowNlwTvXanokXhqX0XggxnUZZHAGSGwG
 SfhuXmiIasmxzCqbsVqrrA0bG9Z5YbMXr6C3jcGrz1FEfHcMMhOklypCQncJwfIIhao45evkeeZ
 0RW/O016WrIM0x6sDQ0c0j1T2uzXjdWFOEfAz5ckqpgyTJWbNNmDKrs4MsawVxNJIq60hsXoRGH
 Ev8J0RgQUBKAJxS+Qvk2NzS6KlnlpHoERfXs8ZUCmIGCNAbiymVYL6loeqjx0+H0lEiY/+RHP1o
 5pOO/a34ulcxFSeb3Zpl1brAE8XtxKma/7lRTaH+aBI45yrD6D7WY04aSq34gMMM3NbACKLkp/P
 LLLLISM+9qEHrnfLTpYjNKWY5uCWJ6VzPMFkY55Nm0LufRpjDfsnhWabIiFvXImlb0UpeTJHiTG
 d3OUUK8gNvLQYMgdqyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280038
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

On 25/9/26 23:50, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.h     |  2 +-
>   target/arm/tcg/translate-a64.c |  2 +-
>   target/arm/tcg/translate.c     | 10 +++++++---
>   3 files changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

