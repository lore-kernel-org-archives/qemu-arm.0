Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7CCCD5BC9
	for <qemu-arm@archiver.kernel.org>; Mon, 25 May 2026 19:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRasz-0003tg-1f; Mon, 25 May 2026 15:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wRasx-0003tO-W4
 for qemu-arm@nongnu.org; Mon, 25 May 2026 15:22:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wRasw-0000d2-2z
 for qemu-arm@nongnu.org; Mon, 25 May 2026 15:22:47 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64PEBd8D3658095
 for <qemu-arm@nongnu.org>; Mon, 25 May 2026 19:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0k237a9a7+j2B+vi/k9B3UofqHGRriY6LMcOWV4C+Qc=; b=nXHjK/WV5FlPjl00
 MwUG/F5uZxynxTuE67Epi4HS433DWK+NZLrWO6Tfj/jGSKjK/d9cY6r78F48b2H7
 7nzWWxqvDVU4ywI3FGKJpYKShESJv05u+T8vEkaJCM40GedBNLIv6I2XHfk7b3Dr
 5YA8LYreJPEJj6eJ3hl3MSIrzcZfAXgl73RUFGtIVfHtSBt3QIOIV/pgQQwxHbNO
 XCWZDPOrQD2Na9oMLyPA+bpuCbUv35HBZCQarz1eD74Hb+tP+XT0h2wvs+nYKwGm
 gwqU7YUx9V/xPHZOT48v6beLcYDhpFc1wajhVbjdFm1dXofnX21yJ6O1u+NzCYK8
 ckBFYw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqyn8vdq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 25 May 2026 19:22:43 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-13537722193so2102059c88.0
 for <qemu-arm@nongnu.org>; Mon, 25 May 2026 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779736963; x=1780341763; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0k237a9a7+j2B+vi/k9B3UofqHGRriY6LMcOWV4C+Qc=;
 b=V3NiiUVTXuhgA4xK1/Cu63klU9UibiWCoi6rkbGf1x2sMk1cxYIdcbfbPeQq+kvE/v
 zBGmlw/RqjneZAjbRI7X1HJVcjxrMKZuIQ2XDdRsVGVki47QxS6DmAxtO60FJMyfYcP8
 yxMort20jq45AvUFBMa6AF4JbTCDLwpBCRlmkA8fTeN3Rx0vtsCsryFdf/XBqG2kt0vN
 g3iQklLgnVpWu36Qr4ZEenN9lxv2EFcqabAq8YxxpdcdM1DARtcQlH47N/3s7Nas6WCQ
 nkXJQSzIDw028zXyGikF6l8EJQa7ZCx9tCTJPp8KhK0HduY+41Bb8SJNB0lp4nKFvWib
 N+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779736963; x=1780341763;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0k237a9a7+j2B+vi/k9B3UofqHGRriY6LMcOWV4C+Qc=;
 b=Q8vymiuyhbm6IfGlS2iwO3CIaGEqB9Jl6q78KMm0rBKB5h1A/zCqni7upjqLVQsQyY
 0fqSPKKmUKdrCQYEGuf9CSrlyGLRoCmy820xzYAEm3mAf1x/gHH5mfNfjXBHUuDBil32
 S2H46/KmE+d8D0Hz/PpA/hHIdLTPGwTwIwgnNfgN4TcKsutRUgE+kNP1pGRVPmO+TKxx
 Bqgf2Mj4lGBkvcNEJx2YYlQGcemCtuMNiQ66TqrYjqlXjm1a7TxexpkYnN0N9Mk1sYs+
 BmRgbZNa8i1Bytfs7cgWcX9w2la7x2jVsLN4OmYf5DVm0IUb2RMwR5elQsE6rJkkioGR
 WTMg==
X-Forwarded-Encrypted: i=1;
 AFNElJ96ms21V7hTvvPVd+W+1x7134Pt5Bv2WFiazy9bQycmEZ4ykaAyXKtIhVuT4wZv07gDw6X5LTlDDg==@nongnu.org
X-Gm-Message-State: AOJu0YwAIcI03GPBKNNScUDzGReF4WuDeNd0vsjFk/c/xhxwDKSlmwbC
 LefG5hO2lLNugcE4i7PASsmvxpHLRMQkisEBJC3nJYrveUxzReg9Vr0KCANJEzsd1eqC9oe49Fk
 HsrNHAJ0T6sCMfOTJcDZyXbNV7QyEidYgaZ40Asf9OOV6idR1xOd6/LM=
X-Gm-Gg: Acq92OHMoTlPPNvVF8zQM6KZQGhj1ta+3vKPXqJ8l+CSkKFzGzSUdZHP0xtRVyLZoND
 jmuN8qvhZtt55SP+owiFIBK2yN8bXJyO5gn5Sbv4b1ANxfT27KAPqzz0oPtMqYf4m6XPm6R6nxH
 qsq3+Bx0T9miLQwiyMa/3SE0OryYr9xJqMnNc7mizJXfS0i18OlwlyZ2pXOCOMj3T+ZxxnEZtwc
 PhoDqQvyiHCh6kWJ/tu2pzPQAMtsH4FvQajCDNIgmg0h4tEQv3dQEBvbrkoA2nIJj4Ix3BXdXTE
 QLbYFhYX8RXIXS6GlcZmq6sgA2lQ8XH9Y1G+mILVo3cbvPxC4vkmC8umr31bzuz2AhU4z6I+iYH
 ziPm10ZWdrLSw0ele3AQzO+UTEOypMZZ4tr7RqtXPfXa9F2QDSvU4CTdrcw0u9VrRyxLX8Q425K
 H59ywdLUoPwTXVVA==
X-Received: by 2002:a05:7022:ec8c:b0:12a:6902:ddb8 with SMTP id
 a92af1059eb24-1365f811a9emr5114886c88.4.1779736962746; 
 Mon, 25 May 2026 12:22:42 -0700 (PDT)
X-Received: by 2002:a05:7022:ec8c:b0:12a:6902:ddb8 with SMTP id
 a92af1059eb24-1365f811a9emr5114862c88.4.1779736962207; 
 Mon, 25 May 2026 12:22:42 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1366aa88cffsm6178097c88.11.2026.05.25.12.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 12:22:41 -0700 (PDT)
Message-ID: <7d58926d-a36d-430f-828e-7ebdd9cc4eb5@oss.qualcomm.com>
Date: Mon, 25 May 2026 12:22:39 -0700
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
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <877bor9vor.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a14a183 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FChiutd3PLlDn1NUHwcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: tLB7WgE93c0ALa7URXQIOswg3YtdgAba
X-Proofpoint-ORIG-GUID: tLB7WgE93c0ALa7URXQIOswg3YtdgAba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE5MiBTYWx0ZWRfXyXj96ZfbcSg2
 GmnwN2KfDmAqBueXRj6njgI8c3XkCKlJCQcxJCVv9Sl70c6aaG/uM/Z4mPuxkFywukoYGlreXdo
 DWWyTW1ZGyuZKGT1efOymdzKnMCFRCgS1asPLx7JWs6bkhnqHdptEjZf425OWZLlhe5+qXs2fIx
 83Q8CbAyIKh/sjcp6N5fsYdube7SROoDkQKOz/TIJbrwrEHX4fet6TUbiwvdDMCoXnh/640Rx1D
 ZK10gq2okpZSZYLAfY+oKIPcBNhoUyGlkOEwwBNLzBfhKxPvQ3F3ovdC4cpstqn1RxotKSQI920
 7RqNiWBIupQ1WH3fHwlUXRzVsJVgpr+gvqcebOEJF+R9ogxD6NbKzS/LcqVYVcE8+dukmzlOFLT
 o/DoM2O4pAE9RrLbzjV6/1dXOAc3ABxNPve98/B8Gpdxoi7G9tFntXnpaFT4EoP6md7RK7EGiU4
 89fD1yP/1aPKBiqLUhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250192
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

On 5/25/2026 11:43 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 5/25/2026 8:46 AM, Pierrick Bouvier wrote:
>>> On 5/23/2026 1:56 AM, Alex Bennée wrote:
>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>
>>>>> On 5/22/2026 12:02 PM, Alex Bennée wrote:
>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>
>>>>>>> On 5/21/2026 6:17 AM, Alex Bennée wrote:
>>>>>>>> Explicitly set the appropriate QEMU binary as a dependency so we can
>>>>>>>> ensure they get built. This is especially important for MacOS which
>>>>>>>> otherwise only builds the unsigned binaries on a normal "make all"
>>>>>>>> run.
>>>>>>>>
>>>>>>>
>>>>>>> I'm not sure to see why it matters. tcg-tests don't make use of hvf, so
>>>>>>> unsigned binaries are plenty for it.
>>>>>>>
>>>>>>> Which other binary is this building that is not built by default?
>>>>>>>
>>>>>>> In general, if something is not included in "all" target, let's make
>>>>>>> sure it's included there (meson.build?) instead of adding a workaround
>>>>>>> here. Not only tests benefit this, but anyone doing a build on a
>>>>>>> platform that might have optional binaries not built by default.
>>>>>>
>>>>>> If you have a suggestion on how to make that work I'm all ears.
>>>>>>
>>>>>
>>>>> I would be happy to help, but I don't understand what the goal is. I
>>>>> have three questions that should help to provide a suggestion.
>>>>>
>>>>> Which exact test command do you run?
>>>>
>>>> make check-tcg
>>>>
>>>>>
>>>>> ```
>>>>> Explicitly set the appropriate QEMU binary as a dependency so we can
>>>>> ensure they get built.
>>>>> ```
>>>>> Aren't they built by all?
>>>>
>>>> Apparently not.
>>>>
>>>>> It seems to be a dependency, at least for check-tcg:
>>>>> .ninja-goals.check-tcg = all test-plugins
>>>>>
>>>>> ```
>>>>> This is especially important for MacOS which otherwise only builds the
>>>>> unsigned binaries on a normal "make all" run.
>>>>> ```
>>>>> Why do you need signed binaries for testing on MacOS (hvf?)?
>>>>
>>>> In a previous iteration I made configure spit out the unsigned binaries
>>>> to config-target.mak but the request was to fix the dependencies
>>>> instead.
>>>>
>>>> It all works on Linux so I'm not sure why MacOS is being so weird
>>>> because the meson emulators target mechanism should be the same.
>>>>
>>>
>>> Just tried now, and it does not work on Linux neither (make check-tcg
>>> does not build any target beyond tests). Maybe you forgot to clean your
>>> folder?
>>>
>>
>> The root issue is that tests/Makefile.include is included *after*
>> evaluation of ninja-targets in main Makefile. Thus,
>> .ninja-goals.check-tcg is ignored.
> 
> So this replaces patch 1/16 - I think we have a circular dependency here.
>

Indeed, I didn't notice the duplication. While it solves things under
Linux, it doesn't trigger any build on MacOS, which is what you observed
also. I wonder if it's a gmake vs whatever-make difference.

Another solution that seems ok on both platforms is to use (harmful)
recursive make:

 .PHONY: check-tcg
-.ninja-goals.check-tcg = all test-plugins
-check-tcg: $(RUN_TCG_TARGET_RULES)
+check-tcg:
+ $(MAKE) all test-plugins
+ $(MAKE) $(RUN_TCG_TARGET_RULES)

 .PHONY: clean-tcg
 clean-tcg: $(CLEAN_TCG_TARGET_RULES)

Or maybe just leave it as it is? Doc already mentions build should be
done before running any test to avoid missing binaries.
Hopefully we'll completely move tcg tests to meson one day, so there is
no need to deal with make idiosyncrasy anymore.

>>
>> The fix is to move ninja-targets evaluation to the end of main Makefile,
>> which introduce the expected dependency for check-tcg to "all
>> test-plugins" targets.
>>
>> You can replace current patch with the one attached to this email.
>>
>> Regards,
>> Pierrick
> 


