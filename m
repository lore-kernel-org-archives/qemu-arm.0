Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA97E69166
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 20:03:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXm81-00076N-Pf; Mon, 22 Dec 2025 15:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXm7z-00075c-Bm
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 15:03:35 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXm7x-0008A0-RQ
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 15:03:35 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7bc248dc16aso3556655b3a.0
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 12:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766433812; x=1767038612; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ok0ugNyWju9TPK6PSDFMdAHHtV5LAbGtjuQGMn5dUdw=;
 b=X2/dHMpTuA8oiTYbJJP4SBmWUXAbPMLaxdL68GupqxZnBv/eclbJnCScMPd0v4Lo5g
 4Zv/IBiaqIk0rRQaiy/PdnzC+SdeteS9MhKqxBl6XzIluHAxn8ZTmQaBov1OJrKrAgI0
 UGULYLZq7vDGEf2/r/Z1/0GmiVhOV1EZHp9JwAct1BcUacIO1ocKJB8eU+EzQIZM3Non
 BfVIBnNyaSpHxdK1dhrMCGcW6Aw7nXJ1eU4A+R9Pdong1dKtKwo9voNlBI4+MZFPsOr2
 eS5LOfJ5/JIay0f6AAyC4L+qcheiX9TRbmS87pmOuAImhl0E0CvlnvMmsBFT4rfUEcCV
 O7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766433812; x=1767038612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ok0ugNyWju9TPK6PSDFMdAHHtV5LAbGtjuQGMn5dUdw=;
 b=sZbEASgtwjOwcIIL84NMmMo6Sq2JnciHCnduKQqKAroFeLLSIDF6UbpyK8JlI5EYFu
 onPTZfRamg9Qjw5q9c0Da2l2i0fQD7szkBvtRMuobobjeImqQSUb1qb85QnjzckGpZqG
 TM9Kz8JltcQyABFtrMdWJXLrRdGut+wk6PyPCyfih6lTHEXTqQMggDrcL21iFit02xZV
 mTJWBEfTPiebGy7YCW2dnvqy0qV/APE0Q9K+7lqBgQFAhaIwbHGLStARckTr7geO2fK1
 r4h+8Fl4HeiLjFuzKucqRpv6ONyeeekHbIsJcIEY/NdH2JxjgaYq8nRcSF9h+VPpJ3me
 xs6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAidAFtWXM5EFAIGCR3SCcc+cmTtVB+vRElzlrZebhKWH1v1QJXycqfpEFatv2evU0WLMQN8j/Hw==@nongnu.org
X-Gm-Message-State: AOJu0YwLrYQ5wbGxyhw/sxio8G+16TbBl0g+4hecXyYOyqRTQtrui3M9
 HTLJ/Z3Gh3pQvleuZkwX1AMO0mBsx+VvHQ/a8aTl0uRD6K9qaLLZR2vgrul0wosVcCo=
X-Gm-Gg: AY/fxX6hIzBz4XnUUp3q7ezg7wyFUVU8asxxBWjcAdVbHk8h4BoYmY1WcvqdQYm78WK
 VaYLCuL1uVvARxKqbqAzWa7C6S1iO/zpkUg9dTVHgl5NIwzzlI5SaL7xAvcVi0T1cUS0Og3sBGd
 oolAyHTm+nnTeUE1V3aOoAuT9HAn0Tp9rwi+2PkaFt4BNafP75Zmfei8Zq4/CiZyHGnRCpRWVYB
 bAWFLUmiBBIKJwMJY66a72gwbifVLXEtoPJBKRD4VZHWbrgcrZ0jgVvt5YE4RvcAGpGPX3mHDb4
 AhGN9udH/Kd6ty7WdR6nF8CYfG5dgGrEZLYfdm+jhtQjhq9joIn/daEzz34+MFV2N2gYr03It46
 GPRzF5IS16TG0v6XrAbbzINC5V9J5Itl7Rja3SLXFzjXSQCBWUN28vRGjLCyGSQGPTg8p5W+lAg
 UqVMY9g2BXGUME7enknEgLTD+uzfok+Ryq0sLTMivHDN0AufOTixVjv30=
X-Google-Smtp-Source: AGHT+IEPku4UK3TadgSCuycN1UqIebi+VLJnURye5V7TiCuOIsePDeVw8+kd8vejeDFdqacF+vVYmA==
X-Received: by 2002:a05:6a00:1f03:b0:7ae:8821:96dd with SMTP id
 d2e1a72fcca58-7ff648e6113mr11091997b3a.24.1766433811813; 
 Mon, 22 Dec 2025 12:03:31 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e0a2e3esm11107066b3a.37.2025.12.22.12.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 12:03:31 -0800 (PST)
Message-ID: <cf1b43db-f6b8-4bf8-9421-e27d32120552@linaro.org>
Date: Mon, 22 Dec 2025 12:03:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/12] plugins: split init_hook into create and reset
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alwalid Salama <asalama@qti.qualcomm.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mark Burton
 <mburton@qti.qualcomm.com>, Laurent Vivier <laurent@vivier.eu>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20251219190849.238323-1-alex.bennee@linaro.org>
 <20251219190849.238323-10-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251219190849.238323-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
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

On 12/19/25 11:08 AM, Alex Bennée wrote:
> We need to move the plugin vcpu_init callback to the reset phase so
> all register information is available to plugins. However so as not to
> complicate the initialisation code we still want the call once to do
> our housekeeping.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/plugin.h      | 19 ++++++++++++++-----
>   include/qemu/qemu-plugin.h |  4 +++-
>   hw/core/cpu-common.c       | 21 +++++++++++++++------
>   plugins/core.c             | 31 +++++++++++++++++++++++--------
>   4 files changed, 55 insertions(+), 20 deletions(-)
 From our conversation about GIC registers not being visible at cpu init 
time, it really seems like the root issue is that we have an external 
component that should not be able to dynamically define new cpu 
registers, and that cpu should deal with it directly when creating its 
own registers.

 From what I understood, those registers are defined dynamically in:
void gicv3_init_cpuif(GICv3State *s)

Any chance this could be reversed in terms of dependency to be 
initialized *before* the cpus, so that GICv3State could be passed as a 
parameter for initialization on cpu side?

Regards,
Pierrick

