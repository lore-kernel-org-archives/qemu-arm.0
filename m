Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3011CD98C7
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 18:40:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXNqW-0004nH-U6; Wed, 10 Jun 2026 14:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXNqU-0004du-4y
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:40:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXNqR-0003zG-Ry
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:40:09 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65AFxJme1670922
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 18:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rgJuudJJ3h3f46ppjCm3V15d8HmyFlPifhJNxucGFYo=; b=J5oOuABLelzmCa+r
 AKFcsVsCnqRyIoABrtmzMtzbGV60jIEygT6CN8u6QRKzd+zSitmzxwmv6awc+YmR
 ZbzcgEl+qJSeae0FFOEyrKDKbF5GSjr62YTQH+TtcL3ZPmi4DbjVNm67f8ACuxic
 dCyE0RbAfswLh6XFLRsRIuf8Zi7p6+1xF2BbYgEBZMh3ReFAuSecVZN3iUiRVDoH
 HPG/HWk3X5cUgu0Y1R73fKABIcvtQwNSJAONLIGmD4ICd1sbfu9KQdH0fVKqeMDw
 StqgiVJSAJEBph6cYdExeuKyfAmwk8cqsNJpKKrZvM8Jl/wj31NOBByu4ZGv/5G+
 g62jOg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1udpt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 18:40:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-138156c0492so8505010c88.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781116805; x=1781721605; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rgJuudJJ3h3f46ppjCm3V15d8HmyFlPifhJNxucGFYo=;
 b=GhKbmo6x89aVfn//AE4rybNlCRX1hGLRzbNBXoKqoEPimZC9dTT4qFu3ruB6j4KXC5
 xmPgOK4/nrMxTPj+GW/3ww56HrFeTnzO+43N2lIBY2eeocOtsC7K4gXHr/eGZgrIcl18
 qPepvkD8IH4qCkwl7Git3hdBYuoRJOilZS4gM7Er7FK0N59/GcBvqvwSP2PXtafekTwa
 wHDmMCh1Dupp0dIMUuXFbX9D6ZJmij9jGjoX7K9WGRQ/VMmIxreqsnm2PfPjbpbY9SuJ
 TcmrmOStpZjSVs0Xdj+gj6/eMySYqCsjo6P/rJW0EWE2UG7gQP9+Vnf/9VOvosScVogw
 QVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781116805; x=1781721605;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rgJuudJJ3h3f46ppjCm3V15d8HmyFlPifhJNxucGFYo=;
 b=dMZirxIKdDPpxoV00H+ppCF4fSvNv1scxZmXhcl9aZw2eiPVjps/cnsAKpLFQE4/1u
 psPon6TJMLO+TBrBaR/Ac+l/thp+/PFExkIlr7eFUzUefolWXf7p0rHenjE8MBoyWNCo
 fpINHm1ccabU5FKo/IkCMb0HX0L4zceB7mOGKxWYu25c2Q5zeASplV8IBZOO0Icw4G6b
 HlIir4quHgwxhe79RVyiBuiJeRrMyyoIsDRCGdRXQIxHeRt/QfuXn2bdOGvAY9ruWbyR
 /uhorAl0bgcP8QnwKM6tA4Dh/3I8CwFAGJ9w7+HseS5xX4GAVsFh2AAqDdVi+cYEcyKe
 /1iQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mlRc8ISX8oALt2wcWIHbLWT/asO59ZEOMwxS1PcQ0UiAM9HuyjS1Z7/CDZUrWGHiM4s+cTjCCiw==@nongnu.org
X-Gm-Message-State: AOJu0YwWegtTLoa9rO00UiRSL7JE7zugTLTuED+JNqnZefCHrIE3A7He
 Cn/YCMfyrVSCRMaqi3Ul2ueYkX9UQBHiU6Tw5TNwXuBf+A+00Dg3i3ZaV8VY47KL5ZFTlJvviYF
 il0R5rdzZiKuQ7UenEXqwinR8cSXzO+8Sr0O5zryFg2QCg/q2XYoDIu4=
X-Gm-Gg: Acq92OFerq0L99rTuLjRASyluNTcaIR4FooSl1OQHtZrJVNhYoHRCkBwSX9DmdvqIvt
 DJz3xHEAQG3QjwwT5kSXZnAjaS+rpKvqOgZOb1HgR2J5SOSbwNnYVZRB5x/gvaeU9T5He/VRo8E
 DRz4isMKfO2JoYcWnKybaiIQ1dmIrc5AiAr5R0K/08cy5WlgAbN0PKLdOkozAmJjweg5LlmM6cw
 bI8dnqKx8aI+K6R/nxsscQ0hq/Mz3NCGq6Z5PL8M8x2gCxHIcGYCanaV8QlrvJRmB1S8BLOEseo
 ByxRKKcPDSUmNo4gNTnt7QGEV+ZXonMvE0xUePc7hHD7N1d7QNh9NfBIhH9hOITrzYgAomVoX3N
 vBQ+R5dN0wAF97mkexHrq0JgmN6e9WpUSqzWt6WyQpGftIvFNcaD8h+o5NuC8f6BQeskmPbULZT
 mcf3BMUtG6Cc31t0JFL6MacN3h
X-Received: by 2002:a05:7300:8ba3:b0:304:5644:f97a with SMTP id
 5a478bee46e88-307ff5f79e4mr248116eec.21.1781116804621; 
 Wed, 10 Jun 2026 11:40:04 -0700 (PDT)
X-Received: by 2002:a05:7300:8ba3:b0:304:5644:f97a with SMTP id
 5a478bee46e88-307ff5f79e4mr248090eec.21.1781116804072; 
 Wed, 10 Jun 2026 11:40:04 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074df77a0asm28483425eec.27.2026.06.10.11.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 11:40:03 -0700 (PDT)
Message-ID: <af320c95-e1af-4a8b-bbee-3763cc619808@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:40:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/27] tests/tcg/meson.build: introduce expected_output
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud_=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn_=C3=A9_e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-17-pierrick.bouvier@oss.qualcomm.com>
 <b7ab8f6e-7600-40ca-947f-e7e357055272@oss.qualcomm.com>
 <tgenec.cusd1nl68lj9@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tgenec.cusd1nl68lj9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE3NiBTYWx0ZWRfX+CVYkXjKM3yJ
 +FuCyrq060fL1RcgRYvovapHtJ0yonQsV670jBUFC+RaseMi7XBbi/usI/GiVCQ1byfLg+jCOqU
 6NmNk/z3lWT2PczDL0SBeFK/pxWD1UejrHao0Oyn0mR6TUhgS2j8r1SlflQORjAm/PFhhH5w93P
 OVwaGDSVIZHoptfHhvrTqqC4o6uSlNAhM/C1B7tIlNy3rRKNakXleiYix+9exsGHDiNc5nRQhq3
 1ws4jfKULCZQl8h3AxX4NXsUAPlxhBK6SzKzYEfjxRDx0wNIpbZCdFqUS8YaNw1SjLk206jjiLg
 ZUSNHHzRHIxbtiaguhnP/qscx3KIjRbm7kN+DauJ43l14ydImL9OYO+HayHStSJFNCok/z4N23l
 mNejv7PUtW6sfjNepXQ59IANIu7rh8MR1uBAmkY7JLzEQm7hImHezrLLOZtJZ8HBRVYERO75dRT
 vVug90j0qNdnMsFIdrw==
X-Proofpoint-GUID: QRHhtqujhl5aAjfg0Wx6PUvL0vRckqUN
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a29af85 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vtDBMp4bDa5AtHrscMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: QRHhtqujhl5aAjfg0Wx6PUvL0vRckqUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100176
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

On 6/10/2026 12:25 AM, Manos Pitsidianakis wrote:
> On Wed, 10 Jun 2026 07:30, Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>> On 6/9/2026 2:47 PM, Pierrick Bouvier wrote:
>>> A test can declare it expects a specific output on stdout. In this case,
>>> we compare it to a reference file. We implement this instead of relying
>>> on a wrapper because we need the flexibility to resolve name of
>>> reference file per target.
>>>
>>> For instance, multiarch float tests expect different ref files for each
>>> target, which is something we can't express with a test wrapper.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>> ---
>>>  tests/tcg/meson.build             |  9 ++++++++-
>>>  tests/tcg/scripts/run_and_diff.sh | 12 ++++++++++++
>>>  2 files changed, 20 insertions(+), 1 deletion(-)
>>>  create mode 100755 tests/tcg/scripts/run_and_diff.sh
>>>
>>> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>>> index 5380a360830..3d2c0d6583b 100644
>>> --- a/tests/tcg/meson.build
>>> +++ b/tests/tcg/meson.build
>>> @@ -7,6 +7,7 @@ if config_host.has_key('GDB')
>>>  endif
>>>  gdb = find_program(gdb_progs, required: false)
>>>  prog_gdb_test = find_program('../guest-debug/run-test.py')
>>> +prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
>>>  
>>>  tcg_tests = {}
>>>  # tcg_tests is a dictionary with following structure:
>>> @@ -24,6 +25,7 @@ tcg_tests = {}
>>>  #           'test_name': ['provide an alternative test name'],
>>>  #           'cflags': ['cflags to compile test', ...],
>>>  #           'qemu_args': ['qemu command line flags', ...],
>>> +#           'expected_output': 'file_to_compare_output',
>>>  #           'gdb_test': ['gdb test args'],
>>>  #           'env_var': ['VAR=value', ...],
>>>  #           'wrapper': [program_to_launch_test, 'args'...],
>>> @@ -84,7 +86,7 @@ foreach target, plan: tcg_tests
>>>      foreach src, setup: t
>>>        # return a clear error if user mispell a setup entry
>>>        foreach key, _ : setup
>>> -        if key not in ['cflags', 'qemu_args', 'gdb_test',
>>> +        if key not in ['cflags', 'qemu_args', 'expected_output',
>>> 'gdb_test',
>>>                         'exe_name', 'test_name', 'env_var',
>>> 'plugin_test',
>>>                         'wrapper']
>>>            error('unknown tcg setup entry \'' + key + '\' for test '
>>> + src)
>>> @@ -197,6 +199,11 @@ foreach target, plan: tcg_tests
>>>                ]
>>>        endif
>>>  
>>> +      if 'expected_output' in setup
>>> +        expected = files(folder / setup['expected_output'])
>>> +        cmd = [prog_run_and_diff, expected, cmd]
>>> +      endif
>>> +
>>>        if 'wrapper' in setup
>>>          cmd = [setup['wrapper'], cmd]
>>>        endif
>>> diff --git a/tests/tcg/scripts/run_and_diff.sh b/tests/tcg/scripts/
>>> run_and_diff.sh
>>> new file mode 100755
>>> index 00000000000..d1e9243c49d
>>> --- /dev/null
>>> +++ b/tests/tcg/scripts/run_and_diff.sh
>>> @@ -0,0 +1,12 @@
>>> +#!/usr/bin/env bash
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +set -euo pipefail
>>> +
>>> +if [ $# -lt 2 ]; then
>>> +    echo "run_and_diff: expected_output_file cmd [args]..." 1>&2
>>> +    exit 1
>>> +fi
>>> +expected="$1";shift
>>> +set -x
>>> +diff <("$@") $expected
>>
>> Fixed this line, since it hides return code of program.
>> Write to a temporary file, then diff.
> 
> Also, consider if using #!/bin/sh is possible, since it's universally
> portable.
> 

Probably will move this to python instead.
sh does not have equivalent for set -euo pipefail.

