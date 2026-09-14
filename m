Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3474DC88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 16:16:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x69LZ-0007WB-Hc; Mon, 14 Sep 2026 12:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x69L4-0007Jz-Oi
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:15:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x69L1-0007fR-3W
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:15:25 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68ED0V5P4157597
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 16:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b2z0v8CGciKx6XRdZ7d0qwIKMVr59FfFq6CSGOVtYfs=; b=pOxU0g98vqEfS+ZS
 BiB+mCk5u2rv2aQITLtfFXoBzmWN8yAPv76dBNU8EfD6EUeOhM7H23fDmwfruaJY
 MpWf8zEPsAIM9NmacjRE2yJxBKuO8LrVwgV2Y2QkUxZ2ALwcFh7XQKTtDx1LYM78
 qFXhIxaLX/W5qyzQminM3KX4zDow9HtbnqFNU/KdTymdFPV7eMqiopPQbtX1+j/3
 ZOReqgiPW+WMOeL0uEd60t8vJU9ES6F6eTJAbMymQzvBLSTGwNEP3boCM/cp3BMB
 6I8g/phlGdyzZdSRvYVGqSzgkXofpqJKKxzLLqERKXyEFISeay1l+8B9VkjASzgJ
 WCc/+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f1x1m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 16:15:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc1cdfb337eso4624759a12.0
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789402519; x=1790007319; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b2z0v8CGciKx6XRdZ7d0qwIKMVr59FfFq6CSGOVtYfs=;
 b=P9/8qAsCPTzCrYpoPbog0lZPr1p1r8yh3EY1PBIwNEmH4Jch7ChI07RHvdA7/gUp1j
 BSA9LiUcl2CGYAnHI2Z/DIZeOJpQJSExN8G/gscNM9vpgVcl9W9M8NQdyeOsLxNmRCVo
 Zea2m5u8v1ytgRfw6P18MdcA0iwXdvIrk13Slv5rur/hrd8N13EHKu4s/6tySzhIfqP1
 BjsZOulkFkJhoIOskFXzt6uTakizHQCsVDAoN0P0vlgMxgLvMYheXqkD5omIzMSHbZRY
 8uLUArxKnR9RKHh3YXlsRzcEutJMf1irJ5iNNmUrUTlzbOuM3NScjEpgGhbZKL7gb9rt
 KCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789402519; x=1790007319;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b2z0v8CGciKx6XRdZ7d0qwIKMVr59FfFq6CSGOVtYfs=;
 b=bHqbBP1ZSp4R/A4I+7ZRX90ClxdkcPEINDpPks7mIv+uPkkks/Rl2C16j7I4FRReoc
 HPvnu5HO8Jcdi3DQJC5OMO7XqYDLN9yUGsJDpBlMUAtB4gN3HZ+Gz6zm42uGBQ+Aprjd
 eDy5TRMgfo+BpPXwwaBDDenrhq6H2uOjcJhSRKrZ7Q83Oa93bBtQPmpYXE2QCaFRjnht
 m4RbiGeM5yamXQTjzQeCyM8lX112h72Sddy4k5cn/2CTirynLQnayt/FUJs0BzRUqWdR
 xmIlCFj777xVhFDMHK9D5xkmtI3xMArVYPtoDbnJqU+fENQIj8asAIvW6uZIMwpbRhp3
 F9BQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzxWFO86O0Wcdm3/zO1mb1RBwtD8DvYdjQpmpk++3vc1uagC0aBhjWIgto2hsShzGYUpCMwVZsjhA==@nongnu.org
X-Gm-Message-State: AFuF++mkvxBvKNImByFJv/ChHqp7QlgleRuFiYDUBP4EuqtDQVRibVTu
 ASn+7mZWu04yvyXoS0KcQ1BId99fggu7TVNzEnJSXP4f5Yq45rN56+N+epw7GGClgyxC5o0+q8y
 GWSVGUqL78UUnRvSWnTNaOE9P+mbZdI0pyKJiHpGI6SMcG+1ECWT7jiA=
X-Gm-Gg: AYBFou1M4zR/jOhUx7K44NJF46Wp7Dv7XJ3TAj8O7++1rlG/fjVJY3NYEYIcKbakpJb
 Q9JoVbBNRptaqNwYTRUyIXBLnfjIuptgrcwTJCbCJ3Us8q+Q7rlz5ACDxTYDMdycK+IZyqRIWC9
 WK+RhVdhivEycDB4rlJ/djBv5N4wiCvExByL5AsH/3NbTrXfg3GxRJ2sU+G/ZhVZxEoLXjuN1UW
 +ZIOEvzE5bMCfEjxFg4n58fsq5Pm6rqOs9YbgJIWWtRtt+Vv9rniodlLIj/8mRO9XfUK+HluQok
 tCxnJiE6zmQJvB3xqonc5NIu3vDjSOeS4rS1321o2niP3EXtWybqcqkyjWrN8mdjIWWYjnPyXGh
 ZsN1hZdxmMIOi/HEpoX6lpBHJQBBlj3w/S4N2lMQWtVtVIIMZKJ9N5+MYhnEcCkpmHSSH
X-Received: by 2002:a05:6a20:4306:b0:3d1:deec:9265 with SMTP id
 adf61e73a8af0-3db404bbfd7mr6953247637.6.1789402519080; 
 Mon, 14 Sep 2026 09:15:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3d1:deec:9265 with SMTP id
 adf61e73a8af0-3db404bbfd7mr6953174637.6.1789402518563; 
 Mon, 14 Sep 2026 09:15:18 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b759d0sm27409169c88.7.2026.09.14.09.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 09:15:17 -0700 (PDT)
Message-ID: <166c5534-fb28-4858-8c83-0207b08593aa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 09:15:15 -0700
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
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87qziw1ebt.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7Sv_8a5zXZyrVI9BO33g3PU8kE09hvoF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIzMiBTYWx0ZWRfX3uF3ejGTuKqO
 +qw3r/3sD+jbCiVSPfFUP2qnCJNwPPGqh/10lg2PUaNHg9cchOQqYW+yyAb+KK60pHtdMZqJMg4
 yEkLNPrRRdjSXRC4C7q1lt2Iy+mEzbs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIzMiBTYWx0ZWRfX6wJxYnVgb3uT
 BcpIaAGZ+y4FSFmpG92sxvoMNW0A3hY2MLSoljbtpd8IT/lPpB0UFayEzFuI1N2rU+jwkSnNc7v
 ApqlHPbvPrh4tYQL60/Q791A+4UDK7mYUXsBO/QqujYV8pr5k3HOLQ8Abv0AM+4EYtThSk3QS0y
 1HYoiOqItSoYNIIUcmnVar3zU4oHlt2RmlVH6Ou3wVQJZgbGKfkFulPYOaiz/6o/6ON/a/GSf5N
 VJz0n/SuRYNA9xHzHLKi506RIJJLnS+VPiGz3jAlkH8MgK/7U9m6W98vw7iCPvgFnN4uupClaqG
 D0TgQibhuMyDS5cGYZM60xgBFyQH2CTn0S8DQrBQ3vygbRz0T+oK/QvGCH282/Of/ceGvmuioRR
 /EC4pWozz+cJVGuUpBCnuG02EpV2bPoX25M08iNjNblq5NjiTsxqyxk3jUE6k5j09pM0xfIpY2o
 lDMyHS9LPmUpVdaHnGQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa81d98 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kjduUsIdDokPk33vDeoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7Sv_8a5zXZyrVI9BO33g3PU8kE09hvoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140232
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

On 9/14/2026 12:28 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> On 9/10/26 11:15 AM, Alex Bennée wrote:
>>> Previously we had the default baked into Makefile.include but as the
>>> meson container logic will also benefit from it we update the configure
>>> machinery.
>>> For now we allow direct make invocations to override but for the
>>> normal case it is in one place now.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   configure                     | 8 ++++++++
>>>   meson_options.txt             | 3 +++
>>>   tests/docker/Makefile.include | 4 +---
>>>   tests/tcg/meson.build         | 6 ++++++
>>>   4 files changed, 18 insertions(+), 3 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

