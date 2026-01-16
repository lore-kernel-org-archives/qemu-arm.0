Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B73D4A60F
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 14:20:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgkgQ-0000WL-Cu; Fri, 16 Jan 2026 09:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgkgJ-0000OM-PW
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 09:20:07 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgkgH-0007Qu-80
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 09:20:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso15403675e9.1
 for <qemu-arm@nongnu.org>; Fri, 16 Jan 2026 06:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768573203; x=1769178003; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cYFRz7m3P+aPWq5I/J2SbapLg/aReCY7HSjKOIiTXXs=;
 b=UCtdw/8oNXNb4mhWXdmEH5fmAn1TpGavx406lxsOAx+p4vw+N82ZoPJ/O9+YMfPgpY
 4EE6P6y8cCizEBve6Dd8tOkhcpxoZQDlwvUgBPtbMohAtKVuXCWeuy6rSbZTxkIiUXv9
 HFt0EZZKLeF0DVdiUyWBQPpZRmw2cQSVOvO6CZOnf19T8GqEhgV5WZ6YuCLsTuKobZKo
 OJY1Db5M64FpFUi17/EVo7Boxw3D5AdNwbGw0F8LvIAzBrzDNLOGPxSa06Fw2elbhkL1
 bbTHIdeABAHUgfSA0u1fIqYyblZBEt4qJ0ogdzbVEcK2o+QmYuBUVghhcXEPW5O5QuAo
 ro2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768573203; x=1769178003;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cYFRz7m3P+aPWq5I/J2SbapLg/aReCY7HSjKOIiTXXs=;
 b=wd7f99GE8kiso31mHuJtiAQG0NlAbEHPKuuWRHfDhsa86V4ecSVA/5EnhxkE7mXa5M
 YZKRWmtBoLoOEPOwZnwrwIZiqIKx4fK6A0GQ8hIDlwUJuGtFb2N/SVw973hoBVvYClM9
 5fio4O+eeqWR8+eEdn9EyeTc5uwDW6+ua0unIH2ScEbztZYMykfEaajUksz/nACtlmhc
 Pb7Pfy/XBhQqCrFUgV0g43EhR3BeXOY55wjIehW7Dlj0IUx24UsW1E3NfeQvR7aQ1Yya
 fbrOgRd2LeeW1fSaxCCvlVjf89BUwMJZZFvgED+erQ1g8d90Vd6JhmCZXHc3ZASlZYGX
 p8Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7i58SslanrKLHvpihmSlsSyPRWfQxYhGiDMl+D15bx0WG+MSVoGRVSy3GyBgHEFIe7TRjjLFOOQ==@nongnu.org
X-Gm-Message-State: AOJu0YzlpFErrcCVJ5DpdFoQrqa73mVB5ktgzRJ2PrtVE/FR/QuGKR9h
 LJMrxRdmeywtwOZVLbXFj9cppfJVmWpUxjwNeed4aHLajsfpbuES1sgZU4jAMDxteaU=
X-Gm-Gg: AY/fxX7I7jttm7iArpX3SRpErtyIvCd+ei5wyMgoa5kDXk2q4SL+oEG7NFCYBn2LfgB
 kT9r2FJhzKKa0a3drapzfabLvTvoRqVOLytssodL2Fo7T9ZLGbXxf1gHiX+BQhhnRS0ipyqkWxt
 J/93+HEkWlNgfjPUNWifaQHd1sXxD7J7CQe87W+eassR5Y1v+aBC1bCUYsRk2fxtNgBdySPZMPd
 ZWIWBuQqFsZY3+bQWUnHybXZXZVSBomE2o36dBAjOxLCxzG+CG7gtT6T+ZFrSGu4fvoJ6D9EVDz
 IQP4epDdx3ev+e09/ewNB4z92Vc+C3uw+gvhw8kyIgZlP8FPsb0/ZYs/DGvwfRSKXswCwpNhuzY
 g6MxJyFHQ6jBHauCRKzM42yg8PGKGO1UV6sCWDD6eofBnrlxEtJxamGwo1oARB/KZDnER6AKPhg
 klq5U2l7lCawbW2JKj6dQhz7FlxyNjKngEfT1SDsBDo5hWylD4kRC0chLGBGeGvdT5
X-Received: by 2002:a05:600c:870c:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-4801eb092demr34374535e9.17.1768573203379; 
 Fri, 16 Jan 2026 06:20:03 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe2c1c6sm17185295e9.9.2026.01.16.06.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 06:20:02 -0800 (PST)
Message-ID: <344c726f-32d0-44a9-9084-edfc64dedb75@linaro.org>
Date: Fri, 16 Jan 2026 15:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 10/26] whpx: reshuffle common code
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
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-11-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116135235.38092-11-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
> Some code can be shared between x86_64 and arm64 WHPX. Do so as much as reasonable.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   MAINTAINERS                  |   2 +
>   accel/whpx/meson.build       |   1 +
>   accel/whpx/whpx-common.c     | 558 +++++++++++++++++++++++++++++++++++
>   include/system/whpx-all.h    |  20 ++
>   include/system/whpx-common.h |  21 ++
>   target/i386/whpx/whpx-all.c  | 551 +---------------------------------
>   6 files changed, 612 insertions(+), 541 deletions(-)
>   create mode 100644 accel/whpx/whpx-common.c
>   create mode 100644 include/system/whpx-all.h
>   create mode 100644 include/system/whpx-common.h


> diff --git a/include/system/whpx-all.h b/include/system/whpx-all.h
> new file mode 100644
> index 0000000000..f13cdf7f66
> --- /dev/null
> +++ b/include/system/whpx-all.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef SYSTEM_WHPX_ALL_H
> +#define SYSTEM_WHPX_ALL_H
> +
> +/* Called by whpx-common */
> +int whpx_vcpu_run(CPUState *cpu);
> +void whpx_get_registers(CPUState *cpu);
> +void whpx_set_registers(CPUState *cpu, int level);
> +int whpx_accel_init(AccelState *as, MachineState *ms);
> +void whpx_cpu_instance_init(CPUState *cs);
> +HRESULT whpx_set_exception_exit_bitmap(UINT64 exceptions);
> +void whpx_apply_breakpoints(
> +struct whpx_breakpoint_collection *breakpoints,
> +    CPUState *cpu,
> +    bool resuming);
> +void whpx_translate_cpu_breakpoints(
> +    struct whpx_breakpoints *breakpoints,
> +    CPUState *cpu,
> +    int cpu_breakpoint_count);
> +#endif
> diff --git a/include/system/whpx-common.h b/include/system/whpx-common.h
> new file mode 100644
> index 0000000000..e549c7539c
> --- /dev/null
> +++ b/include/system/whpx-common.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef SYSTEM_WHPX_COMMON_H
> +#define SYSTEM_WHPX_COMMON_H
> +
> +struct AccelCPUState {
> +    WHV_EMULATOR_HANDLE emulator;
> +    bool window_registered;
> +    bool interruptable;
> +    bool ready_for_pic_interrupt;
> +    uint64_t tpr;
> +    uint64_t apic_base;
> +    bool interruption_pending;
> +    /* Must be the last field as it may have a tail */
> +    WHV_RUN_VP_EXIT_CONTEXT exit_ctx;
> +};
> +
> +int whpx_first_vcpu_starting(CPUState *cpu);
> +int whpx_last_vcpu_stopping(CPUState *cpu);
> +void whpx_memory_init(void);
> +struct whpx_breakpoint *whpx_lookup_breakpoint_by_addr(uint64_t address);
> +#endif
I'd rather rename the target-specific handlers as
whpx_foo() -> whpx_arch_foo() to help follow in common code
when we are calling target-specific implementations.
(can be done on top later if the series is good to go)

