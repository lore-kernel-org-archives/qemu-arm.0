Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B388C56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:53:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws2HK-0003gr-97; Thu, 06 Aug 2026 13:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2HI-0003gK-U1
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:53:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2HG-0004dW-2T
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:53:12 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 676HHV8T3152416
 for <qemu-arm@nongnu.org>; Thu, 6 Aug 2026 17:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AJ4nsKvGMdQgfz3R0offYCfnKoPNRYgF0uSUC93BE5k=; b=HJZ9iCDva55uhWbc
 YwiawpqQAKxfxhY2tdJIBWcBx2iFxlqgrLRl2unuRACAMaAvCUCs4kUJVOtjAJF8
 GauN4p8Sx7rgnuIMUNCNZV76ifxeae3H5K8sAyulvoVmQx66ZtzFd2hJHIkKJjp/
 xm2ZRZ+PpEfnX/jWoTeiNS1xMOv6qweOjDKurY3iuJYlXLwYoYBQNmPJr3sitcSf
 7wZURGjM1ncEVsErqAlip74vorc8Us1Rfj2iGcwqpiJAl/0KatNA2v7dKFUEboc1
 K+SkxlpXsZw60IJSKfcVOcOKldCNsDagUVkqUMTjt2RKkdCcC18/W8OZ/KGTwm0G
 /4QYtQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq732qs3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 17:52:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c26012cd0so24293361cf.0
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786038760; x=1786643560; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AJ4nsKvGMdQgfz3R0offYCfnKoPNRYgF0uSUC93BE5k=;
 b=bBXMD/qV/qu0srPrNaPLvMvMXX8Jv9dY6CYM0IPefhrBVjfq6S7DTb1ciJVl+qhGi6
 LRmTatD+XXdgHoNvMZSy/rN972I1oUwvTSX+xB+Z10k7sY7pxylXkwHuutaFGmuya2ax
 t3ayOqNRgtffYY94JJQH+4frOZMu4mKlRa62nxuMS7gDrEk2U6V5awGsPbK0MM7tuIbl
 48E2HLDRuFCeCc5XRuWOMWrf7I/j/Qku2lUPZkwlpSD73AupvQ61C15bW96zI3ZdfTAn
 u07sjP2q3kzLPbWs1st9awjNr5VBpdl70O/e7acuTh0H+CkZ/5e9EiW7FdqZ9xjy3vjT
 77mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786038760; x=1786643560;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AJ4nsKvGMdQgfz3R0offYCfnKoPNRYgF0uSUC93BE5k=;
 b=Q2Fqdcv11BtnB9oFCCimFcY9CXvvu70MT5nGoI++5kZe6daTlUK6a6GlYuPx1KRD/W
 vLFYirv+0G5IPKwkUnTF9O/uqqm4iQNgGn+r6u+DUGhkzmoQfbnn1VhH8F0eaSPTqhgB
 Oyn+oizktI++CzkXAMoau6A822JvDz7ug2FIAX1luFFY+cZ4hnA7XT7kgNQkStAVNsPR
 4Nt6GPNdZGShQXNvuIFXBUuy/un7zbPWGDo7poKz794HCEfsaw0Rn/kvKOcejIXj8zup
 jea0c5SvI6oXY5CBu4bNaJarB9uIQv0p/MtXknZyyLz362yh15hi+zundyAH4zuxUaBe
 RYcg==
X-Gm-Message-State: AOJu0YynkexCEWRu6LCvgAu5R5OvYMEfZQHRw39OGetxhCSWPc23L3my
 QVLB6CLB/nF7GTKaoS7XIVVnrbbl9WlC1qqvU8/XnfXaDizojUg6saEEISn27Ax0VJU7Msk6Mo6
 Vm/BL9vT9sQWp9JJr4NI9JQ+6MUjSYOOoe28fueldR/h/wzylp4Cx1abWkqHOnQo=
X-Gm-Gg: AR+sD10XE6OBJBUlS/4C5SsBgbRgvfi6u/s7ae9Yg26+jxjtCmxreN42xyu6mezzsk3
 9uVljZsf6aZALsr9him6XytPiqxmNlzPPp9Uk2DFIMyStqyDMXXDwdO8buLFPENd8rsWMRQQThB
 +iMTEUQy8g7b9PgliZwDIq1PAp82af6fCmGnwjDd8/ADj7jc2gcubQq2GySXNpUP2zG6ajsvuOT
 7tuBy4eTUC8NpML/kGlIdY7ZpMJEEK/D2JWFndbRsPd2QuMytpOgkeCnOyc2fQemDHcP/Dq5ah0
 sfv0aaTxdKZjPuw9TNLqx8eDM4kI0FAR3RpYSXDRmD9etPPqEEQEB5mCM8HMxgbOQ/F44GP1fvq
 31TUUdYKEM3oa6UXVidzEmDxMEWctDpnJ/So=
X-Received: by 2002:a05:622a:2605:b0:50d:900e:c1c1 with SMTP id
 d75a77b69052e-52ce5f82386mr196484061cf.7.1786038760305; 
 Thu, 06 Aug 2026 10:52:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2605:b0:50d:900e:c1c1 with SMTP id
 d75a77b69052e-52ce5f82386mr196483491cf.7.1786038759863; 
 Thu, 06 Aug 2026 10:52:39 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499542241c4sm72997595e9.11.2026.08.06.10.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 10:52:39 -0700 (PDT)
Message-ID: <1c9ac096-d3f8-4bc9-a32b-ce1d11ea9399@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 19:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] target/arm: Use -cpu max-v8 with aarch64=off
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260806163939.328201-1-richard.henderson@linaro.org>
 <20260806163939.328201-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260806163939.328201-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX/o5AcLz+CKNG
 uPvjVhqqchYDcLFTbyAkufjH/ofDU4i+vLlN66+mat8mFl8yVxQ+NzhghzauEfD+FsqkcAz/cpm
 bZxmTzobaiCCwOS4ivp9FSvVgun87KrCrTT88LNbTdNy97c5MPnkn8l8OgsEaUZUc/mcuHuSXoQ
 vaoeo0ND7uAf1E3DHTwQtqv88vfq5FAoUMyt8nw9INJXyGPEmm0uEGKrT2PHKKG/t3pQZG6t6vH
 v65zJx06b+deg8QGvPEzMn0fWRQc+/x6/4hi3qTdjwdZI6MGuaa9vwxsFTAjJ/8ydAqA139dOml
 LfdoxhvyeseXb6xUvUz/EEGbN6euLVJPrEqpdfvRaTqogm6XAsTRDd6yUeHFYt4SWXhXsP1hQiG
 LOQKaPHOSznuK9KSoIjgZkW9CmHYft/puaB6qthOlBsJsIi8jBd05vdtZq+PdODMCYVCCQ004CM
 j158J/chrar8FOCfeCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX0SPkk76F15uE
 m7FrVzJdaTKx+Z9ngRH5o4nTZ+1ubNd5a5rbiwAMZy9NSrB67L0VEWVJxeT3zm7uJnqFxGIfPvH
 rXiTJJV8BbntjKJ8h1SLNgO0GYjae3M=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a74ca04 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xtZVeG4xN7TPixWSdIbDsZZ5NIvQT6Wv
X-Proofpoint-GUID: xtZVeG4xN7TPixWSdIbDsZZ5NIvQT6Wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
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

On 6/8/26 18:39, Richard Henderson wrote:
> Armv9 does not support privileged aarch32 execution, so
> aarch64 cannot be disabled.  These tests must use Armv8.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/qtest/arm-cpu-features.c                    | 4 ++--
>   tests/functional/aarch64/test_virt_aarch64_off.py | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

