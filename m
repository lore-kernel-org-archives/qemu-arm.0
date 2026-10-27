Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F90606A31D
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dJk5pGbz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dmzvCs7z
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLlHa-0007ps-2W; Tue, 27 Oct 2026 13:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xLlGo-0007PI-Us
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 13:47:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xLlGl-0000n5-Jm
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 13:47:34 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RH02nV2463855
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 17:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ty9+fiafXq474hlOFhWxvUr+em4KfWrgfbBqXSifHpI=; b=dJk5pGbzQtAkEjQ7
 iGw7W88TeZ+1hUUOJOsNtPZmKbUrtyVgkwoiNuKBNRcTjrSSLnlfJ62vAsNB5tk7
 ijrGAYKg7Qa3obOkRlWKN/Z17VjUq3vg0YqxAaah991tQEMjfNhrLCD6Fl71tA9w
 SS1E2ReftXV0TIRaA3Q6f8Jt1hy3FusIVEwpI2oza8wimea+guJP+sTy8xxfeVn/
 n068JWXqvgtghCfe2MvIBiStIuWCudYcsUpvXfOcn9Am1vwk4tJOeSECwx+zBEO9
 IVLBbCFLzNsUX4oA88CFjjRJ1ve26xopYABUt/vFDkOmjTDgzvBF6ePW9NPO4ulY
 ke6ldQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5tm39-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 17:47:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3548cdfd2fbso110934eec.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 10:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793123249; x=1793728049; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ty9+fiafXq474hlOFhWxvUr+em4KfWrgfbBqXSifHpI=;
 b=dmzvCs7zi8x8jo70cL0ley0zs0jDyACyBo6nuY19SrUsi6Iq8nK+CbQZhw/MTWa4Yl
 Do/tQQGZgzd5OEKBROpEbaT2DGtwF07izXQLE1V/hsl0GTLR5oeqA3IYJpB9ztyqLZpz
 aXqSOy2hetHWECgq2tUC4nCWOtmRjy7jtzKRE8ztVB33PdNRxlOKMU/WL50odcX+xoRt
 FAG6phtKgj/vVRaP5TN+SfuGMVvAOL3ms5EfqfRJpxnKgxtmhcrzU1/1ApfJt49MsiJg
 DDxmveqP3eRK54DrvXIh1uyBTe3XEkA0nKWm6dAHExzVwx1oOBsbCRMFJFNYlQEDuwaj
 DjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793123249; x=1793728049;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ty9+fiafXq474hlOFhWxvUr+em4KfWrgfbBqXSifHpI=;
 b=a+HQCjw8/nCWNuVpE1IW4h5m+c4KvusfRYfm8DBEuG3zRZNuz6DhsQ3nf/pt9a1Vbo
 OMXIYfYyEXqwD3In/P+JUYJ7aWjo1BlGdTmK+LsDHtO2sRDkBHoRs3eon3enMa8cieOT
 /RGlvmN68GzgYopE2wzzMngiGk5/3JnulwCP6KZWeCpKyuTOExDkVoUEPrnSS641jR14
 6OlbX0ECGwPha/QDaR4MHXIKyCKWQy/ByJ2xunD8CXL88LibKkfaAMUphoac6TlBdDNy
 qhio8SV273lwZV6iDkEnnBbjbRtTGrvoOYse8tP/ZM2PdV+I4GHNoG+UH2VMtpdGQWKA
 Stmg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwrUy/FjRpBKbqdGJaInrOiu8QRd6rl6ys8lD+jnVhZDkjq4EStclEWMHmUkdxeFgugWKevD7nj+w==@nongnu.org
X-Gm-Message-State: AFq9FYJ60JVOFUgLAZ/zAI910Tc3GiPKNvy8rNep7uPV3laKsK1I/ayC
 nez5L+DBUycczhXHzVTDpyaGkla52uTtVvz0vymaH9EWDZwS9ZiXma1xKzzXHy4/EVHxeDBu9v3
 4CLb3xad9JttnimV3ANTvt4NWipUutPLr2EKuTUzggqeq9029hXqryEY=
X-Gm-Gg: AYBFou1HWSRnBOlogac3s0cXo58s8T98R+izIjzO3IWYXHEhV9CR8564LNdWbLzenJu
 zb6daGyWS6f3DDRsXNQpH2WKoWlWY0cx5xAwL/cz/Bf9WBKZDsBDOzkHwWwHfG0NJZmMwadbF1x
 0yMXrVyyu5CFQGgZ9d8NAXtzgP08WqiBfaf95mDRcubBLVG/G/QOKZz2sGpLOGC/zoCuGA+imZN
 NVOWfv9n7hHBlVSbZwEHt9qE6yLl9TR1ylujbkrip7KZVlHUGUpf5q5ZqLPcEPEE26a5+IcExDy
 XuPH0tCAFFnUJrpgXSFZMpQItuaGEsG7y4LhOK5y2FooflFB9KnwkfLnEk9+VtlorMUAPHcGwki
 SlmK613ObfeaWWSsBtFh7qp9FEnN8OaUUellAd3kZQ0G3RCkQ5Vi+S83fLsNorxopiTBDgw==
X-Received: by 2002:a05:693c:6092:b0:36a:10d:af89 with SMTP id
 5a478bee46e88-36a200c3d4emr343742eec.20.1793123249047; 
 Tue, 27 Oct 2026 10:47:29 -0700 (PDT)
X-Received: by 2002:a05:693c:6092:b0:36a:10d:af89 with SMTP id
 5a478bee46e88-36a200c3d4emr343695eec.20.1793123248395; 
 Tue, 27 Oct 2026 10:47:28 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369f27d5bf8sm34193727eec.4.2026.10.27.10.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 10:47:27 -0700 (PDT)
Message-ID: <be4768e2-59d6-4b37-b35c-02c64ea366b4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:47:26 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: defer max-v8 initializer selection until CPU
 creation
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20261013195606.152-1-luoyonggang@gmail.com>
 <f3649d73-1edf-440a-9534-7b00da4d075d@oss.qualcomm.com>
 <CAE2XoE828e76zdCEkYVcbjRwhcsaSYZF1_UE4akeaoCTqCK3zg@mail.gmail.com>
 <baf81ba3-f29f-48f0-a9a2-6dc4f005d433@oss.qualcomm.com>
 <CAE2XoE9L8tuhU2nieJ8D=Cz9svS=W3oqAH+j30RGtZibjp1G=Q@mail.gmail.com>
 <bb979f8e-1372-4be4-814e-aa5dcb09942a@oss.qualcomm.com>
 <CAE2XoE-rJ67RbTem3fSirtNUR0bzEXEBsqt90fRqV1BFmKi2TQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE-rJ67RbTem3fSirtNUR0bzEXEBsqt90fRqV1BFmKi2TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MCBTYWx0ZWRfX90k6DLj1ENJF
 QkeWG7pFkmYrEVgaeOvidU0i0gV8X/jVxeHk/wcA6wFYetWp/GL4wqNTI3JyrDXJ8Yv5nZaP9Lj
 HOSRlwsvsj/T/LSKD41gbey0p++j2LA=
X-Proofpoint-ORIG-GUID: FIJUplLYyNhhvMQgjOdptg8TQr7g5RuH
X-Proofpoint-GUID: FIJUplLYyNhhvMQgjOdptg8TQr7g5RuH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MCBTYWx0ZWRfX9/Iyr/ftzMtE
 2UhiZbjKYMzbxD3NpQIZR0Hlv3x2Lh3hqLMdTkiilNaYnj/yUkQ0BdlwxHS7hisqehZam11fniW
 P8ARCbRuDeAvEQKHQDbH+TfMht5aJAeq/eb7PrIuRfs83zx/hx7uUhTEXWlr5dgIu6UBdw/MouB
 YiihVmY+hbLjFiTQDWiA11arRGtf8VcUwbzXMLNCUWHRfENAg9PhPKwbrPt9FwrpBvkJRCpPsOK
 c8rNm+2xBi+CacPphpU+UNcnB343aq1VoKd2h/Exiim+8oXhobPfRaBzZFgizK/Dgl0eCSFdROE
 z9poHQUTwYzibaBulDUnr/HFE4PXbldEwWAxM4eCL5bT171HgUPYC9YnxelQ/nTXm/srwqAwvEx
 JTpAknK4cPCokjygbvGzuAK98Ct4sb0JeE1YIM1bUOnYHPZ+ZplWeZhGa9JhmDIOb6tCRlztlKJ
 gBJMlmT7cekAnCyE4JA==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0e3b2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=XDac9du3ME5YGwKxaIkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270070
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 6:14 AM, Yonggang Luo wrote:
> On Wed, Oct 14, 2026 at 5:37 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/13/2026 2:30 PM, Yonggang Luo wrote:
>>> On Wed, Oct 14, 2026 at 5:07 AM Pierrick Bouvier
>>> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>>>
>>>> On 10/13/26 1:19 PM, Yonggang Luo wrote:
>>>>> On Wed, Oct 14, 2026 at 4:08 AM Pierrick Bouvier
>>>>> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> On 10/13/2026 12:56 PM, Yonggang Luo wrote:
>>>>>>> This is for avoid "max-v8" qom name conflict in multi-target qemu
>>>>>>>
>>>>>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>>>>>> ---
>>>>>>>   target/arm/tcg/cpu-max-v8.c | 17 +++++++++++++----
>>>>>>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
>>>>>>> index 65f851f2006..d7323ab431c 100644
>>>>>>> --- a/target/arm/tcg/cpu-max-v8.c
>>>>>>> +++ b/target/arm/tcg/cpu-max-v8.c
>>>>>>> @@ -119,12 +119,21 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
>>>>>>>   #endif
>>>>>>>   }
>>>>>>>
>>>>>>> +static void max_v8_tcg_initfn(Object *obj)
>>>>>>> +{
>>>>>>> +    if (target_aarch64()) {
>>>>>>> +        aarch64_max_v8_tcg_initfn(obj);
>>>>>>> +    } else {
>>>>>>> +        aarch32_max_v8_tcg_initfn(obj);
>>>>>>> +    }
>>>>>>> +}
>>>>>>> +
>>>>>>>   static void cpu_max_v8_register_type(void)
>>>>>>>   {
>>>>>>> -    static const ARMCPUInfo max_v8[2] = {
>>>>>>> -        { .name = "max-v8", .initfn = aarch32_max_v8_tcg_initfn },
>>>>>>> -        { .name = "max-v8", .initfn = aarch64_max_v8_tcg_initfn },
>>>>>>> +    static const ARMCPUInfo max_v8 = {
>>>>>>> +        .name = "max-v8",
>>>>>>> +        .initfn = max_v8_tcg_initfn,
>>>>>>>       };
>>>>>>> -    arm_cpu_register(&max_v8[target_aarch64()]);
>>>>>>> +    arm_cpu_register(&max_v8);
>>>>>>>   }
>>>>>>>   type_init(cpu_max_v8_register_type)
>>>>>>
>>>>>> It works for the current need, but will require further changes for
>>>>>> heterogeneous emulation. A more versatile solution could be:
>>>>>>
>>>>>> arm_cpu_register(&aarch32_max_v8, target_arm);
>>>>>> arm_cpu_register(&aarch64_max_v8, target_aarch64);
>>>>>
>>>>> And another way to handle it is like x86. it's comes with two variant for
>>>>>
>>>>> #ifdef TARGET_X86_64
>>>>> #define TYPE_X86_CPU "x86_64-cpu"
>>>>> #else
>>>>> #define TYPE_X86_CPU "i386-cpu"
>>>>> #endif
>>>>>
>>>>> This also solves this issue, which looks more straightforward. no need
>>>>> .targets magic for CPU.
>>>>> Anyway, maybe the best way is to merge "x86_64-cpu" and "i386-cpu"
>>>>> into a single cpu type and
>>>>> add .targets magic? When I am trying to get x86 works, faced this issue
>>>>>
>>>>
>>>> This solves including i386 or x86_64, but not including both at the same
>>>> time. Same goes for arm vs aarch64.
>>>>
>>>> You can take a look at git history in target/arm, to see which kind of
>>>> changes we did to make arm and aarch64 targets linkable. You'll notice
>>>> most of the work was to remove (a lot of) #ifdef TARGET_X.
>>>
>>> See it
>>> SHA-1: ec7e5a90fea996f04ea24e81b680a87bc975354a
>>> * target/arm: Remove TYPE_AARCH64_CPU
>>>
>>> So I am just doing just the reverse direction, I am fixes x86_64 in a way that
>>> register both "x86_64-cpu" "i386-cpu" variants, though this way seems
>>> more suitable
>>> for your heterogeneous emulation, but we need to register
>>> everything(CPUs) twice.
>>
>> We'll have to register this twice anyway for heterogeneous, I don't see
>> any other solution to have both accessible at the same time. That said,
> 
> I am not sure what heterogeneous would be, currently max_v8_tcg_initfn
> is called for
> both target_aarch64/target_arm, and call
> aarch64_max_v8_tcg_initfn/aarch32_max_v8_tcg_initfn
> depends on   if (target_aarch64()); so basically, when call to
> max_v8_tcg_initfn, the target
> is selected even under heterogeneous mode. would under heterogeneous
> mode, target_info() is a
> thread local data, if that's true, I think the current PATCH is
> enough, we do not need two different
> QOM-type-name for CPU .name = "max-v8",
>

initfn is called through arm_cpu_instance_init from main QEMU thread,
not from vcpu, thus why I insist to have two distinct types.

>> we are not yet there, and current patch solves the actual problem of
>> having QOM types registered twice.
>>
>> I'll let Peter say what he thinks about this.
>>
>> Regards,
>> Pierrick
> 
> 
> 


