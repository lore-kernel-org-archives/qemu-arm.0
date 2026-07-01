Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F106EC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 06:10:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weo9O-0004Hq-LT; Wed, 01 Jul 2026 02:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weo9N-0004HS-Is
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:10:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weo9L-0004Ab-GK
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:10:21 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lX4P059283
 for <qemu-arm@nongnu.org>; Wed, 1 Jul 2026 06:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iyeWxppY89wILBKU0wojRM+VOlRW78CF5V2yAd/n2Qo=; b=IQbrzYjVFLz7fDlg
 rxUGuuq3n1qUKtoQv6NMIMpfS6acpRKOqBjud27e9iSMGUZSEiYPgAdvvz8quqNQ
 FiPT6GQFcbZFWk7qv1mNqbR23SAQFIr3ER2Qi1IRMyf704gr67N4F/0cV2+U2OEv
 Sna5xxPoTkVwJde9ARYhSo2dpjUqICpb9m3jd4n/cILoTx28Cv1JHgDrgY1tj6Xo
 GfmVLMEhNo1DhH9YLtV8xtMM7X+OrAdrmr9/sbxO74qKt2AbWm1B0Jvm0iEsp9Li
 hp8cWTRwOvwOirWktweifvg8dB92nRl3/6mMVxnN8tlbkQ6rEcCZ8KMNY+kuy/MB
 HnLDmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sjcys-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 06:10:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e538afe65so29488085a.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 23:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782886217; x=1783491017; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iyeWxppY89wILBKU0wojRM+VOlRW78CF5V2yAd/n2Qo=;
 b=VffV81Yinu/C+26tVZ4s/ss1n3munC7MayuibTXRHzg1hK762ZsKpSc2yhA219mxDB
 ZeFeyVl3bLD4IHpmbx9C0pO0jvbtd2ruXfE1JpfI4md3/iKmpRx1mVPyKfL5nXtssH/3
 MafHIzv1xPhquEFjla0VGmFThogkyqM8J8d6ZMs8nPjjVWPpYlqpJUa5Tlkdxhe5m9LZ
 Zd1JHa+7DGWRwaeCuPiV3nfRKTbbgYOuga87/tM7G5/Zow8Ma9ZXrqhEIiGonGG6dkx6
 8Y/JaKLF0IvYtFZ7y01Ut0GZVjK94Ec0LvEBzMqTVfd+7r/TbW/v64mfVt8/2/YeiOpx
 bRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782886217; x=1783491017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iyeWxppY89wILBKU0wojRM+VOlRW78CF5V2yAd/n2Qo=;
 b=A0toUM8bEtt/kVoTq3kLpW6iXI0SMC6F8wcEUbpVv5kHRNCn9QD1uHMBz9Pb4npsqr
 6gGU1tAYeC4XkOTw2roNSCZRz3dkuZ1bw6lY7lqIbIQ+tVXUpYTlNgPqhDyLhOaRkvQC
 /Wl8lyKHa2u21t4VmEWQWxAaZlQ36KmjEswGzOpYPH/FfbLa/RM4JtgE/Ptcyjg6fC32
 EaZbicvT3udIp05PrNwMX171zz1t5vhpqasWGsadjSrN/ybBZsn1E7wrXVrQKUO5ohzl
 H3mJXX48CDGX1eqTv1U4HUP1d+Op5uZZttMblq0h82w5bCueCIxWq3otkhqwwYsK3fVJ
 eO+A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+l7pXGsKiA5/z1F0SsbZf/rs4EiLIz2/p56arNMrqVFgni7mnCNtXXl1Q8iztEWCGazuLJ0c3dxg==@nongnu.org
X-Gm-Message-State: AOJu0YyRIX+MAxVsbbuZx9dXjJYK5saGpN1cgWDR5uI95Jkh4S7WiQYA
 3JCtoIwQhxiVcfUqm3/Igis4vXa1Hs3NKhhrwY1Uhc1S7V8x1uZ+bRkCz3Rf4IKdMj63+H6SfG3
 Cie6+xLMHrBGr9rYAdhQTbpmlsX41WgD3GQDO7XN3PnAv48iV/Z8xdlI=
X-Gm-Gg: AfdE7claZUhD64h8f94llrKLmJ/UTbAxSladXrpb4xtvvqXKgXOtW9XC8dyR+TPjqDS
 pDD5qMTQVHczme/QqPJmP3i2PemlLFK/lrklWHWkPLTLaz4jCGhv4Cl1QZpbB1ZuxdcQaiRX4HV
 UKOEP4F3e+mwiN6x6ePp9oPAeiUI0WQxbaBtteDvIDdINbDOu8D0A1+Xr4ik7KtBDVDO08b1Cgr
 iM7fdUf7Ip45CH82XxKjl0dyC4CU23NvsbeYDy/dE6k70Bz/oNr4SJhmskhdrxef4dQXpFVkAPA
 kbNqkOtu2dBahqdTA6VNRxGomv2gtYinqp43JusgIUnBsQycKOf00mOMQHk0lnktDnQ/mRPwWMA
 7Q182aEpn80ZQIPnmJTEc2Q4zuE23YnWQfoisFwuOvQ7tEeRj2hKfK/4VF4dC7Q==
X-Received: by 2002:a05:620a:458d:b0:92e:2c3a:a15c with SMTP id
 af79cd13be357-92e78257463mr40606085a.29.1782886216668; 
 Tue, 30 Jun 2026 23:10:16 -0700 (PDT)
X-Received: by 2002:a05:620a:458d:b0:92e:2c3a:a15c with SMTP id
 af79cd13be357-92e78257463mr40603785a.29.1782886216278; 
 Tue, 30 Jun 2026 23:10:16 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4eee27sm47292835e9.12.2026.06.30.23.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:10:15 -0700 (PDT)
Message-ID: <a5d3aa14-4b74-4e0a-a514-a8dc23890813@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] exec/breakpoint: Introduce BP_CPU_ID_SHIFT
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m4l-vk9VwG42a_JGJd3148s43EMbWwwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX02ETSt4QSJcU
 b5qnYk29OwlfHF18qgCmfj1BFIuNnWYGrqsGJMpQ6c1l35IncyTByZK1ne+Y3gSK1hUkjIe270K
 ieKPOdgw++qk+DHRUiVfqro1X3xMKXyEaokONqr/9rswKa1EYziuwPaIgdfruhp4CbxfK8rXkxw
 xYx8o5Tb7tckVts+TRXBhHeUs+GuYkoZyXqmEUn5GxQcw1Fe0Q4NkuQTIA9wpc/mwnCRfcCtZ4J
 CnKzlp1QZNQEDd+WsdStc2syJgq6GWlKz+UpovMbyMxe/90dGADHf8Pc8g5/c6MJMFme3+pO2wq
 Arxk6s5iFyuVXgRQ10DJUzhviBCKuI2/oL0HDuzeueD/sRh7qhnBkoyJ75XkxxOci4OCX6bCOrH
 FJ4iEq/8uLkwk4l2LRPP+4LQbq6V2+uvxH5ziVutiapHg//3ZASmjwjQLxEt6n+xSHYtxoMGAEN
 g0VHX/p7O9lir1nM5LQ==
X-Proofpoint-ORIG-GUID: m4l-vk9VwG42a_JGJd3148s43EMbWwwJ
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44af49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=0tBilwq7XwRVTi-M2XMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX0jaBXudOkk9a
 hP9sYP7Go53HaAd7a0XnNbnofX9BZkHHXwNwKxrQJucbHElkRNEvqK4XlpmZn8wT4sdq/sti+qm
 AiiEkXyeZvjGOcZ6lY8e1IVFxSfMj3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010061
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
> Allow the target to store an identifier with
> breakpoints and watchpoints.  Change "flags" to
> use uint32_t instead of "int".
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h | 10 ++++++----
>   cpu-common.c              |  4 ++--
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
> index fc91343875..93876f3304 100644
> --- a/include/exec/breakpoint.h
> +++ b/include/exec/breakpoint.h
> @@ -25,10 +25,12 @@
>   #define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
>   #define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
>   #define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
> +/* Bits [31:16] are reserved as an identifier for BP_CPU. */
> +#define BP_CPU_ID_SHIFT       16
>   
>   struct CPUBreakpoint {
>       vaddr pc;
> -    int flags; /* BP_* */
> +    uint32_t flags; /* BP_* */
>       QTAILQ_ENTRY(CPUBreakpoint) entry;
>   };
>   
> @@ -37,13 +39,13 @@ struct CPUWatchpoint {
>       vaddr len;
>       vaddr hitaddr;
>       MemTxAttrs hitattrs;
> -    int flags; /* BP_* */
> +    uint32_t flags; /* BP_* */
>       QTAILQ_ENTRY(CPUWatchpoint) entry;
>   };

See 
https://lore.kernel.org/qemu-devel/20260630220100.1289-19-philmd@oss.qualcomm.com/ 
;)


