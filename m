Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBCF1067042
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 15:12:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0hi0-0004NK-MD; Thu, 12 Mar 2026 11:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1w0hhy-0004N0-Ag; Thu, 12 Mar 2026 11:12:18 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1w0hhw-0001ts-1M; Thu, 12 Mar 2026 11:12:18 -0400
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62CEJCPN2583633; Thu, 12 Mar 2026 15:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=e31NAt
 3gqmKIX2vVfXEPSn36cpkZcM6sm981JzqJhWo=; b=h7fSNn5VewUqq7i4El6wgm
 tAcczcYzXfn1EhVMNHyUjvFM4SMZlyAkRVV+xXUPHtxJhbLmEJSnLjku+B4Le7Ff
 1zd7WQN0e+vgvKTHHdH4Wv+tdXqKKrCgMrAjYBl08aSYqsLZswnsB8B9vD7BqGxl
 9ABY03mbqE+Hcmxht/dS+phzHjfsPf9se7WNW0uXW/lcotQKbYXhhRgNtPhCxIgA
 s8E9Kba5FOBVgiY3ulBOGdx9WttM1NLMh999pe5gUfONjOkvrg/6USaYHxj9lCMu
 awq4yxWPE6Z+RN5EdkhMaMK6F+rvO8bZxav0gWzlV6OQXzdsX8mzB6GmjTi5CIkw
 ==
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cuh94ubyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2026 15:12:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62CEYdHW025691;
 Thu, 12 Mar 2026 15:12:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cuha8ata0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2026 15:12:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 62CFC5SP44761432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2026 15:12:05 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 489742004B;
 Thu, 12 Mar 2026 15:12:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB2D020049;
 Thu, 12 Mar 2026 15:12:04 +0000 (GMT)
Received: from [0.0.0.0] (unknown [9.111.88.140])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 12 Mar 2026 15:12:04 +0000 (GMT)
Message-ID: <94e17bd5-e864-45eb-878b-2296d6188271@linux.ibm.com>
Date: Thu, 12 Mar 2026 16:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tests/docker: add gdb-multiarch to all-test-cross
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
 <20260306161728.2657486-2-alex.bennee@linaro.org>
 <78c8b024-6dd5-4f1b-a19c-c7a71c7acc9f@linaro.org>
 <7e6cdb4b-4cb8-4968-acce-56db2f0ee307@linaro.org>
 <97506340-18a4-4691-8017-110ab2fc76b8@linaro.org>
 <3c2bf09d-245c-4de7-b55d-37085ef24545@linaro.org>
 <c776bbc1-6021-45d0-a5ca-74e50d906f4f@linux.ibm.com>
 <1493fdd5-5254-4398-bb69-8c83eee8bef2@linaro.org>
 <CAPMQPEKPk1iySmCt0_Vi1=bcaG_ZkNfzYknCu14zzR2N7p-6zw@mail.gmail.com>
 <871phpi22y.fsf@draig.linaro.org>
Content-Language: en-US
From: Ilya Leoshkevich <iii@linux.ibm.com>
In-Reply-To: <871phpi22y.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QKtlhwLL c=1 sm=1 tr=0 ts=69b2d7c8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=p0WdMEafAAAA:8
 a=KKAkSRfTAAAA:8 a=lqaRWnj7802rhjxTwGMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX/k9+iMBiruAV
 NckpV9873mPJKEcYgs65kfe63e+lw+NvDTGzMrh3mcdft0Bz49SdUzI4fEe7oSxzwBLbA80LJ2s
 wXlLagLqgdzR8QZD0qf0lwzx2Z6z1xzb+W88LT3cccVHYhXuK0MIzQ71AhMt+Ct0Ujek+3VH9YI
 o7Ag2nUhPy08fmQUGyz47vSWpjTFH1HjtkPbDK39sWKzhkG2zuOVnoHz7qIhFqcif4nI/iq3to5
 1/QQCH878gAlWgx9UXiukuaHzvHVRWb8Qswq9xrE2DwLKCQKdFrSz88s29Zkd3H96LhEdkI8/cB
 06fI5wSCVHsDAxEBIa0fM8VrrTf4dtOGttjiPhEdd3YVP1rwNBcq9WIpHx/nUXFZJB9fG9KYrJF
 rbkqv9Osx/ymjKltcv3I4/cRuLO7kVa0X31GSWvYai+LIwqjNDYsRi5k1ysXX6MWs+sA774ltAA
 R2Lb7jOPjp3/NmXNndQ==
X-Proofpoint-ORIG-GUID: amJS6u2fXmEJbLvh98I_hpAniKdyZZ99
X-Proofpoint-GUID: amJS6u2fXmEJbLvh98I_hpAniKdyZZ99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120121
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


On 3/12/26 14:56, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>
>> On Thu, 12 Mar 2026 at 11:39, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>> On 12/3/26 11:11, Ilya Leoshkevich wrote:
>>>> On 3/11/26 00:28, Philippe Mathieu-Daudé wrote:
>>>>> On 11/3/26 00:22, Pierrick Bouvier wrote:
>>>>>> On 3/10/26 4:07 PM, Philippe Mathieu-Daudé wrote:
>>>>>>> On 10/3/26 23:33, Philippe Mathieu-Daudé wrote:
>>>>>>>> On 6/3/26 17:17, Alex Bennée wrote:
>>>>>>>>> This allows the gdb integration tests to be run as well.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>>>> ---
>>>>>>>>>     tests/docker/dockerfiles/debian-all-test-cross.docker | 1 +
>>>>>>>>>     tests/lcitool/refresh                                 | 1 +
>>>>>>>>>     2 files changed, 2 insertions(+)
>>>>>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>>> I'm getting:
>>>>>>>
>>>>>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>>>>>> address 0x45001fff
>>>>>>> Error occurred in Python: Cannot access memory at address 0x45001fff
>>>>>>> qemu-hppa: QEMU: Terminated via GDBstub
>>>>>>> make[1]: ***
>>>>>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>>>>>> run-gdbstub-prot-none] Error 1
>>>>>>> make[1]: *** Waiting for unfinished jobs....
>>>>>>> qemu-hppa: QEMU: Terminated via GDBstub
>>>>>>> warning: Could not load shared library symbols for linux-vdso32.so.1.
>>>>>>> Do you need "set solib-search-path" or "set sysroot"?
>>>>>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>>>>>> run-tcg-tests-hppa-linux-user] Error 2
>>>>>>>
>>>>>> To add more information, we tested it on GitHub, our machines and
>>>>>> GitLab, and for an unknown reason, it only fails on GitLab runners.
>>>>> Also we tested on our local Linux machines, where this test pass
>>>>> for all our targets ;)
>>>>>
>>>>>> Which is unfortunate since it is where QEMU run its CI.
>>>>>>
>>>>>> Regards,
>>>>>> Pierrick
>>>> FWIW it passes on my laptop as well.
>>>>
>>>> Does this test fail only for hppa, or for other architectures as well?
>>> Have a look at these job failures:
>>> https://gitlab.com/philmd/qemu/-/pipelines/2376819801
>>>
>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>> address 0x7e085b4b1fff
>>> Error occurred in Python: Cannot access memory at address 0x7e085b4b1fff
>>> qemu-aarch64: QEMU: Terminated via GDBstub
>>> make[1]: ***
>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>> run-gdbstub-prot-none] Error 1
>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>> run-tcg-tests-aarch64-linux-user] Error 2
>>>
>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>> address 0x40802fff
>>> Error occurred in Python: Cannot access memory at address 0x40802fff
>>> qemu-arm: QEMU: Terminated via GDBstub
>>> make[1]: ***
>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>> run-gdbstub-prot-none] Error 1
>>> make[1]: *** Waiting for unfinished jobs....
>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>> run-tcg-tests-arm-linux-user] Error 2
>>>
>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>> address 0x45001fff
>>> Error occurred in Python: Cannot access memory at address 0x45001fff
>>> qemu-hppa: QEMU: Terminated via GDBstub
>>> make[1]: ***
>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>> run-gdbstub-prot-none] Error 1
>>> make[1]: *** Waiting for unfinished jobs....
>>> qemu-hppa: QEMU: Terminated via GDBstub
>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>> run-tcg-tests-hppa-linux-user] Error 2
>>>
>>> Python Exception <class 'gdb.MemoryError'>: Cannot access memory at
>>> address 0x7d742025efff
>>> Error occurred in Python: Cannot access memory at address 0x7d742025efff
>>> qemu-alpha: QEMU: Terminated via GDBstub
>>> make[1]: ***
>>> [/builds/philmd/qemu/tests/tcg/multiarch/Makefile.target:121:
>>> run-gdbstub-prot-none] Error 1
>>> make: *** [/builds/philmd/qemu/tests/Makefile.include:66:
>>> run-tcg-tests-alpha-linux-user] Error 2
>>>
>>> So at least Alpha / ARM / Aarch64 / HPPA.
>>>
>>> (I haven't checked whether the test is run for other targets).
>>>
>>> We also run these on GitHub runners where the tests pass, and apparently
>>> when running on k8s private runner on GitLab they also pass. The problem
>>> is with public runner on GitLab.
>> Also another test we ran was to pull GitLab docker image and run the same
>> tests locally within that GitLab-generated image and they passed. So we
>> believe the issue is related to some container restriction with
>> GitLab.
> Most likely because the ptrace settings are tighter - ptrace is the
> mechanism we use to access the memory we can't normally.


I thought about this, but then probe_proc_self_mem() that guards the 
test would fail.

I don't think cpu_memory_rw_debug() does anything in addition to what we 
probe for.


[...]


