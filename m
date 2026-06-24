Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DB7CDB47F
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:56:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPxp-00019c-2c; Wed, 24 Jun 2026 11:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wcPxh-00019A-NF
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:56:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wcPxf-00019z-Vf
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:56:25 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65OFf9qB3844596
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 15:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FVNkk2krXTfsL59fYbCMYRzONLbzYXEbb1/AnCkaF5g=; b=XgWL2IguXHGJshWu
 hdYE9oZrKS2Zu2KpAdBKyNhjhvdq/QTnxz00hzUeR5l2/S9LvTSuhxzD/Bx2hzfd
 mHyemXdobJ1DpoCnXhh3pN0RVnhG7cyPglmFj5FOJcV3zd4Y0OQ6JH1WIK61mbXW
 XUbcu/3nB2wlrA1B7txtbRe8XZZQbGYSfvlQOZdbAmaE/FpBSHG0v6GrB7yFuIJH
 ZsPL9qzML9MyJUDGm8yJ5Z2xae1N0KCNsjdgh+9zshHZoXHyKEUYBzCmDNdhGrtq
 jpOetp7sIqe8U9rV2TThtoLjQm3Fg1fl/bgcRJj0gIzvXb3OsjqabmvqtErcu0U5
 h2tdhA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajk3tt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 15:56:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-6c5794db0eeso1178969137.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782316581; x=1782921381; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FVNkk2krXTfsL59fYbCMYRzONLbzYXEbb1/AnCkaF5g=;
 b=LRfaSjcObsPlNZYynTy4d89C4XK5KUeLFDDazQWFJx/GtIQnSk4f6l8GBnj+lp+Bmr
 e7SoWR67Q2jbrAq3FNkuz+O1PrC+xdkJoD1mhEv3BWTASEtECbN+m0jxCsZhiktmTh/+
 NCzzaBdW5Iv5iMwVIrFXBsKSDwsZgYjc0lXlTip7G7J+WfuPkgl170gUx/SHp2WUfiia
 0mCXfIKmr7H/GxJhKmx56gY9a7m9OCH9RNXmd6/G+ZgWRmgL50gZxo4GmOS0D87WVkBZ
 UAxquSBCWyw5W15xChEowuGQ6QnkX3gipv0Viwgff7RTfOVirleW2wqLNS5BxBdXNcGc
 am/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782316581; x=1782921381;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FVNkk2krXTfsL59fYbCMYRzONLbzYXEbb1/AnCkaF5g=;
 b=da/UPnGNKjY+ckVTrVOrvPIHrgf8DJPyWO0JiwY05WghXTzZl0WpPBFSi9B2++C2Wb
 ru2IXOsZIgkkxlasQPZb56Myd7UTZq/QjrFEKJcYUMCJhm9Io2cV8ri5rh69ztaEMLb9
 pl3c9BuS7w8ydY2OIeJoLBJG1rWJXmc9s9LcrOraxgPREVff/0VQInCG+GmV1PS2if7v
 +R/CdD1eYIoScoOo6gsKsLpq2Ramy+Wi+gMUzMYfqw/+K5+BtyG7G3EwVzr9cdmoITwL
 ZB4novxqWz+D+NbqEVsajhIsCD7My3KbFjSyK/vv0R/lRRTM8K5VF/9WUV3y7ovQiha1
 lb0A==
X-Forwarded-Encrypted: i=1;
 AHgh+RoKMaCZi++Tbd7aCNz8qorClq2LpMzEjPVttAT+0yfZSj05d4ktnbyaiuMWQJvhbcuxitTFoxzGEg==@nongnu.org
X-Gm-Message-State: AOJu0Yx3L6lgndMmrBhyCpyv315fEsnXt0Ix0Sp5+7pghM+g0qPjrvLh
 lblLiiT6/1eZS8sxkFTS7dQTbFg4YdLKmGTuE3/wwBvncQk+9zSaXNfvPgH1sxHTbciqYwFXimB
 DF2JPlpxHuEKSUKrjUXK84LYQlvQytbJJwyjziTWkTp+z0BOelIEjct0=
X-Gm-Gg: AfdE7cngIvqR6X+/4KouFpiOmAq36SNgpNOJptQgt/sbcbndyqd7kLOJ/8O4G05WAe7
 lU3HD17MEETE1KQRlG7q4MnejMdi4PHdpultxR1AH92UGjO5H4j0eMYksy3Y1H9y/ghJ3zbc26S
 +WFu22cIeM6sO8O96rOPGStkGzAbsSwXMlgMYO8n7YQUmfCrfhiuIy2kNdmv0eVcAbuhBblV/Hl
 YSYVY+H1p2+8AI0c8WaSvUd4nlIeWZNOczl185x9S+5UQPEGr1QxDl5Sm3Rlhg+21EPPQhqFCLX
 Bk75yMudgGFO2aQnIbjVvLmZ8Clfxu5whsfUh46GX6YmC8Hq3j7d+3Nk+OzlR5emAPsBtk2rQSw
 6wJ53IuUyuV00JBgN1iWeUCSvIryIrDKajvCWXVPEGgHcIu/dwlTgWGZUY1QHNA==
X-Received: by 2002:a05:6102:5124:b0:631:4580:6a33 with SMTP id
 ada2fe7eead31-7311552ef6amr2235790137.21.1782316581242; 
 Wed, 24 Jun 2026 08:56:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:631:4580:6a33 with SMTP id
 ada2fe7eead31-7311552ef6amr2235767137.21.1782316580861; 
 Wed, 24 Jun 2026 08:56:20 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c225b2988sm7414995f8f.25.2026.06.24.08.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:56:20 -0700 (PDT)
Message-ID: <e954e6c5-0a93-4fd1-94fa-5014fffd2ef5@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/27] tests/tcg/multiarch/system/memory.c: remove unused
 variable
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
 <20260609214745.772536-2-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-2-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEzNCBTYWx0ZWRfX/TG6dPdHLmtY
 k/grz6w6BESBAzh0pWv52g5FLp8UlMkwt1lPjo12bvxsSxyhPJR0BNLzMP2Awg2ZZ/vjlKtfX/v
 ZtzOSOJc4Fp2kjZ/yYzSw9RQDIRRtMI=
X-Proofpoint-GUID: DYsaT3SwKIjeKfWOp6RAEDyMt0jEudss
X-Proofpoint-ORIG-GUID: DYsaT3SwKIjeKfWOp6RAEDyMt0jEudss
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3bfe25 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEzNCBTYWx0ZWRfXy1yKTT7Wp6Wi
 8NETVnm3QC977sDW5osxkxj2INWxMQ89UtaLSTwXUzDF9az6BLlPiD9Pbuv+MRqTfMl8TLlifOr
 8H+P9FKZ2EGEuimJXqtdsIMl0zAAXv+2Jq+NRsOCufYLZrSoqhcPuW2ac83fI15WeTwJYUx+DXr
 jn2zQ/ZZuZZBCF9wQE1G/wQBbk8uuIgXM60OZGLviROZvipaW/QyIgftmav4YFG/J8DNJTyEBUu
 vxJ1XU5hdBOt8oNjLeQay7OmAPWHQU9p9Nb48Gjfa3oexDFIkqc5hfxzGN0rUQYG9icofIxjZHU
 xs5bDV4wOldpTJarC1b7ZH6oGLVhxV6uh4h3bFrTqf+zDJBUIOnE36gExrw3JNHmockt6gydjLz
 +du0icWmIIzs52V99JbjGyGYCgkGZaEYkZ0gnq2ksCYMg0lFBktJb11jVpdtyj7Q90NL94h8ZCY
 idkO/vmFljBiC7roD9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240134
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

On 9/6/26 23:47, Pierrick Bouvier wrote:
> Caught this since by compiling this file with -Wall, -Werror.
> 
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c: In function ‘init_test_data_s8’:
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c:97:18: error: unused variable ‘bottom’ [-Werror=unused-variable]
>     97 |     uint8_t top, bottom, *ptr = &test_data[0];
>        |                  ^~~~~~
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c:97:13: error: unused variable ‘top’ [-Werror=unused-variable]
>     97 |     uint8_t top, bottom, *ptr = &test_data[0];
>        |             ^~~
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c: In function ‘read_test_data_s8’:
> ../tests/tcg/aarch64/system/../../multiarch/system/memory.c:384:14: error: unused variable ‘ok’ [-Werror=unused-variable]
>    384 |         bool ok;
>        |
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   tests/tcg/multiarch/system/memory.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

