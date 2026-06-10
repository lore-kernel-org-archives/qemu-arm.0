Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E190CD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 04:31:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXAal-0003hV-HZ; Wed, 10 Jun 2026 00:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXAai-0003cz-Gd
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 00:31:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXAag-0002nl-P8
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 00:31:00 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65A45HsA387485
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6ZImE8N06i2S1Plg+kyyqMxqsTsihjutW98h0fYXwBk=; b=E5mL+C+OWbT6Sx17
 g8iXfctA0d6j+R26nDJSlmRf5BxfnvYvCIUjHGA8UCVIwRLGQ5hFEB5xDxcDBkCL
 MJNjjOlYb6ccUuNAVXj72q5ZhSpS+L0fi/dvF3DynGKm9ZEgqg3cAAJoaNICXcjP
 5fIW1AgkX2QMeVx6qc4mwFsJk2c5ukHkhA7PrviNvG3mWF8ZwP9gSfM3xctRGFFS
 6nM2eQ4xwkkbQ7C6HhqJ5wrnm38byZp5Y+nl+DraVgmqXcpngza4smI8bEK/Qfyi
 YXhdt0/+ZqRMRciQ8waUsDzlut9qa3dtZN/xs4/q2z+/BwFmMDAKNlS2dYFCGgRs
 8ChBsQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd824b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:30:57 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-13815e0e6baso6190395c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781065856; x=1781670656; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ZImE8N06i2S1Plg+kyyqMxqsTsihjutW98h0fYXwBk=;
 b=EtLhpdb4+mIXBlad3L8W02V9opxMIWwJ1KF44I+8daRVFotc4TUbKOLjvRZC1RjoKD
 GuRZt7nnF/nEzw28TueSjhRny/qL+2iFHuTrd8PhC0zFqWU8qsxYcXn2rqGd1Vc+gSHI
 LLm2qHTO86HDe2yM4Iuwk8dgAdVviGsAUoxzC1H17l+GGmlXylioQjxC3p/R3qsEj09D
 bw7pLltkJvHPqSuvi4Wrz8ZkiEmfHSHKTq3efqTHwBIbpoWO7F4WgvcYPeQxTUEuxagp
 qgQKF1Yw/6gl3RBPrqvsFZ3Dqv75oiU7kTD6ltaGapyupizGtC9EMW2SpUBZPg7RFhPI
 rCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781065856; x=1781670656;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ZImE8N06i2S1Plg+kyyqMxqsTsihjutW98h0fYXwBk=;
 b=ksz1sLoKI+JLJD5ks1HrcTlIIa5L5SbN8oGhTdq8Q0Zc8dqAgHZFHxdnbkFb4SuKS8
 OgBW4hJTaebiWnJhjiqK2hPxnVsBnvp/2QhJPQ2hW08/IWXVWiGoeWkoHGxjJzkBzWvA
 OnOdNn98uHN17v2xg9Zd4yWI2j+AoZxcHEseq7lU2W814YUOZz3pgSh4LkiVNOO00u6f
 oYEwjvRfxxLFnezJ82MUXmfINBeTfvTc76FF7g/vJZshl4HVAULBlIQE1JYmyQY2V2Wv
 caDvxYfOpZeUpRAPYhCbp+7sVVDq88bOZYGopb8MqJSp9hxLAfkwMaqDs9Dsvm4Lyis5
 cA5Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7OsYcF4vkhVbXPU3gcs+Z2/KR7DVY78cbTxBpR4NOIUZM5o49FWbQ2ZOipojZwXtl3V5u57EM2w==@nongnu.org
X-Gm-Message-State: AOJu0YxamBRAEmC3TkEsRSTRsSIc+x7zA9G0HerD2Hm+OGDtjXThIJPb
 /S7Tj7xUFih4uNUBjXk/wbuXsrMcAhhterXhYZs2IKmcT4VnFKNoHMYdeCUnlq8RQ9WOHw6ygRF
 2iaWy97dVv86JNFRUkcg8muoOo7/z2GX9GJ/zSAb2+AxfrgwTqrzaG/Q=
X-Gm-Gg: Acq92OEonln0TQU74UrFOWW4g4Bh1reyIfKuBF88BN5o1Jj9ZxG0VSVjYj8j1qK9lNY
 /WW2R4dRbqZfaRb8lkfMHTqA1w7Cec8620Ff8kRBMGyfCmGXx2v5uj++ZzE28aPKtyS4AGfPkxf
 z7Tjgn6Uwgg9v+lRUhLn4qLzcpFGR9Oa5yN8c5vl6Kx/cQs5Zcq+FnS7ZgaQPB9iWgUvqs/fS9y
 6mxNlvkuJWzpShhW/vitGI8z/O66R899ayd6vsnC6ir2SlaMcCq5nvopzgOPkLec7RAzCnHPrc7
 bPBA7BQv9s7ldVFJ7MXZTBmwf5TnfET/7GRdl+b5c1uwM054hU0K0Fxa/AjtRdyzrX/EBne09ta
 IHgoPDVHFA4S81CNwCQdzXVTl2muImoizmsMHvZc/zyC1ilMsT5nfvTD0h0KunppnnWBqgzqUis
 2x6wXGPjfjtzoCuygHxLlEdEYS
X-Received: by 2002:a05:7022:2394:b0:137:f58c:3cb5 with SMTP id
 a92af1059eb24-1380670bcf3mr12753084c88.26.1781065856359; 
 Tue, 09 Jun 2026 21:30:56 -0700 (PDT)
X-Received: by 2002:a05:7022:2394:b0:137:f58c:3cb5 with SMTP id
 a92af1059eb24-1380670bcf3mr12753055c88.26.1781065855749; 
 Tue, 09 Jun 2026 21:30:55 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13828ae3944sm6545303c88.15.2026.06.09.21.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 21:30:55 -0700 (PDT)
Message-ID: <b057c468-6492-4234-b787-a8dd55c9d8a9@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 21:30:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/27] tests/tcg: introduce meson.build
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
 <20260609214745.772536-5-pierrick.bouvier@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609214745.772536-5-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a28e881 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Cgd41AiofdOoD-_YhTcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: dkmDPviDk9V5jlMNGTpXUDquseZcE7I0
X-Proofpoint-ORIG-GUID: dkmDPviDk9V5jlMNGTpXUDquseZcE7I0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAzOCBTYWx0ZWRfX4fOVyYXeRnT8
 s66evWACAIfmcilGF5PrsI9zxbCvw02kesb2aK6mIiFMjEen1PQi8bDelTn+A8Z7uv+IwZc3bqs
 TEasQxxaRXCy7bchwEiQeRWCuwblkDETYs/wnoIId+piMi7gYetJ7nIJpPqqA3e5vnd9lzV4b0W
 99RKQm76vLc1eKhMrSXXnxOv7U9rptAU1a5YjY5o0V25rn1XkrthbrlqXSjVHrPu1hFsXTfDNTF
 lhcpca2R5jXE+c5MXpijKw6r3Vi5WoqsORFK12hHKkcADgnxdnEmVpUyvvyiS7vXSvL7NscizBT
 5kzQPAgrfJ/kwAxSXDGUNMkyAyS+1nRgD3m9Mn+jtQLMfHhGN7plT9XUSf5QdKRt6kmoLu1t4Vb
 /zYZuYAXa/e9QltAYvwYdM299eY+V4Jp1p8jL8UoASBze2RmAqWOlxSh0XeQE9Nq+4Az1H0+4B3
 elwRYxFUkdcxXZnLkgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100038
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

On 6/9/2026 2:47 PM, Pierrick Bouvier wrote:
> Every target declare its tests, and add them in global tcg_tests
> dictionary, indexed by target name. See comment for full description.
> 
> We make sure that if a user repeats a test several time it won't result
> in duplicated executables or tests. In next commits, we'll introduce
> what's needed to deal with that.
> 
> A test is compiled from a single source file (and later, a single set of
> compile flags). We make sure dependencies are correctly handled by
> generating a depfile.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>  tests/meson.build     |  2 +-
>  tests/tcg/meson.build | 94 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/meson.build
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 9ba04bbedd3..5877d2f60b1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -74,7 +74,7 @@ subdir('decode')
>  
>  if 'CONFIG_TCG' in config_all_accel
>    subdir('fp')
> -  subdir('tcg/plugins')
> +  subdir('tcg')
>  endif
>  
>  subdir('audio')
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> new file mode 100644
> index 00000000000..72d1a9f8986
> --- /dev/null
> +++ b/tests/tcg/meson.build
> @@ -0,0 +1,94 @@
> +env = find_program('env')
> +
> +tcg_tests = {}
> +# tcg_tests is a dictionary with following structure:
> +#
> +# {
> +#   'name_of_target': {
> +#     'cc': cross_compiler,
> +#     'folder': 'folder_for_test_src_files',
> +#     'qemu': emulators['qemu-...'],
> +#     'tests': [
> +#       {
> +#         'src_file': {
> +#         }
> +#       },
> +#       ...
> +#     ]
> +#   }
> +# }
> +#
> +# Every test executable, is built only once.
> +# Tests for a given src use the same executable by default, and their definition
> +# is guaranteed to be unique also.
> +# Default name is derived from src.
> +
> +# plugins come first, as we need to build the list
> +subdir('plugins')
> +
> +# Finally, we can create all test executables and test targets
> +foreach target, plan: tcg_tests
> +  # Detect duplicated executables/tests, and report an error to force user to
> +  # choose how to deal with it.
> +  built_tests = {}
> +  added_tests = {}
> +
> +  # return a clear error if user mispell a target entry
> +  foreach key, _ : plan
> +    if key not in ['cc', 'folder', 'qemu', 'tests']
> +      error('unknown tcg test plan entry \'' + key + '\' for target ' + target)
> +    endif
> +  endforeach
> +
> +  cc = plan['cc']
> +  folder = plan['folder']
> +  qemu = plan['qemu']
> +  tests = plan['tests']
> +
> +  foreach t : tests
> +    foreach src, setup: t
> +      # meson '/' operator drops left operand if right is an absolute path
> +      src = folder / src
> +      file = files(src)
> +      test = fs.name(file)

dead variable, removed.

> +      exe_name = fs.stem(src)
> +
> +      exe_name = target + '-' + exe_name
> +      test_name = exe_name
> +
> +      if test_name in added_tests
> +        error('test ' + test_name + ' was already added: ' +
> +              'specify a different \'test_name\'')
> +      endif
> +
> +      # build executable if needed
> +      if exe_name not in built_tests
> +        exe = custom_target(exe_name,
> +                            input: file,
> +                            command: [cc, '@INPUT@',
> +                                      '-o', '@OUTPUT@', '-static',
> +                                      '-MMD', '-MF', '@DEPFILE@',
> +                                      '-Wall', '-Werror',
> +                                      '-O0', '-g', '-fno-strict-aliasing',
> +                                      ],
> +                            depfile: exe_name + '.d',
> +                            output: exe_name + '.test',
> +                            build_by_default: false)
> +        built_tests += {exe_name: exe}
> +      endif
> +
> +      depends = []
> +
> +      exe = built_tests[exe_name]
> +      cmd = [qemu, exe]
> +
> +      # some tests expect QEMU env var to be set
> +      cmd = ['QEMU=' + qemu.full_path(), cmd]
> +
> +      test(test_name, env, args: cmd,
> +           depends: depends,
> +           suite: ['tcg', 'tcg-' + target])
> +      added_tests += {test_name: true}
> +    endforeach
> +  endforeach
> +endforeach


