Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C61EC5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 21:20:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuGMX-0002tw-LT; Wed, 12 Aug 2026 17:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuGMA-0002Fa-PE
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 17:19:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuGM8-0007tn-QW
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 17:19:26 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67CK2OZ0245921
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 21:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mKmcJs7GK0Zw0n/Q1LidRqIr6h6PlQEJSZg+NmiQHxw=; b=abSwK1nKJnWfwcRd
 Dqvg2dGYFbCz2rIkIad6MAtEdqOm7d4Sib97bIeWzp85OfELDj9WC2WZCSCMC5pH
 6GWjJCSGrBhK9dImeHAZKBZdyMkEEfjxFv7wl4vu55nT5tjjY9M4LG16N5h5wx1v
 NfchhH3n41jLuktNzHj9E/Nn1qE3x/ZlR1RqOgSrUYM4xM9MSw91aZNrcgIfF70V
 KsnhEKi6EdqMTewvnGyynuhosrVkgXAo/61YMhJegwU5GJd9jzryt8KtgW3dNiAE
 l6z9S1jhndEJXW5tEIvx8nr2YX/1ilm7PD3Yhp974m1D6GwZWN4E+EfEGL6vejxh
 9jo+Cw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0uts1es9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 21:19:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-904ee4473a8so14065776d6.2
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786569562; x=1787174362; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mKmcJs7GK0Zw0n/Q1LidRqIr6h6PlQEJSZg+NmiQHxw=;
 b=KUFuCDWovv/3Wcs6hTq4BscC2HxXZD2h3Eys1B99swqy6NWBrbk2P02uJCVYpLBQ/H
 xLl6QhoWwvkFzae/YycgGD6xkmi0qQCPENBXp3WjrWIkWPR4RF0pQi2tEk/hvTOItCKY
 yNKUzktOP4omkTO2Uxh4m+HIgyushTuKyNpqLtbuS3Xz6iFzrfX4NMMDiUUJNFu4LfVJ
 iHUGlVtWmc1s4wQ7Vk6MlQ6pcX5EMxcVu/aHB/S+pkB52Zy6dSRtBI1tQE+wGMg3VZ0L
 99TI7VUlW9viMWM/AabyvmKTY83OGyZIReVZ0VJtqMPw1R6MMOeQqYsN82L1jo7JtKmX
 6LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786569562; x=1787174362;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mKmcJs7GK0Zw0n/Q1LidRqIr6h6PlQEJSZg+NmiQHxw=;
 b=EH83nLibZ8gK8DXoJMwXCIpIhT3HNFxIcQEVjv5oT05pWJ3YdrpbYc2SimNToxfSz0
 DxBdqczVhaoHCpwq0TtgEg/EuEL7V+WzzFlVifu8d1d/ymijvGtZMeD4hiSyhRtga9mF
 5VJsbMy/Zx5Ay9OOvz0GlsJdOrQM65XXwfkcgz8lF19bnV1INENZ7zMDhHr7tl9ni4e0
 e4GeKaWPo3N+2IUKuvqjdBL+OeaSCEim1X2e1UV2GzRfIMsi2Py7tah1pUzjLWl/ufts
 QOyR+3hmZuwmUwN2xF2TTDWhGscp1SfW7adCpnQ28ueKTKzaV4DYITCvtBJFhMZOcw9a
 NZ0g==
X-Gm-Message-State: AOJu0YwzLBf0jcuIIR8oq9Cwrdnn2BPcTvVp75+MW9JLaZaOedR26KQw
 LcBVQyecVG7fL3QaL1WNI7cDNhf93gTlan4Xqhqfko1mRkAJuUgH1UFktPEufGVlu/KAh/w7f5q
 jywLoKDLO7g+5ATqPxxJumhCn+d/pKaKP51TgMmplA0q3X8YuUl1kkhM=
X-Gm-Gg: AR+sD13ArBkyy4OII0fIfvyYFXYHBi+yVKQqbEqIliUZ5zzIirXY6ofNqLdMypRx4Lb
 5xNXpgjEDsaQa476mTAlMikONlmOlxa4ltV4sOqYt9Awzdc+o4VZKOjkITAJCfpO9VzBeHmOATd
 JOjJ+huup5eZQruyEGAo7FVkPxcjnM+tHcNdgEfkJZm+cTG6fq89vZj5ETwYDJCzkmyDzu+35Rt
 qA1ONtaDW7wRTTdtAQhFEG84gS3YlZvFMoaqRv1kt+80DYw8giqEagWcdN1knHZ9cmi+lL87nOj
 NDasMyvQaADrbd4z5Z/86P6QAtUvQEuWysXdzMoyJMSwLoIz+swd4/SoQzCVgJ3kvmK/ZDCCju2
 +srkX6y6dJ3KyvDt2Qb+o+lIWyubGZW+YYzk=
X-Received: by 2002:ac8:5f06:0:b0:51c:1c2c:a8bf with SMTP id
 d75a77b69052e-52d73e400ccmr8873261cf.43.1786569562619; 
 Wed, 12 Aug 2026 14:19:22 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:51c:1c2c:a8bf with SMTP id
 d75a77b69052e-52d73e400ccmr8872931cf.43.1786569562108; 
 Wed, 12 Aug 2026 14:19:22 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5af441sm718306f8f.22.2026.08.12.14.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 14:19:21 -0700 (PDT)
Message-ID: <2ca53033-9bd0-45d7-bfcd-6b17996f8b62@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] target/arm: Move aa32_max_features to tcg/cpu32.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260812204435.295067-1-richard.henderson@linaro.org>
 <20260812204435.295067-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260812204435.295067-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XLBcijrXoA4vuvsy1nmlCxTBzJws8wd8
X-Authority-Analysis: v=2.4 cv=aPDAb79m c=1 sm=1 tr=0 ts=6a7ce35b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XLBcijrXoA4vuvsy1nmlCxTBzJws8wd8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE3MSBTYWx0ZWRfXxZmKFz+GUUXY
 1np3bFGIAp9DXhimYQHL9G13vLMFZrzREWsZaYEjBjxQt8dQE8OYM5T2RxTT9UrkZvQ/UIh1ioL
 tntqN5RWviTkuy+wtBx4erhwO8s1q3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE3MSBTYWx0ZWRfX6vhwiwUcPPo5
 GXL8f/yw/WwLPlD/4l1OKLIiBJo2lPm8KtNGA4UP7y2XFD0BOvhqiHHPkS0crTVJv1GpARuu0W6
 8dSJohgnPRcKveZpMHT7MEtJOsdpc2B8W6UUydE+zYW+vvJbGGPf7kfZwa9HTWm960l+XEubXA7
 r34yrulQUdHUAoPTB/F+Ob/wx2Q8sDEBtty3KkTd/+ojlKLV68STrGCkGC6nH1/aJiLhbOFsYJi
 4OLRuHoWeq9/oLztKsoNsu0xBI5ylpjTwT6DVGKZLWbpLKSu0XdaF68at8utSDeY3ELZhOnvKzl
 zu4mSOKG+RiWlFSAls1jF5pcuPNd3X+BfLs8gxPYCGlwEciWCAuNeQUi6wDmsL8WBf+XfRJ8IPo
 y/7GE6NHa0xZgwge8PJG56E0o34WuSwe+SM9lYsqHxdj5CEGqoALn0B4V1VRpvE5WucI1OJWhGv
 kmsJTu3VnJ37DvzaMjg==
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
> The function is unused without TCG, so move.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-max.c   | 96 ------------------------------------------
>   target/arm/tcg/cpu32.c | 96 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 96 insertions(+), 96 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

