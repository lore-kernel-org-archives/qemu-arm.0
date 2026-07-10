Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8C6C44506
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:54:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJAV-0005w1-SN; Fri, 10 Jul 2026 17:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJAU-0005in-B3
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:53:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJAQ-0006Zu-Ef
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:53:57 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AKsL4k1947651
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4G7jMeEgYCuX2L2ZpWyDzcYXDbcixPhaH10lFBU1ERs=; b=ocfC17EtVl57gadu
 E0uYmEQEFIBajzH6rduTEYm1cfyc7OtP5NDEJXunOd0oRW17pVMql+L6wDnOr3Kd
 9ZNSEX/0f6CLHPsfIajQFpSPef7p3IUYHqxK1bAtFKXxSck3ezd1VFBy8/e87Mba
 pRJEx6Ndos0aHYVcsOhIBa8z2SpsLjpjXzvC4JxbAoIMJdAl0B0jXHMxtL0/Fqjc
 kAiYstW80zE/5ieBFW8DwUPj7kVB+s25bZY55OTTMjmXaKL+uJD702xR1RfSN0be
 cA887hQiRGYQ32kyDYd9nc5KjPAFiNm+yvAbdpQlD8xji0D9+ivwCZodMo30fj+T
 RrVP2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb86eg4y7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:53:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c33f48ee4so14562211cf.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720423; x=1784325223; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4G7jMeEgYCuX2L2ZpWyDzcYXDbcixPhaH10lFBU1ERs=;
 b=Pp6oWPdps6nVH1MwY2tBpBv9udE4p7KgRWCSbcPDCSGkAwznVL3yE7uKRa8/lx7s/8
 xygygrQDxEPF4W1cQEhD85V8bENPDgvMb24nAbCwwja3i0zRcAPyHuQeQFOnnkG1exPB
 cZDJXytYEiOXbQ32FTe38B2oFBUYHcm6Z+RbviskePIwHLbalp2piy866RmSSgTYxXZx
 bSvkPQF+P7Cjusw1OyfsB7x2ujBzEj6EE8i2y1Y+LXlDR0/YgO3+H7P71PDMvrfaqQM3
 JXGYSfL7gTYOHOjz8wcErXnZreXh2Hc7e4vthEdHiY/tV3NmaPJVCDdVOJSFn9Bh9SVu
 wFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720423; x=1784325223;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4G7jMeEgYCuX2L2ZpWyDzcYXDbcixPhaH10lFBU1ERs=;
 b=cVPQqAabWfQm7FkP00wVKUeDQzI0H6DdXt3UjJbTxNj+S0PjeUR5lSKVRgl4DRcMvX
 qI9cScvDos2IpwARHuNTOp0o/XGlmSxcAN9aBnRi1U3KMEQaZ6CmfEM/5hePNIZoybc9
 OkOQYdpEyFI78jn09bwBkaSkl2jH9+EdnamfesC0p3LTHFtkmG23QUPpGrwb/QJC5a9j
 LrSFC/kF2Wq4QguiteydRfgHFomtan47+4LWfxsxHeq50VkuO7+yN7mK/XFkPNXaSijD
 PLbSfTo1the88NFz8dYZrtghRv8TbMYFMXCLcvoW7GFRo3KbCxgGdO+C2GY5m0KCRD6F
 eRqg==
X-Gm-Message-State: AOJu0YzzN9CuE2g1FkQM0ofZJHkvIr1IdyPQTmb+AdioQoD2r0X7AjMH
 VHDWUQckcZEHZUHGF63R1kpZdrhhO2v7rbaolNBlOvmoLTccqk9F8zz9OM7iU4U8pafbpaS7Csl
 VsM+6BSWbw65VcnbyAT+lPe2GzT5xl4VwebrElxyGje/hT4vIih43bv7LfC+JpQI=
X-Gm-Gg: AfdE7cncPcNHBHiOIOorqPPhbK0LwRbcl2FdJMJS+isXsk6Tf+63Xj/nI9UMPN0iGKE
 uL/vjv6DZP932dXBYi8v3BM1zjx+WLRJug0iJcLlaHw+MHR5CnAbctHzTEriXnrYu3CobT8C8gh
 +Rr9XbBky/2ve7lM8RifMQ9Jl5BNOcbCTVPPUip5gJthkqw3L6zdARmbDxW7Wncj1Ao1ot+5wEd
 90txpeh1Ib/ET9+ci8SwtJIZpNDFhB/eBcrruqAcxaBZs4HgTCsexdLpNSTE50Bqu4HDbg/3KMn
 AtXyeiZ8tNfF95UeNc83TTbUUJQadxkvL7wJbdyZhuJISt9EWrybx0EWhAb0YFx1jUEabZqThcR
 Ka+VuFmMQgYiJ3jk74O/34Fx49+VGvyUv8h4TXfyx6YJjmCSOBvKZH9K4rFFPRQ==
X-Received: by 2002:ac8:5ad2:0:b0:51c:1967:5098 with SMTP id
 d75a77b69052e-51cbf147113mr7801561cf.38.1783720422936; 
 Fri, 10 Jul 2026 14:53:42 -0700 (PDT)
X-Received: by 2002:ac8:5ad2:0:b0:51c:1967:5098 with SMTP id
 d75a77b69052e-51cbf147113mr7801391cf.38.1783720422565; 
 Fri, 10 Jul 2026 14:53:42 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f25b23b7esm8759717f8f.18.2026.07.10.14.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:53:41 -0700 (PDT)
Message-ID: <1da100e0-57b5-4e18-91f5-b1855b181fc4@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/51] exec/breakpoint: Return the new bp from
 cpu_breakpoint_insert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX4bD2OKEwpEok
 riIhsXx2YHgUTTrlGPpE22qLHK+KkjtwTzW6rDWnMDOYXzRpq6oaKGkB6W2NJ8IINusHqUEvGQR
 MIK1EtuxKa0hi4d8l24qa7gxWWQoXJGGKIeFRqLGS13TON+kGtV2XrkuVhEVRkOy8nugTUyJ6a9
 Cnte7zMsC4pqnlge9uiCWfTbrrwKWH/FkJ8CTbzHU4q6nUG0pABhb5tam7gZZry56lk1j14KacQ
 ZVb0NaObie0R4XO3jjwGqbpE8TrUcE6B9LpnmCMs41MEvkl/k9r/Sv/0BFIfSx2fGei6o3Otp1t
 8B+D5zYGUFk5xRHCHO2IU6BSWHnrNAYnq1ALGJqozoXLhMs7I84ZUeaKb5NC1WGzMHhiwF2MO3p
 GG9cocOW2Z4m8BsMeH8eELPXCit/pJS3kCKknH8Gk0Q+82fRmQohRP0SzGJmlmUdPIV+Tq1CQLu
 ET8PoLrojvbxGqRyhIw==
X-Proofpoint-ORIG-GUID: aW6IDyQQ3hXDDSoXKksGyr_GiEab9PNu
X-Authority-Analysis: v=2.4 cv=IOQyzAvG c=1 sm=1 tr=0 ts=6a5169e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=b7RqGuJXx8hbMOLXtX8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX2q/h3NzI7alU
 glJwsJjnLoLCxvM6nKxUBJj+NdB5FPzftSS4E8q9nLnIVg0+J6T84mUY49qqMD7INMy6+BKVMQz
 jmYeiGhKFonWZU8H/Q9239Rph4e9tao=
X-Proofpoint-GUID: aW6IDyQQ3hXDDSoXKksGyr_GiEab9PNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100220
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

On 10/7/26 22:53, Richard Henderson wrote:
> The cpu_breakpoint_insert function cannot fail, so the error
> return value isn't actually used.  Instead of returning the
> new breakpoint by reference, return it directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h           |  4 ++--
>   accel/tcg/tcg-accel-ops.c           |  7 ++-----
>   cpu-common.c                        | 11 +++--------
>   gdbstub/user.c                      |  8 ++------
>   linux-user/main.c                   |  2 +-
>   target/arm/tcg/debug.c              |  2 +-
>   target/i386/tcg/system/bpt_helper.c |  3 +--
>   target/ppc/cpu.c                    |  2 +-
>   target/riscv/debug.c                |  5 ++---
>   target/xtensa/dbg_helper.c          |  6 +++---
>   10 files changed, 18 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

