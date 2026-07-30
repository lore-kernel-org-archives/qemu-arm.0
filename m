Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB514C55164
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpTC6-0000bF-Mr; Thu, 30 Jul 2026 12:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpTBZ-0000RM-4c
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 12:00:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpTBW-0000UQ-L6
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 12:00:40 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66UFQrU51225804
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 16:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZZnWUwB8MT+HtKLiz5Zy6bJJBXkfbqKyVQyDUw48AtI=; b=fpAuer8s6RPm3QBh
 YNGiMZY+Svhb7VMaJbJfXtMc1omW7M0s6g8P6ugsdTnhTcXFD5Jljcio0cwbVXfV
 LxVQPl4dx6wyqbzB23vULGcMGdKkZ6B/40VDTOtGtYep8ktNouY1uzsiGWkZIPRd
 wdpuOVVCC8DrXS8d+1mQY6kmByxVSxD5Y2/+hQI6xPDjT2LxrCgSIwzCf0YZ9fbB
 pT7JQPDlXrBEaTe26Yv5qEEliXZ4V8wSCQZk52k4MgfNtnz5XA9ilHCsT6hyO9oo
 ga8nrzTvGRW/OmKNgSAxOzH9cWuGTbLOlcv4bWWDkCpDSIJsIq6Gd9Tjq2HV/WfW
 uTbmtQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn0enr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 16:00:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5174a236220so23301781cf.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785427225; x=1786032025; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZZnWUwB8MT+HtKLiz5Zy6bJJBXkfbqKyVQyDUw48AtI=;
 b=Yy3EtvviKhJqBeSddAaZQiq1YRLs31/eldAWx8pW5ekqfQ9eUZeqSrkUm6bP1Msqlq
 +le2ITWy3mQhW62dGqOlsDmjulzsAuEibn3aMo9gTDGjKPpXPkFJM5wnUtKQ1LDt+RUT
 Wpr5EFr3fZJpfAD6ODH7xdqoGYzGOZPYoiIQfpI1s/lYRVRiVGQBgi5L+yEHi0OAh08B
 mhhH5v72KFWnrZh5i9JNmjrO0OW1ofmh0Pm4iOIGW88NgF/K1xRpdBTajvMrI+Wx86q0
 yBnEgk6EpKhntikUpt2kmAGHVbegsHIul8ocePkkXQLh9QUVe+p2oinctT20tM93kcEd
 f8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785427225; x=1786032025;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZZnWUwB8MT+HtKLiz5Zy6bJJBXkfbqKyVQyDUw48AtI=;
 b=LpdmIoc0J8AgQ6ZbP1sXq5l7JAMHz2M1GqQyBHhMDZwe4omxS637VuEOSHjCRdNkhS
 4fQXWI5wezroZpumwTEhC+/U+BGlU81pktj5c9VZ1rwljnwiA6QiSKQe2aS1xMHrhVmS
 m+CPFtAT3SnCvMkdcFaL0Yj1YtwEMQaDF6DwBcCW1J1AeZUYhZKFCRGqvvanrGiEt87L
 WN0KgN6s5PrHjA6bVuDr9OR1HqEiSWQMLARcz0pcRAp7r1AOFNnqemeiBIv27v+jcf04
 Cv7AAqEa8ZdADL5Tg3Og8l5UnoBH7dgEKdcjnxlXyJubhmRGUTnAI5wHV9nnngNsJLnc
 rwrA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9DeN4eDD9KWHT7xLLN7fMdmw9JSB2lJa/SuDtWbQmAtdSUYAdupJZae48nhSBOkJZANVt5PfwFw==@nongnu.org
X-Gm-Message-State: AOJu0YwpFGM0wg2UdJTh0CXGpPPy/Ng1+Dk2O4W9Oy9LcXwvFzhCT1sx
 4QFKcQKgHEAkoexOtwX9QyXSidhnTgO3rqhAWu3wDnmV9WkTJTzDp9xbK+abW/KddXOdGri4LKT
 tKZ/NbYvaquX96TTvevQVFSgwdhh0qujc8BYm50NB0PkRu+mQkeEfMao=
X-Gm-Gg: AR+sD105jqI8Mel2kwHZ3R+qG/jg909+txcBkuxJ5xpPMEkjwAxOv0LOOwcAVEgpolu
 /O+77NYVRy7nd0K417BIpLS4K7/0nDsBtLSXEbCQzzpH+Vg91hguH3QBNdQ6X+ZtB6aQHHeV6h/
 CyjfTDuCbAqvCei2rVarSDFK8Ue0Ffkk2G35l2S9cgfrA/hMMf0U2XqidWd8Ab/FZZF5ooOvp1j
 pyksO87JZ4mTcRzD2Yq9t16crx5T3IR+FPxiJ9js7Y8cCGrcG/W2CSDudeRtKciRky+BJ8z0sbM
 BvIcpYmnTY3Ms3jav1eqV9/OZKsScbTIKgu8oW9ylm27n7vmymrsr93uFRDyEfCLd9I/9pl06UI
 QPvpiAmMJ8uc7GADKp6TaJxXjiqWucondt6iG
X-Received: by 2002:ac8:5d45:0:b0:517:78c7:d93a with SMTP id
 d75a77b69052e-52b42b14b70mr9187031cf.16.1785427225014; 
 Thu, 30 Jul 2026 09:00:25 -0700 (PDT)
X-Received: by 2002:ac8:5d45:0:b0:517:78c7:d93a with SMTP id
 d75a77b69052e-52b42b14b70mr9185801cf.16.1785427224215; 
 Thu, 30 Jul 2026 09:00:24 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49801216694sm64868195e9.13.2026.07.30.09.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 09:00:23 -0700 (PDT)
Message-ID: <d4dba8be-4982-4125-b447-cdb2de1ad060@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/19] hvf: Simplify post reset/init/loadvm hooks
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-13-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20210519202253.76782-13-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX2X5ZvZU5lmD5
 7KRRu3nAolDtVTJtdz+1/ocJLRlRrfLWOrZYCDoPuqJKN33U52AIjhu2KXD9TfkAFfEi2Ekw9BK
 kKu3PhkfyZZW1Epjg0ZA++7JGbHsYQQ=
X-Proofpoint-GUID: _kLJK3JS7xidj1DB9hJ4MiI7-lZuWrZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXyTbuFm+Nxej+
 6N7St4fx2ZiYhgWj+57PkVgTjzY9q8lOwxkxbrC3/u2QbIPym1h0z1TuGY66k6+XnlJOFt2ptUX
 I/9+6bCPzEeKXc2ryywYxfRKpGD0ZWq1EswmtxQIhVh/DJlrpxvyzJm2mts0qoUXrIhudUII6w9
 D9Nvwo66naGRIYWWuwdd7cS12doxKv1L2QHyquvNzxs5u/OvMCpt4HBmUhj4xhj2Nh5f6VYQ3Eq
 vowl6xfg6ntADiriZ1ZUHXyRxljEmb0qYCE+oAyz2iszSZfeHAHv0jtfgkXRV+X3iIiAoTamT2f
 +2IZmHoXEsGvxAHrI50+PpnnxN9NNFwYy8nLCUNFTDd+YiJq59Xqz2yyBmTS8aZZz6LvBI3LkY3
 xFuXdEdcF6PPx5TVOqkeFHCuEbO3XHUBh4eEWLGhosgLItm1rXRXMJNGmJcBh53xILF/7jNhf/L
 nGJSeP7OeMV5Ttka72g==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b751a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=-c9VzbpeAAAA:8 a=S-XO_F0Q7lEhHcZk_GEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=WAq88MDkwfy8HpmZFCM0:22
X-Proofpoint-ORIG-GUID: _kLJK3JS7xidj1DB9hJ4MiI7-lZuWrZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
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

Hi Alex,

(old patch committed as bac969ef30e8a8b73acbeb6d68abff6f68b2056c)

On 19/5/21 22:22, Alexander Graf wrote:
> The hooks we have that call us after reset, init and loadvm really all
> just want to say "The reference of all register state is in the QEMU
> vcpu struct, please push it".
> 
> We already have a working pushing mechanism though called cpu->vcpu_dirty,
> so we can just reuse that for all of the above, syncing state properly the
> next time we actually execute a vCPU.
> 
> This fixes PSCI resets on ARM, as they modify CPU state even after the
> post init call has completed, but before we execute the vCPU again.
> 
> To also make the scheme work for x86, we have to make sure we don't
> move stale eflags into our env when the vcpu state is dirty.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>   accel/hvf/hvf-accel-ops.c | 27 +++++++--------------------
>   target/i386/hvf/x86hvf.c  |  5 ++++-
>   2 files changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index ded918c443..d1691be989 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -205,39 +205,26 @@ static void hvf_cpu_synchronize_state(CPUState *cpu)
>       }
>   }
>   
> -static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
> -                                              run_on_cpu_data arg)
> +static void do_hvf_cpu_synchronize_set_dirty(CPUState *cpu,
> +                                             run_on_cpu_data arg)
>   {
> -    hvf_put_registers(cpu);
> -    cpu->vcpu_dirty = false;
> +    /* QEMU state is the reference, push it to HVF now and on next entry */
> +    cpu->vcpu_dirty = true;
>   }
>   
>   static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
>   {
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
> -}
> -
> -static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
> -                                             run_on_cpu_data arg)
> -{
> -    hvf_put_registers(cpu);
> -    cpu->vcpu_dirty = false;
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
>   }
>   
>   static void hvf_cpu_synchronize_post_init(CPUState *cpu)
>   {
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);

Since we are not calling hvf_put_registers() anymore, any reason to keep
using run_on_cpu()? I think it is safe to update the field out of the
vCPU thread context, it will be consumed by the thread during the next
inner loop run, no need to schedule to the vCPU work queue. But I'm out
of my confort zone here so might be wrong.

> -}
> -
> -static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
> -                                              run_on_cpu_data arg)
> -{
> -    cpu->vcpu_dirty = true;
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
>   }
>   
>   static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
>   {
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
>   }

