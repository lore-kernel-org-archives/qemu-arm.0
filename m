Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFEBCA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 05:23:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBQJW-0003mf-Mg; Tue, 29 Sep 2026 01:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBQJI-0003ld-9o
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 01:23:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBQJC-0001F6-NI
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 01:23:23 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68T47NAS3241804
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +Y61lvgRoyDuPTg1QDOdOT9mx1A0JfLWYx0xNIbTLF4=; b=P15x4jVNgGaTQ3tE
 DJUVYpao19FUrymjkrZ8oLoLZMsGLnJT02GwV2jq9hr2nWE2qeazTct6JGIIGrE9
 d73Q6FSx6DCa/EfgJGaT++Ad/v1T0Uv3/z8DQ08Wtr0Wy2Z4CHqWWsSJm8oj/7t3
 lh17+A+SVxwNnSBtLJfkEESuxOs5SWQAQZxybKV4vs24lQZAtOvFLv7Sgurnfaqi
 jUBRvRmp/qA3r3zBJbxWsxwuABCVbLzA+PjFqgyS3NguVl3QhBolctSZzolFkgkQ
 NP0kwmp8Bnr9xhhibIOYrKbNTvZZESwbU17BL9BvNEUbhzJjZxmTKcEWtvxkadNv
 RTkM6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144s7qx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:23:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a082c014aso121507385a.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 22:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790659397; x=1791264197; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+Y61lvgRoyDuPTg1QDOdOT9mx1A0JfLWYx0xNIbTLF4=;
 b=POqVFl7ChsDrg4QhxUKWzwN6AdYM4sepr/sPHQEuzl7ywdIeCjZQmGYGiE3TkxtqXx
 QnhK9VooPknmr6y2gDQwW6lNNSHPSuaxgvbhh29c2NJUcu4ua6lvos5neaPJVS0HrWXF
 emIlDLTf0tPQKA8ukOutSTUefx+hJ54XWP96nVgSJMn61TS/vhWKRHYdkFC8FyQNgJpL
 EuyyYNHKjwgP5m4+IwpeT+oVpc8TXl0Ng/nTCYW5Midbo7MEQbs4tddGwnj07Ku4bCa/
 suZFfVzT4RZrOpU8SFmXuX+WLuVtMtsuY+3CZYglZVQNGYahXYAb8yyFO25gyJjHX2k5
 LC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790659397; x=1791264197;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+Y61lvgRoyDuPTg1QDOdOT9mx1A0JfLWYx0xNIbTLF4=;
 b=FErgUBaxFme0d1fYknMjNzhroQSgcpVqXyl62DMaODddTganSRS9eCLNLEpP1Khaqq
 gXMH5DqAljMS5FD3ZuXecHLReE9wEC/CCzjMeJ/OnHIBCBXUv3IuR1JTUz9lwwThxDaq
 iruX4/Q1ir7OvFTP9svB89UpVQu/iP+4mDrr7Y0FaU6y0xHsYiDMgah/QdTlsBpILVuR
 TB5L1CCHJREVt2KUlRUjlby9SeouIY6uO+Byj0Wz96+dvGbWX2x37nWA49RXmKwChr99
 uX6Q4cu6vdN6HVPs7QKgVv0SleameU6BZtRNd5z7AvMMbTexKkLJiArv+I8pWIvEd97E
 58Sg==
X-Forwarded-Encrypted: i=1;
 AKwUvByiCqCyh/8v2NrxuqDZFb+w2r1hBOLiz9Ica4yM/nZPlXiwMrVWM50v9W6vRLPMgwpQpExqqKW2QQ==@nongnu.org
X-Gm-Message-State: AFuF++nGanEiSBR9iLW6GV7U/Fi9EKe5TUr1S3UYvHReBFCOBwIP0akm
 CGoqcKZGNmwQWXzAIDG3knBvSadHw+SsS8vv0GhSFciOPRVdwLUDCWw2v463qS53Wp2v8+Iz6XO
 b2PyGBY6RK7rjCGQjxwGugV8s9E0VAN20jqOzK05r78Mv7K88pjqDHNg=
X-Gm-Gg: AYBFou1yRDS3meQcryTdFajAEa1FlfWhhenBfUZ9GW18iPBs8EyTwup5XGwD1geb3aB
 rqkDWTyT4hE++r/TgiWufnccYW7s4lz+mIN145Z3lT21GCodcx7vnSk9TvrIIKZWFJQVa1S59CO
 R8HTtgkTa2gxJBaas2iODt7/WduZfebJQXOVi5WVQJyoAsRIDL9coXh+PsOmQj4mKkV/jHnfX01
 NOxpHjiuraO+jUTNU52qwhrMiFkSWaizFJtKZ5nVHAiu21a0ZJMXQ/hbnYo8rxnVVDCaqsgeHY1
 JNsWLpS2Slg0STbYLxAbMnMgbxzFr5ut+JFYy3UtSoTohwujpq/ohLSw9mLGCfqq678uUgtVf/Q
 g46fexaDWaOMiIU3l4XbMtb0ufsl9ioa2Kg==
X-Received: by 2002:a05:620a:2b9b:b0:93b:c6fc:71e9 with SMTP id
 af79cd13be357-93c8bf447famr269983685a.25.1790659396563; 
 Mon, 28 Sep 2026 22:23:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9b:b0:93b:c6fc:71e9 with SMTP id
 af79cd13be357-93c8bf447famr269978885a.25.1790659395930; 
 Mon, 28 Sep 2026 22:23:15 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d0f68basm49378675e9.12.2026.09.28.22.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 22:23:15 -0700 (PDT)
Message-ID: <c7aadc02-6c5e-4ca1-875c-43050305f4ec@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/24] accel/tcg: add cpu_loop_exit_excp
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 Glenn Miles <milesg@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
References: <20260928052051.251-1-luoyonggang@gmail.com>
 <20260928052051.251-3-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260928052051.251-3-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX1eLb0MitBRpN
 zmEA7UTYu16NjJciVaPPkU8WRislNXnV1HyMrhLjNh5SszUN/mbJA3XtWDPW7S4ixLBlLmOSeUg
 8WmHoadPwC/ro4OXtqnUhzayZ9thUNR7y47vbBsipeK4d2NNwd1rFoDRwDOY5ov6K9KOJBgJqOK
 lAVcvUnHNKWQ1KLqzm5etkgfVkZNTJ3yCqq1JhAmfyCU2049W3Z2CGuz3gmaWneCZ0DQvY7O8/7
 /ZCgGw6bfFSUJq9T0tdEGPxqob1e+98varxq+F4sjjWVeIkuLCvmtGIoVbVqh4xru8A71oFAlk8
 lio74vq8IiCN8Om163faiRfSxAGsebiTXzz3mF94oz8z9myBULLm/Gc/f9SXQt90sZvlN/2p5aY
 oGYLVFzxXuSRKmEGp+zb1o9ADDCISe7u9eOBJXoeBYKMw2b9dd6blg7vA9t9u42VUCDRUV2YgGe
 WLff49ZOCfRN0dVFCkw==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb4b45 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=tTEf8ENdxh8uo4z6V_4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0PPZO7EwTemjgrCeqZs5zw67zCuOZo3C
X-Proofpoint-GUID: 0PPZO7EwTemjgrCeqZs5zw67zCuOZo3C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX+lKvuS3hQNtG
 xY3+HpGGQwbZSAqUsLy5SPd2e+JU5adACAFAaJvLlxy9Vzxnm/1xSTsv5XiAWdUZe4K7ku3MFWN
 M30XIf9k/nARSwKdiFL8Gs5VtA//8js=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290021
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

On 28/9/26 07:20, Yonggang Luo wrote:
> Add cpu_loop_exit_excp next to cpu_loop_exit_restore. Set
> cpu->exception_index, then restore and exit the current TB the same
> way as cpu_loop_exit_restore.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   accel/tcg/cpu-exec-common.c  |  6 ++++++
>   include/accel/tcg/cpu-loop.h | 12 ++++++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index d20cece1c5f..31fed8e497f 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -118,6 +118,12 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
>       cpu_loop_exit(cpu);
>   }
>   
> +void cpu_loop_exit_excp(CPUState *cpu, int exception_index, uintptr_t pc)
> +{
> +    cpu->exception_index = exception_index;
> +    cpu_loop_exit_restore(cpu, pc);
> +}
> +
>   void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
>   {
>       /* Prevent looping if already executing in a serial context. */
> diff --git a/include/accel/tcg/cpu-loop.h b/include/accel/tcg/cpu-loop.h
> index f4d38bc2bca..856091020f2 100644
> --- a/include/accel/tcg/cpu-loop.h
> +++ b/include/accel/tcg/cpu-loop.h
> @@ -65,6 +65,18 @@ G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
>   G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t host_pc);
>   G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t host_pc);
>   
> +/**
> + * cpu_loop_exit_excp:
> + * @cpu: the cpu context
> + * @exception_index: EXCP_* or target trap number
> + * @host_pc: the host pc within the translation

I'm not comfortable this is hidding the 'restore' part,
not even mentioning no restore is done if host_pc==0.

> + *
> + * Set cpu->exception_index and exit the current TB, restoring
> + * guest state from @host_pc the same way as cpu_loop_exit_restore.
> + */
> +G_NORETURN void cpu_loop_exit_excp(CPUState *cpu, int exception_index,
> +                                   uintptr_t host_pc);
> +
>   /**
>    * cpu_loop_exit:
>    * @cpu: the cpu context


