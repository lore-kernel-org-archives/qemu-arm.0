Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C72CD98CE
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 18:32:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXNil-0000ww-KJ; Wed, 10 Jun 2026 14:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXNij-0000vU-80
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:32:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXNih-0000Va-Cr
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:32:08 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65AFwiEo2142058
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 18:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zIGwmWeL8iRJJrHwbg3axlJZu6twmPBrRTM1hEbJsQo=; b=fjVB32/e5n4DQlHN
 HebEmTk7PLaRW86wlKaenvSebbkBy8u2c9yIJE9IIsxX8P5AzxGxMjsyjBKkhmew
 yotgkDmBqu375GfYsreM3/sSDYb0kKv81GRwsyYhorWN+f2FQinLoa5XLWYkJ8hd
 BN4+XFrx1IyZ5Uj3EFCkP7XY+lFCNEoFvttECMPnzf794paL6vVZ/i3ii+IaDY61
 EqHzEctkiqG0J1/S/AFpNfZHdG5etMk6JF3J09hefHkxN1aaLd1Z2UvnxQ3/QEgf
 unNolwRwZ45sYOZapajwMJptQwDUY0U2VSaPHGiUpELXQaEQArOYeaN/i9rkQALo
 c5i5AA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10abdpq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 18:32:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-3075fa5a407so12729462eec.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781116324; x=1781721124; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zIGwmWeL8iRJJrHwbg3axlJZu6twmPBrRTM1hEbJsQo=;
 b=YNpfiFHL9sN1LzGPCGG7Ddyyh6JZD/MO/LOOCaK373/QflGuvocyjuKjXJ6R1b4ZOf
 0YvWOj1x0cUNTFBe99HiLzLhdKw5kk2xxGg45Pp0alKOIMCW2f2c2UG/mGZ+ZibGqC+H
 tSVA2a+NFUTBqoSmKWE0AhA0q+ksnO3ePTWVVuN2AC2QMWjLSkxzmSPUCQlcjYlljm5T
 QbVtQDcBiEmRyBTwNdaScZg3i9qh6y4ANFHkMBjZk+Wn3bV8wJ1lKBtDsonZmmGjaWfa
 nn3G4eQxuQVXOi1rLNiM8ynmNaLvxmPKSMj32joXfJobAY4fPTm3JnswTB6hOyrTSaaS
 rPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781116324; x=1781721124;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zIGwmWeL8iRJJrHwbg3axlJZu6twmPBrRTM1hEbJsQo=;
 b=ovsNRcDUuNSgGBtEpgPkM9ti32LnFBNzrInLjkREIGaemFncTCsE3CR8MwV6spKMlL
 sHTWIjMwzyO2unJIJxCGGgLJ3MvAcuoGQ3JehnhhDoiiOKyQSsOObs4t7tPNsf1W48sM
 FPtmUD8/myw9M/SeqtMnMF/ESUaQJlwqruogmsUhkZXu/iHG+MH+E5/34yQn75aig3ME
 qhXStlM7kcqZimXbDYhiEMBEZdXta0CDbbwdYn+ZSPVxVGE+nL+cjtKC5juiS3E3kQlV
 YhpntQ6LC8u7Oiz1/xZnPjRTUtIEVafFWGlvHSVbEOqcuraC/SP3CiKzPt4FI+Xk8F9M
 GzFg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8mXKKpmzLKLVRz9qvh66IPS6QqeytPrOpjXWAi6VmSdAVR1E6auvEBy4KXNBl8xPws60nE3aQPkA==@nongnu.org
X-Gm-Message-State: AOJu0Yx1v734OUDdUTSF75mU06QFlDatNa0wZ4fCSQd9ySgK5lI2Wq3K
 MejQahBijx+JRCk5LjIkLhtPg5rnYOlSUpd2WA7I4uLNlzFItZJRmK2YRZG2Ck8xHrPsKEPlivL
 fcrmZLOicJCliBZjgFFj8OqcRRRlRL5ODYMjsYmVDCzZlH7YJAuzlHFQ=
X-Gm-Gg: Acq92OGyOHoldxDmeP05n8LQvpfBMSZkuM0XmaciO/bL1VS/2u4njjq8ZqbC4WOYLRo
 HF+Nk3dtAcVYmAPFAYrErfPWoP/Ixr0rofgNA4yEqvBD/Nky+PvzJxJ056uTZBeM2QsZY8Vf4pT
 fqR2s5G4RAouVlib6f2hYZz5ZJw6JOKWXcpn0zcUzrhPHpI7n4lorWkiUMoFKDpDvZuu65H+/kK
 0a/WNfkK1CO3H4yqDq4yeIEMSF+vWkRgh0Yyw2MkU34QrLdi6pkUZpWKGmwZ1u0iGT1Lr+fVW16
 q6Dbv0iRJ/OHXsa/+nQXtXXHIjj0aAJXCN4UwbE1Zsl8IibmFdMmAXK7LJyOVZjnVQjDR2A6YkX
 h5nKzpACG6czxv2pjM1zrtg9Ctdweed34cqiwErBo4vU+eectG2d67rW+mXRAgWnzXWN8O4lN+P
 z+GgB2pNzFzsN/Y2IsWYjP5j+v
X-Received: by 2002:a05:7300:7fa8:b0:304:e450:67e0 with SMTP id
 5a478bee46e88-3077b3c30famr18412586eec.10.1781116323944; 
 Wed, 10 Jun 2026 11:32:03 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa8:b0:304:e450:67e0 with SMTP id
 5a478bee46e88-3077b3c30famr18412556eec.10.1781116323349; 
 Wed, 10 Jun 2026 11:32:03 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074dea8708sm28287408eec.15.2026.06.10.11.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 11:32:02 -0700 (PDT)
Message-ID: <215e273a-1910-4788-ab68-a76734d9eefe@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:32:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/27] tests/tcg/meson.build: introduce exe_name
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud_=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn_=C3=A9_e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-6-pierrick.bouvier@oss.qualcomm.com>
 <tgemg6.297pm0qzw7mjt@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tgemg6.297pm0qzw7mjt@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a29ada5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=5yw_3auFD0dBBNfgJhAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XcpeZbX7oUdon_s_BwkLsR0EgguNhMIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE3NSBTYWx0ZWRfX1nF9PfsGeQvP
 MvyjfZWrzoX4HHnH98ss4ioGurS5OB+F9uxsc8dAiG8FNFk62OKGy+RxidMVeuwEKV+Z+YEp48k
 pcgLSHkkMT7AEDk9pecrrjndvoJCu9HT7v+XLiCu7CqjEnVQ1o5MzArWqdneOKCRKQv+DJGM30w
 mAZjraDUwBomOcaSv3erLf+QqjEkfugcbaAGSCAD67FT6QXP6BbxoGkbSPuEwEBk+KtKLWMxjM5
 ijalQwVGoEk1WF/UWt7j9PtoINyu2GAMZ6230b10T54QfoaWNHO+cwxJ01Eget9mwaF9iFIgmnx
 t42qjeZeSplpB1693lwUM+eglwjp/s94QOu112096sd0XTQLS+qWUAw7Ko7ht56cvz6KJ+amxl6
 OaLxCpMDUjAgO14u2SW5OpmIfPz8w/gxYllOdWHdppLSdGt5QA0gV0pUs/+LMIgjl5AHSIVwAW3
 zc/2VJSBarB529Lh5yw==
X-Proofpoint-GUID: XcpeZbX7oUdon_s_BwkLsR0EgguNhMIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100175
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 6/10/2026 12:03 AM, Manos Pitsidianakis wrote:
> On Wed, 10 Jun 2026 00:47, Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>> We add possibility to duplicate a test executable for a given source
>> file. This is needed when different cflags need to be used (like
>> vectorized vs non-vectorized for instance, like sve tests in aarch64).
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> ---
>> tests/tcg/meson.build | 17 +++++++++++++++--
>> 1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>> index 72d1a9f8986..2c6d85c586a 100644
>> --- a/tests/tcg/meson.build
>> +++ b/tests/tcg/meson.build
>> @@ -11,6 +11,7 @@ tcg_tests = {}
>> #     'tests': [
>> #       {
>> #         'src_file': {
>> +#           'exe_name': ['provide an alternative binary name'],
>> #         }
>> #       },
>> #       ...
>> @@ -18,10 +19,10 @@ tcg_tests = {}
>> #   }
>> # }
>> #
>> -# Every test executable, is built only once.
>> +# Every test executable, identified by 'exe_name' is built only once.
>> # Tests for a given src use the same executable by default, and their
>> definition
>> # is guaranteed to be unique also.
>> -# Default name is derived from src.
>> +# Default name is derived from src if 'exe_name' is omitted.
>>
>> # plugins come first, as we need to build the list
>> subdir('plugins')
>> @@ -47,11 +48,23 @@ foreach target, plan: tcg_tests
>>
>>   foreach t : tests
>>     foreach src, setup: t
>> +      # return a clear error if user mispell a setup entry
> 
> Minor typo:
> 
>  If user misspells*
>

Thanks for the english fix, I'll check other places also.

> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> 
>> +      foreach key, _ : setup
>> +        if key not in [
>> +                       'exe_name',
>> +                       ]
>> +          error('unknown tcg setup entry \'' + key + '\' for test ' +
>> src)
>> +        endif
>> +      endforeach
>> +
>>       # meson '/' operator drops left operand if right is an absolute
>> path
>>       src = folder / src
>>       file = files(src)
>>       test = fs.name(file)
>>       exe_name = fs.stem(src)
>> +      if 'exe_name' in setup
>> +        exe_name = setup['exe_name']
>> +      endif
>>
>>       exe_name = target + '-' + exe_name
>>       test_name = exe_name
>> -- 
>> 2.43.0
>>


