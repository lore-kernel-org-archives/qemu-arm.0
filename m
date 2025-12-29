Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62842E92FCB
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:50:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHO5-0003TU-8y; Mon, 29 Dec 2025 12:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHO3-0003Rw-AT
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:50:31 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHO1-0003k1-Pm
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:50:30 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so9202557b3a.2
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767030628; x=1767635428; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NMJvl+26zye/uc6N8hPetEtCSv2kkfCtjjQWUsWfol8=;
 b=CRJkdZei0wytMIcABr7VpzsInWHKa8yEK3eTLIdnxT82ibFbRWpXYgOJM32IGPUqFl
 MRR7vuhdzGVa7JyoL7ROjV0P+7h3hc436d/7Ek3rlRLPAKH1ByJfWt8FVHwXqrBs3iJU
 2FuDpZuhmKqIIj1DueC5z0LjtjBxmSM1mJ2B64G3c8CkiHIsoi2TU0sSRbYWr/m0Uagn
 ucdpBLsLwZ0ogI7N852say4o8JxT8Vtlav7ri6hmsdkYbmoUdwm9BaNiA+RBH8+6WKLY
 0VyMvdKbjLtMX/SJalcIPpPdMZxj23dlBToTIk0dTLqjpxjx0bE8KQb/m3ALYHmtxCoe
 qapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767030628; x=1767635428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMJvl+26zye/uc6N8hPetEtCSv2kkfCtjjQWUsWfol8=;
 b=huVzXfRgB2O0CLBnLc0UiWiZh0lkW1L7Bwk3R2s8KcF+kXRdlLS+9mSYd6yu78hnCO
 0nN3SK1hYFQ7oTGep70Rrxx/gOixK9yUxraqy/pOjepDX0+zq3SXn6MTNQIdKFdfBEVh
 8vNsCdWyK7fkNiSo5O6bdW3c0hOuxw/E97Gu/3mAB3idlL5yw2/7eshgYCFWd+OsQ6+d
 Lbg+DByIfecpTHaMtyKJSeOuhrTrdC1U6Ov4RCBjBV8I0dhjiuUBc51nUKNYiPJxLp8C
 HrRThYaHYQl4yUm2JP0gkGlfPokNtnr2g15K1mDkenxFOCD8me7DfE7Hawl23oxX7zEb
 3Wbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1N3yVHNDnNq0prKxN9RDgCU5v27kO3h6ijUJdSTF4QCvNdsEep8CX8FVZrLdUyo5j2d7+USjcCA==@nongnu.org
X-Gm-Message-State: AOJu0YyHr5zx5D3FVW7SHKCxhzhkbmlhhj35UkJDSuHI/NJb3jao8S9J
 XJ4Y4xRYtpwCDShtt8PsqAHLhmweCFdQkzyoNQ3IbVnnUE89NYbGCzdsqx/hP3eBN4M=
X-Gm-Gg: AY/fxX73zTpU9Y/hS0zICfaBRfAbZeu48X9uRBaye/4UHPBU9Pg1amyhOBI6aGNRPpS
 OtTnyG2biHZELYwi1KDrHtQQy7fWkslJmiO2z/slhZuov+ES9d5XPReXiWls2cefPX6w0NIPdm/
 n2Lk6a+QsTsbwpOpMLOPF5AEB2aM/96KJTUWt/TAD8OJeJpII6tNPC6HJouMSdI7EZo5s0+QBaV
 gVe3zwcU0l1yBMexXP852pUMmZtIHJgOL9IvQ7m+VonwkzIGlMibmV22Gg+zap2/8yN0xaUcSY3
 DaLwhMV67NYrfSazDIxCvg/AbBgvoBnL7n693cqZVvlXHhHiQsZha9drLEn7Ja686zsH1/6zoQx
 qHTy6hKpJKEYk/yD1b1a4wEKlEHqiGheIPLwq6rE/HYVnBncIhjEvx4jsUGoLarHyfJGk3X0ggg
 y5pSkrXWmqsnSrIG0aZDcJ9VaT97VBtEarGfq9eI+/LLqONFyfcy3VEaoC0/3rBiHHvbI=
X-Google-Smtp-Source: AGHT+IGWKwlx6v7gYluQ1MLIMhcafWyUo/A9TAcRutAdcXVCZWqG3IA4aGb+/LU8vGsEZaPt18WRVw==
X-Received: by 2002:a05:6a00:4c83:b0:7a2:710d:43e7 with SMTP id
 d2e1a72fcca58-7ff648ede90mr25019660b3a.24.1767030628311; 
 Mon, 29 Dec 2025 09:50:28 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7b31c479sm29978778b3a.24.2025.12.29.09.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:50:27 -0800 (PST)
Message-ID: <52121d27-59ae-4547-8c07-90514f1f2d74@linaro.org>
Date: Mon, 29 Dec 2025 09:50:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 05/28] tests: data: update AArch64 ACPI tables
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>
References: <20251228235422.30383-1-mohamed@unpredictable.fr>
 <20251228235422.30383-6-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 12/28/25 3:53 PM, Mohamed Mediouni wrote:
> After the previous commit introducing GICv3 + GICv2m configurations,
> update the AArch64 ACPI table for the its=off case.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 164 -> 188 bytes
>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>   2 files changed, 1 deletion(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


