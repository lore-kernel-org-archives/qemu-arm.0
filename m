Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C76CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNw6u-000530-HJ; Fri, 15 May 2026 13:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw6g-00051D-5s
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:13:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw6d-0004vE-Qz
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:13:49 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FB1qN63670906
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zaAZsKwyExsTVuYnppXhfWmWphgFoAtj22CtUA+bqnE=; b=Ec/px3RUSLT29JEv
 PHlZuMcxBvEHP121SIDIY+yvfm2gsKbn4kOj2VtJ1xK9HLr1NP8HRs/U5YmH6ebm
 TGCIW3wjcssxS8s7QzWQ3whOnu7xlLe4lFAPnn2MO65619RJAQijeVz7UdC8e874
 kGx2bGtXLqe10oCBXtPrfoHEJ1jMfWnJwS8WuVxQz9PsDrRgRXSWCueCkF3cmMlX
 X6n9Qvh5BFuErX3gEXWVh8VZwPOsEhbWLdlbN9i4u/uKAb0b9rH6F1eyvoPGoX/u
 wVjjK2WuOqLK+eVqXBlmyhRJ7JOTvzL0vr3T2q+WqTdjmzh4nvuCLkwyY/fapwK9
 jEXRmw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s47eq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:13:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2bda35eab74so990830eec.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778865226; x=1779470026; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zaAZsKwyExsTVuYnppXhfWmWphgFoAtj22CtUA+bqnE=;
 b=OLJsxIBDX6/xgmXbpDlSdqerStPoV0iaSN/YkhLEgbxoKqfKz43tRD1KZh0zBiX+ZL
 XJtgrQ+ghuIak1hAG9M6unG4Bk8Uj+6FanZynC/texW3zqKnKN2Ge1ajjkbNGjk+oKBu
 h9WhYk5iEBszLIlhOUNpNtKl4YtKUeWph27BZ7afeQgCdbEjSl3lkk5yQrJZFhhpvVVD
 CJyK6+HAVWMY2jmkZxnyCqGwchWww1MalwTE5qixQCpFPO2WQVXtrDUtMh7Dmq+1UfF+
 ESoCUnhtLL8wQ1Rjf7MSYZ/bRlhnenmKTyefKQnQ2940MVWeyta0TvsUBevKiUCTpLI9
 pBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865226; x=1779470026;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zaAZsKwyExsTVuYnppXhfWmWphgFoAtj22CtUA+bqnE=;
 b=sfEXvEQZuz6GXPrNWnJMQ2rRT682H/z6e2hID0q5SbkIgPZbVWxLsT3Vee/wRpglcc
 W618At7YGj744NnQf2wjhVuqSNlllBKKnGPFIKfUwCXPo40E5G+f/r14cL168NKz8xfZ
 XE0AizL1J3VCJh0klVCXoRX2F/nRrsaxfGSf8plnZ+pEBAmHAMKTDJsWOCcD8gGtH8M5
 PCGxO5dK4Xae27awbeUhpjb08SamL2nH7FgWNUDkHVd4C8VCnfNE0bUUxw2HltGKMYzu
 cGHa1YrEjGQ15R6XSC1CFMW5erq8ya+goC6oGb0yUvUj6JqiBhFFAGLYl8L5XvtYjhKA
 WZxA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+aM0ScAhzwz4pHKvNvIkGIz79rTMsl2A1TsytuM89c39NexJgQVL5RlqQZl2aRwwklJ/PSgS1+4w==@nongnu.org
X-Gm-Message-State: AOJu0YxatlrWNK6ANlHg6dmSkW1l1MFiTg1g4cWCTis57mUNNMTDg36l
 z44bG6r2aw6gBIIZGsIFPQ1QQ/7bxuClTT3lAtZy1AE1MBFXAEFGPV/YZTauq1msiIJhu/I7Dwr
 HaBtTQEwB0Th6fZj9V09wlMsbjCwoeWBS6XdyRuwmkkmqDDtluExlgz4=
X-Gm-Gg: Acq92OH06p55NoIrSG9Hu5EyLBA/tR7zsjik8mD7LleMnrMNnGnxk8b79khDBVSWKYZ
 5JfHs3N2aakfjye6pYBI2ZCdDacQBiBQVKQ1AiM487BOV8fyhCj7srHd0QP/gddisoa10+w3yUC
 eGueQgiAQe10z4K+ChFEUO02HoM4FgTm+T5IZm7WzteNZtdr4j0JYKEwNa1IbLVcApLg9iW1/kP
 63ykgkLbvAl3jLbXIp7cNXXxdc9ZhsmS1WIsPNiQNzmV6f77yFGRR5sj4/7v8dqNRZXtBal/BZS
 YUaviZgzqvE74wvKGTULHNbYRFmw/ZS+nS73yB4eKl2Y6x0zNnHWCDbqyrjmbXJ5LyReTm6dE9J
 VjHXgzx5t91z3UJ8XvoMWytdGbFeZLquanz15Bhx0RBeMY88Qs6Ua5xj6ZcMqmUm7ZHgH35fCbZ
 JhubrGM2SsG2c+8A==
X-Received: by 2002:a05:7300:dc8d:b0:2d9:1c9d:fc22 with SMTP id
 5a478bee46e88-3026302f90fmr4810932eec.21.1778865225378; 
 Fri, 15 May 2026 10:13:45 -0700 (PDT)
X-Received: by 2002:a05:7300:dc8d:b0:2d9:1c9d:fc22 with SMTP id
 5a478bee46e88-3026302f90fmr4810909eec.21.1778865224708; 
 Fri, 15 May 2026 10:13:44 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-302973bcd0csm7870799eec.24.2026.05.15.10.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:13:44 -0700 (PDT)
Message-ID: <5556b33a-0405-4688-a20b-09e80fb18f07@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:13:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/20] target/arm: Extract common code related to 'max'
 CPU
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
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
 <20260515141032.3271-13-philmd@linaro.org>
 <e11a2547-8d2d-403a-94d2-3ab5e35dff77@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e11a2547-8d2d-403a-94d2-3ab5e35dff77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfXwOpk3x9ls6mg
 Wg4hMefO+Q1kOoMhoWIS4TSAewYpuh6morqNYDmpED5ADr9ZOgFHIBe8tgYTAYiBUtlwwklXukX
 I3PdZaNCxiROFlyIORPtLZyTg1ovtMwbw5wu6QkNISNMiJ2KLnv4oy0HXrHza/elKFob30FYfJz
 DuGYKfOwd1X6okCO1Sj/cjKTBMC1J7N/QiNXHnvkMX/8OfIQie6H3KxNXJZNVmQKtqUtJBEvmhO
 m1i164+UiK0Vv5lOecHzzAEA9+uucBZ7fCMhBb3amduxX6Wf20N+9DoNAaJjaJjP71nX7tjQ/yK
 xreuH+5xPC9zPC5RshSAag6CUY6S5TlN4WtBgmGYqtKcSIGmyD4qp2b+YGy0eY4piFPv2izN+SC
 +QgCfALNisoORE7W0nUeDxzxyZgi1FnY1rQlkDs52VOFunUZ0J8HJbee25G2oYjfzUjGNrF2iZt
 bG7cexcpf4aS1ynlsWw==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a07544a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=d78jJa_eLNz9I5sOdwwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -0UmP8c1X9MVsGWZ-8SUeptmB4UOHEAl
X-Proofpoint-ORIG-GUID: -0UmP8c1X9MVsGWZ-8SUeptmB4UOHEAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

On 5/15/2026 10:10 AM, Pierrick Bouvier wrote:
> On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>  target/arm/cpu-max.c   | 106 +++++++++++++++++++++++++++++++++++++++++
>>  target/arm/tcg/cpu32.c |  96 -------------------------------------
>>  target/arm/meson.build |   1 +
>>  3 files changed, 107 insertions(+), 96 deletions(-)
>>  create mode 100644 target/arm/cpu-max.c
>>
>> diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
>> new file mode 100644
>> index 00000000000..9fd48ce46e2
>> --- /dev/null
>> +++ b/target/arm/cpu-max.c
>> @@ -0,0 +1,106 @@
>> +/*
>> + * QEMU ARM 'max' CPU
>> + *
>> + * Copyright (c) 2018 Linaro Ltd
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "target/arm/internals.h"
>> +
>> +/* Share AArch32 -cpu max features with AArch64. */
>> +void aa32_max_features(ARMCPU *cpu)
>> +{
>> +    uint32_t t;
>> +    ARMISARegisters *isar = &cpu->isar;
>> +
>> +    /* Add additional features supported by QEMU */
>> +    t = GET_IDREG(isar, ID_ISAR5);
>> +    t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
>> +    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
>> +    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
>> +    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
>> +    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
>> +    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
>> +    SET_IDREG(isar, ID_ISAR5, t);
>> +
>> +    t = GET_IDREG(isar, ID_ISAR6);
>> +    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
>> +    t = FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
>> +    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
>> +    t = FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
>> +    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
>> +    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
>> +    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
>> +    SET_IDREG(isar, ID_ISAR6, t);
>> +
>> +    t = cpu->isar.mvfr1;
>> +    t = FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
>> +    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
>> +    cpu->isar.mvfr1 = t;
>> +
>> +    t = cpu->isar.mvfr2;
>> +    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
>> +    t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
>> +    cpu->isar.mvfr2 = t;
>> +
>> +    FIELD_DP32_IDREG(isar, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
>> +
>> +    t = GET_IDREG(isar, ID_MMFR4);
>> +    t = FIELD_DP32(t, ID_MMFR4, HPDS, 2);         /* FEAT_HPDS2 */
>> +    t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
>> +    t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
>> +    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
>> +    t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
>> +    SET_IDREG(isar, ID_MMFR4, t);
>> +
>> +    FIELD_DP32_IDREG(isar, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
>> +
>> +    t = GET_IDREG(isar, ID_PFR0);
>> +    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CSV2 */
>> +    t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
>> +    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
>> +    SET_IDREG(isar, ID_PFR0, t);
>> +
>> +    t = GET_IDREG(isar, ID_PFR2);
>> +    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
>> +    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
>> +    SET_IDREG(isar, ID_PFR2, t);
>> +
>> +    t = GET_IDREG(isar, ID_DFR0);
>> +    t = FIELD_DP32(t, ID_DFR0, COPDBG, 10);       /* FEAT_Debugv8p8 */
>> +    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 10);      /* FEAT_Debugv8p8 */
>> +    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
>> +    SET_IDREG(isar, ID_DFR0, t);
>> +
>> +    /* Debug ID registers. */
>> +
>> +    /* Bit[15] is RES1, Bit[13] and Bits[11:0] are RES0. */
>> +    t = 0x00008000;
>> +    t = FIELD_DP32(t, DBGDIDR, SE_IMP, 1);
>> +    t = FIELD_DP32(t, DBGDIDR, NSUHD_IMP, 1);
>> +    t = FIELD_DP32(t, DBGDIDR, VERSION, 10);      /* FEAT_Debugv8p8 */
>> +    t = FIELD_DP32(t, DBGDIDR, CTX_CMPS, 1);
>> +    t = FIELD_DP32(t, DBGDIDR, BRPS, 5);
>> +    t = FIELD_DP32(t, DBGDIDR, WRPS, 3);
>> +    cpu->isar.dbgdidr = t;
>> +
>> +    t = 0;
>> +    t = FIELD_DP32(t, DBGDEVID, PCSAMPLE, 3);
>> +    t = FIELD_DP32(t, DBGDEVID, WPADDRMASK, 1);
>> +    t = FIELD_DP32(t, DBGDEVID, BPADDRMASK, 15);
>> +    t = FIELD_DP32(t, DBGDEVID, VECTORCATCH, 0);
>> +    t = FIELD_DP32(t, DBGDEVID, VIRTEXTNS, 1);
>> +    t = FIELD_DP32(t, DBGDEVID, DOUBLELOCK, 1);
>> +    t = FIELD_DP32(t, DBGDEVID, AUXREGS, 0);
>> +    t = FIELD_DP32(t, DBGDEVID, CIDMASK, 0);
>> +    cpu->isar.dbgdevid = t;
>> +
>> +    /* Bits[31:4] are RES0. */
>> +    t = 0;
>> +    t = FIELD_DP32(t, DBGDEVID1, PCSROFFSET, 2);
>> +    cpu->isar.dbgdevid1 = t;
>> +
>> +    FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
>> +}
>> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
>> index 73d21c6cf7d..919ed8a6cf8 100644
>> --- a/target/arm/tcg/cpu32.c
>> +++ b/target/arm/tcg/cpu32.c
>> @@ -18,102 +18,6 @@
>>  #include "cpregs.h"
>>  
>>  
>> -/* Share AArch32 -cpu max features with AArch64. */
>> -void aa32_max_features(ARMCPU *cpu)
>> -{
>> -    uint32_t t;
>> -    ARMISARegisters *isar = &cpu->isar;
>> -
>> -    /* Add additional features supported by QEMU */
>> -    t = GET_IDREG(isar, ID_ISAR5);
>> -    t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
>> -    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
>> -    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
>> -    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
>> -    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
>> -    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
>> -    SET_IDREG(isar, ID_ISAR5, t);
>> -
>> -    t = GET_IDREG(isar, ID_ISAR6);
>> -    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
>> -    t = FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
>> -    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
>> -    t = FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
>> -    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
>> -    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
>> -    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
>> -    SET_IDREG(isar, ID_ISAR6, t);
>> -
>> -    t = cpu->isar.mvfr1;
>> -    t = FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
>> -    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
>> -    cpu->isar.mvfr1 = t;
>> -
>> -    t = cpu->isar.mvfr2;
>> -    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
>> -    t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
>> -    cpu->isar.mvfr2 = t;
>> -
>> -    FIELD_DP32_IDREG(isar, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
>> -
>> -    t = GET_IDREG(isar, ID_MMFR4);
>> -    t = FIELD_DP32(t, ID_MMFR4, HPDS, 2);         /* FEAT_HPDS2 */
>> -    t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
>> -    t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
>> -    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
>> -    t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
>> -    SET_IDREG(isar, ID_MMFR4, t);
>> -
>> -    FIELD_DP32_IDREG(isar, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
>> -
>> -    t = GET_IDREG(isar, ID_PFR0);
>> -    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CSV2 */
>> -    t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
>> -    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
>> -    SET_IDREG(isar, ID_PFR0, t);
>> -
>> -    t = GET_IDREG(isar, ID_PFR2);
>> -    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
>> -    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
>> -    SET_IDREG(isar, ID_PFR2, t);
>> -
>> -    t = GET_IDREG(isar, ID_DFR0);
>> -    t = FIELD_DP32(t, ID_DFR0, COPDBG, 10);       /* FEAT_Debugv8p8 */
>> -    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 10);      /* FEAT_Debugv8p8 */
>> -    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
>> -    SET_IDREG(isar, ID_DFR0, t);
>> -
>> -    /* Debug ID registers. */
>> -
>> -    /* Bit[15] is RES1, Bit[13] and Bits[11:0] are RES0. */
>> -    t = 0x00008000;
>> -    t = FIELD_DP32(t, DBGDIDR, SE_IMP, 1);
>> -    t = FIELD_DP32(t, DBGDIDR, NSUHD_IMP, 1);
>> -    t = FIELD_DP32(t, DBGDIDR, VERSION, 10);      /* FEAT_Debugv8p8 */
>> -    t = FIELD_DP32(t, DBGDIDR, CTX_CMPS, 1);
>> -    t = FIELD_DP32(t, DBGDIDR, BRPS, 5);
>> -    t = FIELD_DP32(t, DBGDIDR, WRPS, 3);
>> -    cpu->isar.dbgdidr = t;
>> -
>> -    t = 0;
>> -    t = FIELD_DP32(t, DBGDEVID, PCSAMPLE, 3);
>> -    t = FIELD_DP32(t, DBGDEVID, WPADDRMASK, 1);
>> -    t = FIELD_DP32(t, DBGDEVID, BPADDRMASK, 15);
>> -    t = FIELD_DP32(t, DBGDEVID, VECTORCATCH, 0);
>> -    t = FIELD_DP32(t, DBGDEVID, VIRTEXTNS, 1);
>> -    t = FIELD_DP32(t, DBGDEVID, DOUBLELOCK, 1);
>> -    t = FIELD_DP32(t, DBGDEVID, AUXREGS, 0);
>> -    t = FIELD_DP32(t, DBGDEVID, CIDMASK, 0);
>> -    cpu->isar.dbgdevid = t;
>> -
>> -    /* Bits[31:4] are RES0. */
>> -    t = 0;
>> -    t = FIELD_DP32(t, DBGDEVID1, PCSROFFSET, 2);
>> -    cpu->isar.dbgdevid1 = t;
>> -
>> -    FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
>> -}
>> -
>>  /* CPU models. These are not needed for the AArch64 linux-user build. */
>>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>>  
>> diff --git a/target/arm/meson.build b/target/arm/meson.build
>> index 5376be2e3bc..3e02941d0d5 100644
>> --- a/target/arm/meson.build
>> +++ b/target/arm/meson.build
>> @@ -9,6 +9,7 @@ arm_user_ss = ss.source_set()
>>  arm_common_system_ss.add(files('gdbstub.c'))
>>  arm_user_ss.add(files('gdbstub.c'))
>>  
>> +arm_ss.add(files('cpu-max.c'))
>>  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>>    'cpu64.c',
>>  ))
> 
> Some bikeshedding: maybe name this cpu32-max.c for consistency?
> No strong opinion though, just a feeling.
>

Seeing patch 16/17, forget my remark above.

> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> 
> Regards,
> Pierrick


