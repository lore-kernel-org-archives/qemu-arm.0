Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2C1C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:55:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJC0-0002S4-K5; Fri, 10 Jul 2026 17:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJBp-0002EK-1T
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:55:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJBm-0007FT-MD
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:55:20 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3CYF1841474
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J0JErute59YZCE1QPeYjwvNPAb/QF8V9CXZId4ouJXI=; b=b6s/YX2LNY2/+VN8
 k0huwEJnq6Qkxnxl0DdqG5PFuA6Nk8dVcIuw/5GCMoGKijPa/TS4gozDM0iUIDPp
 7X8xAwVa3S1UaZoLNxlNU+M1XK4c33fgK1W5on9yxvRR+K51uHxoBpkRSIjsgzmC
 V7hnyLJr5QzWfP/A28V2EZ6iH3G/PvDzB5kmp0tmNmFQWpyRlvvmdiXhV1coByj5
 dekGA7V1/wwx6xKV+xqVa0sVMtYaJNUhw6n+t4SAqD661Edv39E4yuJ6E1zCoBEk
 3HWin5ysxDdpGBJcsPK8iJ2IiP9mstbC3a9blSJffeh/4SWj8yOsA0snRmnLo3Kn
 sgi+4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xn1437-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:55:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c33f48ee4so14574511cf.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720516; x=1784325316; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=J0JErute59YZCE1QPeYjwvNPAb/QF8V9CXZId4ouJXI=;
 b=GfqfXWGrJzh6Nov0RfWfGpOAl6HJMLodlQJ50gDCLucTaiU8QmyEYaFIn7Zy3JPqhy
 uzpYGOH93hWEmXwS9Lz0U3Fu0+SkiJId4v08iV4KLB1EVyT1IkSORAxuWT42JP3eYVAs
 8NiqGX1pYhKQyZVq8OujU05fX87l32Lw7OtPxHGUVonF6aImdyzJ+ZooTwsahjZcahO7
 FnJV1x0IE1/3kZGMYdzdP0SZXykEKosaXu6usoiiGBnR6Uk9IlZVwZky9ldlV8C+4a7r
 Ta78cK4OTZLL2ohsI4gjb+Do29XEuPPpl3HCn1kF/n4B9lPEkR+0ATbDq8CR+CLh0XGX
 Tjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720516; x=1784325316;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J0JErute59YZCE1QPeYjwvNPAb/QF8V9CXZId4ouJXI=;
 b=qWhfwEmI/kwgFSPmppuBYzljuYjeZKzpwPY3GL+kb/vfwdpfrhpuWNRPtTb2FinVlq
 9vrxPafgyQHLj2FBChqPFbgyNPtgU9B4Ej2E6rzkXW9gJMqC0RIreHoEMD1uKGP+YAfI
 76duy5KPa57ttdU5H7WlITTPEYz/hwVm/YK4JFjE09iwvtKNMmPyRpXImKXQRh/hfwna
 wouCIXh6xc7mdjOiE3U1TGnQt8h9r6XF2x85S2A4UqRJkcKoIR8konsqcfgGnCO0PI6k
 HWsucui9v3RkfK9L+/h99L6pvS473SuOiA4HurK29ZIlCJqOpLF69hr0nEPcqu2KmKLv
 RdGw==
X-Gm-Message-State: AOJu0YwXu51SHLI4V3SL8NCkkX6/tkzYPd8p1JNyudBHlNuBbVDNoSKw
 CeBeTRUmHxgR+LJ4pS13eCxBpwWZZqbs+Ipw+EogIGxPYK5MHUp/Xd2fURCwf0MqWhv6G6/UFOt
 JwzVlkYcGgYTHMIiBHKIy3Figy/r+Jh8yARh52vWZBS94ZL4+q3f82mkl8JcQuks=
X-Gm-Gg: AfdE7cmASY1NL5XAEMWgcvlQDdZs0ndgCeEjcaZy58xwFLunn0THYxaQmY41m3ty/d+
 lw/iQMU3vqqtoyYrRmH0bEfW/s5DAE3D/YZP2GMw5coZdfHl84mfwMVroa+YAt2AIWMDhrlPLuZ
 RMyV9qvkGNw56IyiOnDvj8QLHcuEmb0sBh9mdt2JPX9i46VtRsnTjRqtYMswxqY9cZCDTIaadOp
 p7w1Fn4MjmMSEH7EEKKA4HKBkE8HKZx4jEZqsS1QtnYT68eTppCtfu8eexHFnZHqgk63DLybMq8
 iWaUUR129aJuRtGGFp9orqWvjLZaNnKpdIpvTmaXQAK5L0VHsG5u0OWSdT8cTiXhmcE7rWQhzx2
 vRciUWfNsLtx40nprEu7EI3Qc51pAspc/B4SpH8097M8JQOCYn+EezsXuORGt0Q==
X-Received: by 2002:a05:622a:1e0a:b0:517:642c:8196 with SMTP id
 d75a77b69052e-51cbf0701fbmr8242531cf.12.1783720516179; 
 Fri, 10 Jul 2026 14:55:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0a:b0:517:642c:8196 with SMTP id
 d75a77b69052e-51cbf0701fbmr8242301cf.12.1783720515802; 
 Fri, 10 Jul 2026 14:55:15 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df417sm173979145e9.8.2026.07.10.14.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:55:15 -0700 (PDT)
Message-ID: <78caf14c-d316-4924-bd23-6e7edec997d2@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/51] exec/breakpoint: Return the new wp from
 cpu_watchpoint_insert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JJYLdcKb c=1 sm=1 tr=0 ts=6a516a45 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iEHWvvDq4-ptc5kxTzQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jVfILKaNZm5xRWLtw3t3Z3937Bf8Or-2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX3/gleV6COu8K
 bRI00RPncGMzlMqtNL0bkKW4iJ9wSzRCI0ermUw2IYDV9bBM+EwfKvCFH6A8iSDO27h0y0pE5rx
 coj4SHYGwcxVtnD8NfAk25EXnQeTXSA=
X-Proofpoint-GUID: jVfILKaNZm5xRWLtw3t3Z3937Bf8Or-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX9wO2JqqoUCds
 C14t0wwfii1oUmeAeGcnbyyKe8XbNTePs79rKuhzW7amA4C4WD9H7fGsWKLAL/BIJpsMp0HdThU
 9oS9AsIrVCbSZVdflStxF2MV9nhw8zXsem4d7MG0PsofSyLMXIFFffUGkeuv+wH35CXHNzMJ9yi
 iO1qKjc63LYlTme2Xgqgw10spWb1QZ2D0jEx5q5Cc/0ihTQATrmYQCnc/JhUCeq+BhzNwfulnvk
 f7E40TLgCBg//MCBjuoNy3cOfNWNZQI1BzW1nJ24x6R8ctcFx1bj5ylqpsm+VT69ERSoDeIq4qd
 flarf4cNW3GdYjAQEjmyZ4BYnmDJl8TbNHGABRZAVUGTTxJyfdwXFP/ttqy4EW71cIYcailyVHR
 402yIRBLVmpusPHRrw9MF6WTOF2koNhVavydi3tXZresBq4MI9qqijzHkBPXnDRjLMTsFjzvh4e
 cBlbPDlmn24llyRRk4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100220
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

On 10/7/26 22:53, Richard Henderson wrote:
> The cpu_watchpoint_insert function cannot fail, so the error
> return value isn't actually used.  Instead of returning the
> new watchpoint by reference, return it directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h           |  5 ++---
>   accel/tcg/tcg-accel-ops.c           |  9 ++-------
>   accel/tcg/user-exec-stub.c          |  7 +++----
>   system/watchpoint.c                 | 11 +++--------
>   target/arm/tcg/debug.c              |  4 ++--
>   target/i386/tcg/system/bpt_helper.c | 20 ++++++++------------
>   target/ppc/cpu.c                    |  4 ++--
>   target/riscv/debug.c                | 28 +++++++++-------------------
>   target/s390x/tcg/debug.c            | 10 +++++-----
>   target/xtensa/dbg_helper.c          | 10 +++-------
>   10 files changed, 39 insertions(+), 69 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

