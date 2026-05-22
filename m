Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5CECD5BB3
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 18:04:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQUDy-0007wV-PO; Fri, 22 May 2026 14:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQUDy-0007wI-0t
 for qemu-arm@nongnu.org; Fri, 22 May 2026 14:03:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQUDw-0004Ly-7c
 for qemu-arm@nongnu.org; Fri, 22 May 2026 14:03:53 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MGN9jt312917
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 18:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lHemdVuxJvAvNicEiVAj8fDqL4Ks8bMbc9ST5+QKJE8=; b=ICltR8hRMZojM1A8
 nmN/oKeMqr76RS2jMqaQbwsiaJISAjyTIEshOk/W3RFg+S9XzvqqXxhYJAR2KiOL
 Xe/EQ3GzmQ2DGZBxlEg0mpKZoE7Px1tbuYH2xohZSS5MpfsfL2dvTBIhmJO8iPlu
 Yi6RS5WtZ+J+R21Sk5xvmE55Wjo1VK7uY2+abqj+SoXBnlVSW2/yu0uPPGkedorj
 4amkbZIVAKHa8N4f/vTj4TKc07nuwrVArt/G2RHHE9uqEgtQrQTqplMf2onfKZz/
 1dFoVf6+bPRKbT1iVj0rxzTCxcnzFdhfx67CLoS5bVqTN2Ar9iIroPay+l30JRGE
 AbYSQg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea88353y2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 18:03:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2fe1cf409a1so12623779eec.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779473029; x=1780077829; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lHemdVuxJvAvNicEiVAj8fDqL4Ks8bMbc9ST5+QKJE8=;
 b=Z6RM99s0EeD/v0jGJXPtYujn3TFmHNp8iJu34qOfmJmnckCM4LBCTf3YZtEpExb1/J
 pB+TMpCpRIoy0z97Az0y2tt/0uSGkih31h0oRrcdS5TuNI3om7qldm8LnqvrFPYvkWa5
 K5/NTIdfL9lJsvmoLd2uJ8z0Y+7e9LJBve78q28ia2MwUjD4jC+4iyuU5U+kZLlK7YsX
 rts961tedJQTBhlYQRf7qjz/SELSpVtmcMfZnTqz04MHuhqYxzVuEHgkDMnndYBms2MW
 6JrHcKI7b2kGIlnCtrp+iNB541gZjmDNtVR6JKNdsI5JTc0uXjIlJk7gSB62I280NEKm
 69fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779473029; x=1780077829;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lHemdVuxJvAvNicEiVAj8fDqL4Ks8bMbc9ST5+QKJE8=;
 b=BT2fq6w/4tB9+wzfi3dSB9y0eSv1DeIBMIfV4ZVlrCB/+0FKnjZAr/uauF2CaeGpvB
 amGe0A0X8KjbRtWRYOi9iyDxPMQKWT9DhvgvOi4Syp1LOPhEPmKYxqKkkiul8XBT5ERS
 4Y9l118jaOHLiRuq/KVOeHml+F5pWIHXx+hRVk3X/AtVCDn30/c3S9dZFuxj6I/qbFfe
 w8mP8agSj87oFY24yExBbW8pQP1JSnCtlTJskHfrkFfrq+X3UOZxcyIL13uMuxZDGBaf
 OFqG9NSZv3l2AjW6Vse/OdmJq6BlxP7T6Lm8qfoo2BjNfhnhF1saWVhhfDc85d7pWI+0
 Zyqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/nKEXb0gLMwU1DKBczmXX15SchbR1UWNBDMcWM8HrEswCsX73wv9bTBQm9JF5LNUBWwpA3a079Ug==@nongnu.org
X-Gm-Message-State: AOJu0Yy9OifUyYTh91LYBLQlulAKp4gsUKNTBPpM/KB3UaV+ECcQK62d
 IQPmTwu1eVZ4OVifWF9MVxTjTf2oCMIzo34tRQmMWTfhtzd/hr4JIPk34Ha1ZTYumIz1LhI/Ut9
 wazLs3IuWUwZ4M0v3nf7QVycmVXx5sj52S0Xf6NoLwgJxYfgU/+8pgpU=
X-Gm-Gg: Acq92OEpjsb/K7lL/n8goCgFsgAQUXbM02SjEjfiB3wihGt0BlakrNzABIz9se1hNz6
 3QtIC8kLPUKC7SosOWIW17R61+0hpUWMgtw5lnbMiLod7z5G/sX6rdT0D4jKrm4iWNNmvs2tqK6
 1Osd0hSuSMaPyVmlwfVPxJgnAkdBLFvM5qL0vzhsZJlCpozh9W7+Ia4bzR8jKrq1V/YPp4T2Nzq
 DKM2/ffv+kWmgDpqcvUoZRuMOdp1aatnOCHj8aOnMRq+YE5uV9SrbrJcWWQpgcPyyVtVSdjDjej
 iZETTi8RQxJgurP/kD85goUXxDBoRELqLXPVzEb+4kMtTl0g2fZjHKW6urV98bL+Md8VMJdDFAS
 AHjUbEfMTTxBCbzHBK9pv6FG30S9Fh6PNtlPvYtIvILP17xk9QZQQDJeMNELYMtwmJgzdXN/yDJ
 P1Y6Zx+jccahJWnw==
X-Received: by 2002:a05:7301:6588:b0:2de:cc07:e8b with SMTP id
 5a478bee46e88-3044904e215mr2562436eec.1.1779473029331; 
 Fri, 22 May 2026 11:03:49 -0700 (PDT)
X-Received: by 2002:a05:7301:6588:b0:2de:cc07:e8b with SMTP id
 5a478bee46e88-3044904e215mr2562406eec.1.1779473028593; 
 Fri, 22 May 2026 11:03:48 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f1f38bsm1474714eec.9.2026.05.22.11.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 11:03:48 -0700 (PDT)
Message-ID: <74e8bc86-cd81-43f9-b5cb-7e3de3bcd3d0@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:03:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] tests/Makefile.include: add binary dependency to
 run-tcg-tests-% rules
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-4-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260521131739.540157-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE4MCBTYWx0ZWRfXzhfTE9rIdurp
 tMpH4NnZJuGpxW3saXzGtDCDmaOomEBGe+UrPfFFmQQDeTJCIgfd1fSaWuvTT6e9Hc6DSe4g3ep
 hxsM/0veq1iA8vXFHcZ3Db0SOsR+mvebP0UE8t6WlqaZFgbACkTTXV5WVl0W2YRG+bGA0awimv7
 M9kASWjk0L18sdvq6oS98mixY0bzjklQ8GgYj8pd+UXF1D158vZ1it2+ODce4fta8cOuxk1Nr7y
 soI/JAMDfK4gFBTJKihEC5atYxHe4ZoUvhYetwXniY0LENn0mK5bcfumlqwELLVckKk6tLlpfno
 +ZHE4lbE55NK55AdmmCtWCZgNwqb6KDN7lCRO5ihUhFH2gGfHYVvBMvipNXG+ug+wlafeOzEMeU
 piWyQPkceGYreetuwgyvkP7XPVLYfARGTKHSLoL21xiBPyuIq4HdoYMxYTjntr78WqmW14V9/et
 STLhCKmKZjzExt9ELdQ==
X-Proofpoint-GUID: 2ybcQ2_Y1PHyQXur7-SeFfSs7MTXAQzm
X-Proofpoint-ORIG-GUID: 2ybcQ2_Y1PHyQXur7-SeFfSs7MTXAQzm
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a109a86 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=IqlzA_7BHg-eakqZsUUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220180
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

On 5/21/2026 6:17 AM, Alex Bennée wrote:
> Explicitly set the appropriate QEMU binary as a dependency so we can
> ensure they get built. This is especially important for MacOS which
> otherwise only builds the unsigned binaries on a normal "make all"
> run.
>

I'm not sure to see why it matters. tcg-tests don't make use of hvf, so
unsigned binaries are plenty for it.

Which other binary is this building that is not built by default?

In general, if something is not included in "all" target, let's make
sure it's included there (meson.build?) instead of adding a workaround
here. Not only tests benefit this, but anyone doing a build on a
platform that might have optional binaries not built by default.

It's totally ok to build all binaries (even for other targets than one
tested), people have configure --target-list to restrict what is
globally built. Better to catch something broken elsewhere instead of
"oh sorry, my custom test command didn't build this at the time".

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/Makefile.include | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index ce6a0dccaf4..cf6f9e68245 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -57,6 +57,12 @@ RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
>  $(foreach TARGET,$(TCG_TESTS_TARGETS), \
>          $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
>  
> +# $1 = the stem (e.g., arm-softmmu or x86_64-linux-user)
> +get-qemu-bin = $(if $(findstring softmmu,$1),qemu-system-$(subst -softmmu,,$1),qemu-$(subst -linux-user,,$1))
> +
> +$(foreach TARGET,$(TCG_TESTS_TARGETS), \
> +        $(eval .ninja-goals.run-tcg-tests-$(TARGET) += $(call get-qemu-bin,$(TARGET))))
> +
>  .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
>  $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
>  	$(call quiet-command, \

Regards,
Pierrick

