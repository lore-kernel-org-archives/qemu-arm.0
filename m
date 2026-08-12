Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C852C5CFDB
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 21:18:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuGLM-0000XF-3K; Wed, 12 Aug 2026 17:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuGLJ-0000BQ-VQ
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 17:18:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuGLH-0007o0-WC
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 17:18:33 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67CK2QuY246263
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 21:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vvKhPPo1PodGZTWBcV3exYJ00sm/DXPnXhGuxdQP8fQ=; b=pNl8He/dG3UHRb4c
 AGkTmVrA4HG3f7+7a7zAqVU3oW343/Fk9kdd4Uw6w2sTM4o8/C9+r+nXNcqonePl
 ze3xGpGCQcJ6KL95X87SC54+Z1hJ60LOVbsIMZr0yFSAMkhJCAyp9TVg883jCSmh
 Evkszo0SRq6tY0v9lGk6tagsULJPY6VZdWnZ+/2uQ9UUH4dnjRPHk7HqLkKLMGFM
 3D8qMgJ92/wNqJxEC7KovBb3Ms9n8S1AKs9t1Wqq3FeUKt722VVELK7soIhV125t
 h41ybJS7dJnHSitDqZiHUg0Q+wpe1rndVAWmD1UmpGqa8TJrAN88y/oe9k2UyKOu
 kbZpUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0uts1epr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 21:18:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso23936341cf.0
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 14:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786569510; x=1787174310; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vvKhPPo1PodGZTWBcV3exYJ00sm/DXPnXhGuxdQP8fQ=;
 b=Qa7AD7OoKyG9LrpSe+RBY35dl1x1CUNpUy8ekJKgaT2uEG1PU84lsd1XoAXRCaPkUs
 ZeuvMzZf03GCuszOfwk75ty0GZ1YIo1tVDKcrkFAjOXZI2c3YjO1AhYEjqpJaTZYBQwf
 XuRq4oeAg8KMFlaNFcGmA73rEvbaTVv98J7vnJjjrdgbfYBYWY2rRMbWtUUSVUq9asj3
 RrzJ5WmNVhVvpLu2E+Ga/pgrWRJX0qco7psUABaq2Sya/gN4bV/FRW8PNVVINQWRjV5z
 YdI16MzwX8gp7NIyvWyD3E1Uydlg9fi/ZW1IzEzlc1ULLLpnX2KEKBGJkvvYdfjpIp4g
 byDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786569510; x=1787174310;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vvKhPPo1PodGZTWBcV3exYJ00sm/DXPnXhGuxdQP8fQ=;
 b=aTgewmdyTVJK2Bk6s19iIZNXo6dV1Wte5FH7L8JVDt80XIe+xGwaoJ1PqGGmRrT83M
 eoR4kXg1iXDWo7+0PoHLjxTXZ1lQEejJy4ePIS7G0LS0KtzkJTFBZjcpWOY6VZvXfr2Y
 ty/3CCFqEx90qm9Q9eOKd+hEySdL+MToQ8tZTe/oh1qjf+3Dyhx+1Cs6yxLY2vOfjI1c
 dV+1CYq936Z/7ACJF5vmhC4Md5pItuKqwHCQihKTEZTObRtsY9f7yQQ8/YLp9nF3/bWl
 A5R2sHgpPYWpGQj83psA2KAeA03HQbM+NPt2Fl19Vj5OfgrakhKrnt0P9xmaFEEPoVvX
 RtBQ==
X-Gm-Message-State: AOJu0YyGh5ARrQ6irYz6M/7FThg/qDWymlmKJGRx2roMZHJvHymAwLmL
 jiAb1jAuo2f4ULmJd3thtXHtNkT0AS0TzpsdHoTEfz4L1qs7ZCwO10oAOoSSGodiocPCiA6D/a1
 jWGYqWMtSbtKzDEalARocLYKXwCjM+85xM+RU12esIQtYf8xgfZp5TGA=
X-Gm-Gg: AR+sD12EywIemJdyhdKvbM1678csuCIe5VR1yj1YU8QOC3YXhaF+rosJak44DjINjzB
 bjsTuLJz0w9KXwu/jCBzfNbSJoqXIA79CCohn3Y5BGsoJJqSMbbMbpBDbr+CSSztxQrq5swsGgD
 6K+GqHVqwIwmWM+u2Fl4Hpk+0dW+46h7yMv/R4POopIqySTovnvc8eNuspE6tVSzsdri9Xyy6PU
 OYsLP0c5NT4S5jf6X236rnGJiOXibNwoXEGc4dipA2z47PDUWc6bubOJJ1DVcO6EL4+y/uAvtbx
 iqopnOMJbutBGTmha+RjsbGqJ51Fv+SCPDYlY2QevO8F4aXjyD5915wN3Lhge7z9mt4sSHOJEF8
 jMHkMAWrZ3JXnekWteG1CPkO4VTKx8w1TlPI=
X-Received: by 2002:a05:622a:1354:b0:527:edca:8761 with SMTP id
 d75a77b69052e-52d73c79dc3mr11865601cf.19.1786569509712; 
 Wed, 12 Aug 2026 14:18:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1354:b0:527:edca:8761 with SMTP id
 d75a77b69052e-52d73c79dc3mr11865331cf.19.1786569509375; 
 Wed, 12 Aug 2026 14:18:29 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499821652dbsm5647325e9.9.2026.08.12.14.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 14:18:28 -0700 (PDT)
Message-ID: <f5f09dd8-b562-4c6f-aa29-92eea8057c41@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] target/arm: Split out aarch32_max_tcg_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260812204435.295067-1-richard.henderson@linaro.org>
 <20260812204435.295067-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260812204435.295067-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pZFt56Mefv_0CphbS-dxA3GUeJoVrpzS
X-Authority-Analysis: v=2.4 cv=aPDAb79m c=1 sm=1 tr=0 ts=6a7ce326 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pZFt56Mefv_0CphbS-dxA3GUeJoVrpzS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE3MSBTYWx0ZWRfXwDc5MksHPLdL
 auqL5Nw9OrnNDgW2gzrykPS0+IcKwJiQvVDMLsENg4/VRYrNh5S05URbWeOxb3Oo0bPuxdNmzDt
 T8TY6Hu8odYr8oCtFA6W2Y663xX3ZaM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE3MSBTYWx0ZWRfXz596KdI//+uw
 mc/VqwqK6owltjw5K8s+Yzv5+6+xIpF71cV6Oi7vacgXjSkCEhchibA0dvYiQwttZMqY80SYhWQ
 0plBebFspypg1vcEif1pwCBxeFsFfagBZ1z8/4wtQ8G1MITAsx7jBW8MzGBM/C+mtgWHK+9j4K/
 5086emtwhiP+F/BrgWty04iXaRY2BMaxR+QqRigRP9vq+ARLsT+EqxwcN3nKDKRG25MGMzDRRSP
 hE/7E8ar1hjTrP9BrCJmMo2sZU8/miZ8Lut/nkg+ec4u8wDJWa523g47OC4C6MY1k0P6J3ILEyi
 1l6bsrLewTdh8mkmvTYJ4gafK6n/dYQSmtxhphtEAR89rcFMDtoz3NujQgtQgmF0c3Ezas5vJUJ
 jN4niJUyLlZj/WPWnQEbcOloXiQSYf/yfQmyasoAxrHkbVXqQmFzPYGGni0IfIxUk7/vxuwCRhw
 qGep7TXF3J+mpq4VfiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120171
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

On 12/8/26 22:44, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h |  1 +
>   target/arm/cpu-max.c   | 16 +---------------
>   target/arm/tcg/cpu32.c | 15 +++++++++++++++
>   3 files changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

