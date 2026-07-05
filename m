Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23196C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 22:03:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgUv9-0007Pj-C7; Sun, 05 Jul 2026 18:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgUv6-0006ye-1T
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 18:02:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgUv3-0001TP-LM
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 18:02:35 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 665LxKTU2868130
 for <qemu-arm@nongnu.org>; Sun, 5 Jul 2026 22:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l+Cb4Du/dcN++8nK3fDGL9BijxWyWk8X7pjSAGD/v30=; b=aMHAHRF5sn61ieZ+
 jG9oNVEVXmkZMszRzoPGI4purM8yhS38yBCfGkUnYINLwn9XDZZjf8oFrPebCrC6
 Wh9U8fCSVY9gArKrO1oLoG7I4v29bSGjvk31IWPEvuUKfVfuUCCB06gjf126xn0W
 U7PD3RGH4Z90faJGsBxygNlVHumLZzoLTZbr2Ns4EwTrIvX4qRKKAv9ALV6rAivH
 kc6FnaWqSi192MXS8aBvgu+KvAijGusR5lsQgShLPkWeChgZkwciNY95AhIeNU7t
 IA6yZSSmE37AD8wk2+khtgCbs/sDFtwzTDOaO6lWEFmx/G2iPqRL6xA96icmFkwV
 9UevLQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sumda-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 05 Jul 2026 22:02:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5bd797e447cso3560849e0c.2
 for <qemu-arm@nongnu.org>; Sun, 05 Jul 2026 15:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783288951; x=1783893751; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l+Cb4Du/dcN++8nK3fDGL9BijxWyWk8X7pjSAGD/v30=;
 b=iUj+PFNKbm68Kvr+R4+rL64u/Lfk7xTacqwzieAdcKE92poIYZP2dn6gBWr4k6SVH7
 27xUA6XRitX5ib9uGgp4NQOnH/+HuSStj48EUvvZ4heytRF+wAVQfyoH5q5ImN52p7B3
 TBInaR8dfcWbFzkEP12LB5YNCBmj/3f6V8fVpSrbDDHj7D6m/PRotqO6i/pboXju18E9
 V76gUhTFNj7eRh7c4+9cqwv4ws+z0nOuSRKed/RvDJVHW6f2uiwAxNUT+l8VyA+Pxhzk
 X8YSVjr0T8HLqDuEBL8jfg8wMZ9CwySDOkLrM24jOFvzEMBP5monf+e6PjNJzFu1fnUS
 DNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783288951; x=1783893751;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l+Cb4Du/dcN++8nK3fDGL9BijxWyWk8X7pjSAGD/v30=;
 b=AMkPwW+f5hVHv1AjvgFe+M7BmemcXFgQFLm8be/ea3gcidnTxiXoAMgUYoeKhwXylq
 ta86xllTMJToaSmNSm1p41JgF1IfXqR5q++YvFLyhna8j22LHdfM9agOb69XKCSXeM3b
 wDgbbDXtG2pONr2ZteR81R74DVO+tJN/xmUPhHu/5kDJgKLVPsfJV19Rp0VeZkR8Bvng
 xb2Kwsn79Ev9SO6OxbFuspEIFlrRLOLr7Xd0BCWAQ4sKO+6t1afYmS9JKASPe1EcAYyL
 Lz9TUBO50oomVFKsuYmxXlcX/hLmWoroNFszVfR3VPUNU0yDXjza2CdSGPsWvvzUbhw9
 giHA==
X-Gm-Message-State: AOJu0YwFeX1O046k2aqcA+kzvLJeEcKAtZM/YBHa61shySaSnMZo0wWS
 Zvc3iMvUWeQfey4MKCC5cuGv4yIKGF/hc0XSfLfq/qIqFrwMWtOSDMzGdWjHNE1yJu0o1GQnk0S
 t77moDvELNq+8YLVLxSf94EDlSmCtMb3O2YfPZxxyItrObUybi1Go8Os=
X-Gm-Gg: AfdE7ckEfMTpo8d6ciraS4TmIHacHNLHzFNkiugdo476/PCy24MsJNc9XikKDm0OaWf
 JcaBL/lVAqM1NVVmNjcGsHcmpsQUvxW2x7829tPGb0QjFuJE+vsYCNw3u/R6H1G7J32wjWcYAdD
 TtM9AWzwV6npQlxxzuwSuLdcGfrPYLK0mHlf4v9qN5qOkxbZ+49NhaMW8LPlI8BYPOtI8/up5DY
 AFgHPvpUyTn02QCFNXCHhFUtPyFScU9BNxpk7BAfAeRAedkJNCNEfVFZxetB4n4Xu9BfPxAREs5
 ijlx/HeuTnfWACdL+OMwC/GXfEPoK+aheDiHg+hZZOYUSNfaRWLO7kd8gzBWSGsxyGXCutDWKtn
 DBqNz3nAl/w2CrXH+3l+r438cESXc1E9Nz+EBgxNpYGnu6ToWuvNv0LEmKdQNOw==
X-Received: by 2002:a05:6122:6610:b0:56b:9b7b:83e7 with SMTP id
 71dfb90a1353d-5be101fdf17mr2943716e0c.7.1783288950815; 
 Sun, 05 Jul 2026 15:02:30 -0700 (PDT)
X-Received: by 2002:a05:6122:6610:b0:56b:9b7b:83e7 with SMTP id
 71dfb90a1353d-5be101fdf17mr2943667e0c.7.1783288950234; 
 Sun, 05 Jul 2026 15:02:30 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c637bc21sm568891265e9.7.2026.07.05.15.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2026 15:02:29 -0700 (PDT)
Message-ID: <942c974f-3b7b-40f1-a5fd-75d3432aa384@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 00:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/46] cpu: Define BreakpointFlags type
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
 <20260705043725.1373137-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260705043725.1373137-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIzOCBTYWx0ZWRfX9DkwfetsBzWm
 nB0moiFDNbdm9gc7ABbywl4HgA7xGaE9/gLUjyCByNS9yht5DfPTHlc9HT2snV28gVGoWiHuS0n
 SyLiPGcKwwoDsdcZ27kUEfkZZ3OgBG0=
X-Proofpoint-ORIG-GUID: TdoqXBlULt6qjnl97rBpaKXpg0xtuQIE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIzOCBTYWx0ZWRfX/KLRnQKVV67y
 LGkEnNnWcqSQQKy6O8UBB0WdBaHyRZUz2c9HMY0/93GE960KOFdoao6ThMsWj9BbaASCcv08EYW
 nscZyRr+5a5D9LmlWvOaG0VLcolH89f5nprrFJwoUu6lFWJMV3m7+9Pyfqdf45YVzZjNceTRuJk
 wNwWARDsBbKEODqNCczMqYfz5dmttJvMAR3MW8hQ+eZ3Kk14Wro4CXVLCo2J97+HzEfn4geWM2M
 hri6CYfsMgoFKKt/p5IZXdxXwPcyng3QUzGup4c91fTQVqV1G0VrkmJotuV9Ez1pD6PhH4dJ2cr
 STqZ+Zi+XyjvnRYfCZ5HQQwsxz3OpcOkJKhfjYcAkr2HhlWc3JDcwAN3lhVo33d8sZSpFPdqWch
 qsLQ+oJBvsK2LelCJ1K6qqQgiWRVBskAD6gRaU+6hs0Hqmyg9IkDiThlynyNQIltqz/H6PfCd7V
 Je7ZVNedEWRsA3bTQ2g==
X-Proofpoint-GUID: TdoqXBlULt6qjnl97rBpaKXpg0xtuQIE
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4ad477 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6XGGRaPhJGb0HrX91toA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050238
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

On 5/7/26 06:36, Richard Henderson wrote:
> From: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
> Use the BreakpointFlags typedef to better follow when
> we deal with breakpoint flags (BP_*).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [rth: Don't rename mask variables to flags]
> Message-ID: <20260630220100.1289-19-philmd@oss.qualcomm.com>
> ---
>   include/accel/tcg/cpu-ops.h |  6 ++++--
>   include/exec/breakpoint.h   |  3 ++-
>   include/exec/watchpoint.h   |  8 +++++---
>   include/hw/core/cpu.h       |  9 +++++----
>   accel/tcg/cputlb.c          | 12 +++++++-----
>   accel/tcg/tcg-accel-ops.c   | 10 +++++-----
>   accel/tcg/user-exec-stub.c  | 11 ++++++-----
>   accel/tcg/watchpoint.c      |  9 +++++----
>   cpu-common.c                |  6 +++---
>   system/watchpoint.c         |  6 +++---
>   target/arm/tcg/debug.c      |  4 ++--
>   target/arm/tcg/mte_helper.c |  3 ++-
>   target/ppc/cpu.c            |  2 +-
>   target/ppc/kvm.c            |  5 +++--
>   target/riscv/cpu_helper.c   |  2 +-
>   target/riscv/debug.c        |  6 +++---
>   target/s390x/tcg/debug.c    |  3 ++-
>   target/xtensa/dbg_helper.c  |  2 +-
>   18 files changed, 60 insertions(+), 47 deletions(-)

Bah I'm just noticing this after addressing your previous review
comments and posting as v3. I think in order to avoid demotivating
duplicated work I'll merge the first part and let you manage the rest.

