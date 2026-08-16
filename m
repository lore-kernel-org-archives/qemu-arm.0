Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE17DC5DF66
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 09:09:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvWrw-0005B3-PI; Sun, 16 Aug 2026 05:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWru-0005AZ-Sr
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:09:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWrt-0000iU-9N
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:09:26 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G71wPT2712489
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lENoUCbKTcsn0o0Qiy2E7a4zjxvHNECXyajxvrquTLQ=; b=M4QtkWCu4wf6gOdJ
 MLjfs1jdJ9OdaamDKG8rWRFUVR7pybngVk9zPBwL6Y1L3+pLl2lFsrVtFtkAvhDI
 eNOuRMvthBWFXhpMMzWoeCTgLH541UJWCNu0wLDn+q7UIsOQkaatkuCZ5rlLoU5H
 OfZKQ8QhrNtVN5fXFuQgO3OEnz38+V4/X5TdZ8vvtiEmijhSvLbnlFyz3rUm4Rfj
 4/GfSzzzYF/TL8y9NpM5Z8v4QX+WKt/ea/Nso7OrHL6VyopDnElHT4wVnYbyXW8Z
 gYlJytbeTv9ePNUvISLrDYY47RjJ3+CxemarQ8r3mLhhURuGKyPf0Q0tebKCOy1V
 oaJkhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghf34n1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:09:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52d33c89a29so30664931cf.1
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 02:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871363; x=1787476163; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lENoUCbKTcsn0o0Qiy2E7a4zjxvHNECXyajxvrquTLQ=;
 b=QCK0G2o6uKFlCs3L9T2mK8HZB+bql4TJH+HG1+YqJrt97sCntZX0Lv8jdlvEO6+Eek
 RLDNcMHVgRZgudl9TuCx9PjVKyyblmAv0TubYRYCE6mubAI/BGLfrdJ8ELHxGpctjUGL
 B85uxgAIGAzBEBNejQjWt+N4GQ9d3h03nZym5y44FKzOru1vfjjS0WKQ1z2YHIZZ+ImH
 uzv9lK6eD5Q2ip64ZBb20ONFjMrbE5frJVNBWZPTa5qppykmRrfk/JgMbeuaTY3M/uv6
 1Bv6YXmxpTs6DtFY0aRBDwSIX/KMzcr7qj0Uu3aDSngVMI3XK2Tq5JIjS72/F+7kq1A1
 MD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871363; x=1787476163;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lENoUCbKTcsn0o0Qiy2E7a4zjxvHNECXyajxvrquTLQ=;
 b=o5ZsZSo+voz/c8D6T0dVgyxhdmYEmQyE3Ue3dhOcSUzzJwF3NHTjQGpyOAs4V//5v3
 0i7/C5zohlxyH3ftjauL7HCT17rQHVChKruTJj/t4uVqSYHclCFoZCiazYZWQbxT2RsW
 ILdZ3aGtLN3ZlOvuNlnDjw8m+opV9xan4IpxwWaGTfWjqa3TBbBDLBJSGxpRwxOVjVvR
 +TAXjnvLAoXZv9FMXl8OBY5u9mLkcJxoM1RoOqSZgLMWjMeZ2CrJVJoxP67TwzwHFjtM
 8m2LD9eb6ult8jzVVbeNSSMZfb2XeCuvKSM7Fj9eNF6syfC77tC4Ktf2dgboo/7u0LL7
 XSjQ==
X-Gm-Message-State: AOJu0YzOlMohW51Jpgc/aAXCYO17FjgxpFgi9nXD49NhbY7JnNS0hqQk
 cU2F2qBUqVU176xpumaMd/9//Qwpp2SB7vA0Lh+xlXcyErgsvnlI/Bi9jsKVs5Ywzt4mSx1XuQF
 P9lZWKvdE03NTg9SNmbXjBNTCGAjwM5dgXWSsof2IQy758GkizVZkmyc=
X-Gm-Gg: AR+sD11TGxRRnVVbq52IrARBel28+pOeIFpDZle+eQYBHJkeW2B78bcBpCG5irHYx1P
 Ul5yP1kivkesVDM5j0wJVV0IRVQWTxwLkSDGCSAIqKnd+qXN1m/t2WtULAQypJrkmNBYsPf5fVu
 DdRDY6ICea1YP3xzVMg2cfO/bjcqHGdCTcE/3lZPfhhTnk7Seomn1aCyC+2+zm8ZUraYDgCnLXF
 2iIcMPsEafbDh70zHcEjgbfOUUg0bT3zQwp3wZ4I1WLVs86SkDeiS8iGfkdBCPR4MfpP8kNeFJF
 vsxVyMx1aKeBkeSFVwfwkO6eJPRzQNiylSE4TTO+Ns87qyvMVM3MIlaR4CgkKCcLQ95dwCXJNLG
 Mr9/zaVz554KxfR6lZx8z4LFM241Yr6Ob+Bw=
X-Received: by 2002:ac8:5cd1:0:b0:517:87bc:9b47 with SMTP id
 d75a77b69052e-52d854d682fmr198488561cf.39.1786871363357; 
 Sun, 16 Aug 2026 02:09:23 -0700 (PDT)
X-Received: by 2002:ac8:5cd1:0:b0:517:87bc:9b47 with SMTP id
 d75a77b69052e-52d854d682fmr198488291cf.39.1786871362991; 
 Sun, 16 Aug 2026 02:09:22 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f20051esm24659460f8f.7.2026.08.16.02.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:09:22 -0700 (PDT)
Message-ID: <2875df0a-d000-46fa-a8e9-22aadf102a7b@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/18] accel/tcg: Replace size with first/last in
 probe_access_full
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QsVuG1yd c=1 sm=1 tr=0 ts=6a817e43 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JkiptoVkqo8WkY8BhawA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xFBe9NDJL_0OV3tf2TlU6d9tMSXLr28E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2NyBTYWx0ZWRfX13FpFP0gcEGP
 SmGFWgb0u6dYKRJv+VYrg5FYMUk10aazFVENUjSUDvnyiB2WZR/+p9g4nV6vQAU5nwJeOdQsHFM
 Dn5vYc8sRyjJIRRVrG8pl8txhI3hOapKT6MJs79xYQOsAuuZWLG+CCOhOGG0c731F4GCpDfROa5
 5AJcMVsgp+MY2iDu04UjvmKlRdRAF65LwVuj92BsIUKS+26y7dGiW1kUBS+1PVXUGKrkY5cRDOB
 n9KTZJMbVb5xk5cQpTsF0aS1wmMueMROOddi/II5lNKRfXVGZpCt200qSqezOnRNKBgvNqD6eIF
 7sH03slYNdtTnjxxf8YedzzcScWhJ2XxE840SogN3XzmspXHHuwq6y2qM8KqCXP8xCpfcnvYNyx
 r/Zjk7sIeQ/3mbdOb2UJs0ce9mpEGRnPRJ4nYMPxFF89Aww1vuDTSeqWAO7XQmQivnPRHad9j2M
 9LhTYphNt+pWjfojekw==
X-Proofpoint-ORIG-GUID: xFBe9NDJL_0OV3tf2TlU6d9tMSXLr28E
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2NyBTYWx0ZWRfX7AuLZx1gPBuJ
 4UqlVh2+EgV//LSyumRQyzawqmt0jWo7llz7ilhTJXBR18FK9ppgUYcVZs0PZ5uxtqj+5ywE+Vr
 M7/mHSyiZ4RgC28LBfOew2PgZhIVc6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160067
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/probe.h     |  2 +-
>   accel/tcg/cputlb.c            | 17 +++++++++++------
>   target/arm/tcg/helper-a64.c   |  5 ++++-
>   target/arm/tcg/mte_helper.c   | 21 ++++++++++++---------
>   target/arm/tcg/sve_helper.c   |  5 ++++-
>   target/mips/tcg/ldst_helper.c |  4 ++--
>   6 files changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
> index 0b788901ba..e3068a79de 100644
> --- a/include/accel/tcg/probe.h
> +++ b/include/accel/tcg/probe.h
> @@ -86,7 +86,7 @@ int probe_access_flags(CPUArchState *env, vaddr addr, int size,
>    * This function will return TLB_MMIO in order to force the access
>    * to be handled out-of-line if plugins wish to instrument the access.
>    */
> -int probe_access_full(CPUArchState *env, vaddr addr, int size,
> +int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,

I prefer this clearer first/last range API, it feels safer.

Missing updating the docstring, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>                         MMUAccessType access_type, int mmu_idx,
>                         bool nonfault, void **phost,
>                         CPUTLBEntryFull **pfull, uintptr_t retaddr);

