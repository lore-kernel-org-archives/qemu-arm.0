Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9928CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:41:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENAO-0004G1-4H; Wed, 07 Oct 2026 04:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEIQM-0003hE-N4
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:34:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEIQC-00082g-Oo
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:34:27 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6966gcPS1045527
 for <qemu-arm@nongnu.org>; Tue, 6 Oct 2026 09:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YnBHsl9ClOZu1t9lxykOhji637b1mEFnyAQgzWHkn+M=; b=FRYvZh8S0Zejn+JK
 k7NiW90V776D90+DArAoWBFFFNd4cqMlKIfbav6SAaHDY7aZ5jzZkMKbs6VvogT3
 QGNOILrjJbRgn2R5+0teHKQgl5jMLydteyCvW3ml2w8LCeuAbRL5lbUADl5HLiQH
 vZpb1gpR/z8HIKVQqBxpTlnY1sXZs2cOKQZMwwoO+K21p0sCidflQXs62rrA916f
 xUAHg/3n94o1TvkFAl7HQ6240pCeiax06ZHIDpy6tNXX02J2KTvRyqaj9KA4X3ud
 ZNf4k4NiT5CeOjxheE4sqS/bFfozQmvWynO6LulQcKgkQ+erj4bnCadYqO1+KthN
 M/uUTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4gjrx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 09:29:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93ae8e7e546so480080585a.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791278984; x=1791883784; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YnBHsl9ClOZu1t9lxykOhji637b1mEFnyAQgzWHkn+M=;
 b=BNMitdebL9gowjf8tUgfiuEuRBT8Rc8+VnB56tNVfX6CE/Pz43DRXkOr8LVWRotDSH
 hIdFSn1uhg+/aSbrMo3DAn5V65mOcyQpNiYszJR1zvuL0cZOASxghuEc+x0/UgKub1V6
 qRvbuVi7YA6k+TZ9P5pO/ssvXSBsUhQv4deiPSo+lPoVjsl8HqzneLqkmy39EZrB6zst
 BDZVD4lq2ZI1lLzFEqs2LIGB+y99E3MrMmZ2T9MNRjsXcabUmY2VtxculMnAjarSzh68
 kkCtn43A8RvR1MbfYnvTZPggOWZ+ZL24Tg9/KAXMeLsgzuJAyWYUQiz/oLFooRXEM3mD
 XZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791278984; x=1791883784;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YnBHsl9ClOZu1t9lxykOhji637b1mEFnyAQgzWHkn+M=;
 b=C2cuyWM55qljyfDx6q28c4XPt/PByf8cEXR8po9bir6Lx2Y7CUG8u07JuW7rbWx/3w
 otmEfk/XuFUj3zS2B7zoPLxbNGb13hr3DggA+A28e9JveAPy7Q20BwMw7dBNfl6OQWCx
 gKPPAK1dwPMcwPjdCNdIGBSGO9W9KAgjbEL25WtxhIR/kBcd6gstiJ3U27AzNmpAbI/1
 q28Gq5IJlwUcQAPWcT0jN68aOjjI2vXZFZ2vOr7gZkbTIwu4mWi5JqpfFdoNdAP1w+T9
 JkDo+506msmi3/hziMNbjx1YA0SW4X3SGIHrGRR69vrC6sJ245zfYOiLDiMjZeYxaRWv
 jtzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzsc+AI6Aq5AawxGGlJ5ySpCH2BSk/I8gLJXJG7uwEEzWXh19JW6QPeB6szmzixiiU+rmF90PpwiQ==@nongnu.org
X-Gm-Message-State: AFuF++njTtQ2B7PULfp/VYmUZ5PjeabZ7bIulLkGjjM/w8KHWoNHhvWP
 qAmRP1PGfM8teGbw0BH8lsZmR0rF09bntFLOtZ1cvyERnT+B8PsM9MAbHOq41EgBvJlIBWopf5r
 CBkXoLgp9NFkoOSJ17RQhwmCmwtDYew9GkY9LZFCj42YJaJdzR7aN2F0=
X-Gm-Gg: AYBFou3Q9J5MI0KcMHb74sEQl1nH5HE0o8jbTOVrHpgGMtHp+mvRSuQGeINqKNMWSdi
 bFKRn2bzyZ1Y8AKXNoGGEm1zZUeLsFhUctaBoYOnbHOc4KqkODGSl+23RpQlvNbQIA5PBdUlTx1
 UcnxGxCZ6YMjgdHDbnDAxWIVp9Hcfo8RNRTCyquhCacaIPZDas/dPkVr+dJsC1gkh42A7EbYbwW
 UxJvo3dv4jHYrbSMKz94U5a5WU/DH1H+iQ/quotCYDJ+AInKFHn7fXcej6Ozh2BRUUufy/GuLwM
 i2YEgtLfvwMoAP4Zv/xVQrR3pSFbZdJWXG9cxWsszWjsimtxMK9JzFug4dosbJxqYVLzmuW+nlQ
 GsMxYVwHvH8U2DnkydXXvTSn+2CSgYTv2AA==
X-Received: by 2002:a05:620a:2547:b0:93e:63fd:40a4 with SMTP id
 af79cd13be357-93e8f513006mr126592785a.55.1791278983177; 
 Tue, 06 Oct 2026 02:29:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:93e:63fd:40a4 with SMTP id
 af79cd13be357-93e8f513006mr126588685a.55.1791278982618; 
 Tue, 06 Oct 2026 02:29:42 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c53997sm89834595e9.12.2026.10.06.02.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 02:29:42 -0700 (PDT)
Message-ID: <9461d647-1bac-4014-8010-1ee1f3599fe6@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 11:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/31] Kconfig: Extract config IMX_SPI from config IMX
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20261006083445.30362-1-shentey@gmail.com>
 <20261006083445.30362-29-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261006083445.30362-29-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX9rf9pal3ED+M
 9EbqJ2i6c6/rVijZ08Mr6iqzW/4sB/KuglHPRc+QUuBO1yH4i7+yRrSUVTqOnnRSsyoYLBUWxXU
 OqR0xuvkso/DzPOW9cAhHevmCOIvo+oUHXa0YEt5V93tvxomp8mmY5oweIGxZlQuBvMj5QGpPhG
 kkRFBdiLZ4mmAFqsCiY74qVAeTozfdppFhKJmKqGM5vKEfat+2q59rq2Bv4USY4G/RvB4rYD6Cq
 6kpGUnPqsPaLXhsNbIKNwfL85C9F7i56pReKwVmsxE8O4jBSp8IeHD/weZUqzCr6VKCfHmTNSXR
 8BQycCTREdh4zzSWmkrYpySr/mB8Wj+5FPNj15qDHH9uEX7wQw7lHgvq8HWlm5pY4Mx+rnhCm/j
 biObF+3JlfTpL5rK3ufIpYIvNOwOO5khkkXVX5BlVJTWsGmhd3UOZno5HsNLZmxOGxUXkyZGG1b
 XcksSMiJJZByo9Y0EIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfXwSBcxET1JbwN
 pDHFMnM+0HtYg0AJhivf6I+MgY+QlveO0lA59r4xDYWflRVWPYGSbi/SUTssq00ZWWuXR4wiBTg
 LZO82H9AlzEh8qTOB5hXg+y5T4DvJYI=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4bf88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=FRSEYCzRAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=WqDpfZ53LCkmLu67dcAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: 2VFsqcUw8p-8shWx_LZSKxPYKf0MIIhI
X-Proofpoint-GUID: 2VFsqcUw8p-8shWx_LZSKxPYKf0MIIhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037
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

On 6/10/26 10:34, Bernhard Beschow wrote:
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_SPI to eventually eliminate config IMX.
> 
> Reviewed-by: Bin Meng <bin.meng@processmission.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/Kconfig     | 5 +++++
>   hw/misc/Kconfig    | 1 -
>   hw/ssi/Kconfig     | 4 ++++
>   hw/ssi/meson.build | 2 +-
>   4 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

