Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC234CAC5B8
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 18:09:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v2CsL-00049e-Ky; Fri, 26 Sep 2025 14:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v2CsH-00048P-E7
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 14:08:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v2Cs9-0004pf-7m
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 14:08:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-780292fcf62so1970010b3a.0
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758910118; x=1759514918; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8JcLycoO1lSHWStAilne7Mz1b/F0Ltls0w2ntFWmrbQ=;
 b=h2B0Hc5YY9Gv3MIAEWB2rS4GYgB/fSeylblaSznTrusKDsQy9OQrB7pweJthQu0tFk
 tS3dPx4MvKZz2j42a65MiYMuffzmqQfkuRKydtbsGRhLKZcQUGMdZSJPDwihEaYCzJcD
 8QTBCXpM8ISi+hMKkkj218JMreZE9XjTE1oUNCKGO7dfnKrIOiTE2TGjtFzTPGoTL1bh
 lZ22X63slmAwMc3vuPJ0g/vVNa2lEcifH+uMWiRmBACD/ZsCGt/QHGef6/sMg4RNsiIf
 KKlbqUuYi4/kfihLfbVgju9qglpuUgga6vvXRLX9NWhIsk0J/+wNVn4XAKTX+/o+4LKa
 uUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758910118; x=1759514918;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8JcLycoO1lSHWStAilne7Mz1b/F0Ltls0w2ntFWmrbQ=;
 b=JicYQXwu4g/J+pMpRjajwQtWh1sOc/AWFvqFX2Y9APRekDoc2teGUT1v5xCK/HCUyb
 3QC/ckUq9zg2+3YuUjx8EWs+qcL7kwNj/3rfb2fOu+HV5ZYvG793UfXS2tDDAh3EGfL8
 w+K93Q14eaCnpXP4a0orfOm+tuwIRYkWKeJaLlhMtswVM4J5S1V2XvtBugJQRu+fo/nq
 Hs/vSfRCBWVBsIorwWzbHX1ugJt3zOlJ7TpB/eTzKiopAT9asBuEfRAtKs4hp3jKOum5
 O175pTrqF8EI11tfA+L9zr1hkV+QO63+TbeoZwCR4SHH5HPbYlNI3L+m8XdmoW0oTiSO
 cCdg==
X-Gm-Message-State: AOJu0Yxibb6hE5Jau6v63JAPi7Ed8MQPTRQW4WyPGj54RwyHQQ3/iQBE
 6j6ThNjWJrtcSuNPxU5PXHiH4JNauw1ZG5I36+W+cGzJGSin6qWKdB6l6qDWkUAu4VY=
X-Gm-Gg: ASbGncsR3Cz0rmRaVras4tdOJwF/hEo9FAIonyWg18gfFou5QsDVmiqIcyyxeVH8ET+
 iXBAxcUAD7eJWdcSrkaZ0APnjjisUCJjZotZ1bHETaLCzuDH/475oYCQlczr1Aj6Sym2gmnbypR
 GKMensJZEAs0l0mMpQH6ZI/gFNzOETadOIODDfM3viSHKPTX4dIxz5bmL+HtoRXmEeQbt1idtxN
 S4B39TFUfOSkWeqwBF0RgTsl4wpbkDfAsSB6Qp6SO8K40dVQe0bDBqrlErQ82jakneV+T3kcsXM
 Ac1DC6mAkS3SGqUit7dSx2OMVRmhjZ3z3ECgZMwY1LEHsdRjkcWrR061gxSKmHPXuH+U4x/igMB
 eI35xQYBzXRgGTUZtDBOyYk/sVwCntBqW3zJsS+atACiVZNkzgHb17iDZi96oe4Sl7YebsSkqiv
 DqDktzg6fLRA==
X-Google-Smtp-Source: AGHT+IHRBtYO8iojq1hnBjXKKAfChvwNEaO51o2Aa9J/APsdNoOMuXbrRuYPQguIU2Vy7XAQQ+TOnQ==
X-Received: by 2002:a05:6a20:6a1c:b0:262:52de:c577 with SMTP id
 adf61e73a8af0-2e7ce91f433mr9593532637.34.1758910117830; 
 Fri, 26 Sep 2025 11:08:37 -0700 (PDT)
Received: from [192.168.0.102] (189-47-45-49.dsl.telesp.net.br. [189.47.45.49])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102c06ff4sm4823126b3a.86.2025.09.26.11.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 11:08:37 -0700 (PDT)
Message-ID: <bd906237-c0fb-4921-a017-a591bc95f31f@linaro.org>
Date: Fri, 26 Sep 2025 15:08:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] tests/functional: Provide GDB to the functional
 tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <20250926051542.104432-4-gustavo.romero@linaro.org>
 <a9118adc-f9ac-4df0-8e60-4407945a5908@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <a9118adc-f9ac-4df0-8e60-4407945a5908@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x431.google.com
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

Hi Thomas,

On 9/26/25 07:03, Thomas Huth wrote:
> On 26/09/2025 07.15, Gustavo Romero wrote:
>> The probe of GDB is done in 'configure' and the full path is passed to
>> meson.build via the -Dgdb=option.
>>
>> Because a single functional test can cover different arches, such as
>> aarch64, ppc64, and x86_64, only a GDB that supports all the arches in
>> the target list is passed to Meson for use in the functional tests. To
>> handle this check, a new shell function, is_target_arch_in_arch_list, is
>> introduced in 'configure'.
>>
>> Meson then can pass the location of GDB to the test via an environment
>> variable: QEMU_TEST_GDB.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   configure                     | 21 +++++++++++++++++++++
>>   meson_options.txt             |  2 ++
>>   scripts/meson-buildoptions.sh |  2 ++
>>   tests/functional/meson.build  |  6 ++++++
>>   4 files changed, 31 insertions(+)
>>
>> diff --git a/configure b/configure
>> index 0f7eb95586..20e05d233f 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1142,12 +1142,31 @@ fi
>>   #########################################
>>   # gdb test
>> +# Check if all target arches are in a provided list of arches.
>> +is_target_arch_in_arch_list() {
>> +    arch_list=$1
>> +    for target in $target_list; do
>> +        arch=${target%%-*}
>> +        if test "${arch_list#*$arch}" = "$arch_list"; then
>> +            # Target arch not in arch list
>> +            return 1
>> +        fi
>> +    done
>> +    return 0
>> +}
>> +
>>   if test -n "$gdb_bin"; then
>>       gdb_version_string=$($gdb_bin --version | head -n 1)
>>       # Extract last field in the version string
>>       gdb_version=${gdb_version_string##* }
>>       if version_ge $gdb_version 9.1; then
>>           gdb_arches=$($python "$source_path/scripts/probe-gdb-support.py" $gdb_bin)
>> +
>> +    if is_target_arch_in_arch_list "$gdb_arches"; then
> 
> No TABs, please!
> 
>> +            gdb_multiarch="yes"
>> +        else
>> +            gdb_multiarch=""
>> +    fi
> 
> This unfortunately does not work with the GDB from Fedora - it only supports "arch64_be arm riscv64 riscv32 ppc i386 s390x ppc64 aarch64 ppc64le x86_64", but if you configured a target like "alpha-softmmu", this breaks.

argh! ok


> (BTW, does the gdb-multiarch from Debian/Ubuntu really also support exotic QEMU targets like tricore?)

No, I've checked GDB upstream and I can't see any trace of tricore.
And I just saw that Alex left a comment in scripts/probe-gdb-support.py
saying "# no tricore in upstream gdb", so nope, it seems that it still holds.


> I think it would be better to drop this hunk, and rather check in the spot where we use GDB if the required target is really there (i.e. in the functional test that uses it).

OK. I'm also not a big fan of doing it in bash. How do you suggest
to do it? Directly in the code, via a skipIf decorator, or something else?


Cheers,
Gustavo

