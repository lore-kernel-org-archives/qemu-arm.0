Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362D9CD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 07:28:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXDLu-0000ZV-8l; Wed, 10 Jun 2026 03:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXDLt-0000ZC-H5
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:27:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXDLr-00010g-QZ
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:27:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490b9318997so46828615e9.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781076470; x=1781681270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=elJndy2TyNtLhLr7Izvr6doyPdLBoYWJDsuDI/BM7z8=;
 b=AJsgfhWbtBtBafuKQLTAoOhoK0DgXnXrssf9Mj6y+IAhSGpU4lSbEjwiPIPNr0JDof
 a/QRXzXYs6jwYHbYT+8YEImIMZHumTOCkBGVCvf0X6p+AzVnp5oh5uzlejmNIh7rpvzz
 iS3I4GZiXLgSgPEfWbJZcJAFtO5REtdqKmuX472CEaFuL7Cbn5wf2dE6tEsg3rki9+JM
 DoirOljGBCcYV9S5YP0ckHpYcGpbYo/Amx0UW3eFknVoJm2GWxRXjm2x7Ax1i2+ossVu
 768rc2IbB8RLgad9H/9gsa+WkN62uFjTZqOKkWgEVrWTlYrgsmoZ8ylQtDV87P3bcYl6
 GgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781076470; x=1781681270;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=elJndy2TyNtLhLr7Izvr6doyPdLBoYWJDsuDI/BM7z8=;
 b=sjXab7+6v8VXIY4OdppJ1qI7kxrVtHUl5V2DzLbDAHey8CmSiqxqpYDmXY9ft6yI4O
 2f3NM5MR4qI6FASMrAn8f6KVWl5ROzskaktiEZaGv6V9+3pcMVHt8KZ4e8keh8glh6to
 XGJ/DBHo4wdgMaHQ4MIzjCwNwX61xxBA82l6sSUkdC+YAIrLlsGJ28YSWSJav8SedMIX
 mcbpdKvW90+ye+K63/JZ1WkXx62J8wi8p/HXiokxEAh3eHfe6PqY/l8IfKUynUZdZGPc
 3EX37BlBZwTauV+mHllXzeUP4nNkoA24QuufibbkP3laGJkobFU2+1om1HG1pD3vsyFp
 hJJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cpeGpp5ePnRyhyq2WE4x8LkrAI2qskW+GhNkPkE9pYDkuEkX3Hw77AZVza5ZPYVvbSlzxm9xA3w==@nongnu.org
X-Gm-Message-State: AOJu0YwIkHdxZ3QI5SXLTvsrZt6ntEQo4xeQwrRyecF/IKssvaLKC5uQ
 q302RGFHv8wNOk6sKZRbFdyxVE+nMEMJgCJKE51TsSkN00KnAhrSg3yHC2Tvp46Y/Co=
X-Gm-Gg: Acq92OEaYFr9P6BgxhBQgGPmsh3HqDVt+6u4WvLj2SnEdDh2/ENVQD8o6mEKLBtahjB
 8MA+hjyMZbp5r2+yMSfr/ULgBOg+8M2MTvPwgJ2Y3tKaqBnw1iW+uvP+iZ/rEW8i5lBeiC4AXUa
 e7+WqlXWJMRxzEoqQCqmVsgu5+jUau1xoGFQHpnaW9c5a9C7PLCReoPlEqoAEVEQ2a2sBRY+dat
 +JdKnhqAozSrIHdlYUwo+pKSIpsDEMq8RoLjetWWvE4VqBBx2L3e3LP+EhqLRGCfXEaPivJql75
 kxvnV1oCdzw7J/CX5RGD0jJKYlxX76qowg3nPx4mu0zKvI6SwLOxT+afnbypibIwOkfXAQlRBsf
 B9NHFg4DYLqnm4FusnMl75Bem36JqvNZBr5DOufcFG/pUuN4QqTYnEPwejxZTiMOLMeE+cVQGrG
 BINjujh+LtcSYu4yaMTr+kpJhdt8S3QP8+JkInTUzv2DhBmCyjcAsPrj5cGr6cLBU9EOIcW42Od
 N+QwGU46qs7fsTae2vLpl3B6M2+pABpL5n1ezk7/OfNzFiJrrKWPtfakYXjWG/CvHoLMpZN0EU=
X-Received: by 2002:a05:600c:46d2:b0:490:b645:3213 with SMTP id
 5b1f17b1804b1-490c25f17ecmr401283115e9.19.1781076469934; 
 Wed, 10 Jun 2026 00:27:49 -0700 (PDT)
Received: from meli-email.org (ppp-2-86-144-251.home.otenet.gr. [2.86.144.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3918d7sm507812965e9.2.2026.06.10.00.27.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2026 00:27:49 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:25:43 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Daniel P . Berrang=?UTF-8?B?w6k=?=" <berrange@redhat.com>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 16/27] tests/tcg/meson.build: introduce expected_output
User-Agent: meli/0.8.13
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-17-pierrick.bouvier@oss.qualcomm.com>
 <b7ab8f6e-7600-40ca-947f-e7e357055272@oss.qualcomm.com>
In-Reply-To: <b7ab8f6e-7600-40ca-947f-e7e357055272@oss.qualcomm.com>
Message-ID: <tgenec.cusd1nl68lj9@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, 10 Jun 2026 07:30, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> wrote:
>On 6/9/2026 2:47 PM, Pierrick Bouvier wrote:
>> A test can declare it expects a specific output on stdout. In this case,
>> we compare it to a reference file. We implement this instead of relying
>> on a wrapper because we need the flexibility to resolve name of
>> reference file per target.
>> 
>> For instance, multiarch float tests expect different ref files for each
>> target, which is something we can't express with a test wrapper.
>> 
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> ---
>>  tests/tcg/meson.build             |  9 ++++++++-
>>  tests/tcg/scripts/run_and_diff.sh | 12 ++++++++++++
>>  2 files changed, 20 insertions(+), 1 deletion(-)
>>  create mode 100755 tests/tcg/scripts/run_and_diff.sh
>> 
>> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>> index 5380a360830..3d2c0d6583b 100644
>> --- a/tests/tcg/meson.build
>> +++ b/tests/tcg/meson.build
>> @@ -7,6 +7,7 @@ if config_host.has_key('GDB')
>>  endif
>>  gdb = find_program(gdb_progs, required: false)
>>  prog_gdb_test = find_program('../guest-debug/run-test.py')
>> +prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
>>  
>>  tcg_tests = {}
>>  # tcg_tests is a dictionary with following structure:
>> @@ -24,6 +25,7 @@ tcg_tests = {}
>>  #           'test_name': ['provide an alternative test name'],
>>  #           'cflags': ['cflags to compile test', ...],
>>  #           'qemu_args': ['qemu command line flags', ...],
>> +#           'expected_output': 'file_to_compare_output',
>>  #           'gdb_test': ['gdb test args'],
>>  #           'env_var': ['VAR=value', ...],
>>  #           'wrapper': [program_to_launch_test, 'args'...],
>> @@ -84,7 +86,7 @@ foreach target, plan: tcg_tests
>>      foreach src, setup: t
>>        # return a clear error if user mispell a setup entry
>>        foreach key, _ : setup
>> -        if key not in ['cflags', 'qemu_args', 'gdb_test',
>> +        if key not in ['cflags', 'qemu_args', 'expected_output', 'gdb_test',
>>                         'exe_name', 'test_name', 'env_var', 'plugin_test',
>>                         'wrapper']
>>            error('unknown tcg setup entry \'' + key + '\' for test ' + src)
>> @@ -197,6 +199,11 @@ foreach target, plan: tcg_tests
>>                ]
>>        endif
>>  
>> +      if 'expected_output' in setup
>> +        expected = files(folder / setup['expected_output'])
>> +        cmd = [prog_run_and_diff, expected, cmd]
>> +      endif
>> +
>>        if 'wrapper' in setup
>>          cmd = [setup['wrapper'], cmd]
>>        endif
>> diff --git a/tests/tcg/scripts/run_and_diff.sh b/tests/tcg/scripts/run_and_diff.sh
>> new file mode 100755
>> index 00000000000..d1e9243c49d
>> --- /dev/null
>> +++ b/tests/tcg/scripts/run_and_diff.sh
>> @@ -0,0 +1,12 @@
>> +#!/usr/bin/env bash
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +set -euo pipefail
>> +
>> +if [ $# -lt 2 ]; then
>> +    echo "run_and_diff: expected_output_file cmd [args]..." 1>&2
>> +    exit 1
>> +fi
>> +expected="$1";shift
>> +set -x
>> +diff <("$@") $expected
>
>Fixed this line, since it hides return code of program.
>Write to a temporary file, then diff.

Also, consider if using #!/bin/sh is possible, since it's universally 
portable.


