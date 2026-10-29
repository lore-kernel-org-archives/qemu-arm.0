Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE41606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 19:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljbfvPhE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XxQBepKt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMVs4-0004kZ-Lj; Thu, 29 Oct 2026 15:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMVs0-0004jy-4u
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 15:33:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMVrx-0007C4-1V
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 15:33:03 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TIQwVQ907915
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 19:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oXuQMEHUjlg1HJCGGdWj3gFHC8WVsjJ3sNL0I+uGLOU=; b=ljbfvPhESUoEowCk
 ibXubv7kvyDax2FSO/2dmlb0MaDcySqX4vKYuXEwQHinXQRbcfmUMkATm+TCf531
 oXZwfLw+MD9pR2+IKQ9ubtdZZCCDvYVydL2U4VBaF8YKvEP5MnYThVtYB05hqOMf
 v7ZkSEZTTQSVRXWDPEvwcOFD5JSZ7vZB2LQKdB37J5wQHhxbvl9ZrQ9fuQxtggvS
 D4YsM0RsLgmFO13JAFbnVQ1nPwZOIhhIkLrWc+wGHdeeUiZxZtk3rdcT7aQMT2Lr
 HGRLE97LXIJ6d/yW4qkHOcs7XWv49HW/yE7ltqT5F1veuNH410wbf+aURs3V1nId
 7i+txw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmbearvrq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 19:32:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-35c3c370b17so85133eec.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 12:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793302379; x=1793907179; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oXuQMEHUjlg1HJCGGdWj3gFHC8WVsjJ3sNL0I+uGLOU=;
 b=XxQBepKtp8yx/2EQ9F4l77NyalkgpsFs46XLGhCx2CNTWNNAxQvSMQbfQnsB0tB2X3
 zrr4/zJQ+KFyLT1U1/N56j7nIS5rf53L63Ue/0nXXwd8eVIjgeR6mPBjn+qJ4M8rx0nb
 DbvOvkPsFRhX/yq5Tkq7bISFMl57a4YGTCC8W0Fw6pMeH144Fnl8iCQuDnEj681PAFeG
 JqgxWVtpVU7xBEuZoRz89dT+NIy2konw4rS0sy8AKKXghWUh0ealsZMg2fKvHHhX0NtB
 g7oabopygQGmFyUgbf48/8HwRjQxynBcJtq4KJMuA3EYS8wqvqtoeJ/lNXBE7blIknHk
 KTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793302379; x=1793907179;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oXuQMEHUjlg1HJCGGdWj3gFHC8WVsjJ3sNL0I+uGLOU=;
 b=ANZ97zs8IPugNVfek1l+8itiniuNFziN1l2cvLLaAQ3HTQIEl33Oh755zUO9RJqf1N
 WZpkF3M147znq4/PCKITAkfcyEVMX+mQmZiiknoysV8X/JYgqa715GyuWKo6hMFdyU/b
 cyPCbMT9zad/a/qZinvY8PvBelSypGobR3YSVdvhnQz+K6sZs2RkGj7ZlEKZ+kOhEnA0
 Ub36zgvi2N+6r+0ceFtX3PltLYxOsqFwVw0hVigDVIdFo5m3UkAVGOolXDkwnHpFo9iz
 nmSYoI6datV7bh5TiryYvNK7AwveER86Lzj6VNRvIu2KPX2hWbxUNgcMjqfnLim0RZyh
 Ck7w==
X-Forwarded-Encrypted: i=1;
 AKwUvByu2RcjhD8jhamCC4w6wAuxjOm5PI9HRuqr4vADWqAehAFZVlqEnIqyy34YJpVoyKooh0BavyfDkw==@nongnu.org
X-Gm-Message-State: AFq9FYL353cTWDaAb7VAh5xnWWS2QuaX8TdDqVKv5SLcSjfbAC1gxll8
 lDHpAVNDYF03sw/2M7T6szMGutD3B0Ac1MXgupY2Mh8VhQ86Obuv/rXbSjYRsLCGgVDhobWRO/J
 cqYEehHFFdDQcL3P/qviQnJy+JiV1UAYsAUVfNc8XeFB0u9C9fjLwjA0=
X-Gm-Gg: AYBFou0kAP6VdHEMC9Czj1qP+fo+c/7koffSvBBu7RkkdwioZ1nAt5XQb82aviIBkFg
 Nyl/Sz99T0XsPxKmEIwtqQ0jcj1dU1+W1XfzS4zklCIq4T82kQyhgloP8JNnGMJ2LTMJk/9EBI4
 eJQIgfPZ11khUqHEOGuVDGgVxvnD1BrX48V7VUOcH27Ypnus/lyng+z/jVKrcA9uyeEgNDDsXCO
 oYg6/A0CWIPgoUJyKVcQpQTwOuluGeOUDfPGd2dlCb8fP5ygt57A7I74XLQ/9i1jB7ftzofermw
 k2HLYiwuNd9zE1T1S152GC3xNNXVFdqRloAgZAYtxUHP1hH5woi37aR6gj1z7yE79G0t48Rhlna
 p35wq3y3WQ4cGyvOkLY57XbK8T4epAP2DbgtOtyFm7d5XO7EAQllOLaD3k4y12UwGv9nwkCLVhC
 hwU2qiP6bHPnhwz3PcjQTw/bTEcwQpDna4fTpRci9YYq8=
X-Received: by 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id
 5a478bee46e88-36a423bec77mr686439eec.22.1793302378491; 
 Thu, 29 Oct 2026 12:32:58 -0700 (PDT)
X-Received: by 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id
 5a478bee46e88-36a423bec77mr686356eec.22.1793302377805; 
 Thu, 29 Oct 2026 12:32:57 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a42902649sm747296eec.11.2026.10.29.12.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 12:32:57 -0700 (PDT)
Message-ID: <a762c5e3-804b-42d7-8313-3a0dc777fcb6@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:32:56 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] scripts/checkpatch: validate fixes against
 origin/master
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-2-alex.bennee@linaro.org>
 <c8bc6def-3c86-4fac-a84b-6664d40d5006@oss.qualcomm.com>
 <8733toa05f.fsf@draig.linaro.org>
 <e19ba1b4-60c6-47b4-b0b7-71e1be096a92@oss.qualcomm.com>
 <87wlr08g6s.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87wlr08g6s.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UejE26SN c=1 sm=1 tr=0 ts=6ae39f6b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s0hAlmzEkxELr0WrneUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 5GU0xUC4Jz64dyMv9IKu1Qdq6ZA4qkGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3NiBTYWx0ZWRfX9/+OX2KRDPCo
 PSncrHqwKBAczYErnVpju7RMWOt+iagP8ydmm7ab+XbiAjvEp1pf+tFXXbjhqCEy2ivoFhtEma8
 E9Bc8PPXzbXQzXvoNbxZpFUdtVGwmVrwRVLUs0eIsB38xwuNpSeIj77/fVJjK17+dCPHdf5VotD
 CvW4Zv30+/VhHQr5faT/wOQAHNlUMukl6bshVxmfzRseJg58vb0fgN/1lzLxWyCKZ/8MnRFzLnW
 T1+KV5O1flBa8H32DJTbkRz9wQzTDSsQhzdRmLJktyT9CNwrKMLWtWNs3bkq8LsUlDgu2qMYere
 WWKdZn4YQcxh7/SAuAzqjcurDnX1/8aeNpMqI9qJqyNE10YBn0A0tdC7US8UQxnD/wgaRIqFS+N
 tfwoDfehpEK2edkrF9pctnluShhwFcmG3eguiBjnWUmXwTijBAp8l5Yu+hY/zIcdgIPaDLLiHqm
 r6pfq+edFhIw34hN7pw==
X-Proofpoint-ORIG-GUID: 5GU0xUC4Jz64dyMv9IKu1Qdq6ZA4qkGO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3NiBTYWx0ZWRfX5EJKikFszS9V
 DFO+KYbJrDkwPaaRltQUobk8oOYVD+cmmOr2gtzJu1LvFxWEa/ujAn2jU5wDuisu42wn6Yu0D84
 lfmSAvASAYJ4AIcv5JIhoSUjMaN/sMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290076
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/2026 11:22 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 10/29/2026 9:26 AM, Alex Bennée wrote:
>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>
>>>> On 10/29/2026 8:13 AM, Alex Bennée wrote:
>>>>> The current check for a referenced fix commit relies on the developer
>>>>> keeping their master branch up to date which is not always grunted. If
>>>>> you create your branches directly from origin/master this will keep
>>>>> failing.
>>>>>
>>>>> Given that origin/master should always be up to date (module the
>>>>> developer eschewing convention) lets use that in the test instead.
>>>>>
>>>>> checkpatch complains about the line lengths but this seems to be
>>>>> standard for the perl script so I didn't try and fix it.
>>>>>
>>>>
>>>> Or... you can use something else as origin, with origin/master not being
>>>> updated, and master as a tracking branch to upstream/master, and in this
>>>> case, this patch doesn't work.
>>>>
>>>> Using master instead of origin/master has the advantage to not hardcode
>>>> what your remotes should be.
>>>
>>> origin is the default when you clone a repo. We could get really complex
>>> and query the tracking remote for the current branch. But if your deeply
>>> forked then that obviates the test.
>>>
>>
>> I am aware that origin is the default remote.
>> In my case, I always use "upstream" to reference the original project,
>> and "origin" for my personal fork. As a result, origin/master does not
>> always track upstream/master.
> 
> So master in that case won't be correct either?
> 

It's correct because it's setup as a tracking branch of upstream/master,
and not origin/master. See help for `git branch --set-upstream-to=` if
you're not familiar with it.

Thus why I'm suggesting to either leave master as it is (and correctly
update your personal local branch), or find which remote branch is
tracked for master (see git branch -vv) to not break existing workflows.

