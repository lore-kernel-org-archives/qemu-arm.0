Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CCEC56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:54:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws2I1-0003qM-UB; Thu, 06 Aug 2026 13:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2Hz-0003pK-Pr
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:53:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2Hy-0004fT-Cr
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:53:55 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 676HH9TN2307016
 for <qemu-arm@nongnu.org>; Thu, 6 Aug 2026 17:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yGHvoqTOhRDcnwOU8vntyewl53aBxmex3N/gGFjzrUk=; b=Wh6UqUp49fjF0QWA
 3XNj3X84OYn0pC+ApsMFTs2+7Hk7gc6/IOfVgrFvOl1ZfTCm0U2+F6XHb+ieBeFx
 D4DpCRmgSbyhv0P18EP2LFlKNISEX5Oru4sxwHVEHZ5hUDt6P/wKXvIs4Gxv+sbl
 Bej3ErtMkLg4lcLsWWSKXQkAJ4YjMN9wkrlexO3E6FoRp9witJxEDmz5qj/OtlLR
 aFfsBGWGqtl8ftxFD246F/65g5loEqiVzlCoGEuRPNQOy/Nl+Od7wuEkP75eSznU
 wfIb6bvTnpJfesyRlCST+r76iAWl9zX6a4PTcBYMccBdxe8QrcTGrJ8yWm8INBw+
 LiosEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvwg98kmx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 17:53:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c0e702df8so28133711cf.2
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786038831; x=1786643631; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yGHvoqTOhRDcnwOU8vntyewl53aBxmex3N/gGFjzrUk=;
 b=g9OVbXKPJ/7ClySrdTcoDL0TiWFkJvuUNMsNnH+ev3YGhklr1SpxZJT3MmI3Gmu5lW
 kwxMDlZqE2E+LQhdy4CJr1ATR31Dyr9wXPAyFJpkoYzCycdMeWFBuPDXb3UCc4eXlzOy
 W3aX1c73/EUfVZ11VxHaixOf1QrPNK7BxfbB5g69NnuB/aJ5kmqUG4LMznHn2iNIQGV7
 RU0wZWW/6SYMZe2IIVA7gZeYdil79sZGWZr526E7jmYJpE5ZZJK+YONYjXDSxt9raIii
 R7EV40VyvCPE7VS4V6aJjkMOFUv3BPOdJTsSaPxhk3lBbwuC7C2aHm/w4jHR0DiH1CzD
 8BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786038831; x=1786643631;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yGHvoqTOhRDcnwOU8vntyewl53aBxmex3N/gGFjzrUk=;
 b=h2ZCzhVJ/x9saY8oYX+8AddgSXBNgmu4/CIUfRVUykTpCzbDHgeEvXVcHshbqYCFL/
 EpraZjI62GE81SHeF0/2t6/ztEPvjXEwdnTdebu65JbMreg5y9NkzTZx3YmAFCXFmm6X
 ArzGAVCKzdVqQHao3Elea7GSgcqdMF/npyclWuA4SkFMGm7swMC6dJ1gDibsJyDIB8Xh
 casRHaAVFRVDkjF1O9ixLUi859qj6qbqHly8Te72B/mZ2AdgdBLL2HwpcEbxmwHAIH8U
 JaTL1aRs4guBnu4Fsd4T9fs1xVsznberFZF1IUxw5trN9PHY0dzthvwXCkDNtXfE9z4k
 /BVw==
X-Gm-Message-State: AOJu0YyYi8hRLdfuuqSPeP3TknrEWsCKKx6QAu5tcDzVGrNPCYf8dAj2
 F83F1FkowY3IT8n7fX37AO+tCi9ek+Y2WJYXnbz6sjwZqb/ottZdVKwzizamKCzsY3RyiHUl3zd
 9vstPS7n6ZcgRm1JjbgZmC/KhcBB7KcwZiQ5rvSv0R36UYMOY2vUGVcIh21d4NNY=
X-Gm-Gg: AR+sD12kZ/9P4pYkVuD+Dk1PB2r+QzEv5PViJvceWpAefwfvFS62P1IOpdg6CPUZGdm
 IZyK8tuG6VWcXd2O1rd51n9U0olIFWQ7/7ZCChQrsJrk2SSXZIdnItMQ1lwheQOSCiZ8pGdl2F4
 fSaxNL4CGRHGKOY4eEw4h0O7ulovSvnQ26NGxiNG/Zwy2uZgq4pUVh2PRlyFsta/LeErYOG75C7
 mV3RgQhPMrsKxp54EljvRJGmz1cz0ygcl1Qa2ABc6wDebVF3Bv3lE54oJ50ee3eMbcdPDTIaCth
 lC2aZeN4hugO+QNBoKKMJyYPK8KJGiuUVj7sFmd46aZotgDYK9Lba3bq1+TDMHYBZzo9Iu8/bkf
 we9MFcRotM+x5DVzBUv3D8oXa0+zCCpPlC+4=
X-Received: by 2002:a05:622a:2612:b0:529:e058:d185 with SMTP id
 d75a77b69052e-52ce6108b6fmr198501461cf.24.1786038831579; 
 Thu, 06 Aug 2026 10:53:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:529:e058:d185 with SMTP id
 d75a77b69052e-52ce6108b6fmr198501071cf.24.1786038831217; 
 Thu, 06 Aug 2026 10:53:51 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff7b18386sm8495449f8f.19.2026.08.06.10.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 10:53:50 -0700 (PDT)
Message-ID: <59969858-461b-48ab-ba80-c09a99cdace9@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 19:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] target/arm: Pass ARMCPU to aarch64_aa32_a57_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260806163939.328201-1-richard.henderson@linaro.org>
 <20260806163939.328201-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260806163939.328201-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfXwKvG8cXkDFSU
 oZsveDUoF7chRvmC5/fDosyGhEsobG2gZP4hJZxlcSm0xIa5aZC+uFyJ8T59J3nx1m0C4f7+gsf
 4s4AGI3CTzHLN7V4M3BnwntPDOUCiPQ=
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a74ca30 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FSdeHzSlGe8kX5qDZHcIC5c9FS63jHTz
X-Proofpoint-GUID: FSdeHzSlGe8kX5qDZHcIC5c9FS63jHTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX5WuIFSx/1OHm
 CV0gJCl+K9hOzxwWFXQeKiY7SITaoeAqJTOr2tK1JuO1Y73r1Ynao2Ic0LMx3RVX3Oo21QjUr6u
 +GYqs/WpuxWyMPwJE7XzjkRi80wYqKFcWJNTTxrILPzVTatnqulUFhey63EPiFDNsTEcJwITk5Y
 cvhNOqC9bLYgN2SMK+pPqgyioGMuDS+y62DQaB8FNiPS77nxkPPPHm5coZGTSVQJM5upOSEixDj
 3GMhxN5W0L8E17V2VL38N2XJJmuulJ5f9vN+XGKWyZR4gxiv35Majcs5do7FnoPefQc9lzWMDis
 OO9TiC+wuZX2gdb+9ER5DuKJzrksfQXUBXMsrO/nycYvZNd732UVYK04T3+acVLMMw/sHHm+lXs
 v5OTZyJG0UWH6O+Vul41//h/o3iKOzxZXVArT+wJ5IoyTCmK/Q2HhyTI3eYZfgetUhy4zjSAX6k
 umR3tSBs1mcgHdbQODw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060140
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

On 6/8/26 18:39, Richard Henderson wrote:
> There's no reason to pass Object when ARMCPU is more appropriate.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   target/arm/cpu-max.c   | 5 ++---
>   target/arm/cpu64.c     | 2 +-
>   3 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

