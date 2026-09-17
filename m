Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87109C982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 17:01:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FSX-0002IB-06; Thu, 17 Sep 2026 12:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FRW-0001ky-NR
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:58:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FRL-00016q-SR
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:58:29 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HDj1Js2266096
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 16:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Oacd1iE438+BmbFXbn1PVh+ldeosxWdRmyHQ/KOmp9k=; b=mqWNRWn/k9D/8Riv
 +Qz7izhBL+2LJOJtLDCgdfgpFBHCIAvVgnZd4ptjRZja1NvrUwJC2jkSXDQ5rBs6
 2PeTMLDQaMii6U8XPXm0CTFnFO2vXxsanKZkhCfDhYzBE4FrDpODOTrV94BxncFR
 obNhY2zHUU/Z4IxpH1tc3dXeKkGCYv1q9t0oWd3UganqX/kZj5FsDbBErLtb8Tjn
 ynnBX3U203yVGr8wyzxeCKxJlgIArCxJJg4oovf3yiaOAwxMakHGpKrFfde0BRZg
 l7NZjxMGZe4sGQRtkAzaQ4fhROHXygeyHVrudc9poNcQc43ihD34ep806m2kQMi3
 IoaBJQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfpphfb5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 16:58:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cc52c77089bso114245a12.3
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789664305; x=1790269105; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Oacd1iE438+BmbFXbn1PVh+ldeosxWdRmyHQ/KOmp9k=;
 b=V7hS7v5UPKaW6+CL8z0FE5khn1ZyFHjlD5L675rFBecz6KGNwXsKVzbaM4dj0kllEq
 8+PLwiBYhto0ntGDOity1iI539Ios2zUsuefms3qSj8GiqTkXejbMe2Pwja3PXgx1eRQ
 itssjCRVeVrYl2Vjwbb2kVBHYwQSMAgHNII/8BYUIt6COnSeQOhsNr4V7JPKvic0MLhB
 fuszbKGbA7gNvGhhOTxaYVwOXcBmxpezQnnqgXSuV4TmsQofFiE6KWiVSFxgD/0d4IYN
 IIic4WymtVzSGQw4BdXXCs6WbVYOUala+KVChKouJ7zF6uPi+KE+uCRxyWsCH+N+8gKK
 FfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664305; x=1790269105;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Oacd1iE438+BmbFXbn1PVh+ldeosxWdRmyHQ/KOmp9k=;
 b=QkBeamu/dOO2xguXjYC6k66RnaUXdF8tv8SrNbo8L+nfuvAw7VmxSIFOIcfWypU7pX
 8cnp34lj37sTa7ifWpgkqpTCOSt2VyDmjmF2CCilQjQ2fd5IIlUblWKedB9mPFZBzpdj
 GzQGtvRdmJB+/3jZ5IYVzRWw6+ykc/PEjsoxu7LrfRMVsQxIneHHSnVwue06yfjKOTDG
 3auIpwAuOq/aADmUu7YfPcLwWznf9gECoip/n2X2/W6DFFL6DayzfLyTDgGjK+hj08SR
 eOksOWJCmvF07yN+hXaLc5rx3OOTuv0dnmx/q2yUwRCFtu0UP6AK6EWvdJv5JFp7xsRM
 3GBg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxION/LJTQCG38Wn3ZgDuAqwVMuTqz0lCVGa1140rWARl4NYhznJF40gV5y2qiz06ChO6zKeZl+NQ==@nongnu.org
X-Gm-Message-State: AFuF++lwXzMwvCFsMGfULT6kcSO/CAj/kcjV9IzK7RLftlCOkPAN62Hc
 4jB1JXJsTdnCS2cwxzX/8vmemTbT1FGpmW6OKfuTR9CGG0GKhYiCXTMW4CeHo93XmIYEPulQLbm
 u6nvhqoFDZriIaMlyWvFsTHc7lWWwt94kPXpAHR5I843/fM8UM9kE+Cw=
X-Gm-Gg: AYBFou3oAB6OAYgGjomNTkF/+/glirHHB3/LUoNKBmL9zjiGOMeLydDSmwsQEz31XJU
 /tCieScr6Zi9pPgajYVI2F7CkVCJ3IZ39YSzuBIZJiUcDNVoH0hxbyqWOGROR/BSJI2uoIbe+OD
 1WG7S1VS0jllI01gzqyVBorG3azUEUS23z8S/MzeiuR9rfNPG2VltQInJ4kVPLTp523KBbeMIHR
 A5z4YzarabpMqTTo5XYpGr8hRncuRO+gcoPMKhfBc5sejhg7dvQKUycLPgzbAJ4Q49vbWwAhxqD
 lhLBEnbFx7WmNDJIjihWomYNpA+NrKYd8rHCq/SbKOEGxvDPpMmRBrBKgYvzkEI7/FmwSt8ULQE
 buOahHCkv+Zy8/vPXCst5QSxkstABEz03IMmh76eL4IGSt9VMmqqDenqEI47f9yi04aEO
X-Received: by 2002:a05:6a21:1805:b0:3dd:85a8:cb81 with SMTP id
 adf61e73a8af0-3dd85a8d015mr2054081637.36.1789664305568; 
 Thu, 17 Sep 2026 09:58:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:1805:b0:3dd:85a8:cb81 with SMTP id
 adf61e73a8af0-3dd85a8d015mr2054028637.36.1789664305146; 
 Thu, 17 Sep 2026 09:58:25 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144c6f2384bsm3697290c88.13.2026.09.17.09.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 09:58:24 -0700 (PDT)
Message-ID: <0ba903cd-8a89-4ce8-a7b5-40ddddb19c94@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 09:58:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/19] Revert "tests/tcg/meson.build: implement
 ./configure containers options"
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-arm@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Song Gao <gaosong@loongson.cn>,
 Kyle Evans <kevans@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Brad Smith <brad@comstyle.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jared Rossi <jrossi@linux.ibm.com>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
 <20260916153013.2134555-4-alex.bennee@linaro.org>
 <ef0cab70-4f36-4de1-bfdb-18501d801728@oss.qualcomm.com>
 <87eces8by8.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87eces8by8.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VsZUv5khxmixfY99E7qECNRhn5XFjGjG
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac1c32 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8
 a=p0WdMEafAAAA:8 a=QpgUHPqvu-fO-wwmKeEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VsZUv5khxmixfY99E7qECNRhn5XFjGjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MSBTYWx0ZWRfXxvNoV+5B7xA9
 TxIPcQTRV89LX6tc4UosQ44cSG67swS+izCQU5ZnW7j8saEXqzZt0tjOND4PVYRWit8r4DYOUwp
 rynzEMik4BDqMEh5IBwK5++BbgeUX4eDBd0Fbz8ayCFSuvPMUl1kK2cplv60CME5cnnWfYYaor8
 H1v2N13DDylH0tAV/D4W8cdNtRQam1mPRJgQBIx645hirvDS1DCGabhXE3oN6An7EOGsQ5IV9UW
 BTRdXsQSYkD4F5RwaaGsyMq3ylakUD3t/Cv5OmZ4MjXOd5PiXsvONp5BsIY/V0QDZ5g3P7oZp3E
 FRKYiAupZE8vpM4/FcmK3Y+msmOiTn+M1G+3hDmBOocv9sdsxfmrddh1l4VnHokjXQvYElbx0FD
 U+ZeBiKISSdzzvMtt2MpQ0OzuLlqjTjIH/7cXVvr1KKm1uD5KzeChznvU8V5uQwY7RQCgaeW4xS
 N4AhOFL2dq5i0Qm8Igw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MSBTYWx0ZWRfX4+/yVF1xTaDF
 8jtAaxmo5/m7mheSBEvj5cVGL4MT8UwPCP9VUnUNWzN4MiKX3Lm++WfmHxt509dh1mJ3RqDgQOG
 bl+zw0uE7l0WyPCzbhgATjbAHPeWJPk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170241
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

On 9/17/2026 2:27 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 9/16/2026 8:29 AM, Alex Bennée wrote:
>>> We want to keep the container configuration inside configure for the
>>> firmware builds.
>>>
>>> This partially reverts commit 522b299ca4316d8cad57f9496ffcba87dcc20719
>>> while keeping the plumbing to disable containers within meson.
>>>
>>> Tested-by: Eric Farman <farman@linux.ibm.com>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> [AJB: untangle changes since]
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Tested-by: Jared Rossi <jrossi@linux.ibm.com>
>>>
>>> ---
>>> v4
>>>   - tweak revert to keep disable reported
>>>   - update commit msg
>>> ---
>>>  configure             | 14 ++++++++++----
>>>  meson_options.txt     |  3 +++
>>>  tests/tcg/meson.build |  3 +++
>>>  3 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/configure b/configure
>>> index bedde58b8cf..6084a7a065e 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -260,7 +260,7 @@ ninja=""
>>>  python=
>>>  download="enabled"
>>>  skip_meson=no
>>> -use_containers=""
>>> +use_containers="yes"
>>>  rust="disabled"
>>>  rust_target_triple=""
>>>  
>>> @@ -727,11 +727,14 @@ for opt do
>>>    ;;
>>>    --disable-plugins) plugins="no"
>>>    ;;
>>> -  --enable-containers) # enabled by default
>>> +  --enable-containers) use_containers="yes"
>>> +                       meson_option_add -Dcontainers=true
>>>    ;;
>>> -  --disable-containers) meson_option_add -Dcontainers=false
>>> +  --disable-containers) use_containers="no"
>>> +                        meson_option_add -Dcontainers=false
>>>    ;;
>>> -  --container-command=*) meson_option_add -Dcontainer_command="$optarg"
>>> +  --container-command=*) container_command="$optarg"
>>> +                         meson_option_add -Dcontainer_command="$optarg"
>>
>> Not sure if we want to keep this option (meson container_command).
>> Related if in tests/tcg/meson.build can be removed also.
> 
> We want Makefile.include and meson to use the same container runtime
> surely?
>

Agree. It seems like the general direction was "revert" everything, but
yes, I think it would be better to keep all meson options as they are
currently.

>>
>>>    ;;
>>>    --rust-target-triple=*) rust_target_triple="$optarg"
>>>    ;;
>>> @@ -1718,6 +1721,9 @@ echo all: >> $config_host_mak
>>>  
>>>  echo "SRC_PATH=$source_path" >> $config_host_mak
>>>  echo "TARGET_DIRS=$target_list" >> $config_host_mak
>>> +if test "$container_command" != ""; then
>>> +    echo "CONTAINER_COMMAND=$container_command" >> $config_host_mak
>>> +fi
>>>  echo "SUBDIRS=$subdirs" >> $config_host_mak
>>>  echo "PYTHON=$python" >> $config_host_mak
>>>  echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
>>> diff --git a/meson_options.txt b/meson_options.txt
>>> index 66d3689d14c..daf301ed48a 100644
>>> --- a/meson_options.txt
>>> +++ b/meson_options.txt
>>> @@ -389,6 +389,9 @@ option('rust', type: 'feature', value: 'disabled',
>>>         description: 'Rust support')
>>>  option('strict_rust_lints', type: 'boolean', value: false,
>>>         description: 'Enable stricter set of Rust warnings')
>>> +option('container_registry', type: 'string',
>>> +       value: 'registry.gitlab.com/qemu-project/qemu',
>>> +       description: 'container registry to cache from')
>>>  option('containers', type: 'boolean', value: true,
>>>         description: 'use containers to cross compile tcg tests')
>>>  option('container_command', type: 'string',
>>> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>>> index ce208e686ff..890da7b81e9 100644
>>> --- a/tests/tcg/meson.build
>>> +++ b/tests/tcg/meson.build
>>> @@ -101,6 +101,9 @@ if get_option('containers')
>>>    endif
>>>  endif
>>>  tcg_tests_summary += {'container command': container_command}
>>> +if get_option('container_registry') != ''
>>> +  tcg_tests_summary += {'container registry': get_option('container_registry')}
>>> +endif
>>>
>>
>> Rebase issue?
> 
> Possibly - it got messy with the reverts.
> 
>>
>>>  # plugins come first, as we need to build the list
>>>  test_plugins = {}
> 


