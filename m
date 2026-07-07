Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC3FC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:22:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh20y-000254-FK; Tue, 07 Jul 2026 05:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh20w-00024W-O5
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:22:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh20u-00054b-5h
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:22:50 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6678DZif3243036
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 09:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jof1QCQ2Fm0HCQE+swJswZVmXIvSghenR431trUEzI0=; b=hidGnpJU8u8iL/uh
 LAnD3qo1xEN0FDZujQShbIFSiuGtUMb7kFEVFIhV0PfXFDhc3CS5eshOoBorLP5n
 3pvYMhYbpbD4YofhaGIc+9ZNMmqi7JfBkCenmCB7hMYcliasr/CYH/t5i9cdLv6o
 VV3IxYt5uKc29+YoYHLTv/p38jv3m2b3AnHoYutYLAiIBPn1C67nTc58VCHoejJ7
 o5hZJSH0U2zJEUqrUmXvexCiSiWsbEQG3QaH7sPgT3Tt1/B75VdtiO5xF9MeCqAE
 AiRRdFPjCp8901dPbl8eXhaxs25rA92XAEKdvm/kAuuDK6g7nfSHqG4l0v8XJkUl
 zDccjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rf89-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 09:22:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1b4d961dso4350331cf.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783416165; x=1784020965; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jof1QCQ2Fm0HCQE+swJswZVmXIvSghenR431trUEzI0=;
 b=XCZVJS8EFdjztmjhOGNQb6SOL14DJRRl0Xu0X/L0MXFsgTppOJ1H9DoOIouIvOwhJu
 GHk4oHWftJ6KjbKgqKOoLS3ZMeg81tPKymeriBRNfzfbjc+4RUU/6jyMABZZO2ZSi3od
 mSIhdroyhy6CuJKyV8pRpCBLfU/8TuRv2XewlP/nakUr0yQL1cLHtBdBHTrUp71cu31I
 EK2KSBw8yEZUTdtYnMCMT/xI6HfqmAgoqHMZ/IXbbdCgX/I/p9o9ChHSTTWFoEPFM0Cw
 nNgS1MPsKpoqr6rz6xDiL7QuWKuIo/JCYh6cnnX1QL4cIT3GadaCUdYuIEis7UHAXSxv
 +TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783416165; x=1784020965;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jof1QCQ2Fm0HCQE+swJswZVmXIvSghenR431trUEzI0=;
 b=Bptd56ehlin7Nc27oZE8Y1WtyiR2OkoV/0VQp4rofgnLQrX30JZrQTOuS1Np4s5NRG
 Sz3gFPao98Vac9N3kTO6LHOoDy1jMuqV/MN/40U0HbVNt0gio7VsTG+0tR5wmDzOeLLG
 n7WQTn3IYfn05WuHqAReMgGHXMhw+h2HrfzL5yrImVJubEjfi653qE3BiE6S31Qnd6E6
 iSRC6aIb37hTL15Zqy6WK7MQa0iispVQ93cid32qyNXlb813BaLCdftFZTCAf4eirrq9
 B3DRgVM24hgJh6X3cxFPOiLCbVtB96BGDMKbpE6T9W/MJJGNRQknuSwN0kk/kSol+jA/
 UH6g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvWKJNNUNj4rXIeRugrJFDv9qp8TQsMdfP8Jo62mMB2vCZjb9nbs2SkIYVw4IdEuSvs9erNsBhOg==@nongnu.org
X-Gm-Message-State: AOJu0YyoyLyTmJ+PrUNgeiAxnT64wxVMKNECe3uiTmDQ10uHvYYlX5c/
 ze0qEb3wMbauIgUBGOwAAdW32NBNTJBQv5WE6k4XD+u9RzsLx4R86e9cDOu1ssnuzvx3ohqKfgo
 9XGO2gZNxmz4E2fBvm+Tkb/vY+Vb8imUEf43i8X3fSbsDQzsitnuAR2o=
X-Gm-Gg: AfdE7cmWZdL9D7ZA9Xlrgt5t/G2X2rkB+SwyiP2hEWSqfRCAJ0TlMrPNw1acHbZCPpB
 BbKXrlzr2ZPVMY8B+eqNSATpkyzLHfthYVAGAs4lJqNqWCJfZdEP6Mxg4pAHwKpChExDwn1FVya
 Yo0FVM18kOWPzs3CIujpxlfTQ6ZsSORkaxyQlBoXzbrzup9ZxfpBzzSqta4ZGLd94361o8+IVq0
 2IK1N7/hjYPI/+x6DCXywQOWVp7TFliXU3sQjziG8y3NziABN5iM40Wxa7BAM3I1v7/te/MWYIT
 ntJ4fVXpgUm8vgkld87jC34OHm7u4c/9dOxp2bMbYB3N+pF9jVETG+kluQVRuKt28f51jV7AnMm
 etRg91WMUEEpIBbJmxgQlaVdC1KCA3WuvfPvXyneaTKAHIUAdl/6tdssx4L6grw==
X-Received: by 2002:a05:622a:164f:b0:51c:f55:a1e0 with SMTP id
 d75a77b69052e-51c7a786274mr15661911cf.36.1783416165514; 
 Tue, 07 Jul 2026 02:22:45 -0700 (PDT)
X-Received: by 2002:a05:622a:164f:b0:51c:f55:a1e0 with SMTP id
 d75a77b69052e-51c7a786274mr15661731cf.36.1783416165130; 
 Tue, 07 Jul 2026 02:22:45 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ad8563desm91278266b.24.2026.07.07.02.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 02:22:44 -0700 (PDT)
Message-ID: <b87a9989-b2f0-4d05-adc6-906f2fbe9fb7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] hw/misc/aspeed_scu: Add separate reset handler for
 AST2700 SCUIO
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260707060919.350637-1-jamin_lin@aspeedtech.com>
 <20260707060919.350637-5-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707060919.350637-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cc566 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: Ba5khwvT4Qr_TBXSlnQ-tzBOz6TQghAU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX/hqwqYpLZ42v
 LedBrOFPnjDAL4i0sWXOiF92Q2aBxJCij6RPUs2usw9wkd5ColSaQ8tEOx0T3RzvRux/LueEdkZ
 ydrtMFkhC3gggDBuaxIGdhYAuPZvUbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfXw+WGqayVnbn+
 b+zMMyoLImAPdXAhsNFBoYUyUX6Lf7qon5AkRMkuqlVzDrTxNBVP5RLDovKYp9iu0mQKlnW/W8E
 nSmj+8rHJVlSFnpRICWikQU4MeCZI69eFvKTEX+F/SvmTPVoqAUES1OHpz/Wl6sdXQ+BRBIQLAb
 aCx7QsgcX518P+kCQZGAL5zKBqlcVfprC0/ZIAlFxT8Zuz9N9oUPrKh6wrC/clNdQGdQQORS8C7
 xwgIqAZ17f+OsFUwa6w5i6KfhUV/aghtmygwmL1SBsavKuF/un/GZwELBontNWQmZSaeTfkFl92
 esh9ejWiDWcTk1tmDbWvzMdW5dxDKOYwzl4GdfRJroW+3/Dtbz6jz88hEfYBBXGC74zYVYqZs6L
 bNW+EJkusTxV9V3hlUxww/ze1Twns3XNLSm9ixQqvUfFxZ8pHbv9ckRIb7gOfi4//d+wqV7hx4d
 Kt+0PRRMsPCN8Y/w5qg==
X-Proofpoint-ORIG-GUID: Ba5khwvT4Qr_TBXSlnQ-tzBOz6TQghAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
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

On 7/7/26 08:09, Jamin Lin wrote:
> Introduce a dedicated reset handler for SCUIO.
> 
> Previously, SCU and SCUIO shared the same reset handler. This no longer
> fits the AST2700 design, where SCU uses the Aspeed2700SCUState subclass
> and will handle coprocessor-related control in future changes.
> 
> Since these controls are defined in SCU (not SCUIO), SCU and SCUIO
> should not share the same reset logic.
> 
> This change gives SCUIO its own reset handler and prepares for upcoming
> SCU-specific functionality.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/misc/aspeed_scu.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

