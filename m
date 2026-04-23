Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E86F589D9
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 16:04:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFwWz-0002PL-Lo; Thu, 23 Apr 2026 12:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFwWw-0002Hj-IR
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 12:03:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFwWs-0007Dy-MV
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 12:03:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso71362755e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776960229; x=1777565029; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tui3QU7lec5GZ9QoBbSAta/edat1YRWXP0zG0BdtgTg=;
 b=pvqecMl0w2LvthN4dBHPCfPPH3zeJydjTTn+tYg9CCYoNgvSoP5jE0FgLNAWB5i+1h
 m2EUCsuLHzP17CLG89MSV0D5HBoPnlG7FzG6v0aM3J6uQiKT0vEBW3XKVDcsLOqTfJUE
 uHAopoVNs564r1WIF1zti83QuM4A3UXNAgG21NzlkZ+3tjdetCGJWTbZXKIyb67/j0Rc
 xadWBsR4F+Se7UyEfl0tb2+QqUYPMioNeb5TOwhFc0xqPjbGX++K8gHJCwZjXw4VrhBr
 H1rMT3uKWqnQYNUutDQtIhEHyg7DN/jlbt1DsWym6WJiWmpykyUEh6jf0vUj13V2gpFG
 YsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776960229; x=1777565029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tui3QU7lec5GZ9QoBbSAta/edat1YRWXP0zG0BdtgTg=;
 b=bIeCNU+zDF48rHF14TxGRb1DfHeSJ0ByjMzqRkiDrTdEnQpBXbbZ0CKXYOR4x7OUnH
 YIIQ9aKkzzy4KVRli/AID7z6jIPdXzdox6c8y9TneZPPUbqoaXZhrqsuLRqRJiR4LGwp
 VK/A4nmSHRRvAODRWxMwf28Z0ifCEI43HoiZeMxD721pbA5Z1Q51it+4CbPsWpCiAx6w
 doRh2pysr1Qj7T/bX6DQUXW8wvz8jq+TqqqFSt+gudyfekqd3IgQijn4KjWyPFVNhPTa
 RJM5FSSTLT/HnLPc8aUpiQ4PCfEhYC7voAT5otvXD5zb9Cu2ysKfago9rqSMIgyt8Kus
 1h6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+9MGgUZ5GxhhHALVE45HY8yplB00LjKAMz2qxpJai/JrxIAp2IkRw/Lj7Q7R/JRRiyynqPjQCrwA==@nongnu.org
X-Gm-Message-State: AOJu0YzU2xrGXS1RWMPD++Iy9PMlgh81UoE+gS8T2JySvus5utLj+api
 Tl8Eucc9QkpOl6/79jWxvawNqYEXa3LKhnA+0A4mylXbvqyew9SR8mzWReuWY+fc6P4=
X-Gm-Gg: AeBDieuz16eq2MTTmzm+hZedXqIvuN0XvYJhUnuBXdWxBjXdzbYpT4tJ82aJLfbdaWf
 KgkQvJGXaEmwemeak5J5XiFwXW+ZzoxPAqVRiX8U7CYIPdD0+BwUSeaB+oa3fY6jQ4WDOYbRjo+
 I2YxAASnY+hEwj51lubAyJi8G/viwt7Xfxr4ceQWQC8u9ZzWl2L8hW1+DBomNhS6Hf7st8yGfOG
 kGSiGxL9/H3dVRrjIVlJaICw12dbfw+ASyg8IsL9BLteN94sLlSvIbAHK1kVTH8zQiFdBjE8IeK
 JWH3Z78SOeW7NuGu1g292UkgBkgC8Rv8QpsDBCBQSZ29ZNHQIQWbdditlleCoV0Y0hab/75ECB9
 jaN9nyTwgxbZPyhfa0LvNqwT5lSetlfpkafN8S7pvuEgNfsmbZlL2fE/sfDNC+FDP+AXGu2RhaN
 IFgIWlPh85W/5HgrzGavYinIp0DeA2lBTidGPLvRSlanE1ICM5BYNV3b3Sr5Jzlgv7Q+3KTHYkm
 OCo
X-Received: by 2002:a05:600c:a108:b0:480:69b6:dfed with SMTP id
 5b1f17b1804b1-488fb78ba6fmr336770505e9.24.1776960228749; 
 Thu, 23 Apr 2026 09:03:48 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm34136825e9.7.2026.04.23.09.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 09:03:46 -0700 (PDT)
Message-ID: <22d286a4-52bf-4f50-85de-b238ee8671dd@linaro.org>
Date: Thu, 23 Apr 2026 18:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/15] hvf: arm: allow exposing minimal PMU when
 running with nested virt on
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>
References: <20260316130642.13246-1-mohamed@unpredictable.fr>
 <20260316130642.13246-9-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260316130642.13246-9-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 16/3/26 14:06, Mohamed Mediouni wrote:
> When running with the Apple vGIC, a minimum PMU is exposed by Hypervisor.framework
> if a valid PMUVer register value is set. That PMU isn't exposed otherwise.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

