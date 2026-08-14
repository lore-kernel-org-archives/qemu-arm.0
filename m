Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0020C5B572
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Aug 2026 08:13:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wun2e-00080n-9n; Fri, 14 Aug 2026 04:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wun2d-00080O-Jj
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 04:13:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wun2c-0005Qa-2t
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 04:13:27 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E7gQoR711740
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 08:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h10owibZXGoa5ZO0KZ+udSdSs0JxciAHB7iKctmE0xw=; b=I3ndhQMa5Zi9GtdL
 yJForRJdPvgqZEP9wfQCBTmsKFFxlhEDyDBI4awLxFhiAahp2YIGg2o2q7d9LeJ9
 HzlWuWUy3SLncd1NuKp1I0yRNNfEs4ojELQ29FE2zoIFojnUGqV+1YtF7U+IL3vg
 mV5FL2ALTpP+qd+4/G6zlYFs17Rno4W16VJ5wmdSL2A8e2Rs40C5qUIfJTPY9TyR
 RvvhUFcbK6d2y82h7n8OBVJC2QE21PdaBwiD8ORi6wUnB2wGHR9G4/BRWR07COXo
 7PYmwpMXn+K8eF7bTJnZNBgoHGuofN8hORXGTNdubvyhxpPU0I4EJqAV7/IOAWoc
 cLleAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90ub1f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 08:13:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c26012cd0so7499311cf.0
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786695203; x=1787300003; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=h10owibZXGoa5ZO0KZ+udSdSs0JxciAHB7iKctmE0xw=;
 b=gUgcJJ/dfXN8OSL4TwZYbkSHimxEkSimqe1wTYWice5cuhhLn0KrRcE/fAV15yIGi5
 7gS8j+Y+OmmHjOEHYGab//VWvgMjTkn+ouP6G/b2AW9gGrZjT2jO9LKuTtLasTJ/7+sO
 HJnYrK01+oZQ6ksfKUncyvvhEOIr/h9BfxIe4UVVFxs56qlOjMv2buzURoy7p22r4DPS
 1vdBRVjvb/+7hqxieyeWEzflRxqY7OjN88X/1L6bnx0AQc/E67epco5TDVkAMp4pNgCQ
 6b+YS3rge9VzRR5qhCYVEk5ldPVjyhrhmKZ2JyzqK3TRj3+mi6ORdHzM8RdUsV0X45i9
 LUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786695203; x=1787300003;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h10owibZXGoa5ZO0KZ+udSdSs0JxciAHB7iKctmE0xw=;
 b=jyxae5ORBo/387n58dgBxB+4mXKxAYu4J7zoIWnGkj6sshLzmHDHmJ+S1aoZLPxGDU
 QjWLfuIUTlgDiP/IlKdGCz2xoYX2ac6WgKcblApxhL8XDuoJ9t7MzOZW2T24Vg6BvTBJ
 gqZgF8mRJQvzDJpP0cT0thzFEAogytH65Iv09Qi5bRLSDVmKbzYK4LzO06VWbixPMtej
 jF5A5GMc4h70Er4uTkRkGGvxONv1F9G4SrGEngosv2gCu3GxQQ8z76kasqhVQD9qkHpY
 yrR4tt1jDMudw6GRgumUlaiUzC5NPYfIj3EVLEBPFwlcMLC9B1pFD0yix/5cj0wRUqTA
 zkDw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqaFxxDKbqca6w092FFnqv8R9tKgcHqtfzW9JNUWcRhiYt5AxC/ZVzm2Xwsuhm3k+rLxmfrNjS9bA==@nongnu.org
X-Gm-Message-State: AOJu0YxRL613IzfNVRpnLzcSQQDX22cbh3EEISEbvkQmCytdQQ2ccHkD
 PXN3AmqtpHPt9YmastQGZ6qUKpH+J9Xk9uDpI1UhSukOHFwgUWMRR65rlyoAidKOUCqRY3boVz4
 nmbc6Q3Hkcrglkziu/82B7Q3JeKscwHZj6Q4D+BzNNhqN2wl2ZCSJbdw=
X-Gm-Gg: AR+sD13hvZhty9c2WtpPpxs9g6l1Nd3OZe+CJmKcEQ3xlFT61fERml0VG71ZpfBwdIH
 KJFeKbcs7lWScwgIhSQx9vGdHwJrr5vwaCARQKE1NQFqDs2QwSRTW5O1QaofV+jwXyEWPkk0EJf
 9LR8kxk1l25R70oSuC3UHc3iufJH/JPcBc9qCSfLFHPNceFUZsdrddnCJZhP25bWXVhqE9TOJNM
 Ht7kuUEZUOHAlkSYpx1FP5WlTDZfbwmf2+qLrG+7dYM4Zc+UCZhBPRDdrfpmkmubq2z6wSynuHa
 JosyWQMIYOhkfwypdjsoEPWWK1kpntLqF9I8CIfqBMqu8/NmyumcEvAMlaBxAbWZBbbg7e68Jkn
 EPdSZDdVYyrljn97Wtr7ryJsd0akRZyfIWdU=
X-Received: by 2002:a05:622a:15d0:b0:52d:844c:b0c2 with SMTP id
 d75a77b69052e-52d8535e894mr42532831cf.12.1786695203407; 
 Fri, 14 Aug 2026 01:13:23 -0700 (PDT)
X-Received: by 2002:a05:622a:15d0:b0:52d:844c:b0c2 with SMTP id
 d75a77b69052e-52d8535e894mr42532641cf.12.1786695203035; 
 Fri, 14 Aug 2026 01:13:23 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b2e6b6sm32873485e9.3.2026.08.14.01.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 01:13:22 -0700 (PDT)
Message-ID: <13b0aca6-d1b9-4e76-88ce-530e0bc4db20@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 10:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Restrict arm_do_plugin_vcpu_discon_cb() to TCG
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-ppc <qemu-ppc@nongnu.org>
References: <20260814080507.23196-1-philmd@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260814080507.23196-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7ece23 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yRaO2QFb4kDYuS9kHpcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2MiBTYWx0ZWRfX1VsQ+uYSxV7k
 W0ATtns5S7FhPXCjdjBt0Jc28/u/3I/jLxJVCfcugvWntu/RsD8ZACOVw2f9oCyTMWytdo9N3pt
 OEct2pjx8yG9fdtWGmjzYNEIZSfMdeE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2MiBTYWx0ZWRfX5/AwMz77h5MB
 dE1bLEk6HyXGSMVwgJSY3jqW0HgFrecUaCtmj8S9jJURUVAWnUBv4DWzLmgJu2KxA5qAxrpEwxt
 bM5gOrGjFtIJ/p7PucMi1B1AXPFYe+8gqoEn3XhSgHExFJR97AVYVVRbPyTlNsgESAtvQUsNzTV
 1CGukXAAkJvMHXgqxjr6zMS1a5+6uf8DIneAxR0BDtTYuatFNCtMgfEpCfQ8rvfWBIr7o8QEpvk
 j07EA2eoyUZxvdaW4cyPjxBgM8RG2xuVZ4L7PTpihhzuop80nILp4dmvmNAqXHSmblypa4E36g8
 p8E68zKz70QjQP524TCgDOPxs6GXJhB7aAoqcXqXUEHW04eX0s1zG/RaGi6rrZGU7RyHpn51jMI
 tfGbY81qBQ4ZAnWD8YPt6teeY5FOy3zSp+Jt57lJv7AuDc8BFoiMUu1pRTAWcjkuL7MTXViIym4
 2jCM8eSfaPwKHArGZlg==
X-Proofpoint-ORIG-GUID: JlhWAyh6OKqadlQ5VJOJZhxJWshts-DX
X-Proofpoint-GUID: JlhWAyh6OKqadlQ5VJOJZhxJWshts-DX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140062
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

On 14/8/26 10:05, Philippe Mathieu-DaudÃ© wrote:
> So far TCG plugins can only be used when TCG is available.
> Move the arm_do_plugin_vcpu_discon_cb() call within the
> 'if tcg_enabled' block and wrap the definition with #ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---

BTW luckily, except PPC, all other targets with HW accelerator
support already have this restricted to TCG (X86, LoongArch,
RISCV, S390x). Since I'm only testing hybrid acceleration on
ARM I don't have the need to do the equivalent cleanup on PPC.

>   target/arm/helper.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index af45234ad2a..adae2b2b8e5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8915,6 +8915,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>       }
>   }
>   
> +#ifdef CONFIG_TCG
>   void arm_do_plugin_vcpu_discon_cb(CPUState *cs, uint64_t from)
>   {
>       switch (cs->exception_index) {
> @@ -8932,6 +8933,7 @@ void arm_do_plugin_vcpu_discon_cb(CPUState *cs, uint64_t from)
>           qemu_plugin_vcpu_exception_cb(cs, from);
>       }
>   }
> +#endif
>   
>   static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
>   {
> @@ -9677,9 +9679,9 @@ void arm_cpu_do_interrupt(CPUState *cs)
>   
>       if (tcg_enabled()) {
>           cpu_set_interrupt(cs, CPU_INTERRUPT_EXITTB);
> -    }
>   
> -    arm_do_plugin_vcpu_discon_cb(cs, last_pc);
> +        arm_do_plugin_vcpu_discon_cb(cs, last_pc);
> +    }
>   }
>   #endif /* !CONFIG_USER_ONLY */
>   


