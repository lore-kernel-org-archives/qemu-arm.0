Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E98C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 09:42:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAOvV-0006bZ-5z; Sat, 26 Sep 2026 05:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAOvT-0006au-BB
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 05:42:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAOvR-0001RV-Ib
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 05:42:35 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68Q6OjIX3446997
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 09:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bCPZh9kQkoN5x81Ijt4ietD2HROuQY8JrqTamKeNAw8=; b=b3Nn2mqL3gGx+f4u
 0h9NY7BhsMScnggvOUePebyMdpJ8qX75NylsSKjwH3Q6t5MsT3XuaBPlY0vIbmTi
 rNYfe3qZiXylFnyLCQXNFGYUaaE9e9vw/9bWQp/Tms0UWKG/OP9hQYfj+iv9TTJ2
 WOVjLze+sGcrbHyu/J6taF1SfqI70sfcpuZnXUrCHdVjb9V8FoIq3zVXrf5LlIcL
 /s8ZF6va5FY4/QhFtBQi2dYnZKjH1ToMxs4zodF6zlvbOfCAPY3u6vnAxa+vKNJh
 f3UyDIuQJr+ZpJrvR2LGbajWjYWuNABD9UgWq2h/bjbq+hQv4S6Vnb+8qHp0M/Y2
 lN8zoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6938k82-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 09:42:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93c599e3d3bso93238185a.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790415751; x=1791020551; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bCPZh9kQkoN5x81Ijt4ietD2HROuQY8JrqTamKeNAw8=;
 b=Gey0FzqPKT+r6AG5IJjclh33lwrO3OOt8XeIx54pA7lDu57cw/I7AvjSM7RiMuuXd4
 mOQdvQLCCn75lFvnSbM2przEVxdyNbMUKSSiOtnwEa2E75oNe1UKCej5+yPJ2mMzBOmj
 VGK7vFxlCWI0KMyaEB7QZ4Ingeq/n7viQGWv2hLpS6V8j2ieLmZcDuzh3+cKFKj2WgoP
 xEEFnzJoKgOLeeB7NS1cxmQNv/zjkpd2RqlqEiBgKG4xYrKEtLeK0whYCPAzWj6ekdar
 1Tl61FomiR0H6UcdQVDYiwLEbMZysfXMfThfau9OaOK1HDZ7tsT3hN/wjZPoxdDUBBaI
 dZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790415751; x=1791020551;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bCPZh9kQkoN5x81Ijt4ietD2HROuQY8JrqTamKeNAw8=;
 b=Ue70aNlcDQAMKkU0oOtfgKLi1h9Sm/6RF01Sx4dAo+zyjyh+Z47NPMGrLQwh1PM0AE
 oarNpKWipwMGhJD4DZfmP1NKEf3onzaWLwT/oHoqK5ri0RPkcb8eo8gsmJFOTCbc0Wyq
 /KNxXwSllRMfgH071O35rma6bXjmA+3oQ7+N3I37y1QLmzptrHEdb3Ams3M6RB6JmFc+
 tR+uU1J62ax/sfOH3vdR+M4jBQEEhsnAw2aGVeBPIS8RzyiuycridLv9a3nYbkVrBRAv
 SbTxSE7H+LpBY+UQV05Faw5JwmKNSXOO//03Cvb9XMYsOp5G+p9KHtnz4bRMLsih4ULT
 D2Tg==
X-Gm-Message-State: AFuF++kt+YWTiRtPHqabooQ11t0GfVqKAsZbzkdYMK/bHg1UI5WpnHPr
 WfsDykso7tfjDJCFAKHY9O5WXzDgkQZLejg/hJnz2k+RvBrR3vEGN54JRAFcxPZbQe6XOHJasqI
 ivIKjPDqZ1BPUmb/9v9tzGKFkSt2adaXHHqq0BEFGHesfMBZX8aEuhKc=
X-Gm-Gg: AYBFou3gqhuEl+oAwhLQ4CJFTTBx71wd1ggo+5iHJi9gpgXkWpBsu1NwVSavsxyYpym
 fJVzLLt8obpbuY0u8MffS2tYRBKvUSnxH0Bx9y61QFYtIrvyRjeF5xOOPWpOnEhT2l/ivztPg7h
 azy8i8LhTo0C5l4s2C06/Zbm0uXu1vXqnMOTL8GZ+5YxMkk/hOly+AeGoFtl/wtPhob9ufSfrd/
 3VYh0RRwCQ/+JpN4FHfbSVPzB4Bso/sTPUqf+dpyBqE5Iy00LLWEdK4KDenkYZGV5zwAn2jQ92t
 QbJ6Zh827Tlze4UFIWcqG6mpSlbBr9KDazpJji1q+6IyQ4RAYbvD3MfZEyG+F31fJrZhZns41wX
 Ptq6z0c5HvQgGTVMTV41iaJQGfLbjJTZJQg==
X-Received: by 2002:a05:620a:a7a0:10b0:93c:56a8:a0a1 with SMTP id
 af79cd13be357-93c56a8a319mr259718585a.58.1790415750671; 
 Sat, 26 Sep 2026 02:42:30 -0700 (PDT)
X-Received: by 2002:a05:620a:a7a0:10b0:93c:56a8:a0a1 with SMTP id
 af79cd13be357-93c56a8a319mr259717385a.58.1790415750208; 
 Sat, 26 Sep 2026 02:42:30 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a349731sm13434275f8f.12.2026.09.26.02.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2026 02:42:29 -0700 (PDT)
Message-ID: <52c613fd-41ca-45c0-9d74-faccb58c11cc@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 11:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/bcm2835_cprman: correct register index in test
 for mux update
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Jonathan Gilbert <logic@deltaq.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Luc Michel <luc@lmichel.fr>
References: <20260925100726.1546566-1-logic@deltaq.org>
 <507fb835-61a8-4e66-80f4-1ae6f07a5bf1@oss.qualcomm.com>
In-Reply-To: <507fb835-61a8-4e66-80f4-1ae6f07a5bf1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzOCBTYWx0ZWRfXxvIYvN28wM95
 +6aiPnRw4R9NH3XLy4IrxFXZ0rUJsvRe2WstgejjzGugyNJiNlGt21wuDbulT/3xWXBe+ao5V0Q
 ifCXDj2NZwgRGK2jUhR4aqcJ4aavgQI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzOCBTYWx0ZWRfX0/1QURlN/fog
 srVHTgiG/YI7bsyLxCQpR/rhlKaNnoY9hc8qxYSAG/BJPwgWrcey7IAKsDTCDdu0GKpBiwwDgJr
 k5Bv+BApCz2GDO2aO95KGRjWe/+Uwzqs+IVn0tKTIRdyKEEtB7/AJAowY0mpyqxKafzjzYeUAB5
 FdzVi15T2dfnAjEhVLeAHKVgfMwo2flsF4O7Ms62IQZGyICx1mhdBIt9ERB9K5ulULlpLXQKadA
 a8Sbbwm63Gndn/zTDRsKzwb97DA52cZvZmGoC92yNLiqqup/ymkFfpFes8FBgj9wE5LDyn72VtE
 zZGHi6UlsTu2p5vbPL6vXfm5qQHUwnBKlMEqxdl4LxRV78XeeQDFs5CVvq3+DdDR8/m222Dj7bt
 QYDtS+29WDcIZBGVg3eW5mzVJFpBeYAB+dgdC39nkKgpLYXSt6+wuW7UkT/lddd7UoPyLolOq4Y
 mNTxry7TxWJoxrRCvaQ==
X-Proofpoint-GUID: nwuNZ8pE_IA_ug3Q6oAn_d3qh_n_kq_K
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6ab79387 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-ISfGIX_AAAA:8 a=KxR8Bmsjh7JHXhFszHQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=6K80JWTZPwV2TOQbRzu6:22
X-Proofpoint-ORIG-GUID: nwuNZ8pE_IA_ug3Q6oAn_d3qh_n_kq_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260038
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

On 26/9/26 11:30, Philippe Mathieu-DaudÃ© wrote:
> Cc'ing Luc
> 
> On 25/9/26 12:07, Jonathan Gilbert wrote:
>> After each register write handled by cprman_write, function update_mux
>> checks each of the clocks to see whether the supplied register index
>> applies to it, calling clock_mux_update if so. Each clock has two
>> registers, so it needs to check the base cm_offset for CM_CTL and then
>> the next slot for CM_DIV. But, it was checking for cm_offset plus 4, as
>> though it were a byte offset when it's a logical index.
>>

Fixes: 7281362484a ("hw/misc/bcm2835_cprman: clock mux skeleton 
implementation")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>> Signed-off-by: Jonathan Gilbert <logic@deltaq.org>
>> ---
>>   hw/misc/bcm2835_cprman.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
>> index 8220f7a6b4..f9a77ff9bb 100644
>> --- a/hw/misc/bcm2835_cprman.c
>> +++ b/hw/misc/bcm2835_cprman.c
>> @@ -508,7 +508,7 @@ static inline void 
>> update_mux_from_cm(BCM2835CprmanState *s, size_t idx)
>>       for (i = 0; i < CPRMAN_NUM_CLOCK_MUX; i++) {
>>           if ((CLOCK_MUX_INIT_INFO[i].cm_offset == idx) ||
>> -            (CLOCK_MUX_INIT_INFO[i].cm_offset + 4 == idx)) {
>> +            (CLOCK_MUX_INIT_INFO[i].cm_offset + 1 == idx)) {
>>               /* matches CM_CTL or CM_DIV mux register */
>>               clock_mux_update(&s->clock_muxes[i]);
>>               return;
> 
> 


