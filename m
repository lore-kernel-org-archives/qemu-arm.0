Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CEDC55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 08:56:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpj2L-0000RK-8t; Fri, 31 Jul 2026 04:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpj2I-0000QW-TA
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 04:56:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpj2H-0006KY-Bn
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 04:56:10 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V8cBTV3390862
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 08:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QUJJTWbrr3vKrGsbB2bpPH0jWSSzXTntLvPb8G7zocs=; b=nCithzlzO964Jfnm
 /zrLFkPjqTTUehhhebLskdAuFk8v6XqyT1S0ourL2MqrGhruQSJy1x8NP82DYveY
 xWY2r0iQP2ykKRWYswuDTyxRuPbFyhGsndZzqDo3bAvhYvay/eilVt8ilvCnT29T
 QBuVLdAFSSx/ja4WwfoIseMuHADYB1490uIxeUnWOHcUcg62376ZqHM65tR3/4PB
 OBE30688P9MyrUnf/ySD1+04SdSpe3JkVDMForWqVQFWqdlJcL8QmGKjKXklSAlg
 Qs/Ec/ciBBlPPuw6G5gQe96kFXYqVIzfFPpjKaZwEQ6ez9HUVMCxIzmYnQZIwqy0
 xWVE8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc2g2g2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 08:56:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8f08560ea44so8724386d6.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785488157; x=1786092957; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QUJJTWbrr3vKrGsbB2bpPH0jWSSzXTntLvPb8G7zocs=;
 b=a4E89LxN0lg5CjUPY5kPhu2Xa9ijKMYifjOYYmYqVRk2GMxHaKzA1GbiwtY9djSofc
 7os4H/kQVBe3VBMfEoPxQhvlYRA/Q5AHEuYwKAme7R1i+uBdCADtUwbBZKhbeNEUF1Ko
 draDViXYfpE+Gz8b+XTbCObP+cSIctjDznCuuK3Vzg1n8fjFJlaSoBB2LO0BaxnwYUed
 p+lx4KyyPayQs4OJpwaTtaXanaQUZkcadDNPwtsXladR6ISRglkC4NaX1G6HhrUcenZ4
 yeTbUGZ7QGLmISb8rwiTnKSeeg/XSlB6RT7R0+7LSVIUVZr68Pz8LRa0+BTXcbZlUWcF
 3OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785488157; x=1786092957;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QUJJTWbrr3vKrGsbB2bpPH0jWSSzXTntLvPb8G7zocs=;
 b=Eog2mLWF2ir8ngSnL45FCbHozKAORyE8qtxctg1cl+T7gkXSYhWCi+Ty6se3KH62W7
 KPRlTpZ3Jyklb8sH4v+W9BoF7qA9QvK2q5VIhuQwqJa6u1xwNT9s+ZSZulQHnWgGhDnr
 ZcCQgN7Y3BGMULAZ69hsxRD64qB0n/mKWUqS67+ZSNzYb+/0qtmXlNiQyWwbXvtDN1nD
 SCign+UKo2oPOR9IXzxxWquKDH84ltbWdHX1KkZosEXQL+s/ck9Xu3W6Kq8mkIqsF7fX
 Boe64HhjGqY1vHHnb8ktWUxxcFIGtlUIBr4Qyz3LlyKUhyVMPHLxcEPcPQKhrI9+uCPK
 541g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpFIyfYXSC4wL2lrwXy6sGiaIO84p4K5w+9AnjyYkQviBWjZdXTL/mozqMxYKw5WJaMANTWk8crbA==@nongnu.org
X-Gm-Message-State: AOJu0Yx9W1ZeerIlmUEAvRHUvqiY/FyyrSkMQSUdJJjBejKQcOFiSX0R
 3uvzWKuUA0OthEUps04JX4NPq+vPw31giJmhn6f/rl3KT0+g6Bh1+EqCxKNM5FPUeYKbqnlQS17
 XAduMpza3tGWziJMOvuMQsJFmGpHlIOL4dDFN6wH9UDG+mHCSREzT8JU=
X-Gm-Gg: AR+sD13AH+xvPmubz+vjw8Rp6vcGrMkTk3GEujvqlopu72WwrRxJgCehRxtEINO0jNg
 KpnCYrpoAbC+I5n1uarHtd3SmBC4sxFGG/owYxISmnl+WeyfWTHsJoLQB6KLRXZVhUbZicshgdk
 S7+TCWxMKZaEcPA+p+faZB21OOJSPw6E5vu1eS/Ohe8schy+HJ3V79qKGCnZuq/PMIBWKACr7QV
 nG6BV3C6h9DBlnsQd3irVTF50mQaLSL8B7OY8Frc/dm3QjV09YQ4RU/kPdst36KLxjqMu8hsexY
 FAsCmWkb9tiODk1C6Bn2yuBiik+Sd9slLNyJwkH1vd/M7uZSmYjPKWfzSVDplhwL0y0nyrLiPXK
 oDXjxYLaOjL07emMT6VNGICBotqoQPB7i3FZpiqERzl7Hd4osLRs=
X-Received: by 2002:a05:622a:410d:b0:51c:7d0:7ed7 with SMTP id
 d75a77b69052e-52b4b0200aemr15163481cf.39.1785488156991; 
 Fri, 31 Jul 2026 01:55:56 -0700 (PDT)
X-Received: by 2002:a05:622a:410d:b0:51c:7d0:7ed7 with SMTP id
 d75a77b69052e-52b4b0200aemr15163301cf.39.1785488156620; 
 Fri, 31 Jul 2026 01:55:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a09c5b1bebsm888744a12.12.2026.07.31.01.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 01:55:55 -0700 (PDT)
Message-ID: <1a6bc7bc-e728-4b76-801c-667e8fd829ce@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] tcg: Add tcg_gen_revbit{32,64}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-3-richard.henderson@linaro.org>
 <9ed4f5ac-c51c-4fe6-8517-488913ecf50c@oss.qualcomm.com>
 <2a9588f6-7d71-4522-91b5-c015858b0d17@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <2a9588f6-7d71-4522-91b5-c015858b0d17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zdst8MVA c=1 sm=1 tr=0 ts=6a6c6324 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_fhm7UBy9G9jopjA_eIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jplAbWx_5gvCEl4TmWmW1ELwLrcMJUWa
X-Proofpoint-GUID: jplAbWx_5gvCEl4TmWmW1ELwLrcMJUWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX/6V8IXP91kY3
 WpkaMo5/TlnWXn9FHWy9d+ADhuFhk+MrorkQnMtwyVJ/rzPFZwMBiLo37lSvRRyGxKEWzU2WpGo
 0jeffeqy2SUhivXO0HSMQupnL6BWbQAHY2p1ygu6achReTVE7hrwNszOny6BqlApChEViIhYdSJ
 pFlOTWjDLDaxgWfXY9/tkLlxtYgRYlx21dQZjWlbU6RXQoCtGlOQMvU+dnhElPANzbqjp5HsKN4
 2miNrnpAv0SyL9jkor8D/jCsRDJCEyvKDWpSCqxXoveAEm8qIvP5AjYCzEkb6YX8cMXywcksAHR
 q3K8/yU4RiUGLlfwCFSVJqf+YPUmhlu7G8N6Tmgu+1USdlu6okd5s45PD9S+wxBhsuLf9kY6ciH
 cxiVkqBbxi6qrlzbQzQZpc2ON7Zsz/wk64kIY6qMeVsYkB48mBMtugJuOBfi6lXb04ThkH3dbAZ
 JOn2JMarfJrByJCiI0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfXwg+Et47h1Fqt
 M4K8vF9MGv7IO9DJai20kQ8sOfny6dHYK4yoLwMpN3hzd5mr+67ehJ2iEI93//VxAVqdBRJwojh
 unUz0OWB//fZRTSXs3Ej4VBEN+tZcu8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310064
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 31/7/26 08:41, Philippe Mathieu-DaudÃ© wrote:
> On 31/7/26 08:08, Philippe Mathieu-DaudÃ© wrote:
>> On 31/7/26 02:04, Richard Henderson wrote:
>>> Add generic expanders for reversing bits within a word.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/tcg/tcg-op-common.h |  3 ++
>>>   include/tcg/tcg-op.h        |  5 ++++
>>>   tcg/tcg-op.c                | 59 +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 67 insertions(+)
>>
>> Missing listing in docs/devel/tcg-ops.rst,
> 
> I now see that in "tcg: Add revbit{32,64} opcodes" in patch #7.
> Since they are for frontends I'd expect them documented in this
> patch, not #7 (backends).

I  guess I keep misunderstanding this document; I refer to it with
frontends but it might be for backends. I also guess you already
explained that to me. Nevermind.

> 
>> otherwise:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>>
>>
> 
> 


