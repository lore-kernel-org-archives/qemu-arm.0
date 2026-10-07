Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE81DCA6002
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 20:29:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEYGV-0002G5-Ox; Wed, 07 Oct 2026 16:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYGT-0002Fo-VJ
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:29:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYGS-0003YV-Ct
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:29:25 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697JNxnA3835196
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 20:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Wvwv2FxCQ0XZGL56Z59jUR/siZitrbyZ03mjLQ0+GZE=; b=lztg0S6OqywzPv14
 Y/4K+KenSEEvo7/fI5EWrw+8hN26N8wM/KX8ohuy5voRzkPM7iDj0h7pbWIwffpP
 MCtp65JLuZyuKqG9IOVGKt5b85Wd3pG2UAYMcYleW3LjA/7bgGd5p37AHa6cl39C
 kE4yXuvpUSrV31pgo8m/vOmOwy9GiT0ibajlearN1N+mKNVzIiWKoiTtEMloshVa
 bLdQ0JLowXVWTX1jg6lGRgmc0CRgOt4myxBBoCm26PQCGHct6HwW+I7WSQFdHGVs
 ZinaCTKJSlWmPtntpVRcfFJEBxE6QY4HM7JinbXHfe87ryMYicIblKfV/muzN0f/
 TMj48w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mge29sq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 20:29:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-34d49d8dee1so4310796eec.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791404957; x=1792009757; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Wvwv2FxCQ0XZGL56Z59jUR/siZitrbyZ03mjLQ0+GZE=;
 b=WWifD19KgdqJ+E2WwrxBmIF0GjJrNh/qdr40n5fFg7GeJh8Wb6YeWP6TGmu5vPIS7u
 lLnp8yCk+CyNW5JeMN3HOEKKVJe3NHzMcC04Ye6mMpKYnDxLfCvs3QU48Zgu6VUgUhzC
 oEOlBZD1DpieQSojJWnyjv4gohs8OpCRkLGhwfUqdMJZlYJcAXCsiqHdRvdo0MZixOeO
 cz2wOPz7UvUJiX9m0y4r6B662ubp7f6DQ6UR8XK6FYQW1now8jC2INMJ430f409rUAfm
 nKNgHMR2bUsIXV2KVx6mJIKL/wsvBPwrZzaVsTogzmCkt7uRE9OxdEAUN2+CD9mHMOIN
 izHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791404957; x=1792009757;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wvwv2FxCQ0XZGL56Z59jUR/siZitrbyZ03mjLQ0+GZE=;
 b=Ut58SHtZ5fWNMyXoxuqMiS+/+49/91kKYwUENwr52MyRxkGUbneP432eIAJrSlqWAD
 +YFjWJ6gLQeo3B+KNPPMCVc/3HsBioJ8c3lUyYiVFbhJXEr7FuwXRuIz/CVGTTnr+RVo
 msF6xix5LgxJMTVru0OlduL8sa6CYRRtcdj0oKKrbDrBgweYNYTz5qaT37Njs/o9CQIx
 Ut4Sm0TOhPgjVwrW8P09Cj8QFjOEhQ/+m+S5i2Z29C1m22Ai1LeKwk3+CL3C0FH2TNwh
 vaTeYrqz12/rqjDxbDPc6/sxUo8ayQeObINVJrcEyRImPl/GSLmIjRlUhZ5EICr8swex
 wTrQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxHEUXmPgtYSZAaSIqA6nRr8r4LjPLGI82VsS6il3wI2IFH2DoJuvAWLcZxnOse97zPma9wKpwyHw==@nongnu.org
X-Gm-Message-State: AFq9FYIBZIhtZlIqa7vowmhfAvkp9BAUmpCVguTDumhvYe8bKkOhBPtz
 lgJHVPnkTTqgQ3qeaLP2xX9Lhz/lW27513gzH4y3JE12aH0gogr6sZeLyoKdGyKJDOV5YJQowho
 6n8LdC4XDCWE/BmfIZ7LHTm9VdiKvkXTJQxxZSBReGdpCWMsEnSN2MwU=
X-Gm-Gg: AYBFou0uPT+IES733IeQL+hhObczQopSmW8qAKZJVHreArQUiM8Tffq5cF6mwPclQoV
 brlB2NFs9DqJjPvIyR+j1VnXdfvrdSAs0RSt0NVU17LzjdU2x1e9KSZI1upU0gaINWrPBMUCElJ
 +da5zebrTzi4HVdLc0H2I6Me00RmisRV1ZL3smp+n1/1Dd2ZIiKbZLMUTz4SvTgKd/BFYmMcQxW
 LDtncf8ktkBV4dKQEMcsifDgFPz0cGV/vza/VnP5ojeHgRH7a1LA5sCmB7X1jWirP219Gwz3YUQ
 0oX9YNeWp1OyLmAKz7AVKqBa7Xbuj6hjlrz5UHxUtRVwdduLNJ/GrKReetQtmJvltmhZlUjahih
 aP+TbfPbVevD5W9xZk4b5lymwyvQ22IPEMJwChf5RdfFPGI9mVhyat9CqNSBDMm6i5NCbYg==
X-Received: by 2002:a05:693c:83dc:20b0:33b:b0c8:73d2 with SMTP id
 5a478bee46e88-3515dc54535mr4054197eec.3.1791404957157; 
 Wed, 07 Oct 2026 13:29:17 -0700 (PDT)
X-Received: by 2002:a05:693c:83dc:20b0:33b:b0c8:73d2 with SMTP id
 5a478bee46e88-3515dc54535mr4054138eec.3.1791404956496; 
 Wed, 07 Oct 2026 13:29:16 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3515b02d552sm16799624eec.28.2026.10.07.13.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 13:29:16 -0700 (PDT)
Message-ID: <37275f1f-aee9-444b-aaed-3e0bf34b63cd@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:29:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] target-info: replace QOM registration with a
 constructor list
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-5-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007115253.328-5-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MSBTYWx0ZWRfX/pcuURkdpt+Y
 5iEoYf1Kmh/c9gZx0EhCcXlWo7MncZjaD54Ftd0SEwVsCwjB2Y1hPMtGoFoVUkmZ4h0wUeM2rKZ
 XkxEYeC0FBRSI+2xqt9uBh90Yhukr3A=
X-Proofpoint-GUID: Lm_m24oObAv6XlQIgH34DySliYjp871o
X-Authority-Analysis: v=2.4 cv=PdJqFShd c=1 sm=1 tr=0 ts=6ac6ab9f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=UaM_-XG8lHQMMUz9hlwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Lm_m24oObAv6XlQIgH34DySliYjp871o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MSBTYWx0ZWRfX7D5Obu8JWzUq
 ySLk3/F4JQN6NkANmh4tyoe/NB3YfM9/m39gpSsajqeQYmyGyXgVbC2FSeEjnQjDnFrcFYdh7By
 PeHLviza9o9DuQ9ytEI4EHFbZ4cxvhewJp8SRPuy1eBGSGnmiaFsLRUWkj9FzujXZe6GE654DjP
 FAKbVC3a0VcCiXFO0OCkIZmT41F6bu9Q5OpBdey9q8A1qyY+OcShVCy1Tv7/lxew3tZajiFWW3t
 wcOxtLqQJJtO+gYFP/qUg5ZSy4C+oMtYeLYBK8ubUwyPTYuQuBJ98bELKRkxkkEdcKFlzS1kw2y
 Vh8tFrZkswDN9P+b/neIm/VsK8LLFKywNMnkEetAa3H4XCggpUSfL3Z/dH5Un8rWGALQ4NuiNDn
 mWCpGiAjBP3OEz4OYMXZF4I5QUYlOTE6bRtDOkunj5NGWRl6f8xOCDhnpc1biHWZ8+moVzKTwHZ
 Rw+jqa+98OW0l+ibJ1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070081
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

On 10/7/2026 4:48 AM, Yonggang Luo wrote:
> Register target definitions through constructors instead of
> MODULE_INIT_TARGET_INFO, making target_info_list() and target_info()
> available on entry to main(), without explicit initialization or a
> call to module_call_init(MODULE_INIT_QOM).
> 
> Keep the target list sorted by target_arch and default to its first
> entry. Provide an unknown TargetInfo fallback for target-independent
> tools such as qemu-img and unit tests that link no target-info-def.c
> objects.
> 
> Remove the obsolete QOM target-info registration infrastructure and
> update the multi-target test to inspect target information before
> initializing QOM.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/qemu/module.h           |  1 -
>  include/qemu/target-info-def.h  | 56 +++++++++++++++++++++++++++---
>  include/qemu/target-info-init.h | 53 ----------------------------
>  include/qemu/target-info-qom.h  | 31 -----------------
>  include/qemu/target-info.h      |  9 +++++
>  meson.build                     |  6 ++--
>  system/vl.c                     |  4 ---
>  target-info-def.c               |  1 -
>  target-info-qom.c               | 60 --------------------------------
>  target-info.c                   | 61 ++++++++++++++++++++++++++++++++-
>  tests/qtest/fuzz/fuzz.c         |  3 --
>  tests/unit/test-multi-target.c  | 12 +++----
>  12 files changed, 129 insertions(+), 168 deletions(-)
>  delete mode 100644 include/qemu/target-info-init.h
>  delete mode 100644 include/qemu/target-info-qom.h
>  delete mode 100644 target-info-qom.c
> 

This approach (custom list based) was considered before implementing
things with QOM Types. The rationale I followed was that if everything
is in QOM, we might better follow that for consistency sake.
Yes, the compromise if that we need an extra init step, but it was not a
problem to add it.

Is there another good value this list approach brings compared to what
exists?

Regards,
Pierrick

