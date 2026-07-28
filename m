Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB3C54EFC
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 09:22:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woe0p-00048U-BB; Tue, 28 Jul 2026 05:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woe0o-000484-7p
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 05:22:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woe0m-0003f1-4f
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 05:22:09 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S82G7O1908923
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FLQ9XHrcEMZsAjA9w3V6QAarjk/siLio1dChpUVZfPI=; b=StnmZw//PuYWEz36
 V5jZBFP5SMq90ZqqujXMDC3pmLtcTXuPgXSCAMIiIN7KmEPYsbPtnCN/RCNp4/nP
 8dsMOUGa8ywE3Z5Dwck55XZZRHyGYoCpfTA2rkwSP5Vc+J4Tn2nxq5dLTBNLctwU
 aKFTVEv4lYKU/wr066G32JTOmtTxguHM1mxX5w+KLLmZvzMpRTSoVT46nTsTtUBP
 /7gpQkXm1hdbEPRHeIDl4gyHJdWg83XU9+We8BlY3S33hz++fTP0/oCQphD3+8N5
 rRdZn0+gVFOp87EHWOENOwHp95TJUKlhSMNWNN2Y8C01OLuMugEArKUN7nILFzLg
 YQKq3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8bj3v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:22:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c20762d21so39529911cf.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 02:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785230525; x=1785835325; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FLQ9XHrcEMZsAjA9w3V6QAarjk/siLio1dChpUVZfPI=;
 b=CFgeFMajc8Fb+dtoPUHkzPAiRkEZbbv2N+CssR5ioV3IH7XRJ8WF51htKObYlXMbO/
 NISNanjVkIpXipPZj+Eex70FXq0kxCUww/YEupk6fzRZQotwoImrrlbLmNBHosmVDQ3f
 d5yRGE76fYBZHPFdz8CNFY17GrzzmJb+DWCx2/trdOt4sEBQgfpSIo+4w/nCeuiS+jaO
 LY80HlUtHoOTV3nC65SCHCDz8Hz8QULo6IP7vipidRHJM5JRHnPwrzADbiU6B01zioYx
 mwgF5KaehFQS0WWbx2E9AR/1rTb5RcKhAsYSGStk7/+HjZlVzUAEDBjl/+1fEdgVyRSm
 1/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785230525; x=1785835325;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FLQ9XHrcEMZsAjA9w3V6QAarjk/siLio1dChpUVZfPI=;
 b=q4ozJ4yj0nMRzkGoVE5Nw61UErmqk9u/yYVrAhEFI05YZQqWuN2xgNSgbx2p+lEEw3
 KSNZBZL4j4Rj5gMaSdn4TnYQZoVWJlOeBEPmIvMB4Ergjyg08g0Kgt1CpoxYdOn2+o33
 lJCXzUKYiwl/bM49R/F1+fZ0/cvJJhKi4m79yj+XcRa53T0TcRg3HlHlqk4Z5M2sTjg0
 yOUGXCL0GT3YP7Xr2DILEGvs1iHeG7myM8eJeRnHbragYXOMy8ijPhQwRobKQPWLsxUS
 2v80iQ1Bc6L6oi6tAHza5T/rDdvhvfNdfbqHDs6ZaE1cZIrtjehgjrKMOxNocA+9VADv
 /86Q==
X-Gm-Message-State: AOJu0YzQjq9bUdswh4pSVG1PX45KV1ft3vOa8347MFGT4sy3Zs2AbiKR
 5K6MJrRDKYToeerDiJoob9MhgqiW7XW4CHNk8Eq+EJrEVEsQfOqhcWpjVyuaQHHW/4QtfteYu88
 sISv6Qf1QvBAUtfMw2dUOM7uao5gCUkjndCsfZJgv2krj5OlPHUsC6Bo=
X-Gm-Gg: AR+sD12mwKI/J49itVRfnBlJw11mgquVtBoZFVzslFD/RQ5Q827RNxbfTtONvCW5mU6
 Eh5xf4BzEVVK8ICfK+ayCG8YJDOz54UBqfDiwBj25Hs/m4VKc9S2/uIm/KkAYjRuDqqkltT34E2
 O/pBoECYQFSKvjCUvtMm1+mSFloIeagjyLaiiCrplFEYzZqhPg8p0HzLlec6Vsx14bnXn5U40o2
 oFoS+YI5jlHnxBPpdF98BvEZmaZx6Tjsw1cL+rF3ENEebUcFjDKyV1m6ZWNHS+WS7ch/CIZIJWZ
 sYabNEEH0v6R6wGC7QwFQH8XUuNcazmcBg0igRr6Zu6aVSxsmoVCiX4gMIWUjKCzpMfYbq+XJ6G
 8L23hcPgU7OXqagKNe07/I8bhwMhfAuv42bBEC5ZzOljLJlAYZww=
X-Received: by 2002:a05:622a:1822:b0:517:5e32:af1e with SMTP id
 d75a77b69052e-529d70b96d9mr10144931cf.8.1785230524896; 
 Tue, 28 Jul 2026 02:22:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1822:b0:517:5e32:af1e with SMTP id
 d75a77b69052e-529d70b96d9mr10144671cf.8.1785230524280; 
 Tue, 28 Jul 2026 02:22:04 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bfe07e1sm287734535e9.3.2026.07.28.02.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 02:22:03 -0700 (PDT)
Message-ID: <13333e56-3725-4550-849c-9035f6925213@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 mst@redhat.com, richard.henderson@linaro.org, alex@shazbot.org,
 berrange@redhat.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-3-gshan@redhat.com>
 <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
 <0a384d67-fc56-4a21-9d0e-25f218a45228@redhat.com>
 <CAFEAcA9HbTSj9cJfv8o=jYSuPhScr-RVKWCos4kpUJ+T1S6g5Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA9HbTSj9cJfv8o=jYSuPhScr-RVKWCos4kpUJ+T1S6g5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MSBTYWx0ZWRfXzfjLZPvKMHst
 6CFPEuq4jC7n0e8vHyE3aCo1H6jSRe+jTieRqwuEpyYudyuBTGW/D0+MXOl54qEjWlxPQZJjc1C
 qgSXk+emfRoRlhnkh6AN+A4wRKOAeYs=
X-Proofpoint-GUID: fKHNJ7SrxztcrsXE8XgZHHClF34gWDHa
X-Proofpoint-ORIG-GUID: fKHNJ7SrxztcrsXE8XgZHHClF34gWDHa
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a6874bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=pWPCkQm_3bG9_IKA4IgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MSBTYWx0ZWRfX2ScMetskWihH
 Nq7NCog0q/ITf1YyxCVhzGZT0PfMuCJq9P7uwFzpBPrHsvWozk9MKbJjikDsPZ5OvatnenMG0ut
 FekcnFqGLQXaNLN41S0FvxvOlt/j3yxZpq0QtWGtvzLQiA9FEvzKTzXsQD96ESWAv6tUnqoqcmU
 uqSzSFx2/dc1XWs3QPH27M70vjmWuS7eYHoSdssEhhncKBBL75ICY8uX+vl2s7cQs+xg5Inw7Wq
 V+SIceCJEFVlib2mRjLP04HmfxwdWT/ptORA/UNzvf8kh619EgJc7t0Eh3fqUVl5XtiFpxhE9p4
 F788QAHwJtQK23pmcXbGzG7JgxVOscieFuktoFTFZEtpBeCjy+8kLUd/AL1m8fSOFuYfvL8Tk/u
 LqJ1BCL6J+CbhFnVc5P8f5UxIuTGi9UiV/RvfUVs+GGnf3FaRmss0qHjsLgf2n7vZWRvnSGQwlD
 MPkkpINtqnL3UmGqN1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280081
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

On 28/7/26 11:01, Peter Maydell wrote:
> On Tue, 28 Jul 2026 at 04:01, Gavin Shan <gshan@redhat.com> wrote:
>>
>> On 7/27/26 10:51 PM, Peter Maydell wrote:
> 
>>>> +void qemu_ram_move(void *dst, const void *src, size_t n)
>>>> +{
>>>> +    uintptr_t test, len;
>>>> +
>>>> +    if (src == dst || n == 0) {
>>>
>>> I think we should not bother testing for src == dst. It's
>>> vanishingly unlikely to actually happen, and if it does
>>> happen then the code will work fine, and it's probably better
>>> to actually do the access in that case than to skip it.
>>>
>>
>> We can drop the check of (src == dst), but it will introduce inconsistent
>> behaviors. For example, qemu_ram_move(0x1, 0x1, 0x2) is finally turned to
>> memmove(0x1, 0x1,0x2) where no memory movement happens in glibc::memmove(),
>> but qemu_ram_move(0x0, 0x0, 0x2) is turned to qatomic_set((uint16_t *)dst,
>> qatomic_read((uint16_t *)src)) where we do have memory movement happening.
>> So I would like to keep the check of (src == dst) in order for the consistent
>> behaviors.
> 
> Well, it depends on which kind of consistency you want.
> If we do the src == dst check, then we have the inconsistency
> that a small aligned access always happens exactly once,
> *unless* it happens that src == dst, in which case it doesn't
> happen even though the caller asked for it.
> 
> You can see this in the documentation comment I suggested above:
> if you don't check 'src == dst' then you can document it as
> "memmove, plus for a small access where src and dst are naturally
> aligned we guarantee it to happen exactly once atomically".
> If you do check src == dst then it gets more complicated,
> because you have to say "memmove, plus for a small access
> where src and dest are naturally aligned *and* src != dst then ...".
> 
> I think that because it's the small sized accesses where we
> know that it might be necessary to really actually do the
> access, that we should do that also for src == dst.
> 
>>>> +    test = (uintptr_t)src | (uintptr_t)dst | n;
>>>> +    len = test & -test;
>>>
>>> What is this doing? I am not a fan of clever bit twiddling
>>> that isn't commented to explain itself. Readers of the code
>>> shouldn't have to go off and search for an explanation of what
>>> is going on.
>>>
>>
>> The following comments will be added for (v5).
>>
>>       /*
>>        * Maximal length of aligned access that are determined by @src,
>>        * @dst and @n
>>        */
> 
> What I mean is more that it ought to say why "x & -x"
> achieves that goal.

Hmm isn't "x & -x" restricted to power of 2? Here we have no garanty
@test is, because we have no garanty @n is. Ah, this is catched by
the 'len != n' check and returns after calling memmove(). Indeed not
very clear notation. Again:

   ...

   /* Overlapping buffers, unaligned or oversized access */
   if (!QEMU_IS_ALIGNED((uintptr_t)src | (uintptr_t)dst, n)) {
       memmove(dst, src, n);
       return;
   }

   switch (n) {
   ...

