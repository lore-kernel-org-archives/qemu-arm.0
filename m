Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43712C5DF82
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 11:05:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0aa-00005S-EL; Thu, 20 Aug 2026 07:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0aY-0008WD-Vu
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 07:05:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0aX-0001D5-Bl
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 07:05:38 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K6eX612161054
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 11:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uT1ndCgiqc6w8zosFh64mo5qwnmEsbAaXbzgizwzutQ=; b=bUOTjGdyhoaI/hxS
 R2rOBSbXg2psd5czTLGzYJTFQ67WsAKxCRYNYAjhEGyEq3s8LrVG4D7kottpzvJp
 J0yWbYfCMGtFpVdakmlNTdT/qnJ8QtcIr8XO0QOtvQC5DkQsowAXFs2BScvdy+8U
 2K/ApcDokOGmenyJGrSrPmBci9+C0Lr1d5CclhR0h0p9EWVd9pFqeIPxx3fH43an
 BtMmtWItqncDtc0VobPuMmQQpeiWUtEPYMho9BmQD2l4bqIUmulw4lto+p9ct9cA
 Su8pVtH5DKag6CQnNfHWYQ1IAwoSA41Bj5gzpepoauEOt+7nFlY/8x2TI+jCUNdL
 N863TQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rykr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 11:05:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so269298785a.2
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787223935; x=1787828735; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uT1ndCgiqc6w8zosFh64mo5qwnmEsbAaXbzgizwzutQ=;
 b=CCt4CEbxjICWeSPW8isOJELVimodmt9bI+gqo/as5MvF2U5iDDzH286SVKvZuvOyRl
 tnoH8zO29L4XA/6PDiKwDKY1qu8S2mapX2rI2y3bWJ3AMl0NUEC+aiUlRRXwhyo9BrQf
 jmOPKLX2VCdvl+wDrCh3Ld4HwXvzxmHk5RWB4TWacmsZa3sfuk/pep/94z63i+Sh3ccR
 gT1zQ/2ahzo2HbyQsti2TT4WHzfer9oVBRLApwWnviwkGTf2dJrknkz62UKkhJ5pE304
 u+x3dqyaoXPDI4XsNQozb+Z4vyKzt7bNpnM73zrDr23+NVMkwKYoVQhkbEkQbieJCbq5
 df0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223935; x=1787828735;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uT1ndCgiqc6w8zosFh64mo5qwnmEsbAaXbzgizwzutQ=;
 b=VwloZhJ6GJQHrMyMPHCCWWeQuBTfZzZ6renlQ+r3BsQvA6UMliEUKm0RF0TIMbewGD
 QyR21Mmj53w2D389kh9M7rxNgcFugj/Fp9ENFBAeuhEM+DgfEArpkn/o/l+RDKzbrJuD
 xOLNeSWb5vxl81XvgXalsL3QO4MSIZKHJ4MhTSa/LdTdMkMjLAqZv5WkyhOIprvZtckl
 zYXwxFGyj846TB/DuXYPP/s5eFY7jJdCRK9JUxA+vaieFNre2oQDrjbShthKJQ1PMY3L
 2uMaD7XIZd0SzsnyePZ1+ArZHjxCwS3ebNvW11X9cVJnWAWaPI41I0LvpSSmgXfuDFle
 SKZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoRbDFgcKWX5JG5DALMloPDlOSVI6s4jZ7HM1o6yLQrhhJjaxZ+Oqz3EZqV8W6Y+dbisFgkoSrAug==@nongnu.org
X-Gm-Message-State: AOJu0YwWgjEzhac/HdDKmX0cKhHEirSU1gr9igUOmsI1Q5sTsyj1z09g
 oWXSWaXiVDW6DpWSSfTd2EQBA2MrPRj5xIse8BFXnRLfQTtia14vaasy+f1KIVTuYX/UAB//4Tk
 fRGjVCVv8kbUnyp4B0VldDI5nvFRRbEr11TmMfAunal00zy1cYpWI5Is=
X-Gm-Gg: AR+sD11GBMbqbklK1W71uudLhJXTji631mMmyq9cvQ/L60Z3FSVv+MHPerFKwpvWzlD
 tQ3PRhMPfRTD7ie2O/oWzkC+Z5DQxvPu/WEHwwyowOUL3jGRbbKuh199rlibwmmz5mrzgTlOmAp
 243pg+65eAhhbxGGFdLo/Bs0IPy+P81QlsToPsHn3OGkF3T3JJHpGXLY2eDBwEw5wh5D9Dres07
 7KApXUyBlRFDalej2hw2iAm1EocvXihak8gUqIFydukyRkqaePzblCKDWPnf8MbczrdWvIwOoci
 LdEjdpuW0gJRHIeME61EwclEcUl0w5U8xhxjhViDxVyuahEtucReOK+KbLEB+ANhMclglWy1OK+
 aAGgt37FFALH1fraYA5A4lHwcn/rY1sslvsE=
X-Received: by 2002:a05:620a:269b:b0:92e:61f1:6b72 with SMTP id
 af79cd13be357-9371e242d62mr970922185a.13.1787223934681; 
 Thu, 20 Aug 2026 04:05:34 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:92e:61f1:6b72 with SMTP id
 af79cd13be357-9371e242d62mr970913585a.13.1787223934206; 
 Thu, 20 Aug 2026 04:05:34 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b144173csm12207822f8f.6.2026.08.20.04.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 04:05:33 -0700 (PDT)
Message-ID: <3cb51542-4479-4d6e-94d8-4d0136eb6986@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/13] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Helge Deller <deller@gmx.de>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Cornelia Huck
 <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-14-philmd@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260820104730.25462-14-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfXzFUfWZLqfWNy
 1Qg5IeBbqBYUN9DmdiVkCSt1uyDLsxdk6f0B8om3Ci+vak9Tf2JIMbyL3qCZYMiNYN0EHaV15bR
 2hBdXlXdh/+hp78eXOCZgTsEQDAmEqTwUKUi2J+LbuVy7FdKvJTYS/qZGMUlmliatxI5gon5sEf
 XoW5f6Qg9co3K0Hq2xbS/abuQKWggsAqgMh6Myd499uAa6nnWt9capv1T8zKBpJTQbvH+pbUGt1
 WeVXofpJ1vB+ALgqYvuxEH+zWA7xzkEst2+WomFWGEwclP/ngZV0uWt5IFTP1r1epGFp/EAU9Lw
 SB5DAqtSb9gAwP0B155xAxlRr0HeffoZtClEtbILJed2VpruzXflKVa4G921HiSshM3Ej2jLGad
 rMYqhrClqbZ5NiKl8FVxn8iRY8MikQSKrPVDLXeH7u4bP5zhvZHzRmEjKh3c/IgS5Mzf4yhza8t
 YZl5DoNMaCoovP26ciw==
X-Proofpoint-ORIG-GUID: a8oWMWNHldeIOHzE-SSKSy_U4pzmo6HH
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86df7f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fYOGHEPvyCozy6Fkd0AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfX+5dRXvH5DORB
 L0ZMjITYkKlaZyewmCCkKyr8jUO+HCg1+i7Ugg+xAPuqb+MMhOW01RGUl2aUJ6tTbnUnkGd8qeV
 LYb2mM+QwVQhOBAqfv5PsE40FCerTa4=
X-Proofpoint-GUID: a8oWMWNHldeIOHzE-SSKSy_U4pzmo6HH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200081
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

On 20/8/26 12:47, Philippe Mathieu-DaudÃ© wrote:
> All functions called by target has_work() handler take a const @cpu
> argument. We can now fulfill the comment added in commit c2804566f6
> ("target/arm: do not clear halting reason in has_work helper"),
> qualifying the handler const to denote its idempotency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   include/hw/core/sysemu-cpu-ops.h | 4 ++--
>   target/loongarch/internals.h     | 2 +-
>   target/riscv/internals.h         | 2 +-
>   target/s390x/s390x-internal.h    | 2 +-
>   target/alpha/cpu.c               | 2 +-
>   target/arm/cpu.c                 | 4 ++--
>   target/avr/cpu.c                 | 5 +++--
>   target/hexagon/cpu.c             | 4 ++--
>   target/hppa/cpu.c                | 2 +-
>   target/i386/cpu.c                | 2 +-
>   target/loongarch/cpu.c           | 4 ++--
>   target/m68k/cpu.c                | 2 +-
>   target/microblaze/cpu.c          | 2 +-
>   target/mips/cpu.c                | 4 ++--
>   target/or1k/cpu.c                | 2 +-
>   target/ppc/cpu_init.c            | 2 +-
>   target/riscv/cpu.c               | 2 +-
>   target/rx/cpu.c                  | 2 +-
>   target/s390x/cpu-system.c        | 2 +-
>   target/sh4/cpu.c                 | 2 +-
>   target/sparc/cpu.c               | 4 ++--
>   target/tricore/cpu.c             | 4 ++--
>   target/xtensa/cpu.c              | 4 ++--
>   23 files changed, 33 insertions(+), 32 deletions(-)


> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9761bb173c1..ba66359d410 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -141,9 +141,9 @@ int arm_cpu_mmu_index(CPUState *cs, bool ifetch)
>    * CPU_INTERRUPT_*NMI anyway. So we might as well accept NMI here
>    * unconditionally.
>    */
> -static bool arm_cpu_has_work(CPUState *cs)
> +static bool arm_cpu_has_work(const CPUState *cs)
>   {
> -    ARMCPU *cpu = ARM_CPU(cs);
> +    const ARMCPU *cpu = ARM_CPU(cs);
BTW this is why I said "Not sure if this is a good idea so marked as
RFC" in the cover letter. While the left assignment is correct, the
right QOM-generated macros happily cast without checking const-ness.
We can see that as a pre-existing risk.

Still overall enforcing const-ness on has_work() is a long-term win.
Maybe a simple comment here is sufficient to warn.

