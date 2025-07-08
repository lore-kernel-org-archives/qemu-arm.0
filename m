Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C640C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:49:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFAf-0003rO-1a; Tue, 08 Jul 2025 16:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDd5-0003FD-Lq
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:06:10 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uZDd4-00046G-6N
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:05:23 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-70478ba562aso3274536d6.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001521; x=1752606321; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5gSjuATTx72GOZz467qIDKmTtfJ/K9yb+xo8zZDWtOk=;
 b=zMtIV2PDTU9ANZ+z1piuNsdTDAmzEjClWwj/VeiCDJcmYdaNL1JPy01EA8/zCIur99
 B5TJVZBo95jlXYYABo56ttIa9EKmuhgfbIGG2rU9g/wLeq0x+EEuqxtzK+mrIh8kbEBn
 L0jBU2wSJ9DDQ/IbpUEu/OUjnhMhJCcomFv+P+wz4z664bgXWZZADetFZ22XjRjH9k7O
 D5uDxMPtQvUOr7JgV6RobXGOe3shckxJZWD9es9Jyt0rrCuHR3GNTVKouspjNawa0G8m
 onoNnbI/U4qAijORJTj/UHk2LsBpR3fjJj9xJSPZb57d9k6r6sKrr5DySl+Q7D5zMoW6
 AG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001521; x=1752606321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5gSjuATTx72GOZz467qIDKmTtfJ/K9yb+xo8zZDWtOk=;
 b=BQft0Jnv0zn6ud6ZbFmry3UywMVte67RkPGpcIf6m4leARHdHOllvl77zgQVGdNmjc
 Z2HPsJRGoDr4Ck3y7DPu5syyZ4uHsZmz+n5K6Kcfif3VKa+UlpiUVWN3GEhvWOWl6oBU
 Fypq4Pj2dioSseKIl/+0scWp3lXVItTEXhjGH05Oq1d7Hf7bOlOnwzDhWmSCSgV9Gd/i
 Wo3cupiM0WHRzxj4gC4V7nczHuXg6PHUmZqFnxqazf/9GSe3Q8m2NwmfTHjQRTgTaAPs
 Wjw1RLzk042GJRoGHtXvLRkSp/gDbQ47PlUaXhMyctGSK0YL4l42VnbKaWeYKAMXOEFm
 GYxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrP655Qn4txkjcW+zxbczSF1YIByPT1boc3/5Hf4U//K06HfKRSg5vDNk01eI/Mz4VVhqkcv9U7w==@nongnu.org
X-Gm-Message-State: AOJu0YwAniZ78785fmHEadMTjco7f8LMZ9s5TZP2S/6DyJbchuue0LO8
 jXNys1I1H2wx6B/879NWKI69bT0RELwftb1dp/RdNJ7vrG3eSFJuojMLM8xn9kN+LeHDwxbsyj2
 CxEMD
X-Gm-Gg: ASbGncsARcQymg+xD3d7awU7NDOQHN2+Lyk3fMhCrBV9m+NgkT7G4AzYy3rqepv4jJX
 TD1Vu8ti6+y+wcdaLxcOuZgsvARoS2i+pasbGfJ9KdD2NbV6+3xZqh85rh7cfyXuR0exLkkrvqr
 NIIMn5iDqY/bPyq/GiEq17Kkejbjc48zlVyLFyOEG719LDXoI7c+ORr6bIt9KTiKvt5ue2fLOaK
 zTTiIhvhnjsO3bp5WsnPnhNWrTWKtzffjAQYUmjntUnvU3iFjASnNovQiRsz0hLX3/lp14TNBHn
 pV4F1AdI2xpWXt1L+kAm+/NaxhU0rw+a/ld0guVGHHW6WS5Da/Wjb/Aq3NGHTzpRVOAF6b60pN4
 =
X-Google-Smtp-Source: AGHT+IEkizQaQtMXancy/7xviF7/nV/9CuG4CcqSvXpkj09rbW5kDvKUk7aJ9PLQYz2Q785lGeVQJA==
X-Received: by 2002:a05:6a20:3d0a:b0:21f:4ecc:119d with SMTP id
 adf61e73a8af0-22b669e7f6dmr4910385637.7.1751995933879; 
 Tue, 08 Jul 2025 10:32:13 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3924868c3dsm4334342a12.23.2025.07.08.10.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:32:13 -0700 (PDT)
Message-ID: <4c89172b-1214-459d-9d0b-221347ce59d2@linaro.org>
Date: Tue, 8 Jul 2025 10:32:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 2/8] qemu/target-info: Factor target_arch() out
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250708171949.62500-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-qv1-xf2b.google.com
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

On 7/8/25 10:19 AM, Philippe Mathieu-Daudé wrote:
> To keep "qemu/target-info.h" self-contained to native
> types, declare target_arch() -- which returns a QAPI
> type -- in "qemu/target-info-qapi.h".
> 
> No logical change.
> 
> Keeping native types in "qemu/target-info.h" is necessary
> to keep building tests such tests/tcg/plugins/mem.c, as
> per the comment added in commit ecbcc9ead2f ("tests/tcg:
> add a system test to check memory instrumentation"):
> 
> /*
>   * plugins should not include anything from QEMU aside from the
>   * API header. However as this is a test plugin to exercise the
>   * internals of QEMU and we want to avoid needless code duplication we
>   * do so here. bswap.h is pretty self-contained although it needs a
>   * few things provided by compiler.h.
>   */
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/target-info-qapi.h | 21 +++++++++++++++++++++
>   include/qemu/target-info.h      |  2 +-
>   hw/core/machine-qmp-cmds.c      |  8 +++-----
>   target-info.c                   |  8 ++++++++
>   4 files changed, 33 insertions(+), 6 deletions(-)
>   create mode 100644 include/qemu/target-info-qapi.h

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


