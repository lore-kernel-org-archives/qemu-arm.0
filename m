Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186E3C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 13:55:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx3Ee-0008DG-G8; Thu, 20 Aug 2026 09:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx3Ec-0008BY-RF
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 09:55:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx3EZ-0002vR-ON
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 09:55:10 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KA3J3I3454887
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cNqSTio/80AhQH9gcvfRiLCoMn3QHaKni6/LNlZbDAk=; b=fQiT0gPr1RR7dM90
 bRZQf/VARVesYMGQx2ayRy8m53GSndN0wDH059tPjG6f1mklj54orhcZfTztGcVv
 wQFLolNfTfg11vWu/ImFtblNQGh49cCT2/GMG/cRtvg5nQN1bTPM1ItagNysQA2J
 mQTpjShoIaSfu8W5tSymKdzsDFzVdHrGzsWlpXbpasx7M2ikFKL3046cfPuFSqTL
 bCIwzla0NzRgV97kJGHkeTlfvCGnIEhYbXGud63NKuhAXZzLle7DpxjPcL3JhPKY
 ZbboQOAcOnk37hnvsx+uq6DBnhAfJELB3w63qgAloBJBjj6qoLwBvkpS2wr2/ab2
 VnJqsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg88ugu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:55:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so293153185a.2
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787234105; x=1787838905; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cNqSTio/80AhQH9gcvfRiLCoMn3QHaKni6/LNlZbDAk=;
 b=UAMRT1zx/vfcVvMZGxyzqifRE6o1e0OQ+WuK1Yf+eOUp987JibTqVt7wYPRBo6P+/8
 cNBk6fcsuiQzlI03d2fJhR8ZWetFRM+C1gKR+RAfrKG5osvvqoWvkbPkBs14/z4hm9fQ
 gyGTlTIsCOEQ4wl5iOQVhxgDy6qUmKR7Uf80hUd1xx8X5H83OG4UIQmF7o+k5cYEnuLf
 JaTxSNCR7JG5kwyl72hZab/VUk4FW6U8FRdFsGuYuFceXgc3356Bi7KsQzWWHTOuKdJN
 1Amle+rcYRPoxbQ2HwHGWva/+8SqvZUDLkNx/nqsTT2yXme4IQKYckReXnOzawYAOuYs
 J3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787234105; x=1787838905;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cNqSTio/80AhQH9gcvfRiLCoMn3QHaKni6/LNlZbDAk=;
 b=mdna33MMSdE5ompH/oaDtUJDM9RvHot1VLkxeDsqvK2hdAQWiwS0WasQooQ8o5wMq5
 QooFPWyRe+HCYHnrw3sp+C+QrTeHHw7oSYxnFrko9oJWF24NfzHdIUzOOjiPVJ/HvmzT
 EBkbynKRHgXDIXOoFId7wM1U1/QSkzigNlP/UnKBsjFS2Bx67t1ez6SPW6N2Zw1Yor1h
 QYUgJtHbFtOC0G562lDlB0rVDxRt8NqyKW3QR/lwJv1M6HkgSNE52GcsKh0FBXOy9LYo
 Jn4AGhRYq2Za6bICcxRld3SAsSDUI7SrGaKSnSFXKJjNNraL+lnBRj9MbrxCmJm51gcV
 9s5g==
X-Forwarded-Encrypted: i=1;
 AHgh+RovCZU7MPDslw8YmMWtK6mvLU7c4JFWTvwNtINZA10JXl9T7yhp0T31R3neLz3sjtNXTeHLi9MZoA==@nongnu.org
X-Gm-Message-State: AOJu0YyG+QJk9umaHnB93YwSsAW5vUxxhbjRSSLymTWQn1lhMHzJcjDx
 Y3FHqvKuPS26pWHxebnGCaojtuBEKDzrkLm4Z8tcuJ3YSiaXKKQzv9kK3lAQAcLknWhzPlP249R
 hTXfn189MxGMIoVhGCZbyuq/uhaGL8OHoSFwyUrccZ2O8d/TRdeFwYF0=
X-Gm-Gg: AR+sD12zOyULmn8v+ZPkDtTmt15HXu40np2ZNUp2GNALy4rhTh3AuoPIKvjQA9dcsY+
 Wu7oGjo/nJ6A8dzswrGJ7fuwvjz9ETl5PGn05T9Pd2OqUVNzii4h0CPv+dpF9gKku1rgsniG/yp
 QoULGZLHNqeddI+DJG/n+rd4QnZuk+gP+D9z2vi+Q+I7PWFCJY+lTmNwJa0MAp1Yxqhu4DRB+Sk
 eQLz/UOrttvJlYm/f+xQ8opyf0ZdRTc1Yo8Cqb5WA6YwxYHOF9r99gjIy8n0EnJ/gEhQAlwKVQR
 0PXphuoqILsc+bbaFZqc2M76nCYHxj22Ucn64XcXnPhSNgZieq06/XuqY9cFw/yp2Ig6Ec/gWhJ
 DpjlmX8CyRHsOuHdDkMNcF8vf2x2FPPBaE3UobkpQ
X-Received: by 2002:a05:620a:4111:b0:936:9525:e952 with SMTP id
 af79cd13be357-9371e66fa14mr1114333085a.41.1787234105098; 
 Thu, 20 Aug 2026 06:55:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4111:b0:936:9525:e952 with SMTP id
 af79cd13be357-9371e66fa14mr1114324885a.41.1787234104562; 
 Thu, 20 Aug 2026 06:55:04 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e805a4sm160437145e9.4.2026.08.20.06.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 06:55:03 -0700 (PDT)
Message-ID: <3b8a8e0e-de7c-4c01-a1cf-2b86f6c74b7d@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/13] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Content-Language: en-US
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Brian Cain
 <brian.cain@oss.qualcomm.com>,
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
 <178723213517.2730041.8745378645612815468.b4-review@b4>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <178723213517.2730041.8745378645612815468.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwNCBTYWx0ZWRfXwnQkcKJL9fq9
 yPdOH75rv3oGlRJQYzmhjwhPnU0OVHBODCUXfXMM5CTULan59TACw8wLxWf7uEWo08JxG5ZipN6
 6FspZFBfbBEAjw5OeUDgug3g3xUy1/M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwNCBTYWx0ZWRfX777nsiUQqfBT
 KhJWF0Z3F8CIjo9lcUfe3QX9msC0w+dzAjbTUQlbNlVdOZxjc+6E/ghsyM6/aVgF22/AAEMOYlb
 yUqFwbq7BU1nRegRqEkkI15Lj3B6dnaKqaDEs779Tc+sm6NEj6iBdbvB5HYZ5/t8wqIW8PRNJcz
 /KTEdce+Y7ROSq6nkLsXWxSR0L8u+CHC8A5L4TiDB4mL2ZyFehwG50fLzJT13vnesX0H+fDAsEl
 5ZKeljldqVlAXJ4YxrZ0ylAPe7xPQC8fVkf5y78Hj7YVY/r23xCUnz+rz2GMYt5OIz2Pn5fFxEH
 76urY9KKAcE7lkhPIqYmIUx58FkVCC9emKwo4KEnPyq+Ol+OJJKHPx2WBo+YdeIVQyDuwXpM/Gn
 1aP0+wFCUJUoXyO8sAnlc0uisAe3H9l3jDZuSWqPCxab1e1XYdsYi48vOc9HmEFqwAy0HRBF2LQ
 9ovrXDql8advuAT497A==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a870739 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=3P15AqrnF0164yn1b9kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BXkhE2W-83Sw-6ADQnyzB6LmCMI4WtmL
X-Proofpoint-ORIG-GUID: BXkhE2W-83Sw-6ADQnyzB6LmCMI4WtmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200104
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 20/8/26 15:22, marcandre.lureau@redhat.com wrote:
>> All functions called by target has_work() handler take a const @cpu
>> argument. We can now fulfill the comment added in commit c2804566f6
>> ("target/arm: do not clear halting reason in has_work helper"),
>> qualifying the handler const to denote its idempotency.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> Message-ID: <20260820104730.25462-14-philmd@oss.qualcomm.com>


>> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
>> index dcd5c5065bcd..837ecb9b343f 100644
>> --- a/target/tricore/cpu.c
>> +++ b/target/tricore/cpu.c
>> @@ -111,9 +111,9 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
>>       cpu_state_reset(cpu_env(cs));
>>   }
>>   
>> -static bool tricore_cpu_has_work(CPUState *cs)
>> +static bool tricore_cpu_has_work(const CPUState *cs)
>>   {
>> -    return true;
>> +    return true; /* XXX */
>>   }
> 
> Add more explicit FIXME?

Oops this was a dev comment for myself ("this is dubious, better
review"), I forgot about it :/ As mentioned Peter in commit
de680286b52 ("accel/tcg: Make cpu_exec_interrupt hook mandatory")
"Tricore doesn't currently implement the architectural interrupt
handling" so here I'll simply add:

   /* Interrupts are not implemented */

Thanks for the reviews!

