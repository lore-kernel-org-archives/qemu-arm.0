Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09EAC61DC2
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 21:40:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyysD-0007wU-GT; Tue, 25 Aug 2026 17:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyysB-0007po-Oy
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:39:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyysA-0005HG-CM
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:39:59 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PLAKiL2899443
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 21:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sE6GUJhkl6GxUY02yU0z0SlZ8W1ZyKCg2wbCHeQI7z8=; b=Ks4qrzxZdtoNpeMC
 wLDzxYWAkanLR39Ou1lb17PJbK81FAMYrp2kpwhBMUL+PqT4gkoKxPRj15EKMroc
 +fi6n9GLQeIFZlqTW0uh42Zmh/fGhqAO7rgW/gDJYIG7a2mfOj86HOeAFs3W4KQr
 prkoAiWcTpGLe5qI5/nkfIa87HTd0lTTUlmVHQElgTPBzMYfnWHzIY0aDPqzcU3K
 JXPieDcisQAHezY0EtJWmNX6qnHTPAA5JV9u06cWzLPFq+6M2k1hCykKFb0ejOKE
 puaXpeoYc8NRsKW0JB3p5ZCM3P540i91zqdgSznaTmYyBdZj39xrOxa+RPmz49nm
 TiUa0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcervxa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 21:39:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5174a23afcbso4414551cf.3
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693996; x=1788298796; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sE6GUJhkl6GxUY02yU0z0SlZ8W1ZyKCg2wbCHeQI7z8=;
 b=T7r1zlhobn8YCSKmTrwx9slJLBZSkOj15dO8foP9NDBR6tv6X09fVmLD6w+Pp6Cw9H
 EjTFtjSE3tX84RU+JgAoy2w3RIrZ82uZ58OD6adxGAXl9z3T6AWhe7SFOlGxlG5X1WoI
 EIvflf/lxD6WFofF0zVuTmDo/Wxt3g9zcE8d7g/dCbXpDcng8fiwjIjMx5F61CU7/U/r
 hWi2BBI+rUWTEOT/SfMHM7sWJryzYUZzXLipIhF/nUbOwTRp9C6xZAXsw1gNUKAuzVvr
 6ik8RkJpxJTWSwcftCvqnASwunO35spTzZdb5yTIlTsuUX1F3Pxf1sUAz2gXXXveJ+eh
 jrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693996; x=1788298796;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sE6GUJhkl6GxUY02yU0z0SlZ8W1ZyKCg2wbCHeQI7z8=;
 b=SMkNHpzNHrMTjXjQse03sr7u7efKEzF0qGGX8aA7VjgosJ+s5o1HKs4eFOBBFtLUvu
 FGhCq1JfIr5ZWM39pNVPApE8EsFaIBlcpuYQqymUby0sOTwhEA1mWHhPizUYIyvGQYfi
 Dfb6HNl5/amAj5NAT6tt4V8xRMv3ueY3GOmXGWeDhAvXqvwrGxXpEPmEz5Ww+YE3jfYC
 7xhSRd1gg5VkDjIMEJ819DVjMiMFmkGMwCx2FPYEdGyKYE2J5LETQY39Ut6G3mjHQkOv
 M2hRxviYKv9MmPc4/IXGOoeYRqjwq+Fz/KS94pJpjrRk32pAux0soMbAsl/070amOrCE
 2rPQ==
X-Gm-Message-State: AFuF++m0sZjD0f0GUf5YzPI2/+CGlRreFjPF8ajtP3UXvKU+KKRHHyoU
 /gdZFyW/Bir7wAUgggNhOxhO6dDej29T1PUwTYNtyjQk8ccyhW8LEDMpSic6gefDSJWCv4Yox69
 PYSEY+QbprBH+tOgsNutYKMWiVkhZjtmzivg9VfQXvv1+aZUL0zyuHFc2IVcbD+s=
X-Gm-Gg: AR+sD13mi+iW99WvV/ZZh/dKS+GgXJxTtn0xjn90S9jgfRnnOfZmXDsWZjbOaOYHoBH
 d77890LtGJTS0vvwtT7ESA0O3FAKrKY7WDxATTeXldJXVTrMxL5Kr6dh33qq8OH5wwDO/aJCF/R
 h1NSu/iqR7MHHuy1fSl+Jrl2HIAYejhYVxSs8qn8NaYLIAOISKHovk7QNjowEsIto3V52m0Y7yU
 g503cPJWtqFtNkmMNh8vebzXxZZfkhLeuHRpjlfXXUdKpJzTWuR7J9SbaFOS+Q8sF0Wk+6K9i+u
 NwDtYuD35f8U9drgv2bggM9qANsLihJDqEgpuxe7brkYa2hWVPEmoTaWKWaW+Z/C2zY9QT7j5jS
 svWzrQWNia2gJBRQ/n9hBRAmfac3ecCeQN2lTx9N95Fu1LTHv5fo=
X-Received: by 2002:a05:622a:110f:b0:519:8998:661b with SMTP id
 d75a77b69052e-52e423226edmr21722591cf.20.1787693996084; 
 Tue, 25 Aug 2026 14:39:56 -0700 (PDT)
X-Received: by 2002:a05:622a:110f:b0:519:8998:661b with SMTP id
 d75a77b69052e-52e423226edmr21722141cf.20.1787693995624; 
 Tue, 25 Aug 2026 14:39:55 -0700 (PDT)
Received: from [192.168.20.232] (82-66-243-121.subs.proxad.net.
 [82.66.243.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dca8c75csm5661745e9.2.2026.08.25.14.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 14:39:54 -0700 (PDT)
Message-ID: <e3243ebb-9089-43a3-aadc-29cde5e658de@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 23:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] target/arm: Introduce cpu types max-v8 and max-v9
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260825213000.221822-1-richard.henderson@linaro.org>
 <20260825213000.221822-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260825213000.221822-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8e0bac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=lbskcjEx90pOFJH4cTSgiA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4NCBTYWx0ZWRfX1+zTcTog7ggb
 6dx2F+ka46UIBaU8U8g/msQKSKo76Wso59F6EhtnGy3bnHXrenlVwt4yNOvgRCzC3BdQ5PuyLzE
 KqiXCNKxzJMPSEVAoEjmLHNucKfrHEA=
X-Proofpoint-ORIG-GUID: DvGQtBZZ2xelNRCR7G2lTxlGJfSI2981
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4NCBTYWx0ZWRfXyuqBf7par1iO
 T3ZqX/GSDNBz3/ZfDMHQrCqLfv+v4t68EgktAL/im/Mj6RGSut3Z1EIlBoD9VuaddbtlKdMuCKQ
 So8WjRBlPyTFYpDCF3lYFn7L3+5lH1LFJdjfSZ3xTouK0vgQM7e59VTUxS+4Mr81P3fOOPT7CnO
 n3fg2ZAMAdAqfqK35K+Ea7yOvgZPZv9p0gdA5xobuQeabLsMJwp94bBVtDBFwtRuR/2wgZtG3Cs
 SfhZK/BTHWxSsmBvSgxFvJH6py/+kZvxlqLZas5yQ88ldu8BnyejE21Ah1cZFRUYYbZ5t+keDrp
 yVHceZgPIJR8q5OlG4ANSM/4mbxo3OGEr8jOi9dgEkc+Th3uOfChqXCN/shCftfy8V7KoJq9RcM
 8Dq7vopupy0pxOmJh6Q2TKw4m9SW3M/65teaMzonB7E10FnjcfFNzkaZcFrDx8HOd5rC+PJMYiI
 4XQ3yErImCpl3hAU1Ow==
X-Proofpoint-GUID: DvGQtBZZ2xelNRCR7G2lTxlGJfSI2981
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250184
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

On 25/8/26 23:29, Richard Henderson wrote:
> Introduce the names and allow them with the virt and sbsa-ref
> machine types.  So far, the cpu types both exactly match "max".
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/sbsa-ref.c      | 2 ++
>   hw/arm/virt.c          | 2 ++
>   target/arm/tcg/cpu32.c | 4 ++++
>   target/arm/tcg/cpu64.c | 2 ++
>   4 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

