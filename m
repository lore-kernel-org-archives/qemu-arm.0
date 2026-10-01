Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADDECA5FB3
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 11:13:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCEic-0006f6-6y; Thu, 01 Oct 2026 07:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCEia-0006eq-Ck
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 07:12:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCEiY-0005pg-5B
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 07:12:51 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6916xheH1511997
 for <qemu-arm@nongnu.org>; Thu, 1 Oct 2026 11:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mjU1zgIqCdOifyq4ANWvguLxVIoQF5yPoPPNxz6Ts44=; b=ABpWgK0L+ifNQFTs
 Jr0vmCpILitcm1aIXx9iV/Q88LRfZ0+Azy3DrJPgxdi2EKz0CPRjwVqhe5mQqzzy
 a+WRJCfqAocRNhxJJfA+kniWNPxhSbaxnDmAiMU3mII3xZ5PIwzJFFQKDPoS423I
 oS2OJJnjbh655GeKISLo7WDpEq4Gzyzx8cPImdImXNw7NJNAO2ktp9Czt+fTYB/Q
 2D7NFZ4VHXWVI9xdi4CpzCIFiuo8ClxLe5sdv82bpPVw7pJEjEi5c3tOCflFdXu0
 laAPTH9lWXyQ77Dh6vlPy4fVGBM+Kl5ukzk128MPBuvHg+zX717IXK0PEyF5D72y
 ak8W/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sue5b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 11:12:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-936aa34873bso1169538385a.3
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 04:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790853167; x=1791457967; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mjU1zgIqCdOifyq4ANWvguLxVIoQF5yPoPPNxz6Ts44=;
 b=jY+CqsAhyfluHXmlkdTp0Cp8QZpVfyH6rUGesEcc6HfPA6p2vQI2Rw2o3ffyhLuT/1
 0Nfw38wU4ys7QVMAZIVzjTmaW0LWzD2DOoML4uikS2dZCF6Wq03Q34pDuiWHLaMVGj0n
 zwyrP3sQuslhIC2q/eEMzzKKBSOqebxzE1g6/ftJbDC8ZNAoON4IrFmd1XdrbGQeBkLq
 j5yi/nE7/uVqaMi46Rj6vQxzMnEGk6lpSG8XoWsjmZhN45qfM5XFY5CCPRoQ1L8gO+eQ
 a3bTaO6+c6R1IThYEdjgM6vzM+unyms7Vqj42csxBRbggYiJZlUqCdifS+7KDGTvGrht
 XKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790853167; x=1791457967;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mjU1zgIqCdOifyq4ANWvguLxVIoQF5yPoPPNxz6Ts44=;
 b=Z35+AjuwwKqYIHeV5tfq9g+Ju4AyfxyLaoXInQHzNJiyi/DWkZ1Mov2q3eX1oeTcX/
 /V0osbZJs231+LNM29KuhBZUytEMcB1orOaMOuxPvrJBw6Qp+MNFWulrzdxb9vgMD9VW
 6OxfcIKyu8/msgr0phR9TRANRiPk0UDXT/Xnaob2f/ePYQCSv9lZRftl//mH7zK/TBKS
 5XLtUYqW3nPUKwwKE0IV2EOxvwlDhxp1IOyO2g6ljgGMJt85t+A6B/VdZngp/2G+/9Aj
 kuH/OpAx1K6GtBTeJHjIAVGRKNF82IAjy5PIgPr8nUU3YKQagxqyObSMCc4lRSJPU0y1
 7X/A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzUAYZb97o4q/O6ZWYmu7Ni2hK1WQkTK4hzJh9ZwKa3lgi9pWXNX8eDx29O2kjRa4IruvB6z4Jyg==@nongnu.org
X-Gm-Message-State: AFuF++kvgPiwewMW5jlmWJQaNG3ygQwjy5fre32R0aJSjtmbkglHNkiH
 YpcyShsDupYavG/kZp/tYXIZSAjYmQXP+ze2DJFjtv0xsTsqNlDlxq3Ot/ajQ2f37vQFhsIpRbj
 vp2r0cnnB0ETvpIC+7e7xTZ07vDJmkMDQLmFYY51WYC+q6j0tWA6/jNk=
X-Gm-Gg: AYBFou322OWsn+3oD3w7NwwzwK7vrxa4zwMjuP9Y4Z1FVEUg4SykrQNjNYksCzajfjD
 +OcyecBIjoR1PV7q/MifbgMNI8i2SxwYYVrATKu4LLlpSgFBo9sh5yQJ3j7PS+4zdg7CS3HV1gH
 tegk/elhoxfS623v1gfKAqv7/5lYT253UvC/VSkY6fRxXNnYeDAwJP+D2JrKkX2wBpDWN+tcPmj
 3LQlFaNm03g/+46MArY7jQmDHwockqY7abqM98AcWP2w5KssqB588uJIVb+8xIiVpc5gbf7hNbE
 ewDGQm8+LNVYbOE2nVNUrUHoI59ZQtnnp1b53kJKUoIreg2MejJEen99qMJ2YW3jWaVIlwEY0vc
 HwmhqQ15mGtFmqB104Xov6nPLYYii/rilew==
X-Received: by 2002:a05:620a:1d05:b0:93a:3d67:391f with SMTP id
 af79cd13be357-93ca95da7demr812471285a.7.1790853167169; 
 Thu, 01 Oct 2026 04:12:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1d05:b0:93a:3d67:391f with SMTP id
 af79cd13be357-93ca95da7demr812466285a.7.1790853166657; 
 Thu, 01 Oct 2026 04:12:46 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068ff95esm5287609f8f.12.2026.10.01.04.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 04:12:45 -0700 (PDT)
Message-ID: <9925dc2b-fa08-4025-98d9-3efbd2ea2388@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 13:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] target/arm: Kick vCPU after updating PSCI power
 state
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
 <20260930174946.82195-10-philmd@oss.qualcomm.com>
 <CAFEAcA81kUriHYPj2EBNYiBsJUMmgknCGRif0q0cc5sndro2dg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA81kUriHYPj2EBNYiBsJUMmgknCGRif0q0cc5sndro2dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NCBTYWx0ZWRfX13g9GFoWQaWH
 N3G44330peXZ50SbmiaIxXSIdC6c6pNqoAlQvRwA2YNll8CI/ytOk6NqHUktDuQ/gWGlfl8GIpq
 TG2PwNPPRc1Dqus7n2Ff3ouqLP1FdPs=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe402f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=u2Ol0uY6ccU20tPPq4kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yUYR6OsO_L82jt5xrWelC5U01Jo9nhgQ
X-Proofpoint-GUID: yUYR6OsO_L82jt5xrWelC5U01Jo9nhgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NCBTYWx0ZWRfX5GUT3f2+JXiR
 7EnCZPyXxhyjTLi1Je2FqDNPPfPg9SlCnvhmSf15tPSXHT8bBwd//iM/0OYeXF0IRbVHolxVWYA
 qN4GPSd1H7fRg6ocb6PqtUtVVfnjY6UfZX3uEqzUZRJ4iICSuPnisWRRtw/BBvGfh+XDrXYDetU
 NowczxrXcOlr4SUZ7XX5jWA0QnwKO1cgcQweoz+Xc2nMawLa84ETUmfCWONntlhe4CkIJdjMmip
 jkFzYez77X6ICL/Al4wXjpBPyf7uZGvjWnumlFrYs2BiqCrQpMMaIN+cYJQOKdtCgwS6mSCOJNF
 YrR/ijp3ynlknVcx9Ppj7dTsuK9WYUPruJsAsWi1iMqneuBZCFtJ5fJXmBANeJeBL8o6mArWOON
 EONAOSmXfyc5eVfH6NHxdNSxXJwQ5ziGR4lXO1a1K3s+88NEwSNEKn9aqvLm8X3sawJ8Xbp1Lpt
 +zUk7/k7U24Mg9OfmgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010044
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

On 1/10/26 11:53, Peter Maydell wrote:
> On Wed, 30 Sept 2026 at 18:50, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> PSCI can update the power state of a vCPU other than the caller.
>> arm_cpu_has_work() reads env->halt_reason to decide whether that
>> vCPU has work to do, and is called from the vCPU thread without the
>> BQL held. A remote power_state/halt_reason update is therefore not
>> observed until the target vCPU is rescheduled, so the vCPU stays
>> halted and a PSCI CPU_ON of a secondary vCPU can hang.
>>
>> Kick the vCPU after changing its state so it re-evaluates promptly.
>>
>> Reported-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   target/arm/arm-powerctl.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
>> index ef14a1f8a94..1ba5277b023 100644
>> --- a/target/arm/arm-powerctl.c
>> +++ b/target/arm/arm-powerctl.c
>> @@ -48,9 +48,14 @@ struct CpuOnInfo {
>>   void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
>>   {
>>       CPUARMState *env = &cpu->env;
>> +    CPUState *cs = CPU(cpu);
>>
>>       qatomic_set(&cpu->power_state, state);
>>       qatomic_set(&env->halt_reason, state == PSCI_OFF ? HALT_PSCI : NOT_HALTED);
>> +
>> +    if (!qemu_cpu_is_self(cs)) {
>> +        qemu_cpu_kick(cs);
>> +    }
>>   }
> 
> Looking at the callsites of this function:
> 
>   * three places in arm-powerctl.c call it from an async_run_on_cpu
>     callback function which runs it in the context of the vCPU it
>     is changing the power state for
>   * target/arm/cpu.c calls it from within reset for the vCPU being
>     reset, so we definitely don't want to kick the vCPU
>   * target/arm/kvm.c calls it as part of the "sync the vCPU state
>     to/from KVM" function, which should only be running from
>     that vCPU's thread
>   * target/arm/machine.c calls it as part of an inbound migration
>     to set the vCPU's power-state to whatever it was on the source
> 
> So I think that in the cases where we're actually running the VM
> the if() check will fail and we do nothing anyway, and in the other
> cases (reset, migration) we don't want to be kicking the vCPU.

Indeed... Paolo identified a possible race problem when discussing
the generic sync changes around has_work() so I ran to address it but
failed to correctly audit the call sites for the ARM case, and this
indeed does not occurs. Hopefully the new comment added in commit
fbf08c0fbd5 will help reminding we need to be careful and not try
to protect unreachable cases.

Thanks for the audit,

Phil.

