Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E215C88E72
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 17:15:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Fhf-00033P-HQ; Thu, 17 Sep 2026 13:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FhH-0002qE-J4
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:14:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7FhE-0003yD-7v
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:14:53 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HH5btc3437515
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kF+paE7a968ZJfjte6ApswrvKqRaX1N3biQ3pRDE3mE=; b=ecoaB5zQBrDDF/+u
 WEHWROPZtl54V6QJb6R37tqGW5Tpz/DykBEy/QU/TWSN05bOjN5Bbbi6pb2FZncW
 p1TLr47FCvMW6erpjnvoGHZrrbHTDU3qa7Dwn+1qG6OyI1AR/5gTPKO241rXsx8U
 /NLA3UvR2ggzC4RqzDJPZ5oIxo3KeiG4iYp1GcYRdEVbltZ2lQZQUDgAObqn8mdr
 efpG7Rs7NX0bQGmMgUs/qKBqEE6kP9qPD4c8Z86lSShXEYhfaY58NSkOiD2dUW5r
 bDKK7kTHU6Ru7yHeGAdG9ZU1QeTfOcZPP6OqA2c5SCvC209KPcwVkk5u9ScjlVCN
 ZsPMOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6j7bv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:14:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2cc73f47bdcso17447715ad.3
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789665290; x=1790270090; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kF+paE7a968ZJfjte6ApswrvKqRaX1N3biQ3pRDE3mE=;
 b=K4bbl5hucCKVj/9vdRuSa0StrUWJHRNVxXasnqt90iJdRhjaW3HuF9LeMeAHdkVQCp
 AJtatwiP5ULxLLdnRMxqpdWDaRMYWPWBNvG2hhHhE4KiFkfCh6EsbOwV4KE67yLJGeyj
 oXup0+5+IwnWIt00ZOSniPsuigugnjHVZ75uS5IebIKAeByMkEubvT27e+wg1x7U2VyF
 eBZl8TW3t59CpOMtzpK8cMOUgTvYHhb/9Eu+zy8NlhKRF4Oziukvn9t44+Bq2M+jxgLz
 R4yIC+wWVrd822bkGDhUebGgZAQ8ur07xbulNx2c9v+P7lnbFt+T7NzX5xPNWL5uMUhF
 JX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789665290; x=1790270090;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kF+paE7a968ZJfjte6ApswrvKqRaX1N3biQ3pRDE3mE=;
 b=QLMPtz2A1u5+Su0AdJzssRGA3ohV59diAJdJ7CitUkvHTlzSkZ5sowznEBdKtaekyg
 ai50ieJbzX/OVRiIPhi9B9JOZR5J2uwktxcOfHinyFvtJDIgLwvTTcPfJFCHHKSre3af
 Zj8Z2wWRYjhSCA5+/cAWZcciRUszLqfXGnI6uT7AuiMgECvis9jnIvaXEuiNrA06gddj
 eUY7rLEIyw0xNxULC3z2A/avBCvokjsNayMWk4goELst5kP2Yvsuu3P6wNXXom2eZPyT
 pINvFcxfVfMNO/kjt3xCmYC4OvJbN7jPNzsCS4mr+5s7ukec8RgW6SO9xF0VnI4zQxNf
 4s6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwgVZrHBNm+9RGeE2Peg/wX9tOQDDmfjq+eIdjEzLKWk287U4SS4UZ6s2v/Fbbfb3QUDMQzX+X69g==@nongnu.org
X-Gm-Message-State: AFuF++mpOLlT2h3Sv2FJoO1I+6DfkZDRSfiaQwlVouPEPRggk2EZoOTA
 HKZJJPWAPqgNxuhvynUcQpLq7+q7ujCXUEn93TZc6pyrtnmimwawX7f/BGEHuPjgABwo1CwQEtX
 X+fNc5+9xq8CmSFlm05HJbYa7h5Zd5u0LHFLFVAjU/KcphTjs6lwEvyc=
X-Gm-Gg: AYBFou1LI9aAvoio/Zaes/Kt6DYQSuuJzELfqBO75dFpDsvRf+IPwRTQ7gJ5CmKYizy
 8Q2o+skaslGkLomOP27uZ2It+FLYBf9U3qzXN8kO07kNdQwqTIazvS7P68NKEVd6AwHke9NGBqM
 IV79hB+Y8PexdcLJANp01XmUxzwqhtatF0drle6JkqAG9QizZCijIVqY/tSf+TOElVGpuIEruDL
 E0QbXHQUj9f8sDMwok/1kTPjxWZFGRjQB+scY6SaIwoAid5UkmBNri+tl7cDmxuNKt2eMqPlPcq
 DRMXjdde9AxglXGFWr3o4kgz18V34tLYcM1hsHw3n15vU0YRDmpUikw20Pz94/sSwzBpUDa4+PU
 BLukHjSejMXuCSl+DY4mebTcoabU2pCisMIAVcbvdi7W8o2TadFbVAzvHDWqcEga7zNHl
X-Received: by 2002:a17:903:2b0d:b0:2dd:773b:b66e with SMTP id
 d9443c01a7336-2dd8dbfd0a8mr154723055ad.4.1789665289851; 
 Thu, 17 Sep 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:a17:903:2b0d:b0:2dd:773b:b66e with SMTP id
 d9443c01a7336-2dd8dbfd0a8mr154722675ad.4.1789665289423; 
 Thu, 17 Sep 2026 10:14:49 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5a6a175sm17345524eec.9.2026.09.17.10.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 10:14:48 -0700 (PDT)
Message-ID: <b681abbf-7aad-4931-ab17-acee236507c3@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:14:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/17] tests/tcg: don't define tests when missing
 compilers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Matthew Rosato
 <mjrosato@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, Brad Smith <brad@comstyle.com>,
 Kyle Evans <kevans@freebsd.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
 <20260917165602.3405537-9-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260917165602.3405537-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4bxGMlGygjFsX0qjz_d5cTPwS0aSpz2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NiBTYWx0ZWRfX6mlhTN0zouuz
 S8elK9pKXFZbGbvb66MvrzhRNPmkf5JYrSk30cSd6bKqHkAEde8vE2I2402QvT/svFUZSi+y3y/
 3x9XeXcMMfy8AztHl1KUGbOjTRhSzZ6RjAOYHwttYmc8/ubm4mnFJJr05JpxLItfHTLd8uHnZqL
 HZMI3IMYeYqaHrubNzKT6JiSc9Uc5Y98hVeFEjhwJ2/ArZ7/LO4a8Dmm4eP6UjwFSCKY6gT3I/y
 P8vD80xTzjDbSaTWyPr/VQYNHWBcw2sWMp3gXvbaZyFzW0G1OS/pUcOmTSdquqWQgNlmiQasn36
 eS9/CnmaDjho2eTTqooN1l4FwUJLmpNnkEmBIR2ft97Jo1lw9MZvClygOVEyqJdriBnLUYvF8IB
 UpMVeZV3G9pAAHgJADlRtbk5GupdNzBq2JaKiZJhGQseSg++NnRTqjpCMplKJtonpzI092NOgbr
 1OVqXssuiKRcvsDrd7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NiBTYWx0ZWRfXxyqiC9pwldXd
 K6SGRYYCJW38GJsBlemkFbRSov/c5NRoacwxCv2iOyiTdHgnXlm4FxOsrNwEszA/5FQ1/xLZfUT
 GRK4ccuJhKEWLSuN1VbHRH4Yik+Epj0=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac200a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=MCDDx_ddrlO2jgFLzqYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4bxGMlGygjFsX0qjz_d5cTPwS0aSpz2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170246
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

On 9/17/2026 9:55 AM, Alex Bennée wrote:
> Skip defining the tests if we don't have a compiler to build them.
> Otherwise we add a bunch of noise to the reported results. We still do
> report when we skip because the compiler doesn't have the features we
> need to build.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v5
>   - alternate patch from Pierrick which keeps validation
> ---
>  tests/tcg/meson.build | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> index 814f2f8cd8c..5819fdf0bf3 100644
> --- a/tests/tcg/meson.build
> +++ b/tests/tcg/meson.build
> @@ -499,10 +499,14 @@ foreach target, plan: tcg_tests
>          cmd = ['sh', '-c', 'echo "' + skip_test + '" && exit 77']
>        endif
>  
> -      test(test_name, env, args: cmd,
> -           depends: test_depends,
> -           timeout: 120,
> -           suite: ['tcg', 'tcg-' + target])
> +      # Do not add a skipped test when compiler is missing,
> +      # though we still check all tests are correctly defined.
> +      if has_cc
> +        test(test_name, env, args: cmd,
> +             depends: test_depends,
> +             timeout: 120,
> +             suite: ['tcg', 'tcg-' + target])
> +      endif
>        added_tests += {test_name: true}
>      endforeach
>    endforeach

To help series get pulled as it's ready,
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


