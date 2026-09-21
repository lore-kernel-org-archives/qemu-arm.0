Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0571C982E1
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 14:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8f2o-0005py-R7; Mon, 21 Sep 2026 10:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8f2j-0005RL-Qi
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:30:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8f2g-0000ra-To
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:30:53 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LEGYCi1891034
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y9OO6CTPohkbDZoVhWgc4ePmrWMqq/SXb29vlujd38I=; b=anuSQOAMnx+oxlRI
 w8n3BhXlF2mf734FRVbTdZ4HwQpbV9DJp9GzM0bwQUcA4JT5s+jAfTaUiaNY3nog
 5ElXiibcrW9JjMeNAOrlA+SClwuBMHPZN4UK5SpULzC2dzIHHgW76CsgamhHcLBo
 5V4R1gaFB7MSEF6CC0TDF1QTkXFf0j7U5o1JQ85t+J2sx6wynUG1ghU6olUZAdNT
 u3wRIFmGvG29drZ/DFGtd4ZiMjqc+vwzCEDlZWzXxPOIo6hPlWpOBN+64+fh2dGX
 S8Ft0QZeJl10nzEM8/Mx+Jx/04E5VbiRC3Y65JMRKhVlKpvTW1D6id3P7Liz1tNo
 FJxjOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d1qd5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:30:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-79cdabf7d89so3249309137.2
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790001049; x=1790605849; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=y9OO6CTPohkbDZoVhWgc4ePmrWMqq/SXb29vlujd38I=;
 b=KGBqZ79wiiTnpYMdouD8n7zaQw5wGgfDfCXjGi90cpPEzetLX3/55k8hoE3IoeH6vg
 kao1FSUbldHbFePdacviZqJ63B0v/mUEEgqSFf3epdB3gQsjicPK2YxETo9neealRSNo
 19JRt/o18FE72yX6P5pD/Sb9hj5PiLq+Y7fLxWtYNL1TmnsHZ7dXv3MqspB+gn2xpD0d
 LPl4SfEjxaenCbSww3LiFXR0hGwTlvekMAndGjy/CIWBCoFBehRkcHxwIImhPIRYsT7c
 BLUvzXivjRuJLtHnpbIfGaDEKgwstQu9W6yRaB8LkK8vqyFiqidQY0kSmbNbufWw8cm3
 aNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790001049; x=1790605849;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y9OO6CTPohkbDZoVhWgc4ePmrWMqq/SXb29vlujd38I=;
 b=l5ZF76rc1HJcD+NWDxxKxSnvaw2eatHy1k6hB/Wn9PCNRDJf1kPZrF1c3kqDr3XcLf
 S3+RlDWPOPj8qH4IGtz9qWGA8R8avmOWaFqy5v3MbhDrtx7jsU+3T8qHMVOYfBnt6+zm
 uriRDCd8h34f9W7DoRFZiIc6cgZ0Ws4E61DSpqkKRDzcAXHJEcLKX5q1mPLTA2hWw3nX
 QJRF6BVNOqvVYhS03DWmk4Vtz7/d1miLw7H/sNplu0S3gB8AT57wdBIh6llhlwrTH9j9
 V8MMjwkNiBqpa0V3svRUvyj5pWgApna2YE1nbaALFAqa+NLJxz4qP+Jo5kwMN1eSMVL1
 7AXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwVSKEXN/sRMnkIf5qfzHWIaRN3H3hKuRmGrWalMpHIqTfBJfCdzqoP8+kF7JqwnHMvuTxNKmF4Lg==@nongnu.org
X-Gm-Message-State: AFuF++lEl1z2F6Prp5eTdqdTM3bag5DkLNQ27q22lFQiXiaDdCqUi4yU
 5L5Ob1djDCpgUgrtr3uYJn6BNM+YaFz0TZRaZJ53p/75Z5vWzhtEFm2OFfNygyBHhprIwfG3Jlz
 34gnbOqpSfpt33De3DyV7ovW8OeQpB3WuaUzXIkXV+qbz5wdlh3HMKfA=
X-Gm-Gg: AYBFou0B6UlJ5OyQlo1Lz6C+cZ9sWmNnIr+Cj54oaKdjYZbW/nGFEsuOjedvyrFDeb5
 2tzAM00otEN8hXe1kCbd7b8AL3vWzcKpyH4f6+YYzxu5gg2YMHKoMyTNtxBDCYClqYQJuxd/1p3
 EHR+l+PgCFxHHsZPLYbJrPfpq1xjK8VnSOlvWI45gbo5HH/R8OVrSQoEXp/3/tdCeinrd4g9tbS
 WLFoa1xHol1ZW7/vzJ0PHmLysC6/BHYvO14w7FiTA2OIInQIbPTPjr8SU1WJtIrPOP1NqsBFrbG
 uJEKpIaVb0ACFK23qG5VrFBMT8yyeD2ZGdzlfNDf0khJFkYECqk4/QDRSOunGmptaZGj02rO8GB
 AT8nrb2ANMR/rA0TpDUrF
X-Received: by 2002:a05:6102:3711:b0:7a1:84bd:7f50 with SMTP id
 ada2fe7eead31-7a55b036f45mr4575600137.1.1790001046761; 
 Mon, 21 Sep 2026 07:30:46 -0700 (PDT)
X-Received: by 2002:a05:6102:3711:b0:7a1:84bd:7f50 with SMTP id
 ada2fe7eead31-7a55b036f45mr4575201137.1.1790001044203; 
 Mon, 21 Sep 2026 07:30:44 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd8bc15esm190513035e9.1.2026.09.21.07.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:30:43 -0700 (PDT)
Message-ID: <2ab01e14-e621-44f1-853e-f3fe159621ea@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] accel/tcg: add cpu_loop_exit_excp
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Yoshinori Sato
 <yoshinori.sato@nifty.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 Bibo Mao <maobibo@loongson.cn>, Chao Liu <chao.liu@processmission.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
 <20260918004225.827-2-luoyonggang@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918004225.827-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1su7NcHobuMVkFLK8dqu0tDu-4s2pe3L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX3pZ/2j7q1arJ
 xeJz0sDLjQITvj0u9JN8lJ/mDaDpn0Sh2nIMfWrPWKCcQ+mM2UoW3ic21QVlFz7b9kANyAgG8R2
 Ka7yTDurdsVrpC+6tqqnbv4MnWK1FNc=
X-Proofpoint-GUID: 1su7NcHobuMVkFLK8dqu0tDu-4s2pe3L
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab13f99 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=ViMSs7_4iGOj7njaTlEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX0PyCYzTgHYrW
 pxI4xN9ezHGIWJeFFe0s1bDpCJkaUbnk8wfR24WMcIYXs+kCidS7EXb5bGZMfYSK4EDkPX4eyvP
 M9Hy/kKxZiv3ruR3IaFP1D++MrIkiMmwQhZ1srbmCTx8aTn7/wn1Pj7HfNgPvnR8Ja878UzdH9Y
 hy6n1Wm0smrPwq5U4iCfqM0GdteiE6Dvy7XKls21T0vPtUR0FJx3tTszJjknilKzC0HnD/v6gUt
 MtWEIo9OyH7yW0lSkDi5KPOihTbRfZYqxJKQ3THTMaF11ZhxQHtpiAEGkYQfIm/bvoskAsvsF4y
 BQniTpdF67+jZSijGq//QbwR51PjyHnoMRDfmK0sSBEN9L+QGqIO75olSZI3c01hKbp+DS02ZB4
 LSndEpKaHwr085hAw1bDGSAcbphNGDsr/pZWvbJoYo7Vt5be1HPUfqWFDn7WJejgrp0jhlbBgRl
 P13iwrsn3I/6DyndCkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 2026-09-18 2:42, Yonggang Luo wrote:
> Add cpu_loop_exit_excp next to cpu_loop_exit_restore. Set
> cpu->exception_index then restore and exit the TB. host_pc == 0
> skips restore, matching existing wrappers.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   accel/tcg/cpu-exec-common.c  |  6 ++++++
>   include/accel/tcg/cpu-loop.h | 13 +++++++++++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index 44e84344f3b..a33ec922745 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -82,6 +82,12 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
>       cpu_loop_exit(cpu);
>   }
>   
> +void cpu_loop_exit_excp(CPUState *cpu, int exception_index, uintptr_t pc)
> +{
> +    cpu->exception_index = exception_index;
> +    cpu_loop_exit_restore(cpu, pc);
> +}
> +
>   void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
>   {
>       /* Prevent looping if already executing in a serial context. */
> diff --git a/include/accel/tcg/cpu-loop.h b/include/accel/tcg/cpu-loop.h
> index f4d38bc2bca..04c14396d93 100644
> --- a/include/accel/tcg/cpu-loop.h
> +++ b/include/accel/tcg/cpu-loop.h
> @@ -65,6 +65,19 @@ G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
>   G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t host_pc);
>   G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t host_pc);
>   
> +/**
> + * cpu_loop_exit_excp:
> + * @cpu: the cpu context
> + * @exception_index: EXCP_* or target trap number
> + * @host_pc: the host pc within the translation, or 0
> + *
> + * Set cpu->exception_index and exit the TB. If @host_pc is in
> + * translated code, restore guest state first (same as
> + * cpu_loop_exit_restore). @host_pc == 0 skips restore.

This comment sounds like implementation detail, why mention that
in the API contract? Otherwise LGTM.

> + */
> +G_NORETURN void cpu_loop_exit_excp(CPUState *cpu, int exception_index,
> +                                   uintptr_t host_pc);
> +
>   /**
>    * cpu_loop_exit:
>    * @cpu: the cpu context


