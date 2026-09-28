Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2E2C9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:37:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7nb-0001Ak-W6; Mon, 28 Sep 2026 05:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7na-0001AN-JO
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:37:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7nY-0006jT-68
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:37:26 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9M4uj322557
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bjuz807DvKpMrnQal5FHeW7iEQoYbooNYZ3Q6w06XHM=; b=fB7AkCtTTdd9Er6q
 pc4MLDL5hT/2v2R7vFSI9YZs9ZW05wVmIQrJasXvrGw4ZgnehwvpB6/x51zqZh75
 1I3DJLqhe+SdWiJ0pTKK0J+h2rNJO0HHS27bDUHU4PQhiEW5q8PJ40AT7AhFYWZD
 ckU00bBYZLeR5zcEg0WYf/jWlCeVhb40ZQ/VXtDAKPZbKO6ma2mXBT5FZfmvDIZr
 UGO/zM0qugMgZMe6SpxiUjk3ocugKTvKYOg/z9LP0dcinHvAfYQcKaqoGgRGNmMc
 j39I1Z2IOMSOlcvrFbNujGZnrb46NaTeaXNCeJe4Pelg4eSpsay2BgOAG96V0yM6
 5XBXeQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1grm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:37:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5332e32266aso30924361cf.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790588241; x=1791193041; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bjuz807DvKpMrnQal5FHeW7iEQoYbooNYZ3Q6w06XHM=;
 b=QM3y4+FY2d6o+BwkyEbG7flNZNYwhMBl3RcG9k+RFKcQFkua6WXy5o2nqm96aT409i
 dtE4ZZGu0xgUtj5tAKRiHaZaIZcqxzdl/0JslIBSWpklFjwMvXs2ggn4Xf27hI+niShk
 QxiQeZ6y8UqdWxFNff6obga58vZXeBNMvs+JdnxUCqOBZNVqrNc8NEBCDxdNLsDe6ORL
 YuRu6Qg+P3jA6mkOF0sRwXVm0Ic0hUzOy57pmK9EjkkZcx1U0vnJHRU/SHoNfne9LCBg
 JH2NZqneNxW8w4gZfInAcdKMwkVqmrvo3X0MFSQGKPoAS6uxT3MMAgDDXNCPhnwPQ0W8
 gm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790588241; x=1791193041;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bjuz807DvKpMrnQal5FHeW7iEQoYbooNYZ3Q6w06XHM=;
 b=fY7yBhz+PWu44Pspu0amh+Vt6HDo6WucVNq69LShyOGh28uW0ZD5Qc0QtNhr+S6Ebr
 4Q0HjDG1MobDqPRn9AuYdK7RzoBiNtj3qxKmH/JYeKxw4qCg4LvcDB06IsvjNa2cNGy0
 Q5CS0sJw7cTb+lgAEFmGQo/aKsJgLmdvt8kWjBoYVO8yIX2Bh6RNIkvlNk+ZaYNwhyCw
 FyR3Pyg8PU7d1dK1tkpD2I1vBUCi+UckBiiTCKNBpU0OeUPC/+u+Px3ECuWgCy1slmVi
 Ii9oMZYOCQvSorcHF9CnO7gmaimPMCIH7ccReHPCG5bLLnZ88wtlqn+vIIQdV8zvIsqe
 /Olg==
X-Gm-Message-State: AFuF++kBjOYVr6HcoPn17MyGvRb8YLJzmRmuNaZ82wCAbLT47nbd1Z1r
 Sw1V5WcTfzwvqUcu96EAUjTWpZemt0zOeDlr0aF2dgRlQhZmWfEgnRSWf+EXkb1Axf0Be5yGizp
 xWfipyFZdO8OxPQpRsAsLOR674wPd6Vy/5YdPVJ2f1f7zfu8zUBPT2Po=
X-Gm-Gg: AYBFou0gUKfrLwu4aR4cJXqMzW9dFcoONDk9z8L2THkaycF04T56bfeLu+ZLleh5yRv
 SXImcnQIQN7Sfvx8kn0burmsE0uCWvrkS1dgNd95dOFsNYq7wr/vQp2c4uNt8lly/uRupp1mwwN
 jvBkNTwimgfrZu6VgmTILPPkCqQtR0WEwi+IAHhNgJHp9aVnYuOStyy0HXY6x1wG58RbbJeAyI1
 Hn4qZS0S/0gsUIVY7qnAtFB2QzWz7EBgi73Fqrybtpre8zgsZyP1aSHk8ecZbsYhqSvwhaIWbRN
 ct64bcun/T7GuMID6o1hwI69nd9FcxZmkBVDjGKncMvp+gbFdpIuwthp9SkiFxN2aMC8YulyWV/
 J6Vw3JcQXn1M9j6eePOYgfpbvKTUhso8LjQ==
X-Received: by 2002:a05:620a:19a0:b0:939:3885:3131 with SMTP id
 af79cd13be357-93c43b82c04mr1983076585a.3.1790588241616; 
 Mon, 28 Sep 2026 02:37:21 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:939:3885:3131 with SMTP id
 af79cd13be357-93c43b82c04mr1983073685a.3.1790588241140; 
 Mon, 28 Sep 2026 02:37:21 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a36189bsm25374540f8f.21.2026.09.28.02.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:37:20 -0700 (PDT)
Message-ID: <04b6070e-568a-4592-975d-778227e75f96@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] target/arm: Clear PSTATE.UINJ when taking
 exceptions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925215004.456336-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mf-uPj0llhm0hurLgVXK2aQoZScn3JQf
X-Proofpoint-GUID: mf-uPj0llhm0hurLgVXK2aQoZScn3JQf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX0NN85IqwmeGE
 xBfps9z+HuQHp8wliBQ30It5MyE9paBke+DGwyNNT7W1l7vNAa7iEcny6zxBnH3oLn7izOhQTOa
 6lBD0l2PJHuplCPHafKc3M7JQfpLorg=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba3552 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX+7o4KkHd31wE
 xtJ4kG8BE3tZw7xNEMvrQUxxUEBf+O5jC60kHHGFLiWg3ODyYG4otg4RBEzyraMnNgbYM9KQNb3
 dt6RhKuuIgJaMhVOpNqqvD3E6DMDxqA5oQz5CkBj4XHo0NoZ84uVW51+bFdy3Q3/KoQ9jNLHN5W
 Y0R1yMr31aavFKpygkGpYtXez2PncVzx0Q7zcM8iRCEIy2rC9VY1nUOMwlIN7KnAM4B9h65jMSM
 gpzHfUSHhBAVqCVa+ggs34+HTqJ+P2LhCN8PFRo7OppxLP8K6KmNPP1W7psTdzFwVLOmxCfHoHK
 gLJjjv/85N8U7/Tfno9a2YZChRHCnC6ju1jX7ruMCLJJtmSSiHF4tccTQupRM+NthvnJm2klZGP
 D+6EVMQN4oms883ZVYNFDBIoDf1OkB47rdmFDFt9xcEXWP2/r0v4bk+BF4XMEFqtedysu9KRKhn
 brqEj7rbbdI6obTOojg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280038
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

On 25/9/26 23:49, Richard Henderson wrote:
> Clear UINJ when taking an exception.
> Clear UINJ when exception return is invalid.
> 
> In both cases, perform the clear without feature check,
> since the bit is otherwise RES0.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h            | 1 +
>   target/arm/helper.c         | 9 +++++++++
>   target/arm/tcg/helper-a64.c | 2 ++
>   3 files changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

