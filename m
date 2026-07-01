Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72D8C44501
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weoWY-00040W-JZ; Wed, 01 Jul 2026 02:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoWL-0003yH-P1
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:34:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoWJ-0002C8-03
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:34:05 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lZKh154284
 for <qemu-arm@nongnu.org>; Wed, 1 Jul 2026 06:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iCAMIuR+JqZRq8lrovhK5NYiZ2LTW2jGzDfhPWBG7Iw=; b=IL9cvldqtzW2fVfF
 x1Nism00DTPeRh9N4NUDz3utKmyxGUXz842aOnN5omWQ3YnhN4/RcGSFG9NCiPrx
 NXobE2kBc6V4wQXMWM/TKBpbbBXEUJEKQM27cTtTKmi3FdEJQbQn6MVhDmBhhLdx
 tiC/IazafOHppMWGW6rxl0vJIDskJ9KLQUWVEaMCXvFU5MVL6ETnPkWH5IqmbX6G
 0cGyTzpkBP4lb8oB0gjMQNc26TF1iwBBWZozStp1/ekb1yqtA0aeiealS5w1XjoO
 hdsFuJOj/W9wsml7BNVtklD1ExX28cUpl77H81Y0T8sAW8ZaDYBy8i8rxppzdcAf
 cgbRJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j912ssk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 06:34:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e53b8a302so30799785a.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782887639; x=1783492439; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iCAMIuR+JqZRq8lrovhK5NYiZ2LTW2jGzDfhPWBG7Iw=;
 b=A/ncv66H+oZLZxl0uk4NImI+4QTY087q/xLMfSOr3ZRkF91F9Fw1wnNr7CVuH/gL05
 /3gJyR2HOaFDtXMrEa/a/d58tzmV884/VLv7N3ufPYMIniDyG8+N1A5Z5QlaLAUgn2uG
 7yHXalfeyzUaXXnuVBeroVlbmJB9nqPH7Wrr+conSW/8Cpy5vPLuVpou3rAhVCr9t0eh
 wgoKEZfPXhVX7RqQalbkpojepUy7pkLtelYNntsEFk1Ty/4vG2IesLYKn382i8fmDEDE
 juIzNUZPf6pPLPX7TM7ps7ta+jJ0uGOMsBKKE4xGAa5pyfwh8IBCXuXS+Kp/IVkT2eRC
 KVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782887639; x=1783492439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iCAMIuR+JqZRq8lrovhK5NYiZ2LTW2jGzDfhPWBG7Iw=;
 b=SnugiZqQEnoqTVo31qXmfjancHIqwRZ0EoSUoSq1KUFQ7s8kD47B41mDV+hmLGqYP4
 Wa0s55YxCKMK0yqJ4Y/m6PRRrUzGzqgA90cBorHMH3n2dbQ/b9Ff88+Vpc+UzyJdrS8z
 KzzSJnV36VxTyoWdu6BsW3pwLherKPK4iDdRpnMVVEgc/L21WXThAwNKh8iTZ5jNtnb5
 lQNSPgQ0RJk13Lczx8rWalQGQ75jWQ5A0dK4dVNb0xyaNdWhVnrGHZ0h4G/RKrVPwh+Z
 msxw0j6YR/RaC5qGMQjdzS6hRY5mt5BxsgpllBis6DLDZq8ucHHBtYfr6Ksn9zNiHw3V
 Y/Yw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/7HCqmFpfRUrAYBW7a7iSNsoXUM6EhCWvaGOr/LTaL71Vo1a1eld+1Eh7mrY/OG6fz8bQnEcyD+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw2Zy/3kkmKIM7/UJtYpsxE0e8Nx0Mn5g9gkYepK6OwLNCDtkA9
 QaU+yLOSAZa+CPqkejpktaXvo1d2uQ9v8FG8/06gQy5Qv7r4qvZfVtkTVs0bwI52hXZ335NPwkr
 AINqNME2//OEVuHdpjwTsOtm1DUP4b9Vhle5XfgwXB9mriOCjLkl8w+4=
X-Gm-Gg: AfdE7cmu71ZkKS1TWt5aUCcdOrF2LiMY+Q1XivsZV9AXNUfwRCL7WJQVeRYaEn0AACb
 fhc9dvSCOYpbls3Nyem7cfg20yNy6A9HCy1npj/2d9t4lW+eQdx7P9rz7P5VcsC6AQZYpiKahCi
 PIaZfRQS5Se2UGzX32xbn73k12bQBOQpshn8y0JpWyU63bL/5dP03pjaV0wI/wUjATV6XqnC4R/
 rALnMzQiSfUCYxsMIK2GAHQArlowThDg8GMmDtSWH3cBqQvQh1Ldt33NsRmSxgLYBNsKf9aeF0F
 DNAnEEaWBaZxlmiB3wZ1RoxAKpqmOMDsiwbJ42opeWJMmD/DcGGq1pQqr4tn0G+WUiKxxBwVw4c
 0nTI/XafFMizz7PLMRjVKHiNaUh4TAMi3mLSRZUN+RhtDWeZNx1rX/fVNQfX9lQ==
X-Received: by 2002:a05:620a:4554:b0:92e:573f:c2 with SMTP id
 af79cd13be357-92e7851d814mr47002285a.72.1782887639358; 
 Tue, 30 Jun 2026 23:33:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:92e:573f:c2 with SMTP id
 af79cd13be357-92e7851d814mr47000385a.72.1782887638929; 
 Tue, 30 Jun 2026 23:33:58 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475641e4cdesm15024252f8f.13.2026.06.30.23.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:33:58 -0700 (PDT)
Message-ID: <eaccbbdd-98c6-4127-87fe-4340c896e368@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] accel/tcg: Pass CPUBreakpoint to
 debug_check_breakpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lNlZ9F7JezfxMu6kEPcK6YfS4l01Co1H
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a44b4d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lNlZ9F7JezfxMu6kEPcK6YfS4l01Co1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2NiBTYWx0ZWRfXxzwa7ATCEhT6
 8nqWVbMQ7MqgOcXdyeogS2T2g17XW9y4XaTuEeLl7J/hmJ/KwewMeAukpk6UdwOCyb7ZXlklFoB
 IfutGa9WL76Pp0spQjslS7btrv65HRbsoGtaXMpoN/uAsnpyfB71v4q38/2MsVVWy6WhSSvYYrS
 u3NeKZjX8TjiyeIVSnUnIkSleCZVBrUPzwvLD1cWiQPSNhw4yAVVBs90F9ypDjORAYa5YXuRjDE
 v7ObNVAz65+vbtJiJ7v8JrhUFsdoDVsd2yFoRpThtpQiGjL+JZ/WF1vE8dZe80JBGRFYY8AmWop
 YgChpuccfc+S7MOaxEEyPWth+PpU4RY45Utitxsz8vA4OwiGA7Rl+j2WwpZsRll63YvO+jFDJO5
 L+tgJjDVzmg+oKTHngDViowplRHHZMH50b8+Uit1pmEZCyw8N4Et6Fo8SrnNY58z+m12DOLpiWZ
 Kr/ftinmn8HHuFRVWYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2NiBTYWx0ZWRfX2YwIuWrjpFDG
 J6bj5tB7fkvDyx0sezGXk9SrV9I1h5mjVbQe4lSHtSzmsu70ySlFSde+XwbSD8zqAPjZ9KA3kAV
 QRx48EcDk0onRlZDwrwvayKlgMX0t3Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010066
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

On 1/7/26 05:04, Richard Henderson wrote:
> For 3 of the 4 targets that use this hook, add the argument
> and ignore it so far.  For riscv, drop the loop over all
> breakpoints and use the new argument.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/cpu-ops.h  |  2 +-
>   target/arm/internals.h       |  2 +-
>   target/ppc/internal.h        |  2 +-
>   target/riscv/debug.h         |  2 +-
>   target/xtensa/cpu.h          |  2 +-
>   accel/tcg/cpu-exec.c         |  2 +-
>   target/arm/tcg/debug.c       |  2 +-
>   target/i386/tcg/tcg-cpu.c    |  2 +-
>   target/ppc/tcg-excp_helper.c |  2 +-
>   target/riscv/debug.c         | 55 +++++++++++++++++-------------------
>   target/xtensa/dbg_helper.c   |  2 +-
>   11 files changed, 36 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

