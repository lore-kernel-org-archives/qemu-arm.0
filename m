Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FF7C982E1
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 14:20:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8es3-0006jC-0S; Mon, 21 Sep 2026 10:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8eru-0006eK-3g
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:19:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8ers-0007PG-Ed
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:19:41 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LEGfHB100543
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zrvcf3hnTIprfUVV8c+/dhkM4mfvL58UveViZyaTiCw=; b=NOaO4bTDaoUYJqAv
 otEfhhi0c8F9nyNJhIU4aHuJ7n7j9BaAIwsXCoaoGMNE5GvBmxcVRHY3sMf5dFlG
 On15bwF5UggwIKvz5dpeXOFlEWlyZ579R3cBZcS6rhdR1qyfmePpLHNHqLb8AU+u
 1zahctpydvtLsU3FPVjvxB9jOsbSOSqyq8ORlIHz8S2e8Y7bl3N+RCe5oblunVzK
 zEOHQc0iod2yCMm2Z1He6U1AgxuGDX8YQA8FdNM99pTF6SQRUacZCdHasmV5qRsq
 j5eIYY1Kb/16NBUPikot2jHboWjdRrT23ZJt1I5Qs/Ro6+GGruBicJEKs/fIea/2
 CDTSfg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79b2cp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:19:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-5c8337b12d0so779567e0c.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790000376; x=1790605176; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zrvcf3hnTIprfUVV8c+/dhkM4mfvL58UveViZyaTiCw=;
 b=DCcxt3UL/6MPf2g8pMG/X/lxyrP5QgaMiPS5XydMwyDY51TNtWgorQ9M1r3EJhWO8/
 MPhcF3DpJby1zPRnyIDWjDfWD1ZxdhO/ZsX8NJVonW8dXaXrO6YJriBfynqu8bUyzkUq
 hluW4OLba04wjEh9ZHoMCcamoRrG6M+TMNnAv6H923IDOGffNVj/Ipz8ye6+t+6UNmxn
 SVevGytU4wtwJK1mt0JTU6Vd/WmN4C7XB+SNpXvWpsVIZn4F7kYTLdXx/OowhancdJCZ
 oapFmMRybBHqDqBKZ9l6ZbbjQcKzKMWvvqaM1dStQYQpV9vZ/GqiSWu868Xzk2wIA9Jk
 Q7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790000376; x=1790605176;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zrvcf3hnTIprfUVV8c+/dhkM4mfvL58UveViZyaTiCw=;
 b=iqAD2NqAleAVnRx9hl6qs+pSLNZK2mKLbzsqVPBDIOFxkRfjrCjZ/K89h/2aTQrtiN
 7kmZ9u2btwzbdjCI+kGlLaaxiL4RQW1Ej42bsmc9YNo/vyYIQdjaDJQGV8yPTqU1pHp3
 dEmJUWjbGVyWh/Yvl03RwOmHOWA+SKs0LYnXyZbo+8fgObI0x57A+BPsvgb7cibvouTP
 PiRhqZAvQErfXHGW+CnO8ZjMAk4+7xpkJswnbAeKVbrDphQnxloTJilsJYTPOkdIG3P7
 gArtWU2lwiJ09EL5WUNI+y3v/kGmiXea2PAkxu8R8eAf5x3mOmmZD9WFGMxkqAuRH4nc
 ELKg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1NubYkeG77RIaTUhtKjzXOgpAz6qnE5ktsyY5QY6gOTDdNKbcesJu2BXsm7SQuM8V1ruNDimQQw==@nongnu.org
X-Gm-Message-State: AFuF++lCqziA5wWns0bICsPolH8Mgzr+GQ/WuTl/yeq0Gh152qMRXLbC
 Tj17CB8BjHkKUoaT/5Bad0pwIElNTRngJgRn/JU7sEW7zGgstiQIpjnG9UcGREWTptmS1u1Izji
 AJOrcYEQoF0jmUD2dpeDOtCxSBULcXNyc65zHROLleglZcnGUrd2o1Nw=
X-Gm-Gg: AYBFou1X2iknsmfJMkMd57arCZFvA/+6tav7xQbaVfLxkSw4B76HVcTLBEGogA4yhzc
 8LZB+hFbTogYZqdCpWipw9ybeze4kWK4BXKYp8Z/r+w6XpFpRighXjD2Wtn68fGU2gao5WTA8Pf
 QxGtlNU2+o6zA6K+GaHjnLKS6o4GamOMrF9uwyZFzxqT6vytrW9ef539kGhe/CNJMd8dLaegGvu
 qInlzJYJcusFRCsEpUpop9rISUwN71Kr1fCB2cc1O/zJbYsM9DUfTtYo8hAqAbPe/RVgySQZxxi
 +N29ffoqqIMRqAPaeYnNBbY4h0/oMznsYeKtcsEhnCqWmNhZ3uhQhDGsPGD4159/8DyZff6ome2
 BhDru9VDKO92BUkdkKQY=
X-Received: by 2002:a05:6122:8c8a:b0:5c9:a60b:e5cf with SMTP id
 71dfb90a1353d-5c9b59413bbmr4643547e0c.9.1790000375908; 
 Mon, 21 Sep 2026 07:19:35 -0700 (PDT)
X-Received: by 2002:a05:6122:8c8a:b0:5c9:a60b:e5cf with SMTP id
 71dfb90a1353d-5c9b59413bbmr4643501e0c.9.1790000375493; 
 Mon, 21 Sep 2026 07:19:35 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724460753sm23972033f8f.10.2026.09.21.07.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:19:34 -0700 (PDT)
Message-ID: <7162b5fe-939e-4328-932e-4adf7f640bb3@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] target/sh4: convert raises to raise_excp
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
 <20260918004225.827-6-luoyonggang@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918004225.827-6-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab13cfb cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=L5l0t_duoJEwhSdndf8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwNyBTYWx0ZWRfX6pHggquIbc4q
 x36MoCODzqBxa7xOgfPtA1Eoh5f1y1hlq3UgdTA9os4Ae4lj2S8XtJ1wxM4HjDIs/+Ym1N+USS6
 KltyEALUkrZCuFfj+jV2vzo8nRiEbgQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwNyBTYWx0ZWRfXzqZYoxXUfuqb
 2VxTkswBZ2uL/trmPKxcdPZeGfb3NBbJeru/H3efcC3+FiQ9MwM1+8f1fslQoyE7IfDbaVGji7c
 0BvHIo7cAt6wSraDTvPCumjc6MsVB9mKiJnCzbk/nj6R0Dn6ZbNsLuJoV7JCjnc1w3IYdZdu8wL
 q5fEQsSZty3GDCyGVtAC3JLFwTP9z7BhPCX0hFqTcfvxb5r2/JK6oEq5Ij0vTvOIqbN4BfKODas
 Hy8TcYNTebbQSR0D0uwPTa0cpk9Gx01gCgSE8txZkcdb91D76bbQFlazwZ0YAbldyboJx/YOIeI
 HOq4KZ8Up5FIjJNAX/R2cqhrImZ96PzxqhszjfIAaR6VviL5zsDBudro1rPuzjIWdAKMG9MUfmX
 LUKSwpFmEKINxzqinTftl5ehDZD8HgvwJEgWJYejwzB3e4Wc7iu7yG2C6RAfoNFkVWLvZcjn2pk
 kLD2zy91gljC5u3i7rA==
X-Proofpoint-ORIG-GUID: Br8cdDbATIPn8j0Ni7mGsCOUI35UO8m4
X-Proofpoint-GUID: Br8cdDbATIPn8j0Ni7mGsCOUI35UO8m4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210207
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

On 2026-09-18 2:42, Yonggang Luo wrote:
> Name guest trap numbers SH4_EXCP_* in cpu.h. TCG loop codes such as
> EXCP_INTERRUPT start at 0x10000. Translate illegal and FPU-disable
> through gen_helper_raise_excp. Drop unused raise_* TCG helpers and
> the one-line raise_exception wrapper. Keep leftover sleep, trapa,
> and exclusive helpers. Exit unaligned and tlb_fill through
> cpu_loop_exit_excp. Log reset, manual reset, TLB multiple, and
> user break.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/sh4/cpu.h       | 24 +++++++++++++
>   target/sh4/helper.c    | 82 +++++++++++++++++++++---------------------
>   target/sh4/helper.h    |  4 ---
>   target/sh4/op_helper.c | 43 +++-------------------
>   target/sh4/translate.c | 17 ++++++---
>   5 files changed, 84 insertions(+), 86 deletions(-)


> +/*
> + * Guest trap numbers in cs->exception_index. TCG loop codes such as
> + * EXCP_INTERRUPT start at 0x10000 in cpu-common.h and do not overlap these.

Again this is the definition of outer loop QEMU exceptions versus
per-target inner loop ones. No need to mention it each time.

> + */
> +enum {
> +    SH4_EXCP_RESET = 0x000,
> +    SH4_EXCP_MANUAL_RESET = 0x020,
> +    SH4_EXCP_TLB_MISS = 0x040,
> +    SH4_EXCP_DTLB_MISS_WRITE = 0x060,
> +    SH4_EXCP_INITIAL_PAGE_WRITE = 0x080,
> +    SH4_EXCP_TLB_VIOLATION = 0x0a0,
> +    SH4_EXCP_DTLB_VIOLATION_WRITE = 0x0c0,
> +    SH4_EXCP_ADDR_ERROR = 0x0e0,
> +    SH4_EXCP_DATA_WRITE = 0x100,
> +    SH4_EXCP_FPU = 0x120,
> +    SH4_EXCP_TLB_MULTIPLE = 0x140,
> +    SH4_EXCP_TRAPA = 0x160,
> +    SH4_EXCP_ILLEGAL_INSTRUCTION = 0x180,
> +    SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION = 0x1a0,
> +    SH4_EXCP_USER_BREAK = 0x1e0,
> +    SH4_EXCP_FPU_DISABLE = 0x800,
> +    SH4_EXCP_SLOT_FPU_DISABLE = 0x820,
> +};

LGTM as a separate patch adding definitions.

