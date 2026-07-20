Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAA4C44520
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 16:55:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlrGb-0003Or-GU; Mon, 20 Jul 2026 12:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlrGO-0002x3-6Q
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 12:54:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlrGK-0004wm-9S
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 12:54:42 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KGNvY02861030
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 16:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j6WByNvtdm7SBIMKEy55zZIbZEBxa6JI6/a9dEMjRek=; b=mNR23oDo99A4+41U
 mpxbjxKcdaqmDQQkTfh6RXpNR/aGyXK39PEA3EDLtI3YsG2lyfBoKLl6w9lzRB5n
 oftDfgstwC1TlVkIbIb1e2TaKui4r8cn+RjTpn1k8Kd5fWx+0elXug2dab37YjQM
 otGuecQ32/09p3Hi2GjU0p4JfdqsxsEiUkHXveLvgT/RjVJvSWC5ZrO0saMxH+sP
 42eQZnHAIWt7qFFvG9xleKGwPcAoacdnwCngsZF3YOMkaIPAlPjVyf12tE/yGIq7
 mbFBJFLYkzV2dkhyICbSVWFj91jFCwNzwNoI6oLMavq9hp6/l7gQzHGdhhPKaT8m
 0gzzGA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y2091-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 16:54:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8f1e4e0eac1so179398036d6.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784566477; x=1785171277; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=j6WByNvtdm7SBIMKEy55zZIbZEBxa6JI6/a9dEMjRek=;
 b=bwf1ZyMJ5zvXx7N5cmwAJXNk1hzI3ogReOucFLqgloIZyulMh5fqV3iycn9hkD5wQM
 oOtO5Jiz3HvAXKUd6hvaTft7JPdoxuhjTGz+wsKskHV1oybyZAigth6ytHlNMN3PkUXh
 1nLYLNQk9cfzL2B2ANxJ6AY25KovbKacvJ6gxKDNS5q9VEcCy0tehOR432SAprBT30US
 CwVr4BMxnC1aXUF4Bb4pl51YFGM1/Nc0E8hIGQxwBW/4zTdxVHlTPutIdBGaMEsoz4tz
 QN3BbLTQOtqo922z/mL7pPUpmcdEhT1mGzv7n9F8CiKX1vpH1+4kYokY0p6xR23lQRyp
 z6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784566477; x=1785171277;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j6WByNvtdm7SBIMKEy55zZIbZEBxa6JI6/a9dEMjRek=;
 b=pF0G8nng8C9/BruWyLhuqtj5JPnHjamjH9Xf8R98rCE81U7TyjpMQkmMpoQDUDzgnL
 hq+wRE5cPe8YqNz93OSKoThbDbOVpIVszC6aY9+sw5g7g4Bb2OIZGf4FFFiLx/WO1z0M
 jtcIBZ93QL6Qgg4epAMXJh3moSm2zmD9QgfR9dO10zA0Yq/DZD5DknqtJZoJ94qTdnqA
 FZuu8r4TjPjqYkS4uCoKCIwhyfiLPLXnk7i8eHEjpS4eT106qR/zNnralm/Mo9ryC5Jd
 usgqTAzFnZptzso8wMK0r8DlH2imF/PlYe2Vudj8ostGv3sVMt5GkbjNRh2CkuclssCf
 rZVA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoOyCeQQh4oCZleYgmEr50P45yAlV1JTosSYn2o9hvcN4qysYg/2WEsc/UICWz5+32rcNT5fACb6Q==@nongnu.org
X-Gm-Message-State: AOJu0Yztzo373YoxK/Z1wizy+1Qc/o/lEeqoqYtJd7n4GoZFO+dsz7NR
 KWuglv2F8NniasV+jvvRiol81cPqek0bJoE9aSPVroIsSpmKEAkb0hHoyImz5+Uo7xLQr2gGliT
 Nne5VqzWtX/xGKgnudvF+0INqFeuIShVtR5daWHH8q9hAoN78HJikDzY=
X-Gm-Gg: AfdE7cmv/qPUwfVDCjJT/XWKPbfm8ly5TdNSf5X9o6K2JLLUoi4cklAezRd5vKFzVe4
 HsHrSa0g8JWfLj8ZBtniFWg6cxBcoZdQVtUPVsURvEPYwUo9dyd+suKXoysd+KTRfQQ+CZHBf78
 wwjojDuzeC3a8sk2ul0+0j1plONxoIbJI+BEUFKVq9VFMPFbxOcwfRBdYMLeoEOlIVaWjjH3O9v
 uEgj27LVxE6yNx6dwv4+ygLRLjiDVIi2XrtkgwuFyqJMIpQkKtKyadEPFDgo376j2irbbjjqlr+
 TXIFYP/6OXXkHGvcSVNj8y9SXA4dNc8SG6iMuoK+nVPxS9X1ZxjSZP/1wpbrgblZTxGLaAMpeC1
 DLYlv36rN/Qa4po76ckyAN+WYv/fMXK1x61sqJjq8srAKD36rhxs=
X-Received: by 2002:ac8:7c51:0:b0:51c:1a17:eba0 with SMTP id
 d75a77b69052e-5213bf113edmr143456631cf.2.1784566477212; 
 Mon, 20 Jul 2026 09:54:37 -0700 (PDT)
X-Received: by 2002:ac8:7c51:0:b0:51c:1a17:eba0 with SMTP id
 d75a77b69052e-5213bf113edmr143456371cf.2.1784566476662; 
 Mon, 20 Jul 2026 09:54:36 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49565373608sm3036785e9.6.2026.07.20.09.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 09:54:35 -0700 (PDT)
Message-ID: <88b9f64e-6973-4a23-bbf8-0c1c89490705@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 18:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/aspeed: Fix remaining hostname-specific
 login prompts
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, kane_chen@aspeedtech.com,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20260720162321.3497633-1-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720162321.3497633-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE4NyBTYWx0ZWRfX0AfgSEvShxvp
 pfJ2b5bvesgQwmudyPpOe54cgHLlPbII1iTgClvdf+ipUeW1qE14EtV347IAAyhCQtBXhwwOdqR
 FfqHpHEZgydceyph4qrvbg941PBGWUQ=
X-Proofpoint-GUID: xWwkDT7i7T-9CpzrVmQu0j5EwShoYJ8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE4NyBTYWx0ZWRfX922K2LbnGDUN
 BA+6s5qUZNoN4k9A/ERyZBsB0hcNgTiJWMgP/ydCt6qJGFwNQ0eOHR69p84AV0+zmUCTmqLkYo9
 +eMu4jl52dfaxbv3UrZLi2rk3DdTB06lZkDT0W6RzReS0o7x7bopuMiJAOilviggH6z2T5Io0kn
 Om9FI/MBucmxDaR2vdKTUc0UcG8n1FAf/mRQ8PgoF/1pBy8EtWAlsRlki/PXJ9TU21k92oOP/4w
 SDIZdr/dR1XsjQTep9GJd6CIhpdN989afgoivMBc1PiaQHY5Yoxn4gzccau1aOzFBs0RgClhQNy
 pt3SBlsarNYwlV0Qy9e+2ZGtqDpFnxbZpxhBnntX6BXuTT4FmVGyZJL/3glo7x9rFqScRhN5mUa
 WQC1s5FGhvZBBr95Dy3vSEwUYSSNUco6KXS+QWfOl6BpvHBk+quBok2WDKUyCpWKDjut2QJDUtF
 5Sff8itRJZypdXUkfjw==
X-Proofpoint-ORIG-GUID: xWwkDT7i7T-9CpzrVmQu0j5EwShoYJ8N
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e52ce cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=p0WdMEafAAAA:8 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=iZMnFt_wduKxj3JA-rUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200187
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

On 20/7/26 18:23, CÃ©dric Le Goater wrote:
> Commit b04746bd0d7c unified boot completion detection on the generic
> 'login:' prompt but missed several SDK test files that still matched
> on hostname-prefixed patterns. Apply the same fix.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4059
> Fixes: b04746bd0d7c ("tests/functional/aspeed: unify boot completion detection on 'login:' prompt")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/aarch64/test_aspeed_ast2700a1.py   | 2 +-
>   tests/functional/aarch64/test_aspeed_ast2700a2.py   | 2 +-
>   tests/functional/aarch64/test_aspeed_ast2700fc.py   | 2 +-
>   tests/functional/arm/test_aspeed_ast2500_sdk.py     | 2 +-
>   tests/functional/arm/test_aspeed_ast2500_sdk_515.py | 2 +-
>   tests/functional/arm/test_aspeed_ast2600_sdk.py     | 2 +-
>   tests/functional/arm/test_aspeed_ast2600_sdk_515.py | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

