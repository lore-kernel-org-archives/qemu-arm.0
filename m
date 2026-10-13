Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A614CC6B12
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 21:07:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGjis-0005ur-74; Tue, 13 Oct 2026 17:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xGjiq-0005ua-SG
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 17:07:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xGjip-0000vK-4o
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 17:07:44 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69DHuo6n1125102
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 21:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wqvy1nywRohK4pi+lrJ1Dfzw+rmrFH298X85Fji1jH8=; b=dw0sq7T8SHOA2WRO
 vqfXOypic824DxSqQQlQvSfasaiP6+tDxjZmBPsKhW4Jycr79dTfOR83MhTQ6B/A
 tXwMASf3DgFW5tmoupPrbSLASRkiJmjqWJ3TVGPSaQRGkdjeaGoIlJ1bCjM3qmlM
 vXG4sAYlKlXYYDjr5YyR6e7YRQaonMtq9IgfQh4CKr5i+4y1YijJ5kxASDvecrgE
 zbeZ+YkdLZ4B5axCM/Ha4lLW/uU2d+8blyY2yBv3nEA8/IxolUTxBtFTpVOgzzrj
 a3fDj2skzowdA7+oW7m6mZPg/vBxfFL2yEFM3CyGd3ogwfP5d4Fg9DnPGtLzBPC7
 8hlujQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg80tam-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 21:07:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2df375fb9b2so40943605ad.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 14:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791925660; x=1792530460; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wqvy1nywRohK4pi+lrJ1Dfzw+rmrFH298X85Fji1jH8=;
 b=HR4/A1SWT1z1IlzakQNuuMruKTM/28PxMdZAo/ZDvzwGgc5G9d84NeiLR4EQ7lhqgf
 UN6YWcxThkgyDfg9Umrp3zGwnM5flgp58mxnlp70aSOech2G84FuYNwjTMMqRU/MEbHR
 +U58PSnvjShlPazYHun7hof50z949XitmmOcdShHultkIom0JvaZhww8WGgJnpokt/lU
 846sbyiBMbw9rmTMjwwZv6V3zq48wHVpZl09KWs3dDGAlg2qdqr5Pltrlv8u49KdMzeO
 8FRlCnIVxt4/aQ1xBEt/44LKfo7bJ/5aheDgGZS2XHuCFsSnYN4W4P3PsXZKy6IIvlcL
 wywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791925660; x=1792530460;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wqvy1nywRohK4pi+lrJ1Dfzw+rmrFH298X85Fji1jH8=;
 b=INQmvR0g7WwV8Bss1opzsBRm5FYEss4Eau/SiuBoBjTlPXDhiz5zRuipwINzdg5l3D
 wJOwVVwX/73QAHCH7GXC/EGEsy/HilgOAPgPa+NDCNp1FkM9e+3qFos5ZDJEx6tKarzd
 n73++6B2lUSQ2VbMQfgGac4y7hzZCXI4coXZ66+LHGrn81jNtgZYFhqvXXMjiKaZWDuw
 DrLUspBmTdgJXonxkPNN1WBcnW7IQ5rAFqi9a8sDNGlopTKk+esPRnodH+FdjMotSPo9
 zNWsCSHivuS/lEYJjwqZU5mT+0Krj6KDAZRftb70E9QmerKHuCqJDy9zvFzp3tdlI57I
 1DQw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwkjp6soQXLESjsD7cCsVkp7dvNfGs6W3zZwgGgDN/44ZTZbgu3KYLSGjHzipB2flkzC8lsuarBlA==@nongnu.org
X-Gm-Message-State: AFq9FYIePk7GbtMeTW+WJ01b2jJwoc9e7TTZ5RC2VsaGnNTd3UMenyg6
 b0or7M1Wb6r4AEvP5YtsWvdSu31Js8r0K0nUGthVVejG+/FjWz9RBI7liaZG4SpE6Mj3GtenbIE
 wSN/4U7jRwY1OAP/4cSpWqlaT8dc0JfIZCynbQxHu9/IIoX1ORxkRMpk=
X-Gm-Gg: AYBFou3kSWoAVYjTnVdl05xhH5o4QhP+9fasKOxOK8PeHiUGnrsiMypEQO2BvENBjbN
 81uUXsNdRxS5KFUxdSqDdCfcp7LZRqI+W1pg3yfqLNPhE8BBki68X3nQSXw1UxYxTzqHyGxr84M
 pEGUY+b8qWjqlSJIUKHVcYkzF6nPihaunACyTuU0RUhu0K3eD1J+6HabIcgVtnqZMXiKlYQ9kjF
 NOdGxzXL5mPzVPRb33zFKx0b2Fu1PU1fqxVRERs0e4d2g3BPAwPVRTyraDpQclJXwLWkjHTXC30
 mGMSDHYFaaXtXpOlS/aD8KZ7e7y9IWtIOSi2tIJA7W/1PjQsSazQTKHKAUdiOAFehOPKnA6lGys
 QHxUZO+6wZeuEYm0iF+57xnk3itdZASaM9VM4nRV1D4RzAt0NJeo+bI5f
X-Received: by 2002:a17:902:d60f:b0:2df:ab73:7e94 with SMTP id
 d9443c01a7336-2e842df9ca7mr103995965ad.51.1791925659925; 
 Tue, 13 Oct 2026 14:07:39 -0700 (PDT)
X-Received: by 2002:a17:902:d60f:b0:2df:ab73:7e94 with SMTP id
 d9443c01a7336-2e842df9ca7mr103995165ad.51.1791925657398; 
 Tue, 13 Oct 2026 14:07:37 -0700 (PDT)
Received: from [192.168.1.169] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e8422e2511sm60523905ad.76.2026.10.13.14.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 14:07:36 -0700 (PDT)
Message-ID: <baf81ba3-f29f-48f0-a9a2-6dc4f005d433@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:07:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: defer max-v8 initializer selection until CPU
 creation
Content-Language: en-US
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20261013195606.152-1-luoyonggang@gmail.com>
 <f3649d73-1edf-440a-9534-7b00da4d075d@oss.qualcomm.com>
 <CAE2XoE828e76zdCEkYVcbjRwhcsaSYZF1_UE4akeaoCTqCK3zg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <CAE2XoE828e76zdCEkYVcbjRwhcsaSYZF1_UE4akeaoCTqCK3zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5S3cZ8D-4NFsx1LaJWrIREmNqEnUrWRb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA4NCBTYWx0ZWRfX9p1NEy/fpVyX
 4GMaI3gwoYmdVdaAmlxBoAhPGn2iNTBRO7FvCg2B9lbYqAAG6tU7E7zbKf82i0TIXNHWF1JuY4T
 YnC9lIXOJwSi9l+9X9iw6xgG+tMDy+o=
X-Proofpoint-ORIG-GUID: 5S3cZ8D-4NFsx1LaJWrIREmNqEnUrWRb
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6ace9d9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=P0FvnAp1Z_lmyk0pHs0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA4NCBTYWx0ZWRfXwzcV65kBZlmz
 i+H37FnAoUwkjQNdefRxYDALls8+BlzQ2av7Q690jk7gKHTFBFyOAolvuIqXCvBlVVn6A3a2bVi
 lQruXVbg0LkD0cVEnLseqStO+YQPfiOtfAT+hIKw8/0cLsY/hDgZ/RckTXCHmbekvZtUDFMaCkG
 yGauttImJizpmOKDy5JoFuu0jKsHxQewZ1GaxJUXLrHTCZK8JjVjAEeoUyFEESNdmosIT/Pr1XW
 HnKJcOndfVVbeYDG3lDE6CAeTBt54G1aKICb5BvgROxoxmsDRRZC/Da2rSNaZlfz/RSzmq2R77G
 l8SO9+AFLF8lg7KAKLfO+7/iTlZmxlTXEGomDIJmC+RRrDyIgu4LsmWxpYY/FuviWNy7uVPVqRk
 dm528I7wr+wg6Mgs1mfbIrjFblmVjuElzzPGUX2U1hz/saKK0LnoaGwjQfIxGlNxOBTBK5Aq/A6
 AEKzCwu071VAqBHngzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130084
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 10/13/26 1:19 PM, Yonggang Luo wrote:
> On Wed, Oct 14, 2026 at 4:08 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/13/2026 12:56 PM, Yonggang Luo wrote:
>>> This is for avoid "max-v8" qom name conflict in multi-target qemu
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> ---
>>>   target/arm/tcg/cpu-max-v8.c | 17 +++++++++++++----
>>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
>>> index 65f851f2006..d7323ab431c 100644
>>> --- a/target/arm/tcg/cpu-max-v8.c
>>> +++ b/target/arm/tcg/cpu-max-v8.c
>>> @@ -119,12 +119,21 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
>>>   #endif
>>>   }
>>>
>>> +static void max_v8_tcg_initfn(Object *obj)
>>> +{
>>> +    if (target_aarch64()) {
>>> +        aarch64_max_v8_tcg_initfn(obj);
>>> +    } else {
>>> +        aarch32_max_v8_tcg_initfn(obj);
>>> +    }
>>> +}
>>> +
>>>   static void cpu_max_v8_register_type(void)
>>>   {
>>> -    static const ARMCPUInfo max_v8[2] = {
>>> -        { .name = "max-v8", .initfn = aarch32_max_v8_tcg_initfn },
>>> -        { .name = "max-v8", .initfn = aarch64_max_v8_tcg_initfn },
>>> +    static const ARMCPUInfo max_v8 = {
>>> +        .name = "max-v8",
>>> +        .initfn = max_v8_tcg_initfn,
>>>       };
>>> -    arm_cpu_register(&max_v8[target_aarch64()]);
>>> +    arm_cpu_register(&max_v8);
>>>   }
>>>   type_init(cpu_max_v8_register_type)
>>
>> It works for the current need, but will require further changes for
>> heterogeneous emulation. A more versatile solution could be:
>>
>> arm_cpu_register(&aarch32_max_v8, target_arm);
>> arm_cpu_register(&aarch64_max_v8, target_aarch64);
> 
> And another way to handle it is like x86. it's comes with two variant for
> 
> #ifdef TARGET_X86_64
> #define TYPE_X86_CPU "x86_64-cpu"
> #else
> #define TYPE_X86_CPU "i386-cpu"
> #endif
> 
> This also solves this issue, which looks more straightforward. no need
> .targets magic for CPU.
> Anyway, maybe the best way is to merge "x86_64-cpu" and "i386-cpu"
> into a single cpu type and
> add .targets magic? When I am trying to get x86 works, faced this issue
>

This solves including i386 or x86_64, but not including both at the same 
time. Same goes for arm vs aarch64.

You can take a look at git history in target/arm, to see which kind of 
changes we did to make arm and aarch64 targets linkable. You'll notice 
most of the work was to remove (a lot of) #ifdef TARGET_X.

Regards,
Pierrick

