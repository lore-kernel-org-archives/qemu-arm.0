Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A534C87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:48:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj1Aa-0005jo-5N; Mon, 04 Aug 2025 15:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj1AF-0005Pt-7r
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:48:07 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj1AD-0008H1-9q
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:48:06 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so4332997b3a.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754336883; x=1754941683; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AGIUz6Tii6hnJeIHzpD2Q3N4Unalnab5R3xHGIIwKkk=;
 b=tSk+u7att7F+NSPjxxNsq2R4UP6CwR1epzgYH4JQkt7o249VZ1gkl/KBejz6PgDM27
 yEk3SaG9lGfssuFB6EiZqoQpzwWgdfL2LuaTvTZNWfaSkwM/Zkh2Ax73ZaPAPrrc2FQ7
 ADECquhgEw4u41ipruJdAcOVFfSr0rYy+D7A3I0HUUNVHWOFmxQN0p+XH6HIExU5sC/H
 7PMX8fCwiK3JxkfKQspweXaZuVGx25gvIkSR8Si41H1Rm5VSvF+9kQDHXgb8JqK4TXCq
 fKhk/JcQcFgK/cGNEwLvXvLAlO7r5flFaZs6LuBsg6fb7eW5qZCePoenekCFe+r1ujel
 ciuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754336884; x=1754941684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGIUz6Tii6hnJeIHzpD2Q3N4Unalnab5R3xHGIIwKkk=;
 b=Gg0teVNYlVhXzxO2RC0zJoY2ZUCyccyIW+6VJi0BeNuuxrPDwSjHkN6nbSCm44Xb6k
 h5zK/Msai451xpUKo+tips3uLknWVu1ExeXcO2J/n1SrxdB/DQyr+DP02alfYGy18rwZ
 iyMO3ntEU0ildNxBwNEhOs2Zc1JzRzp/oEH6n9tMGjUQ0hhcLu1JHWVAjEw2tceAc6Jp
 8x7OvFx2JMs2lmdW9sS9Q8pBH0BeqDCBEWNIlr2ij8tmYlsKNRI1yrdD5ogFEKith5tZ
 JyJ2Cf/8ow8gw8CMsdF9tgQxcLLxu20GJn8TAOChiOHbcpJbs8XQRAaMU6VZFCidkaQL
 +NmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2dvtSx7cIfp13h0R50rG/YHKeL4w/zmb102ey3zIH+np08nnq3GokD6UCaBe5HKdTve7HFhdxEw==@nongnu.org
X-Gm-Message-State: AOJu0YyXSepPCfe2aHTAkI74gxPUvZlRZJ6Ls7pptKUY8d9OyqzXXUy3
 DJ2hW7nLjsa6C2NJhPSAZIYaeiUPlCHS7kKb0kVQpA6dCl8CgySpU7WrkWFmu10lo6c=
X-Gm-Gg: ASbGnctNMitV84onYEpHVYJrP/xZtla/d5sj7pqS7eBgtDNUGOHHo2ETcO/0brwaRFx
 ohOi3q1nRk8UAqyFbYNH8NFK84u4EGuXWTfEFcNa70KqzLecYCg9sLaYaYL8MScHyTKZi3c11q/
 LIBUuuhrAmq5D0slNJZFP877TeDa3IsAhNslVE50DOZN51gO+HAfQyCAufmvGM5eNBpWYK6m0ST
 J/I56ONHvp9AyruIC4cJRlR6wUQpHO1yYDOW+D/aM3WTB0IxtOCpyEjkyxo30rg4FPGOw7zICya
 8kkScQDaq7Ngzv8G8Uq1lbLPCQiEHzNtMw0tnO7xXiLCwQg6U0ZooJhf0X+Pv/Od2XdOiH0J6yS
 tvQNV2Wj+PnROYtTNC78XaaqDk+9eFVlclk7VJxOcAgD/kg==
X-Google-Smtp-Source: AGHT+IFyuUa1LmariXnn8L0egHLM02/sN1daOvKOjJCkId8o4El17GqyPitTZypUWqaSRS+b7r2lBQ==
X-Received: by 2002:a05:6a20:6a14:b0:233:d85e:a698 with SMTP id
 adf61e73a8af0-23df90fabe0mr15725788637.32.1754336883617; 
 Mon, 04 Aug 2025 12:48:03 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bfaf78c94sm4566355b3a.19.2025.08.04.12.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 12:48:03 -0700 (PDT)
Message-ID: <bf0b1b6b-99c7-4072-a7e0-023fca2c87b2@linaro.org>
Date: Mon, 4 Aug 2025 12:48:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/17] hw, target, accel: whpx: change apic_in_platform
 to kernel_irqchip
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-8-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-8-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> Change terminology to match the KVM one, as APIC is x86-specific.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/whpx/whpx-accel-ops.c    |  2 +-
>   accel/whpx/whpx-common.c       |  4 ++--
>   hw/i386/x86-cpu.c              |  4 ++--
>   include/system/whpx-internal.h |  2 +-
>   include/system/whpx.h          |  4 ++--
>   target/i386/cpu-apic.c         |  2 +-
>   target/i386/whpx/whpx-all.c    | 14 +++++++-------
>   7 files changed, 16 insertions(+), 16 deletions(-)

Looks good to unify terminologies.
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


