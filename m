Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D179BCD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 18:08:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRwCD-0003u3-Vw; Tue, 26 May 2026 14:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wRwC7-0003q7-A6
 for qemu-arm@nongnu.org; Tue, 26 May 2026 14:07:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wRwC4-0002df-Kv
 for qemu-arm@nongnu.org; Tue, 26 May 2026 14:07:59 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64QH0oou2977145
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 18:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6PECNvZMMV/mVcl85/ccfCAhzEabbbYgPKsRSZvoQAA=; b=dxS8f/Rllveui1bb
 1144mYb9OkoBKB/TwByYC41qM5JYYMRCHNAWLK3W7mj/QslNXW9/etnlrUOYEHmK
 tAUBlHp2HxHcJM8PMuWxxyrxdfnibB+wLABYfPA4S+0drGkynSjF/MX6rJNW4aGv
 +HzUkvWz55qZBpJ6Kj+e3ecXXhYzlddtIBwgz59h6mEPUTygviJkFFyHD7cHl+Om
 AyYanUlLWH3GuPHDvDHtW3Y7RZFbmsM1Ysu33gkpczb2qdQqs3c1366e+qxc0Xve
 e93YhmQz/iyMAGG0ycWpataWy/i3f4qCsjXnF491Xai/Hh2zhYu7FLIrUjjEH+pM
 7ASKXw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddqkrwup-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 18:07:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2fded513994so2932653eec.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779818874; x=1780423674; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6PECNvZMMV/mVcl85/ccfCAhzEabbbYgPKsRSZvoQAA=;
 b=XKRHe38TiQudQoqvD34pDzmaNNk+eyf0DFEbvseoEtB8SR5qjemeeqWaoBs3Xo29R/
 tFtRvYExl8gyYPV0JzF0yC/jktD55Jo4eVsAube43oqrbMesuT3oQv0S+6p7Ooasin2N
 5ZOAuQNyuWgtL1GiF4V90+p7rA0g9si9OY6kj17BNydwi1i6Omiy77f3HDoX6YNNsDt+
 XbXpGJ80CGPs7ugBycvujr1GtAQdIqKzLLyQ/pE1W9fjOsvprid7xYlss6Z2RBp4yFua
 pAvA2IqpnY+1YBwx3J/fEFJRQ1Smy/d+9ttCAkAjF7O2h+QBn8kxkqDRY7BqQ9F5eQ4b
 J6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818874; x=1780423674;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6PECNvZMMV/mVcl85/ccfCAhzEabbbYgPKsRSZvoQAA=;
 b=pMQubQt5JapuXMsgoK2ASQKnrAsDmLlKVjWJBosheiL85479vJDQpf0vr7HWyyVwpm
 PufpC/Tb3dp5Q7R3acB2D6QcETlOQqPCDi4F4ondxumVkmrt3IKhT0IDl65i6cRAfrBi
 Lw3JlcqtamfY7Jml7QZDVaWKmoFdHZmAZ3F1VlygB0Qmfio5FOxVMAIMF3mgJENEml1x
 6X+FUgVgNl0+B8WScaKR3gt+AGHJu4MjDnh64bRCvALkFPidvkWTF+td/MRv4D3OF3g+
 jTS2jyO3sBiwHxFIiDnkzogqbb0gYqpj7IYySvKW3MvV2t0wkfgyqVkvuXrJCITO2wKL
 aQ6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/mD+y81rJ8jvBss6u8S6H9cNEtlTbo30El3ON2jiaYtXtb6zhjxOdKUaI2KWVfNxNqMCknjk2KHw==@nongnu.org
X-Gm-Message-State: AOJu0YyOdnbPMkhNnk2F1nhmbbxGS8/gRLoOasKRiVaJoYPVSMf0r8bn
 2Uc539p8CGr5BHLEOK7bSzZPvibVjZLxz3QvT4kkM4h/Ps97WsBzG5v6qo/G5ycJ+yZx1X6ANGZ
 S7HtHbEr6IemMiwxaFlVULbhYvyQd9i6n7LMA/ofcC/qWoZEHpOauIWE=
X-Gm-Gg: Acq92OGNG9vC45/Sm/G44eZ4jjRgau3Pnt/lo/tvWpcK05BjNxdiULya5yzD382hg+J
 UvySQ0+fBbDHn/mhEs2WZsfVP++Y+/IMA5LrFc4afo7due3O0RKwVr3p8qTDq1k1CM+299YT1ji
 Wu52pld0fK47uwvYgmCFryi3PhBZy7rhLAzZ5KITzK/NPlr0oz00l/R7p+h+/+4m2lGL2UqbNzX
 btvCxy7a5eRMYVC5nB3X0d6QYhv7Ep4jDcgYUMU44rHbcXGOUIuby1W6rel0n3fyqzWpN/NUf2K
 ysPXm78L69aVDKEs/7ssLc55w+RcudZbJE9YmjJ+tDqtTIKekTpemFBjdqH2OCVgpqYFhmpGYW8
 5Dj4CMwiwMHuKFSNLOsKSRfnoYp6QIpKP0e1O+672mJVQSmTlrR51zOMZZoAUcKftYr1+eXkJre
 9lhjSCk+CRsLdpuA==
X-Received: by 2002:a05:7300:ad06:b0:2c8:6361:ab2e with SMTP id
 5a478bee46e88-3044905b650mr9448254eec.8.1779818874032; 
 Tue, 26 May 2026 11:07:54 -0700 (PDT)
X-Received: by 2002:a05:7300:ad06:b0:2c8:6361:ab2e with SMTP id
 5a478bee46e88-3044905b650mr9448217eec.8.1779818873326; 
 Tue, 26 May 2026 11:07:53 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30452230b25sm13986432eec.15.2026.05.26.11.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 11:07:52 -0700 (PDT)
Message-ID: <8a878679-733c-451c-8053-663a74f8d4a7@oss.qualcomm.com>
Date: Tue, 26 May 2026 11:07:50 -0700
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
 <06092208-1b56-4fea-8d92-bf035fbd0fa3@oss.qualcomm.com>
 <87fr3eyrvp.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87fr3eyrvp.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zubd7d7G c=1 sm=1 tr=0 ts=6a15e17b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ukH1R-b_AAAA:8 a=EUspDBNiAAAA:8 a=R3v0vUnM9xIF36UBXe4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=zUGFzhdS3I8ccRoxxLmr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1OCBTYWx0ZWRfX7mrlLVggtCZX
 jFQiL0ASvTd1u6bJLbKFmAqdwbTXWAHaqGMXJS10k9d5FoY6a1pux71eJPSmjAP6W3Gih45wjBB
 Rq8SrDv8POVu3V189LiACTh+fmYP/wlXA6JZOydR7D2vx6MB41Myie3KjvWf0rMmH8l14UZBLl5
 925uRmf/ElEcE2lz+PxfmynAS9wKPIrINImz1p8kbQDNaAFyepP800OWKiUgXatJ/TZaHlUWSoX
 K87VRHBgfuPT70Kk1dG0cqwnEJUvL+B6L2x7ZR/5Yp4Ep0z2ryfm2Sr7ip4Pen/CxFaheBlDDyf
 VkzJvZgdw+2Y64Pzr2y1KKcDwBd1wep+98xsYOEyY1pkixbwzp6uz7leCH3hDQXfcq+5vmA3sTt
 i/mBZzb6eQMP9j64V4p+d/tfrnr1OAx72n+KU6sVAIrmHFIvb3mtuB7X5kVCMBRroQF5tF0hQBy
 MpW1jmHBhcg3JRaYTQA==
X-Proofpoint-ORIG-GUID: 4THGRNLR6UxpQvnpZJSaA2MJCIpf06iL
X-Proofpoint-GUID: 4THGRNLR6UxpQvnpZJSaA2MJCIpf06iL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260158
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/26/2026 10:58 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 5/26/2026 3:47 AM, Alex Bennée wrote:
>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>
>>>> On 5/25/2026 11:43 AM, Alex Bennée wrote:
>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>
>>>>>> On 5/25/2026 8:46 AM, Pierrick Bouvier wrote:
>>>>>>> On 5/23/2026 1:56 AM, Alex Bennée wrote:
>>>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>>>
>>>>>>>>> On 5/22/2026 12:02 PM, Alex Bennée wrote:
>>>>>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>>>>>
>>>>>>>>>>> On 5/21/2026 6:17 AM, Alex Bennée wrote:
>>>>>>>>>>>> Explicitly set the appropriate QEMU binary as a dependency so we can
>>>>>>>>>>>> ensure they get built. This is especially important for MacOS which
>>>>>>>>>>>> otherwise only builds the unsigned binaries on a normal "make all"
>>>>>>>>>>>> run.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I'm not sure to see why it matters. tcg-tests don't make use of hvf, so
>>>>>>>>>>> unsigned binaries are plenty for it.
>>>>>>>>>>>
>>>>>>>>>>> Which other binary is this building that is not built by default?
>>>>>>>>>>>
>>>>>>>>>>> In general, if something is not included in "all" target, let's make
>>>>>>>>>>> sure it's included there (meson.build?) instead of adding a workaround
>>>>>>>>>>> here. Not only tests benefit this, but anyone doing a build on a
>>>>>>>>>>> platform that might have optional binaries not built by default.
>>>>>>>>>>
>>>>>>>>>> If you have a suggestion on how to make that work I'm all ears.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I would be happy to help, but I don't understand what the goal is. I
>>>>>>>>> have three questions that should help to provide a suggestion.
>>>>>>>>>
>>>>>>>>> Which exact test command do you run?
>>>>>>>>
>>>>>>>> make check-tcg
>>>>>>>>
>>>>>>>>>
>>>>>>>>> ```
>>>>>>>>> Explicitly set the appropriate QEMU binary as a dependency so we can
>>>>>>>>> ensure they get built.
>>>>>>>>> ```
>>>>>>>>> Aren't they built by all?
>>>>>>>>
>>>>>>>> Apparently not.
>>>>>>>>
>>>>>>>>> It seems to be a dependency, at least for check-tcg:
>>>>>>>>> .ninja-goals.check-tcg = all test-plugins
>>>>>>>>>
>>>>>>>>> ```
>>>>>>>>> This is especially important for MacOS which otherwise only builds the
>>>>>>>>> unsigned binaries on a normal "make all" run.
>>>>>>>>> ```
>>>>>>>>> Why do you need signed binaries for testing on MacOS (hvf?)?
>>>>>>>>
>>>>>>>> In a previous iteration I made configure spit out the unsigned binaries
>>>>>>>> to config-target.mak but the request was to fix the dependencies
>>>>>>>> instead.
>>>>>>>>
>>>>>>>> It all works on Linux so I'm not sure why MacOS is being so weird
>>>>>>>> because the meson emulators target mechanism should be the same.
>>>>>>>>
>>>>>>>
>>>>>>> Just tried now, and it does not work on Linux neither (make check-tcg
>>>>>>> does not build any target beyond tests). Maybe you forgot to clean your
>>>>>>> folder?
>>>>>>>
>>>>>>
>>>>>> The root issue is that tests/Makefile.include is included *after*
>>>>>> evaluation of ninja-targets in main Makefile. Thus,
>>>>>> .ninja-goals.check-tcg is ignored.
>>>>>
>>>>> So this replaces patch 1/16 - I think we have a circular dependency here.
>>>>>
>>>>
>>>> Indeed, I didn't notice the duplication. While it solves things under
>>>> Linux, it doesn't trigger any build on MacOS, which is what you observed
>>>> also. I wonder if it's a gmake vs whatever-make difference.
>>>>
>>>> Another solution that seems ok on both platforms is to use (harmful)
>>>> recursive make:
>>>>
>>>>  .PHONY: check-tcg
>>>> -.ninja-goals.check-tcg = all test-plugins
>>>> -check-tcg: $(RUN_TCG_TARGET_RULES)
>>>> +check-tcg:
>>>> + $(MAKE) all test-plugins
>>>> + $(MAKE) $(RUN_TCG_TARGET_RULES)
>>>>
>>>>  .PHONY: clean-tcg
>>>>  clean-tcg: $(CLEAN_TCG_TARGET_RULES)
>>>>
>>>> Or maybe just leave it as it is? Doc already mentions build should be
>>>> done before running any test to avoid missing binaries.
>>>> Hopefully we'll completely move tcg tests to meson one day, so there is
>>>> no need to deal with make idiosyncrasy anymore.
>>>
>>> The blocker for that to happen would be meson knowing about anything
>>> else than the host compiler and singular cross compiler.
>>>
>>
>> Meson indeed supports a single compiler + cross compiler at a time.
>> However, you can directly generate cross binaries using a custom_target
>> or a generator object. This way, meson would generate programs without
>> having to know it's a C compiler. Since all files are single source,
> 
> That is an incorrect assumption - the softmmu binaries especially have a
> multiple objects which are linked together.
>

custom_target can solves this.
*Most* of tcg tests are single source.

>> it's not a problem, since we don't need to declare them.
>> Generators have the advantage of being less verbose (you declare only
>> once how to use them) than custom target when used several times.
>>
>> https://mesonbuild.com/Reference-manual_functions_generator.html
>> https://mesonbuild.com/Generating-sources.html#using-generator
>>
>> See a full working example below:
>> ```
>> $ cat meson.build
>> project('cross_compile_tests', 'c')
>>
>> cc_aarch64 = generator(
>>                find_program('aarch64-linux-gnu-gcc'),
>>                arguments: ['@INPUT@', '-o', '@OUTPUT@', '@EXTRA_ARGS@'],
>>                output: '@BASENAME@')
>>
>> tests = [
>>   cc_aarch64.process('test.c'),
>>   cc_aarch64.process('test2.c', extra_args: '-lpthread')
>> ]
>> # we need a target that actually uses tests
>> executable('test_aarch64', 'empty_main.c', tests)
>>
>> $ mkdir -p build && cd build
>> $ meson && ninja -v
>> [1/4] /usr/bin/aarch64-linux-gnu-gcc ../test.c -o test_aarch64.p/test
>> [2/4] /usr/bin/aarch64-linux-gnu-gcc ../test2.c -o test_aarch64.p/test2
>> -lpthread
>> [3/4] ccache cc -Itest_aarch64.p -I. -I.. -fdiagnostics-color=always
>> -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -O0 -g -MD -MQ
>> test_aarch64.p/empty_main.c.o -MF test_aarch64.p/empty_main.c.o.d -o
>> test_aarch64.p/empty_main.c.o -c ../empty_main.c
>> [4/4] cc  -o test_aarch64 test_aarch64.p/empty_main.c.o -Wl,--as-needed
>> -Wl,--no-undefined
>> $ file test_aarch64.p/test*
>> test_aarch64.p/test:  ELF 64-bit LSB pie executable, ARM aarch64,
>> version 1 (SYSV), dynamically linked, interpreter
>> /lib/ld-linux-aarch64.so.1,
>> BuildID[sha1]=8162b8f045880c75118958ad46be78ed75bb708d, for GNU/Linux
>> 3.7.0, not stripped
>> test_aarch64.p/test2: ELF 64-bit LSB pie executable, ARM aarch64,
>> version 1 (SYSV), dynamically linked, interpreter
>> /lib/ld-linux-aarch64.so.1,
>> BuildID[sha1]=eed48625e02cd436a2708f94e5dd9ce6d5c162a9, for GNU/Linux
>> 3.7.0, not stripped
>> ```
>>
>> We'll need to remove the mechanic to build cross compilers containers.
>> In my experience, it's clunky anyway and fails when building several
>> from scratch. Try it yourself after cleaning your docker/podman images.
>> It's just better and simpler to expect user to install cross
>> compilers.
> 
> That would loose a bunch of functionality and doesn't help users running
> anything that isn't Debian.
>

Out of fedora, who does it exclude?
We can still provide a fat debian container with all cross compilers
embedded for people who don't run ubuntu/debian.

>> The only thing that prevented me to implement this before is that I
>> didn't know if concerned maintainers would accept it, or just hold onto
>> the precious handcrafted Makefiles, into which so much energy and time
>> has been spent.
> 
> There is no desire to hold onto Makefiles, but I do want to keep the
> same capabilities as the current system. The driver for containerising
> the compilers was that setting up cross compilers is a barrier to
> contributors who want to be able to add and build tests.
>

Personally, this "smart" layer has been a barrier even on Debian, since
by default it tries to build them, and it fails from scratch.
Give it a try by purging your docker images, and run a make check-tcg
-j$(nproc). I doubt anyone is really running check-tcg with this in real
life.

But well, if the cross-container thing is *really* a blocker, we can
just wrap build and run in a script per cross compiler, that does
docker/podman build && docker/podman run and call that.

Now we solved the problem with system tests, and cross compilers, is
there another thing that is absolutely needed from Makefiles?

>> If it's not the case, then we should definitely move into the direction
>> of migrating all this to meson, and rely on meson tests infrastructure.
>>
>> Regards,
>> Pierrick
> 

