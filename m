Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FECC88E67
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 05:09:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5yw9-00043X-I3; Mon, 14 Sep 2026 01:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5yw7-00042y-Oh
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:08:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x5yw5-0006yc-KA
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 01:08:59 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68E2eeoQ2241369
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eqx/Dht1kMk/GRmxxFFaPIxXv4bb0Cu53SbluSlFpmE=; b=g5T32FXcVgkpSXzP
 EJSqVHVK8iN2taGKIc7EwJNVgLDp/BpB0GPMQm97k3fRlgeJ1bCvWda9vm7Z4t+B
 wrDQFs593mXp86xvNedWOXXnWgEFSsfMzhR1u74Tu7AtFsspeFTldieVqBf16VeK
 8LHT3bs2ztKtChSl5rYvMHxMcUUUSbEwd17vhKI7aRKBTZ7yJ375jox6MV+OoqWO
 MJD6QX0ikCuU4u/zS7yGqKeuZNlkgpnZQPX20n6hcFeUeDSNuUjSWuE0d1GS5uxe
 l1CEBOpvD6wmaW42qeEbj2BQSZMhm5NjNSU7El5QXonxV8CoWWskcBpav4IwoZ8d
 yYooeQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh4yep-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:08:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8679cfe5019so4600421b3a.0
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2026 22:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789362535; x=1789967335; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eqx/Dht1kMk/GRmxxFFaPIxXv4bb0Cu53SbluSlFpmE=;
 b=Kmt/7STxyXDhOZk0BCAfSRpEIHnGqQBuzizmjM/GFl/R/AQm4Lm9qmVRR5JUMlUpw4
 Jzirv1s7z+SKQRPJMWXG/81LbyJIGaxb6ueQsIPKZkuDK2t7JfCF6zQmGq6t3N7jMKc6
 HmgMN1XOseq8IZsDgpI3XJcRS6LEzXrPjYVyeMZRwlOgGh4MLPk6vxkDByey/c8hwDqp
 PvSQQxWsro2fbq53rjJTBJaCm09cNgv74OYR6d9NchmxRMJf89cWnymilgbsm4Y+t0GK
 OGWLmTJKmPcfvE0NtDZ2E71r6klmwzmwXpczD4pqbgSUtJYVAjw3vlSMRnyrVR3dHm0A
 lLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789362535; x=1789967335;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eqx/Dht1kMk/GRmxxFFaPIxXv4bb0Cu53SbluSlFpmE=;
 b=XBlPTmniDdw5vNf+03sLivxKVfDmYI2rhDCSg/Rf4tZk3xKFqlJs5qT5fmZ+M6FQ1K
 Hx8afPxq/9KPYI8uHYQnxeSVz57EElDCeZPi3Hhhrdgo6FjTAsRJxrSLH4rmWc9kWE9R
 AzW15ClokuFWrKdQS5kN3F0uHuDZIwAUR27hED3x4DhPmged8ATFnZS2YWi8Ng3EhsXh
 NWQTwc/+UXQklCPeTV/7BZ46I6s8DDam12aqhd5zqouEzKXP7QCATzL+NQzhOznKg+Ry
 DVt71ufqzB2Z0zYbSfH+9W+L57mqirM8wUoyI2+QXkqIx8bKRhL7DCNb+94pCT+PS4MW
 B8dA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxwfVChMQduUcm8Ah8gmNn/dqek3yhUXWS88m3XEQu7EqoXudwH2HbiQJH/cBjts92ENkmTVn2AvA==@nongnu.org
X-Gm-Message-State: AFuF++kyYB2rZZ0cUvmZev11hwKha0x7g8bNVS4YLZSNv8D//t7yclwO
 Zbn5PmszRVIzUh+Ao9wwNRMRrvsMvkCpil8XHCfUL4j39wcVO7kOiwByFnDxucT09f556CDIf2f
 AL6Z/2NfvbRR2fx8ItDnoCHpUA5b8R8+gsyV1G/i+WiXe8XKiP6IvIR0=
X-Gm-Gg: AYBFou118Mog6ywTfekoyCLM8aEJc+qR3usQzN2hiE44qnwKxALriwjdst16nnqx+UU
 XcnUuaalOuFmp8jy0Z/AOY8lcENITEoE2cHWM3wrxY2NnORksPIc44j7asdbG1FeiZTmlnoIffn
 vzkYPQ8+vwp5a9MQkzggNAccCxI4SrIfN9wutMBLUBbYoB0lDdBKhEIMt7zjKOT8BK0yVMLhAFF
 1GMoFgWfNDArsJImTQxjLWsbxC0QD0KUb74b3lgZRloZ2NSFhKYV1Q4jM6nH3Io8OKSRz0PUBJp
 UGdlEWMYqiC9NEsnEA4o1U2apFJHh/ZPvkSwKsX3NclOB7W/b2qtj6bwU7GGbpPaq23hW9BY0Du
 uNGJSu1pYIXajg4vEY2LnMtrBz+AukG58Z4mmDiJz5G1H7GRZGJV2OZQ=
X-Received: by 2002:a05:6a00:f08:b0:86d:7462:414a with SMTP id
 d2e1a72fcca58-86f8363e5dcmr2293209b3a.7.1789362534617; 
 Sun, 13 Sep 2026 22:08:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:f08:b0:86d:7462:414a with SMTP id
 d2e1a72fcca58-86f8363e5dcmr2293147b3a.7.1789362534068; 
 Sun, 13 Sep 2026 22:08:54 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-86b287c481asm4161517b3a.11.2026.09.13.22.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 22:08:53 -0700 (PDT)
Message-ID: <22dca41b-3833-45d2-912f-b05a77d7d883@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 22:08:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] tests/tcg: improve check for working cross compilers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Brian Cain <brian.cain@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
 <20260910181504.1010916-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260910181504.1010916-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EnzWWJH7S-0ouqZVpz8Pnyk3RsQo_t3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA2OSBTYWx0ZWRfX1Xm3cwLYQAmB
 sOWauSera0e7K5n5OfUeL1j4otPLWuvQUae7xCN+kQKQeNfbdWj/RYZw+uHNFiknEoVyNEqJmcK
 esyA2M3Gqp9haiYhXURWOcy7m3JZDiEH7vWx2j3Aa0ew7X9mw9fszBl3eaZJcKiVNnyByjmwHK3
 7fsuw50gWg4IbTxrLFABqwQAKOBt3suDKB5MqQY8LntKBdBtjmyUQFlVfcqby0piSaljDLxNupj
 dAjqj2xZlthDzdMVHIU7wyk36gmirDxpj0hP/ZW5/Hx7WdzE/TawQesuxaCND0Nzgnn7F+ylxLc
 +qnNwFCyXNAW+a5WRGW9gKkUzQ4vnYNzPHWqX5xkMEgNOOZEAXNK7okVczUQ1gN+rjt4tQO/Lzy
 38zXWBILTBgs2UneQ1oWLyj83ufmQYnO9SBRhD4IZjXGk3qSGeMMHGGNTIP63ZWLGjPgHY73x11
 XLbl1IU5xlANmyf3m/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA2OSBTYWx0ZWRfX4QMZ/5NmNg2n
 QnOReidSS8g79BatwIn4ttqyOig9oCjOLbMXw4ltYb+pDVQ8LHWwXUgpyMZGEiL5SfMnIyVv29N
 ReI28dHGBAokODHdb6AJn9gQ19ecsX8=
X-Proofpoint-ORIG-GUID: EnzWWJH7S-0ouqZVpz8Pnyk3RsQo_t3J
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa78167 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=b4LDLZbEAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VVfi4J3LwHLQ0HaSlDcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=20T61YgZp4ItGotXEy2O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140069
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 9/10/26 11:14 AM, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> When it finds a cross compiler, tests/tcg/meson.build tries
> building test_cc.c to validate that the compiler works. This
> includes "stdint.h" as a witness for working C library, however,
> that is not a good choice as it can be provided by the toolchain
> alone:
> 
>    $ rpm -ql gcc-s390x-linux-gnu  | grep /stdint.h
>    /usr/lib/gcc/s390x-linux-gnu/16/include/stdint.h
> 
> As a result, if you install the s390x GCC cross compiler, but
> not any C library, meson decides to use the host compiler instead
> of the container:
> 
>      cc for aarch64-softmmu          : aarch64-linux-gnu-gcc (from 'debian-all-test-cross' container)
>      cc for loongarch64-softmmu      : loongarch64-unknown-linux-gnu-gcc (from 'debian-loongarch-cross' container)
>      cc for riscv64-softmmu          : riscv64-linux-gnu-gcc (from 'debian-all-test-cross' container)
>      cc for s390x-softmmu            : s390x-linux-gnu-gcc
>      cc for x86_64-softmmu           : x86_64-linux-gnu-gcc (from 'debian-amd64-cross' container)
> 
> Eventually this results in failure to run 'make check':
> 
> [33/40] Generating tests/tcg/s390x-softmmu-hello with a custom command
> FAILED: [code=1] tests/tcg/s390x-softmmu-hello.test
> /usr/bin/s390x-linux-gnu-gcc /home/berrange/src/virt/qemu/tests/tcg/multiarch/system/hello.c -o tests/tcg/s390x-softmmu-hello.test -static -MMD -MF tests/tcg/s390x-softmmu-hello.d -Wall -Werror -O0 -g -fno-strict-aliasing -nostdlib -ffreestanding -Wa,--noexecstack -I /home/berrange/src/virt/qemu/tests/tcg/s390x/system/../../minilib /home/berrange/src/virt/qemu/tests/tcg/s390x/system/../../minilib/printf.c -I /home/berrange/src/virt/qemu/include/hw/s390x/ipl -march=z13 ../tests/tcg/s390x/system/../head64.S ../tests/tcg/s390x/system/../console.c
> In file included from ../tests/tcg/s390x/system/../console.c:8:
> ../tests/tcg/s390x/system/../../../../pc-bios/s390-ccw/sclp.c:11:10: fatal error: string.h: No such file or directory
>     11 | #include <string.h>
>        |          ^~~~~~~~~~
> compilation terminated.
> 
> Adding more include files to the test program ensures the
> meson probe makes a better decision.
> 
> Fixes: e5d084d622b1 (tests/tcg/meson.build: check host cross cc is working)
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-ID: <20260910100120.2076092-1-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/test_cc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/test_cc.c b/tests/tcg/test_cc.c
> index d3614a01fe6..fafee055b40 100644
> --- a/tests/tcg/test_cc.c
> +++ b/tests/tcg/test_cc.c
> @@ -1,7 +1,11 @@
>   /* SPDX-License-Identifier: GPL-2.0-or-later */
>   
> -/* Include a standard header to make sure cross compiler provides them */
> +/* Use some standard headers to ensure the cross compiler provides them */
>   #include <stdint.h>
> +#include <string.h>
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdio.h>
>   
>   int main(void)
>   {

Ideally, we should do separate tests for system vs user tests.
System ones are always compiled with -ffreestanding, while user ones 
should provide a C library.

 From this standard:

https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2023/p2338r3.html
```
A freestanding C implementation is required to provide the entirety of 
the following headers:

<float.h>
<iso646.h>
<limits.h>
<stdalign.h>
<stdarg.h>
<stdbool.h>
<stddef.h>
<stdint.h>
<stdnoreturn.h>
Most of <string.h> is required (strdup, strndup, strcoll, strxfrm, and 
strerror are excluded). This includes strtok, which requires global data.
```

Maybe for now we can just remove stdio.h from current patch, as it's not 
supposed to be provided in a freestanding environment.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

