Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C228CDE009
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 16:54:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcQrQ-0005EK-50; Wed, 24 Jun 2026 12:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wcQrI-0005CJ-9U
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 12:53:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wcQrG-0004GE-LD
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 12:53:52 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65OFfPmT3783992
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 16:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gEIQ7ENn1djtwoBCSLJXE+jNvmH9ks4+TKrsvcVYuYw=; b=YcH26/O7aOvIhlB0
 1wXPMvmsY2dypv/HlfCcoGS+0x/jfAj+JtCjSvqtrUy7OeYu0rknd5pRWoYAH3v6
 OXqyW6dpBlAQAXFx54JBDm7Qy4AKUISv9yduGARJJbEzUY0PaoEPSJdEVVETVVMg
 ZchpkndJ+roRw1u8m0H5KxcOLFlxi6pzLd8YG0V1GhrlCkWijQ+VoL9vmQTu2/nJ
 zjL5/DZAvqao3XjvMLgEfRjgWd+rbN2riTTCgl4e/cF4GqXQ40QKrJt6oWJXg474
 jDy4/YYiLSVDdRP8MdGFvcZKeOMVlSoZZ/WY3Ftj/yk03ZL9HLoytS8OG2abRTZf
 q1mbcA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g1m7k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 16:53:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30c0a27ad86so3070645eec.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782320027; x=1782924827; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gEIQ7ENn1djtwoBCSLJXE+jNvmH9ks4+TKrsvcVYuYw=;
 b=Tc/Q0bG2udLZhNhPZdew/qwD3K0f1k9WLMfaLiLbGsdDoTYbVwj5JrO7WJh0mbEkfS
 TNIkIFPuPvSOTViuyE0Sm5vWwKy80lz/rxl0Oa+pRkf2qsWes2jmdjXYWoYSb/Z/i+Tg
 V6BRWVD+Xdj5ThNhNW1GETMWrLSu5ShBAw0/kZjDl9ja+lste1JCMsr+5vbaCRyJVfma
 WGeZLiuHcBJt9J534fbbk8oZDU2KP8hcGG9uHn5Psxt00NztASZ4GX79uKPj2FeV1XSQ
 sSlfAlzJ8hDudhcBFkfckVDng7egrYc/QZR9MWHaFcP3vXrH01/e0aujE7dBV3g1GcFP
 WAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782320027; x=1782924827;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gEIQ7ENn1djtwoBCSLJXE+jNvmH9ks4+TKrsvcVYuYw=;
 b=XVXS9WMEUEBNJHVKn8Z9n6T4R2iGQZs7TYRLlDPKKESUz8HqTw65sOdU8MoAUeV0o2
 mr79u7vcAjZHRaeMXgBTiwOYPm3Hae9PLJjdlL17HSpUgGkrv/Wj7l5oTEjHLFE7udCt
 FQ51UMzjHJputytUeobplzaWUqrzzy217vh4fuX+DAnofRSBeP0hpglCz58zg+IgaL7X
 75Ub5EG9olk6JztDMqIllT217XXcseEivyOrIa8Ou8wEYDY0YKzPLgTej0neifWssJ8K
 pyuKPbz+Bi4fd2Zj9bqBCIx/Zcx8m1ZR4oZRFQVL5WXRArpiwxcK2NxcpXaLWuH6U0Ua
 uMsQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDS6JNhSpspbKimvFxwARw2In54UrkAIkQeb4hNolcR9ATl+viJg9zkHSWwXHKFKZVXkbgKQxCIQ==@nongnu.org
X-Gm-Message-State: AOJu0YwdHcCdUuCnxfj5jaN9/1Hm3t8EYeLflOpl2PjUAIN6Kbl64k5Z
 +X7BlEuAHtkWus3YLjZsWLJDqgVusvb5D2NZybcIcH//RTSYwXOr52Lu7h2q9PIA/fxhAhmbbiN
 3YZPOI9vpSuABLdIPhbdhT2+GM/Mb0aLW2ssekDSFGiPsZXoCyfL/rrQ=
X-Gm-Gg: AfdE7cmjSiiUwI22o6rWB5j7euM28JODsgHpralPTZ4Wc0OaY28RQ4FZjXRH+jarM/w
 tZTElyBEp+0CiiSM1Iw8nAB582+vUpy1tPQPof08730SzWV2mvEEnpIpLOeadUUhcM94Zrr7ymy
 4+2mL5b/LNOVKtYwhFO+3boqQbUGUV8DDdnf6PnOrsbq5iMwxkAoVD2Z/qMHjMEHxF5HWQaPEWg
 Mwq414RyWlm2/VebWpzuIbOBTT1mAhSE6nxLMkAmAUQxB7e03w7LYmAshbrOrFFyKy1X7PRJcVt
 IrdE8AzyEN+v9ijrsMplR34xt1w7r8Q9Oz3viMzBI/4dLDlMAe1JsYRGsxlRYzv9/xFN8o2evIO
 zfFBTmwUcJmg4rp5iMM16oTU+oZAeK9jxZx5mNCmLequ1rg6xAoD7QN58MhHhh8IKcAhNA0owv3
 GBPTI=
X-Received: by 2002:a05:7300:80cf:b0:30c:53bb:ca17 with SMTP id
 5a478bee46e88-30c6933d620mr3861733eec.23.1782320026803; 
 Wed, 24 Jun 2026 09:53:46 -0700 (PDT)
X-Received: by 2002:a05:7300:80cf:b0:30c:53bb:ca17 with SMTP id
 5a478bee46e88-30c6933d620mr3861703eec.23.1782320026116; 
 Wed, 24 Jun 2026 09:53:46 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c8b1ab6sm575666eec.15.2026.06.24.09.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 09:53:45 -0700 (PDT)
Message-ID: <992a7c14-498a-4690-9124-e29152479b75@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:53:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/27] tests/tcg: introduce meson.build
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-5-pierrick.bouvier@oss.qualcomm.com>
 <87v7b8j8ex.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87v7b8j8ex.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3c0b9b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=dkubAfGQyL6hyt8YLfAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: s-hppaBva5AUKoZOFbtv2uXC-mTQT1pA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE0MiBTYWx0ZWRfX8KpV4TICC2/e
 sSIuetAx92bwvxW4bBNoAovT/sFJxIXqN9ErXIDWXXwMppUUCzayP1Ng/OOYuDQR/DGuehlPA8T
 xV9OCi4meQB8kYET8aZZKlA33rlsZBRWM2iRTN+a5vIZ4GwRXOwJSMNb81fqrEGmRjOH9XnDBfF
 9d6QcHBCMCZ5uhc44KniAQkYGlKMLxPTIFVvdEg1qND19C3VkextolwujCoM4J2NNm9Qo+YM0XI
 YIMjoN1iN7Qnxi4KUQQGEGntvhSlJk8RFz5R1P6ys1NQRRwRio6V6/ObTBlZr8SvuO98ySYdSmM
 ApZL3lntNBkc7jD0Ld/K6zF/8pDrZdSk6hSLnBU92hnlvKHjhPgND5EbXUjvKpK7L87fcYiYvpp
 X7JY8SHi4lYp/yo914ZTV7sb0wasOA==
X-Proofpoint-GUID: s-hppaBva5AUKoZOFbtv2uXC-mTQT1pA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE0MiBTYWx0ZWRfXxMayHL5ikVNM
 23UDEfog1snCN/BftUWPwo7R1ZFKqOROKtYbprHTWT8RUqfIhzGsF/RNTVbTnkf56aFAfHc2Uya
 XvVQjf0UQgqkmLsjM25qz8zkPdsBALA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240142
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

On 6/24/2026 7:54 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> Every target declare its tests, and add them in global tcg_tests
>> dictionary, indexed by target name. See comment for full description.
>>
>> We make sure that if a user repeats a test several time it won't result
>> in duplicated executables or tests. In next commits, we'll introduce
>> what's needed to deal with that.
>>
>> A test is compiled from a single source file (and later, a single set of
>> compile flags). We make sure dependencies are correctly handled by
>> generating a depfile.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> ---
>>  tests/meson.build     |  2 +-
>>  tests/tcg/meson.build | 94 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 95 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/tcg/meson.build
>>
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 9ba04bbedd3..5877d2f60b1 100644
> <snip>
>> +
>> +      # build executable if needed
>> +      if exe_name not in built_tests
>> +        exe = custom_target(exe_name,
>> +                            input: file,
>> +                            command: [cc, '@INPUT@',
>> +                                      '-o', '@OUTPUT@', '-static',
>> +                                      '-MMD', '-MF', '@DEPFILE@',
>> +                                      '-Wall', '-Werror',
>> +                                      '-O0', '-g', '-fno-strict-aliasing',
>> +                                      ],
>> +                            depfile: exe_name + '.d',
>> +                            output: exe_name + '.test',
>> +                            build_by_default: false)
>> +        built_tests += {exe_name: exe}
>> +      endif
> 
> I noticed:
> 
>   ninja -v tests/tcg/aarch64-linux-user-sve-str.test
>   [1/1] /usr/lib/ccache/aarch64-linux-gnu-gcc ../../tests/tcg/aarch64/sve-str.c -o tests/tcg/aarch64-linux-user-sve-str.test -static -MMD -MF tests/tcg/aarch64-linux-user-sve-str.d -Wall -Werror -O0 -g -fno-strict-aliasing -march=armv8.1-a+sve -O1
> 
> and as the compiler parses the command line left to right it does the
> right thing, but perhaps a comment here to point out additional flags
> can be added.
>

This should be more clear after reading patch 7 which adds cflags at the
end of command line, as expected.

> Otherwise with your other fixes:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
> 
>> +
>> +      depends = []
>> +
>> +      exe = built_tests[exe_name]
>> +      cmd = [qemu, exe]
>> +
>> +      # some tests expect QEMU env var to be set
>> +      cmd = ['QEMU=' + qemu.full_path(), cmd]
>> +
>> +      test(test_name, env, args: cmd,
>> +           depends: depends,
>> +           suite: ['tcg', 'tcg-' + target])
>> +      added_tests += {test_name: true}
>> +    endforeach
>> +  endforeach
>> +endforeach
> 


