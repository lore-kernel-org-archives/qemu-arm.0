Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C530CD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 10:54:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waAOB-0004vf-SA; Thu, 18 Jun 2026 06:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waAO7-0004sa-0M
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:54:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waAO4-0007Th-69
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:54:21 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65I8G1Z51157433
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 10:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZMYt+DHXS7dthsc1QXVCJ4kNmhnkMRP6cphseZvJBeU=; b=D6W8gsQtWhU1Ye1d
 8tBweYGPei47sUqMG19irrUQRNmwriYE8J9vXsaJLhT8RpgRKynjuMJ4CnsCofjr
 N/yvzWAjcUbn8ZgONuA9ZYo4uuTJRqWSlF7r9Tpqll7328h1rHzOJ73fh8+cZo7w
 59VSGR9P7eSaKL0VnNBu8yAgV4FvZs+Cyk3BVw5WQoFAeERklcrBf8hqlIxIdIaR
 bCTMLnl1tLjtG4UfvtKWBNPTuQPa74fxFIY8R5ajnI1DHjWdDB095I3bJmNnntUb
 UF9x/CrK0z95rpDpFYcTt0sBGm9uUaKmPCsWlAi3eFs1GLt/G5lRozm/1LbS1jHC
 wu9aAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a31wk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 10:54:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9158f2c4b55so159672285a.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 03:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781780057; x=1782384857; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZMYt+DHXS7dthsc1QXVCJ4kNmhnkMRP6cphseZvJBeU=;
 b=ihRLl0SZIRCKAa/jYT8FOrDnICERFVawhOS4lKN8ctuwtA1k7leZ4LQorH2rXqvoFh
 gxQ7wCaDJ2GAMDGgk6sCX+gQwR6z1odlt+dgpc3cSUad7itzRPPU0u1FrzjPXEIY+Fjb
 /gmC8szLAB8UlLCRDaOvcn6fgZVu29fw08NFYMQD8rME90Ctpf8QGU6+M8tiz0AqYJMD
 Oh6zKkk3MSYkOMrbvI/CC7OTNGJNA2/EdwLZ3BFP7u6hpN7TkbttyirzwIupdAQ+LW6n
 NAC/FNRqNgSSvWjglUUXgkJjEVugvkndZ/3qCScddb7ldqS6oAsMAAhR8zPhf1+nMevD
 geng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781780057; x=1782384857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZMYt+DHXS7dthsc1QXVCJ4kNmhnkMRP6cphseZvJBeU=;
 b=LR16pS+i93xLPiPLYoZhbvMruTzc8IG+lySP9U0C9ZYuR4sQaycS5XE2b9NSYX9XNj
 j9x9POaalXNQmFOLssT1Tp71dOj8uzY5W4dMA6/+pyxtgCftaTFiXjj7TAO5BQWALv6X
 9ZR9NM8u/klqC7AkGafAdrRaQiMl91czmbttqfgrZ1bvWk+vDbDcZAKUVt+oa9i9t6ZN
 iNJwJ6onCnd+ewFaDC4P/pzPfCmprfttF2R+9iVvBVoc+34ihAIHjEbMG/LEMRimS91S
 AF7xzgv7qFFm9uwV+0z77maZWrzSZGytiE18mmrftSK13KyaRp7rPgqrhEOWXdVCmhIW
 QeUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ81WqESZUp24R4zN09iLmVTea9F3oC6Jr6x+ClH9j+2C/j65OXEOx1cwttzQOwaPHYnRYhNVYyaKw==@nongnu.org
X-Gm-Message-State: AOJu0YwXW4POPFxN/iaqGQbKLDaAm07sjqMIjLBdayAftzDXDqtWo+63
 CdLdiipeLXDXM3/jfYZ00UPiYKhjYnZ//vRwjZKzhiRROY+WvJecQFJaYiQ4ybsZ9+ClKEK9xtW
 ojLax5YUzQR+ad4DzdAU9HDaXq75GxkHRt0umYwUJIQA++0kSLCXqHLk=
X-Gm-Gg: Acq92OHQOeHnPbA+qMhDddbKg+DhaJp/6JOn1YS/0SPy8r5Ms1D1c/UhX+nG9ce6sgf
 MXaxp3F4wI8D5R3Avmd0Lx+0MNRjrHpmSt08U61j8gVbjavVmIEWA8V4hJ8uIs30zt02Zm9MIOq
 du2ht56TheFbE/DxZ4vLOGo1OG2v5wxNtReA7Fn4gLsg/5hGvArr7ofEE2PatEOfYX5KdlyIJGG
 9C1FuHJOva7kd9g3kafzZ5ZwRkpUOMY2t5DjvboBLJwdRGssUlBQeqpEBq/UQLJGyk/Av5ZBb0Q
 tf9BPdukhBvRHee/vCEvxPrzPbeq6nQD1PTtyPKeWnNQ2Do+bkwXZ0s82ZLEnj8JeAZRhvbkjDh
 AqOFxJNCqQJpLdW9UcLLcygUOkX+eCeYklpRXLvHBTEVaKXgZdr7xUhUeU0AAkQ==
X-Received: by 2002:a05:620a:45a2:b0:916:15c3:cc6b with SMTP id
 af79cd13be357-91f8f809756mr206510285a.55.1781780057309; 
 Thu, 18 Jun 2026 03:54:17 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:916:15c3:cc6b with SMTP id
 af79cd13be357-91f8f809756mr206506385a.55.1781780056811; 
 Thu, 18 Jun 2026 03:54:16 -0700 (PDT)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923a159d06sm45596265e9.0.2026.06.18.03.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 03:54:15 -0700 (PDT)
Message-ID: <a126c155-7fd6-4540-bd86-e192f53c2f6e@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm: use cortex-a9 mpcore base for CBAR on npcm7xx
 machines
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Arnd Bergmann <arnd@arndb.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
References: <20260618104654.3840263-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260618104654.3840263-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33ce59 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=GTcQOl0uEnhcYneNamYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwMCBTYWx0ZWRfX7vi+3nDu1f6z
 BCUfr3H/LlK7ZTZS/l//nRQ5XBRo7FIh9PFD2wvJpyIsK6muh1grQUPNqBbW4CF6OMeXrYgcGFG
 EPRZpFmRwVA+nquv20FQ2DiVmBpASwI=
X-Proofpoint-GUID: hDm1B4DTFOsNu_sGF0Qx-KnNGhSuq6HI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwMCBTYWx0ZWRfX6ybSmTMbdzTi
 R30j9Sr833hpAO0c0xkQY9aflpFw9NFoq/fkIYgZXTR2OOmr32JOVArvP7Sh23bclGJJ0xip6Jv
 wCQT8OmtTM2wrkC2sarJcjteWmxIOTTO4Lpf7tYFhhE7F2u8lUEnxoAG+ulqWKjFQGGKWOJn3lX
 7zRf3o2nXZppeoVhvbx/bPgKtr2WjS9lGDeK3y9MGFg6JmjccEydES6txllObK9dMuZD6BmoOjb
 x9yuFLdJN43wFqHF1GJxZ9LPHaECCCdA96gWhtzPRxF2r2XpQN+Vqw9QfJCwOulw8OXOen9u02f
 PE5ezaN+Qt6JeVcm42o/T00uKyiaBc1DD+ogYRNYR+7TgWPtSlhDIVsApC8xnU8G05Ez0GZfb1U
 3JTd6hBu9KnOu3DTgaVcc71jn7llztnJtzqD5EwYRSMKACGI9I9IL0oh+xIFOf2qb3bxMdQ5Lw1
 /hkElkqYg5OhocKeDkQ==
X-Proofpoint-ORIG-GUID: hDm1B4DTFOsNu_sGF0Qx-KnNGhSuq6HI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180100
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

On 18/6/26 12:46, Alex BennÃ©e wrote:
> CBAR is an IMPDEF register and according to the A9 TRM [1]:
> 
>    In Cortex-A9 MPCore implementations, the base address is reset to
>    PERIPHBASE[31:13] so that software can determine the location of the
>    private memory region [2].
> 
> If it doesn't we will confuse the Linux kernel as it probes the system
> SCU registers [3] and erroneously assumes the system is a buggy Aegis SOC
> and nerf the emission of SEV instructions, deadlocking any WFE's in
> the kernel (or QEMU smpboot code).
> 
> [1] https://developer.arm.com/documentation/ddi0388/i/system-control/register-descriptions/configuration-base-address-register
> [2] https://developer.arm.com/documentation/ddi0407/g/Introduction/Private-Memory-Region
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/kernel/head.S?h=v7.1#n550
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> 
> ---
> v2
>    - rewrote commit message for clarity, added links

Thanks, this is now an obvious fix.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>    - used arnd's arndb.de address
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


