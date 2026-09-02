Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2AAC624D4
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 20:49:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1rtB-0005LD-6C; Wed, 02 Sep 2026 16:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1rt9-0005Ja-QU
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 16:48:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1rt7-0006En-Ap
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 16:48:55 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682KH5G72581010
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 20:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 08sQKBeUS0Q+DiC5YvSIwZRoNWiSVPDShm7quIIK7hs=; b=Q7dIxGvy3xN6np9f
 RWfg8JTh/1Bi6jg42vlu8o3oaRxWwRwehk+5T5FJ4GhjFHbXp/dTfVvI4SqKRZej
 a16E4w1gfomeQShFllZS325RAmdSXX0Dzf5qrdq+4iwaosLRmNhwkQYGjsiU+Qg4
 0BJ5WMDxU0yccTeOoaShoxnAoI5v6PHiB/fY7wc2KsPIu2GsK4r3JF7mBCUnoLwf
 XP8XvDLPTr0EI/jw1HKb2EbL1eB7h9eybycmAgiCt4WjUODa3DJSJfCqJMkWnMxo
 3vx1o+19AEdg0SOV4/SuMFn7Syt9OQRPVAWpTLyz6ZcOinx+I1QKV9QjZazgKPJw
 IEi8mg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cakqc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 20:48:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-930b571432fso53485485a.0
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788382130; x=1788986930; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=08sQKBeUS0Q+DiC5YvSIwZRoNWiSVPDShm7quIIK7hs=;
 b=FQyrGYwZXgbl49omkw9pWOA1xWuHGxXfOxVLjfzPpqRZ8x3h6DkyrAEE1+vxG64Ec+
 jo8yZAFSQpDNe+/QNu9Dxisecqn/1gSJU1X+dz/vPO2kgV+ASHYsR7xATVc931D8iq29
 DwohaAwhqLyjQZ+FnskJEmcvi1tcsYbC99duDOOab67krZk3PumdF0+GGpcp/A+MneAq
 KRBGfI/NGKF0WnJluxauDE3s+78mOt8sWbMwjwXqca0IhpVkPuBgy5svxJj1s6zROcRp
 /Pl0Kr0ymdn/SS74ZgeJm1ObhAXiuk3mEqsHmtWDhX1OoqZoK0TRiZEV1FeVE5Aq6T2C
 8paA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788382130; x=1788986930;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=08sQKBeUS0Q+DiC5YvSIwZRoNWiSVPDShm7quIIK7hs=;
 b=UiumR/rb1A0plbNEnIwOFHQKv9l0oMZHj10Y+IOuF7sFNk6GvWJuARhmWrckMBmG0/
 BqF+NhVd3nUFnDX4HjNbX+Dt1PNZwbYBGWhtkoSEpxtP4jXCKMrVOdcDAUUuvyW++1n6
 BQjUBytO2lr+Fvf6guYB+u5zhR/2X9O5yXV3qF8S8tiv0eoR3pK99k9COpp93OBJXK8j
 weDazcFoAIH+1WeUo6D5kLd5EFPKIbaZo3HJfjLIqHOupyGP2KpBl41Ok+1r7tamLsf+
 QfXa78j0V6jnWHAnbqaolxPHmDXAJIcMzQhu7QPFbXzFcsbyhYhJFknnRA2r/3iXSQX3
 NnAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxyTexhsmidVB81WK23xeKrMsyOM/cKVhpmsKKUfCgn6MMJ6IB1slfq+9I3OtgHG/D3mBoMhdmleA==@nongnu.org
X-Gm-Message-State: AFuF++lSf1eSg9N2ry/5P46qbtyfQRPnMbDY5rfjxdzucqvtXCDMadOK
 g8WP2NK7PwpheYh/rbl3oSn7SE7JP07Qvcl525YHMbs/1HMMrQ0A1P1XN6HUvC7UWeNNGJiLo7a
 S3ab+/zfMB/NXgaTV0yPo5R6dFx/ihDmsicMmhy+sEQzWZKPL1+mspwo=
X-Gm-Gg: AYBFou3v5bBnUMZ6CVW3W76TkJg38UJcZknE6PzWKX6E100v/GlRcuZaFezEmuir54P
 C9Ac+nIEyj+AcwVld32kEhVAWHF9GLf7S8Vs1ELq5CaUvl+c5kZ1D/6dOmWOo84NgeUjaL2utD8
 12jXVyB0Y5qjKGcmO739LlgWZ2OVskIy28E+UpJmFfvEW/RTpVpK1VZ0HFsO9RbBEt3M2wSC4Er
 u5/2QPBKQi7bY06Ck3/4+ZTlqK+0EBvBjSaKec/ayauLRky1GjN+JhgVvBhcWhwMBUeBz9Ng8KG
 i3gSOk19g+sfwApdeD/4wkEIjzc/UHmLpgEYfpVQpDg7DH6rtSqH1AQN32tbpU5U0XH6U4BbTUD
 6ggIbp9h28kKCLA8gblbSdRYRnxR5eJvoZQ==
X-Received: by 2002:a05:620a:88e:b0:930:9cbc:7121 with SMTP id
 af79cd13be357-9396deacbbdmr203133385a.3.1788382130543; 
 Wed, 02 Sep 2026 13:48:50 -0700 (PDT)
X-Received: by 2002:a05:620a:88e:b0:930:9cbc:7121 with SMTP id
 af79cd13be357-9396deacbbdmr203128885a.3.1788382130074; 
 Wed, 02 Sep 2026 13:48:50 -0700 (PDT)
Received: from [192.168.69.200] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484492ce236sm9890668f8f.35.2026.09.02.13.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 13:48:49 -0700 (PDT)
Message-ID: <08547223-7789-45de-a0a2-251f412cedda@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 22:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] accel/tcg: Document do_interrupt() callback
 contract
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-6-philmd@oss.qualcomm.com>
 <1251f0e3-237f-4f31-8d2c-0dae5e9962b5@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <1251f0e3-237f-4f31-8d2c-0dae5e9962b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4NCBTYWx0ZWRfX/NIWcy3Cds3L
 7mtE2XKnyq4c3WslBuxlhXksj+xDj+yBm2t5OitfsMtOb0ydpoGCQDBRSYARrkATbZAg6TuE6NA
 BTAZfEf0xvlYpwKm4iOJy1kIdrx+W5o=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a988bb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6ax27t2Q9qs3WTDDNCkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lufZBAzOTymHjU4Ni4jb0zIMhiFRR-C-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4NCBTYWx0ZWRfX7+MweiOE/xtj
 BKHnZlHqpUQ8CIvTjSkEO1KRLFxkbjeRtHhYUy82pwK9TvHjq9gmbfe9lyKejTmwxY+BSrAN4JJ
 Zu/9LmeGd/5zFvWgONWmEtPc9aVkC7sfXMLbrL9j8HwIFTqDYAkva3eTJiThSsYZ+fjfC1kigzL
 l23jhMt7SCw7OK3vSbAlswKdwIp1ahfCFtshkJjOPs1GcjlRErVKR9HtGdZ2RVHJjXP+R78cKCq
 9ibQYvtHXDpTyu3stAr9fnGEYj8YzkMtQm0rPYGpNQ2dYl5N26VbdwWe4LzIUroNIy2lDXHefu6
 W5v1hTgIlJaKUYjCfxbNJevrqUpkgTUq5xHcHM00FOAy6sgDIK8gBxEQ/syKtnjw4VZs7nyR3DK
 N56c/aTTX0ggupEdUhwUQOJRv1gcQm/UyHMp/wDdB0LIu3pUFVDcgpktU7XLe1byDptomvUQ15t
 wczjWQSupoR6dXAkmiw==
X-Proofpoint-ORIG-GUID: lufZBAzOTymHjU4Ni4jb0zIMhiFRR-C-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020184
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

On 2/9/26 21:54, Pierrick Bouvier wrote:
> On 9/2/2026 8:20 AM, Philippe Mathieu-Daudé wrote:
>> Expand docstring to clarify the handler is called with BQL held.
>> Add assertion that this callback is mandatory and never NULL, since
>> all targets must implement interrupt handling.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   include/accel/tcg/cpu-ops.h | 11 ++++++++++-
>>   accel/tcg/cpu-exec.c        |  1 +
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
>> index 87850402203..13df70eaa9f 100644
>> --- a/include/accel/tcg/cpu-ops.h
>> +++ b/include/accel/tcg/cpu-ops.h
>> @@ -169,7 +169,16 @@ struct TCGCPUOps {
>>        */
>>       vaddr (*untagged_addr)(CPUState *cs, vaddr addr);
>>   #else
>> -    /** @do_interrupt: Callback for interrupt handling.  */
>> +    /**
>> +     * @do_interrupt: Deliver a pending exception/interrupt to the CPU
>> +     * @cpu: cpu context
>> +     *
>> +     * Called when cs->exception_index contains an exception code to deliver.
>> +     * Updates CPU architectural state (usually before executing a guest
>> +     * exception handler).
>> +     *
>> +     * Called from cpu_handle_exception() with BQL held.
> 
> Would that be clearer to ensure this with an assert instead or relying
> on comment?

This docstring contract is a help to implement callees.

> 
>> +     */
>>       void (*do_interrupt)(CPUState *cpu);
>>   
>>       /**
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 609931a0d6e..2fae2c024b8 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -1059,6 +1059,7 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
>>           assert(tcg_ops->cpu_exec_halt);
>>           assert(tcg_ops->cpu_exec_interrupt);
>>           assert(tcg_ops->cpu_exec_reset);
>> +        assert(tcg_ops->do_interrupt);
>>           assert(tcg_ops->pointer_wrap);
>>   #endif /* !CONFIG_USER_ONLY */
>>           assert(tcg_ops->translate_code);
> 
> 


