Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9FBCD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 10:07:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa9ep-00042N-7i; Thu, 18 Jun 2026 06:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wa9ej-00041P-3y
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:07:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wa9ef-0004A4-V1
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:07:28 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65I8DrE22246914
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 10:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B5sV73HY89E3gthBCl1awOSOckzxHbC8vr4R7GgapnM=; b=lxs0GmlJhwj6E+Tv
 BC28F2nc50rYeiF6m6PFQW7nUu092ok7fbD0ZyRz3JGoKVOH93RvfF8lPZ7qnH7O
 B840EJV1gDr9DHFI3ZqRTy6UYYp22ot5gFicsSVlHlhyoDbeegouOxXnDccVgURZ
 4F+d3LC5uWOd8rAZbXM2UOm+EScBtXQ92MOf13Ldrf8KyqAmvgxwqU1VdzfpUhnM
 zDAirqMJ0/7ae2yPRPsiepIwCmWt3S04+K6u5IHdvgH+fl1+1wvZueToVvXdeLLy
 iSyAmYWwHArE8MyVcilkM0bRlDug+408oB6WnQ9In4KfzQ4OFYmQKd0u9xkYD0Qx
 z8imlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vmcsh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 10:07:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-915767b341eso87955285a.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781777242; x=1782382042; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B5sV73HY89E3gthBCl1awOSOckzxHbC8vr4R7GgapnM=;
 b=O1oLAUta9ZbKVEzEYC1grLJB4eVAXROjYYPdyJBhYqoK3uqEEcqMLmWsEDuNueJ4vY
 gTiqMGlr+PxVdnXESFC5k1KBIOSyT1v5zE3jFjsqxji7MnvTp0lDhCDEX6UNmk5LX7Vn
 bHRk6MWu0bSvLjQhqYQ6e+SPOXRwTWqUvlAGy8zyNSSiez852gf1pZy/uK9F4rEqd6DQ
 hnYr/BcXAB6aY3g6NkIo9kQhJ4vAlSBYhw/wObXwgzHe+9+Omhs0jqVDtyA+/mwrXvg1
 IjGCIdmpINh8tsoYUA+QNXgrss+lFj6UV/0y5bZ8/tLuBuBnYIOefznhaH7WwYZBoZA+
 RqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781777242; x=1782382042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5sV73HY89E3gthBCl1awOSOckzxHbC8vr4R7GgapnM=;
 b=SUPkpsysUum78VXxHzfWe5JvBHDtifo563vlcBePYpSIowJxr2/8uiAR2m7vQs0Vxb
 hNTn8wWL3aDOVy1cLnYfxnO2ZXVbq9OeI+pAbAPtW7yxsBbwlQuYdX4CM8VMhnlGbo7l
 c80m0RZTuvxidiwRMozNDfqLi3+Q8pTWTg+8ZJ8poNbBoQS+dEpb9F5KHcdLTdPUjFDI
 98ZxT3eb84gJeMuo26MTojt2pOBdC17FnxQ5GgBz48o4qPWkr/R/Q0oKHAgZ0cy4IsyO
 DUxYM+Lvl2oLSyKq26P2ixYeuQuKbTcOVlnlOCbxDbC/Fg4/fs5b4Nbs1BmJKXc8WK/y
 4nLg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/6T9CUzFgIsVEQ4ZkmYC7rq5zLEv6p/ke48CHa1winJvrQBTBJvPgI/eUkI4M9WXfrZe58xg699Q==@nongnu.org
X-Gm-Message-State: AOJu0YxUfet+8F6Y+iP5I6VMrA3Rq20GvPSKdXx9gJ/CQ/kQUKCa3lOq
 o3Beetf+VEKEckvtqP4u3e5FMnd633wCF4plfPIonXI757hlssNHy4EKXV/DYFQ2JuWxc1UqBbx
 edKuo7a9ui9EJNZaZJcKP1WeH8LvAnlRZ5PyAk7O68EljCqMAi5HABt8=
X-Gm-Gg: AfdE7cnqAyvQ7MsCf4hgNXEkv37X+9yD63t4jkqgb95ERFtmWRklkUSs7Oujmd0GhrF
 SoHg8djrd8qJ/U5InOrPgsLuf+h7LJLjz/X0uQSKaKN7x/B+OpMT9M3M7Kztmt8pm2k8m/w0fPE
 Jqos31dlpS0shjpLVz02AkAXRHBJlzbrGL5qpSemxYogqnbLzGDFDL0oAaXdhzjWUZ/YPQ4QPEZ
 FP3NiMGi6H/j+CU8JeyDr9lZxG3F6XLzOUMHJkgRYyU9Q5iAT9swoFJjCoudw+g6Zgw3AMVA2TS
 7RTgzhun0KxY9jp/jDHl6oxVFPtg7ufujil8ebZxpJ4P0b2pIZwK4yJiCKr4zT2GvYxEvfw+lVr
 t61ntR7sFFekWvGUXeD0hY1Qr/XbWHIyt4cLqt4FQypCzI60STyRhDLfmMhPUGQ==
X-Received: by 2002:a05:620a:454a:b0:914:bb8e:915c with SMTP id
 af79cd13be357-91d8b8ba1f8mr1302846885a.22.1781777241739; 
 Thu, 18 Jun 2026 03:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:454a:b0:914:bb8e:915c with SMTP id
 af79cd13be357-91d8b8ba1f8mr1302842285a.22.1781777241261; 
 Thu, 18 Jun 2026 03:07:21 -0700 (PDT)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4601esm257100965e9.1.2026.06.18.03.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 03:07:20 -0700 (PDT)
Message-ID: <42927637-2e5b-46eb-9d25-8315cd36fda8@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/arm: use correct base address when setting CBAR
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Arnd Bergmann <arnd@linaro.org>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
References: <20260618093615.3793919-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260618093615.3793919-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Gjp-f4e36etP8kVsW_glEDLa20qm7ubH
X-Proofpoint-GUID: Gjp-f4e36etP8kVsW_glEDLa20qm7ubH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5MyBTYWx0ZWRfX/8UxlSJxtEp+
 nx4v/MVXf5k2RHUb4gb4UKNGlkp2mJGTTwoGmBy2ucC2G5ESCs9ObZhbfMHx04IhASogZcw5RQA
 AccaekluWeTm1DEAxNIJ9r1CG/RBb2Plvb3Pd7XxDtQfhhoOv+TmAnppNnVlR3PliRD5sEiVnmV
 J7Qq7W5g4NCfCm1u64PusJa3iYCa1+LStXoMoO6uc6RRONp1fsoSbu0+X7C5rdrBX9v2IllA6UV
 nIOvKWyvyQcQHfmBddJj50B/8N8wkRTtCUmwEIGeyDzg9lnoGMFUWjwI0aAfKFdQ/pmyoquzkHW
 JRJIxrZV6Joidh66aRrrOLUYneFOPyKeuWcZxmoL24vDOQng+x3YNYuZZbAWhiVnm9a5vX7l5gS
 X7I5UePG97Z/so+Jn5AuicFVCo2m5VcL2yrBjm2cL/85h6446rsAoL/ut07VJ765DnzJWhqKSC7
 gtc7ZiIuzAEVGOqQHBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5MyBTYWx0ZWRfX0dSQdUtOIp0v
 yT8l8aePwEaNyf1DjfthBB0/CvLqzzKTLTuiyb6vBYDbDfVgT7tJxyfNKuQMT2LUu4bQ8WxuBUR
 Q21/iY5z7dmra+gnaS9cV2Ryu/ilrXw=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33c35a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=Sw7cnfgtHNjO5mK55CcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180093
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

On 18/6/26 11:36, Alex BennÃ©e wrote:
> This should point at the base of the Cortex-A9 MPCore private address
> space. If it doesn't we will confuse the Linux kernel as it probes the
> SCU registers and erroneously assumes the system is a buggy Aegis SOC
> and nerf the emission of SEV instructions, deadlocking any WFE's in
> the kernel (or QEMU smpboot code).

I'm confused...

   The Configuration Base Address Register holds the physical base
   address of the memory-mapped GIC CPU interface registers.

NPCM7XX_GIC_CPU_IF_ADDR is the correct address of "the memory-mapped
GIC CPU interface", NPCM7XX_CPUP_BA is the A9MPCORE SCU MMIO address.
AFAIU the modelling looks correct.

Per your description, the Linux guest tries to access GIC_CPU_IF_ADDR
but ends up accessing SCU_ADDR? Maybe the issue is with the
arm_boot_info::gic_cpu_if_addr address we pass to the guest? Maybe
the secondary reset code is corrupted?

static const ARMInsnFixup smpboot[] = {
     { 0xe59f2028 }, /* ldr r2, gic_cpu_if */
     { 0xe59f0028 }, /* ldr r0, bootreg_addr */
     { 0xe3a01001 }, /* mov r1, #1 */
     { 0xe5821000 }, /* str r1, [r2] - set GICC_CTLR.Enable */
     { 0xe3a010ff }, /* mov r1, #0xff */
     { 0xe5821004 }, /* str r1, [r2, 4] - set GIC_PMR.Priority to 0xff */
     { 0, FIXUP_DSB },   /* dsb */
     { 0xe320f003 }, /* wfi */
     { 0xe5901000 }, /* ldr     r1, [r0] */
     { 0xe1110001 }, /* tst     r1, r1 */
     { 0x0afffffb }, /* beq     <wfi> */
     { 0xe12fff11 }, /* bx      r1 */
     { 0, FIXUP_GIC_CPU_IF }, /* gic_cpu_if: .word 0x.... */

Can you check ^^^ this value?

Maybe this code has to be updated for your WFE use case?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Arnd Bergmann <arnd@linaro.org>
> ---
>   hw/arm/npcm7xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index c2bbcd89dbc..c27f149c04a 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -492,7 +492,7 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
>       /* CPUs */
>       for (i = 0; i < nc->num_cpus; i++) {
>           object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
> -                                NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
> +                                NPCM7XX_CPUP_BA, &error_abort);
>           object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", true,
>                                    &error_abort);
>   


