Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A47CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 17:15:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRvN5-0001lb-Iu; Tue, 26 May 2026 13:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wRvN3-0001hQ-Df
 for qemu-arm@nongnu.org; Tue, 26 May 2026 13:15:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wRvMz-0005vR-D1
 for qemu-arm@nongnu.org; Tue, 26 May 2026 13:15:12 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QH125C3289845
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 17:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 txzeJsAbqhv4SG8XqUKA1wyG1yCph9W+jG9CQ3mf61E=; b=VVNd2USJFAd6xFEh
 Pslc+qZTTIPrvqKnhZXgVr9dVHmHY6V3onBy35pnCbmybAKjzkpAKuMk15B143Wd
 n1KJxSwafHkZVBf/FQiVv4XouT9P3FjtOQNmOyJ8x41nHxKVPeQuhjtD4sIGQhwm
 UdVEzjgdrjyEnTOJzaUgia/CnwaYA05dMSJSTEbiZu6BSfrOx6SKbIC2fvBj+Ih8
 SW7GppJR9k6puuN53w4qxXQH0v59aW+dDL73u4KSMEEsJnGHih6hqXp1+ItqaU61
 7HHF/CUWqoKFLCqCAQGM7BxdgMkYa+YST3h3KaaKWLbcj0AY21zHd8ZeZUlSY8tJ
 1eoGSA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j86xc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 17:15:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1370417c0bfso926781c88.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 10:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779815704; x=1780420504; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=txzeJsAbqhv4SG8XqUKA1wyG1yCph9W+jG9CQ3mf61E=;
 b=iKGE5fN0eczejHXT5zo8zHB73k5ExvrweMYQ9wgJpIppsVKaQiZ6emy2Lk9i0kolWA
 vgr9CxJQgTYZP4LF40Fa7b8Yw5a2kZzDsc4TIvqgTG8iVFhByGWj/ddqO3cwrLxs5dDE
 1E3N5m33mmudlTY/usihq04RylZS6OHO8e77/maKZxmJK8Y9WTW3sxafzrJqNVgqSzX8
 FuaeR93E6zJTFCCRYuFMdSzYKYesnxOSSjxRQOAruCGrq5vjqQRri1KSiiN0M2l2GxrX
 ZIx0gi8s3j41k9jcUI7xXTD5BcKfluBJ/LwvwwZ4SnGjvfebL4RgF0YTLGB4PxkT9F8q
 H3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779815704; x=1780420504;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=txzeJsAbqhv4SG8XqUKA1wyG1yCph9W+jG9CQ3mf61E=;
 b=leGvfk4xUAaEWDI1XNL7Pr+SDvcP/HkTe6ZI2dmlrj9/hszCfDmyq9sWtTpxGSwpXh
 xCXoxnB/CPFwx/5MufY8oSXe0W1DKPRBEyt7ogDc/Lg4PjhBt+AyJrZtBXpOqt5b/lkt
 zDRrYdS5cKjO72LqQMx3CilqSam08GdnSXsYvMouQ+7Him3jYb4EDWp31qO9MVNMR5WD
 fa5azGTdfASAQ0bg/2LzyGIuE649GUJ7JwfRLmOesHmqXMweyuuL8jmifazdlq1kNhBE
 PRzFRYmbYF+XwzMxPu4DevKQjbDuJ2t6c11pPP1QkYt4nSb1nC/9YvIbT1G5XQECYZ1y
 R2OA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uOI41r3UWq4Fezl0YOhtDGqg53OvLgvEndaa22rVQnFN8ZMP1eO2rpZUVAth3UbtGvQkM5NZATA==@nongnu.org
X-Gm-Message-State: AOJu0YzCa1cH/Z33WDGJgdav9OFUOk8DPGNosq89BLategRL2oLk84k3
 NyCRzF0QF4Few0fKjdDVANXupWSE4gPgbLzPRWJxiGJnhdegyDVUcWy7Rg0dRfc1zN+Py6wqZ2r
 lJ1SCjoF9i1YLtlqjnKKxVkxS5N5JBwfhKYyB6h0SFVdEIjGtv8VBq9s=
X-Gm-Gg: Acq92OE376VqLh5qb1tFNibygdr+ULQqHTjH3E8jo6wzMA4BcczP8x/F6q3pkuKaSz9
 ZOh/z3GDB2IKslXbj/tmS1wR5voWVt9Wa4pBdliVN8JdaMm7AIHWuDTOZJ+t/Z+53JoR7TFkvua
 6BDGOaS7UUfFf2WtkAVX+7qgt0W2sE1H6pxEDyeHTZCRxy1VXg1gjMiY3NfQj1aWtGSeMAFDh86
 zJn3NzFCV2jdTa1m6wL5Ja+h7OEAE4PoS44ccxKwbL+ouQGiS9kJrMJwwsUV/zWvF6nP6D90aEh
 gFLe1XBxTc6C/SlnOClrD2q6JisXNkxcyjsAdNZnjGqSTqWJ3319yuwO65PDN3lilemqRKcgYxX
 RKN13VN2fV8nL80LWzcAzSFSInoJrA+2Ybs2ItE0pZ3pHffKWRG0P211zCGtXZiNci6ubB6HirG
 2mZsTheQ6Wzif3qA==
X-Received: by 2002:a05:7022:3d12:b0:135:3983:2131 with SMTP id
 a92af1059eb24-136341c8b21mr7812224c88.21.1779815703389; 
 Tue, 26 May 2026 10:15:03 -0700 (PDT)
X-Received: by 2002:a05:7022:3d12:b0:135:3983:2131 with SMTP id
 a92af1059eb24-136341c8b21mr7812192c88.21.1779815702639; 
 Tue, 26 May 2026 10:15:02 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1366a40187fsm10207358c88.5.2026.05.26.10.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 10:15:02 -0700 (PDT)
Message-ID: <06092208-1b56-4fea-8d92-bf035fbd0fa3@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:15:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] tests/Makefile.include: add binary dependency to
 run-tcg-tests-% rules
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-4-alex.bennee@linaro.org>
 <74e8bc86-cd81-43f9-b5cb-7e3de3bcd3d0@oss.qualcomm.com>
 <87tsrzl138.fsf@draig.linaro.org>
 <093614fb-ced1-4b15-b1e1-5da755f87237@oss.qualcomm.com>
 <87cxymec7b.fsf@draig.linaro.org>
 <5bd51a1a-4079-4073-bbd8-f0206a1ad458@oss.qualcomm.com>
 <0f73d717-1621-4c3f-9c5e-9bfdfaffb0b8@oss.qualcomm.com>
 <877bor9vor.fsf@draig.linaro.org>
 <7d58926d-a36d-430f-828e-7ebdd9cc4eb5@oss.qualcomm.com>
 <87qzmyzbut.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87qzmyzbut.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15d518 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ukH1R-b_AAAA:8 a=EUspDBNiAAAA:8 a=sKbWFtAyOCi-Y_NliJUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=zUGFzhdS3I8ccRoxxLmr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX6MNJTWv+a5R2
 BCQiIN0czv5rypHOdcuBZG9k3rdNuabRJ9tp8bhr+1p/m6iDBdGz1aPD+Fnm4K4fBs48HDbVYNN
 jgy+T++7/pEjnFxW2E7f3tjYq6WRGg7NpoQs+J03rV+BUIoCBc3hsM8Av8mnHXQEGnaj6xAgpg8
 VUtKX2vfAPQgZBlC8rqMtFLAcyG2JfOYxhN8a5O2VW6J7Ou1VqurNIdExI6UL2iPvJTYa3oM95Y
 ItPsRj/s5AglNx/vIiZ+XyGihYcSrJiTS0aN9DTvuhq7l5+dWrDlwzzlwEg8qP2nHOBS8d7Xyec
 1YGgBB/Q4WJPmDcrvl91CHZqY29GSPG2T+N/kY7aWEweDB+y85cYx0NJQeO0MC+PdR9QlKrYpox
 4BJQS/ZOfN3Lb5zuSVQC6c0oQnQMFY3Sy4ujkQLfx+45eAmAiIwqz9RrsAr9odP2FhwlMdvAI0H
 XSkH0IkZ3vGLrZ9kwug==
X-Proofpoint-ORIG-GUID: 2hh2Te90VJeLt-Dve4vcHyLQnOqGEdIr
X-Proofpoint-GUID: 2hh2Te90VJeLt-Dve4vcHyLQnOqGEdIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149
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

On 5/26/2026 3:47 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 5/25/2026 11:43 AM, Alex Bennée wrote:
>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>
>>>> On 5/25/2026 8:46 AM, Pierrick Bouvier wrote:
>>>>> On 5/23/2026 1:56 AM, Alex Bennée wrote:
>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>
>>>>>>> On 5/22/2026 12:02 PM, Alex Bennée wrote:
>>>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>>>
>>>>>>>>> On 5/21/2026 6:17 AM, Alex Bennée wrote:
>>>>>>>>>> Explicitly set the appropriate QEMU binary as a dependency so we can
>>>>>>>>>> ensure they get built. This is especially important for MacOS which
>>>>>>>>>> otherwise only builds the unsigned binaries on a normal "make all"
>>>>>>>>>> run.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I'm not sure to see why it matters. tcg-tests don't make use of hvf, so
>>>>>>>>> unsigned binaries are plenty for it.
>>>>>>>>>
>>>>>>>>> Which other binary is this building that is not built by default?
>>>>>>>>>
>>>>>>>>> In general, if something is not included in "all" target, let's make
>>>>>>>>> sure it's included there (meson.build?) instead of adding a workaround
>>>>>>>>> here. Not only tests benefit this, but anyone doing a build on a
>>>>>>>>> platform that might have optional binaries not built by default.
>>>>>>>>
>>>>>>>> If you have a suggestion on how to make that work I'm all ears.
>>>>>>>>
>>>>>>>
>>>>>>> I would be happy to help, but I don't understand what the goal is. I
>>>>>>> have three questions that should help to provide a suggestion.
>>>>>>>
>>>>>>> Which exact test command do you run?
>>>>>>
>>>>>> make check-tcg
>>>>>>
>>>>>>>
>>>>>>> ```
>>>>>>> Explicitly set the appropriate QEMU binary as a dependency so we can
>>>>>>> ensure they get built.
>>>>>>> ```
>>>>>>> Aren't they built by all?
>>>>>>
>>>>>> Apparently not.
>>>>>>
>>>>>>> It seems to be a dependency, at least for check-tcg:
>>>>>>> .ninja-goals.check-tcg = all test-plugins
>>>>>>>
>>>>>>> ```
>>>>>>> This is especially important for MacOS which otherwise only builds the
>>>>>>> unsigned binaries on a normal "make all" run.
>>>>>>> ```
>>>>>>> Why do you need signed binaries for testing on MacOS (hvf?)?
>>>>>>
>>>>>> In a previous iteration I made configure spit out the unsigned binaries
>>>>>> to config-target.mak but the request was to fix the dependencies
>>>>>> instead.
>>>>>>
>>>>>> It all works on Linux so I'm not sure why MacOS is being so weird
>>>>>> because the meson emulators target mechanism should be the same.
>>>>>>
>>>>>
>>>>> Just tried now, and it does not work on Linux neither (make check-tcg
>>>>> does not build any target beyond tests). Maybe you forgot to clean your
>>>>> folder?
>>>>>
>>>>
>>>> The root issue is that tests/Makefile.include is included *after*
>>>> evaluation of ninja-targets in main Makefile. Thus,
>>>> .ninja-goals.check-tcg is ignored.
>>>
>>> So this replaces patch 1/16 - I think we have a circular dependency here.
>>>
>>
>> Indeed, I didn't notice the duplication. While it solves things under
>> Linux, it doesn't trigger any build on MacOS, which is what you observed
>> also. I wonder if it's a gmake vs whatever-make difference.
>>
>> Another solution that seems ok on both platforms is to use (harmful)
>> recursive make:
>>
>>  .PHONY: check-tcg
>> -.ninja-goals.check-tcg = all test-plugins
>> -check-tcg: $(RUN_TCG_TARGET_RULES)
>> +check-tcg:
>> + $(MAKE) all test-plugins
>> + $(MAKE) $(RUN_TCG_TARGET_RULES)
>>
>>  .PHONY: clean-tcg
>>  clean-tcg: $(CLEAN_TCG_TARGET_RULES)
>>
>> Or maybe just leave it as it is? Doc already mentions build should be
>> done before running any test to avoid missing binaries.
>> Hopefully we'll completely move tcg tests to meson one day, so there is
>> no need to deal with make idiosyncrasy anymore.
> 
> The blocker for that to happen would be meson knowing about anything
> else than the host compiler and singular cross compiler.
>

Meson indeed supports a single compiler + cross compiler at a time.
However, you can directly generate cross binaries using a custom_target
or a generator object. This way, meson would generate programs without
having to know it's a C compiler. Since all files are single source,
it's not a problem, since we don't need to declare them.
Generators have the advantage of being less verbose (you declare only
once how to use them) than custom target when used several times.

https://mesonbuild.com/Reference-manual_functions_generator.html
https://mesonbuild.com/Generating-sources.html#using-generator

See a full working example below:
```
$ cat meson.build
project('cross_compile_tests', 'c')

cc_aarch64 = generator(
               find_program('aarch64-linux-gnu-gcc'),
               arguments: ['@INPUT@', '-o', '@OUTPUT@', '@EXTRA_ARGS@'],
               output: '@BASENAME@')

tests = [
  cc_aarch64.process('test.c'),
  cc_aarch64.process('test2.c', extra_args: '-lpthread')
]
# we need a target that actually uses tests
executable('test_aarch64', 'empty_main.c', tests)

$ mkdir -p build && cd build
$ meson && ninja -v
[1/4] /usr/bin/aarch64-linux-gnu-gcc ../test.c -o test_aarch64.p/test
[2/4] /usr/bin/aarch64-linux-gnu-gcc ../test2.c -o test_aarch64.p/test2
-lpthread
[3/4] ccache cc -Itest_aarch64.p -I. -I.. -fdiagnostics-color=always
-D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -O0 -g -MD -MQ
test_aarch64.p/empty_main.c.o -MF test_aarch64.p/empty_main.c.o.d -o
test_aarch64.p/empty_main.c.o -c ../empty_main.c
[4/4] cc  -o test_aarch64 test_aarch64.p/empty_main.c.o -Wl,--as-needed
-Wl,--no-undefined
$ file test_aarch64.p/test*
test_aarch64.p/test:  ELF 64-bit LSB pie executable, ARM aarch64,
version 1 (SYSV), dynamically linked, interpreter
/lib/ld-linux-aarch64.so.1,
BuildID[sha1]=8162b8f045880c75118958ad46be78ed75bb708d, for GNU/Linux
3.7.0, not stripped
test_aarch64.p/test2: ELF 64-bit LSB pie executable, ARM aarch64,
version 1 (SYSV), dynamically linked, interpreter
/lib/ld-linux-aarch64.so.1,
BuildID[sha1]=eed48625e02cd436a2708f94e5dd9ce6d5c162a9, for GNU/Linux
3.7.0, not stripped
```

We'll need to remove the mechanic to build cross compilers containers.
In my experience, it's clunky anyway and fails when building several
from scratch. Try it yourself after cleaning your docker/podman images.
It's just better and simpler to expect user to install cross compilers.

The only thing that prevented me to implement this before is that I
didn't know if concerned maintainers would accept it, or just hold onto
the precious handcrafted Makefiles, into which so much energy and time
has been spent.
If it's not the case, then we should definitely move into the direction
of migrating all this to meson, and rely on meson tests infrastructure.

Regards,
Pierrick

