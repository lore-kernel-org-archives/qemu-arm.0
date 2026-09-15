Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DC5C88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 17:50:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6XIB-0004t6-3P; Tue, 15 Sep 2026 13:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6XI9-0004sY-Hl
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 13:50:01 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6XI6-0002ec-Uq
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 13:50:01 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68FGXUDl3576976
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 17:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rfHKThWM88KH58HWx9K+NlPRj8d8zOLmzbnt/AkRfrs=; b=VLQgs/mHiZ2XNpKp
 unGTdC7WuL+GG5zIywX/iWVVOivQFkAxn2yRHIS4MKKz5sVqdD/ySPzhVie49YzR
 iTxoNqH9QoVHeMb1HhGlFFDqwZbv7LxplmofcRBOG6A9KNiYW1XfqLs8UB0Nzhww
 eikf2AkvZi41mdqlN18j5928KVCavLfoFkZiqk/BckSnB7m+NvUsOncjPL3Dz3ep
 TfG0wmTDMp51GL7siFFFTLkLrvbxqQbVj9NsVxV5i1wwZmY+7giDMQdVDlb29ljj
 3pW7Z44MQdMLPGSest93NDnLn8qDKdff3dnGhbBVC422PpPAvfOBSnjX8uBhXExg
 p8At5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n60dv9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 17:49:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3965ba1ba3eso5822638a91.2
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789494590; x=1790099390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rfHKThWM88KH58HWx9K+NlPRj8d8zOLmzbnt/AkRfrs=;
 b=JBLPlVgMayVrsjs5E8XMW6Nf1nu5v+f8f0OKh2rtEFB4n2mq35RwtR9DoLb18bxTX9
 NRBwKpwJMDn3kTzntTVvv6u2LFVdzJPgS6SQp0pGGGPaubrgzh1B6KBboKS0+kltDr5c
 i798ML+qybOGLjVZwhIS3e6W4peRwv0xx+QqZiFgthTQIWgwsClDhAmibpkfPDIrUzdX
 BuVVgC3fzPofpz6KZnsMzV14Vs6ovb4YLKa3Aq3+853Odd51zN0QaHEEhlt7w4jjc9c9
 hyv5WZrl3oOdgNo/InviHZ1tIuFIlacMFpy+0nosGABCEaDMRYHhzgsl3urFvo97IUbU
 Y8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789494590; x=1790099390;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rfHKThWM88KH58HWx9K+NlPRj8d8zOLmzbnt/AkRfrs=;
 b=NAPGM3pSJcn+jhpA6AVevXuINWgEC1Nzs46TNafR1fM2rIJmiohr40rCKxSqlyeD1h
 Z+XxoHFwZqD23Wzw0SFw4jSu6G7A+Unfoeu0TUKhVE6RUEpFKkJ+0lX5zs3tZul7p109
 ed3qNmQRMBFaLqkMbSBC/dHFLa5p4sfDcBStEVr1TzAFfOyORwBwAQ+JYVgmJMkKjvKv
 rcqM+wqQ3E3+NCTsQ292bchR41PxuibRlStZC9Cgn810w44IFgl7i8aUMADIyE0oh1rf
 DBBp+bg8/GAP/D/OJNw9L6kYjFFfyLLAqjYRVS91ZEeXbuSitBTUaLxWxaEjM633f3gw
 jI6w==
X-Forwarded-Encrypted: i=1;
 AKwUvByqY41qmRYAUFeM5AFYDDc5aEKxcWMj4Q9K5Wz/o9H0KKByEFPsLH93o6iYWLG234ejW7kiHbaccA==@nongnu.org
X-Gm-Message-State: AFuF++nRXOkE0LZe4D1jMSA8sSWYtDUM0de/Vg9PWlDv1SdcOEBw+eOf
 tknFX3mRTLPiEHdwFIfDUV6BWEy2rR5tD1ACFxJz+2UqREiCB1u/jNbuum9hZQHHZydq+g/WxJA
 5AhWQUcVEAm6whOvaIBVOfg9cJS7qXLqSEG8751CGNVcD6oS/DNeDGr8=
X-Gm-Gg: AYBFou1o8hJlEmpajjk7LRPvnELtIrWoX9GYI1nylMj2usi2Ujy/9gm7Ul3U8sK0kz/
 pW/Ka2lRD5867lAWFDRktB97zbl+ILEjFd9vjHSzno2meetYXR7b6llsA3G8ao1iYynSiO+4JwV
 YwJ0vW6Esf71ZHIaDUYNImhlg5egSDg9HraGP+4IJK4Wj7WbMRUVtrS/L1GgXaBhgj8W7+9wqD4
 IDqeikAijNVRJpeUoXazq5FoB08wL3iUwj1DkrrqOJEur7u9Wrq/2KnCyFhHyBE5TtoGEQc9RWr
 zK5f7igMWn0wKk863YUZWTc8Sms2d/0oHiz/2gXfAHp2fQOSgVWJrcSV23C3Mx9bhhqsEaypWPi
 rRzBk4z2x+CQPVNOky2QRTfiKOMo4JkFm3cXYmE8zm6SPEW3Ph28yNbaNEftPE4SITG8J
X-Received: by 2002:a17:90b:3883:b0:398:a486:81ec with SMTP id
 98e67ed59e1d1-39debfb91b9mr14822557a91.11.1789494589747; 
 Tue, 15 Sep 2026 10:49:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3883:b0:398:a486:81ec with SMTP id
 98e67ed59e1d1-39debfb91b9mr14822496a91.11.1789494589216; 
 Tue, 15 Sep 2026 10:49:49 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14395d5d0f3sm296305c88.12.2026.09.15.10.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 10:49:48 -0700 (PDT)
Message-ID: <700467b2-f9a9-4192-aaeb-bcd3dd0dc6b7@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:49:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] tests/docker: add container registry to configure and
 use
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Brad Smith <brad@comstyle.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Brian Cain <brian.cain@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
 <20260910181504.1010916-6-alex.bennee@linaro.org>
 <abacad10-b9af-4a39-93c9-14b882f60bea@oss.qualcomm.com>
 <87qziw1ebt.fsf@draig.linaro.org>
 <9999cc6c-04e4-4507-beb0-5856bf614333@oss.qualcomm.com>
 <87zexia19c.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87zexia19c.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa98543 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=p0WdMEafAAAA:8 a=7yyM_NBgSiweAe7c2_4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1NyBTYWx0ZWRfX1hRljmEqO4tb
 TPu9G0vxKcUJjPHdorVrscfDUv/4koaTpYnSF/1wgg4/P6q+SmmeO3R97ni1tSSbWxtDDOhQroC
 caW9NOWtrsCaPYgMlor7SAXYw9GiBAf+R+Zvscoyd4ubtXrvyQaP+Quq9CKS8psV9M5Qo9aDrQP
 R0QhjLsxO9jcCC3A+ozAi9tothqcW0vflyODA78fwvMbaIONzBYFh9AOBKzeIBQVMun8Y32WQl/
 eMPGdOWy1cQT6SDAsnp4t8dH645gWP7FTCAbJXz0paeKd3nGSQ2Hxl35VVkKI1/oMwb/VyAaRXQ
 A63Nb2o1jYsd7IkpcZADxdNIIz0xxOgP3r5+MUqlG4TriKeQl3D08sn//KoYkKvrUhD7+onP8cu
 DMBDXLf5inIvMqLRu/GnSdynI836oA7idp3eb1Bh16GzeAPHFzwsNEH5X6WCLGlpQlcyhEIzyuD
 82peFUs41Dl9OD/O7oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1NyBTYWx0ZWRfXwfaWhQQdYn9X
 eno4Ly6MExSH9+KoMOcO+HuEWwHKQ3ErtAMy27+WZ85ckLUsmFk1W/+DD2xHPirObAils3kPVaV
 5R7gF7zMIQFRVLLyL3Wgaf/sv/qmyY0=
X-Proofpoint-GUID: w6mbxJxzkWwN1wcgL28EFDbK-AcneVVR
X-Proofpoint-ORIG-GUID: w6mbxJxzkWwN1wcgL28EFDbK-AcneVVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150257
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

On 9/15/2026 10:10 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 9/14/2026 12:28 AM, Alex Bennée wrote:
>>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>>
>>>> On 9/10/26 11:15 AM, Alex Bennée wrote:
>>>>> Previously we had the default baked into Makefile.include but as the
>>>>> meson container logic will also benefit from it we update the configure
>>>>> machinery.
>>>>> For now we allow direct make invocations to override but for the
>>>>> normal case it is in one place now.
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> ---
>>>>>   configure                     | 8 ++++++++
>>>>>   meson_options.txt             | 3 +++
>>>>>   tests/docker/Makefile.include | 4 +---
>>>>>   tests/tcg/meson.build         | 6 ++++++
>>>>>   4 files changed, 18 insertions(+), 3 deletions(-)
>>>>> diff --git a/configure b/configure
>>>>> index aaa41fe47aa..7d6b11ddd35 100755
>>>>> --- a/configure
>>>>> +++ b/configure
>>>>> @@ -172,6 +172,7 @@ fi
>>>>>   # some defaults, based on the host environment
>>>>>     # default parameters
>>>>> +container_registry="registry.gitlab.com/qemu-project/qemu"
>>>>>   cpu=""
>>>>>   cross_compile="no"
>>>>>   cross_prefix=""
>>>>> @@ -728,6 +729,9 @@ for opt do
>>>>>     ;;
>>>>>     --container-command=*) meson_option_add -Dcontainer_command="$optarg"
>>>>>     ;;
>>>>> +  --container-registry=*) container_registry="$optarg"
>>>>> +                          meson_option_add -Dcontainer_registry="$optarg"
>>>>> +  ;;
>>>>>     --rust-target-triple=*) rust_target_triple="$optarg"
>>>>>     ;;
>>>>>     --gdb=*) meson_option_add -Dgdb="$optarg"
>>>>> @@ -862,6 +866,7 @@ Advanced options (experts only):
>>>>>     --cpu=CPU                Build for host CPU [$cpu]
>>>>>     --disable-containers     don't use containers for cross-building
>>>>>     --container-command=CMD  which container command to use [autodetect]
>>>>> +  --container-registry=URL which container registry to cache from [$container_registry]
>>>>>     --gdb=GDB-path           gdb to use for gdbstub tests [autodetect]
>>>>>     --wasm64-32bit-address-limit Restrict wasm64 address space to 32-bit (default
>>>>>                                  is to use the whole 64-bit range).
>>>>> @@ -1318,6 +1323,9 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
>>>>>   echo "MESON=$meson" >> $config_host_mak
>>>>>   echo "NINJA=$ninja" >> $config_host_mak
>>>>>   echo "EXESUF=$EXESUF" >> $config_host_mak
>>>>> +if test -n "$container_registry"; then
>>>>> +  echo "DOCKER_DEFAULT_REGISTRY=$container_registry" >> $config_host_mak
>>>>> +fi
>>>>>   if test "$default_targets" = "yes"; then
>>>>>     echo "CONFIG_DEFAULT_TARGETS=y" >> $config_host_mak
>>>>>   fi
>>>>> diff --git a/meson_options.txt b/meson_options.txt
>>>>> index 292625af08a..030231492e1 100644
>>>>> --- a/meson_options.txt
>>>>> +++ b/meson_options.txt
>>>>> @@ -391,6 +391,9 @@ option('containers', type: 'boolean', value: true,
>>>>>          description: 'use containers to cross compile tcg tests')
>>>>>   option('container_command', type: 'string',
>>>>>          description: 'command to build/run containers')
>>>>> +option('container_registry', type: 'string',
>>>>> +       value: 'registry.gitlab.com/qemu-project/qemu',
>>>>> +       description: 'container registry to cache from')
>>>>>     option('tcg_tests_cross_cc_aarch64', type: 'string',
>>>>>          description: 'cc for aarch64 tcg tests')
>>>>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
>>>>> index 0adddb6a5c6..74bf471f171 100644
>>>>> --- a/tests/docker/Makefile.include
>>>>> +++ b/tests/docker/Makefile.include
>>>>> @@ -11,9 +11,7 @@ USER = $(if $(NOUSER),,$(shell id -un))
>>>>>   UID = $(if $(NOUSER),,$(shell id -u))
>>>>>     DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
>>>>> -ifeq ($(HOST_ARCH),x86_64)
>>>>> -DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
>>>>> -endif
>>>>> +DOCKER_DEFAULT_REGISTRY ?= registry.gitlab.com/qemu-project/qemu
>>>>>   DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
>>>>>
>>>>
>>>> Couldn't we read the default from config_host_mak generated by
>>>> configure instead?
>>>>
>>>>>   CONTAINER_COMMAND ?= $(shell $(SRC_PATH)/tests/docker/docker.py probe)
>>>>> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>>>>> index 814f2f8cd8c..22157a47c96 100644
>>>>> --- a/tests/tcg/meson.build
>>>>> +++ b/tests/tcg/meson.build
>>>>> @@ -101,6 +101,9 @@ if get_option('containers')
>>>>>     endif
>>>>>   endif
>>>>>   tcg_tests_summary += {'container command': container_command}
>>>>> +if get_option('container_registry') != ''
>>>>> +  tcg_tests_summary += {'container registry': get_option('container_registry')}
>>>>> +endif
>>>>>     # plugins come first, as we need to build the list
>>>>>   test_plugins = {}
>>>>> @@ -257,6 +260,9 @@ foreach target, plan: tcg_tests
>>>>>       if cc_dockerfile not in image_targets and has_docker
>>>>>         cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', 'qemu/' + cc_dockerfile,
>>>>>                '--add-current-user']
>>>>> +      if get_option('container_registry') != ''
>>>>> +        cmd += ['--registry', get_option('container_registry')]
>>>>> +      endif
>>>>>         t = custom_target(image_name, command: cmd,
>>>>>                           build_by_default: false,
>>>>>                           output: 'no_output_' + image_name)
>>>>
>>>> Do user benefit from this, or is it mostly for CI need?
>>>
>>> The aim is for faster image builds because the CI registry should always
>>> be up to date. Most of the time the images don't change.
>>>
>>
>> Ok. In this case, you need to add --timestamp 0 (that's enough in what I
>> tested) to original build command that generates those layers from our
>> CI, and use it here also. Else --cache-from does not work as intended
>> and you'll see have some duplication because timestamp is part of hash
>> for each layer.
>>
>> See this guide for more info:
>> https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/building_running_and_managing_containers/introduction-to-reproducible-container-builds
> 
> Hmm is that a podman only option?
>

Yes, indeed.
Portable option seems to be: --build-arg SOURCE_DATE_EPOCH=0.

You can experiment with this using a personal registry (like dockerhub).

1. Build an image with:
--cache-to myregistry --build-arg SOURCE_DATE_EPOCH=0.
2. Then purge image and all its layers.
3. Rebuild it using:
--cache-from myregistry --build-arg SOURCE_DATE_EPOCH=0.
=> You should observe that all layers are effectively cached.

See a concrete example here:
original build:
https://github.com/p-b-o/qemu-ci/actions/runs/34837577836/job/103954828254#step:4:3170
cached build:
https://github.com/p-b-o/qemu-ci/actions/runs/34806642832/job/103859733976#step:6:9

Disclaimer: I exclusively use podman (for years), so not sure if docker
has its own idiosyncrasies on top.

>>>> The effect is to use --cache-from $registry, which I'm not sure is
>>>> what we want by default, given all the "caching issues" we had
>>>> previously with dockerfiles already.
>>>> If that's for CI, maybe it could simply set with --container-command
>>>> in our CI only.
>>>>
>>>> Regards,
>>>> Pierrick
>>>
> 


