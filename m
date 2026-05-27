Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C0CD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 20:56:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSLHo-0005oy-Cb; Wed, 27 May 2026 16:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSLHm-0005lE-R5
 for qemu-arm@nongnu.org; Wed, 27 May 2026 16:55:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSLHl-0006a8-2M
 for qemu-arm@nongnu.org; Wed, 27 May 2026 16:55:30 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKlxJR125537
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 20:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BUk9+IXcVgGbb0ZfCLkGaCqqOZFsiQUjXIssHj5OG2o=; b=fMmo/ZfMHfuThY5x
 h4Hw9saM57ERu4I2vUub7Ea+mfo1nGAPcmXC6Rt1aZw4fqlt4WbT4H/SHdArUxWd
 ZYnDd1dtTm6cy+Qv3Mag8eKyPHcW/wmO3nwuYlLaEunDFprCSDutMx9Zrx8w83pI
 nndATj9YvLteYxiRq2sAQTwpesRYYNOb4gNxJ3HTm/lvjMOsB9u5cONk2cBw6zW5
 n/PjUoJIhO1+uUBgcjfTd4thwyVeWfdBxENFbpKwoUlp1nNeA23ox7rQEN9BK4Yw
 jdJYl+JZk2jhNcI2vv5WI9tTyKlu+gckUujKq7i2cx0cgTTp4acjAcg40b5UBg2E
 fvD4TQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yag1t8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 20:55:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3041ab826ddso11770494eec.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779915324; x=1780520124; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BUk9+IXcVgGbb0ZfCLkGaCqqOZFsiQUjXIssHj5OG2o=;
 b=RXNVGX0Q26H4pwUjIk8iuqyOZLjHO30kehmqiygPhkfPypcDIsIXegY7u+EHV+KQti
 c9p9TP1DdT8nHygx8u7INVmGMtrUpfLVFyZKMoD8LVOVy93cTABU6GFpqVOndMLyCRWN
 6WRdldQbgmZ/MQQV4H87FS1oV6D+bk9Ed2pYqD5anZ5uyyO3QjlY6VQZzvsfDnmdqJ20
 IcRvhCSu5LM+oRpxyRInBnBn2erawjGxqe86P7ewUwaZqz25NFVW7dU1heFh1n8SjUQ9
 1lvZRLuvF92rhMYnqbeS1g+b5QrlpoQgypJIfrJPwWCrUN8haJsidtODM9/ioQwa5+oN
 qf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779915324; x=1780520124;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BUk9+IXcVgGbb0ZfCLkGaCqqOZFsiQUjXIssHj5OG2o=;
 b=sB7MLAG0O52yQoYfLSvQn+KlGZVFoL/BXZ+qmMaW7+VvOgqJYWmi0wygStH/5VTNOI
 fmz9K95XAQTpGY9/1RjJ0WI+y2hXekvH9M05QJlfGSarc2wJSrHEYL/ThOaBWh1+ExDz
 ntwMLfdSG+UvsNd01zM38j1EgmNyA20X0uCVT9bzQuH+oNFrRWWjIXeOAPqhKyvwFZ8i
 Rlo947Xrl+6nOpzI4dDxTKPOQqbqeIl8JLtO2lNC/PePDGbVVtCx5FF+5BfvBS9+fozz
 ZASwu2TDRyF1kuO7ZY1dEswEbMr05tP0IVdl7G0/tAzgsleOS/0fuCiU0QHOMF/rMp5e
 TNhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8IqLX3goX052xF2QyDfe0Fr4DINT4kord0yi9ffxeNC4a6+injc8xVQtykMoBvrYmojJg6N3an4Q==@nongnu.org
X-Gm-Message-State: AOJu0YwPWwq2zcqMJv4Z/HPir9FJ4nEhbxQsF0YCX2xypUuz5YxYMX0O
 syzHY4SW5VJGGp6HgsYtBXdr7CplXyDf24iNUG62ZqEQc007GeW1ZDgeYbrG2AgcWoXzw/nFh71
 pdPhwO4PYHDLHYiqMQ4jcJJWL3wWdDE0kI3hBSljwnvDge6ZJU3tF7l4=
X-Gm-Gg: Acq92OFpI24F7I2R3yQZDI308x6EEEZbkMPV4nKdAN47CytNZiIhkVpYuRpeRBjY8aq
 0t1pCczXbnqCBlJ6X7g6Xmi5AX3FKZPSa8D26RD3pst0Oes2R5wjQV8ql9MKD5HqtpuU2MWBJBh
 4qt2QvwhGwpbpIhB1FA6G91UtpQJ286kRD/RMTegAmMplim4ELtjGJdxtYCkHVu3VukPi8NffXA
 gtMY7s/Vy78PITE4WUlyCDvkyA8aCSBT3uD+IKw88eXV5M4F3awo0J1UwJjg3iefni/fsiFIbEq
 nVUUwRT0dBEm7JvWkAjlqmlrg5lgw+U6vltOErlLKXQlWelPkUzbHWQ84/BiyVI7UqI+g13SEf3
 +WvDpEdV7INBGfzLSrcEpQXoREA75w3B/MqzA2gMvOpPC9RobiDarCQ/0rFHceN9mOGLMlRj7ZJ
 mKW4LEAAZuTg4hMP+BEz+nevLd
X-Received: by 2002:a05:7300:ac94:b0:304:5a9c:644c with SMTP id
 5a478bee46e88-3045a9c6cffmr7813609eec.15.1779915323881; 
 Wed, 27 May 2026 13:55:23 -0700 (PDT)
X-Received: by 2002:a05:7300:ac94:b0:304:5a9c:644c with SMTP id
 5a478bee46e88-3045a9c6cffmr7813566eec.15.1779915323306; 
 Wed, 27 May 2026 13:55:23 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30452461cb5sm20044274eec.31.2026.05.27.13.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 13:55:22 -0700 (PDT)
Message-ID: <86385e93-5425-4145-8a9f-0f72ed5de022@oss.qualcomm.com>
Date: Wed, 27 May 2026 13:55:20 -0700
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
 <8a878679-733c-451c-8053-663a74f8d4a7@oss.qualcomm.com>
 <87a4tlz897.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87a4tlz897.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oJAm84K-EEuuVnprQWAN9AyU40eq8CD3
X-Proofpoint-GUID: oJAm84K-EEuuVnprQWAN9AyU40eq8CD3
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a175a3c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7JdIQKnF0icQP4fr_JkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDIwOSBTYWx0ZWRfX4ge4yamG0d3f
 xDP3YDk3ThTohgKNjamt+1Uaj2BdIveKK/6A6aPp511JpolCFwNdH4/M/mfx5gHN9GxvCqwtD9f
 A85EJR/bU+mhMiH1fyCGYB5/Zz2KOTn+cMwaBsmyb7mmmBdmHMiM3yLDolwxA8FKQpPZbWV8rUo
 SKVTx8jPIg4pIbe3HwvlBW3ktKwvHRShriYvL2Xnn6a4WenFivbBPx5DiDLPf/FuJBV/An279e/
 CPOqcqXcD0Jkeo7toSsbrEsSL2SBJc4O0nVguEhmTcdYC3Niw8aLa6LOZZfm01xBp6V0ItTWCxS
 Tac6NMssF66jCduG5ohCw2pQZCX7spcoMnX9uIsTqqlZIHwRuoSGYaLgNBjy7er8AZAGQ6mg/Gr
 wBHAWR3Y2WJoioxHX3BKvu3CLtNUi2uHQaigEcdwDkH4T7azG34sQb3ju5aAJN8qx5lu2PFj2aN
 vGgnRlf+GfJ3FgfqAVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605270209
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

On 5/26/2026 11:17 PM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 5/26/2026 10:58 AM, Alex Bennée wrote:
>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>
>>>> On 5/26/2026 3:47 AM, Alex Bennée wrote:
>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>
>>>>>> On 5/25/2026 11:43 AM, Alex Bennée wrote:
>>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>>
>>>>>>>> On 5/25/2026 8:46 AM, Pierrick Bouvier wrote:
>>>>>>>>> On 5/23/2026 1:56 AM, Alex Bennée wrote:
>>>>>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>>>>>
>>>>>>>>>>> On 5/22/2026 12:02 PM, Alex Bennée wrote:
>>>>>>>>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>>>>>>>>
>>>>>>>>>>>>> On 5/21/2026 6:17 AM, Alex Bennée wrote:
> <snip>
>>>>
>>>> We'll need to remove the mechanic to build cross compilers containers.
>>>> In my experience, it's clunky anyway and fails when building several
>>>> from scratch. Try it yourself after cleaning your docker/podman images.
>>>> It's just better and simpler to expect user to install cross
>>>> compilers.
>>>
>>> That would loose a bunch of functionality and doesn't help users running
>>> anything that isn't Debian.
>>>
>>
>> Out of fedora, who does it exclude?
> 
> RHEL, CentOS, SuSE
> 
> The cross compiler situation may have improved since - Debian has always
> been ahead of the curve in its multi-arch support.
> 
>> We can still provide a fat debian container with all cross compilers
>> embedded for people who don't run ubuntu/debian.
>>
>>>> The only thing that prevented me to implement this before is that I
>>>> didn't know if concerned maintainers would accept it, or just hold onto
>>>> the precious handcrafted Makefiles, into which so much energy and time
>>>> has been spent.
>>>
>>> There is no desire to hold onto Makefiles, but I do want to keep the
>>> same capabilities as the current system. The driver for containerising
>>> the compilers was that setting up cross compilers is a barrier to
>>> contributors who want to be able to add and build tests.
>>>
>>
>> Personally, this "smart" layer has been a barrier even on Debian, since
>> by default it tries to build them, and it fails from scratch.
>> Give it a try by purging your docker images, and run a make check-tcg
>> -j$(nproc). I doubt anyone is really running check-tcg with this in real
>> life.
> 
> What do you mean? I run check-tcg all the time.
> 
> Which containers fail to build for you? The main cross-compiler one
> (debian-all-test-cross) is built all the time.
>

Build is working out of the box now.
However, it seems that only tests for aarch64, arm and x86_64 are run
when using containers without having installed cross compilers.
Maybe it's another carefully handcrafted feature of tcg Makefiles?

>> But well, if the cross-container thing is *really* a blocker, we can
>> just wrap build and run in a script per cross compiler, that does
>> docker/podman build && docker/podman run and call that.
> 
> We still have the remnants of that in the docker.py script although for
> most containers we moved to invoking docker (or podman) directly.
>

Maybe that's why I encountered issues in the past, and now it works out
of the box.

> Also bear in mind the containers are also used to cross build QEMU
> itself. 
> 
>>
>> Now we solved the problem with system tests, and cross compilers, is
>> there another thing that is absolutely needed from Makefiles?
>>
>>>> If it's not the case, then we should definitely move into the direction
>>>> of migrating all this to meson, and rely on meson tests infrastructure.
>>>>

To add on top of this, I would be happy to help with the transition, but
I want to make sure you'll accept it first, with a list of requirements.

I'm a bit tired of seeing patches in your subsystems get stuck for
weeks, without any proper review, to finally be (re)posted again in a
new series, blocked for more weeks, and finally reach upstream one month
later or worse. It's truly exhausting for everyone contributing in such
places.

>>>> Regards,
>>>> Pierrick
>>>
> 


