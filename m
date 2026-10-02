Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B0BCA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 15:08:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCera-00063w-FB; Fri, 02 Oct 2026 11:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCerX-00062M-M2
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 11:07:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCerV-0005fS-Pq
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 11:07:51 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 692D9i4s159928
 for <qemu-arm@nongnu.org>; Fri, 2 Oct 2026 15:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +dBTReFVPOMQ8NCk/rb/dTabM7Ldzum7OVhpPV1Xt8k=; b=ZVD5BQTrMXqVT6KT
 9BZ+Md+RRHnZoDQEuvxCzuEXA2Mq8+vuQAhr0VHL0tyKwt9ouRUm8f8BUJpNt9c2
 hdee/AemN+xMOVnxS9BakCkW8uMiwNTBJ6ugFaRb1JG4fCEKHRB4z2EsYIzsRvGb
 HEphEPsHeA2ys/UilEt/0/CQXIL3u9383yivQsOHP74ah/xcYE+2fbBgI+E3pQ4r
 VAkQ8diJtdahY8HuyunYPxYmZT9e/msZ6pIpNHN45T93/7rCSa9I4bg57N7AMhrb
 mXeNQ/qJCb5y/xipmElDWRWgChI/B8L2nupAku19TX1r+bXJRBywA+RuxotxAjtT
 hr42PA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxebpd0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 15:07:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-98a819e426aso1358606241.0
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790953666; x=1791558466; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+dBTReFVPOMQ8NCk/rb/dTabM7Ldzum7OVhpPV1Xt8k=;
 b=dtsgq300mM71Eb4FruY4TVToB0u5db+8wzxTgcUygLzYeujFF55LdpmKf2a9J+YtNI
 GMCg5Anc4y8FBiPt+TbZftXgKuQsjfS8eaqG/PQ59LDBZoS/GLoFS9KL4IoaOmHM92zP
 bqwd5MNZTXGdEB6iq8BVb7I7HllPshXRYaE003B5uiyv5hayzKErn0PGUhNHRjMm8jfw
 ppXAiL1JrtfNebS0JnKxnCu6lTWdDmPPhW1LGsNsXYBU1Mc0NrYb/j8QkzEUmPcm2srD
 DOiLbXeUlSjEzaWW3NZ2kvgL7dOaBhwUecoBzrHrVotOANIYQD4ZnnFnmpxm+Hpfw0d5
 kHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790953666; x=1791558466;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+dBTReFVPOMQ8NCk/rb/dTabM7Ldzum7OVhpPV1Xt8k=;
 b=2XPzFDGYY4LG2zxy7OzXtMVCneqP71r4AH2WlbcqxvDfIfNhCgb5R2mRWBXJQ61GDw
 MnVEq/pU6MPDIaVfjTfnIpoGGfJGR4XMZa11a7G7fduHk1Kz9QviZ8u+vV/HPg4SHM/k
 M5F1OjjU6rcJOKxEMAISyoUvxJgyKqnkLxyq9+e6W1Eqos4UAW5pAn/HXblcOU89Ym6E
 G7tNQLwlCjff4UbnJ1rmmFMx9rQQzxRsOvZ3f3dF7QTlej9/t5tlupjgbv66HLlifx+t
 MPf2Dnpb0ZtL8I34GXg9M43ukBvazDI6oUbM2aRF7BSRKq91mrkjKMwQ+xUrSfmkqdvS
 ihoQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwcSgVcp1xJ9NuQxcomClyTmggHok/Omk9q9+KA9rG/ADov0ISIDtY29jnXggQ5LFWfRnQZw9R9ZA==@nongnu.org
X-Gm-Message-State: AFq9FYJnzdNT5K8lnUH9GZVGBMQcVLneiFpSTyc9ygmZot/tcYk88dtz
 kS1Iu03pVpFd+XYsRzyD228N1bq27Yg6eQuGyZnI7RnMM34MkenxOtWOD2GZC7zHvbYiaInlvM9
 5fWz/ItFbU/EuHNRA5pkn3w+3F914u0sZskfYbNQ+Hm5GVqxTbYAsmL8=
X-Gm-Gg: AYBFou2OldzNOQZxJ0C111GQ+y0Mqe77B43NjegPBX0EERFRVORKeuJs91zfh5rVsFX
 hSGvjvkTL3La/vz8cSfiCebWhN8y2Kj2Z9YDiLYJuJ1BlfA0GFN7MZ9IjYOQNMAuVIDyDT41DMm
 csRq7lXEsVWzytQa4RCpHxvMzXBOGhimauGmDW8bhu+zAjl8al46KRBmSf8T3tyltPAeiuyNvg3
 odPYGaIv+uXD8SiXKXM2IGeEswjuHLd6KU2HQx2btwFR5NdVQx4suDrZ20eG5PdoOvY5spmYw0n
 SAD7zQZb88CTRW+VS8h+PA4xDCTlVXVKiOGaAMstapgTlbHWkqdV+UtEX0UJY4W+kR5n/5X9s/v
 hfdrUOrXuJbbjn9d2B46EzA==
X-Received: by 2002:a67:ce8a:0:b0:7c0:28e2:f9c9 with SMTP id
 ada2fe7eead31-7c028e2fcdfmr893061137.29.1790953665931; 
 Fri, 02 Oct 2026 08:07:45 -0700 (PDT)
X-Received: by 2002:a67:ce8a:0:b0:7c0:28e2:f9c9 with SMTP id
 ada2fe7eead31-7c028e2fcdfmr893040137.29.1790953664068; 
 Fri, 02 Oct 2026 08:07:44 -0700 (PDT)
Received: from [10.111.137.66] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280bcf0fsm99189415e9.6.2026.10.02.08.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 08:07:43 -0700 (PDT)
Message-ID: <ba7ed9e4-e53e-411b-8bd3-e4258fa23fb4@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 17:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] accel/tcg: Document cpu_exec_interrupt()
 callback contract
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-5-philmd@oss.qualcomm.com>
 <CAFEAcA-9R6ov530pA5FV6=ECr9qj5HP7yz=O4YtyCDJDP3qc6Q@mail.gmail.com>
 <19c91bbd-894b-4d23-86eb-00d68482aa8c@oss.qualcomm.com>
 <CAFEAcA-7DDa1u4OsH05EuD6xt0rCVwTVeQE+ppRX3tdCqg9kxQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA-7DDa1u4OsH05EuD6xt0rCVwTVeQE+ppRX3tdCqg9kxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfc8c3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DB6GxJfrPxAoVkK3jkkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: uwrNcu1w5J5tJcXj4JSWvIrzMm3X3Zh5
X-Proofpoint-ORIG-GUID: uwrNcu1w5J5tJcXj4JSWvIrzMm3X3Zh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MCBTYWx0ZWRfX7ADef7rflgrz
 wEycDlBfHVJIMo/PYnPqz8OoMbw3VRCf5oxqwQQlX56FhTmsT4bm2Mc8m1z3TGYYzRtdG3Y4i6Z
 ERYLaqTDQ4WblYaRtl6xp0wgdi/JQXP9piJgvNRD4CC3wZiNZGJ7kXcKNP8z40F8OWp+WiLx+GQ
 TsVPBnAuy3+zIZlMj5OCR9Ja/x2CqLZqjsHaz+bTO04rayulB/wkPKo28amXqbRzBd4Au8Ob873
 W/ZVW27uvSvKUKUxjGmjiOyxaQ8DHmPp2iwpt3k0lahTWauarpBfWE/z6tdTobhPXJIZRzBNMbB
 zyrLt41rBv38fRaYjuPZcr1y59EfqPngMZOoUK535/cWaGLyUYzJ2RGCG70yh2lXwEOvjCQSsdA
 GHC5i5GlyrliWiP32gu3zk5rr1wgNwZs++MJZmsOOgevnalqkUpxhzdxoD5irfhV72L2cNw2p3h
 HHWDq8ouLtSNppfpSGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MCBTYWx0ZWRfXzQQnYBUMSoyP
 qGZ7S+BQe2rDUt0lYrjlUaoIXgqfdkDjC917fHO7eDqmtWZKzxIACmE+v72jJJKvXNkUMheIdpX
 YIh3ZxkEm/U6+LmCx0k8q+xvsto+2YI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020060
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

On 2026-10-02 16:46, Peter Maydell wrote:
> On Fri, 2 Oct 2026 at 15:37, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>> Does that update sound good to you?
>>
>> * Called from cpu_handle_interrupt() with the BQL held. Identify which,
>> * if any, of the possibly multiple pending interrupts specified by
>> * @interrupt_request should be taken, using the target architecture's
>> * prioritization and masking rules. If an interrupt can be taken, update
>> * the emulated CPU state for interrupt entry.
> 
> Looks good to me.
> 
>> With the update desc I wonder if we should rename the
>> helper as cpu_take_interrupt()...
> 
> Mmm. the "exec" in the current method name is "because it's
> called by cpu_exec", I think (compare cpu_exec_reset,
> cpu_exec_halt), which is not necessarily a very useful thing
> to encode in the method name.

(also IIRC they were first defined in cpu-exec.c but got
moved around)

> 
> I guess my opinions are:
>   * don't bother renaming unless we think we have a clearly
>     better name/set of names
>   * if we rename one of the cpu_exec_foo then we should probably
>     rename all of them in some consistent way

OK.

>   * a new set of names would ideally make it clearer what the
>     difference is between do_interrupt and cpu_exec_interrupt
>     (I can't remember myself why we need both or what the difference
>     is offhand...)
/* main execution loop */
cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
{
     /* if an exception is pending, we execute it here */
     // examine async requests
     // per-target mask / prioritization
     // select (accept) intr
     while (!cpu_handle_exception(cpu, &excp)) {
         // target consume selected intr
         while (!cpu_handle_interrupt(cpu, &last_tb)) {

So an option:

- cpu_handle_exception() -> cpu_select_interrupt()
   (examines pending interrupt_request bitmask)
- cpu_handle_interrupt() -> cpu_enter_exception()
   (intr / synchronous exception)


