Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2C5CD6E45
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 18:44:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSfhu-00036L-RT; Thu, 28 May 2026 14:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSfhg-00033W-4M
 for qemu-arm@nongnu.org; Thu, 28 May 2026 14:43:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSfhc-0006Zh-Ix
 for qemu-arm@nongnu.org; Thu, 28 May 2026 14:43:35 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SIOhDN1539603
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 18:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6BN+/IEcMd8k7bSBNzs17LPx7yeX91DcI895DS2jSfA=; b=D0EG3aJVW1ZOIWah
 nudpsX8vQkuY/rR/fhPvMT9B71/Ho565H/c4OL6zM7FXr/PtfqTfw3HM0y8hJwMA
 Jzrk2mlLMFNh7KKpKF/uQ+slp/xuRdmxA+QJ5GLH1O0mGPfV7MtCER6WnVmGjDPj
 CAJ5KQ7Zgkkd7OZ/FEMHld3jugrNHMtdgGTlQkycFtpUl44/zSiPtk6djWlMognp
 LKtt/ji5bszMcbizybNzkws60n0nhGtxXsYKyk8jTWOQdtp0t+/M3zxXytdL3iRy
 A/RZ9TUsz+gOlzKM8oJISedjVKWlAqfCU0JVLKlHCN8ovz1lFH05auR06YQtEVh+
 6syegw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety502a0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 18:43:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-13709ab38a8so5293951c88.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779993810; x=1780598610; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6BN+/IEcMd8k7bSBNzs17LPx7yeX91DcI895DS2jSfA=;
 b=JVp7GqmAGOwlyK6T2Qiey+c0MfODGsAJRvcrxQyIX17YRelGqbBLE5AvEaA1Zftn7Q
 kh9NZ2yHlwXuWHgt+kNELOOeotQXlN/cq1kXh91ixM69QOBZIsHizgD0Y1qaRxov4a54
 Qr9jbfOIrxVyZBX+EOvvBHfPgo2HxxNbwDm4PIU0l/hLsXnliKJ/Xq6GTprdoh9SG/aV
 ZAWEXY5+FEWcd4c206oEsqQWHYUvZvCU7cx66DMURV4Q9T/2y7r2nS+DloLEPv6o0h+k
 RsGv7RL1kHQXZwkV/bzKifn1KG/tnLxq/ga3IasL4XzIQ7lxxbcLHwy5Ly1rAihJpiYp
 wyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779993810; x=1780598610;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BN+/IEcMd8k7bSBNzs17LPx7yeX91DcI895DS2jSfA=;
 b=jxIex1Vib2TL/aB1ZR1is7OTelkuht8kZ6c1RoAUZtVJrkeU6s4lJhslTuN6gNUSfN
 q4Ki020tmjsSjuY3mR6KVfztB7y+QkAlxOa5g/EPgmnFH4xb7LK2NqJFWN+zr0ru1fm9
 4i3z7tzhCRBjuxRVKNLlAWJC3f+q2ryZ8OD1pyie5wTeYmXH5No3iogMuOlDOPjYPoQn
 aT42mUL3KSdnyYmXxC6v/TAWFryQLSCF3LKZAA4mEapPT6k3hDOm/IKtcHOqUGoDAcyV
 dfYQhAJocJ6qyDqgOrm7GJZiksxQhDnlF4DWy9FZgBGd0gqdcZhP+5/bo4axAbfqUN7x
 c9jQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ87tYljgjQR33uebRD8sZZAQVdVMKUYmMmXG5VuI23JYnxaJhVMv5kv6JpeHEkjK8bGcTPHS07U/A==@nongnu.org
X-Gm-Message-State: AOJu0Yx5kRr8QeT9f53UPUkHMNzlYakyKqRgMi7mK23qruSjSUYbkxMM
 wCvKFCeS08QrWjEoY89cAMWDx3LUBT1lGWLzclTxs2j4WEG987wXyh9whMpCmPI0/VMuouDavU7
 yufQKFuFemQL98odnKV4+yKprWXszNqKyTGtgCnZEAr+ckLNnQ2w7KVM=
X-Gm-Gg: Acq92OH6R6c1cC25jxoB18PvYbpX1MlpSsdQzr1HNapPlJTGYZ6TPuUwzKcdVds/9j1
 RZJ1OHxyA3eldsdzpJIB6E5MFqWR/fYXpsbdDjxR2RuL6H2pNM9RqwQTMeRfmBsPyF70Fh7tx/P
 lHVoiwmX89sgWMvusLiRpZsGD+G/20A/cWKsqrhm1SoBMr4tU1M7TYYuLFGaZdQ2Lg0ugXNHkWZ
 zIjLOF4k4F5YOiqp6lFK6umF9SY8gx3SiUiAehFsQTT2QCl4+yHBWyoYt7GOMBogwBvjjyv5CXq
 b0uiGLAenV1W7JJXEmhXNW21bgEKHwQbzC35m2XboexoUuB94p7wo3pubLJBlXmOqXgD57sD5GE
 LB1kle7/KNax4vhpI22t/nTMMOkuZB99uyTyvaNHQZbecPE/xzDRWRN/T3iYcTTKKPjcItyrHi2
 tFLmYYMkMwnXU8EL6un0k19Tam
X-Received: by 2002:a05:7022:2201:b0:137:1ae1:bc2e with SMTP id
 a92af1059eb24-137a85aa90emr83574c88.11.1779993809735; 
 Thu, 28 May 2026 11:43:29 -0700 (PDT)
X-Received: by 2002:a05:7022:2201:b0:137:1ae1:bc2e with SMTP id
 a92af1059eb24-137a85aa90emr83548c88.11.1779993809051; 
 Thu, 28 May 2026 11:43:29 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137a8f3609dsm75790c88.0.2026.05.28.11.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 11:43:28 -0700 (PDT)
Message-ID: <98156f95-e6bf-4061-8e3e-9e884ebc3e5e@oss.qualcomm.com>
Date: Thu, 28 May 2026 11:43:26 -0700
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
 <86385e93-5425-4145-8a9f-0f72ed5de022@oss.qualcomm.com>
 <87o6hzx2np.fsf@draig.linaro.org>
 <5a4eedbb-483c-40ea-a4dd-b34a4b7d7b6e@oss.qualcomm.com>
 <871pevqumz.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <871pevqumz.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE4OCBTYWx0ZWRfX8jf3OWVz/Av1
 LbiO+P94hTQoHLB2gKjrhQXzxC9zgOVtgBXDJomCnHtGbA2PrU5W93kvGRjnH3OTimqH577FxvW
 mwrKjItL9c/Uv+FqO21zMAx1zaU2xvXM0w+UqdTR0BfPjjePCEclQbH/lRVlSnGzu44HIp4RWS5
 P762qhiQE/Lwd2BrD7BnOseDOo/Aj9yTrzGsCuHuxezY3imXfunot+09fZmD7XDEiT/is7sVPaK
 iUoiCDb3ESU8t3o4sU3b772D0TD8YrodTjn/ugI/QQJawxSv7g2mDoopFA69HiX64wMNIkpu+gv
 Me0FTseQRgT9aenWO4bhXi1sI3yR/ylBoWkHNWZ34FptHUccbK7HWEXO8XBxG2djw8ITL8olI6B
 AWALVTfHw/9eOmcT5ksiWAyCela8fSiveX2PqqkQVkNvdm0IzwJVf4ZDr9MHoCfwAeZe5jSyGPH
 9rzi5WwGXu3sMsNAFhA==
X-Proofpoint-GUID: 0Rjb7P8Lsut-kTVSNwHDZDUfNFB4Do6t
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a188cd2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=N__cxUfHBng5Lt6DJXgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 0Rjb7P8Lsut-kTVSNwHDZDUfNFB4Do6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280188
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

On 5/28/2026 11:03 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 5/28/2026 3:13 AM, Alex Bennée wrote:
>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>
>>>> On 5/26/2026 11:17 PM, Alex Bennée wrote:
>>>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>>>
>>> <snip>
>>>>>
>>>>> What do you mean? I run check-tcg all the time.
>>>>>
>>>>> Which containers fail to build for you? The main cross-compiler one
>>>>> (debian-all-test-cross) is built all the time.
> <snip>
>>>> I'm a bit tired of seeing patches in your subsystems get stuck for
>>>> weeks, without any proper review, to finally be (re)posted again in a
>>>> new series, blocked for more weeks, and finally reach upstream one month
>>>> later or worse. It's truly exhausting for everyone contributing in such
>>>> places.
>>>
>>> What can I say - reviews are welcome. I always list what patches are
>>> still waiting for review in the cover letter. I should also add for
>>> testing/next I try to be extra careful that regressions don't slip in
>>> because keeping the testing sub-system stable is important to support
>>> things like bisection.
>>>
>>
>> The main issue with your personal workflow, which is "reposting existing
>> series concatenated in a new single series", is that it adds a lot of
>> latency. Basically, if one patch fails, or is not reviewed, the whole
>> thing is blocked. And that is a problem. I don't see what it's supposed
>> to achieve, since it's halfway between a series, and a PR, without being
>> one or the other.
>>
>> TLDR: the problem is how long things are between receiving reviewed-by,
>> and being in a pull request in your subsystems.
>>
>> For instance, in current series, there are multiple sub series. Some of
>> them are fully reviewed and ready to go, they can be sent as PR
>> independently.
>>
>> I remember you mentioned several times that you like to have a "single
>> branch". I have the same workflow, and it absolutely does not prevent to
>> send multiple PR or series in parallel.
> 
> I do split stuff out when it makes sense, but look at testing/next:
> 
> e02df7f4810 * testing/next MAINTAINERS: Cover python.docker with Python library section
> 4fcb3a8c07a * MAINTAINERS: Cover debian-tricore-cross.docker with TriCore section
> b554638aea6 * MAINTAINERS: Cover debian-xtensa-cross.docker with Xtensa section
> 8417a661600 * MAINTAINERS: Cover debian-loongarch-cross.docker with LoongArch section
> 0f57fbac5bc * MAINTAINERS: Fix docker/dockerfiles/debian-hexagon-cross.docker path
> 
> Maintainers updates aren't critical to get in now.
>

The more you wait, the more it might create conflicts. That's basic
software engineering, and where the term Continuous integration comes
from. It does not mean "run a GitLab pipeline", it means integrate
often, *continuously*, with low latency.

There has been concrete examples of why delaying created an issue in the
past. In the current series, "docker: Remove LegacyKeyValueFormat*"
basically blocks any other change in concerned files, as soon as it does
not land. At least those two could have been sent as soon as possible.

If you'd send a PR regularly (at least every week), it would be less a
problem. Miss the train? get the next one.

If you want a good analogy:
Problem is that your train is leaving at random time, and it has several
wagons, which increase the risk of a mechanical failure every time. As a
result, passengers are stuck waiting.

> f80f388a538 * gitlab: update issue template for binary test cases
> 4e7de923722 * gitlab: add MacOS 26 job on gitlab runner
> e0692ad4b23 * gitlab: add initial MacOS 15 on gitlab runner
> 1299b5aec2f * ci: drop cirrus MacOS build
> 
> None of these matter without bellow
> 
> dd2db9273be * accel/tcg: move jit thread manipulation into do_tb_phys_invalidate
> 
> b60553095bb * tests/Makefile.include: add binary dependency to run-tcg-tests-% rules
> bcde94b9315 * tests/Makefile.include: fix typo in comment
> 
> Why take the chance to break the build when the changes are in service
> of the wider patch? The more runs through the CI to shake out anything
> the better.
> 
>> If tooling is the limitation, please take a look to those (ugly) scripts
>> for inspiration. AI can probably rewrite this better than me in 10 min.
>> With this, sending a series or a PR is a complete no-op for me, I just
>> wait for CI to run, and send it when ready 2h later.
> 
> Tooling isn't the issue - but I'm never going to be doing multiple PRs a
> week because each one has a degree of latency due to CI coverage.
>

Sorry, but this sentence doesn't make any sense at all.
What is the "degree of latency due to CI coverage"?

CI takes less than 2 hours to run, you can run it 4 times within a
working day. 5 days a week. That's 20 chances to send a PR.
The only latency is human based, and a way to solve it is to automate.
Lack of tooling *is* the problem in this situation.

You can't take a lot of pride in automating things with AI, and claim
it's impossible to automate sending a series of patch and run a CI
pipeline from it. Use AI if you want, but please apply it everywhere
it's needed.

>> Saying "people have to accept my tempo" is not acceptable. Fix the
>> tooling instead.
> 
> I think it is fundamentally down to the maintainer what tempo they are
> happy and able to work at. If you wish to take on responsibility for more
> areas of the code base then be my guest.
>

There is a difference between being really busy and just adding latency
artificially because "I said so". We worked together, so I can make the
difference between the two.

I would be happy to help maintain any part that needs help. Maintaining
plugins was a suggestion that came from Richard, and yes, I was open to
do it for a long time, especially after experimenting weeks of latency
to see patches get merged, and this several times.

I stepped in for docs because we identified there was a need for it.
I also talked with you in private to help on linux-user and you
explicitly asked me to wait, without any specific reason. Now Helge is
maintaining it and doing an excellent job, I'm really glad he stepped in.

I would be happy to help co-maintain tests/tcg and help this move to
meson. Unfortunately, you snipped that part without even trying to
answer to my proposal of helping by making a small proof of concept.

Coming back to your proposal, do you wanna share maintainership on
tests/tcg/multiarch and tests/tcg?

>>
>> Regards,
>> Pierrick
> 


