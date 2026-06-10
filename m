Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DF7CD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:37:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXIAQ-0003N7-HB; Wed, 10 Jun 2026 08:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXENK-00035L-1Y
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 04:33:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXENI-0004uD-Hr
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 04:33:25 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65A7hobj530887
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 08:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xZwMrQ9cJwMlOF/+HcUoi3SY2nB0zh1dHc4plVfTG0Q=; b=jDmRbuKtPmPX7dyx
 1JYDzDak2mfQp0aCBpaJiMRicn8tC/hHAogr9gfi0jhLbFcl1Vm+8fh5I0PKLbb5
 wJeSirKdXaY4e3+G5qbpx0nHm4/7vEa8Fy7QuneOo4WQHBB5EblGkBg/xQXVRDhC
 o4vu0TwSTPAeWoniCKgZIknFXFDINkwxlJevpGo1mviVUHzVgtDvb80XjZWUYDR0
 N4jFmzl8OxKDOEnAKhxq0oSi1+3IcBgEaK1QykVuYoirPMJ1nx0jTHYD8SlElkdU
 EFFFOQx6EXbQLU97suOql450gWL574tCwfIlXDXbX+M3GqfayRQ699/IdiTnFKSA
 a6jKnw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1j3w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 08:33:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5175a1e32e3so176395981cf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781080400; x=1781685200; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xZwMrQ9cJwMlOF/+HcUoi3SY2nB0zh1dHc4plVfTG0Q=;
 b=MDNiTGeQrrZ+ccXgQrjRtoFX07TMoUb11JOIiw66VO3TVjFiixnwhSqkn17/iTelOk
 BKhEyfK4HmxXrqy5DKdf7vW/cciTNgEcoUTkoPrOYPlLleIyPFSpqBDcXsvx4RyyhASP
 CVprqeZk/iLuif71MJCldaWpTBLBkWUKouX+KDASLfyzfFItjBbh/+NAnRdCS5MlJ93q
 cA2QIvItSD5YNCRivSy8BuQKJI1HHFOXFz90vn4BK4jcKRCy24pkl4i5a7tWyDMJkpwu
 fvyEsQMkKE2erHzlcwylcywnP7XbjhKT89qadAYYzYp0/JJYugVrr3gy7w2TClAkcpBC
 Is5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781080400; x=1781685200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xZwMrQ9cJwMlOF/+HcUoi3SY2nB0zh1dHc4plVfTG0Q=;
 b=WfNFh4CJBVUIkGB8csLuVxpUE4Dq9cm+CZXmglkVgiNScFOJSXB+hYuNnV5ASzYDbM
 JYnTXo27icPe+jAqd/p8tk4OBqo0iPkM/zy0YOxqu+4SjVnsyBrzTFCq0palh7AtKolX
 QjPKuRf+igb3krt4Uop4Oh0rsJT5wIYSzFeT9iwB7kthFtZb3rPvGC0YuD7cnOlZjjbp
 3KX0+7kKjXL0HnR4K1TbdkOrwuuBq3kTbN8XFARGhPmltT6SOzEKo4nZOXEt/DYx9Zkl
 cAS5P+5F6vkzKjtpkSSSVI/xF4x6JtKVnxOQve7ZNyXG9493ybzJ0NETSOFG7pRVHGYU
 6UXg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9acpDvvrbBJaBUgcMsZuNoeCyV8oNNFDK7kfrKkhDQAEKjRJBkBI53vP0eNK/GLoFbUdH88LzIAQ==@nongnu.org
X-Gm-Message-State: AOJu0YyuLqaFNAmoZkk3eeQvq6kip3IAc2DPsKwOSOQalh8+XdGRH6Co
 N7hK1ZajkpcV0+1dJooyKkGOn/XXQ05eo+TtzWX+6yTQ201XfH/HqDsMmMWnVpA/UkB2QOj4xpb
 pacU7MzhqcZsqV8POQrrLqJasu1IfMU8Fuk+szDC7IdcZc7vmuV17DZ8=
X-Gm-Gg: Acq92OG+mfgs/7h7bx4yw6kSTNifZTd92v1hdqebQl7DJrzJO7kXWPhcqLxTwczVXRQ
 JW0sFrDuU0OoCA25ZnJ7wRoDKQaacpkr1yv0GDhGnLiCk0yKe1X2NyWJMxvcsKbXd8JwdnjofBE
 lSazXCdZO6KjUpRwnmIr6LAIMcascqWmRWlxFhh1hjD9VdZJhahiBt1P4n2cXgT7/ggC+XdmD59
 zzIdY90tDMFm7x2L9LedEY5DZSr3lnsElULneEzOsh6mupos1dcrs49ScV/zzRzCJpB9S/k6hZB
 KXYWBpu4bl9pGCDeMQ9/8fXuQeLSRTc6tCuaK/2B5AAtsO07GlIGqpAoXfDaokl5BoSJM/tQTZY
 4duKyx3cVKZVxbPN4RmmWdrqR4snAQB9SynRAXpmfnuwDfoPb4L3Slw2Uyqtn7Rzwab8W/vsQjw
 ==
X-Received: by 2002:ac8:5755:0:b0:517:899b:7f77 with SMTP id
 d75a77b69052e-51795bfa2dfmr358393351cf.27.1781080399985; 
 Wed, 10 Jun 2026 01:33:19 -0700 (PDT)
X-Received: by 2002:ac8:5755:0:b0:517:899b:7f77 with SMTP id
 d75a77b69052e-51795bfa2dfmr358393021cf.27.1781080399579; 
 Wed, 10 Jun 2026 01:33:19 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6915a637180sm5618699a12.26.2026.06.10.01.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 01:33:18 -0700 (PDT)
Message-ID: <7ea81b3e-df34-4f13-898d-26879019c33f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/27] tests/tcg/meson.build: introduce wrapper
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-16-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-16-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MCBTYWx0ZWRfX0Qs/6uDdszN5
 KSXGeup0bls9LTaaqWUkcleReLTLHF9dVZ3kufmYUN71AionCKW7A3Vp9KxRZLmP4UWma0jPr/+
 fAxv2j6psZfYPS4HcfKTYqUF+8SlOnMNNiI59oxnDWGXGYbx9SImKOe9il8Kp8kzQT9Vq+MIOSl
 tofYW/bjuUO3p/drMwmBG4mifOBNo1rEU8QHeyQzxuvTUKmkjSh7708Ga2qhChagBfU6N2gCCNb
 IgI64ACliNdixBrCNErEqzsKifL2GMn2gFgyZTCCT86FtojdAU8czvT/dxSqas/jYxy/6hutsNd
 0ngemlUEupr1BTZwq0trfJ3ZvRX6/JlO4vVARiXRus9PvTiXkqbeS+mfTbegr7vL49J7fOMl3Wd
 Toue47WasdBdwExxdOX6w5EKHaL5acWYSmutJZ8RHxemwKzOThdV0+Y2lL2BPVCjceHfV0Ua277
 HUt0Odckzn7LYa6jgcg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a292150 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: im0QIu_ajuIbcrphfJy_wXif6TICEOU3
X-Proofpoint-GUID: im0QIu_ajuIbcrphfJy_wXif6TICEOU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100080
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
X-Mailman-Approved-At: Wed, 10 Jun 2026 08:36:16 -0400
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

On 9/6/26 23:47, Pierrick Bouvier wrote:
> We add possibility to wrap a test command through a given script. This
> can be used to provide any kind of ad-hoc check for specific tests.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   tests/tcg/meson.build | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

