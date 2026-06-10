Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20EECD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 04:31:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXAaS-0003LJ-5E; Wed, 10 Jun 2026 00:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXAaR-0003Id-HF
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 00:30:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXAaP-0002m0-NG
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 00:30:43 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65A2epS64097253
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FsbnsAmrGdDSLyfZHaIg0YROp5C+4sPNWegaMb2XyXA=; b=VoaVtO/l4ZlEgAdj
 rbXvpwcrZfEDV/OG7pJo09Fm2f9zVcXU4afjvG3sLIZZ9Wuuosmv0rTYeozQfsHD
 zqg9F8jkNOuO1Bq6mzjqO+rjA237aB4+L2yX0i2cc1q+g9zbHPAV/6/WJd7+gPgr
 QmjSwJu6wrQCprKb37c/t6EgH6YnYScBznFlY5SlQ4inbjpR2fEecPVcD1kkL8RD
 L/92igNmYAbdAo9obYJr/8859rQB0OLS1lripWWyjFMF2ZCSYimsi2ABhrFRzH0u
 uCP9FXryNOYuW1V6FSY3VoSw4rRSXIkg2PTDz4AaLn0jFM+HSH5wEKY4vrAl0KIE
 MjRynA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jvw1n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:30:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304ea42b025so3620069eec.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781065839; x=1781670639; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FsbnsAmrGdDSLyfZHaIg0YROp5C+4sPNWegaMb2XyXA=;
 b=FrXZrlSVeiscMJLVS1/2zEjcvPygyEFAPYDjXcjg8u4xAbI4j6Y+bPu1EbvXbDwE1i
 SjxvyqKhUeQAYcX5oOR9XquDE/T2Lhm7As8uqXBTQwvJSXlsUINhW/wSkEuZ+g354Dt1
 ZZ3Qo7W4sdI+dIm2qEZesI2Z5peOozS1a8lzHspcZt8Myc7W6HSON5nay1RF75j5GGhy
 jWpuqeLdqq1Waczwh3vY/nWXCUAI4eSUkTkjBefsC4iLisoQOnxkVunBwBj4oywvoyOh
 DCgRDpza2cBgEZgsKws9R97PSPJkVzBj5XLO+x31nXPbE0cLlcU92jQDCY6xFHgyf7bu
 YNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781065839; x=1781670639;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FsbnsAmrGdDSLyfZHaIg0YROp5C+4sPNWegaMb2XyXA=;
 b=jFWEiFZAEsNtDEfdCnN0wKQS32Pi+aWjnzaHi8O9yrGPSgJZfizXWBYby8gC79VcfW
 2MIJXkFFI5Ew7cFMi2IqXsv6kQBIrPUG0fQ66D96tMpMAm0QTe8/ZjrtADRn89Wy7YXl
 HF8MmadfXlW7w8TrRX7rzgZTjy2fLfxBDcFRAWS4AdNwclpiLh5QBoLv8lZ5hM8T5tWf
 uXe1xVIZPHckExCFuCkqZniv3z4avY1MJoRVDks42VHgu1zmH1fWA4aAuDC3SBysOfhq
 gJug9wtqvJs+HnxaaOkDEf/jnrVjQdkLa/aYSFSMdWtK9TNhuxbHFIlbsM7tLpKWvXJb
 Xakw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/krGV6Vilk/BjhrqsCybf5v+QAdmMTShGF5dn+dETj9OZiuGNJ8ExCuPRR19Z/v98W480kK+8wkA==@nongnu.org
X-Gm-Message-State: AOJu0YwyvbXGSy5AxPfVe+n5yGRyVhgi5nlxFDMeRTpDB5BswPyBnj20
 yfn5wM50uxFuJ1OVQoCaRIe0LNsuUYeCVHqVxQUfvaG1cgUuLC8flCmX6Y9CIfCUIkKItpbIu9f
 8uEDftfqoCdGGoC0B0tlQsxGLxDV75NNSu/Ru2NkGals35hyMoBbcZg4=
X-Gm-Gg: Acq92OFY7FA48Wph+o9Sc5SsrnLKqH5n0RyrwDG0zG4YdahUPRgiAe9PU9TbqHHzhLh
 Ssts/fkFWxZRDm0/9amddUHih4f3w6wKfaZuo+j348l0TJFQmJ9ll2IkhrCQ1yYVz/tVl5rnkaZ
 dI16le4PNjooyfAtXOWHEp8+adwkhQC97/X3XF/OPfCXSyMbC49bIjnwSzh8a+2mVRTV5lZrROs
 ARo6JXE65cOcCjf9CAy+iSgtQg7eVAtDSr7bTbvZW55bByYxDACGHinUERqMj8sZ0WX15lhJLXX
 0lhqD7eXEpkV6eDRvnZJp/mfPz68blvo+nk9XNf+db3eodwy/A24Xkaq27iaRzRTW32uMBIwqWo
 5JaequX2a4PLqYHayhZlq1agO5iJwvpIWq74hA66bLUdtMwQeUYrRBTZYjqfUeyidjPh0wmmW1h
 8MgtcG70OoUkMU/DxXDUvTJ3vl
X-Received: by 2002:a05:7301:2528:b0:304:c9f1:a0e9 with SMTP id
 5a478bee46e88-3077fe53387mr7935357eec.9.1781065838749; 
 Tue, 09 Jun 2026 21:30:38 -0700 (PDT)
X-Received: by 2002:a05:7301:2528:b0:304:c9f1:a0e9 with SMTP id
 5a478bee46e88-3077fe53387mr7935322eec.9.1781065838132; 
 Tue, 09 Jun 2026 21:30:38 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074db85f60sm30220218eec.8.2026.06.09.21.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 21:30:37 -0700 (PDT)
Message-ID: <b7ab8f6e-7600-40ca-947f-e7e357055272@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 21:30:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/27] tests/tcg/meson.build: introduce expected_output
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-17-pierrick.bouvier@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609214745.772536-17-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qdTq-452bKII37CzeN52WHqLRGdQmuth
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28e86f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gkv9PmnZR7qlrPIspkMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAzOCBTYWx0ZWRfX6HCiJJkmgUII
 utdbOiDuThCnBtWavQBqFMEUNGjk+hciDjGw0munrjjkWuWVpJuTve6X2JWgYp9/A4DX8wTwRrs
 qdgjI0aA05Q4Z5VVG0jsYiDL0k8+FM2JXnZiLsFl6HdCq0PPoUXaG1xi53N7W9mmAxf+LPqnrju
 z8waLLo77UXe4Q6XupiQGBuAqwx20+HGmLOxcwxTnz989Bv4f+dbiZTInzxlkdsT0b2Z6vQ7YE3
 FHcBdDEP7bhDzRCXcL0YfKX2A1X/0miED3sYYkcVQK7lX7R7+RuxMP1OIfOVVvk0rgHnVqWeo8o
 zbN6v6Vg6NfM66legilc4WJxIsMiwHyaTQ5ceUocPvVYmxUd6N/Y/h9egRJ/fcH7w2FuLx1fwHp
 ohdOptnuNMVFpZoJFJOu/Ox9cX/WlbOth9r0Ruxn1QgS+LXh0s9WY88qZhkJ/n7fsHWX90BQpKw
 MS4ZUzGRZoDujYQs5EA==
X-Proofpoint-ORIG-GUID: qdTq-452bKII37CzeN52WHqLRGdQmuth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100038
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

On 6/9/2026 2:47 PM, Pierrick Bouvier wrote:
> A test can declare it expects a specific output on stdout. In this case,
> we compare it to a reference file. We implement this instead of relying
> on a wrapper because we need the flexibility to resolve name of
> reference file per target.
> 
> For instance, multiarch float tests expect different ref files for each
> target, which is something we can't express with a test wrapper.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>  tests/tcg/meson.build             |  9 ++++++++-
>  tests/tcg/scripts/run_and_diff.sh | 12 ++++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100755 tests/tcg/scripts/run_and_diff.sh
> 
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> index 5380a360830..3d2c0d6583b 100644
> --- a/tests/tcg/meson.build
> +++ b/tests/tcg/meson.build
> @@ -7,6 +7,7 @@ if config_host.has_key('GDB')
>  endif
>  gdb = find_program(gdb_progs, required: false)
>  prog_gdb_test = find_program('../guest-debug/run-test.py')
> +prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
>  
>  tcg_tests = {}
>  # tcg_tests is a dictionary with following structure:
> @@ -24,6 +25,7 @@ tcg_tests = {}
>  #           'test_name': ['provide an alternative test name'],
>  #           'cflags': ['cflags to compile test', ...],
>  #           'qemu_args': ['qemu command line flags', ...],
> +#           'expected_output': 'file_to_compare_output',
>  #           'gdb_test': ['gdb test args'],
>  #           'env_var': ['VAR=value', ...],
>  #           'wrapper': [program_to_launch_test, 'args'...],
> @@ -84,7 +86,7 @@ foreach target, plan: tcg_tests
>      foreach src, setup: t
>        # return a clear error if user mispell a setup entry
>        foreach key, _ : setup
> -        if key not in ['cflags', 'qemu_args', 'gdb_test',
> +        if key not in ['cflags', 'qemu_args', 'expected_output', 'gdb_test',
>                         'exe_name', 'test_name', 'env_var', 'plugin_test',
>                         'wrapper']
>            error('unknown tcg setup entry \'' + key + '\' for test ' + src)
> @@ -197,6 +199,11 @@ foreach target, plan: tcg_tests
>                ]
>        endif
>  
> +      if 'expected_output' in setup
> +        expected = files(folder / setup['expected_output'])
> +        cmd = [prog_run_and_diff, expected, cmd]
> +      endif
> +
>        if 'wrapper' in setup
>          cmd = [setup['wrapper'], cmd]
>        endif
> diff --git a/tests/tcg/scripts/run_and_diff.sh b/tests/tcg/scripts/run_and_diff.sh
> new file mode 100755
> index 00000000000..d1e9243c49d
> --- /dev/null
> +++ b/tests/tcg/scripts/run_and_diff.sh
> @@ -0,0 +1,12 @@
> +#!/usr/bin/env bash
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +set -euo pipefail
> +
> +if [ $# -lt 2 ]; then
> +    echo "run_and_diff: expected_output_file cmd [args]..." 1>&2
> +    exit 1
> +fi
> +expected="$1";shift
> +set -x
> +diff <("$@") $expected

Fixed this line, since it hides return code of program.
Write to a temporary file, then diff.

