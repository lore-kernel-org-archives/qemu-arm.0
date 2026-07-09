Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23990C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 11:04:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmXW-0003ot-1e; Thu, 09 Jul 2026 07:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whmXQ-0003oV-Dl
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:03:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whmXO-0005eW-Q5
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:03:28 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669AxHxP1615548
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 11:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qKqTNjSjPoB81yBxKLV0qvfgTiqhXBtDXzmeW8UABFc=; b=bf/woMrAOPHDxGwY
 q9Z7pMHoRDI3b03yXvB0q3JHYFC3Vw1DjAf7i203pD0flra0V6ig0lFI6FApuy5h
 WwLLvQqVkLOFaFlQsvmz3dRZNLTEdaVk4egbKBQP5PbzvAvcl8/0qWbPoak03DN1
 YOj6uZrc2+uUHfTHmEbAHwPNcG32Gm4Jqwvp+x2TLxH+0Mg0o2GJDwwWdhMUR6E6
 6dGKXfFsdb+pwL69frtModzwqDFNMD9Pi1Phwyu4U8A+61iBHSw6wb6pGaacUhrB
 qvIkH91YDkoi2J1tTtfziWXHZAH+EKLdsMPorDpoZ0SqBPM95BePrd2Od3+pfRfn
 IURXfw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418hr1k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 11:03:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8c689b5fso13093551cf.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783595004; x=1784199804; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qKqTNjSjPoB81yBxKLV0qvfgTiqhXBtDXzmeW8UABFc=;
 b=dUcNmoznjl2+C85Wz9Gkg4u1pyq6uTruDZcAj11s8mc3FTAApUYpM9q4r5swHEVM7b
 X/v96/y/LFSilNN6FtEncxrwSOnfqWbdsrRfnMn/n+HEz5hSvZpYUCdItmBKyhpjkDYG
 Kwmr6IR3mL4emBJq5ULDamPf+kMjvmbrPhHGlrdgpy33KjkSsGRBbxOcestuHA1lKZLb
 Wnn5rjihNnyBLN9xyut8bGG0SvAfkRmARe3ychUR78ioBKzAFNjU7UpxZVqx5Tsn0C4c
 KhrUZMwL/k7w9z4SfqgWxKUNw24s5FmTYkcp+RWK4e8epgHkIDR1V0rFUy8gyPGYsZ+2
 OVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783595004; x=1784199804;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qKqTNjSjPoB81yBxKLV0qvfgTiqhXBtDXzmeW8UABFc=;
 b=qF8NEGuCOGiZ9o6LP7odM7PpBezwrz+KSx26Is1vHG51r3EHhheBU4AccrLISTwDG9
 TOv/xfa82ojJrVWhvl85OhZ+AKXwAYbuk4Vf2ngE3Lcw9jUaWLy/jbfB7XbpjdvujPjR
 8RYb1uCUbumNXSa/OVoF2w4zi/jeNao8PfMgLsJCWIkq/U+3ANFzeyfKmnYCh+d0gYpO
 ZPquP9Dk/rZeAC+c3+b8PWPdLmw1EV6jwS6JUV964u1g7p+2Br+6lZA3P8C0alRp4CTa
 Vj8ltIVmwAdVPqgzHh5pA+OMpgCUCFcXTlFOx0E1QlpanKu0WwYxBZONpOEvbsgghSwf
 40KQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJi0aBw87jJUfK26frlnyeey6OjixME29YvBXN62C/egdWMWzjx1uXDirvOE0BG5rh4cxFekM/Ug==@nongnu.org
X-Gm-Message-State: AOJu0Yw+29l/0wHkCDIHDR7O5sZtf8x2KLQ8R4//IPT3V8WfhShEDVpW
 V40u4l6D3DFJmuj2qeSjhDd2V3cNbBeKcY0tOj3SowITA6KNc87jGFesoc4EOxnlhytDt4AnMg3
 91MTfejoTiIaX9hr1S0ANDd8+wPJnamqDZ8J+XmB6lv8KRKrzC17Ssj8=
X-Gm-Gg: AfdE7cnY4U48Teun14HSmlbNWdIDCtlWtRHERAqWFF+LmuhAYci97OYWHpYcuS18F9x
 wgu/6NvRtYfeGODztZir4r8CwEtKAUCfd6mcrr5TKC+AeLpLOM+Mw7rZ52EuB62f4y/q1LqsAfv
 A73+Oq3JCT9wYM5iRGLQAZERXxg1DXfb4gDTFwYgcQhGNIqAeDWpqJmQ683TprR902cdzHQRO4d
 JC42Ib4AxtTGMzjSdN3Y4KxolPz/DuRk4R1KS2IIu7NlSN4WylMsiRHs53DsEdvkDsSL0onjRBe
 j66tNK7txfYbUMTjkysRa6rt28rXaNmpNo5LZaHHAAaH4hYcflSVcc8jidtwDl7NNIpnfbLPk46
 8hYWRY4rPiyffKeyfiuKZApVq0AdHZHViouJdHVkQXxH3zNBIdA+EbP0BLhrjqw==
X-Received: by 2002:ac8:5902:0:b0:51a:8c9c:7f44 with SMTP id
 d75a77b69052e-51c8b4fdc77mr73313571cf.71.1783595004020; 
 Thu, 09 Jul 2026 04:03:24 -0700 (PDT)
X-Received: by 2002:ac8:5902:0:b0:51a:8c9c:7f44 with SMTP id
 d75a77b69052e-51c8b4fdc77mr73313161cf.71.1783595003597; 
 Thu, 09 Jul 2026 04:03:23 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69aa6dba523sm3663177a12.0.2026.07.09.04.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 04:03:22 -0700 (PDT)
Message-ID: <2726eb5e-61ae-4600-9c47-2ce9d764afc1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:03:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/allwinner-r40-ccu.c: Correct handling of out of
 range accesses
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20260709104802.1989086-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260709104802.1989086-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f7ffd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VSvEKQn23ta3RclDuHAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwNyBTYWx0ZWRfX0obCSVMChsGw
 aCwb9yQbybpS+45J7xMLsFfAwceWPwFHL+I9BN/In76PZQYVNPEGLK6DKZqDI27mCUPlCrTLE8E
 PanZUWS3PXtX3nJRtFjlcv1YGfmq5Fzr72/IOuQRyXrV8glUUaLoaKHEqtsXS3BUtfqp9CSWWNo
 Ym4TOfPrtI369AKzy63RNRbA60e3s4jihAZP9B3sbSNZvG0Rc2SsDmYhY6wo7Agi4eFTrl6cIKt
 N2Q6AkvO7h4uBsqIj8D9g6OohlCV/YKipAOCpsV4tI2aH7MwZTUWlqmsRu7/215BZqJ6beNohdQ
 grOCEBST2FQS18js5dv9u8BGZYT3hNHcaRKeFaYERZzOMl5O3R/aWeuoszEQ5n7EnmZv06HkaGg
 GtoNN0PN2Xib4QkJn6sfDiH/809EgMkg8trtuO2oqCulmXMG6vw/dtsP7wi3fY1ov/iGUh8G6AV
 j+SyFcO3D89u2z79UzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwNyBTYWx0ZWRfX3gIcMYw4RWFj
 bFgA0bRK5h3ya2Ioq5fYBUUDTgxWWbchpPNLjQ9anx+xc5vNpkrM3f2XB/Cqtb+CWui5DZn3Wa1
 Vio2cXhaauSnHVQj7tD3XRhIi7y5wNY=
X-Proofpoint-GUID: e3Rcrytfca8aLM_8jqwajGQGQEeoHQpd
X-Proofpoint-ORIG-GUID: e3Rcrytfca8aLM_8jqwajGQGQEeoHQpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090107
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

On 9/7/26 12:48, Peter Maydell wrote:
> In allwinner_r40_ccu_write() we handle writes to a MemoryRegion of
> size AW_R40_CCU_IOSIZE, and the register array is sized accordingly
> at (AW_R40_CCU_IOSIZE / sizeof(uint32_t)).  However, one of the cases
> in the switch is a range up to AW_R40_CCU_IOSIZE, which makes
> Coverity think we might index off the end of the array. We also
> have a similar case in the read function, but since that returns
> early it doesn't have the same issue.
> 
> Adjust the handling of out of range accesses:
>   - use AW_R40_CCU_IOSIZE - 4 as the upper bound, as this is the
>     largest value we will actually see
>   - return early in the write case, as we do in the read case
> 
> Coverity CID: 1663687
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/allwinner-r40-ccu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

