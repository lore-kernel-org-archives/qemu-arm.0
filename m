Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8138DD2ECF7
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 11:17:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vi9ju-0006az-A8; Tue, 20 Jan 2026 06:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9jp-0006Zm-GP
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:17:33 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9jn-00054Y-Tz
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:17:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so32973145e9.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 03:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768907849; x=1769512649; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VO9eaYxTpxD9tjjG4lo+9Z3rY8GSxmLO5GHzDjby7Tk=;
 b=PSn+V1EdA9udgwvTQAQQpl/JWIfHjK3lpnNBYnnDEOHmrOHeZgpYNK1zLHgSGd8jfN
 5NA7dV8n1yEk5ZT53HOhNvHbvfcfWAQGFt5zb1kXoPtfiTm1cHlDfrYYnciACfpA/Zbd
 sqeoSBqDqMZ+uAUOoA2jKBsSw0/DiI2EvxKfUDtlt7zV5n+apZtzcC/DV8vdXSvWJYsB
 DleSgBMlUoMwmy62SIkEaJegbWQpTIsFM1LJW9kdGrxjriL7r9Qg6rgsMYQ7CbJDStxR
 MGLbCRj74kRPLxZmJ0MTrLAlynZqKMM94waXvPon74oamKP9yJfJUYJZx6I3BJepCXqt
 B80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768907849; x=1769512649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VO9eaYxTpxD9tjjG4lo+9Z3rY8GSxmLO5GHzDjby7Tk=;
 b=AvaX7dfWjwwsWu2tt2NNj/ROy194/0iYLUATMLmdsonj07HzQPXZKG7mLwm48+8wCq
 X4BXwBqe0s6Mq2vqAnsyV80FjqWOjCc0cn2x8zJCEqWm2SmOWK56bWPQMIzUV1KPrCh7
 6bxUOIspLOmAhKeYnYnqE592nSfd5trVU/OXiBVEw9QMHrQmGrCwI/trFCpgElpNBcE5
 PguAQgoe2l5MIEpLaNovDdwAWgYPOftl7V+B+nfrgAmreoZCAQOaBFBtJf2ivny+A8xK
 XXZNEkjmLC3lTG/9ECZQ5tZFqt95T9OBtw96bJpLuqVrKwySmfLij+Eg+szd9+My3YvE
 9MiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVewzr6Nx+RvagQuYvLhSk9CF881ZobXiBYGEdUp8URUApIlx1aJo8igskHtrwqjGEahVJO3NkHeQ==@nongnu.org
X-Gm-Message-State: AOJu0YygkzQMXmcVUvmqlWAtJTn1gDam/C5RclcY74Z4ubgMXINu5lRS
 Xy/06VWOmewZ1fYVxDhcpLUqMRASVN01Mne731b2g2yxiBPrjpsomzyyYBqeMdVNS18=
X-Gm-Gg: AY/fxX7yV/LllcDmQDh4YpP/L8ckp01Ve8VnQUUBXeQTIJVbY/0d5vBcU66XaPyDI3Q
 BuO+q0d5m6MttQjexk8N0mdI6bQQuO6N1nNjBxIry/nZwPjLLK88uwTDIsMTrMARyAAKdynKZYB
 zUIVxCk2hkiNOOCkIOcRCgZ2tJ6cHMm/RAi4HJi7js+E/6t4VDHIHYk7iThtLeaEgEAmustcBdy
 PDw4qWTGih0SR15ck+ZcJjb3ur+5GOuADATyxrMF7nDoTsruP2uoBh6zanJMWiCF5/qLst8OKHz
 RAORABoOMGMfhPm/xYIVGdM4zC962dJDPdvlN2jTHHgkb0V3lENTqLKW+5D7Lan7158vBrB63iC
 5GwzZBRqVFW4BBNDT3wzmjb5vzo7Qbdm8L3PtGhcac5Qvpx7auVC3+wRTuZUjyrbLvwcAI2JcsX
 jgfGxhDPBgLUQBH080e0HN6Hs2TjNOBfvQMGCM8I2y+tl8k4Q9ViPffA==
X-Received: by 2002:a05:600c:a399:b0:480:1d0b:2d15 with SMTP id
 5b1f17b1804b1-4801e345c96mr145015545e9.27.1768907849193; 
 Tue, 20 Jan 2026 03:17:29 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b2672d6sm304260535e9.14.2026.01.20.03.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 03:17:28 -0800 (PST)
Message-ID: <94f88409-f693-455f-9baa-34feaba3dac9@linaro.org>
Date: Tue, 20 Jan 2026 12:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/26] WHPX support for Arm
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116135235.38092-1-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 16/1/26 14:52, Mohamed Mediouni wrote:

> Mohamed Mediouni (24):
>    qtest: hw/arm: virt: skip ACPI test for ITS off
>    hw/arm: virt: add GICv2m for the case when ITS is not available
>    tests: data: update AArch64 ACPI tables
>    hw/arm: virt: cleanly fail on attempt to use the platform vGIC
>      together with ITS
>    hw: arm: virt: rework MSI-X configuration
>    docs: arm: update virt machine model description
>    whpx: Move around files before introducing AArch64 support
>    whpx: reshuffle common code
>    whpx: ifdef out winhvemulation on non-x86_64
>    whpx: common: add WHPX_INTERCEPT_DEBUG_TRAPS define
>    hw, target, accel: whpx: change apic_in_platform to kernel_irqchip
>    whpx: interrupt controller support
>    whpx: add arm64 support
>    whpx: change memory management logic
>    target/arm: cpu: mark WHPX as supporting PSCI 1.3
>    whpx: arm64: clamp down IPA size
>    hw/arm, accel/hvf, whpx: unify get_physical_address_range between WHPX
>      and HVF
>    whpx: arm64: implement -cpu host
>    target/arm: whpx: instantiate GIC early
>    whpx: arm64: gicv3: add migration blocker
>    whpx: enable arm64 builds
>    whpx: arm64: check for physical address width after WHPX availability
>    whpx: arm64: add partition-wide reset on the reboot path
>    MAINTAINERS: update the list of maintained files for WHPX

Note for myself (rthogonal to this work): thinking about generic
accel/ infra we could add these common methods to AccelClass and
get rid of some per-accel #ifdef'ry:

  - accel_has_in_kernel_irq_handling()
  - accel_arch_get_cpu_features_from_host()
  - accel_arch_set_cpu_features_from_host()

