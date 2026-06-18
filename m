Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C57CCD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 10:50:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waAK0-0003QN-56; Thu, 18 Jun 2026 06:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waAJy-0003Py-Kt
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:50:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waAJw-0004lR-I4
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:50:06 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65I8FbKs1011333
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 10:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D2c2QCRLRKFixyGBVD8SSuMzduqCIpkMMeg5pN2ivbk=; b=QErSsThyJ+dNM/Oo
 oH0a534BLz8oXZ/hhQ1+9JYzDE78vpmuIRSqDVS+bOvW5cG2gh1Ks1rWTHzqcFxD
 X6Oc3eYsvWGWoo+xe1Q8EIErOT171uKoG0lzl1//VquB7/i7LJjEhvZJnvabwdBL
 TWBe1i9p01TOqlSilNuWan4/TVD44Rj/Zrpq1HHrhb+X4aWljLt3yrpZXdm2Mdps
 O5CbOQfQA6PD2yRw5OXLXoCZMlwaePTF89vp4InGx2mUVCy70nGXL31DIbKCrb2P
 HSh7QXP5muf4smPvjxNsQZKfwy9d8j0e2OFoUY4qruPAx2brM1NYUgUcMXV020GB
 UyBA/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rttwjr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 10:50:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9157ae36434so147013685a.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 03:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781779802; x=1782384602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D2c2QCRLRKFixyGBVD8SSuMzduqCIpkMMeg5pN2ivbk=;
 b=RGCx+QHLiRKoelXSXefui+VsfV/8V36z0ifYSgviA20xJ1NOCzUyfxNGCPQ26VxCo+
 QfTqX9O08xpj922L4rG0T8BzgQPKl+YfUeyfDC/Y/oGcIgJyTnPN61WpZUemraD5xNz0
 S/0AknwKyIHTWInhnG0CXoXXRxBRkyk+EJDEN9wKPpdG153YNyLzxY4eUxROVG79w1FM
 QcQQ/6ITwLDdjk1LPpClwf1CvvyweOzmIUp21agSD+NRdurRQkb52K0+RBE2XugdJQSS
 NYlZM8bwhQtcaE2pyj50Naz6B0KYKAf/HxJwlcIWt6etVz56OMXAG4SaY0PsDAgiVgkD
 L57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781779802; x=1782384602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2c2QCRLRKFixyGBVD8SSuMzduqCIpkMMeg5pN2ivbk=;
 b=qS2y76IruCbfgXlbWMlru6gAeHKup3i39lBF92JN0DGQQQOQupmsYA/U9GnQyzc3EP
 eugNt3180eOQXZ9WA/hIIzvz45I8c9aGftTsBO/Zr76eGBphjEdCbDAVbrrSUkGhuHyu
 s/Fdf0dTtewqMS3mAdUszXhqtz5EN4aJpvYVP62JVZVu8QRneZakP3e1y8SoIrJcfg3c
 jc5XRoS5KIUJeRRLu5Tj+JcaDT43ATIDmcq+Zu94k7oL6FJInhEi5T6lLVw1lLfJY/0r
 WgCnOr5zSIDbMse+h3vwZyYQ2tpcRKBZNQFyAgEwAs+9T+Xzk7/+35aZXc+Dcts8iTVA
 360Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ84Ep0FaAFFXPxQaMKO5CmmGaoeGPguqjVeXiDnevOiOngS8Edb+jAq2g26pl477+LNiqobdoT+hQ==@nongnu.org
X-Gm-Message-State: AOJu0YyjklhRK4cmjfGz2OoZiH8yds82DZFSWbHulKh7tdeqvOzsK+eq
 dcNN9T/gag6YHw401pH4zKl3co01th+6R0PRyWHd7xYk/IPj8L5VjtFk2TkNBKzw045qUBFWqCY
 x4ZNO43432L3Hf1vKb0PaRjF3SbEpQOCceNuXBHjx9acQwEo6rLV7coU=
X-Gm-Gg: Acq92OHKpCyfWb0RsKJ3BE0eNBnNe/YwgkwzqdnRQbrUd4ax63O9hxRQgCPmxgoKR51
 U04vnugldfG1UHHqJWHfvc8kY/+5OkUhiG0/vNtmYzLU9RQAbcLmtFhndFuiGEQjS1Hg9uiYvKS
 15yYkNjaAX8QsUvU1DKJyazjfHZTyck68LauJpraiuerxFIu33EjR5cgB5TX/n+7obFNXosFEYE
 bRDu7ExN70yp4bIYXJ0MoTUEmu4ZByGxXJoeacIgFXJ8/KUSd7LZmnKPuc0HQLqYfp5s8MarC3a
 GIs+1YKcXwuBNFvALpImUMtzgFaHEABzoDwB/h55yHrs0CK4ak2vxcrCCBLsIyTnnESyTfsi6+h
 UZYE2iuc5Xhs7ll4XDZ7FkqtOaiGLvwx2z0fI9UBj0bslWUhvHSKmGx8stSLJNQ==
X-Received: by 2002:a05:620a:199c:b0:915:673a:617b with SMTP id
 af79cd13be357-91f2711865emr477997585a.24.1781779801749; 
 Thu, 18 Jun 2026 03:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:199c:b0:915:673a:617b with SMTP id
 af79cd13be357-91f2711865emr477992185a.24.1781779801300; 
 Thu, 18 Jun 2026 03:50:01 -0700 (PDT)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c4240sm56854962f8f.27.2026.06.18.03.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 03:50:00 -0700 (PDT)
Message-ID: <be94d200-e1a2-441c-9d36-cb3a370b9576@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/arm: use correct base address when setting CBAR
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Arnd Bergmann <arnd@linaro.org>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
References: <20260618093615.3793919-1-alex.bennee@linaro.org>
 <42927637-2e5b-46eb-9d25-8315cd36fda8@oss.qualcomm.com>
 <87pl1ogmmf.fsf@draig.linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <87pl1ogmmf.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a33cd5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ExKqf3VzcCyPesANViQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwMCBTYWx0ZWRfX+lEqCgG+j2yb
 CSglWopvRYUNuaUpNZp33PnDaB/gvPVoMMuRXNeBZ7gGjY4iUgr5wd81Tf5eR/M0SP2vzvmAQdl
 YHmLSLv1AR1lTDnuP7N3gjUECfCNqWdzDtT4/WiCPBQKCqTCcQGfKpEGTYQwdHXEKYR1VTputgF
 6XB/7sgxptkeHsjEKXsELSEfXvkTaxAxhqvVAGYSOSMMFMkSA1qMVWrJwDGlRy4GJTtX9C3BKDQ
 y/m3LxleuKY2hhhslIlT9KFPwyGNSv4PQluUhajoDCfAS76efHxm24PLTLWM9R407lFfry+t84G
 PPJxLy535j6VOHv9HqMMTfbIskkQlXA3mtwvl/0BxiwtCa+axoxyRHZDoVeJGxh6V7dmnlo9iWK
 uq5ki+iBVGx4l26kFvAizWL3735cmvcrHuIENq1tbeApQt7ZB48CRk9X+GaJ9c4TqObfuID4NlD
 FdTe9/R4cMbyDMdXStg==
X-Proofpoint-ORIG-GUID: PwhEygUYV43DgZ7mHWTWxjsRwBifxYaU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwMCBTYWx0ZWRfX1lQIk9MnDv1q
 E/YcYfhuiCQVCNHneYFBp84So4+9YKnnveY//DTeMhY2MLd7qpl5VdRg1qcrpiVWuppBec1KXDu
 QwWbnCRLsrT3Q0uOQq3aPnSfrvJbA6U=
X-Proofpoint-GUID: PwhEygUYV43DgZ7mHWTWxjsRwBifxYaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180100
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

On 18/6/26 12:37, Alex BennÃ©e wrote:
> Philippe Mathieu-Daudé <philmd@oss.qualcomm.com> writes:
> 
>> On 18/6/26 11:36, Alex BennÃ©e wrote:
>>> This should point at the base of the Cortex-A9 MPCore private address
>>> space. If it doesn't we will confuse the Linux kernel as it probes the
>>> SCU registers and erroneously assumes the system is a buggy Aegis SOC
>>> and nerf the emission of SEV instructions, deadlocking any WFE's in
>>> the kernel (or QEMU smpboot code).
>>
>> I'm confused...
>>
>>    The Configuration Base Address Register holds the physical base
>>    address of the memory-mapped GIC CPU interface registers.
> 
> For which CPU? These are cortex-a9's not a57's and the behaviour is
> IMPDEF.
> 
> See:
> 
>    https://developer.arm.com/documentation/ddi0407/i/introduction/private-memory-region

Indeed. I'll let Nuvoton folks confirm that then.

> 
>>
>> NPCM7XX_GIC_CPU_IF_ADDR is the correct address of "the memory-mapped
>> GIC CPU interface", NPCM7XX_CPUP_BA is the A9MPCORE SCU MMIO address.
>> AFAIU the modelling looks correct.
>>
>> Per your description, the Linux guest tries to access GIC_CPU_IF_ADDR
>> but ends up accessing SCU_ADDR? Maybe the issue is with the
>> arm_boot_info::gic_cpu_if_addr address we pass to the guest? Maybe
>> the secondary reset code is corrupted?
>>
>> static const ARMInsnFixup smpboot[] = {
>>      { 0xe59f2028 }, /* ldr r2, gic_cpu_if */
>>      { 0xe59f0028 }, /* ldr r0, bootreg_addr */
>>      { 0xe3a01001 }, /* mov r1, #1 */
>>      { 0xe5821000 }, /* str r1, [r2] - set GICC_CTLR.Enable */
>>      { 0xe3a010ff }, /* mov r1, #0xff */
>>      { 0xe5821004 }, /* str r1, [r2, 4] - set GIC_PMR.Priority to 0xff */
>>      { 0, FIXUP_DSB },   /* dsb */
>>      { 0xe320f003 }, /* wfi */
>>      { 0xe5901000 }, /* ldr     r1, [r0] */
>>      { 0xe1110001 }, /* tst     r1, r1 */
>>      { 0x0afffffb }, /* beq     <wfi> */
>>      { 0xe12fff11 }, /* bx      r1 */
>>      { 0, FIXUP_GIC_CPU_IF }, /* gic_cpu_if: .word 0x.... */
>>
>> Can you check ^^^ this value?
> 
> I don't think we use this for npcm7xx:

Oh I missed the specific smpboot[].

> 
>    static void npcm7xx_write_secondary_boot(ARMCPU *cpu,
>                                             const struct arm_boot_info *info)
>    {
>        /*
>         * The default smpboot stub halts the secondary CPU with a 'wfi'
>         * instruction, but the arch/arm/mach-npcm/platsmp.c in the Linux kernel
>         * does not send an IPI to wake it up, so the second CPU fails to boot. So
>         * we need to provide our own smpboot stub that can not use 'wfi', it has
>         * to spin the secondary CPU until the first CPU writes to the SCRPAD reg.
>         */
>        uint32_t smpboot[] = {
>            0xe59f2018,     /* ldr r2, bootreg_addr */
>            0xe3a00000,     /* mov r0, #0 */
>            0xe5820000,     /* str r0, [r2] */
>            0xe320f002,     /* wfe */
>            0xe5921000,     /* ldr r1, [r2] */
>            0xe1110001,     /* tst r1, r1 */
>            0x0afffffb,     /* beq <wfe> */
>            0xe12fff11,     /* bx r1 */
>            NPCM7XX_SMP_BOOTREG_ADDR,
>        };
>        int i;
> 
>        for (i = 0; i < ARRAY_SIZE(smpboot); i++) {
>            smpboot[i] = tswap32(smpboot[i]);
>        }
> 
>        rom_add_blob_fixed("smpboot", smpboot, sizeof(smpboot),
>                           NPCM7XX_SMP_LOADER_START);
>    }
> 
> 
>>
>> Maybe this code has to be updated for your WFE use case?
> 
> In earlier attempts I did drop the wfe in favour of a NOP until I
> figured out why the SEV's were not flowing.
> 
>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Suggested-by: Arnd Bergmann <arnd@linaro.org>
>>> ---
>>>    hw/arm/npcm7xx.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
>>> index c2bbcd89dbc..c27f149c04a 100644
>>> --- a/hw/arm/npcm7xx.c
>>> +++ b/hw/arm/npcm7xx.c
>>> @@ -492,7 +492,7 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>>>        /* CPUs */
>>>        for (i = 0; i < nc->num_cpus; i++) {
>>>            object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
>>> -                                NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
>>> +                                NPCM7XX_CPUP_BA, &error_abort);
>>>            object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", true,
>>>                                     &error_abort);
>>>    
> 


