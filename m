Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BF0C44520
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 11:20:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlm2k-0004Hd-Lt; Mon, 20 Jul 2026 07:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlm2j-0004Fs-Mn
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 07:20:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlm2h-0006BQ-Vu
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 07:20:17 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAvTAx2542033
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 11:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O9OhPEnLKTGqWvWkUTBP98bVB6cW26RkxD6Wsctd9PA=; b=CRe0i4KLes8zKpcW
 hbLK/+PQ/xcjZbcrVuD1lo6BWo7EHlGS85S4gYH1JpPkOKKRJsFxFdESDrzD8HOU
 XN4wp9vv6MXf9MXb+qxYphHLYFEu7CBxlbNqQC2qVzxuq23+7ZXXkdsvK8wvMHE4
 iPfqDUqP1C+mLRceR7y2cge5kfOmLG4PpHAIJaavg2ymrAWerLWvTPFQWatShk5A
 M1+0ZmmNLXKLUvHKcdlMtluM/hEL6cCnnr/aeiaA7o1ZvwTzxy2EZgdHKiFZI/xT
 xgGHGOD5iRle38gnnLmNSVRg4tfni9LKFA7onvIADL9DTSHoaGbsPNhrWLKsrWXs
 /cqHdw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdch1dm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 11:20:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so146449901cf.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784546413; x=1785151213; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=O9OhPEnLKTGqWvWkUTBP98bVB6cW26RkxD6Wsctd9PA=;
 b=DGU2NvsN7TI6VwFuhCI3wFE21Z3i8u0ESnFsV3zUge3+0UzLOWuhw5z44kO13kPtKb
 uitWVCQaFmQ/f2YxrPXrKFbiH2CHDhidtJV2RuD4RKfwELvDKJQ1K4s1gvVaTSHUo9Uy
 GFv7EzCiR2q69VDYiDoGwHcuG6h1txG7hS/PyusvOUcVcTJ/bGmb3gBG6TY19CJwfuj1
 pjLOM+E3nBzOJ/CjHBVfSMBP+iopZ78eYbjvQ6icnXQfxyenwnhOjEPkErOfle4MMTVB
 zOmo4SBm8r070Q3c+Dt8fXvnDrV10pda9uRWZ+3qR7aKQrLGXBufikRJyqIqGcwukYF6
 S6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784546413; x=1785151213;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O9OhPEnLKTGqWvWkUTBP98bVB6cW26RkxD6Wsctd9PA=;
 b=X8t3T8ZuVAneSmOuo5ymd0pDx/7mM1Aaw39GwlgIWVIHpScKj9lR2RryZb2m1/ow8v
 AYuEvd7oQR0F2Edn5AQMaxSMM/PUXTuoXqQaDiTqNJOl6IPg1j81QFkS6DO9IJzZ/V8x
 +ZHbEjGXnrW/YfJSnaf9sP2SSVPHueNX7OFcIfZIZo4E5gQ2DKvmTAE1Tee4mxXD/68U
 Api2muaC54xDohFQYCy2YMe5pcsoiqLqhVMq01qOizfBfRMICHAAz/JfMSnpG19h+FEL
 qn25C+YFy6luOkPJD3Ecsvg2cRkKjooGtpj865FKpBDqKW+UW7WQQh4i6FkqpLVe/R89
 X5kg==
X-Forwarded-Encrypted: i=1;
 AHgh+RonUYzhqfe+poxkcOxJ663F/v7fxLM/E5KjOGIBTnaE6hY8onAi/H5OpXyCREI/ifSNurU9cu86UQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw6VtP+h2G68wKkfks3PgKjV/M8USyKyQG3Xk6BUeWqgKj/Rjnt
 3U2Z9mweqHhRMi/4oawpHXdR8oEOLYalKqZC2oCskvWDc3wMKDpnsUHOsdtkxxW5VLMTP1vtK+P
 VE7JPEi7J2oBJYx3rgHgKRqCDvxNgFPgm8i92Xh3DDZ6oR+VilC5d+q0=
X-Gm-Gg: AfdE7cl3fVSjPwlZbi4h6rZeHYbGf1kS/DkKSeuDGWOkrk6Y8c6SW6PvoG0zTrThIV/
 /sMm9gUG1v3C8yGklBQ/M6ST5GPdJTfTo+hzTQaEZhroSSOCOsb9cPgXiH/GGUbGJirDxKTuXrL
 wnMCntx+9RTQHcCtmqXf5Jb/wq8CLV8gWWOZf32iYGyWfyLBxScmbZp/7leI09InWD1YmiGSCf5
 z83WgvbstcNAiByC4UukZJFoF6Se0N9rr/xg4URATgZKiaJ8g9NKBZmvvYgdJsIaXxpKY7+R5ZV
 E83giQN3ITTn77Y+4NHl1jK9mDh0t5u88flvar7q/dceZbA+pVPRN4kI6XRJ+esrWnEzT/PmVVJ
 nYxqh9usae9yYDCEs0nLF79CYDnPlaibOOsR3AJ4ezpj5USPS4qk=
X-Received: by 2002:a05:622a:351:b0:517:6b31:8058 with SMTP id
 d75a77b69052e-5213e0821f6mr117116021cf.40.1784546412872; 
 Mon, 20 Jul 2026 04:20:12 -0700 (PDT)
X-Received: by 2002:a05:622a:351:b0:517:6b31:8058 with SMTP id
 d75a77b69052e-5213e0821f6mr117115811cf.40.1784546412333; 
 Mon, 20 Jul 2026 04:20:12 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563e60fd9sm7244245e9.0.2026.07.20.04.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 04:20:10 -0700 (PDT)
Message-ID: <9eb83658-c811-4e5c-b382-7423e511710b@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 13:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "target/arm: Build cpu32-system.o as common object"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260720100312.119894-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720100312.119894-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mTvEi8BMJOx1BOCDZAnwRI4mrooAxz3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyNiBTYWx0ZWRfX0EpC7zasRIOM
 RrPFEoV/Fq8uBIs2+AvkjFhHgcUm25XHbKSOsCI4eTBgkK0EhRi36C93HYNwRZVqaDWVCFkNs8k
 hU35cbqDT5MFwyGQwN/dyi8il0JM5K3TZkZoA9CypJ5rI2nMwyFLrwmrM88M5xV2jG9rnM+qipp
 oZudbuB+vtctcSvtBeC3DU4nnFP5BCYYvdznt2IR2RnwhuYdAoX9ZCZtx0vRjNEH0VOIv6of1cT
 DQcZhMJoHmEQHX/QG38V9VRxXKLUUettNIRQLagArTrLR76BEyK+hczb9t53Q9lD1FCs1GV+zdr
 Sm2ZzQwUcbyuyRnBB88ncjEm8Yjr7LiWoWT9felvrgR278xeL4wQ73TagEl/ZnoQHbyot9r0rln
 ncQqklC2aKoiLZ7XPIwQncwI9Q0T4OZD4bPCcU25jkrRSLYR97aqEl7D1XK8troskbqvMNQ9IAr
 zRygYX0rgngewWPP+LA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyNiBTYWx0ZWRfX5szzkrgYj0Wg
 ypd1zOTmDoqHgzrJlAkyDcTzLWGnHBo7fRUjBArSIYvof4Q8j1zXb5UWuNYonlm0jSI8oxGLgDB
 sNcLEEE44DSUwiaifuNlFje5FBGaVeM=
X-Proofpoint-GUID: mTvEi8BMJOx1BOCDZAnwRI4mrooAxz3D
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5e046d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p0WdMEafAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5ksWg3-Fzs99CpwBcB0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200126
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

On 20/7/26 12:03, Peter Maydell wrote:
> In c8bea1276c we moved cpu32.c and built it as a common object.  The
> commit message says "cpu32.c only contains CPU types used in 32-bit
> system emulation".  However, this is incorrect -- it contains 32-bit
> CPU types used in both system and usermode emulation.  (The case
> where we don't need these CPUs and which we were using ifdefs to
> avoid is specifically the AArch64 usermode qemu-aarch64 binary.)
> 
> The effect is that qemu-arm lost all the named CPU types except
> the M-profile ones (which are in cpu-v7m.c).
> 
> This reverts commit c8bea1276c85855b2e088b740737d043c8556d58.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3962
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The commit reverts cleanly, and looking at the git history
> I don't think we have anything that depends on it, so a simple
> revert seems best to me, especially given that cpu32-system.c
> doesn't reflect the fact that we do need these CPUs in
> usermode too.
> ---
>   target/arm/tcg/{cpu32-system.c => cpu32.c} | 10 +++++++++-
>   target/arm/tcg/meson.build                 |  5 ++++-
>   2 files changed, 13 insertions(+), 2 deletions(-)
>   rename target/arm/tcg/{cpu32-system.c => cpu32.c} (99%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Thanks.

