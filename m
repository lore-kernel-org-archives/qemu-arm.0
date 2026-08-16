Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31A8C5B572
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 15:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvcUC-0001iZ-T1; Sun, 16 Aug 2026 11:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcU8-0001hy-2S
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 11:09:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcU6-0003zt-3m
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 11:09:15 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDlorO3162507
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 15:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jb0UemLD4VBI160vsDqlAn7wGpxKJ+kZdQfp3oLDiH8=; b=NhoBJ7dJDf5ycTCf
 xwGJG9E1XuLz+mg9u9zmFO7OLjEV8o8nvMfkJ/zsDrSJk4aAVho6/j19YEQksxSq
 gk0QJ7SQwIqSB51OovTmaaTW7Grj41G+YeTIHosM/7EGj2snSJV3bJjWp13raFyW
 IVyqwys7mMMa0Z14cO/p0WJA6dVyjCDEleIqZrD/cmVjSuKeFu8cJxaCc7DaioAq
 XKyYz00R7bWS4+31MviJz/9fOwrGVLDp9V+OcnOUVYCQzfCe7JxSWjEZCKlRtNAE
 2RrcJ1Gh4af6Wba2kFZ+5+B1opSCV/PcKCXwvj3Ioy1buNn0B+4GZ+lb+VI43/jU
 Aq4I4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7uh8f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 15:09:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso26738181cf.2
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786892951; x=1787497751; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jb0UemLD4VBI160vsDqlAn7wGpxKJ+kZdQfp3oLDiH8=;
 b=S7HTh9TpppK5fsN2d2ttZcKiWhO7qnpr0Les3gmtNPFOGS1NXrQAdo+uVCgJQ1MPdg
 PEJzt2NFyJt3/dIsc29s+vKR/zn70K3vOHyk8dBDnWPum9GXFQu1KVMbgBr68aPCIBz7
 1KDVSicemkC/vQKS8o5YTRrYvYJmskSmaX9sbNCsQz49krga0al4KbcEwJBZlZQHtNbg
 kPKgMjWhrDgBqOEnCZxye/AN04cBTrI6dZFVivrtsIrj1wsCrKNi+rfyIxx8t2Kf0zvo
 jaCX5jumPbyyZZp9x30NGpvW6oARoJiAB9Y1I0GWMQR5Vp+Y1aIN13dE1fG3RLadGKYz
 8bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786892951; x=1787497751;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jb0UemLD4VBI160vsDqlAn7wGpxKJ+kZdQfp3oLDiH8=;
 b=hfisVE5QNoMdKOwI4/DKe8bP3xQpiziTdbHEh6te/lzzjG02cxC4Ch1X56sOJJbrsu
 hEIHWrLqtUUY0P3xT68zJlMj0rKzo644RqY2hJ63O4Ybt7lCkJDPjY+ayg2fnJQMNcOQ
 47NE9/q4INOwsqrsezDw4EyQY/pETUGFZ6lZkVH5PUJjIBRCQEEUvd0uEPeojJM1Xuy3
 OQdLSDYzek3xeGwhU3ZXmxgcL07Xtn4my38AfLrTFxwOMsGAfKhVsxVkAqF6yJM0gE+L
 UYuOf4/8++sy4egpE+/zOwGfoQw/Ucm2AIkZqO/9hPhxraKA3WGY5mf2ifbXVnUiktnG
 wJBg==
X-Gm-Message-State: AOJu0Ywrm0Sci5L6ukrAHFEThmVg5o7qlKvN1Mti7c0iP35m4TP8b2Af
 ugqu+2vyWMZ7Q4LE82yNZQIUBA973akI9ZHhv3uxXZbpRQJUUig7q4LTOCwCbVscSoEOlRABB7K
 Qn4ixLj4oCrNcK1SKNqCK7sN6MZqJWxLLiDKbUMebDc4pOdEcaz5cxpU=
X-Gm-Gg: AR+sD13JA5Jai/0SchC/E9YOg5iVmEIJGVr/bhXylzzAp1wGQY4CrGypsu12NYnUJzA
 KXmN0sMWfGYdoaEvSZeeW7NagRg1CV2dhDhu/E+HX1lLqorRLqwNEFO9DizHkfd8Q/llei8vbsU
 ew6KoLFPclGky8vgEIqgGIL3ot3v+LtRAZnDcyQfEgK0NdJDPIvGW5TndAXFxmopIR4bborbOmv
 /VqAjsVHhxW3F4cu1d3mGrP4f+2uiVMgZ0UX9KIlALvfxBjZKZ2wJuXc3QNJN7HcVhYc+/dBzpL
 fDutc+IjZYmg42+ednWZZfAeiUJVw5MmeHdBX3D68hGuZ0r3BgCn+vBPad0X3Jj1nid1bRqWE1k
 QxIv7KFfAeQNfV7qcpdik+mZnIfzjHrvvc7k=
X-Received: by 2002:ac8:6f09:0:b0:52d:7b2a:938 with SMTP id
 d75a77b69052e-52d85382d28mr222701291cf.6.1786892951241; 
 Sun, 16 Aug 2026 08:09:11 -0700 (PDT)
X-Received: by 2002:ac8:6f09:0:b0:52d:7b2a:938 with SMTP id
 d75a77b69052e-52d85382d28mr222700391cf.6.1786892950763; 
 Sun, 16 Aug 2026 08:09:10 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999610e381sm74432945e9.9.2026.08.16.08.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 08:09:10 -0700 (PDT)
Message-ID: <9ab471ab-db11-4da0-ac68-bedfe5a7012b@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 17:09:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/18] target/riscv: Return bool from pmp_is_in_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEyMSBTYWx0ZWRfXw9bdoJxMrFVO
 q3fHsOV079qncooguJPIsR/C6kuWNoRpiCkbZahpjlDd474/ZDFt9eLh9Svd6v4734IUUBh8gUd
 9kjY6m7Ww1gUCVXysPztlqxKgKwLRZjgXJLFc0xEXaDFg8LoWAIEq0KM1UMvzb/4rWcw+VbYSnH
 /K6pCxyLd5aqnYoncxdfB87GKJsg4aDJhHlteIReITQWXgvB13RSlEom+2j0c9xOkEeL8ClyYzT
 fK6hj3p1ObGUgaSjwN5K67LWfBsZvWyhA3HcouI6esZOmdbN7JeY2neqzO3KM+zUQiPEypxcSsD
 zkAXYLQfFpDsXIgZvLHZdBNA7zUd2tHr+ML4buxuwv7UMoHUiR+1gSGNuZRYWDCLofxCrwz0ATs
 zOQrv8kS0KURVw0KI9TZmeFMajGIvyiperqSEh5omgKM6VPWjjiU7n779g98cstcT7Zgxxc9YDQ
 bz30/1rcNcWMhj5uWeg==
X-Proofpoint-GUID: c-abmFbxDeTJgAF-krkJ1XURMjMMxBJo
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a81d298 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: c-abmFbxDeTJgAF-krkJ1XURMjMMxBJo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEyMSBTYWx0ZWRfX3CoQy4tGrMLr
 HGGjQ3IsCp9rVXcXM57mwZNrI6W0x8xDbF8NUf9VlmQEqbb8y5JF1OZNKImf1Wyb5Sq77EPnIwr
 U6EPAgVGWkjsP22EG9RVkCqmFlf5a8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160121
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/tcg/pmp.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

