Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C66C982C1
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 16:42:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6sha-00056e-VI; Wed, 16 Sep 2026 12:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6shU-00055Q-KS
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:41:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6shT-00089w-13
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 12:41:36 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeUvg2432261
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QPIcqHLGQkoBqqtFI+RW2+Mg899vm81Tfuyu45hPkDA=; b=OUAxTw5wN554FLWS
 8/FKI478BDat8gLVcHvQhhKZpq713cCC+jsA7xoy7HF1WDe/8Kp3k0WqzC0qPKkc
 V7RLn9+W8dR9BXi2qS4Zg2bVxBgx9wI6KGwuGNrZgUg93l9rRbieT68hOg+j1Ine
 5SKpo0A39uiDvsc2dimuF/Y4vt8PskdL/xdkfP7hGN/e856Z0wurT9kNdSIYOiqx
 wqCDgPbrlkSrGJGZYxFK7g/CLunsGYmeDPU1N6pZUDdE87HghSbeObTNDO2X7d0x
 cpFCTSz7cxe7KG8RHMgE3aeL4zdcsMd2+Pw5VLMyOP6rQm+J1vlhBW2/rsSkz9lf
 50YmlQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnsb8k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 16:41:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2d94a158dc8so86795535ad.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789576893; x=1790181693; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QPIcqHLGQkoBqqtFI+RW2+Mg899vm81Tfuyu45hPkDA=;
 b=WFJRb4vo1TVT7H1kjHXmgxgM6zRQ8GQaMrZgGeaV9QriIq9KeGM4FAl65xfCjE21PD
 ZRkKrpr3i36t9+NekkzoZKIWxSy2Coy7++UHsCQ8tt1LhQtESuNsccVk+FxW/LnIG8tk
 +Eq/Npfqj7tf6Qv0vGbaljq8HdHRkPeRGFbQB9I6oXRu3PEyYSup6R9SxCi6eaKdcGVq
 Tmdyz/hXfPJbsPGYxyY7p0v7BBZJE3P/MCd1AUS6N6+cuprEO/3mhugbJ59arqhrJNFH
 EXd64r0cdtKglFhI8po0+98BrQViCgaA0YboqAJ6SOML3AafLO6dnx4lqwHkc//zMnyT
 DmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789576893; x=1790181693;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QPIcqHLGQkoBqqtFI+RW2+Mg899vm81Tfuyu45hPkDA=;
 b=UtBMsER18Kt0FsQd2/8tBqkwgpZFe7139/4U5ZMz3WSALMR1qb8IS5V75VmuNJ0CLy
 GrHEeY0OebnT9wvcNkVr0ubgERMIOLylACZ4+5kqraZRzHGcYeV8M4k0PwKbVQ6xIKSU
 1AskRlsK8Q7HFv1hwfinOFEIHHCrB/BNZl4D2zjOTFoHvvgtcbeMsTgIjMp1AcepJzdj
 j/XGsYGEeAE3DIq65aZGqu2jZi3gIlBLxmfrJIz+wJBSzLyxzWsRbRTaZRmSSLbSbAq/
 1p/0u5k0jr8IHuq31/LcUrOmHSdkw/20WUeywyL+H39fuer/I0PbjUqzm49sfT2Vj2w5
 iXkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzcYbyPDzWol5GygWjsHqq0Pcr1C+gTJJ7EZVlNaPa7KchCpTES2wTSlj7eC2kVUbitroRlM/hfyQ==@nongnu.org
X-Gm-Message-State: AFuF++ldPXAl/EQT+fEJoEI3FJ9TCg85lV2XqBwga6sL+wQb89smbSzC
 siUvVBllKcl3gria4EFSIUlYox/hZmfSIAMLcX1K0EgFmlTj9updSToPZJHYb5XUCtFBEuEojzn
 zn75+6xT16E+ea2/R0NTrVYTJZ0R3QpUgAhgYrZ4cyGqYiZnVSlSVTec=
X-Gm-Gg: AYBFou0pwHBT/f/S6j1EUEBwNqoxF/3U3QU4tMPyZR+SIynBY8E2cIH/othBa/9d53z
 thhAjm6H5me8vn6He9d8+I0xWlK1+CjtLt7zrJe8MENrPvYcutSHTh4laXGq2f/Zdl3I4i83xbS
 eQ9AWJWCfPVEWICsQ0h2LadIo8EgzgmJclVjo9XNuuIF2alg7KFEog7VKEnKp02WDO+4mGxG5TY
 xkgYsSExuOSUOM4vNkhZarWIyIDlXmeEuEyh3CYOsu6M+Afacr3A2Ue1kbYn5C1XvNRME04zMm6
 LhR209KBXbC5k0r5p5O6apUbcTaz0j7KpmsfZvAm3C73QTtM12AyJqYN4tKNuqIUacYjFZgmEUU
 H+WWMw1rry+JEk/T3RCTACvj9vlJomoB6CS5bPqztN6MM6KQvAyLtGBZstabQOh+rT3AG
X-Received: by 2002:a17:902:e54b:b0:2d8:d4ce:7e3d with SMTP id
 d9443c01a7336-2dd8e7454c9mr65808945ad.18.1789576883839; 
 Wed, 16 Sep 2026 09:41:23 -0700 (PDT)
X-Received: by 2002:a17:902:e54b:b0:2d8:d4ce:7e3d with SMTP id
 d9443c01a7336-2dd8e7454c9mr65795375ad.18.1789576874233; 
 Wed, 16 Sep 2026 09:41:14 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33c00ede586sm6080006eec.10.2026.09.16.09.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:41:13 -0700 (PDT)
Message-ID: <863e1541-31bd-4b2f-ba78-0f963138c0be@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:41:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/19] tests/tcg: don't define tests when missing
 compilers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
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
 Richard Henderson <richard.henderson@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
 <20260916153013.2134555-10-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916153013.2134555-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gZhyxW36pJLn9okhWl4slWUcJZ8hKh9a
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaac6bd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=ZwUx8k1VEiw8-baxw_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyOCBTYWx0ZWRfXyFh3iqncLdKu
 C7j2yZ/vtieJkLJvinreazqiXlW2YtW7qzuzpXF2nARSs7hqqkT7ep76eJY9D/myexAfvc1obIL
 +r4n8ZoSlC39b9oS5ijTPtIYbX5G+TX88E6kwg3ggs3ADQbGagZyyqvq0MQCVWVCnVhdnT1HaPx
 lZiNWjxQWRx4Z55dw6nXaWwp5QDYSOSuqyB8RneNMkTgbJmTz6LtuCakl3VYhbIhlPkjZtdW1GN
 957my7A3vd7sZAHuDOH+Y7fxvQ5I/0ZqZsjRRE0W+w+9Az999Z27JMVh2fFm/7PrbvURwEksxn3
 dEmf/0Cx78eNbadJdjZRVw+mL4l7CQN9oQ7QZGbLgxtP0/QquI4IZ4PMDgqElHL6x5Fti8kFdNJ
 bdlg1xACujHcp/vn7+eBWoeeg6CWBG5wqnF+I/0DNGmPUuhy7blrJtB7kbFoq3VsKsWAf+X+02x
 OMt8Wud+wBgw4u40CEw==
X-Proofpoint-GUID: gZhyxW36pJLn9okhWl4slWUcJZ8hKh9a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyOCBTYWx0ZWRfX78xv0grisnjA
 pZFtacm+0rSMknzrxWorzCD+sZbjNZSavYVFeh9TG/MGbxQ5/L7QOb2/9imYvLjd8o34+SuxNz5
 uHv/GiHBCOCToYnLBUgw6FI8djCOpyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160228
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 9/16/2026 8:30 AM, Alex Bennée wrote:
> Skip defining the tests for an architecture if we can't build them.
> Otherwise we add a bunch of noise to the reported results. We still do
> report when we skip because the compiler doesn't have the features we
> need to build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/meson.build | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> index d317f0ee310..904a5a02242 100644
> --- a/tests/tcg/meson.build
> +++ b/tests/tcg/meson.build
> @@ -264,8 +264,11 @@ foreach target, plan: tcg_tests
>      if not cc_from_system
>        summary_cc += ' (from \'qemu/' + plan['cc_dockerfile'] + '\' container)'
>      endif
> +    tcg_tests_summary += {'cc for ' + target: summary_cc}
> +  else
> +    # no compiler, skip this target
> +    continue

This was purposefully implemented to not use a continue.
This ensures we always check all tests definitions are correct, whether
or not we build them. In other words, it validates meson.build
systematically. With this patch, only tests definitions for which a
compiler is present, which is incorrect.

The alternative is to not declare the final test (test() call at the
end), in case cc is not present. Reuse skip_test variable, and check if
cc is present at this step instead.

This way, we keep benefit of checking meson.build, and the benefit of
this patch.

>    endif
> -  tcg_tests_summary += {'cc for ' + target: summary_cc}
>  
>    folder = plan['folder']
>    gdb_arch = plan['gdb_arch']
> @@ -373,6 +376,9 @@ foreach target, plan: tcg_tests
>            cc_has_feat += {cc_feat: avail}
>          endif
>  
> +        # While we skip defining tests for whole architectures if we
> +        # don't have the compiler we do skip individual tests where
> +        # the compiler is missing a feature.
>          if not cc_has_feat[cc_feat]
>            skip_test = 'compiler feature ' + cc_feat + ' not supported'
>            built_tests += {exe_name: exe_name}
> @@ -380,10 +386,8 @@ foreach target, plan: tcg_tests
>          cflags += cc_feat_cflags[cc_feat]
>        endif
>  
> -      if not has_cc
> -        skip_test = 'compiler ' + plan['cc'] + ' not available'
> -        built_tests += {exe_name: exe_name}
> -      endif
> +      # We should either have a compiler or have skipped the whole target
> +      assert(has_cc)
>  
>        exe_depends = build_test_depends
>        if 'depends' in setup


