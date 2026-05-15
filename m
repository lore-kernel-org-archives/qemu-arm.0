Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4737ACD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:12:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNw5F-0003Bt-KE; Fri, 15 May 2026 13:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw56-0002pW-SU
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:12:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw54-00041D-Rn
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:12:12 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FGR3JG1831345
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ov2RykwIjmD63MgXJ6jCbbzGf/DRgSVGqdHFa/EULyw=; b=ku62CnQIS577wmdc
 bC4RPyX9msJuwroknAHrnVsAo3HNY2nbZX4mkexXSrqFT0wbDfv+rvikG0XhhW3P
 lkhQL+HH7/gfmY1sBiKF8TyQLARRRNQOhVnJeW7ZEko7J/kuDRXx/8YSgaNP3g5L
 8/ySXmhiysZrEB1NkQA+BVlr9fIir36An0OCjfJyZvoW0EZ0beXOPx1OMPybq8Xf
 +JblE6h9A1Nn6m1Y16Lj8Skbn9GkD2AkXS1Ll3ATdwK6wgkk+KtV8RG+SyiOm6MR
 d1PtNue1IM5OB0mTJlgk3pQ4Z8ZW5WkjTAGSux/XGcUt3E/8qvtkr1tsyvoLUgtN
 aq2cEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6715054r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:12:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2eebb099efbso445645eec.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778865129; x=1779469929; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ov2RykwIjmD63MgXJ6jCbbzGf/DRgSVGqdHFa/EULyw=;
 b=e2o3fzCx5gU9t3WvXPHdDVrWRmBrJRF+tFjojA0PTSaj75KzEIXQc3Wm1yaJ6IthyX
 th44sk6FR6kAKcUpkd0TdBsDSOO7BiiUh8WHPjEHV9OTnb97RB3Uc/RrjqGVMKZVwlnr
 i0TVUtCx02ekDdclOSq/6X95V+ckq8DrFSF6xveQQMw2QBwmybnVl4ikn0Irrea3X1Cp
 GA0f2vNRxVa5FMqqIucx5s8XRrYb2sgcoOkdp51w+aPbWwfHrhhJVtGNiixeCxfl0FVe
 eDi9ZQ98clXLrQPcbbR8WuV5PjM4vxmCqX6HUH+0l9GV1GPkkMInSB3MSkHqvA6J+Gds
 020Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865129; x=1779469929;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ov2RykwIjmD63MgXJ6jCbbzGf/DRgSVGqdHFa/EULyw=;
 b=kakkedQOBgihuNuY+ZKQIJBv/bKlGWSgchM1uRVCncEELm6nOEFm+KfwEGfug91fQ7
 BX1RlLhqai0vwHHPbSXuHrfPck6rf1Mad4+2qOLMDgEPCd82qh4TBJYiCIuG+aF4WMgE
 t/HkDG7JXdfYREgFVGrmqUFZaYpvbnG9NVIBW+ngMqQVZtTB8f75pAQ0qjLsCtnC+d7e
 s3CzRu1wS3FMG2wEhkKXqvoNWsBEvSMvqC2LngaBCJaqQI1cpDVgL00/6f6j1gX31iua
 WoM3xz/ro4LoyeVKi/Xm0GSZQ/LLwommKUP8ulTj34li+xkt4MGKrN62kXxn7aJp8XGt
 Z8TA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FzoDAZ6/OndJ/xfETogSzr7oMZYieRGSFOyJjtl2Vm0SGTrxQweZJy/IQQdVf7fFacerVdWdKyA==@nongnu.org
X-Gm-Message-State: AOJu0YwhJEcf6qA+XgIsQkZbgmFTEY07DcEJ+CvhEuwRVa9FhEBAZvzY
 OE387BVrPcXoNHc7aCJjnXjUfzMp2Lr7tsqdBJ9dc3hSLfb3RrvTZpHtKMkoQNpg8ZjjgFE8WUG
 6DERb5DKiIzqgCjG4f5+wiVXvhC11Q0VP0QKU50JIKNM9cesx3DRSzj0/FxlxXrj/hQ==
X-Gm-Gg: Acq92OFmqCuweaEnde8/tcNBH23tuXN7GovXRiY6gHhGiiwTt26zQe4KZn35kFWxx7A
 RSWGtHxp2gx8n+oC6gtXaPtl/BmdcDLhS8TpHfhhO4IE6TlSYYDgckcSQjounYdDjSobIQTAN0v
 wphsUgHUwWlNCMW2mOLYthgJG8W4kEMg2yi3+NJqZwkb6rTpba7CCHUSmooAj856/UUpkcJvG+3
 a1nyM4E8r6U7QUsH44sfu+5XKnREJryZw7Sh3QZW4mLoGUXtvLPi1cpudGUielS+9Vjpw2D/oKP
 TQq1qMC4u7yIXZwYDAEEVWN2o/q/FcY0ex5sOkqZtTp8Bsj/So+bnJGWdNwqDyaCAYJqq878ID+
 Hm2MrZZJzs+kgAxcCPHSBgDpwu5kW11LQpoIalU8hL2ICZQ1CA0czguosH9HS9ln8jDE+oAPtqR
 OxamLI7E1ibDAAew==
X-Received: by 2002:a05:7301:1001:b0:2e5:5bf4:8869 with SMTP id
 5a478bee46e88-303986771bcmr2477280eec.21.1778865128860; 
 Fri, 15 May 2026 10:12:08 -0700 (PDT)
X-Received: by 2002:a05:7301:1001:b0:2e5:5bf4:8869 with SMTP id
 5a478bee46e88-303986771bcmr2477264eec.21.1778865128415; 
 Fri, 15 May 2026 10:12:08 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30296dcb6f6sm9030709eec.17.2026.05.15.10.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:12:08 -0700 (PDT)
Message-ID: <9a5c6915-e72e-4db2-8e31-de71c7084cad@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:12:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/20] target/arm: Factor aarch64_aa32_a57_init() out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-17-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfX7BsaREMBAqnz
 N0PUkURmSxsV0XtNxkv1vhbE/A60to1zSLNXSSyidWqFNwsOwbrmcKOJFpZeBEudVjz0LTBIJ6e
 6mZ0EX2U5VCDQE8bxy/A/br0scPeIZHX9h9o3IYquGSu2lknC0iVuqCSiYIwSTeVSFPkxd6Qj63
 Fs2rhbaCh+oQho1s8ESMtzQke7q14BvcmeAKNRZQUxo88di+9oyQ91PpUvBwNt9tqkkRZWX8or7
 NmM7EaXvKSXLlaRgzp05X6bBdOwPstN+/V/2d6Zsg/Owbju8/VZn7b0K6LiAfwj8wWtJNJpWJEc
 K5LbIo8kCxwLCdT6EI7wbW8gKNgeouAGytZUfMbpbC3d2OhVPVXXnYJ1s7ZXoxk3s1/zKFMaBWu
 VhvrxTcw0T9nw6RxuVKiMgeuxUwTRm8DF39wVQxKzYseaRAYzjHPLfapUsAL33MbBxvIJEWa7ew
 FG3tyFw4c28ySxsMbbw==
X-Proofpoint-GUID: nS9M_I0imiiu6Rcqbty-y0Md1wpMz59q
X-Authority-Analysis: v=2.4 cv=I+ZVgtgg c=1 sm=1 tr=0 ts=6a0753e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rbyInfs_dEf9pKcPEIIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nS9M_I0imiiu6Rcqbty-y0Md1wpMz59q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150175
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> In order to make the following commit easier to review,
> factor aarch64_aa32_a57_init() out of aarch64_a57_initfn()
> as a preliminary step. We only add a %aa32_only argument
> to restrict AArch64 features.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/cpu64.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

