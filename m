Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6293BC83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Jul 2025 19:35:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugTcI-0000gH-K0; Mon, 28 Jul 2025 15:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ugTc4-0000Zh-Ty
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 15:34:27 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ugTc0-0003qM-Vc
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 15:34:20 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-74b54cead6cso3144678b3a.1
 for <qemu-arm@nongnu.org>; Mon, 28 Jul 2025 12:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753731255; x=1754336055; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RIwtv8grNVaNpxosptnFPK53lP31J2AZBYg2FCOKjqg=;
 b=xmSaG4sAqdo/0WM3LaxWJj6kSmnRPzCbQFQ14LhA5Ufd/G+tLdh8KlQ8zgBzD/LTJg
 Za9dzNakmqUD1KlbBSQpmcK5dWfMlKbEMEqbyzKARS7GvNduYoBSoJ7YjRr887lVHF7u
 xuKz2eQ09Jzq3BIHfXCOC46rAEY3tzClf0Z+4pkxL6/ISUO9B1fwrXpc9XVl14YKFudR
 YNAQD/X+di4k+W+1/GoXsvxkuSApPKXpXMFyBMqLNBY/rvEpyfUYreNdVyIZIn/NkGFy
 8wOLr9KUsPcxJSPEmk3XcCZnG/5aHh0XT1cAS10iBwRj8uZMiB35yOQXGPvMyZ7iIwLf
 rwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753731255; x=1754336055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RIwtv8grNVaNpxosptnFPK53lP31J2AZBYg2FCOKjqg=;
 b=E+te0WtPt15eolzLjSHHSkvF7RWdA9ku+zNYOzWpq45GaN2cDN+v5kLI2wMtz+N7ts
 A9wcemf3CYL9Wy227ajWmXnjygfJE7ItEoMJJ6v2sNFT0sRxJkm3GzuS1hWGXHAzcGks
 hLZIt3wZmwZj2Z053yIlB8GUHPpY+gJqj4JgyEgPqA/yCm2IbmqWhMTe+q7Nv7Gwn63K
 F4UjIcACUb+j9Mvf8airMlmA6kp1LdP9qLdrbqNEdRNhdA41zPsrnBfCqvmOCLdgq5zO
 qPZfTr8udDkfBrC6jT2v/3x0vjJz990l0ty19ZW//aXQpNefhayKAgmLBlxr4hHpxdGM
 z7Lg==
X-Gm-Message-State: AOJu0YypYOljSUHZK2kzWvnHvqx5QJT/XOSX+Wfa0eLeHfOU/ALEhEJT
 K6ndzeA0Qo+1G3n4NncicX3C9x5cjCn532PGx0Yq5sRkkZGiqpiZpTw3cqgpsocZxAI=
X-Gm-Gg: ASbGncveLc+EeuRVO4Z3GUYFJYdeLpfKxnsl7fdaYsiSZyGCJsJHROCThZzR4KYviEB
 guRsUWEfXpU5wNjtaRusyTX08DOmCY3Jj/8JNwRe4wKoNKNJYNPQ0d3fEn/bc2yguDnjbKehfYC
 q3HPQEg9feFG5/FFYujoJnKn5i8LoGKtVG0VyYxNp18YwY2FGUEOH4DYbZ2+Li+fMNdctUpFZ6L
 8WYaHx/+LQUFfUfKtpnZrYtFlIn0RS0WQcLboLSucObqcUq5E/zaeNcgJp60RA67fYPHNXLbi6G
 G0CIJtZe4PX4LQ0CgUXjEx9NgAGMAHCg3os3rLcXQQWKa/fZBWfOx5u9iPcOHivZ19RfE9pH9hd
 vMHHtZJGYZCOYWJdQn/uGHXoizk9RZyVD7MY=
X-Google-Smtp-Source: AGHT+IEgknH361BnArDw9Mq3Rj8/54M+lFWaB2vgGywPxHvTSZYQFo4dyqScpLtgcp4QakHEA6HDTw==
X-Received: by 2002:a17:903:15cf:b0:234:c549:da0e with SMTP id
 d9443c01a7336-23fb3129f72mr179389935ad.47.1753731254613; 
 Mon, 28 Jul 2025 12:34:14 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe4fd224sm59861305ad.82.2025.07.28.12.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 12:34:14 -0700 (PDT)
Message-ID: <144f0930-af30-42b0-849c-99242d3f09ee@linaro.org>
Date: Mon, 28 Jul 2025 12:34:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] single-binary: compile hw/intc/arm* files once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
 <bfdd8821-a7f7-4648-a389-124426da6d15@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <bfdd8821-a7f7-4648-a389-124426da6d15@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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

On 7/28/25 2:39 AM, Philippe Mathieu-Daudé wrote:
> On 25/7/25 22:19, Pierrick Bouvier wrote:
>> Move those files to hw/arm, as they depend on arm target code.
>>
>> Pierrick Bouvier (3):
>>     hw/arm/arm_gicv3_cpuif_common: move to hw/arm and compile only once
>>     hw/arm/arm_gicv3_cpuif: move to hw/arm and compile only once
>>     hw/arm/armv7m_nvic: move to hw/arm and compile only once
>>
>>    hw/{intc => arm}/arm_gicv3_cpuif.c        |  2 +-
>>    hw/{intc => arm}/arm_gicv3_cpuif_common.c |  2 +-
>>    hw/{intc => arm}/armv7m_nvic.c            |  0
> 
> Alternatively add arm_common_ss in hw/intc/meson.build?
> 
>     arm_common_ss = ss.source_set()
>     arm_common_ss.add(when: 'CONFIG_ARM_GIC',
>                       if_true: files('arm_gicv3_cpuif_common.c'))
>     arm_common_ss.add(when: 'CONFIG_ARM_GICV3',
>                       if_true: files('arm_gicv3_cpuif.c'))
>     arm_common_ss.add(when: 'CONFIG_ARM_V7M',
>                       if_true: files('armv7m_nvic.c'))
>     hw_common_arch += {'arm': arm_common_ss}
>

The problem with this approach is that we need to aggregate hw/arm and 
hw/intc arm related source sets, and the last line in your proposed 
change does not have this semantic.
Regarding meson, hw/intc subfolder is parsed *before* hw/arm (see 
hw/meson.build), so we can't reuse the same source set, defined in 
hw/arm/meson.build.

This old commit (7702e47c2) was the origin of having interrupt related 
code in a generic folder, but I don't really understand the rationale 
behind it to be honest. It seems to be an exception regarding all the 
rest of the codebase, thus the idea to bring back things where they belong.

I'm open to any other idea someone would have. Peter, without 
necessarily a working solution, do you have any preference on where 
those things should be?

>>    hw/arm/meson.build                        |  3 +
>>    hw/arm/trace-events                       | 79 +++++++++++++++++++++++
>>    hw/intc/meson.build                       |  3 -
>>    hw/intc/trace-events                      | 79 -----------------------
>>    7 files changed, 84 insertions(+), 84 deletions(-)
>>    rename hw/{intc => arm}/arm_gicv3_cpuif.c (99%)
>>    rename hw/{intc => arm}/arm_gicv3_cpuif_common.c (92%)
>>    rename hw/{intc => arm}/armv7m_nvic.c (100%)
>>
> 


