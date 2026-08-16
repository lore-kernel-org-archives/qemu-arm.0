Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2F9C5DF66
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 09:12:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvWuB-0005t9-Ou; Sun, 16 Aug 2026 05:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWuA-0005sC-3d
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:11:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWu8-0001Ff-I8
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:11:45 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G71jpb3319387
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KdbNQUou+xQoWZZSBwZEMOBzSbgSNuXhzX8u77iLeBY=; b=Dq1gK66fPLMQstb4
 p9bfLTqjlIlDrp+zLcpgygfxRY6Wg+3+D6UskjX3lz+ftVXCtS4c21U1QP10Ybbz
 tQckLB9FnMg+96uxF9qNGD8g8D1Y3EOsUXx04VX8w9/c9Ane/2yaEpGaZi7F5d7d
 NahyaQN7M5vJ3oANBRrhXGou4gVWLUDTMB+hunWPCoVaUI9aa/iyJQH0flIDBSYj
 pgyEd95z2jNg2Cjd/4r7J7QS6iGYNnvdtqDCQFLcgxHkNqJVcQC3Fr5E6u/T6aFl
 XLyGBTVQCJz/sgzgHY9z865K8+P2OuLM23oJ1yqkV9hFowQQCpdqayaWTP9u+27P
 htnpZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwk48g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:11:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52d33c89a29so30671091cf.1
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 02:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871502; x=1787476302; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KdbNQUou+xQoWZZSBwZEMOBzSbgSNuXhzX8u77iLeBY=;
 b=JSol/F1tpRMOLf0rn2LRTJ1CtRLvTbymMVqAwwUfsh+mB/XfmVNw/KzW1XhgFPMuoo
 50XAe2Cb4nYhv7rPGxTVsmAPButk0PHbAN7tlpuCMg+Ar+D+XzXEB7m2klnUhg5NfwZF
 /m3ThCDUMtsvzwsUMUxOwnm0dQ4ILycurFRuDtfko8SECQR0765LrJkHKiL+TcOlFN+E
 AgE0Vu/rOmInL964HSkq3jkFI5RefwvLqX9M8LsUHsJYPEOas0a6PJDJ+cj1nTiXeY24
 R+RfOns4J71nls3kwhCJ2jozn64ewWgT2Od4HPCZtC1UTBLXpThszXNjMbE6inGiy9jW
 ioXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871502; x=1787476302;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KdbNQUou+xQoWZZSBwZEMOBzSbgSNuXhzX8u77iLeBY=;
 b=jQK+CkFRTpjbTHC+Tv4KI0722KauSTeMGWK2P0ijElXqCrjl4vO34Keoq81VZ7xc/+
 4ptcMZFyyJuQw7ztza/HCeBi6FEvOEImOFCxM35apHi5R5rf61R2S7XunrsCMtjXJ/Rj
 VUnYvb+BArgUaMVD5VT3cifMKOuEWR8jY4ojgUkzIGDqtNUojv6VGViiaICOayDb2upm
 aeUewPGFrLfOiLMWu51RIynFQhj0dcvk/ssIx4xX5AnOmfD1YY+a6tEY0Rvw7B+mS7Dz
 H0bHRvoLiHVv7QhCwmuHy+kSV9ZvjiXt7L2lGOwCO7SS137t93lBn/ByVXylrj+0h+6y
 3YwA==
X-Gm-Message-State: AOJu0Yw8Tq7KzH8LL/5X6jLzXikZMwac8EM4S/iOdkLA9jbhbjxjl25x
 i1OlkLLsVPbTdaXpyBDRT0Ls28/cGkjiHOWrcvLovN9CLXrr8cV6hqtZH3DjCe3y8FAEhgppFpN
 izu0BUisnbKbmUEZmt07H25K0rI88i3YWB+pR9qTR2vwslnrCtn3HFak=
X-Gm-Gg: AR+sD10gw5sRPIAo87OlkNKKy/JHQWmSRMcJy1tGzLXwdHjOz/cal8u8UgGbkSo6UWm
 RhSsg4yXq3DpQbtjTBwueh4eb1ifm/rwAKF4gQJLNRsThicov+MzAx8IbG4QkrqS367hcNOxT0Q
 1FEn90fJIp7Nezw9sUyIYPkOjVEwSkT+0MNtn22DGpaXjoiX1YOv+JEhs06CN3i9c8G9D0c0bTl
 h9U91PRnZGgCuR26JrmT3nRR5Ie4hFypuKUeZ1fx2WdJlLu6z5J86ABa4Er3Q8SLr8JaC/7TGzZ
 jnILU6jD2fX8IkVwieLx1nlk7pjKAJ0tL7sYjMNubJZszShy4zhLDR4w+WeOI0YQnPnk7cl3mL8
 SXnCiDHvX3tHRd8F/HmaQGeJTyePlYKLiQtg=
X-Received: by 2002:ac8:5fcd:0:b0:51c:167d:b346 with SMTP id
 d75a77b69052e-52d85420e12mr167004531cf.23.1786871501664; 
 Sun, 16 Aug 2026 02:11:41 -0700 (PDT)
X-Received: by 2002:ac8:5fcd:0:b0:51c:167d:b346 with SMTP id
 d75a77b69052e-52d85420e12mr167004281cf.23.1786871501309; 
 Sun, 16 Aug 2026 02:11:41 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996108141sm27335365e9.6.2026.08.16.02.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:11:40 -0700 (PDT)
Message-ID: <6a6b6a70-1558-4fb3-a0f4-87958a350b72@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/18] accel/tcg: Replace size with first/last in
 probe_access_full
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-8-richard.henderson@linaro.org>
 <2875df0a-d000-46fa-a8e9-22aadf102a7b@oss.qualcomm.com>
In-Reply-To: <2875df0a-d000-46fa-a8e9-22aadf102a7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H-zC5I3wMn-NPs61vILY6oRm5iP-T_dx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OCBTYWx0ZWRfX0SCFmodM/5un
 mryJy1yZklJwoAp3hoF/fyrOxD7YiemT71XncIFJcgi1RwaEUwASoFB/cdUkKpycb5G8/Wq0/8Y
 oGtT85/EBunctc25rYukflwLdP+7YjrQYnY+hGByDYOiKiNiE7sZqU/GJ7FTunjKAbaBRcadRfZ
 dLt20iJKpFCQcMH5/BDX3ZfWSTCyhxPiYeKcR1En9arHoc/xnrgvKxx4Dkc7XqTGkFmXUl1vDBy
 Sf/LkbxP0Ye2BpFkb+3cCUH5YVAq1Z4X0uj6Z+kBriimyUIJvTvYEdIlZGq0kKWjsRCdsdXUHIE
 SYxXPAP8ZiSCXgGHO/qGmuka5kEFIoyP8n4jItw9xNxN+SajoJO5QZzKPpx+zvcNXajH4f8Wht6
 A7Ygh41/HcCClMNgM0zlseOf2VIG6PIoaxLCs9kuhc6RQpmQq8rm1hvEnpYM+yCMnm59328zGHI
 zKIXIl3jhZvnBYPVnvw==
X-Proofpoint-GUID: H-zC5I3wMn-NPs61vILY6oRm5iP-T_dx
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a817ece cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bdvilYR6Lf0MEp-pbN8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OCBTYWx0ZWRfXy1IFfVuX2zvC
 4wPseTO5uhWIYT21zKBTn5Y7iInJcdhw4VZR2IQYzfP6jjw8KYl1xKeI8X8YZBqbyeAATxSKE8H
 Jds0CiZ9vvSmA5hZ8WREswsr1jTyoVk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160068
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

On 16/8/26 11:09, Philippe Mathieu-DaudÃ© wrote:
> On 15/8/26 22:37, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/accel/tcg/probe.h     |  2 +-
>>   accel/tcg/cputlb.c            | 17 +++++++++++------
>>   target/arm/tcg/helper-a64.c   |  5 ++++-
>>   target/arm/tcg/mte_helper.c   | 21 ++++++++++++---------
>>   target/arm/tcg/sve_helper.c   |  5 ++++-
>>   target/mips/tcg/ldst_helper.c |  4 ++--
>>   6 files changed, 34 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
>> index 0b788901ba..e3068a79de 100644
>> --- a/include/accel/tcg/probe.h
>> +++ b/include/accel/tcg/probe.h
>> @@ -86,7 +86,7 @@ int probe_access_flags(CPUArchState *env, vaddr 
>> addr, int size,
>>    * This function will return TLB_MMIO in order to force the access
>>    * to be handled out-of-line if plugins wish to instrument the access.
>>    */
>> -int probe_access_full(CPUArchState *env, vaddr addr, int size,
>> +int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, 
>> vaddr last,
> 
> I prefer this clearer first/last range API, it feels safer.
> 
> Missing updating the docstring, otherwise:

I now see this is done in the following patch. Maybe amend

"the probe_access_full() docstring will be updated in the next commit"?
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
>>                         MMUAccessType access_type, int mmu_idx,
>>                         bool nonfault, void **phost,
>>                         CPUTLBEntryFull **pfull, uintptr_t retaddr);
> 


