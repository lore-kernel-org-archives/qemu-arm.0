Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79C2C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 09:32:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyR2T-0000VC-KY; Mon, 24 Aug 2026 05:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyR2S-0000UP-9V
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 05:32:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyR2P-0002EJ-VQ
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 05:32:20 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O997fW2081914
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 09:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WTUCGB8srnvftuNtUwhIDahYXSeShayU5BpzvmeWeYU=; b=OEFQlFBh55RX61dJ
 mb+bxTdkg9xRhSfWTd6DPHGYKAPjWZqKqQlnjSb7H78w8HDC6OuZsO3O86KRaToZ
 t1sopQT/c3tbloqphgyMp1cNmUBTQJGoPqP9C9+0IK3tZlXvcLi35ucO8z2IMbtm
 Yfhix3frH7qOJg+9NEIst0+P1w4v0UuNhB0pKKnnxxcqRaEXxbxuH4WWEiJAib/a
 woXZsTtkvEBkRlE7xxil6MUEyB1r3EOFN5RLyUmMj9jiwdZLqyYeKH+uZ04/x0uJ
 80Jr9MuaTxO7Jo8/CAZLiaBxc8s1L4gVJU0HIqZuuKovWcf7HmL4SxduppMKXNMl
 9Z+MVg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsgysk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 09:32:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-5c125dede51so918505e0c.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787563928; x=1788168728; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WTUCGB8srnvftuNtUwhIDahYXSeShayU5BpzvmeWeYU=;
 b=cDQNdqjXD/rTS2rH6Vcdu1ptHIOVj/g5JJWSrllz1p8ld8UMvVdubwaxP6j5/YV7ap
 tOsT5y0T6Pm2WEXcSNS43hY/fXfrmD2orwJrYt4grHxdZgJyJPrwmOk0jzjvqEb6D4xJ
 SoQXFJI/b3LCe0j9CxRHNydm2A/bHCKxiWiL55c5CqyYRw7KII0BiqouJW9JPZJKHM48
 P44vwZTOt0LK2o2WdWvQv5uAyo0+iq/8n5fPsttYlbyclyC8mh15xAbCFzhfEr/iwuGl
 M8Jn+dG3sycN50l4/L1tVPWJr0s/FZIJoy4duMGofgd3V/zKhzlZZgB1x4i5K7fVqfr/
 SNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787563928; x=1788168728;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WTUCGB8srnvftuNtUwhIDahYXSeShayU5BpzvmeWeYU=;
 b=A99TL7I3CujPtzP1ydhW4K6GI9+5nlZ/tfMKhRG3JpGDuM2dpK1UsmZpvLTmT+6MIr
 aw3aPUIe8fSPXRN0eMdpDFI3kvyQpETP3Izs57TNzXX52HA0PnaEGzkT9shC8QOJFku1
 eI1dPQLK9NUeqgEFytTHRY3u12UCqZj1vlDNaArn+xt/HamHJ8senP4Vt1ev6aWg7f5l
 d+dFL8ICodbyRgtdSuEdlFl1o7l9HAwZqvyyu//xlKcVfz4tmlba+5KBsdkpnr84cyxE
 bynKbvDtiWWqkJzM7DesOSlRx48RraA/slq4g0zLHgyBAK/98qsajGj1yT6eTlf32zbW
 Nycg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rox/T5oKQVsEFIcZfS1OPur3ATWMxvyNSMROY6dKHmt2pAdNUsUJ2v3QatrjCVrV8VZzs6PKxI19w==@nongnu.org
X-Gm-Message-State: AFuF++kAXJnEypdRAM0ndXqOyC3DIQegKDKwXDUxkRxCbiocwpHYUzmf
 +xTcOgOK1TrO7Bkk5Asaa2UwJ3zn1pUqO6NdUbvgvCjhWP8S6+A9fQQ9JocTdNDllAbugQx/584
 bIqchbX6yI1tzJwE7dWh37cNR+tuBHEKKrU88TefrAFbAIwvJtcM7aKc=
X-Gm-Gg: AR+sD12JRtue5wlmBjpnksjM95bF23QBUYIuUu/XlHXCRt55mj2l6k2wB44wcSNkNCZ
 /DsOnoxd9LoEq6+Yn0tqlUz8UN7t6+1SrGnjyAH8o/jzagVsBYKpScci8Tl6Ha06b+85vAdE7Ew
 +DrY6uSA++kxGqM4UFAHw8j11QaAfRn/NZeM6LMs1QxvbXPfQ7KLnvhoID5FMbA1V2yQVYudO2/
 smujT5LKVApzy695Wf5lsbLRfncd29A9bPSI16E7DDSaEJCI8lcg2dVovLm0Ez/0mNm7g2rQBoL
 4IV5GsTosEyPJeGdOqVzdV1K4aOESCczk5L9LczKIoWkMH7uJIsOZedxGbe8CrpmYx+EqJbwRfU
 l6MkanA5Ipda5244BYf0YKnr5DdUhGelksaa5i+oLAQ==
X-Received: by 2002:a67:ef45:0:b0:77b:4894:4c8a with SMTP id
 ada2fe7eead31-77b48946049mr4209533137.8.1787563927689; 
 Mon, 24 Aug 2026 02:32:07 -0700 (PDT)
X-Received: by 2002:a67:ef45:0:b0:77b:4894:4c8a with SMTP id
 ada2fe7eead31-77b48946049mr4209525137.8.1787563927290; 
 Mon, 24 Aug 2026 02:32:07 -0700 (PDT)
Received: from [10.254.188.74] (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e02a8fbsm11046272a12.13.2026.08.24.02.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 02:32:06 -0700 (PDT)
Message-ID: <cf22f809-e95e-46a8-86d0-a0250ae06710@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] cpus: Add const-qualified CPU environment
 accessors
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
 <20260821104950.32108-3-philmd@oss.qualcomm.com>
 <3c9fe944-2b51-412c-bd30-26bf013cff46@oss.qualcomm.com>
 <22188776-edeb-44e6-b79d-0b877292221d@oss.qualcomm.com>
 <bde71c0c-ba94-4bd6-9ef9-e868fbd8562e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <bde71c0c-ba94-4bd6-9ef9-e868fbd8562e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HakhdVPlRrz79GQ47VIbAtJIUjzCc_jh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MyBTYWx0ZWRfXxjzbyWUbSwoq
 Su0bzI9TUbmiCHCzMd9lItKl7gTUbMj1mAQjh44iUMYVydMXijMW3vUhjIduEa6HcLghH3oBoZC
 Rsxa8EQbzQvbribaS4ksoMURMnzdt7o3DqKHVhjM+i+kHGTaFx14gl4+5eHY25B3Y47T4gbAwBS
 Xqe/ZNfgwZDSjVhS9NfFePNL+Rx9HkTmgZIRoH7APG7yrHDg1okoqo2MbfjUPyLbck5HeRkzyOC
 DwSH/A3YfMSBhkcRWBL32qcvbK9r8fVJ8ujx9qxCx7z99/qlhJ0xnU1q9KU1p8XVjYTxwJJJrKj
 Jjjq4hIGHp+cr11JHZglevBTxfAnuUH0jB2mvfqh114R6yPIiTm+fXBd2EwwueKtD9TwAvOP9BX
 GyUJG0Hqtq2M9ve9gO49z9qBQJaK2aZhcDXY3v6KT3XpPJy83KodmdVWpsZuBleVi0/fKhfrdI3
 v9epM9ScnGxu060yA/A==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c0f98 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ZokkgsmZNnwAS1iu5ZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: HakhdVPlRrz79GQ47VIbAtJIUjzCc_jh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MyBTYWx0ZWRfX498XVaWdL0dq
 R4e9XuVs4QViz+smIOOB0Jl02YEORRyoV/ORjkFoB/neUui5TgQVpaWu0B0gTbap9mnyTFHv9cc
 3pVSrsallJguR5/tLHw8wx3YLQGwmRo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240083
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 21/8/26 19:07, Richard Henderson wrote:
> On 8/21/26 08:51, Philippe Mathieu-Daudé wrote:
>> No, this now fails distinctly on Ubuntu 24.04:
>>
>> In file included from ../accel/tcg/tcg-runtime.c:26:
>> ../accel/tcg/tcg-runtime.c: In function ‘helper_exit_atomic’:
>> /home/runner/work/qemu/qemu/include/exec/cpu-common.h:100:31: error: 
>> expected expression before ‘typeof’
>>    100 | #define env_cpu(env) _Generic(typeof(*env), \
>>        |                               ^~~~~~
>> ../accel/tcg/tcg-runtime.c:135:26: note: in expansion of macro ‘env_cpu’
>>    135 |     cpu_loop_exit_atomic(env_cpu(env), GETPC());
>>        |                          ^~~~~~~
> 
> Yeah, this of course fails because _Generic wants an expression and 
> typeof() is a type not an expression.
> 
> However, in this case less is more -- just don't dereference env:
> 
> #define env_cpu(env) _Generic(env, \
>              CPUArchState *: \
>                  (CPUState *)((void *)(env) - sizeof(CPUState)), \
>              const CPUArchState *: \
>                  (const CPUState *)((const void *)(env) - 
> sizeof(CPUState)))

Indeed :) The simpler the better. Thanks for the help!
> 
> etc.  It's only top-level qualifiers that are stripped (so const int -> 
> const), but qualified pointers aren't top level (so const int * and int 
> * do not match).
> 
> 
> r~
> 


